# Apply LASA 865 (thyroid function) SPSS labels
#
# Source: LASA865_varinfo.pdf (08-Dec-2017)

#' Apply LASA865 (Thyroid Function) SPSS labels
#'
#' Attaches the variable and value labels documented for the LASAC865
#' thyroid-function laboratory file. The wave-C inventory contains
#' thyroid-stimulating hormone, free T4, and free T3. Code `-1` denotes no
#' determination; free T4 and free T3 additionally use `-2` routing codes
#' referring to the preceding thyroid measurements.
#'
#' Matching tries `name_corrections`, an exact name, then a case-insensitive
#' exact name. `to_numeric = TRUE` restores the laboratory measures to plain
#' numeric and replaces negative missing codes with `NA`. `to_factor = TRUE`
#' converts value-labelled columns to factors when numeric restoration is not
#' requested. Original values and labels are preserved in attributes.
#'
#' @param data A data frame or tibble imported from a LASAC865 `.sav` file.
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
#' @return `data` with LASA865 metadata, optional conversions and renaming, a
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, cmtsh2 = c(-1, 2.4))
#' apply_lasa865_labels(dat, wave = "C", to_numeric = TRUE)
apply_lasa865_labels <- function(data,
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
    stop("Unknown LASA 865 wave: ", wave, ". Use: C.", call. = FALSE)
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
    fn_name = "apply_lasa865_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  engine$label_variable(
    "mtsh2", "thyroid-stimulating hormone (mU/l)",
    c("no determination" = -1), TRUE
  )
  engine$label_variable(
    "mft4", "free T4 (pmol/l)",
    c("na, see CMTSH2" = -2, "no determination" = -1), TRUE
  )
  engine$label_variable(
    "mft3", "free T3 (pmol/l)",
    c("na, see CMTSH2 & CMFT4" = -2, "no determination" = -1), TRUE
  )

  engine$finalize()
}
