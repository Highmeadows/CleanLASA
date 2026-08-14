# Apply LASA 137 (Valuation of late life) SPSS variable and value labels
#
# Source: LASA137_varinfo.pdf (28-Jun-2012)

#' Apply LASA137 (Valuation of late life) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the valuation-of-late-life items documented in
#' LASA137 for waves E and F.
#'
#' Wave E contains the full 19-item questionnaire. Wave F contains the 12
#' documented items 01, 04, 06, 07, 10, 11, 13, 14, 15, 16, 18, and 19. All
#' use the same agreement scale from strongly agree (1) to strongly disagree
#' (5), plus -1 for no answer. The total and subscale scores shown in the
#' source PDF belong to the separate LASA337 scale-score file and are not
#' handled here.
#'
#' All LASA137 variables are categorical: `to_factor = TRUE` converts them to
#' factors, while `to_numeric` is retained for the shared parameter contract
#' but does not change them. Column matching tries an explicit
#' `name_corrections` override, an exact match, then a case-insensitive exact
#' match. Original SPSS coding is preserved. Standardized naming optionally
#' removes the wave prefix, standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA137 `.sav` file,
#'   for example via [haven::read_sav()]. Wave-E names include `eqvall01`
#'   through `eqvall19`; wave-F names use the `f` prefix for its 12-item
#'   subset.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"E"` or `"F"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (`qvall01` through `qvall19`) to actual
#'   column names in `data`.
#' @param to_factor Logical. If `TRUE`, the categorical valuation items are
#'   converted to factors using the documented response labels.
#' @param to_numeric Logical. Retained for the shared parameter contract.
#'   LASA137 contains no numeric count or continuous variables, so it does not
#'   change the documented items.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with LASA137 variable/value labels, optional factor
#'   conversion and standardized naming, preserved original SPSS coding, the
#'   `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, eqvall01 = c(1, 5), eqvall19 = c(-1, 3))
#' dat <- apply_lasa137_labels(dat, wave = "E", to_factor = TRUE)
#' attr(dat$eqvall01, "labels")
apply_lasa137_labels <- function(data,
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
  if (!wave %in% c("E", "F")) {
    stop("Unknown LASA 137 wave: ", wave, ". Use one of: E, F.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = tolower(wave),
    fn_name = "apply_lasa137_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  descriptors <- c(
    "difficult", "much", "daily basis", "lifeaims", "useful", "important",
    "attain", "plans", "many ways", "problems", "positive", "hopeful",
    "give up", "strong will", "enjoy", "best", "ethical", "make sense",
    "few aims"
  )
  item_numbers <- if (wave == "E") {
    1:19
  } else {
    c(1, 4, 6, 7, 10, 11, 13, 14, 15, 16, 18, 19)
  }
  response_values <- c(
    "no answer" = -1,
    "strongly agree" = 1,
    "agree" = 2,
    "no agreement/disagreement" = 3,
    "disagree" = 4,
    "strongly disagree" = 5
  )

  for (i in item_numbers) {
    engine$label_variable(
      sprintf("qvall%02d", i),
      sprintf("Value of late life %02d: %s", i, descriptors[[i]]),
      response_values,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
