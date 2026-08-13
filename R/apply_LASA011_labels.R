# Apply LASA 011 (Household composition) SPSS variable and value labels
#
# Source: LASA011_varinfo_HouseholdComposition.pdf (24-Aug-2023)
#
# LASAB211 is documented in the same PDF, but it is a separate LASA file
# code. This function deliberately handles only LASA011 files.

#' Apply LASA011 (Household Composition) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA011 household-composition data frame, using
#' the coding scheme documented for the requested wave. By default, variables
#' remain numeric. Optional arguments allow converting categorical variables
#' to factors, restoring count variables to plain numeric, correcting
#' mismatched column names, and standardizing names to the canonical LASA
#' documentation spelling.
#'
#' LASA011 changes across waves. Wave B records the total number of persons in
#' the household; later waves record other household members, excluding the
#' respondent's partner. From wave F onward, the file also distinguishes the
#' partner, children, stepchildren, siblings, other family members, and nonkin
#' household members. `wave` is therefore required, especially because B, 2B,
#' 3B, and MB all use the variable-name prefix `"b"`.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive name match. Unmatched documented variables are left
#' untouched and recorded as `"not found"` in the generic matching audit.
#'
#' The LASAB211 variables shown in the LASA011 codebook are not processed by
#' this function because LASAB211 is a separate LASA file code.
#'
#' @param data A data frame or tibble imported from a LASA011 `.sav` file,
#'   for example via [haven::read_sav()].
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA011 suffixes without the wave
#'   prefix (for example `nupers` or `hhpart`), and values are the actual
#'   column names in `data`, for example `c(nupers = "BNUPER")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables remain
#'   numeric with SPSS-style value-label attributes. If `TRUE`, categorical
#'   variables are converted to factors using the value labels as levels.
#'   Observed values without a codebook label are retained as numeric-text
#'   levels. Count variables are not converted to factors.
#' @param to_numeric Logical. If `FALSE` (default), count variables retain
#'   their SPSS-style value-label attributes. If `TRUE`, count variables are
#'   converted to ordinary numeric vectors, negative missing-reason codes are
#'   replaced with `NA`, and non-negative counts are retained. This takes
#'   precedence over `to_factor`.
#' @param standardize_names Logical. If `FALSE` (default), original column
#'   names are retained. If `TRUE`, matched LASA011 columns are renamed to
#'   their canonical lowercase documentation names, such as `bnupers`,
#'   `fhhpart`, or `khhnnonk`.
#'
#' @return `data`, with variable and value labels attached to every matched
#'   LASA011 column, optionally transformed and renamed. A variable-name
#'   matching audit is attached as `attr(data, "label_report")` and can be
#'   retrieved with [lasa_label_report()].
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()],
#'   [apply_lasa046_labels()]
#' @export
#'
#' @examples
#' dat_b <- data.frame(BNUPERS = c(1, 2, -2))
#' dat_b <- apply_lasa011_labels(dat_b, wave = "B")
#' attr(dat_b$BNUPERS, "label")
#' attr(dat_b$BNUPERS, "labels")
#'
#' dat_f <- data.frame(
#'   FHHPart = c(1, 0, -2),
#'   FHHNCh = c(2, 0, -2)
#' )
#' dat_f <- apply_lasa011_labels(
#'   dat_f,
#'   wave = "F",
#'   to_factor = TRUE,
#'   to_numeric = TRUE,
#'   standardize_names = TRUE
#' )
#' lasa_label_report(dat_f, problems_only = TRUE)
apply_lasa011_labels <- function(data,
                                 wave,
                                 name_corrections = NULL,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE) {
  if (length(wave) != 1L || is.na(wave) || !nzchar(wave)) {
    stop("'wave' must be a single non-empty character value.", call. = FALSE)
  }

  wave <- toupper(wave)
  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b",
    F = "f", G = "g", H = "h", `3B` = "b", MB = "b",
    I = "i", J = "j", K = "k"
  )

  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 011 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  prefix <- unname(wave_prefix[[wave]])

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_name_corrections(name_corrections)

  correction_keys <- if (is.null(name_corrections)) {
    character(0)
  } else {
    tolower(names(name_corrections))
  }

  value_labels <- function(...) {
    c(...)
  }

  referenced_missing <- function(reference) {
    setNames(-2, paste0("na, see ", toupper(reference)))
  }

  nupers_reference <- paste0(toupper(prefix), "HINDEP in LASA014")

  nupers_labels <- if (wave == "B") {
    value_labels(
      "na, wrong skip" = -3,
      "na, not liv independently" = -2,
      "none" = 0
    )
  } else if (wave %in% c("C", "D", "E", "2B")) {
    value_labels(
      "na, wrong skip" = -3,
      setNames(-2, paste0("na, see ", nupers_reference)),
      "na, asked" = -1,
      "none" = 0
    )
  } else if (wave == "MB") {
    value_labels(
      "na, wrong skip" = -3,
      "na, asked" = -1,
      "none" = 0
    )
  } else {
    value_labels(
      "na, wrong skip" = -3,
      setNames(-2, paste0("na, see ", nupers_reference)),
      "na, asked" = -1,
      "none" = 0
    )
  }

  nupers_label <- if (wave == "B") {
    "Number of persons in household"
  } else if (wave %in% c("C", "D", "E", "2B")) {
    "# other persons in household (partner excluded)"
  } else {
    "# other persons in household"
  }

  specs <- list(
    list(
      suffix = "nupers",
      variable_label = nupers_label,
      value_label_map = nupers_labels,
      variable_type = "numeric"
    )
  )

  if (wave %in% c("F", "G", "H", "3B", "I", "J", "K")) {
    nupers_name <- paste0(prefix, "NUPERS")
    count_missing <- referenced_missing(nupers_name)

    specs <- c(
      specs,
      list(
        list(
          suffix = "hhpart",
          variable_label = "partner in household",
          value_label_map = c(
            count_missing,
            value_labels(
              "no partner in household" = 0,
              "partner in household" = 1
            )
          ),
          variable_type = "categorical"
        ),
        list(
          suffix = "hhnch",
          variable_label = "number of children in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        ),
        list(
          suffix = "hhnstch",
          variable_label = "number of stepchildren in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        ),
        list(
          suffix = "hhnsib",
          variable_label = "number of siblings in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        ),
        list(
          suffix = "hhnothf",
          variable_label = "number of other family members in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        ),
        list(
          suffix = "hhnnonk",
          variable_label = "number of nonkin persons in household",
          value_label_map = count_missing,
          variable_type = "numeric"
        )
      )
    )
  }

  restore_plain_numeric <- function(x) {
    values <- as.numeric(x)
    values[!is.na(values) & values < 0] <- NA_real_
    values
  }

  convert_to_labelled_factor <- function(x, value_label_map) {
    values <- as.numeric(x)
    label_codes <- as.numeric(unname(value_label_map))
    label_text <- names(value_label_map)

    keep <- !duplicated(label_codes)
    label_codes <- label_codes[keep]
    label_text <- label_text[keep]

    observed_codes <- unique(values[!is.na(values)])
    level_codes <- sort(unique(c(label_codes, observed_codes)))
    level_text <- vapply(
      level_codes,
      function(code) {
        i <- match(code, label_codes)
        if (!is.na(i)) label_text[[i]] else as.character(code)
      },
      character(1)
    )

    if (anyDuplicated(level_text)) {
      collided <- unique(
        level_text[
          duplicated(level_text) | duplicated(level_text, fromLast = TRUE)
        ]
      )
      for (text in collided) {
        i <- which(level_text == text)
        level_text[i] <- paste0(text, " [", level_codes[i], "]")
      }
    }

    factor(values, levels = level_codes, labels = level_text)
  }

  report_rows <- list()
  rename_plan <- character(0)

  record_match_result <- function(suffix,
                                  expected_name,
                                  matched_name,
                                  method) {
    report_rows[[length(report_rows) + 1L]] <<- data.frame(
      suffix = suffix,
      expected_name = expected_name,
      matched_name = if (is.na(matched_name)) NA_character_ else matched_name,
      method = method,
      stringsAsFactors = FALSE
    )
    invisible(NULL)
  }

  label_variable <- function(spec) {
    suffix <- spec$suffix
    expected_name <- paste0(prefix, suffix)

    if (tolower(suffix) %in% correction_keys) {
      actual_name <- name_corrections[[
        match(tolower(suffix), correction_keys)
      ]]
      idx <- match(tolower(actual_name), tolower(names(data)))

      if (is.na(idx)) {
        record_match_result(
          suffix,
          expected_name,
          matched_name = actual_name,
          method = "manual_not_found"
        )
        return(invisible(NULL))
      }
      method <- "manual correction"
    } else {
      idx <- match(expected_name, names(data))

      if (!is.na(idx)) {
        method <- "exact"
      } else {
        idx <- match(tolower(expected_name), tolower(names(data)))

        if (!is.na(idx)) {
          method <- "case-insensitive exact"
        } else {
          record_match_result(
            suffix,
            expected_name,
            matched_name = NA_character_,
            method = "not found"
          )
          return(invisible(NULL))
        }
      }
    }

    matched_name <- names(data)[idx]
    x <- data[[idx]]
    attr(x, "label") <- spec$variable_label
    attr(x, "labels") <- spec$value_label_map

    if (isTRUE(to_numeric) && identical(spec$variable_type, "numeric")) {
      x <- restore_plain_numeric(x)
      attr(x, "label") <- spec$variable_label
    } else if (
      isTRUE(to_factor) &&
        identical(spec$variable_type, "categorical") &&
        length(spec$value_label_map) > 0L
    ) {
      x <- convert_to_labelled_factor(x, spec$value_label_map)
      attr(x, "label") <- spec$variable_label
    }

    data[[idx]] <<- x
    record_match_result(
      suffix,
      expected_name,
      matched_name = matched_name,
      method = method
    )

    if (isTRUE(standardize_names)) {
      rename_plan[[matched_name]] <<- tolower(expected_name)
    }

    invisible(NULL)
  }

  for (spec in specs) {
    label_variable(spec)
  }

  label_report <- if (length(report_rows) > 0L) {
    do.call(rbind, report_rows)
  } else {
    data.frame(
      suffix = character(0),
      expected_name = character(0),
      matched_name = character(0),
      method = character(0),
      stringsAsFactors = FALSE
    )
  }

  if (isTRUE(standardize_names) && length(rename_plan) > 0L) {
    old_names <- names(rename_plan)
    new_names <- unname(rename_plan)

    unchanged_names <- names(data)[!names(data) %in% old_names]
    conflicting_names <- intersect(new_names, unchanged_names)
    duplicate_targets <- unique(new_names[duplicated(new_names)])
    conflicts <- unique(c(conflicting_names, duplicate_targets))

    if (length(conflicts) > 0L) {
      stop(
        "standardize_names = TRUE would create duplicate column names: ",
        paste(conflicts, collapse = ", "),
        ". Resolve the conflict with 'name_corrections' or by renaming ",
        "the source column(s) before calling apply_lasa011_labels().",
        call. = FALSE
      )
    }

    idx <- match(old_names, names(data))
    names(data)[idx] <- new_names
    label_report$standardized_to <- new_names[
      match(label_report$matched_name, old_names)
    ]
  } else {
    label_report$standardized_to <- NA_character_
  }

  rownames(label_report) <- NULL
  attr(data, "label_report") <- label_report
  attr(data, "LASA_wave") <- wave
  data
}
