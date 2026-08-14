# Apply LASA 024 (Evaluation Raven) SPSS variable and value labels
#
# Source: LASA024_varinfo.pdf (14-Aug-2014)

#' Apply LASA024 (Evaluation Raven) SPSS labels
#'
#' Attaches the SPSS-style variable labels (`attr(x, "label")`) and value
#' labels (`attr(x, "labels")`) documented for the three LASAB024 Raven
#' evaluation variables. The variables assess relaxation during the test,
#' present capability, and expected future capability. They share the same
#' missing-response codes but use three distinct substantive five-point
#' scales.
#'
#' LASA024 is documented only for wave B. By default, matched variables remain
#' numeric with their SPSS-style labels. With `to_factor = TRUE`, they become
#' factors using the documented response text; observed unlabelled codes
#' remain numeric-text levels. The variables are categorical evaluations, so
#' `to_numeric` is retained for the common function contract but does not
#' change them.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables absent from `data` are left
#' untouched and recorded as `"not found"` in the generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of the parameter contract shared by every
#' `apply_*_labels()` function in this package. Regardless of conversion,
#' every matched column keeps its original SPSS value coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LASAB024 `.sav` file,
#'   for example via [haven::read_sav()], containing some or all of `bmecog1`,
#'   `bmecog2`, and `bmecog3`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. LASA024 is documented only for `"B"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA024 suffixes without the `b`
#'   prefix (`mecog1`, `mecog2`, or `mecog3`), and values are actual column
#'   names in `data`, for example `c(mecog1 = "raven_relaxation")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level.
#' @param to_numeric Logical. Retained for the common apply-label parameter
#'   contract. LASA024 contains no count or continuous variables, so this
#'   argument does not change the documented categorical variables.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA024 columns are renamed to their canonical lowercase
#'   suffixes with the `b` prefix removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with the `b` prefix removed and a new
#'   `"LASA_wave"` column filled with `"B"` is inserted immediately after the
#'   respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA024 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa023_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   bmecog1 = c(-5, 1, 5),
#'   bmecog2 = c(-1, 3, 5),
#'   bmecog3 = c(0, 2, 4)
#' )
#' dat <- apply_lasa024_labels(dat, wave = "B")
#' attr(dat$bmecog1, "labels")
apply_lasa024_labels <- function(data,
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
  if (wave != "B") {
    stop("Unknown LASA 024 wave: ", wave, ". Use: B.", call. = FALSE)
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
    fn_name = "apply_lasa024_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  common_missing <- c(
    "interview broken off" = -5,
    "no answer, short version" = -4,
    "asked, no answer" = -1,
    "no answer" = 0
  )
  specs <- list(
    list(
      suffix = "mecog1",
      variable_label = "Evaluation Raven test: relaxation",
      value_label_map = c(
        common_missing,
        "very tense" = 1,
        "tensed" = 2,
        "not tense, not relaxed" = 3,
        "relaxed" = 4,
        "very relaxed" = 5
      )
    ),
    list(
      suffix = "mecog2",
      variable_label = "Present capability raven test",
      value_label_map = c(
        common_missing,
        "very bad" = 1,
        "bad" = 2,
        "fair" = 3,
        "good" = 4,
        "very good" = 5
      )
    ),
    list(
      suffix = "mecog3",
      variable_label = "Future capability raven test: better",
      value_label_map = c(
        common_missing,
        "no, certain" = 1,
        "no probably" = 2,
        "maybe yes/no" = 3,
        "yes, probably" = 4,
        "yes, certain" = 5
      )
    )
  )

  for (item in specs) {
    engine$label_variable(
      suffix = item$suffix,
      variable_label = item$variable_label,
      value_label_map = item$value_label_map,
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
