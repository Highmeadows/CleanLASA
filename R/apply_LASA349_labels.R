# Apply LASA 349 (General self-regulation scale scores) SPSS labels
#
# Source: LASA149_varinfo.pdf (18-Apr-2024)

#' Apply LASA349 (General Self-Regulation Scale Scores) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the five constructed General Self-Regulation
#' variables documented in LASA349 for waves G and H.
#'
#' The inventory comprises the total General Self-Regulation score, strategy
#' use and metastrategy-knowledge subscales, an action-and-coping-planning
#' subscale, and a count of missing General Self-Regulation values. The four
#' scores use `-2` for no valid data and have documented low/high endpoints.
#' The missing-value count has no documented value-label map. The 14 source
#' questionnaire items belong to LASA149 and are intentionally outside this
#' function's inventory.
#'
#' All five variables are numeric. With `to_numeric = TRUE`, negative missing
#' codes become `NA`; `to_numeric` therefore takes precedence over
#' `to_factor`. With `to_factor = TRUE` alone, the four value-labelled scores
#' become factors and observed unlabelled interior scores remain numeric-text
#' levels. The unlabelled missing-value count remains numeric.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive match, and (3) a
#' case-insensitive exact match. Variables absent from `data` are recorded as
#' `"not found"` in the matching audit. Original labels and values are
#' preserved, and optional standardized naming removes the wave prefix,
#' standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA349 `.sav` file.
#'   Documented names use a `g` or `h` wave prefix followed by `qgsr`,
#'   `qgsrsu`, `qgsrmk`, `qgsracp`, or `qmisgsr`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"G"` or `"H"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA349 suffixes without the wave prefix to actual column names in
#'   `data`.
#' @param to_factor Logical. If `TRUE`, the four variables carrying documented
#'   value labels are converted to factors. Observed unlabelled scores remain
#'   numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, all five variables are restored to
#'   plain numeric and negative values are replaced by `NA`.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with LASA349 variable/value labels, optional conversion and
#'   standardized naming, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, gqgsr = c(-2, 70), gqmisgsr = c(2, 0))
#' dat <- apply_lasa349_labels(dat, wave = "G", to_numeric = TRUE)
#' attr(dat$gqgsr, "label")
apply_lasa349_labels <- function(data,
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
  valid_waves <- c("G", "H")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 349 wave: ", wave, ". Use one of: G, H.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- tolower(wave)
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa349_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  engine$label_variable(
    "qgsr",
    "general self-regulation scale score",
    c(
      "no valid data" = -2,
      "low (min=14)" = 14,
      "high (max=84)" = 84
    ),
    force_numeric = TRUE
  )
  engine$label_variable(
    "qgsrsu",
    "strategy use GSR-subscale score",
    c(
      "no valid data" = -2,
      "low (min=4)" = 4,
      "high (max=24)" = 24
    ),
    force_numeric = TRUE
  )
  engine$label_variable(
    "qgsrmk",
    "metastrategy-knowledge GSR-subscale score",
    c(
      "no valid data" = -2,
      "low (min=4)" = 4,
      "high (max=24)" = 24
    ),
    force_numeric = TRUE
  )
  engine$label_variable(
    "qgsracp",
    "action and coping planning GSR-subscale score",
    c(
      "no valid data" = -2,
      "low (min=6)" = 6,
      "high (max=36)" = 36
    ),
    force_numeric = TRUE
  )
  engine$label_variable(
    "qmisgsr", "missing values general self-regulation",
    force_numeric = TRUE
  )

  engine$finalize()
}
