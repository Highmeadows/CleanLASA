# Apply LASA 028 (Perceived self-efficacy) SPSS variable and value labels
#
# Source: LASA028_varinfo.pdf (31-May-2023)

#' Apply LASA028 (Perceived self-efficacy/ALCOS) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 12 ALCOS perceived-self-efficacy items and
#' four missing-value counts documented in LASA028. All 12 waves use the same
#' item wording and five-point agreement scale; the -2 routing metadata is
#' expanded to the wave-specific reason-missing variable and LASA228 file.
#'
#' The source prints the neutral response as
#' `"no disagreement/agreement"` for wave B and
#' `"no disagreement/ agreement"` for later waves. This function preserves
#' that spacing difference exactly.
#'
#' By default, matched variables remain numeric with their SPSS-style labels.
#' With `to_factor = TRUE`, they become factors using the documented response
#' text; observed unlabelled codes remain numeric-text levels. The four
#' missing-value variables are counts: with `to_numeric = TRUE`, their -2
#' missing/routing code becomes `NA` and non-negative counts are retained.
#' ALCOS item responses remain categorical, and numeric conversion takes
#' precedence over factor conversion for the count variables.
#'
#' The source PDF also documents LASA228 constructed scale scores and
#' reason-missing variables. Those variables are intentionally outside
#' LASA028 and are not changed by this function.
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
#' @param data A data frame or tibble imported from a LASA028 `.sav` file,
#'   for example via [haven::read_sav()], containing wave-prefixed `alcos01`
#'   through `alcos12` and up to four missing-count variables.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA028 suffixes without the wave
#'   prefix (for example `alcos01`, `alcmv`, or `compmv`), and values are
#'   actual column names in `data`, for example
#'   `c(alcos01 = "plans_item")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level. Missing-value
#'   counts are also factored unless `to_numeric = TRUE`.
#' @param to_numeric Logical. If `FALSE` (default), the four missing-value
#'   counts retain their SPSS-style missing/routing label. If `TRUE`, they
#'   become ordinary numeric, negative codes become `NA`, and non-negative
#'   counts are retained. ALCOS items remain categorical. This takes
#'   precedence over `to_factor` for count variables.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA028 columns are renamed to their canonical lowercase
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
#'   matched LASA028 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa026_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:4,
#'   galcos01 = c(-2, 1, 3, 5),
#'   galcmv = c(-2, 0, 1, 4)
#' )
#' dat <- apply_lasa028_labels(dat, wave = "G")
#' attr(dat$galcos01, "labels")
apply_lasa028_labels <- function(data,
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
    G = "g", H = "h", `3B` = "b", I = "i", J = "j", K = "k"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 028 wave: ", wave,
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
    fn_name = "apply_lasa028_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  score_file <- if (wave %in% c("2B", "3B")) {
    paste0("LAS", wave, "228")
  } else {
    paste0("LASA", wave, "228")
  }
  route_label <- paste0(
    "na, see ", toupper(prefix), "RMALC in ", score_file
  )
  neutral_label <- if (wave == "B") {
    "no disagreement/agreement"
  } else {
    "no disagreement/ agreement"
  }
  item_value_labels <- c(
    setNames(-2, route_label),
    "na, asked" = -1,
    "strongly disagree" = 1,
    "disagree" = 2,
    setNames(3, neutral_label),
    "agree" = 4,
    "strongly agree" = 5
  )
  item_labels <- c(
    "Alcos item 01: plans",
    "Alcos item 02: failure",
    "Alcos item 03: wrong",
    "Alcos item 04: complicated",
    "Alcos item 05: unpleasant",
    "Alcos item 06: problem solving",
    "Alcos item 07: decision",
    "Alcos item 08: quickly",
    "Alcos item 09: unexpected",
    "Alcos item 10: mistake",
    "Alcos item 11: new things",
    "Alcos item 12: doubt"
  )

  for (i in seq_len(12L)) {
    engine$label_variable(
      suffix = sprintf("alcos%02d", i),
      variable_label = item_labels[[i]],
      value_label_map = item_value_labels,
      force_numeric = FALSE
    )
  }

  count_suffixes <- c("alcmv", "initmv", "advemv", "compmv")
  count_labels <- c(
    "# missing values alcos items",
    "# missing values init-alcos items",
    "# missing values adver-alcos items",
    "# missing values comp-alcos items"
  )
  count_value_labels <- if (wave == "B") {
    setNames(-2, route_label)
  } else {
    c("no valid data" = -2)
  }

  for (i in seq_along(count_suffixes)) {
    engine$label_variable(
      suffix = count_suffixes[[i]],
      variable_label = count_labels[[i]],
      value_label_map = count_value_labels,
      force_numeric = TRUE
    )
  }

  engine$finalize()
}
