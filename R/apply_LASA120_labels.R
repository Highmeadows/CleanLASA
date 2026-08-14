# Apply LASA 120 (sexuality) SPSS labels
#
# Source: LASA120_varinfo.pdf (10-Jan-2018)

#' Apply LASA120 (Sexuality) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the sexuality variables
#' documented for LASA120. Waves B, 2B, and 3B contain three evaluations of
#' sexual life. Wave E contains those three items plus two attitudes about
#' sexuality and intimacy in later life. Wave F contains items 2 through 5.
#'
#' All LASA120 variables are categorical and use `-1` for no answer.
#' `to_factor = TRUE` converts matched variables with their documented
#' unpleasant/pleasant, unimportant/important, or disagreement/agreement
#' scales while retaining observed unlabelled codes. No variable is eligible
#' for `to_numeric`.
#'
#' Matching tries `name_corrections`, an exact name, then a case-insensitive
#' exact name. Original labels and values are retained in `original_labels`
#' and `original_values` attributes.
#'
#' @param data A data frame or tibble imported from a LASA120 `.sav` file.
#' @param wave Character scalar identifying `"B"`, `"E"`, `"2B"`, `"F"`, or
#'   `"3B"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector whose names are
#'   canonical suffixes without the wave prefix, such as `qsex01`, and whose
#'   values are actual column names in `data`.
#' @param to_factor Logical. Convert matched variables to factors using the
#'   documented value labels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA120 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. Standardize matched names and respondent
#'   number, remove wave prefixes, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA120 metadata, optional conversion and renaming,
#'   original-coding attributes, `LASA_wave`, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:3, BQSEX01 = c(-1, 1, 5))
#' dat <- apply_lasa120_labels(dat, wave = "B")
#' attr(dat$BQSEX01, "labels")
apply_lasa120_labels <- function(data,
                                 wave,
                                 name_corrections = NULL,
                                 to_factor = FALSE,
                                 to_numeric = FALSE,
                                 standardize_names = FALSE,
                                 split_wavecode = FALSE) {
  if (length(wave) != 1L || is.na(wave) || !nzchar(wave)) {
    stop("'wave' must be a single non-empty character value.", call. = FALSE)
  }

  wave <- toupper(wave)
  wave_prefix <- c(B = "b", E = "e", `2B` = "b", F = "f", `3B` = "b")
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 120 wave: ", wave, ". Use one of: ",
      paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = unname(wave_prefix[[wave]]),
    fn_name = "apply_lasa120_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  evaluation_values <- c(
    "no answer" = -1,
    "very unpleasant" = 1,
    "unpleasant" = 2,
    "not unpleasant/pleasant" = 3,
    "pleasant" = 4,
    "very pleasant" = 5
  )
  importance_values <- c(
    "no answer" = -1,
    "very unimportant" = 1,
    "unimportant" = 2,
    "not unimportant/important" = 3,
    "important" = 4,
    "very important" = 5
  )
  present_values <- c(evaluation_values, "not applicable" = 6)
  agreement_values <- c(
    "no answer" = -1,
    "strongly disagree" = 1,
    "disagree" = 2,
    "no agreement/agreement" = 3,
    "agree" = 4,
    "strongly agree" = 5
  )

  specs <- list(
    list("qsex01", "sexual life 01: evaluation past", evaluation_values),
    list("qsex02", "sexual life 02: importance present", importance_values),
    list("qsex03", "sexual life 03: evaluation present", present_values),
    list("qsex04", "sexual life 04: not important at this age", agreement_values),
    list("qsex05", "sexual life 5: need for intimacy", agreement_values)
  )
  keep <- if (wave %in% c("B", "2B", "3B")) {
    1:3
  } else if (wave == "E") {
    1:5
  } else {
    2:5
  }

  for (i in keep) {
    item <- specs[[i]]
    engine$label_variable(
      item[[1L]], item[[2L]], item[[3L]], force_numeric = FALSE
    )
  }

  engine$finalize()
}
