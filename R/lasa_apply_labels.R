# The generic, database-driven labelling engine that both read_lasa_sav()
# and the exported apply_lasa_labels() use. Loops over lasa_label_db
# metadata rows for this filecode/wave -- the shared transform/rename
# machinery in lasa_io.R (.lasa_convert_to_labelled_factor(),
# .lasa_restore_plain_numeric(), .lasa_insert_wave_column()) is reused
# as-is.
#
# apply_lasa_labels() does all of the actual work (matching, fuzzy
# matching, transforming, standardizing, add_wavecode, attribute
# attachment, and building the bidirectional label_report);
# read_lasa_sav() (R/lasa_io.R) is a thin wrapper around it.

## Builds the named numeric value-label vector (names = label text, values
## = numeric code) for one variable from its value_labels rows, dropping
## any row with no numeric code (value_numeric NA) -- never silently
## coerced into a fabricated numeric code.
.lasa_apply_value_map <- function(value_labels, variable_name) {
  rows <- value_labels[value_labels$variable_name == variable_name & !is.na(value_labels$value_numeric), , drop = FALSE]
  if (nrow(rows) == 0L) return(NULL)
  stats::setNames(rows$value_numeric, rows$value_label)
}

## Same idea as .lasa_apply_value_map(), but for the cross-wave-standardized
## `value_labels_harmonized` table, keyed by `canonical_name` (no wave).
.lasa_apply_value_map_harmonized <- function(value_labels_harmonized, canonical_name) {
  rows <- value_labels_harmonized[
    value_labels_harmonized$canonical_name == canonical_name & !is.na(value_labels_harmonized$value_numeric),
    ,
    drop = FALSE
  ]
  if (nrow(rows) == 0L) return(NULL)
  stats::setNames(rows$value_numeric, rows$value_label)
}

## "respnr" is a structural identifier, not a documented database variable
## (data-raw's per-filecode wide tables carry it as an identifier column,
## dropped before flattening into lasa_label_db()'s `variables` table --
## see data-raw/build_lasa_label_db.R). This synthetic row lets it flow
## through exactly the same matching/fuzzy/reporting chain as every
## documented variable, rather than needing its own special case.
.lasa_respnr_row <- function() {
  data.frame(
    variable_name = "respnr", canonical_name = "respnr",
    variable_label = NA_character_, harmonized_var_label = NA_character_,
    var_type = NA_character_, manual_override = FALSE,
    stringsAsFactors = FALSE
  )
}

## Maximum utils::adist() edit distance accepted as a fuzzy match, and the
## same convention already used by lasa_topics()/lasa_var_info().
.lasa_fuzzy_max_distance <- 2L

#' @keywords internal
.lasa_apply_labels <- function(data,
                               filecode,
                               wave,
                               name_corrections = NULL,
                               fuzzy_matching = TRUE,
                               standardize = TRUE,
                               .standardize_names = NULL,
                               .standardize_var_labels = NULL,
                               .standardize_val_labels = NULL,
                               add_wavecode = FALSE,
                               to_factor = TRUE,
                               to_numeric = TRUE) {
  .lasa_assert_scalar_logical(fuzzy_matching, "fuzzy_matching")
  .lasa_assert_scalar_logical(standardize, "standardize")
  if (!is.null(.standardize_names)) .lasa_assert_scalar_logical(.standardize_names, ".standardize_names")
  if (!is.null(.standardize_var_labels)) .lasa_assert_scalar_logical(.standardize_var_labels, ".standardize_var_labels")
  if (!is.null(.standardize_val_labels)) .lasa_assert_scalar_logical(.standardize_val_labels, ".standardize_val_labels")
  .lasa_assert_scalar_logical(add_wavecode, "add_wavecode")
  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_name_corrections(name_corrections)

  wave <- toupper(wave)
  eff_names <- if (is.null(.standardize_names)) standardize else .standardize_names
  eff_var_labels <- if (is.null(.standardize_var_labels)) standardize else .standardize_var_labels
  eff_val_labels <- if (is.null(.standardize_val_labels)) standardize else .standardize_val_labels
  # .standardize_names implies a "Wave" column is meaningful even if the
  # caller didn't ask for one explicitly.
  if (isTRUE(eff_names)) add_wavecode <- TRUE

  db <- .lasa_load_label_db()
  labels <- .lasa_get_labels(db, filecode, wave)
  vars <- labels$variables[c(
    "variable_name", "canonical_name", "variable_label",
    "harmonized_var_label", "var_type", "manual_override"
  )]
  vars <- rbind(vars, .lasa_respnr_row())
  vals <- labels$value_labels
  vals_harmonized <- labels$value_labels_harmonized

  correction_keys <- if (is.null(name_corrections)) character(0) else tolower(names(name_corrections))

  report_rows <- list()
  rename_plan <- character(0)
  claimed_idx <- integer(0)
  labels_applied <- character(0) # matched_name (pre-rename) -> active label
  respnr_matched_name <- NA_character_

  record <- function(variable_name, expected_name, matched_name, method, direction, edit_distance = NA_integer_) {
    report_rows[[length(report_rows) + 1L]] <<- data.frame(
      suffix = variable_name, expected_name = expected_name,
      matched_name = if (is.na(matched_name)) NA_character_ else matched_name,
      method = method, direction = direction, edit_distance = edit_distance,
      stringsAsFactors = FALSE
    )
    invisible(NULL)
  }

  ## Claims data column `idx` for `vars` row `i`, matched via `method`
  ## (optionally with `edit_distance`): applies attributes/transforms,
  ## writes the column back, and records the match. Shared by both the
  ## exact/canonical pass and the fuzzy-resolution pass below so a match
  ## is always finalized identically regardless of which method found it.
  finalize_match <- function(i, idx, method, edit_distance = NA_integer_) {
    row <- vars[i, ]
    vname <- row$variable_name
    cname <- if (is.na(row$canonical_name) || !nzchar(row$canonical_name)) vname else row$canonical_name

    claimed_idx <<- c(claimed_idx, idx)
    matched_name <- names(data)[idx]
    x <- data[[idx]]
    value_map <- .lasa_apply_value_map(vals, vname)
    harmonized_value_map <- .lasa_apply_value_map_harmonized(vals_harmonized, cname)

    wave_label <- row$variable_label
    active_label <- if (isTRUE(eff_var_labels) && !is.na(row$harmonized_var_label)) {
      row$harmonized_var_label
    } else {
      wave_label
    }
    active_value_map <- if (isTRUE(eff_val_labels) && !is.null(harmonized_value_map)) {
      harmonized_value_map
    } else {
      value_map
    }

    attach_attrs <- function(x) {
      if (!is.na(wave_label)) attr(x, "wave_label") <- wave_label
      if (!is.na(active_label)) attr(x, "label") <- active_label
      if (!is.null(value_map)) attr(x, "labels_wave") <- value_map
      if (!is.null(active_value_map)) attr(x, "labels") <- active_value_map
      attr(x, "canonical_name") <- cname
      if (!is.na(row$harmonized_var_label)) attr(x, "harmonized_label") <- row$harmonized_var_label
      if (!is.null(harmonized_value_map)) attr(x, "labels_harmonized") <- harmonized_value_map
      x
    }
    x <- attach_attrs(x)

    numeric_eligible <- identical(row$var_type, "numeric")
    text_eligible <- identical(row$var_type, "text")
    if (isTRUE(to_numeric) && numeric_eligible) {
      x <- .lasa_restore_plain_numeric(x)
      x <- attach_attrs(x)
    } else if (isTRUE(to_factor) && text_eligible && !is.null(value_map)) {
      # Wave-specific label text, never harmonized: this variable's value
      # coding is inconsistent across waves (var_type == "text", see
      # data-raw/build_lasa_label_db.R), so only its wave-specific label
      # text -- not its numeric codes -- is safe to compare/merge across
      # waves. Deliberately uses value_map, not active_value_map, so this
      # is immune to .standardize_val_labels/standardize.
      x <- .lasa_convert_to_labelled_text(x, value_map)
      x <- attach_attrs(x)
    } else if (isTRUE(to_factor) && !is.null(active_value_map)) {
      x <- .lasa_convert_to_labelled_factor(x, active_value_map)
      x <- attach_attrs(x)
    }

    data[[idx]] <<- x
    if (!is.na(active_label)) labels_applied[[matched_name]] <<- active_label
    if (identical(vname, "respnr")) respnr_matched_name <<- matched_name

    method_recorded <- if (isTRUE(row$manual_override)) paste(method, "(manual override)") else method
    record(vname, vname, matched_name, method_recorded, "matched", edit_distance)

    if (isTRUE(eff_names)) {
      rename_plan[[matched_name]] <<- tolower(cname)
    }
  }

  ## Pass 1: manual corrections, then exact/case-insensitive/canonical
  ## matching. Anything left unresolved is queued for fuzzy matching
  ## (pass 2) instead of immediately recorded as "not found", so a fuzzy
  ## candidate is never blocked by an earlier row's non-fuzzy attempt.
  pending <- integer(0)

  for (i in seq_len(nrow(vars))) {
    row <- vars[i, ]
    vname <- row$variable_name
    cname <- if (is.na(row$canonical_name) || !nzchar(row$canonical_name)) vname else row$canonical_name

    idx <- NA_integer_
    method <- NA_character_

    if (tolower(vname) %in% correction_keys) {
      key <- tolower(vname)
      actual_name <- name_corrections[[match(key, correction_keys)]]
      idx <- match(tolower(actual_name), tolower(names(data)))
      if (is.na(idx)) {
        record(vname, vname, actual_name, "manual_not_found", "documented_not_in_data")
        next
      }
      method <- "manual correction"
    } else if (tolower(cname) %in% correction_keys) {
      key <- tolower(cname)
      actual_name <- name_corrections[[match(key, correction_keys)]]
      idx <- match(tolower(actual_name), tolower(names(data)))
      if (is.na(idx)) {
        record(vname, vname, actual_name, "manual_not_found", "documented_not_in_data")
        next
      }
      method <- "manual correction"
    } else {
      idx <- match(vname, names(data))
      if (!is.na(idx)) {
        method <- "exact"
      } else {
        idx <- match(tolower(vname), tolower(names(data)))
        if (!is.na(idx)) {
          method <- "case-insensitive exact"
        } else {
          idx <- match(cname, names(data))
          if (!is.na(idx)) {
            method <- "exact canonical"
          } else {
            idx <- match(tolower(cname), tolower(names(data)))
            if (!is.na(idx)) method <- "case-insensitive canonical"
          }
        }
      }
    }

    if (is.na(idx)) {
      if (isTRUE(fuzzy_matching)) {
        pending <- c(pending, i)
      } else {
        record(vname, vname, NA_character_, "not found", "documented_not_in_data")
      }
      next
    }

    finalize_match(i, idx, method)
  }

  ## Pass 2: fuzzy-match the pending rows against columns still unclaimed
  ## after pass 1, resolving the globally closest (row, column) pair
  ## first each round -- not simply in `vars` row order -- so a mediocre
  ## match never claims a column out from under a later row that fits it
  ## better (e.g. many "lphyaNN"-style names are all within edit distance
  ## 2 of each other; the closest one should win regardless of position).
  if (isTRUE(fuzzy_matching) && length(pending) > 0L) {
    pool <- setdiff(seq_along(names(data)), claimed_idx)

    if (length(pool) > 0L) {
      pool_names <- tolower(names(data)[pool])
      pend_vnames <- tolower(vars$variable_name[pending])
      pend_cnames <- ifelse(
        is.na(vars$canonical_name[pending]) | !nzchar(vars$canonical_name[pending]),
        pend_vnames,
        tolower(vars$canonical_name[pending])
      )
      max_len <- pmax(nchar(pend_vnames), nchar(pend_cnames))

      dist_matrix <- matrix(NA_real_, nrow = length(pending), ncol = length(pool))
      for (r in seq_along(pending)) {
        d_vname <- utils::adist(pend_vnames[[r]], pool_names)[1L, ]
        d_cname <- utils::adist(pend_cnames[[r]], pool_names)[1L, ]
        d <- pmin(d_vname, d_cname)
        d[!(d <= .lasa_fuzzy_max_distance & d < max_len[[r]])] <- NA_real_
        dist_matrix[r, ] <- d
      }

      rows_left <- seq_along(pending) # positions into `pending`/`dist_matrix` rows
      cols_left <- seq_along(pool) # positions into `pool`/`dist_matrix` cols
      fuzzy_resolved <- integer(0) # `vars` row indices (matched or ambiguous) resolved below

      while (length(rows_left) > 0L && length(cols_left) > 0L) {
        sub <- dist_matrix[rows_left, cols_left, drop = FALSE]
        if (all(is.na(sub))) break

        best <- min(sub, na.rm = TRUE)
        hits <- which(sub == best, arr.ind = TRUE)
        hit_rows <- unique(hits[, 1L])
        hit_cols <- unique(hits[, 2L])

        if (nrow(hits) == 1L) {
          i <- pending[[rows_left[[hits[1L, 1L]]]]]
          idx <- pool[[cols_left[[hits[1L, 2L]]]]]
          finalize_match(i, idx, "fuzzy", best)
          fuzzy_resolved <- c(fuzzy_resolved, i)
          rows_left <- setdiff(rows_left, rows_left[[hits[1L, 1L]]])
          cols_left <- setdiff(cols_left, cols_left[[hits[1L, 2L]]])
        } else {
          # A tie at the current best distance: every row involved is
          # ambiguous this round. Report and drop them from further
          # consideration; leave every column in play (unclaimed) for a
          # later, worse-but-eligible round involving other rows.
          for (r in hit_rows) {
            i <- pending[[rows_left[[r]]]]
            vname <- vars$variable_name[[i]]
            record(vname, vname, NA_character_, "ambiguous fuzzy", "documented_not_in_data", best)
            fuzzy_resolved <- c(fuzzy_resolved, i)
          }
          rows_left <- setdiff(rows_left, rows_left[hit_rows])
        }
      }

      # Anything still pending after fuzzy resolution (no eligible
      # candidate, or the pool was exhausted before its turn) is
      # genuinely unmatched.
      for (i in setdiff(pending, fuzzy_resolved)) {
        vname <- vars$variable_name[[i]]
        record(vname, vname, NA_character_, "not found", "documented_not_in_data")
      }
    } else {
      # No unclaimed columns at all: every pending row is unmatched.
      for (i in pending) {
        vname <- vars$variable_name[[i]]
        record(vname, vname, NA_character_, "not found", "documented_not_in_data")
      }
    }
  }

  # Data columns no documented variable ever claimed: the reverse
  # direction of the audit. Never renamed or transformed -- report only.
  unclaimed_names <- setdiff(names(data), names(data)[claimed_idx])
  for (col_name in unclaimed_names) {
    record(NA_character_, NA_character_, col_name, "undocumented column", "data_not_documented")
  }

  label_report <- if (length(report_rows) > 0L) {
    do.call(rbind, report_rows)
  } else {
    data.frame(
      suffix = character(0), expected_name = character(0),
      matched_name = character(0), method = character(0),
      direction = character(0), edit_distance = integer(0),
      stringsAsFactors = FALSE
    )
  }

  if (isTRUE(eff_names) && length(rename_plan) > 0L) {
    old_names <- names(rename_plan)
    new_names <- unname(rename_plan)
    unchanged_names <- names(data)[!names(data) %in% old_names]
    conflicting_names <- intersect(new_names, unchanged_names)
    duplicate_targets <- unique(new_names[duplicated(new_names)])
    conflicts <- unique(c(conflicting_names, duplicate_targets))
    if (length(conflicts) > 0L) {
      stop(
        "standardize/.standardize_names = TRUE would create duplicate column names: ",
        paste(conflicts, collapse = ", "),
        ". Resolve the conflict with 'name_corrections' or by renaming the source column(s) ",
        "before calling apply_lasa_labels().",
        call. = FALSE
      )
    }
    idx <- match(old_names, names(data))
    names(data)[idx] <- new_names
    label_report$standardized_to <- new_names[match(label_report$matched_name, old_names)]
    if (!is.na(respnr_matched_name)) respnr_matched_name <- rename_plan[[respnr_matched_name]]
  } else {
    label_report$standardized_to <- NA_character_
  }

  if (isTRUE(add_wavecode)) {
    data <- .lasa_insert_wave_column(data, wave = wave, respnr_name = respnr_matched_name)
    attr(data[["Wave"]], "label") <- "LASA measurement wave"
  }

  # "variable.labels" (matching the established foreign/haven-adjacent
  # convention for a data-frame-level vector of column labels): the active
  # label attached to each matched column, aligned with names(data).
  variable_labels_attr <- stats::setNames(rep(NA_character_, ncol(data)), names(data))
  for (orig_name in names(labels_applied)) {
    final_name <- if (orig_name %in% names(rename_plan)) rename_plan[[orig_name]] else orig_name
    if (final_name %in% names(variable_labels_attr)) {
      variable_labels_attr[[final_name]] <- labels_applied[[orig_name]]
    }
  }
  if ("Wave" %in% names(variable_labels_attr)) variable_labels_attr[["Wave"]] <- "LASA measurement wave"

  rownames(label_report) <- NULL
  attr(data, "label_report") <- label_report
  attr(data, "variable.labels") <- variable_labels_attr
  attr(data, "LASA_wave") <- wave
  attr(data, "LASA_file_code") <- .lasa_normalize_filecode(filecode)
  data
}

#' Apply LASA variable/value labels from the label database
#'
#' The engine behind [read_lasa_sav()]: attaches SPSS-style variable and
#' value labels to a data frame using the package's normalized
#' [lasa_label_db()]. Works on any data frame, not only one produced by
#' [read_lasa_sav()]: pass `filecode`/`wave` explicitly, or let them be
#' recovered automatically from `data`'s own `"LASA_file_code"`/
#' `"LASA_wave"` provenance attributes (set by [read_lasa_sav()] and by
#' this function itself, so labelling can be safely re-applied after a
#' transformation like `dplyr::mutate()` strips attributes) or from a
#' single-valued `"Wave"` column.
#'
#' @param data A data frame or tibble to label.
#' @param filecode Optional LASA file code (e.g. `"046"`, `"z004"`). If
#'   omitted, recovered from `data`'s provenance (see Details).
#' @param wave Optional LASA wave code (e.g. `"B"`, `"2B"`). If omitted,
#'   recovered from `data`'s provenance (see Details).
#' @param name_corrections Optional named character vector overriding
#'   automatic column matching for specific variables, in the format
#'   `canonical_name = "faulty_or_nonstandard_name"`, e.g.
#'   `c(lphya08 = "BLPYA08")`.
#' @param fuzzy_matching Logical, default `TRUE`. When a variable isn't
#'   found by exact or canonical-name matching, try an edit-distance match
#'   (via [utils::adist()]) against the data columns not already claimed
#'   by another variable, absorbing most typos. A unique best match within
#'   the distance threshold is used (recorded as `"fuzzy"` in the
#'   [lasa_label_report()] audit); a tie is left unmatched (`"ambiguous
#'   fuzzy"`) rather than guessed.
#' @param standardize Logical, default `TRUE`. Overarching switch for
#'   `.standardize_names`, `.standardize_var_labels`, and
#'   `.standardize_val_labels`: each defaults to following `standardize`,
#'   but can be set independently.
#' @param .standardize_names Logical or `NULL` (default). If `TRUE`,
#'   matched columns are renamed to their canonical (wave-stripped)
#'   lowercase name; if `NULL`, follows `standardize`. Implies
#'   `add_wavecode = TRUE`.
#' @param .standardize_var_labels Logical or `NULL` (default). If `TRUE`,
#'   the harmonized (cross-wave-consistent) variable label is attached as
#'   the active `"label"` instead of the wave-specific one; if `NULL`,
#'   follows `standardize`. The wave-specific label is always available
#'   separately as `"wave_label"`.
#' @param .standardize_val_labels Logical or `NULL` (default). If `TRUE`,
#'   the harmonized value-label set is used as the active `"labels"` (and
#'   for `to_factor` level text) instead of the wave-specific one, where
#'   one is documented; if `NULL`, follows `standardize`. The wave-specific
#'   value labels are always available separately as `"labels_wave"`.
#' @param add_wavecode Logical, default `FALSE`. If `TRUE`, inserts a
#'   `"Wave"` column (filled with the already-resolved `wave`) right after
#'   `"respnr"`. Forced to `TRUE` whenever `.standardize_names` is
#'   effectively `TRUE`.
#' @param to_factor Logical, default `TRUE`. Convert categorical
#'   (value-labelled) variables to factors using the active value labels
#'   as levels, instead of leaving them numeric/character. A variable whose
#'   value coding is inconsistent across waves (database `var_type ==
#'   "text"`) is instead recoded to its wave-specific label text
#'   (character), never a factor -- see Details.
#' @param to_numeric Logical, default `TRUE`. Restore count/continuous
#'   variables (per the database's `var_type`) to plain numeric, converting
#'   negative codes to `NA`.
#'
#' @details
#' Identity (file code and wave) is resolved in priority order: (1) the
#' `filecode`/`wave` arguments, if supplied; (2) `data`'s own
#' `"LASA_file_code"`/`"LASA_wave"` attributes; (3) a single-valued
#' `"Wave"` column in `data` (for the wave only -- `filecode` must still
#' come from elsewhere); (4) a best-effort guess from `data`'s own object
#' name, when it happens to follow the LASA file-naming convention (e.g. a
#' data frame literally named `LASAB046`) -- never required, and not
#' something to rely on.
#'
#' Column matching tries, in order: (1) an explicit `name_corrections`
#' override, (2) an exact (case-sensitive) match against the wave-specific
#' documented name, (3) a case-insensitive match against that name, (4) an
#' exact match against the canonical (wave-stripped) name, (5) a
#' case-insensitive match against the canonical name, (6) when
#' `fuzzy_matching = TRUE`, an edit-distance match against the data
#' columns not already claimed. `"respnr"` is matched through this same
#' chain (it isn't a documented database variable, so it's always matched
#' by name rather than canonical/value-label lookups).
#'
#' Unmatched variables in either direction (documented but absent from
#' `data`, or present in `data` but undocumented) are never an error --
#' they're left alone and recorded in the `"label_report"` attribute; see
#' [lasa_label_report()].
#'
#' A variable's value coding sometimes genuinely differs by wave (e.g. a
#' binary code's polarity flipped, or an income variable's brackets were
#' redefined) so no single cross-wave value label could be written; the
#' database marks such a variable `var_type == "text"` and documents no
#' harmonized value labels for it at all. `to_factor` then recodes it to
#' its wave-specific label text (character) instead of a factor, so waves
#' whose numeric codes disagree but whose label text agrees (e.g.
#' `0 = "no", 1 = "yes"` vs. `1 = "no", 2 = "yes"`) still merge correctly.
#'
#' @return `data`, labelled (and optionally reshaped/renamed) with
#'   `"label_report"`, `"variable.labels"`, `"LASA_wave"`, and
#'   `"LASA_file_code"` attributes (re-)attached. Each matched column also
#'   carries `"label"`/`"labels"` (the *active* variable label / value
#'   labels -- wave-specific unless the corresponding standardize switch
#'   is on), `"wave_label"`/`"labels_wave"` (always the wave-specific
#'   versions), `"canonical_name"` (the wave-stripped variable name), and,
#'   where the database documents them, `"harmonized_label"`/
#'   `"labels_harmonized"` (the cross-wave-consistent versions -- never
#'   present for a `var_type == "text"` variable).
#'
#' @seealso [read_lasa_sav()], [lasa_label_report()], [lasa_label_db()],
#'   [manual_update_lasa_labels()]
#' @export
#'
#' @examples
#' \dontrun{
#' dat <- read_lasa_sav("LASAB046.SAV")
#' dat <- dplyr::mutate(dat, respnr = respnr) # attributes stripped
#' dat <- apply_lasa_labels(dat) # re-applies via stored provenance
#' }
apply_lasa_labels <- function(data,
                              filecode = NULL,
                              wave = NULL,
                              name_corrections = NULL,
                              fuzzy_matching = TRUE,
                              standardize = TRUE,
                              .standardize_names = NULL,
                              .standardize_var_labels = NULL,
                              .standardize_val_labels = NULL,
                              add_wavecode = FALSE,
                              to_factor = TRUE,
                              to_numeric = TRUE) {
  object_name <- tryCatch(deparse(substitute(data)), error = function(e) NULL)

  if (is.null(filecode)) filecode <- attr(data, "LASA_file_code", exact = TRUE)
  if (is.null(wave)) wave <- attr(data, "LASA_wave", exact = TRUE)

  if (is.null(wave) && "Wave" %in% names(data)) {
    unique_waves <- unique(stats::na.omit(data[["Wave"]]))
    if (length(unique_waves) == 1L) wave <- unique_waves
  }

  if ((is.null(filecode) || is.null(wave)) && !is.null(object_name) && length(object_name) == 1L) {
    inferred <- tryCatch(.lasa_parse_filename(object_name), error = function(e) NULL)
    if (!is.null(inferred)) {
      if (is.null(filecode)) filecode <- inferred$file_code
      if (is.null(wave)) wave <- inferred$wave
    }
  }

  if (is.null(filecode) || is.null(wave)) {
    stop(
      "Could not determine the LASA file code and wave for 'data'. Supply 'filecode' and ",
      "'wave' explicitly, or call apply_lasa_labels() on an object carrying 'LASA_file_code'/",
      "'LASA_wave' attributes (e.g. the result of read_lasa_sav()).",
      call. = FALSE
    )
  }

  .lasa_apply_labels(
    data, filecode = filecode, wave = wave, name_corrections = name_corrections,
    fuzzy_matching = fuzzy_matching, standardize = standardize,
    .standardize_names = .standardize_names,
    .standardize_var_labels = .standardize_var_labels,
    .standardize_val_labels = .standardize_val_labels,
    add_wavecode = add_wavecode, to_factor = to_factor, to_numeric = to_numeric
  )
}
