# Apply LASA 032 (Preference for source of care) SPSS labels
#
# Source: LASA032_varinfo.pdf (29-May-2012)

#' Apply LASA032 (Preference for source of care) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the 12 paired care-preference choices documented
#' in LASAB032. Items 1--6 ask who should organize help or where the respondent
#' would move for health reasons. Items 7--12 ask where the respondent would
#' choose to live again. Each item retains its own two substantive choices.
#'
#' LASA032 is documented only for wave B. Items 1 and 7 contain the full
#' technical/interview/short-version routing blocks and refer to different
#' `BHINDEP` conditions. Their following items use the documented -3 wrong-skip
#' code and refer back to `BPREFE01` or `BPREFE07` at -2.
#'
#' By default, matched variables remain numeric with their SPSS-style labels.
#' With `to_factor = TRUE`, they become factors using the documented response
#' text; observed unlabelled codes remain numeric-text levels. All LASA032
#' variables are categorical paired choices, so `to_numeric` is retained for
#' the common function contract but does not change them.
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
#' @param data A data frame or tibble imported from a LASAB032 `.sav` file,
#'   for example via [haven::read_sav()], containing some or all of `bprefe01`
#'   through `bprefe12`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. LASA032 is documented only for `"B"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA032 suffixes without the `b`
#'   prefix (for example `prefe01` or `prefe12`), and values are actual column
#'   names in `data`, for example `c(prefe01 = "organize_help")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level.
#' @param to_numeric Logical. Retained for the common apply-label parameter
#'   contract. LASA032 contains no count or continuous variables, so this
#'   argument does not change the documented categorical choices.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA032 columns are renamed to their canonical lowercase
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
#'   matched LASA032 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa031_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   bprefe01 = c(-2, 1, 2),
#'   bprefe07 = c(-1, 1, 2),
#'   bprefe12 = c(-3, 1, 2)
#' )
#' dat <- apply_lasa032_labels(dat, wave = "B")
#' attr(dat$bprefe01, "labels")
apply_lasa032_labels <- function(data,
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
    stop("Unknown LASA 032 wave: ", wave, ". Use: B.", call. = FALSE)
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
    fn_name = "apply_lasa032_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  first_block <- c(
    "na, technical reason" = -6,
    "na, interview terminated" = -5,
    "na, short interview" = -4,
    "na, wrong skip" = -3,
    "na, BHINDEP<>1" = -2,
    "na, asked" = -1
  )
  first_followup <- c(
    "na, wrong skip" = -3,
    "na, see BPREFE01" = -2,
    "na, asked" = -1
  )
  second_block <- c(
    "na, technical reason" = -6,
    "na, interview terminated" = -5,
    "na, short interview" = -4,
    "na, wrong skip" = -3,
    "na, BHINDEP<>2,3,4" = -2,
    "na, asked" = -1
  )
  second_followup <- c(
    "na, wrong skip" = -3,
    "na, see BPREFE07" = -2,
    "na, asked" = -1
  )

  variable_labels <- c(
    "When I need help, I want to organize it",
    "When move because health I want move to",
    "When I need help, I want to organize it",
    "When move because health I want move to",
    "When I need help, I want to organize it",
    "When move because health I want move to",
    rep("When could choose again I would live at", 6L)
  )
  substantive_labels <- list(
    c("myself" = 1, "by the family doctor" = 2),
    c("family" = 1, "residential home" = 2),
    c("by family doctor" = 1, "by children" = 2),
    c("residential home" = 1, "old peoples home (with service)" = 2),
    c("myself" = 1, "by children" = 2),
    c("family" = 1, "old peoples home (with service)" = 2),
    c("home" = 1, "residential home" = 2),
    c("home" = 1, "family" = 2),
    c("nursing home" = 1, "home" = 2),
    c("family" = 1, "nursing home" = 2),
    c("residential home" = 1, "nursing home" = 2),
    c("residential home" = 1, "family" = 2)
  )

  for (i in seq_len(12L)) {
    missing_labels <- if (i == 1L) {
      first_block
    } else if (i <= 6L) {
      first_followup
    } else if (i == 7L) {
      second_block
    } else {
      second_followup
    }
    engine$label_variable(
      suffix = sprintf("prefe%02d", i),
      variable_label = variable_labels[[i]],
      value_label_map = c(missing_labels, substantive_labels[[i]]),
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
