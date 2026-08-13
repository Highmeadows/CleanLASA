# Apply LASA 030 (Functional limitations and ADL) SPSS labels
#
# Source: LASA030_varinfo_FunctionalLimitations.pdf (29-Jun-2023)
#
# This function follows the same argument contract and matching behaviour as
# apply_lasa046_labels(). By default, matched variables remain numeric and
# receive the SPSS-style attributes used by haven/labelled:
#   attr(x, "label")  = SPSS variable label
#   attr(x, "labels") = named numeric vector of SPSS value labels

#' Apply LASA030 (Functional Limitations and ADL) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to a LASA030 functional-limitations data frame, using
#' the coding and questionnaire layout documented for the requested wave.
#'
#' LASA030 changed across waves. Wave B used four response categories for the
#' activity questions and included three activities. Later waves used five
#' response categories, while the available activities and follow-up items
#' also varied. `wave` must therefore be supplied explicitly, especially
#' because B, 2B, 3B, and MB all use variable names beginning with `"b"`.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive match, and (3) a
#' case-insensitive match. Variables documented for a wave but absent from
#' `data` are left untouched and recorded as `"not found"` in the matching
#' audit.
#'
#' @param data A data frame or tibble imported from a LASA030 `.sav` file,
#'   containing wave-prefixed variables such as `badl1a`, `cadl1a`, or
#'   `kadl7d`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit name
#'   overrides. Names are canonical LASA030 suffixes without the wave prefix,
#'   and values are the actual column names in `data`, for example
#'   `c(adl4a = "B_ADL4A")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables stay
#'   numeric with SPSS-style value-label attributes. If `TRUE`, value labels
#'   are used as factor levels, while observed values without a codebook label
#'   are retained under their numeric code.
#' @param to_numeric Logical. If `FALSE` (default), variables retain their
#'   value-label attributes. If `TRUE`, variables whose codebook labels contain
#'   only negative missing-reason codes are restored to plain numeric, with
#'   negative values converted to `NA`. LASA030 contains categorical variables,
#'   so this option normally makes no changes, but it is retained as part of
#'   the package-wide `apply_*_labels()` argument contract.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are preserved. If `TRUE`, matched columns are renamed to their canonical
#'   lowercase LASA030 names, such as `badl1a` or `kadl7d`.
#'
#' @return `data`, with variable- and value-label attributes attached to every
#'   matched LASA030 column, optionally converted to factors and/or renamed.
#'   A matching audit is attached as the generic `"label_report"` attribute
#'   and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa046_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat_b <- data.frame(BADL1A = c(1, 4), BADL1B = c(1, 2))
#' dat_b <- apply_lasa030_labels(dat_b, wave = "B")
#' attr(dat_b$BADL1A, "label")
#' attr(dat_b$BADL1A, "labels")
#'
#' dat_k <- data.frame(KADL1A = c(1, 5), KADL7D = c(1, 4))
#' dat_k <- apply_lasa030_labels(
#'   dat_k,
#'   wave = "K",
#'   to_factor = TRUE,
#'   standardize_names = TRUE
#' )
#' lasa_label_report(dat_k, problems_only = TRUE)
apply_lasa030_labels <- function(data,
                                 wave,
                                 name_corrections = NULL,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE) {

  wave <- toupper(wave)

  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b",
    F = "f", G = "g", H = "h", `3B` = "b", MB = "b",
    I = "i", J = "j", K = "k"
  )

  if (length(wave) != 1L || is.na(wave) || !wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 030 wave: ", paste(wave, collapse = ", "),
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

  standard_missing_codes <- function(ref = NULL,
                                     include_interview_terminated = FALSE) {
    out <- numeric(0)

    if (include_interview_terminated) {
      out <- c(out, setNames(-5, "na, interview terminated"))
    }
    if (!is.null(ref)) {
      out <- c(
        out,
        setNames(-3, "na, wrong skip"),
        setNames(-2, paste0("na, see ", toupper(ref)))
      )
    }
    c(out, setNames(-1, "na, asked"))
  }

  activity_response_labels <- if (wave == "B") {
    value_labels(
      "no, I cannot" = 1,
      "only with help" = 2,
      "yes, with difficulty" = 3,
      "yes, without help" = 4
    )
  } else {
    value_labels(
      "no, I cannot" = 1,
      "only with help" = 2,
      "yes, with much difficulty" = 3,
      "yes, with some difficulty" = 4,
      "yes, without help" = 5
    )
  }

  yes_no_labels <- function(ref) {
    c(
      standard_missing_codes(ref),
      value_labels("no" = 1, "yes" = 2)
    )
  }

  help_frequency_labels <- function(ref) {
    c(
      standard_missing_codes(ref),
      value_labels(
        "never" = 1,
        "seldom" = 2,
        "occasionally" = 3,
        "often or always" = 4
      )
    )
  }

  is_codebook_numeric <- function(value_label_map) {
    if (is.null(value_label_map) || length(value_label_map) == 0L) {
      return(FALSE)
    }
    codes <- as.numeric(unname(value_label_map))
    all(!is.na(codes) & is.finite(codes) & codes < 0)
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
          duplicated(level_text) |
            duplicated(level_text, fromLast = TRUE)
        ]
      )
      for (txt in collided) {
        i <- which(level_text == txt)
        level_text[i] <- paste0(txt, " [", level_codes[i], "]")
      }
    }

    factor(values, levels = level_codes, labels = level_text)
  }

  report_rows <- list()
  rename_plan <- character(0)

  record_match_result <- function(suffix, expected_name, matched_name, method) {
    report_rows[[length(report_rows) + 1L]] <<- data.frame(
      suffix = suffix,
      expected_name = expected_name,
      matched_name = if (is.na(matched_name)) NA_character_ else matched_name,
      method = method,
      stringsAsFactors = FALSE
    )
    invisible(NULL)
  }

  label_variable <- function(suffix, variable_label, value_label_map = NULL) {
    expected_name <- paste0(prefix, suffix)

    if (tolower(suffix) %in% correction_keys) {
      actual_name <- name_corrections[[match(tolower(suffix), correction_keys)]]
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
    attr(x, "label") <- variable_label

    if (!is.null(value_label_map)) {
      attr(x, "labels") <- value_label_map
    }

    if (isTRUE(to_numeric) && is_codebook_numeric(value_label_map)) {
      x <- restore_plain_numeric(x)
      attr(x, "label") <- variable_label
    } else if (
      isTRUE(to_factor) &&
        !is.null(value_label_map) &&
        length(value_label_map) > 0L
    ) {
      x <- convert_to_labelled_factor(x, value_label_map)
      attr(x, "label") <- variable_label
    }

    data[[idx]] <<- x
    record_match_result(suffix, expected_name, matched_name, method)

    if (isTRUE(standardize_names)) {
      rename_plan[[matched_name]] <<- tolower(expected_name)
    }

    invisible(NULL)
  }

  finalize_labelled_data <- function() {
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

      if (anyDuplicated(new_names)) {
        duplicated_names <- unique(new_names[duplicated(new_names)])
        stop(
          "standardize_names = TRUE would create duplicate column names: ",
          paste(duplicated_names, collapse = ", "),
          ". Resolve the conflict with 'name_corrections' or by renaming ",
          "the source column(s) before calling apply_lasa030_labels().",
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
    data
  }

  activity_labels <- c(
    `1` = "Stairs: 15 steps without stopping",
    `2` = "(Un)dress: self",
    `3` = "Chair: sit and rise from",
    `4` = "Toenails: cutting own",
    `5` = "Walking: 5 min. outside the house",
    `6` = "Transport: use of own or public",
    `7` = "Take a bath/shower: self"
  )

  activity_numbers <- if (wave == "B") {
    c(1L, 6L, 4L)
  } else if (wave %in% c("C", "D", "E")) {
    1:6
  } else {
    1:7
  }

  follow_up_letters <- if (wave %in% c("C", "D", "E", "2B", "F", "G")) {
    c("b", "c", "d", "e")
  } else if (wave == "MB") {
    "b"
  } else {
    c("b", "c", "d")
  }

  for (activity_number in activity_numbers) {
    suffix_a <- paste0("adl", activity_number, "a")
    variable_a <- toupper(paste0(prefix, suffix_a))

    missing_labels <- if (activity_number == 1L) {
      standard_missing_codes(include_interview_terminated = TRUE)
    } else {
      standard_missing_codes(toupper(paste0(prefix, "adl1a")))
    }

    label_variable(
      suffix_a,
      unname(activity_labels[[as.character(activity_number)]]),
      c(missing_labels, activity_response_labels)
    )

    if ("b" %in% follow_up_letters) {
      label_variable(
        paste0("adl", activity_number, "b"),
        paste0(
          sub(":.*$", "", activity_labels[[as.character(activity_number)]]),
          ": using aid (", variable_a, " > 1)"
        ),
        yes_no_labels(variable_a)
      )
    }

    if ("c" %in% follow_up_letters) {
      help_condition <- if (wave == "B") " = 3" else " > 2"
      label_variable(
        paste0("adl", activity_number, "c"),
        paste0(
          sub(":.*$", "", activity_labels[[as.character(activity_number)]]),
          ": help from someone (", variable_a, help_condition, ")"
        ),
        help_frequency_labels(variable_a)
      )
    }

    if ("d" %in% follow_up_letters) {
      label_variable(
        paste0("adl", activity_number, "d"),
        paste0(
          sub(":.*$", "", activity_labels[[as.character(activity_number)]]),
          ": R receive help (", variable_a, " = 2)"
        ),
        help_frequency_labels(variable_a)
      )
    }

    if ("e" %in% follow_up_letters) {
      label_variable(
        paste0("adl", activity_number, "e"),
        paste0(
          sub(":.*$", "", activity_labels[[as.character(activity_number)]]),
          ": less than wanted (", variable_a, " > 1)"
        ),
        yes_no_labels(variable_a)
      )
    }
  }

  finalize_labelled_data()
}
