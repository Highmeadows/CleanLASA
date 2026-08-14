# Apply LASA 036 (Self-perceived health) SPSS variable and value labels
#
# Source: LASA036_varinfo.pdf (08-Aug-2023)

#' Apply LASA036 (Self-perceived health) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the two or three self-perceived-health variables
#' documented in LASA036. Twelve waves are supported; the PDF does not
#' document a wave-MB file.
#'
#' Every supported wave contains current self-perceived health and health
#' compared with age peers. Wave 2B additionally asks for a comparison with
#' ten years ago. Waves F through K instead contain a retrospective health
#' rating for three (or four) years ago. The age-peer category at code 3 is
#' printed as `"do not know/just as good"` through wave 3B and as
#' `"do not know/just as good as other"` from wave F onward; this wording
#' difference is retained.
#'
#' All LASA036 variables are categorical. Consequently, `to_numeric` is
#' accepted for consistency with the shared apply-labels interface but does
#' not convert these variables. With `to_factor = TRUE`, matched variables
#' become factors and observed unlabelled codes remain numeric-text levels.
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
#' every matched column keeps its original SPSS coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASA036 `.sav` file,
#'   for example via [haven::read_sav()]. Names include `bsubhea1`,
#'   `bsubhea3`, and `ksubhea4`, depending on `wave`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA036 suffixes without the wave
#'   prefix (`subhea1`, `subhea2`, `subhea3`, or `subhea4`), and values are
#'   actual column names in `data`, for example
#'   `c(subhea1 = "current_self_rated_health")`.
#' @param to_factor Logical. If `FALSE` (default), variables remain numeric
#'   with SPSS-style value-label attributes. If `TRUE`, they are converted to
#'   factors using the documented labels. An observed value without a label
#'   remains a numeric-text factor level.
#' @param to_numeric Logical. Accepted for interface consistency. LASA036 has
#'   no numeric variables eligible for conversion, so this argument does not
#'   alter matched columns.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA036 columns are renamed to their canonical lowercase
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
#'   matched LASA036 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa035_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   fsubhea1 = c(-5, 1, 5),
#'   fsubhea2 = c(-1, 2, 4),
#'   fsubhea4 = c(-1, 3, 5)
#' )
#' dat <- apply_lasa036_labels(dat, wave = "F")
#' attr(dat$fsubhea2, "labels")
apply_lasa036_labels <- function(data,
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
      "Unknown LASA 036 wave: ", wave,
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
    fn_name = "apply_lasa036_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  health <- c(
    "na, interview terminated" = -5,
    "na, asked" = -1,
    "excellent" = 1,
    "good" = 2,
    "fair" = 3,
    "sometimes good/bad" = 4,
    "poor" = 5
  )
  age_peers <- c(
    "na, interview terminated" = -5,
    "na, asked" = -1,
    "much better" = 1,
    "a little better" = 2,
    setNames(
      3,
      if (wave %in% c("F", "G", "H", "I", "J", "K")) {
        "do not know/just as good as other"
      } else {
        "do not know/just as good"
      }
    ),
    "a little worse" = 4,
    "much worse" = 5
  )

  engine$label_variable("subhea1", "Self-perceived health", health)
  engine$label_variable(
    "subhea2", "Self-perceived health compared to age peers", age_peers
  )
  if (wave == "2B") {
    engine$label_variable(
      "subhea3", "Self-perceived health compared to 10 years ago", age_peers
    )
  }
  if (wave %in% c("F", "G", "H", "I", "J", "K")) {
    engine$label_variable(
      "subhea4", "Self-perceived health 3 (or 4) years ago", health
    )
  }

  engine$finalize()
}
