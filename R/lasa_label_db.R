# The normalized LASA label database: schema, load/save with user-local
# precedence over the bundled snapshot, integrity validation, and the
# manual-override composition rule used by `.lasa_apply_labels()`.
#
# The database is built entirely from hardcoded R (data-raw/labels/*.R,
# assembled by data-raw/build_lasa_label_db.R) transcribed from LASA's own
# variable-information documentation -- there is no PDF-parsing step and no
# "documents" provenance table; label updates ship with new package
# releases instead of being fetched at runtime.
#
# Schema (see the package README and `?lasa_label_db` for the full
# picture):
#   variables                 one row per (filecode, wave, variable_name):
#                              canonical_name, variable_label (wave-specific
#                              text), harmonized_var_label (cross-wave-
#                              consistent text), var_type
#   value_labels               one row per (filecode, wave, variable_name,
#                              value_numeric): value_label, is_missing --
#                              the value labels as documented for that wave
#   value_labels_harmonized    one row per (filecode, canonical_name,
#                              value_numeric): value_label, is_missing --
#                              the cross-wave-standardized value labels for
#                              that variable, independent of wave
#   manual_overrides$variables     hand-authored patch rows, written only
#                              by manual_update_lasa_labels()
#   manual_overrides$value_labels  ditto, for individual value-label rows

#' An empty, correctly-shaped `lasa_label_db` object
#' @keywords internal
.lasa_empty_label_db <- function() {
  list(
    variables = data.frame(
      filecode = character(0), wave = character(0), variable_name = character(0),
      canonical_name = character(0), variable_label = character(0),
      harmonized_var_label = character(0), var_type = character(0),
      stringsAsFactors = FALSE
    ),
    value_labels = data.frame(
      filecode = character(0), wave = character(0), variable_name = character(0),
      value_numeric = numeric(0), value_label = character(0), is_missing = logical(0),
      stringsAsFactors = FALSE
    ),
    value_labels_harmonized = data.frame(
      filecode = character(0), canonical_name = character(0),
      value_numeric = numeric(0), value_label = character(0), is_missing = logical(0),
      stringsAsFactors = FALSE
    ),
    manual_overrides = list(
      variables = data.frame(
        filecode = character(0), wave = character(0), variable_name = character(0),
        variable_label = character(0), replace_value_labels = logical(0),
        applied_at = as.POSIXct(character(0)), note = character(0),
        stringsAsFactors = FALSE
      ),
      value_labels = data.frame(
        filecode = character(0), wave = character(0), variable_name = character(0),
        value_numeric = numeric(0), value_label = character(0),
        is_missing = logical(0), applied_at = as.POSIXct(character(0)), note = character(0),
        stringsAsFactors = FALSE
      )
    )
  )
}

## CRAN-recommended, cross-platform per-package user data directory. This
## is where manual_update_lasa_labels() persists a modified snapshot of the
## database, taking precedence over the bundled one on every subsequent
## load -- so a hand correction survives across sessions without needing to
## reinstall the package.
.lasa_label_db_path <- function() {
  file.path(tools::R_user_dir("CleanLASA", which = "data"), "lasa_label_db.rds")
}

## Loads the currently active database: the user-local snapshot if one
## exists (it started as a full copy of the bundled data, so it is always
## at least as complete), else the package's own bundled `lasa_label_db`
## dataset, else (only if neither is available, e.g. a dev checkout before
## data/lasa_label_db.rda has been built) an empty skeleton.
.lasa_load_label_db <- function() {
  user_path <- .lasa_label_db_path()
  if (file.exists(user_path)) {
    db <- tryCatch(readRDS(user_path), error = function(e) NULL)
    if (!is.null(db) && .lasa_is_label_db_shaped(db)) return(db)
  }

  ## `lasa_label_db_bundled` (data/lasa_label_db_bundled.rda, LazyData)
  ## resolves via ordinary lexical scoping -- it is registered in this
  ## function's own enclosing (package/namespace) environment, the same
  ## way any other package-internal object is, so a bare reference finds
  ## it under both devtools::load_all() and a regular install.
  bundled <- tryCatch(get("lasa_label_db_bundled"), error = function(e) NULL)
  if (!is.null(bundled) && .lasa_is_label_db_shaped(bundled)) return(bundled)

  .lasa_empty_label_db()
}

.lasa_is_label_db_shaped <- function(db) {
  is.list(db) && all(
    c("variables", "value_labels", "value_labels_harmonized", "manual_overrides") %in% names(db)
  )
}

## Atomically persists `db` as the user-local snapshot (temp file + rename,
## so a failed/interrupted write can never leave a half-written file where
## the next load would find it).
.lasa_save_label_db <- function(db) {
  target <- .lasa_label_db_path()
  dir.create(dirname(target), recursive = TRUE, showWarnings = FALSE)
  tmp <- tempfile(tmpdir = dirname(target), fileext = ".rds")
  saveRDS(db, tmp, compress = TRUE)
  file.rename(tmp, target)
  invisible(db)
}

## Validates a database's structural integrity: uniqueness constraints and
## cross-table references. Returns a character vector of problem
## descriptions (empty = valid).
.lasa_validate_label_db <- function(db) {
  problems <- character(0)

  key_var <- with(db$variables, paste(filecode, wave, variable_name, sep = "\r"))
  if (anyDuplicated(key_var) > 0L) {
    problems <- c(problems, sprintf(
      "%d duplicate (filecode, wave, variable_name) key(s) in 'variables'.",
      sum(duplicated(key_var))
    ))
  }

  key_val_variable <- with(db$value_labels, paste(filecode, wave, variable_name, sep = "\r"))
  key_val_full <- with(db$value_labels, paste(filecode, wave, variable_name, value_numeric, sep = "\r"))
  if (anyDuplicated(key_val_full) > 0L) {
    problems <- c(problems, sprintf(
      "%d duplicate (filecode, wave, variable_name, value_numeric) key(s) in 'value_labels'.",
      sum(duplicated(key_val_full))
    ))
  }

  orphan_values <- !key_val_variable %in% key_var & nrow(db$value_labels) > 0L
  if (any(orphan_values)) {
    problems <- c(problems, sprintf(
      "%d row(s) in 'value_labels' reference a (filecode, wave, variable_name) not present in 'variables'.",
      sum(orphan_values)
    ))
  }

  key_harmonized <- with(
    db$value_labels_harmonized, paste(filecode, canonical_name, value_numeric, sep = "\r")
  )
  if (anyDuplicated(key_harmonized) > 0L) {
    problems <- c(problems, sprintf(
      "%d duplicate (filecode, canonical_name, value_numeric) key(s) in 'value_labels_harmonized'.",
      sum(duplicated(key_harmonized))
    ))
  }

  known_canonical <- with(db$variables, paste(filecode, canonical_name, sep = "\r"))
  key_harmonized_var <- with(
    db$value_labels_harmonized, paste(filecode, canonical_name, sep = "\r")
  )
  orphan_harmonized <- !key_harmonized_var %in% known_canonical & nrow(db$value_labels_harmonized) > 0L
  if (any(orphan_harmonized)) {
    problems <- c(problems, sprintf(
      "%d row(s) in 'value_labels_harmonized' reference a (filecode, canonical_name) not present in 'variables'.",
      sum(orphan_harmonized)
    ))
  }

  problems
}

## Composes the base (hardcoded) rows for one (filecode, wave) key with any
## manual_overrides on top -- see the "manual_update_lasa_labels()" section
## of the package design notes for the full worked example this implements.
## Never mutates the base tables; the result is what .lasa_apply_labels()
## consumes.
##
## @return A list with `variables`, `value_labels` (both scoped to
##   `filecode`/`wave`), and `value_labels_harmonized` (scoped to
##   `filecode` only -- it applies across waves) data frames.
##   `variable_label` is overridden where a manual override applies, and
##   value labels merged or fully replaced per variable according to each
##   override's `replace_value_labels` flag. Also attaches a logical
##   `manual_override` column to `variables`/`value_labels`, so callers
##   (the label_report's `method` column) can record when a match came
##   from a manual patch.
.lasa_get_labels <- function(db, filecode, wave) {
  normalized_filecode <- .lasa_normalize_filecode(filecode)
  wave <- toupper(wave)

  vars <- db$variables[
    .lasa_normalize_filecode(db$variables$filecode) == normalized_filecode &
      toupper(db$variables$wave) == wave,
    ,
    drop = FALSE
  ]
  vals <- db$value_labels[
    .lasa_normalize_filecode(db$value_labels$filecode) == normalized_filecode &
      toupper(db$value_labels$wave) == wave,
    ,
    drop = FALSE
  ]
  harmonized <- db$value_labels_harmonized[
    .lasa_normalize_filecode(db$value_labels_harmonized$filecode) == normalized_filecode,
    ,
    drop = FALSE
  ]
  vars$manual_override <- rep(FALSE, nrow(vars))
  vals$manual_override <- rep(FALSE, nrow(vals))

  mo_vars <- db$manual_overrides$variables
  mo_vals <- db$manual_overrides$value_labels
  mo_var_rows <- mo_vars[
    .lasa_normalize_filecode(mo_vars$filecode) == normalized_filecode &
      toupper(mo_vars$wave) == wave,
    ,
    drop = FALSE
  ]

  if (nrow(mo_var_rows) == 0L) {
    return(list(variables = vars, value_labels = vals, value_labels_harmonized = harmonized))
  }

  ## variable_label overrides: upsert by variable_name (last-applied wins
  ## on repeated calls -- manual_update_lasa_labels() itself only ever
  ## keeps the latest row per key, but guard defensively here too).
  mo_var_rows <- mo_var_rows[order(mo_var_rows$applied_at), , drop = FALSE]
  for (i in seq_len(nrow(mo_var_rows))) {
    row <- mo_var_rows[i, ]
    idx <- match(row$variable_name, vars$variable_name)
    if (is.na(idx)) {
      new_row <- vars[0, ][1, ]
      new_row$filecode <- filecode
      new_row$wave <- wave
      new_row$variable_name <- row$variable_name
      new_row$canonical_name <- row$variable_name
      vars <- rbind(vars, new_row)
      idx <- nrow(vars)
    }
    if (!is.na(row$variable_label)) {
      vars$variable_label[idx] <- row$variable_label
      vars$manual_override[idx] <- TRUE
    }
  }

  ## value_labels: merge (upsert by value_numeric) or fully replace, per
  ## variable, according to that variable's `replace_value_labels` flag.
  for (i in seq_len(nrow(mo_var_rows))) {
    row <- mo_var_rows[i, ]
    patch_rows <- mo_vals[
      .lasa_normalize_filecode(mo_vals$filecode) == normalized_filecode &
        toupper(mo_vals$wave) == wave &
        mo_vals$variable_name == row$variable_name,
      ,
      drop = FALSE
    ]
    if (nrow(patch_rows) == 0L) next
    patch_rows <- patch_rows[order(patch_rows$applied_at), , drop = FALSE]
    patch_rows <- patch_rows[!duplicated(patch_rows$value_numeric, fromLast = TRUE), , drop = FALSE]
    patch_rows$manual_override <- TRUE
    patch_rows$applied_at <- NULL
    patch_rows$note <- NULL

    other_rows <- vals[vals$variable_name != row$variable_name, , drop = FALSE]
    this_var_rows <- vals[vals$variable_name == row$variable_name, , drop = FALSE]

    if (isTRUE(row$replace_value_labels)) {
      this_var_rows <- patch_rows
    } else {
      keep <- !this_var_rows$value_numeric %in% patch_rows$value_numeric
      this_var_rows <- rbind(this_var_rows[keep, , drop = FALSE], patch_rows)
    }
    vals <- rbind(other_rows, this_var_rows)
  }

  list(variables = vars, value_labels = vals, value_labels_harmonized = harmonized)
}

#' Inspect the active LASA label database
#'
#' Returns the label metadata database currently in effect: the bundled
#' snapshot shipped with the package, layered with any local updates from
#' [manual_update_lasa_labels()]. Useful for checking which file codes/waves
#' are covered before calling [apply_lasa_labels()], or for auditing a
#' manual correction.
#'
#' @return A list with `variables`, `value_labels`, `value_labels_harmonized`,
#'   and `manual_overrides` (itself a list of `variables`/`value_labels`) --
#'   see the package README for the full schema.
#'
#' @seealso [apply_lasa_labels()], [manual_update_lasa_labels()]
#' @export
#'
#' @examples
#' db <- lasa_label_db()
#' nrow(db$variables)
#' subset(db$variables, filecode == "046" & wave == "B")
lasa_label_db <- function() {
  .lasa_load_label_db()
}
