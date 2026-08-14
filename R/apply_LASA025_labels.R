# Apply LASA 025 (Depression) SPSS variable and value labels
#
# Source: LASA025_varinfo.pdf (31-May-2023)

#' Apply LASA025 (Depression/CES-D) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 20 Center for Epidemiologic Studies
#' Depression Scale (CES-D) items documented in LASA025. All 13 waves use the
#' same item wording and four response categories; the -2 routing label is
#' expanded to the wave-specific reason-missing variable and LASA225 file.
#'
#' Items 4, 8, 12, and 16 are marked `"positive"` in their variable labels,
#' exactly as in the codebook. The function attaches metadata only and does
#' not reverse-score those items or compute a CES-D total.
#'
#' By default, matched variables remain numeric with their SPSS-style labels.
#' With `to_factor = TRUE`, they become factors using the documented response
#' text; observed unlabelled codes remain numeric-text levels. The items are
#' categorical responses, so `to_numeric` is retained for the common function
#' contract but does not change them.
#'
#' The source PDF also documents LASA225 total scores and reason-missing
#' variables. Those variables are intentionally outside LASA025 and are not
#' changed by this function.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for the selected wave
#' but absent from `data` are left untouched and recorded as `"not found"` in
#' the generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of the parameter contract shared by every
#' `apply_*_labels()` function in this package. Regardless of conversion,
#' every matched column keeps its original SPSS value coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA025 `.sav` file,
#'   for example via [haven::read_sav()], containing wave-prefixed variables
#'   `cesd01` through `cesd20`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA025 suffixes without the wave
#'   prefix (for example `cesd01` or `cesd20`), and values are actual column
#'   names in `data`, for example `c(cesd01 = "bothered_last_week")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level.
#' @param to_numeric Logical. Retained for the common apply-label parameter
#'   contract. LASA025 contains categorical CES-D item responses, not count or
#'   continuous variables, so this argument does not change them.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA025 columns are renamed to their canonical lowercase
#'   suffixes with the wave code removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with their wave prefix removed and a new
#'   `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA025 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa024_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:4,
#'   gcesd01 = c(-2, 0, 1, 3),
#'   gcesd04 = c(-1, 0, 2, 3)
#' )
#' dat <- apply_lasa025_labels(dat, wave = "G")
#' attr(dat$gcesd01, "labels")
apply_lasa025_labels <- function(data,
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
  wave_prefix <- c(
    B = "b", C = "c", D = "d", E = "e", `2B` = "b", F = "f",
    G = "g", H = "h", `3B` = "b", MB = "b", I = "i", J = "j", K = "k"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 025 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  prefix <- unname(wave_prefix[[wave]])

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa025_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  score_file <- if (wave %in% c("2B", "3B", "MB")) {
    paste0("LAS", wave, "225")
  } else {
    paste0("LASA", wave, "225")
  }
  route_label <- paste0(
    "na, see ", toupper(prefix), "RMCESD in ", score_file
  )
  value_labels <- c(
    setNames(-2, route_label),
    "na, asked" = -1,
    "rarely or never" = 0,
    "some of the time" = 1,
    "occasionally" = 2,
    "mostly or always" = 3
  )
  item_labels <- c(
    "1. Last week: bothered",
    "2. Last week: appetite",
    "3. Last week: blues",
    "4. Last week: good: positive",
    "5. Last week: mind",
    "6. Last week: depressed",
    "7. Last week: effort",
    "8. Last week: hopeful: positive",
    "9. Last week: failure",
    "10. Last week: fearful",
    "11. Last week: sleep",
    "12. Last week: happy: positive",
    "13. Last week: talk",
    "14. Last week: lonely",
    "15. Last week: unfriendly",
    "16. Last week: enjoy: positive",
    "17. Last week: cry",
    "18. Last week: sad",
    "19. Last week: dislike",
    "20. Last week: get going"
  )

  for (i in seq_len(20L)) {
    engine$label_variable(
      suffix = sprintf("cesd%02d", i),
      variable_label = item_labels[[i]],
      value_label_map = value_labels,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
