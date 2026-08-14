# Apply LASA 023 (Everyday memory) SPSS variable and value labels
#
# Source: LASA023_varinfo.pdf (27-Mar-2014)

#' Apply LASA023 (Everyday memory) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the everyday-memory variables documented in
#' LASA023. Wave B contains eight task/observation variables plus the
#' unprefixed `ndays` interview-day variable. Wave F contains only the
#' handedness observation, with a different coding scheme.
#'
#' The codebook spells wave B's interview-day column `ndays`, without the
#' otherwise consistent `b` wave prefix. The function recognizes that exact
#' spelling, in any capitalization, automatically. An explicit `ndays`
#' entry in `name_corrections` still has priority, and a source column named
#' `bndays` can also be matched through the ordinary shared rules.
#'
#' By default, matched variables remain numeric with their SPSS-style labels.
#' With `to_factor = TRUE`, they become factors using the documented label
#' text; observed unlabelled codes remain numeric-text levels. All LASA023
#' variables are categorical task results or observations, so `to_numeric`
#' is retained for the common function contract but does not change them.
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
#' @param data A data frame or tibble imported from a LASA023 `.sav` file,
#'   for example via [haven::read_sav()]. Wave-B names are `bevmem01` through
#'   `bevmem08` and `ndays`; wave F contains `fevmem08`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. LASA023 is documented for `"B"` and `"F"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA023 suffixes without the wave
#'   prefix (for example `evmem01`, `ndays`, or `evmem08`), and values are
#'   actual column names in `data`, for example
#'   `c(evmem01 = "pencil_choice")`.
#' @param to_factor Logical. If `FALSE` (default), categorical variables
#'   remain numeric with SPSS-style value-label attributes. If `TRUE`, they
#'   are converted to factors using their documented labels. An observed
#'   value without a label remains a numeric-text factor level.
#' @param to_numeric Logical. Retained for the common apply-label parameter
#'   contract. LASA023 contains no count or continuous variables, so this
#'   argument does not change the documented categorical variables.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA023 columns are renamed to their canonical lowercase
#'   suffixes; `"respnr"` is standardized; and `split_wavecode` is always
#'   treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   wave-prefixed matched columns are renamed with the prefix removed,
#'   `ndays` retains its already-unprefixed canonical name, and a new
#'   `"LASA_wave"` column filled with `wave` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA023 column, optional factor conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa022_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:3,
#'   bevmem01 = c(-5, 0, 2),
#'   ndays = c(-5, 0, 2),
#'   bevmem08 = c(-1, 1, 2)
#' )
#' dat <- apply_lasa023_labels(dat, wave = "B")
#' attr(dat$bevmem01, "labels")
#' attr(dat$ndays, "label")
apply_lasa023_labels <- function(data,
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
  if (!wave %in% c("B", "F")) {
    stop("Unknown LASA 023 wave: ", wave, ". Use one of: B, F.", call. = FALSE)
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  if (wave == "B") {
    correction_keys <- if (is.null(name_corrections)) {
      character(0)
    } else {
      tolower(names(name_corrections))
    }
    ndays_idx <- match("ndays", tolower(names(data)))
    prefixed_idx <- match("bndays", tolower(names(data)))
    if (
      !"ndays" %in% correction_keys &&
        !is.na(ndays_idx) &&
        is.na(prefixed_idx)
    ) {
      name_corrections <- c(
        name_corrections,
        ndays = names(data)[[ndays_idx]]
      )
    }
  }

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = tolower(wave),
    fn_name = "apply_lasa023_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  spec <- function(suffix, variable_label, value_label_map) {
    list(
      suffix = suffix,
      variable_label = variable_label,
      value_label_map = value_label_map
    )
  }

  if (wave == "B") {
    common_missing <- c("na, various reasons" = -5, "na, asked" = -1)
    asked_question_labels <- c(
      common_missing,
      "not asked" = 1,
      "asked" = 2,
      "cannot remember" = 3
    )
    specs <- list(
      spec(
        "evmem01", "Everyday memory 01: choice pencil",
        c(
          common_missing,
          "wrong" = 0,
          "right corrected" = 1,
          "right" = 2
        )
      ),
      spec(
        "evmem02", "Everyday memory 02: recognition photo",
        c(
          common_missing,
          "wrong" = 0,
          "right (partial)" = 1,
          "right" = 2
        )
      ),
      spec(
        "evmem03", "Everyday memory 03: object",
        c(
          common_missing,
          "wrong" = 0,
          "partially right" = 1,
          "right" = 2
        )
      ),
      spec(
        "ndays", "day of interviewing",
        c(
          "na, various reasons" = -5,
          "one day" = 0,
          "two days" = 1,
          "three days" = 2
        )
      ),
      spec("evmem04", "Q about diabetes asked?", asked_question_labels),
      spec("evmem05", "Q about raising arm asked?", asked_question_labels),
      spec(
        "evmem06", "Q about occupation father asked?",
        asked_question_labels
      ),
      spec("evmem07", "Q about emotions asked?", asked_question_labels),
      spec(
        "evmem08", "Respondent left/right handed",
        c(
          common_missing,
          "left handed" = 1,
          "right handed" = 2,
          "left handed but right hand" = 3
        )
      )
    )
  } else {
    specs <- list(
      spec(
        "evmem08", "Respondent left/right handed",
        c(
          "na, interview terminated" = -3,
          "no observation" = -1,
          "R writes left handed" = 1,
          "R writes right handed" = 2,
          "R cannot write / other remark" = 3
        )
      )
    )
  }

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
