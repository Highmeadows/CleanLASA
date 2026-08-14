# Apply LASA 136 (Worrying) SPSS variable and value labels
#
# Source: LASA136_varinfo.pdf (04-Oct-2012)

#' Apply LASA136 (Worrying) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 16 Penn State Worry Questionnaire items
#' documented in LASAE136.
#'
#' All items use the same five-level response scale from "not at all
#' characteristic" to "very characteristic", plus -1 for no answer. The
#' worry-scale score shown in the source PDF belongs to the separate LASA336
#' scale-score file and is intentionally outside this function.
#'
#' LASA136 is documented only for wave E. Its 16 variables are categorical;
#' consequently `to_factor = TRUE` converts them to factors, whereas
#' `to_numeric` is retained for the common parameter contract but does not
#' change them. Observed unlabelled codes remain numeric-text factor levels.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive match, then a case-insensitive exact match. Absent variables
#' are reported as `"not found"`. Original labels and values are preserved,
#' and optional standardized naming removes the `e` prefix, standardizes
#' `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASAE136 `.sav` file,
#'   for example via [haven::read_sav()], containing any of `eqworr01` through
#'   `eqworr16`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. LASA136 is documented only for `"E"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (`qworr01` through `qworr16`) to actual
#'   column names in `data`.
#' @param to_factor Logical. If `TRUE`, the categorical worry items are
#'   converted to factors using the documented response labels.
#' @param to_numeric Logical. Retained for the shared parameter contract.
#'   LASA136 contains no numeric count or continuous variables, so it does not
#'   change the documented items.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing `"E"` is inserted
#'   immediately after the respondent-number column.
#'
#' @return `data`, with LASA136 variable/value labels, optional factor
#'   conversion and standardized naming, preserved original SPSS coding, the
#'   `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, eqworr01 = c(1, 5), eqworr16 = c(-1, 3))
#' dat <- apply_lasa136_labels(dat, wave = "E", to_factor = TRUE)
#' attr(dat$eqworr01, "label")
apply_lasa136_labels <- function(data,
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
  if (wave != "E") {
    stop("Unknown LASA 136 wave: ", wave, ". Use: E.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = "e",
    fn_name = "apply_lasa136_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  item_labels <- c(
    "Worry 01: not enough time",
    "Worry 02: overpower",
    "Worry 03: no tendency to worry",
    "Worry 04: situations trigger",
    "Worry 05: cannot help it",
    "Worry 06: under pressure",
    "Worry 07: all the time",
    "Worry 08: overcome easy",
    "Worry 09: tasks ahead",
    "Worry 10: never",
    "Worry 11: no influence",
    "Worry 12: all my life",
    "Worry 13: notice it",
    "Worry 14: cannot stop",
    "Worry 15: constantly",
    "Worry 16: when finished"
  )
  worry_values <- c(
    "no answer" = -1,
    "not at all characteristic" = 1,
    "not characteristic" = 2,
    "somewhat characteristic" = 3,
    "characteristic" = 4,
    "very characteristic" = 5
  )

  for (i in seq_along(item_labels)) {
    engine$label_variable(
      sprintf("qworr%02d", i),
      item_labels[[i]],
      worry_values,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
