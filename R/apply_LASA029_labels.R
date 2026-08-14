# Apply LASA 029 (Meta-emotion) SPSS variable and value labels
#
# Source: LASA029_varinfo.pdf (10-Apr-2014)

#' Apply LASA029 (Meta-emotion) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the four meta-emotion items and reason-missing
#' variable documented in LASAB029. Each item uses its own four-level response
#' wording and refers to `brmmeemo` for the -2 routing code.
#'
#' LASA029 is documented only for wave B. By default, matched variables remain
#' numeric with their SPSS-style labels. With `to_factor = TRUE`, they become
#' factors using the documented response text; observed unlabelled codes
#' remain numeric-text levels. All five variables are categorical, so
#' `to_numeric` is retained for the common function contract but does not
#' change them.
#'
#' The same source PDF also documents the self-administered LAS2B143 version,
#' whose variable names and some labels differ. Those filecode-143 variables
#' are intentionally outside LASA029 and are not changed by this function.
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
#' @param data A data frame or tibble imported from a LASAB029 `.sav` file,
#'   for example via [haven::read_sav()], containing `bmetaem1` through
#'   `bmetaem4` and/or `brmmeemo`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. LASA029 is documented only for `"B"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA029 suffixes without the `b`
#'   prefix (`metaem1` through `metaem4`, or `rmmeemo`), and values are actual
#'   column names in `data`, for example `c(metaem1 = "emotional_item")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level.
#' @param to_numeric Logical. Retained for the common apply-label parameter
#'   contract. LASA029 contains no count or continuous variables, so this
#'   argument does not change the documented categorical variables.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA029 columns are renamed to their canonical lowercase
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
#'   matched LASA029 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa028_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:4,
#'   bmetaem1 = c(-2, 1, 3, 4),
#'   bmetaem3 = c(-1, 1, 2, 4),
#'   brmmeemo = c(-2, 1, 2, 5)
#' )
#' dat <- apply_lasa029_labels(dat, wave = "B")
#' attr(dat$bmetaem1, "labels")
apply_lasa029_labels <- function(data,
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
    stop("Unknown LASA 029 wave: ", wave, ". Use: B.", call. = FALSE)
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
    fn_name = "apply_lasa029_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  common_missing <- c(
    "na, see BRMMEEMO" = -2,
    "na, asked" = -1
  )
  specs <- list(
    list(
      suffix = "metaem1",
      variable_label = "Meta emotion item 01: emotional",
      value_label_map = c(
        common_missing,
        "absolutely not emotional" = 1,
        "a little emotional" = 2,
        "fairly emotional" = 3,
        "very emotional" = 4
      )
    ),
    list(
      suffix = "metaem2",
      variable_label = "Meta emotion item 02: feelings",
      value_label_map = c(
        common_missing,
        "very little" = 1,
        "little" = 2,
        "much" = 3,
        "very much" = 4
      )
    ),
    list(
      suffix = "metaem3",
      variable_label = "Meta emotion item 03: satisfied",
      value_label_map = c(
        common_missing,
        "not satisfied at all" = 1,
        "a bit satisfied" = 2,
        "rather satisfied" = 3,
        "very satisfied" = 4
      )
    ),
    list(
      suffix = "metaem4",
      variable_label = "Meta emotion item 04: change",
      value_label_map = c(
        common_missing,
        "rarely or never" = 1,
        "sometimes" = 2,
        "often" = 3,
        "very often" = 4
      )
    ),
    list(
      suffix = "rmmeemo",
      variable_label = "Reason missing: Meta emotion",
      value_label_map = c(
        "not missing" = -2,
        "short interview" = 1,
        "interview terminated" = 2,
        "no valid data" = 5
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
