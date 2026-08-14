# Apply LASA 026 (Anxiety) SPSS variable and value labels
#
# Source: LASA026_varinfo.pdf (13-Jul-2020)

#' Apply LASA026 (Anxiety/HADS-A) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the seven anxiety items documented in LASA026.
#' Wave B additionally contains `banxmv`, the number of missing item values.
#' Wave MB uses medical-interview names (`bmanxiet1` through `bmanxiet7`);
#' the other documented waves use the `anxiet` suffix.
#'
#' All anxiety items use the same four response categories and a -2 routing
#' label referring to the wave-specific reason-missing variable in LASA226.
#' Item 4 is marked `"positive"` in its variable label exactly as printed.
#' The function attaches metadata only and does not reverse-score the item or
#' compute a total anxiety score.
#'
#' By default, matched variables remain numeric with their SPSS-style labels.
#' With `to_factor = TRUE`, they become factors using the documented response
#' text; observed unlabelled codes remain numeric-text levels. `banxmv` is a
#' count: with `to_numeric = TRUE`, its negative missing-reason codes become
#' `NA` and non-negative counts are retained. The seven anxiety items remain
#' categorical, and numeric conversion takes precedence over factor
#' conversion for `banxmv`.
#'
#' The source PDF documents waves B, C, D, E, F, G, H, 3B, MB, I, and J. It
#' does not contain variable tables for wave 2B or K. The PDF also documents
#' LASA226 scale scores and reason-missing variables; those are intentionally
#' outside LASA026 and are not changed by this function.
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
#' @param data A data frame or tibble imported from a LASA026 `.sav` file,
#'   for example via [haven::read_sav()]. Expected names include `banxiet1`,
#'   `ganxiet7`, `bmanxiet1`, and wave-B-only `banxmv`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"F"`, `"G"`,
#'   `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA026 suffixes without the wave
#'   prefix (for example `anxiet1`, `manxiet7`, or `anxmv`), and values are
#'   actual column names in `data`, for example
#'   `c(anxiet1 = "tense_last_week")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level. `banxmv` is
#'   also factored unless `to_numeric = TRUE`.
#' @param to_numeric Logical. If `FALSE` (default), wave-B `banxmv` retains its
#'   SPSS-style missing-code labels. If `TRUE`, it becomes ordinary numeric,
#'   negative missing-reason codes become `NA`, and non-negative counts are
#'   retained. Anxiety items remain categorical. This takes precedence over
#'   `to_factor` for `banxmv`.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA026 columns are renamed to their canonical lowercase
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
#'   matched LASA026 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa025_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:4,
#'   ganxiet1 = c(-2, 0, 1, 3),
#'   ganxiet4 = c(-1, 0, 2, 3)
#' )
#' dat <- apply_lasa026_labels(dat, wave = "G")
#' attr(dat$ganxiet1, "labels")
apply_lasa026_labels <- function(data,
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
    B = "b", C = "c", D = "d", E = "e", F = "f", G = "g",
    H = "h", `3B` = "b", MB = "b", I = "i", J = "j"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 026 wave: ", wave,
      ". Use one of: ", paste(names(wave_prefix), collapse = ", "), ".",
      call. = FALSE
    )
  }

  prefix <- unname(wave_prefix[[wave]])
  item_stem <- if (wave == "MB") "manxiet" else "anxiet"

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa026_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  score_file <- if (wave %in% c("3B", "MB")) {
    paste0("LAS", wave, "226")
  } else {
    paste0("LASA", wave, "226")
  }
  route_label <- if (wave == "MB") {
    "na, see bmrmanx in LASMB226"
  } else {
    paste0("na, see ", toupper(prefix), "RMANX in ", score_file)
  }
  value_labels <- c(
    setNames(-2, route_label),
    "na, asked" = -1,
    "rarely or never" = 0,
    "some of the time" = 1,
    "occasionally" = 2,
    "mostly or always" = 3
  )
  item_labels <- c(
    "1. Lately: feel tense or wound up",
    "2. Lately: frightened feeling",
    "3. Lately: worrying thoughts",
    "4. Lately: I feel relaxed: positive",
    "5. Lately: frightened in stomach",
    "6. Lately: feel restless",
    "7. Lately: sudden feelings of panic"
  )

  for (i in seq_len(7L)) {
    engine$label_variable(
      suffix = paste0(item_stem, i),
      variable_label = item_labels[[i]],
      value_label_map = value_labels,
      force_numeric = FALSE
    )
  }

  if (wave == "B") {
    engine$label_variable(
      suffix = "anxmv",
      variable_label = "number of missing values (max 7)",
      value_label_map = c(
        "no valid data" = -6,
        "interview broken off" = -5,
        "no answer, short version" = -4
      ),
      force_numeric = TRUE
    )
  }

  engine$finalize()
}
