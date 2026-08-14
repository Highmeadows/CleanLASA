# Apply LASA 134 (birth weight) SPSS labels
#
# Source: LASA134_varinfo.pdf (28-Sep-2016)

#' Apply LASA134 (Birth weight) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to birth-weight variables
#' documented in LASA134 for waves E, 2B, and 3B.
#'
#' All three waves contain birth weight in grams and a source-quality item.
#' Wave 3B additionally records which document supplied the birth weight.
#' The weight variable is numeric and eligible for `to_numeric`; a negative
#' missing code becomes `NA`. Source variables are categorical and can be
#' converted with `to_factor`.
#'
#' Matching tries `name_corrections`, an exact case-sensitive match, and then
#' a case-insensitive exact match. Both replenishment waves use the documented
#' `b` variable prefix, while the `LASA_wave` provenance distinguishes `2B`
#' from `3B`. Original SPSS coding is preserved.
#'
#' @param data A data frame or tibble imported from a LASA134 `.sav` file.
#'   Names are `eqbwght`/`eqbwghts` in E and `bqbwght`/`bqbwghts` in 2B and
#'   3B; `bqbwghtw` occurs only in 3B.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"E"`, `"2B"`, or `"3B"`.
#' @param name_corrections Optional named character vector mapping suffixes
#'   without the wave prefix (for example `qbwght` or `qbwghtw`) to actual
#'   names in `data`.
#' @param to_factor Logical. If `TRUE`, categorical source variables are
#'   converted to factors using the documented value labels.
#' @param to_numeric Logical. If `TRUE`, birth weight is restored to plain
#'   numeric and negative values become `NA`.
#' @param standardize_names Logical. If `TRUE`, matched names and `respnr` are
#'   standardized and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names lose the wave prefix
#'   and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA134 labels, requested conversion or renaming,
#'   preserved original coding, `LASA_wave` provenance, and a `label_report`.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(eqbwght = c(-1, 3500), eqbwghts = c(1, 3))
#' dat <- apply_lasa134_labels(dat, wave = "E", to_numeric = TRUE)
#' attr(dat$eqbwghts, "labels")
apply_lasa134_labels <- function(data,
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
  if (!wave %in% c("E", "2B", "3B")) {
    stop(
      "Unknown LASA 134 wave: ", wave, ". Use one of: E, 2B, 3B.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- if (wave %in% c("2B", "3B")) "b" else "e"
  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = prefix,
    fn_name = "apply_lasa134_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  engine$label_variable(
    "qbwght", "weight at birth in grams", c("no answer" = -1),
    force_numeric = TRUE
  )
  engine$label_variable(
    "qbwghts", "weight at birth in grams: source",
    c(
      "no answer" = -1, "checked in documentation" = 1,
      "known without check" = 2, "estimation" = 3
    )
  )
  if (wave == "3B") {
    engine$label_variable(
      "qbwghtw", "weight at birth in grams: which source",
      c(
        "no answer" = -1, "birth certificate" = 1,
        "birth announcement card" = 2, "baby book" = 3, "other" = 4
      )
    )
  }

  engine$finalize()
}
