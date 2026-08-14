# Apply LASA zdc3 (Diabetes Mellitus Algorithm) SPSS labels
#
# Source: LASAzdc1_2_3_varinfo.pdf (03-Nov-2020), LASAzdc3 section

#' Apply LASAzdc3 (Diabetes Mellitus Algorithm) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the three diabetes
#' mellitus algorithm variables documented for LASAzdc3. The Z-file contains
#' the 3B-cohort diabetes status (`b_DM`), the I-wave status with dropouts
#' defined (`i_DM`), and the unadjusted I-wave algorithm result
#' (`i_alg_DM_ruw`).
#'
#' LASAzdc3 is a wave-Z file. All three variables are categorical: status
#' codes distinguish missing, no diabetes, definite diabetes, possible
#' diabetes, and contradictory information; the two I-wave fields additionally
#' define code 5 as dropout. Therefore none is eligible for `to_numeric`
#' restoration. `to_factor = TRUE` applies the documented category text while
#' retaining observed undocumented codes. Matching tries corrections, exact
#' names, and then case-insensitive exact names. Standardized naming lowercases
#' the documented names, standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASAzdc3 `.sav` file.
#' @param wave Character scalar identifying wave `"Z"`.
#' @param name_corrections Optional named character vector mapping documented
#'   names such as `b_DM` or `i_alg_DM_ruw` to actual columns.
#' @param to_factor Logical. Convert variables carrying value labels to
#'   factors while retaining observed undocumented values.
#' @param to_numeric Logical. Request numeric restoration for eligible
#'   variables. LASAzdc3 has no eligible variables.
#' @param standardize_names Logical. Standardize matched names and `respnr`
#'   and add `LASA_wave`.
#' @param split_wavecode Logical. Add `LASA_wave` and standardize matched names;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASAzdc3 metadata, optional factor conversion and
#'   renaming, the `LASA_wave` attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, b_DM = c(0, 1), i_DM = c(1, 5))
#' apply_lasazdc3_labels(dat, wave = "Z", to_factor = TRUE)
apply_lasazdc3_labels <- function(data,
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
  if (wave != "Z") {
    stop("Unknown LASA zdc3 wave: ", wave, ". Use Z.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = "",
    fn_name = "apply_lasazdc3_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  status_labels <- c(
    "missing" = -1,
    "no DM" = 0,
    "definite DM" = 1,
    "possible DM" = 2,
    "contradictory" = 3
  )
  dropout_labels <- c(status_labels, "drop-out" = 5)

  engine$label_variable(
    "b_DM", "3B wave: diabetes mellitus", status_labels,
    force_numeric = FALSE
  )
  engine$label_variable(
    "i_DM", "diabetes at I wave, dropouts defined", dropout_labels,
    force_numeric = FALSE
  )
  engine$label_variable(
    "i_alg_DM_ruw",
    "DM at i, unadjusted for DM status at previous waves",
    dropout_labels,
    force_numeric = FALSE
  )
  engine$finalize()
}
