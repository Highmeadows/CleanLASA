# Apply LASA 220 (Digit Span total scores) SPSS labels
#
# Source: LASA020_varinfo.pdf (29-Oct-2024), LAS3B220 section

#' Apply LASA220 (Digit Span total scores) SPSS labels
#'
#' Attaches SPSS-style variable and value labels to the six constructed Digit
#' Span variables documented in the LAS3B220 section of the LASA020 codebook.
#' The inventory contains the total correct score, forward and backward
#' correct scores, forward and backward spans, and the reason-missing field.
#'
#' LASA220 is documented only for wave 3B. The five score variables use the
#' `-2` no-score and `-1` too-many-missings codes and are eligible for numeric
#' restoration: `to_numeric = TRUE` removes their value labels and converts
#' negative values to `NA`. The reason field remains categorical.
#' `to_factor = TRUE` applies the documented labels while preserving observed
#' undocumented values. Matching tries corrections, exact names, and then
#' case-insensitive exact names. Standardized naming removes the `b` prefix,
#' standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LAS3B220 `.sav` file.
#' @param wave Character scalar identifying wave `"3B"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes such as `dstot` or `rmds` to actual columns.
#' @param to_factor Logical. Convert variables carrying value labels to
#'   factors, unless numeric restoration takes precedence.
#' @param to_numeric Logical. Restore the five score variables to plain
#'   numeric and replace negative codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove the wave prefix and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA220 metadata, optional conversion and renaming, the
#'   `LASA_wave` attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, BDSTOT = c(-1, 12), BRMDS = c(3, -2))
#' apply_lasa220_labels(dat, wave = "3B", to_numeric = TRUE)
apply_lasa220_labels <- function(data,
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
  if (wave != "3B") {
    stop("Unknown LASA 220 wave: ", wave, ". Use 3B.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data, wave = wave, prefix = "b",
    fn_name = "apply_lasa220_labels",
    name_corrections = name_corrections,
    to_factor = to_factor, to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  score_labels <- c(
    "no score, see BRMDS" = -2,
    "no score, too many missings" = -1
  )
  score_specs <- list(
    list("dstot", "WAIS Digit Span: total number of correct items"),
    list("dsfw", "WAIS Digit Span: number of correct forward items"),
    list("dsbw", "WAIS Digit Span: number of correct backward items"),
    list("dsfsp", "WAIS Digit Span: Span forwards"),
    list("dsbsp", "WAIS Digit Span: Span backwards")
  )
  for (item in score_specs) {
    engine$label_variable(item[[1L]], item[[2L]], score_labels, force_numeric = TRUE)
  }
  engine$label_variable(
    "rmds", "reason missing Digit Span",
    c(
      "valid score" = -2,
      "short interview" = 1,
      "interview terminated" = 2,
      "too many missings" = 3,
      "language problem" = 4
    ),
    force_numeric = FALSE
  )
  engine$finalize()
}
