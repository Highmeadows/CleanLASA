# Apply LASA 274 (vignette total score) SPSS labels
#
# Source: LASA074_varinfo.pdf (09-Oct-2017), page 5

#' Apply LASA274 (Vignette Total Score) SPSS labels
#'
#' Attaches the SPSS-style variable label (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the LASA274 total Frequency of Requested Effort
#' (FRE) score derived from the LASA074 vignettes about help.
#'
#' LASA274 is documented only for wave D and contains one numeric score,
#' `dvignet`. The documented range is 0 (low FRE) through 19 (high FRE), with
#' `-1` indicating more than three missing vignette items. With
#' `to_numeric = TRUE`, the score becomes plain numeric and `-1` becomes
#' `NA`. Original values and labels remain available in `original_values` and
#' `original_labels`.
#'
#' Column matching uses an explicit `name_corrections` override, an exact
#' case-sensitive match, and then a case-insensitive exact match. Standardized
#' naming removes the D-wave prefix, standardizes `respnr`, and inserts a
#' `LASA_wave` column.
#'
#' @param data A data frame or tibble imported from a LASAD274 `.sav` file.
#' @param wave Character scalar identifying wave `"D"`, matched
#'   case-insensitively.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffix `vignet` to the actual column name in `data`.
#' @param to_factor Logical. If `TRUE`, the score is converted to a factor from
#'   its documented missing and endpoint labels unless `to_numeric = TRUE`
#'   takes precedence. Unlabelled observed scores are retained.
#' @param to_numeric Logical. If `TRUE`, convert the score to plain numeric and
#'   replace its negative missing code with `NA`.
#' @param standardize_names Logical. If `TRUE`, standardize matched names and
#'   `respnr`, remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. If `TRUE`, remove the wave prefix from the
#'   matched column and add `LASA_wave`. Implied by
#'   `standardize_names = TRUE`.
#'
#' @return `data` with LASA274 metadata, requested conversion and renaming,
#'   the `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()],
#'   [apply_lasa074_labels()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:3, dvignet = c(-1, 0, 19))
#' dat <- apply_lasa274_labels(dat, wave = "D", to_numeric = TRUE)
#' attr(dat$dvignet, "label")
apply_lasa274_labels <- function(data,
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
  if (wave != "D") {
    stop("Unknown LASA 274 wave: ", wave, ". Use: D.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "d",
    fn_name = "apply_lasa274_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  engine$label_variable(
    "vignet", "total score vignettes FRE",
    c(">3 missings" = -1, "low FRE" = 0, "high FRE" = 19),
    force_numeric = TRUE
  )

  engine$finalize()
}
