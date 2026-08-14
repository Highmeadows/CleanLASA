# Apply LASA 105 (religious coping) SPSS labels
#
# Source: LASA105_varinfo.pdf (10-Dec-2020)

#' Apply LASA105 (Religious coping) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the three religious-coping items documented in
#' LASA105 for waves 3B and MB.
#'
#' Both waves assess turning to God in a crisis, confessing sins and asking
#' forgiveness, and feeling abandoned by God. Wave 3B uses suffixes `qrco03`,
#' `qrco05`, and `qrco07`; MB uses `rco03`, `rco05`, and `rco07`. The response
#' map is identical in both waves and ranges from never to very often, with
#' separate negative codes for a short interview and an item not asked.
#'
#' All LASA105 variables are categorical. Therefore `to_numeric` is accepted
#' for the shared interface but does not convert them. With
#' `to_factor = TRUE`, matched fields become factors and observed unlabelled
#' codes remain numeric-text levels.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive name, then a case-insensitive exact name. Every matched
#' column preserves its original coding in `original_labels` and
#' `original_values`. Requested standardization removes the leading `b`,
#' standardizes `respnr`, and inserts `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA105 `.sav` file.
#'   Names are `bqrco03`, `bqrco05`, and `bqrco07` in 3B, or `brco03`,
#'   `brco05`, and `brco07` in MB.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"3B"` or `"MB"`.
#' @param name_corrections Optional named character vector mapping the
#'   wave-specific canonical suffixes without the `b` prefix (`qrco03`,
#'   `qrco05`, `qrco07`, `rco03`, `rco05`, or `rco07`) to actual column names
#'   in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels; observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA105 has
#'   no variables eligible for numeric conversion.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes, `respnr` is standardized, and
#'   `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, the leading `b` is removed from
#'   matched names and `LASA_wave` is inserted immediately after the
#'   respondent-number column.
#'
#' @return `data`, with LASA105 labels, optional factor conversion and name
#'   standardization, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(bqrco03 = c(-2, 1, 4), bqrco07 = c(1, 2, 3))
#' dat <- apply_lasa105_labels(dat, wave = "3B")
#' attr(dat$bqrco03, "labels")
apply_lasa105_labels <- function(data,
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
  if (!wave %in% c("3B", "MB")) {
    stop(
      "Unknown LASA 105 wave: ", wave, ". Use one of: 3B, MB.",
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
    prefix = "b",
    fn_name = "apply_lasa105_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  response <- c(
    "na, short interview" = -2,
    "na, asked" = -1,
    "never" = 1,
    "sometimes" = 2,
    "regularly" = 3,
    "very often" = 4
  )
  suffix_stem <- if (wave == "3B") "qrco" else "rco"
  item_labels <- c(
    `03` = "Religious coping 03: in crisis turn to God",
    `05` = "Religious coping 05: confess sins and ask forgiveness",
    `07` = "Religious coping 07: God abandoned me"
  )

  for (item in names(item_labels)) {
    engine$label_variable(
      paste0(suffix_stem, item), unname(item_labels[[item]]), response,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
