# Apply LASA 119 (fertility in women) SPSS labels
#
# Source: LASA119_varinfo.pdf (27-Sep-2012)

#' Apply LASA119 (Fertility in women) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the 13 fertility and
#' menopause variables documented in LASAB119. The self-administered module
#' covers reproductive timing and number of children, menopause, oral
#' contraceptive use, and five menopause-related symptoms.
#'
#' Age, count, and duration variables (`qmeno01`, `qmeno02`, `qmeno03`,
#' `qmeno05`, and `qmeno08`) are numeric and can be restored with
#' `to_numeric = TRUE`; all negative missing codes then become `NA`. The
#' remaining variables are categorical and can be converted with
#' `to_factor = TRUE`. The common missing codes are `-3` for no answer,
#' skipped, `-2` for male respondent, and `-1` for no answer.
#'
#' Matching tries `name_corrections`, an exact name, then a case-insensitive
#' exact name. Original labels and values are retained in `original_labels`
#' and `original_values` attributes.
#'
#' @param data A data frame or tibble imported from LASAB119.
#' @param wave Character scalar. Only `"B"` is documented and accepted;
#'   matching is case-insensitive.
#' @param name_corrections Optional named character vector whose names are
#'   canonical suffixes without the `b` prefix, such as `qmeno01`, and whose
#'   values are actual column names in `data`.
#' @param to_factor Logical. Convert matched categorical variables to factors
#'   using documented value labels.
#' @param to_numeric Logical. Restore eligible age, count, and duration
#'   variables to plain numeric and replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and respondent
#'   number, remove the `b` wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove the wave prefix from matched names
#'   and add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA119 metadata, optional conversion and renaming,
#'   original-coding attributes, `LASA_wave`, and a `label_report` audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   BQMENO01 = c(-2, 13, 15),
#'   bqmeno06 = c(-2, 1, 3)
#' )
#' dat <- apply_lasa119_labels(dat, wave = "B", to_numeric = TRUE)
#' dat$BQMENO01
apply_lasa119_labels <- function(data,
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
    stop("Unknown LASA 119 wave: ", wave, ". Use: B.", call. = FALSE)
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
    fn_name = "apply_lasa119_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  missing_values <- c(
    "no answer, skipped" = -3,
    "male respondent" = -2,
    "no answer" = -1
  )
  yes_no_values <- c(missing_values, "no" = 1, "yes" = 2)

  specs <- list(
    list("qmeno01", "menopause 01: age start period", missing_values, TRUE),
    list("qmeno02", "menopause 02: number of children", missing_values, TRUE),
    list("qmeno03", "menopause 03: age first child born", missing_values, TRUE),
    list("qmeno04", "menopause 04: pregnant no children", yes_no_values, FALSE),
    list("qmeno05", "menopause 05: age last period", missing_values, TRUE),
    list(
      "qmeno06", "menopause 06: menopause natural",
      c(
        missing_values,
        "normal" = 1,
        "operation" = 2,
        "no menopause yet" = 3
      ),
      FALSE
    ),
    list("qmeno07", "menopause 07: used contraceptive pill", yes_no_values, FALSE),
    list("qmeno08", "menopause 08: # years contraceptive pill", missing_values, TRUE),
    list("qmeno09", "menopause 09: hot flushes", yes_no_values, FALSE),
    list("qmeno10", "menopause 10: excessive transpiration", yes_no_values, FALSE),
    list("qmeno11", "menopause 11: pain in muscles", yes_no_values, FALSE),
    list("qmeno12", "menopause 12: dry vagina", yes_no_values, FALSE),
    list("qmeno13", "menopause 13: pain during intercourse", yes_no_values, FALSE)
  )

  for (item in specs) {
    engine$label_variable(
      item[[1L]], item[[2L]], item[[3L]], force_numeric = item[[4L]]
    )
  }

  engine$finalize()
}
