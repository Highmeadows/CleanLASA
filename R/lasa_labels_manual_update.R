# manual_update_lasa_labels(): a hand-authored patch layer for when
# automatic PDF parsing fails or a varinfo PDF's own documentation is
# incomplete/wrong. Bypasses PDF retrieval entirely; writes to the same
# user-local database update_lasa_labels() writes to, in a separate
# manual_overrides table composed back on top at read time (see
# .lasa_get_labels() in lasa_label_db.R) -- so a PDF refresh never
# silently clobbers a hand correction.

## Finds candidate base rows (db$variables) matching `variable` either as
## a wave-specific `variable_name` or as a `canonical_name`, optionally
## narrowed by `filecode`. Also considers rows already introduced by a
## prior manual override (for a variable the base PDF never documented at
## all), so a second manual_update_lasa_labels() call for a brand-new
## variable can still find/reuse it.
.lasa_manual_candidate_rows <- function(db, variable, filecode) {
  base <- db$variables[c("filecode", "wave", "variable_name", "canonical_name")]
  patched <- db$manual_overrides$variables[c("filecode", "wave", "variable_name")]
  if (nrow(patched) > 0L) patched$canonical_name <- patched$variable_name
  all_rows <- unique(rbind(base, patched))

  keep <- all_rows$variable_name == variable | all_rows$canonical_name == variable
  if (!is.null(filecode)) {
    keep <- keep & .lasa_normalize_filecode(all_rows$filecode) == .lasa_normalize_filecode(filecode)
  }
  all_rows[keep, , drop = FALSE]
}

## Normalizes `val_labels` (a named vector, possibly numeric- or
## backtick-named) into a data frame of value_raw/value_label/is_missing.
.lasa_manual_parse_val_labels <- function(val_labels) {
  if (is.null(names(val_labels)) || any(!nzchar(names(val_labels)))) {
    stop(
      "'val_labels' must be a named vector, e.g. c(`-5` = 'NA, wrong, skip', `1` = 'man').",
      call. = FALSE
    )
  }
  codes <- suppressWarnings(as.numeric(names(val_labels)))
  if (anyNA(codes)) {
    stop("Every name in 'val_labels' must be a valid numeric code (quote/backtick negative codes).", call. = FALSE)
  }
  data.frame(
    value_raw = as.character(codes),
    value_numeric = codes,
    value_label = unname(as.character(val_labels)),
    is_missing = codes < 0,
    stringsAsFactors = FALSE
  )
}

#' Manually correct or add LASA variable/value labels
#'
#' A hand-authored escape hatch for when automatic PDF retrieval/parsing
#' fails, or a varinfo PDF's own documentation is itself incomplete or
#' wrong. Writes directly to the user-local label database used by
#' [apply_lasa_labels()] and [read_lasa_sav()], without downloading or
#' parsing any PDF. Overrides are stored separately from PDF-derived data
#' and are composed back on top of it at lookup time, so a later
#' [update_lasa_labels()] refresh of the same file code never silently
#' discards a correction recorded here.
#'
#' @param filecode Optional LASA file code (e.g. `"046"`, `"zoa1"`,
#'   `"z004"`). Required when `variable`/`wave` match more than one file
#'   code, or when defining a brand-new variable no existing row matches.
#' @param wave Optional LASA wave code (e.g. `"B"`, `"2B"`), or `"all"` to
#'   apply the override to every wave the matched `filecode`+canonical-name
#'   combination exists for. Required when `variable` is a canonical name
#'   (which carries no wave information on its own), or when a
#'   wave-specific name's leading prefix is shared by more than one wave
#'   (e.g. `"b"` is shared by B/2B/3B/MB) and thus can't be inferred.
#' @param variable Required. Either a wave-specific variable name (e.g.
#'   `"blphya01"`) or a canonical name (e.g. `"lphya01"`).
#' @param var_label Optional replacement variable label. `NA`/omitted
#'   leaves the existing label untouched.
#' @param val_labels Optional named vector of value-label corrections,
#'   keyed by numeric code, e.g. `c(\`-5\` = "NA, wrong, skip", \`1\` =
#'   "man")` (quote or backtick negative/numeric-looking names).
#' @param replace_val_labels Logical, default `FALSE`. If `FALSE`, `val_labels`
#'   is merged into the existing value-label set (upserted by code). If
#'   `TRUE`, the result is *only* `val_labels` -- every other coded value
#'   for this variable is dropped when labels are applied.
#'
#' @return Invisibly, a list describing what was recorded: `filecode`,
#'   `wave` (the resolved wave(s)), `variable_name`, and which of
#'   `variable_label`/`value_labels` were updated.
#'
#' @seealso [update_lasa_labels()], [lasa_label_db()]
#' @export
#'
#' @examples
#' \dontrun{
#' # Merge a correction into the existing value-label set:
#' manual_update_lasa_labels(
#'   filecode = "046", wave = "B", variable = "lphya01",
#'   val_labels = c(`-5` = "NA, wrong, skip")
#' )
#'
#' # Fully replace a variable's value labels:
#' manual_update_lasa_labels(
#'   variable = "lphya01", wave = "all", filecode = "046",
#'   val_labels = c(`-5` = "NA, wrong, skip"), replace_val_labels = TRUE
#' )
#' }
manual_update_lasa_labels <- function(filecode = NULL,
                                      wave = NULL,
                                      variable,
                                      var_label = NULL,
                                      val_labels = NULL,
                                      replace_val_labels = FALSE) {
  if (missing(variable) || !is.character(variable) || length(variable) != 1L ||
      is.na(variable) || !nzchar(variable)) {
    stop("'variable' must be a single non-empty character string.", call. = FALSE)
  }
  .lasa_assert_scalar_logical(replace_val_labels, "replace_val_labels")
  if (is.null(var_label) && is.null(val_labels)) {
    stop("Supply at least one of 'var_label' or 'val_labels'; there is nothing to override.", call. = FALSE)
  }
  if (!is.null(var_label)) {
    if (!is.character(var_label) || length(var_label) != 1L) {
      stop("'var_label' must be a single character string (or NA).", call. = FALSE)
    }
  }
  if (!is.null(filecode)) {
    .lasa_var_info_validate_character(filecode, "filecode")
  }
  if (!is.null(wave) && !identical(toupper(wave), "ALL")) {
    .lasa_var_info_validate_character(wave, "wave")
  }

  db <- .lasa_load_label_db()
  candidates <- .lasa_manual_candidate_rows(db, variable, filecode)

  is_wave_all <- !is.null(wave) && identical(toupper(wave), "ALL")
  resolved_wave <- NULL

  if (is_wave_all || (!is.null(wave) && nrow(candidates) > 0L && all(candidates$canonical_name == variable))) {
    ## Canonical-name path.
    if (nrow(candidates) == 0L) {
      stop(
        "No existing variable matches canonical name '", variable, "'",
        if (!is.null(filecode)) paste0(" for filecode '", filecode, "'"), ". ",
        "Supply 'filecode' and a concrete 'wave' to define a new variable instead of 'all'.",
        call. = FALSE
      )
    }
    resolved_filecodes <- unique(candidates$filecode)
    if (is.null(filecode) && length(resolved_filecodes) > 1L) {
      stop(
        "'", variable, "' matches multiple file codes (", paste(resolved_filecodes, collapse = ", "),
        "); supply 'filecode' to disambiguate.",
        call. = FALSE
      )
    }
    filecode <- if (!is.null(filecode)) filecode else resolved_filecodes[[1L]]
    candidates <- candidates[.lasa_normalize_filecode(candidates$filecode) == .lasa_normalize_filecode(filecode), , drop = FALSE]
    resolved_wave <- unique(candidates$wave)
  } else if (!is.null(wave)) {
    resolved_wave <- toupper(wave)
  } else {
    ## No wave supplied: try to infer from a wave-specific `variable` match.
    name_matches <- candidates[candidates$variable_name == variable, , drop = FALSE]
    if (nrow(name_matches) == 0L && nrow(candidates) > 0L) {
      ## Only canonical-name matches exist; wave is mandatory for those.
      stop(
        "'", variable, "' is a canonical name, which carries no wave information on its own. ",
        "Supply 'wave' (or wave = \"all\").",
        call. = FALSE
      )
    }
    if (!is.null(filecode)) {
      name_matches <- name_matches[.lasa_normalize_filecode(name_matches$filecode) == .lasa_normalize_filecode(filecode), , drop = FALSE]
    }
    candidate_waves <- unique(name_matches$wave)
    if (length(candidate_waves) == 1L) {
      resolved_wave <- candidate_waves
      filecode <- if (!is.null(filecode)) filecode else unique(name_matches$filecode)[[1L]]
    } else if (length(candidate_waves) > 1L) {
      stop(
        "'", variable, "' matches more than one wave (", paste(candidate_waves, collapse = ", "),
        "); its wave-prefix is shared across waves (e.g. \"b\" for B/2B/3B/MB). Supply 'wave' to disambiguate.",
        call. = FALSE
      )
    } else {
      stop(
        "No existing variable matches '", variable, "'",
        if (!is.null(filecode)) paste0(" for filecode '", filecode, "'"), ". ",
        "Supply 'filecode' and 'wave' to define a new variable.",
        call. = FALSE
      )
    }
  }

  if (is.null(filecode)) {
    stop(
      "'filecode' is required: '", variable, "' does not match an existing variable, so this ",
      "defines a new record.",
      call. = FALSE
    )
  }

  waves_to_apply <- resolved_wave
  variable_name <- if (nrow(candidates) > 0L) {
    unique(candidates$variable_name[candidates$canonical_name == variable | candidates$variable_name == variable])[[1L]]
  } else {
    variable
  }

  now <- Sys.time()
  variable_rows <- data.frame(
    filecode = filecode, wave = waves_to_apply, variable_name = variable_name,
    variable_label = if (!is.null(var_label)) var_label else NA_character_,
    replace_value_labels = isTRUE(replace_val_labels),
    applied_at = now, note = NA_character_,
    stringsAsFactors = FALSE
  )

  mo <- db$manual_overrides
  key_existing <- with(mo$variables, paste(.lasa_normalize_filecode(filecode), toupper(wave), variable_name, sep = "\r"))
  key_new <- with(variable_rows, paste(.lasa_normalize_filecode(filecode), toupper(wave), variable_name, sep = "\r"))
  mo$variables <- rbind(mo$variables[!key_existing %in% key_new, , drop = FALSE], variable_rows)
  rownames(mo$variables) <- NULL

  if (!is.null(val_labels)) {
    parsed_vals <- .lasa_manual_parse_val_labels(val_labels)
    value_rows <- do.call(rbind, lapply(waves_to_apply, function(w) {
      out <- parsed_vals
      out$filecode <- filecode
      out$wave <- w
      out$variable_name <- variable_name
      out$applied_at <- now
      out$note <- NA_character_
      out[c(
        "filecode", "wave", "variable_name", "value_raw", "value_numeric",
        "value_label", "is_missing", "applied_at", "note"
      )]
    }))

    key_existing_v <- with(
      mo$value_labels,
      paste(.lasa_normalize_filecode(filecode), toupper(wave), variable_name, value_raw, sep = "\r")
    )
    key_new_v <- with(
      value_rows,
      paste(.lasa_normalize_filecode(filecode), toupper(wave), variable_name, value_raw, sep = "\r")
    )
    mo$value_labels <- rbind(mo$value_labels[!key_existing_v %in% key_new_v, , drop = FALSE], value_rows)
    rownames(mo$value_labels) <- NULL
  }

  db$manual_overrides <- mo
  .lasa_save_label_db(db)

  invisible(list(
    filecode = filecode, wave = waves_to_apply, variable_name = variable_name,
    variable_label_updated = !is.null(var_label),
    value_labels_updated = !is.null(val_labels)
  ))
}
