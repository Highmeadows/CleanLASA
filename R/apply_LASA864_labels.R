# Apply LASA 864 (serum cortisol) SPSS labels
#
# Source: LASA864_varinfo.pdf (08-Dec-2017)

#' Apply LASA864 (Serum Cortisol) SPSS labels
#'
#' Attaches the variable and value labels documented for the three serum
#' cortisol measures in the LASAC864 medical-interview file. The wave-C
#' inventory contains total cortisol, corticosteroid binding globuline, and
#' calculated free cortisol. Codes `-3` and `-1` identify an incorrect value
#' and no determination where documented.
#'
#' Matching uses an explicit `name_corrections` entry, an exact match, then a
#' case-insensitive exact match. `to_numeric = TRUE` restores the laboratory
#' measures to plain numeric and replaces negative missing codes with `NA`.
#' `to_factor = TRUE` converts value-labelled columns to factors when numeric
#' restoration is not requested. Original values and labels remain available
#' in `original_values` and `original_labels` attributes.
#'
#' @param data A data frame or tibble imported from a LASAC864 `.sav` file.
#' @param wave Character scalar: `"C"`; matching is case-insensitive.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names in `data`.
#' @param to_factor Logical. Convert value-labelled variables to factors.
#' @param to_numeric Logical. Restore laboratory measures to plain numeric and
#'   replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes from matched names and
#'   add `LASA_wave`; implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA864 metadata, optional conversions and renaming, a
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, cmco = c(-1, 250))
#' apply_lasa864_labels(dat, wave = "C", to_numeric = TRUE)
apply_lasa864_labels <- function(data,
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
  if (wave != "C") {
    stop("Unknown LASA 864 wave: ", wave, ". Use: C.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "c",
    fn_name = "apply_lasa864_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  missing_codes <- c(
    "incorrect value" = -3,
    "no determination" = -1
  )
  engine$label_variable(
    "mco", "serum: total cortisol (nmol/L)", missing_codes, TRUE
  )
  engine$label_variable(
    "mcbg", "corticosteroid binding globuline (mg/L)", missing_codes, TRUE
  )
  engine$label_variable(
    "mfcort", "free cortisol (nmol/l)", missing_codes, TRUE
  )

  engine$finalize()
}
