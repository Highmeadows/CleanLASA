# Apply LASA 116 (decubitus) SPSS labels
#
# Source: LASA116_varinfo.pdf (02-Jul-2013)

#' Apply LASA116 (Decubitus) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the two decubitus items
#' documented in LASAB116. The self-administered questionnaire records
#' whether the respondent suffered bed sores and, separately, whether the
#' respondent received treatment.
#'
#' LASA116 is documented only for wave B. Both variables are categorical.
#' `qdecu01` distinguishes no bed sores from three documented duration
#' categories; `qdecu02` records treatment. Both use `-1` for no answer.
#'
#' Matching tries `name_corrections`, an exact name, then a case-insensitive
#' exact name. `to_factor = TRUE` converts the items using their documented
#' value maps and preserves any observed unlabelled codes as numeric-text
#' levels. No variable is eligible for `to_numeric`. Original labels and
#' values are retained in `original_labels` and `original_values`.
#'
#' @param data A data frame or tibble imported from LASAB116.
#' @param wave Character scalar. Only `"B"` is documented and accepted;
#'   matching is case-insensitive.
#' @param name_corrections Optional named character vector whose names are
#'   canonical suffixes (`qdecu01` or `qdecu02`) and whose values are actual
#'   column names in `data`.
#' @param to_factor Logical. Convert matched variables to factors using the
#'   documented value labels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA116 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. Standardize matched names and respondent
#'   number, remove the `b` wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove the wave prefix from matched names
#'   and add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA116 metadata, optional conversion and renaming,
#'   original-coding attributes, `LASA_wave`, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(BQDECU01 = c(-1, 1, 4), bqdecu02 = c(-1, 1, 2))
#' dat <- apply_lasa116_labels(dat, wave = "B")
#' attr(dat$BQDECU01, "labels")
apply_lasa116_labels <- function(data,
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
  if (wave != "B") {
    stop("Unknown LASA 116 wave: ", wave, ". Use: B.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "b",
    fn_name = "apply_lasa116_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  engine$label_variable(
    "qdecu01",
    "Decubitus: suffering bed sores (Self adm. questionnaire)",
    c(
      "no answer" = -1,
      "no" = 1,
      "yes, <two weeks" = 2,
      "yes, 2wks><3mths" = 3,
      "yes, >3months" = 4
    ),
    force_numeric = FALSE
  )
  engine$label_variable(
    "qdecu02",
    "Decubitus: treatment (Self adm. questionnaire)",
    c("no answer" = -1, "no" = 1, "yes" = 2),
    force_numeric = FALSE
  )

  engine$finalize()
}
