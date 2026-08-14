# Apply LASA 801 (coffee and tea consumption) SPSS labels
#
# Source: LASA801_varinfo.pdf (17-Mar-2023)

#' Apply LASA801 (Coffee and Tea Consumption) SPSS Labels
#'
#' Attaches the variable and value labels documented for the 26 coffee- and
#' tea-consumption variables in LASA801. The available file is wave J. It
#' includes parallel questions for participants aged 40--65 years and for
#' consumption during the past month, plus usual coffee- and tea-cup volume.
#' Although the PDF header mentions wave K, its footnote states that K was not
#' yet available; consequently this function accepts only wave J.
#'
#' Daily total cup counts and free-text "other" cup volumes are numeric and
#' eligible for `to_numeric`; negative missing codes become `NA`. Weekly
#' frequencies, beverage-specific cup categories (which include code 11 for
#' not applicable), and cup-size categories can be converted with
#' `to_factor`. Original coding is retained in reference attributes.
#'
#' Matching tries `name_corrections`, an exact case-sensitive name, then a
#' case-insensitive exact name. Standardized naming removes the J prefix,
#' standardizes `respnr`, and adds `LASA_wave`. `split_wavecode` removes the
#' prefix and adds the wave column without otherwise standardizing `respnr`.
#'
#' @param data A data frame or tibble imported from a LASA801 `.sav` file.
#' @param wave Character scalar. Only `"J"` is documented as available.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the J prefix to actual column names in `data`.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Restore eligible cup counts and free-text cup
#'   volumes to plain numeric, replacing negative codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove the wave prefix and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA801 metadata, requested conversions and renaming,
#'   preserved original coding, a `LASA_wave` attribute, and a `label_report`.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, jqcof1 = c(0, 7), jqcof2 = c(-1, 4))
#' apply_lasa801_labels(dat, wave = "J", to_numeric = TRUE)
apply_lasa801_labels <- function(data,
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
  if (wave != "J") {
    stop(
      "Unknown LASA 801 wave: ", wave,
      ". Use J; wave K is listed in the source but not available.",
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
    prefix = "j",
    fn_name = "apply_lasa801_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  weekly <- c(
    "no answer, asked" = -1,
    "none" = 0,
    "1 day a week" = 1,
    "2 days a week" = 2,
    "3 days a week" = 3,
    "4 days a week" = 4,
    "5 days a week" = 5,
    "6 days a week" = 6,
    "7 days a week" = 7,
    "<1 day a week" = 8
  )
  daily <- function(parent, include_not_applicable = FALSE) {
    values <- c(
      setNames(-2, paste0("no answer, see ", parent)),
      "no answer, asked" = -1,
      "1 cup" = 1,
      ">=10 cups" = 10
    )
    if (include_not_applicable) {
      values <- c(values, "not applicable" = 11)
    }
    values
  }
  cup_volume <- c(
    "no answer, asked" = -1,
    "small (app 125 ml)" = 1,
    "medium (app 165 ml)" = 2,
    "large (app 225 ml)" = 3,
    "other, namely (ml)" = 4,
    "do not know" = 5,
    "not applicable" = 6
  )

  label_variable(
    "qcof1p", "Weekly coffee consumption (40-65 years)", weekly, FALSE
  )
  label_variable(
    "qtea1p", "Weekly tea consumption (40-65 years)", weekly, FALSE
  )
  label_variable(
    "qcof2p", "Daily coffee (number of cups) (40-65 years)",
    daily("JQCOF1p"), TRUE
  )
  label_variable(
    "qtea2p", "Daily tea (number of cups) (40-65 years)",
    daily("JQTEA1p"), TRUE
  )

  typed_40_65 <- c(
    qcof3ap = "Daily caffeinated coffee (number of cups) (40-65 years)",
    qcof3bp = "Daily decaffeinated coffee (number of cups) (40-65 years)",
    qtea3ap = "Daily black tea (number of cups) (40-65 years)",
    qtea3bp = "Daily green tea (number of cups) (40-65 years)",
    qtea3cp = "Daily rooibos tea (number of cups) (40-65 years)",
    qtea3dp = "Daily herbal tea (number of cups) (40-65 years)",
    qtea3ep = "Daily other tea (number of cups) (40-65 years)"
  )
  for (suffix in names(typed_40_65)) {
    parent <- if (grepl("qcof", suffix, fixed = TRUE)) "JQCOF1P" else "JQTEA1P"
    label_variable(
      suffix, typed_40_65[[suffix]], daily(parent, TRUE), FALSE
    )
  }

  label_variable(
    "qcof1", "Weekly coffee consumption (past month)", weekly, FALSE
  )
  label_variable(
    "qtea1", "Weekly tea consumption (past month)", weekly, FALSE
  )
  label_variable(
    "qcof2", "Daily coffee consumption (number of cups) (past month)",
    daily("JQCOF1"), TRUE
  )
  label_variable(
    "qtea2", "Daily tea consumption (number of cups) (past month)",
    daily("JQTEA1"), TRUE
  )

  typed_past_month <- c(
    qcof3a = "Daily caffeinated coffee (number of cups) (past month)",
    qcof3b = "Daily decaffeinated coffee (number of cups) (past month)",
    qtea3a = "Daily black tea (number of cups) (past month)",
    qtea3b = "Daily green tea (number of cups) (past month)",
    qtea3c = "Daily rooibos tea (number of cups) (past month)",
    qtea3d = "Daily herbal tea (number of cups) (past month)",
    qtea3e = "Daily other tea (number of cups) (past month)"
  )
  for (suffix in names(typed_past_month)) {
    parent <- if (grepl("qcof", suffix, fixed = TRUE)) "JQCOF1" else "JQTEA1"
    label_variable(
      suffix, typed_past_month[[suffix]], daily(parent, TRUE), FALSE
    )
  }

  label_variable("qcof4", "Volume of coffee cup", cup_volume, FALSE)
  label_variable(
    "qcof4o", "Volume of coffee cup: other",
    c("na, see JQCOF4" = -2), TRUE
  )
  label_variable("qtea4", "Volume of tea cup", cup_volume, FALSE)
  label_variable(
    "qtea4o", "Volume of tea cup: other",
    c("na, see JQTEA4" = -2), TRUE
  )

  engine$finalize()
}
