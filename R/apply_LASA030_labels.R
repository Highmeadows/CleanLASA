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
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of a parameter contract shared by every
#' `apply_*_labels()` function in this package (see the header comment in
#' `lasa_io.R` and [apply_lasa046_labels()] for the canonical
#' implementation). Regardless of `to_factor`/`to_numeric`, every matched
#' column also keeps its original SPSS value coding available as reference
#' attributes -- `attr(x, "original_labels")` and `attr(x, "original_values")`
#' -- and the `"respnr"` column (in any capitalization) is matched and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
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
#'   are preserved (except for any renaming triggered by `split_wavecode`, see
#'   below). If `TRUE`, matched columns are renamed to their canonical
#'   lowercase LASA030 names with the wave code removed, such as `adl1a` or
#'   `adl7d`, `"respnr"` (in any capitalization) is renamed to `"respnr"`, and
#'   `split_wavecode` is always treated as `TRUE` as well, regardless of what
#'   was passed for `split_wavecode`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with the wave-letter prefix removed (e.g.
#'   `badl1a` becomes `adl1a`), and a new `"LASA_wave"` column, filled with
#'   `wave`, is inserted right after `"respnr"`. Always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable- and value-label attributes attached to every
#'   matched LASA030 column, optionally converted to factors and/or renamed,
#'   plus reference `original_labels`/`original_values` attributes preserving
#'   the original SPSS value coding regardless of that reshaping. A new
#'   `"LASA_wave"` column is added after `"respnr"` when `standardize_names =
#'   TRUE` or `split_wavecode = TRUE`. A matching audit is attached as the
#'   generic `"label_report"` attribute and can be retrieved with
#'   [lasa_label_report()].
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
                                 standardize_names = FALSE,
                                 split_wavecode = FALSE) {

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
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa030_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

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

  engine$finalize()
}
