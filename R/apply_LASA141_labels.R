# Apply LASA 141 (Need for affiliation) SPSS variable and value labels
#
# Source: LASA141_varinfo.pdf (29-Sep-2017)

#' Apply LASA141 (Need for affiliation) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the six need-for-affiliation questionnaire items
#' documented in LASA141 for waves 2B and G.
#'
#' The inventory consists of items 1, 4, 6, 8, 9, and 10. Each uses no answer
#' (-1), no (1), more-or-less (2), and yes (3). The constructed six-item score
#' shown in the same source PDF belongs to the separate LASA341 file and is
#' intentionally not labelled here. The PDF also cross-references LASA078,
#' which remains a separate filecode.
#'
#' All LASA141 items are categorical. `to_factor = TRUE` converts them to
#' factors and preserves observed unlabelled codes as numeric-text levels;
#' `to_numeric` is retained for the shared parameter contract but does not
#' change them. Column matching tries an explicit `name_corrections` override,
#' an exact match, then a case-insensitive exact match. Standardized naming
#' optionally removes the `b` or `g` prefix, standardizes `respnr`, and adds
#' `LASA_wave`, while preserving original SPSS labels and values.
#'
#' @param data A data frame or tibble imported from a LAS2B141 or LASAG141
#'   `.sav` file, for example via [haven::read_sav()]. Names are `bqan1`,
#'   `bqan4`, `bqan6`, `bqan8`, `bqan9`, and `bqan10` in 2B, with the
#'   corresponding `g` prefix in wave G.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"2B"` or `"G"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (`qan1`, `qan4`, `qan6`, `qan8`, `qan9`,
#'   or `qan10`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, the categorical affiliation items are
#'   converted to factors using the documented response labels.
#' @param to_numeric Logical. Retained for the shared parameter contract.
#'   LASA141 contains no numeric count or continuous variables, so it does not
#'   change the documented items.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with LASA141 variable/value labels, optional factor
#'   conversion and standardized naming, preserved original SPSS coding, the
#'   `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, bqan1 = c(1, 3), bqan10 = c(-1, 2))
#' dat <- apply_lasa141_labels(dat, wave = "2B", to_factor = TRUE)
#' attr(dat$bqan1, "labels")
apply_lasa141_labels <- function(data,
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
  if (!wave %in% c("2B", "G")) {
    stop("Unknown LASA 141 wave: ", wave, ". Use one of: 2B, G.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = if (wave == "2B") "b" else "g",
    fn_name = "apply_lasa141_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  item_numbers <- c(1, 4, 6, 8, 9, 10)
  item_labels <- c(
    "want to talk about feelings",
    "when in trouble I need support",
    "cope with sorrows on my own",
    "go to others when something bothers me",
    "my feelings are my own business",
    "when difficulties, like to lean on someone"
  )
  response_values <- c(
    "no answer" = -1, "no" = 1, "more-or-less" = 2, "yes" = 3
  )

  for (i in seq_along(item_numbers)) {
    engine$label_variable(
      paste0("qan", item_numbers[[i]]),
      item_labels[[i]],
      response_values,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
