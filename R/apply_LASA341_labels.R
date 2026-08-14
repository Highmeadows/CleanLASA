# Apply LASA 341 (Need for affiliation constructed score) SPSS labels
#
# Source: LASA141_varinfo.pdf (29-Sep-2017)

#' Apply LASA341 (Need for Affiliation Score) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the constructed six-item need-for-affiliation
#' score documented in LASA341 for waves 2B and G.
#'
#' LASA341 contains one numeric score, `bqan` in wave 2B and `gqan` in wave
#' G. The documented range runs from low affiliation need (6) to strong
#' affiliation need (18), with `-1` denoting no valid data. The six source
#' questionnaire items belong to LASA141 and are intentionally outside this
#' function's inventory.
#'
#' With `to_numeric = TRUE`, the negative missing code becomes `NA`;
#' `to_numeric` therefore takes precedence over `to_factor`. With
#' `to_factor = TRUE` alone, documented endpoints become factor levels and
#' observed unlabelled interior scores are retained as numeric-text levels.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive match, and (3) a
#' case-insensitive exact match. Variables absent from `data` are recorded as
#' `"not found"` in the matching audit. Original labels and values are
#' preserved, and optional standardized naming removes the wave prefix,
#' standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA341 `.sav` file,
#'   containing `bqan` for wave 2B or `gqan` for wave G.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"2B"` or `"G"`.
#' @param name_corrections Optional named character vector mapping the
#'   canonical LASA341 suffix without the wave prefix (`qan`) to the actual
#'   column name in `data`.
#' @param to_factor Logical. If `TRUE`, the score is converted to a factor.
#'   Observed unlabelled interior scores remain numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, the score is restored to plain
#'   numeric and negative values are replaced by `NA`.
#' @param standardize_names Logical. If `TRUE`, the matched column is renamed
#'   to canonical lowercase `qan`, `respnr` is standardized, and
#'   `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, the matched column has its wave
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with the LASA341 variable/value labels, optional conversion
#'   and standardized naming, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:3, bqan = c(-1, 10, 18))
#' dat <- apply_lasa341_labels(dat, wave = "2B", to_numeric = TRUE)
#' attr(dat$bqan, "label")
apply_lasa341_labels <- function(data,
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
  valid_waves <- c("2B", "G")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 341 wave: ", wave, ". Use one of: 2B, G.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- if (wave == "2B") "b" else "g"
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa341_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  engine$label_variable(
    "qan",
    "need for affiliation <6 items>",
    c(
      "no valid data" = -1,
      "low affiliation need" = 6,
      "strong affiliation need" = 18
    ),
    force_numeric = TRUE
  )

  engine$finalize()
}
