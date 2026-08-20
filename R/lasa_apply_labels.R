# The generic, database-driven labelling engine that both read_lasa_sav()
# and the exported apply_lasa_labels() use. Replaces the "loop over
# hand-written label_variable() calls" part of the old, file-specific
# apply_LASA*_labels() functions with "loop over lasa_label_db metadata
# rows for this filecode/wave" -- the shared transform/rename/report
# machinery in lasa_io.R (.lasa_convert_to_labelled_factor(),
# .lasa_restore_plain_numeric(), .lasa_standardize_respnr(),
# .lasa_insert_wave_column()) is reused as-is.

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

#' @keywords internal
.lasa_apply_labels <- function(data,
                               filecode,
                               wave,
                               name_corrections = NULL,
                               to_factor = FALSE,
                               to_numeric = FALSE,
                               standardize_names = FALSE,
                               split_wavecode = FALSE) {
  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  wave <- toupper(wave)
  effective_split_wavecode <- isTRUE(standardize_names) || isTRUE(split_wavecode)

  db <- .lasa_load_label_db()
  labels <- .lasa_get_labels(db, filecode, wave)
  vars <- labels$variables
  vals <- labels$value_labels
  vals_harmonized <- labels$value_labels_harmonized

  correction_keys <- if (is.null(name_corrections)) character(0) else tolower(names(name_corrections))

  report_rows <- list()
  rename_plan <- character(0)

  record <- function(variable_name, expected_name, matched_name, method) {
    report_rows[[length(report_rows) + 1L]] <<- data.frame(
      suffix = variable_name, expected_name = expected_name,
      matched_name = if (is.na(matched_name)) NA_character_ else matched_name,
      method = method, stringsAsFactors = FALSE
    )
    invisible(NULL)
  }

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
        record(vname, vname, actual_name, "manual_not_found")
        next
      }
      method <- "manual correction"
    } else if (tolower(cname) %in% correction_keys) {
      key <- tolower(cname)
      actual_name <- name_corrections[[match(key, correction_keys)]]
      idx <- match(tolower(actual_name), tolower(names(data)))
      if (is.na(idx)) {
        record(vname, vname, actual_name, "manual_not_found")
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
            if (!is.na(idx)) {
              method <- "case-insensitive canonical"
            }
          }
        }
      }
    }

    if (is.na(idx)) {
      record(vname, vname, NA_character_, "not found")
      next
    }

    matched_name <- names(data)[idx]
    x <- data[[idx]]
    original_values <- suppressWarnings(as.numeric(x))
    value_map <- .lasa_apply_value_map(vals, vname)
    harmonized_value_map <- .lasa_apply_value_map_harmonized(vals_harmonized, cname)

    attr(x, "label") <- row$variable_label
    attr(x, "canonical_name") <- cname
    attr(x, "harmonized_label") <- row$harmonized_var_label
    if (!is.null(value_map)) attr(x, "labels") <- value_map
    if (!is.null(harmonized_value_map)) attr(x, "labels_harmonized") <- harmonized_value_map

    numeric_eligible <- identical(row$var_type, "numeric")
    if (isTRUE(to_numeric) && numeric_eligible) {
      x <- .lasa_restore_plain_numeric(x)
      attr(x, "label") <- row$variable_label
    } else if (isTRUE(to_factor) && !is.null(value_map)) {
      x <- .lasa_convert_to_labelled_factor(x, value_map)
      attr(x, "label") <- row$variable_label
    }
    attr(x, "canonical_name") <- cname
    attr(x, "harmonized_label") <- row$harmonized_var_label
    if (!is.null(harmonized_value_map)) attr(x, "labels_harmonized") <- harmonized_value_map

    if (!is.null(value_map)) attr(x, "original_labels") <- value_map
    attr(x, "original_values") <- original_values
    data[[idx]] <- x

    method_recorded <- if (isTRUE(row$manual_override)) paste(method, "(manual override)") else method
    record(vname, vname, matched_name, method_recorded)

    if (isTRUE(effective_split_wavecode)) {
      rename_plan[[matched_name]] <- tolower(cname)
    }
  }

  respnr_result <- .lasa_standardize_respnr(data, standardize_names = standardize_names)
  data <- respnr_result$data
  record("respnr", "respnr", respnr_result$matched_name, respnr_result$method)

  label_report <- if (length(report_rows) > 0L) {
    do.call(rbind, report_rows)
  } else {
    data.frame(
      suffix = character(0), expected_name = character(0),
      matched_name = character(0), method = character(0), stringsAsFactors = FALSE
    )
  }

  if (isTRUE(effective_split_wavecode) && length(rename_plan) > 0L) {
    old_names <- names(rename_plan)
    new_names <- unname(rename_plan)
    unchanged_names <- names(data)[!names(data) %in% old_names]
    conflicting_names <- intersect(new_names, unchanged_names)
    duplicate_targets <- unique(new_names[duplicated(new_names)])
    conflicts <- unique(c(conflicting_names, duplicate_targets))
    if (length(conflicts) > 0L) {
      stop(
        "standardize_names/split_wavecode = TRUE would create duplicate column names: ",
        paste(conflicts, collapse = ", "),
        ". Resolve the conflict with 'name_corrections' or by renaming the source column(s) ",
        "before calling apply_lasa_labels().",
        call. = FALSE
      )
    }
    idx <- match(old_names, names(data))
    names(data)[idx] <- new_names
    label_report$standardized_to <- new_names[match(label_report$matched_name, old_names)]
  } else {
    label_report$standardized_to <- NA_character_
  }

  if (isTRUE(standardize_names) && !is.na(respnr_result$matched_name)) {
    label_report$standardized_to[label_report$suffix == "respnr"] <- respnr_result$respnr_name
  }

  if (isTRUE(effective_split_wavecode)) {
    data <- .lasa_insert_wave_column(data, wave = wave, respnr_name = respnr_result$respnr_name)
  }

  rownames(label_report) <- NULL
  attr(data, "label_report") <- label_report
  attr(data, "LASA_wave") <- wave
  attr(data, "LASA_file_code") <- .lasa_normalize_filecode(filecode)
  data
}

#' Apply LASA variable/value labels from the label database
#'
#' Attaches SPSS-style variable and value labels to a data frame using the
#' package's normalized [lasa_label_db()], instead of a file-specific
#' `apply_lasa*_labels()` function. Works on any data frame, not only one
#' produced by [read_lasa_sav()]: pass `filecode`/`wave` explicitly, or let
#' them be recovered automatically from `data`'s own `"LASA_file_code"`/
#' `"LASA_wave"` provenance attributes (set by [read_lasa_sav()] and by
#' this function itself, so labelling can be safely re-applied after a
#' transformation like `dplyr::mutate()` strips attributes) or from a
#' single-valued `"LASA_wave"` column.
#'
#' @param data A data frame or tibble to label.
#' @param filecode Optional LASA file code (e.g. `"046"`, `"z004"`). If
#'   omitted, recovered from `data`'s provenance (see Details).
#' @param wave Optional LASA wave code (e.g. `"B"`, `"2B"`). If omitted,
#'   recovered from `data`'s provenance (see Details).
#' @param name_corrections,to_factor,to_numeric,standardize_names,split_wavecode
#'   The same five shared reshaping arguments used throughout this package
#'   (see [read_lasa_sav()]).
#'
#' @details
#' Identity (file code and wave) is resolved in priority order: (1) the
#' `filecode`/`wave` arguments, if supplied; (2) `data`'s own
#' `"LASA_file_code"`/`"LASA_wave"` attributes; (3) a single-valued
#' `"LASA_wave"` column in `data` (for the wave only -- `filecode` must
#' still come from elsewhere); (4) a best-effort guess from `data`'s own
#' object name, when it happens to follow the LASA file-naming convention
#' (e.g. a data frame literally named `LASAB046`) -- never required, and
#' not something to rely on.
#'
#' Column matching tries, in order: (1) an explicit `name_corrections`
#' override, (2) an exact (case-sensitive) match against the wave-specific
#' documented name, (3) a case-insensitive match against that name, (4) an
#' exact match against the canonical (wave-stripped) name, (5) a
#' case-insensitive match against the canonical name.
#'
#' @return `data`, labelled (and optionally reshaped/renamed) exactly as
#'   [read_lasa_sav()] would, with `"label_report"`, `"LASA_wave"`, and
#'   `"LASA_file_code"` attributes (re-)attached. Each labelled column also
#'   carries `"label"` (the wave-specific variable label), `"labels"` (its
#'   value labels, SPSS/haven-style), `"canonical_name"` (the wave-stripped
#'   variable name), `"harmonized_label"` (the cross-wave-consistent
#'   variable label), and, where the database documents one,
#'   `"labels_harmonized"` (the cross-wave-standardized value labels) --
#'   groundwork for a future `standardize_names`/`standardize_labels` pair
#'   of arguments, not yet implemented.
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
                              to_factor = FALSE,
                              to_numeric = FALSE,
                              standardize_names = FALSE,
                              split_wavecode = FALSE) {
  object_name <- tryCatch(deparse(substitute(data)), error = function(e) NULL)

  if (is.null(filecode)) filecode <- attr(data, "LASA_file_code", exact = TRUE)
  if (is.null(wave)) wave <- attr(data, "LASA_wave", exact = TRUE)

  if (is.null(wave) && "LASA_wave" %in% names(data)) {
    unique_waves <- unique(stats::na.omit(data[["LASA_wave"]]))
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
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names, split_wavecode = split_wavecode
  )
}
