# Apply LASA 020 (Digit Span) SPSS variable and value labels
#
# Source: LASA020_varinfo.pdf (29-Oct-2024)

#' Apply LASA020 (Digit Span) SPSS labels
#'
#' Attaches the SPSS-style variable labels (`attr(x, "label")`) and value
#' labels (`attr(x, "labels")`) documented for the 15 separate Digit Span
#' item scores in LAS3B020. The file contains eight forwards items, covering
#' spans of two through nine numbers, and seven backwards items, covering
#' spans of two through eight numbers. Each item records the number of
#' correct answers across attempts 1 and 2.
#'
#' LASA020 is documented only for wave 3B. By default, matched variables
#' remain numeric with codes -3 through 2 and their SPSS labels attached.
#' With `to_factor = TRUE`, they become factors using the documented labels.
#' With `to_numeric = TRUE`, they become plain numeric counts: negative
#' missing-reason codes become `NA`, while zero, one, two, and any observed
#' non-negative unlabelled value are retained. `to_numeric` takes precedence
#' over `to_factor` for every Digit Span item.
#'
#' The same PDF also documents LAS3B220, which contains total scores and the
#' reason-missing variable. Those variables are intentionally outside
#' LASA020 and are not changed by this function; they belong to
#' `apply_lasa220_labels()`.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive name match, and (3) a
#' case-insensitive exact match. Variables documented for LAS3B020 but absent
#' from `data` are left untouched and recorded as `"not found"` in the
#' generic matching audit.
#'
#' `name_corrections`, `to_factor`, `to_numeric`, `standardize_names`, and
#' `split_wavecode` are part of the parameter contract shared by every
#' `apply_*_labels()` function in this package. Regardless of conversion,
#' every matched column keeps its original SPSS value coding in
#' `attr(x, "original_labels")` and `attr(x, "original_values")`. The
#' `"respnr"` column is matched in any capitalization and, when
#' `standardize_names = TRUE`, renamed to `"respnr"`.
#'
#' @param data A data frame or tibble imported from a LAS3B020 `.sav` file,
#'   for example via [haven::read_sav()]. Expected names are `bDSf01` through
#'   `bDSf08` and `bDSb01` through `bDSb07`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. LASA020 is documented only for `"3B"`.
#' @param name_corrections Optional named character vector for explicit column
#'   name overrides. Names are canonical LASA020 suffixes without the `b`
#'   wave prefix (for example `DSf01` or `DSb07`), and values are actual
#'   column names in `data`, for example `c(DSf01 = "forward_span_2")`.
#' @param to_factor Logical. If `FALSE` (default), matched items remain
#'   numeric with SPSS-style value-label attributes. If `TRUE`, they are
#'   converted to factors using the documented correctness and missing-value
#'   labels. An observed unlabelled code is retained as a numeric-text level.
#' @param to_numeric Logical. If `FALSE` (default), matched items retain their
#'   SPSS-style labels. If `TRUE`, they are restored to ordinary numeric,
#'   negative missing-reason codes become `NA`, and non-negative scores are
#'   retained. This takes precedence over `to_factor`.
#' @param standardize_names Logical. If `FALSE` (default), source column names
#'   are retained except for renaming requested through `split_wavecode`. If
#'   `TRUE`, matched LASA020 columns are renamed to their canonical lowercase
#'   suffixes with the wave code removed; `"respnr"` is standardized; and
#'   `split_wavecode` is always treated as `TRUE`.
#' @param split_wavecode Logical. If `FALSE` (default) and
#'   `standardize_names = FALSE`, no wave-code splitting occurs. If `TRUE`,
#'   matched columns are renamed with their `b` prefix removed and a new
#'   `"LASA_wave"` column filled with `"3B"` is inserted immediately after
#'   the respondent-number column. It is always treated as `TRUE` when
#'   `standardize_names = TRUE`.
#'
#' @return `data`, with variable/value-label attributes attached to every
#'   matched LASA020 column, optional factor/numeric conversion and canonical
#'   renaming, and `original_labels`/`original_values` attributes preserving
#'   the original SPSS coding. A `"LASA_wave"` column is added when requested.
#'   The generic name-matching audit is attached as `attr(data,
#'   "label_report")` and can be retrieved with [lasa_label_report()].
#'
#' @seealso [apply_lasa019_labels()], [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(
#'   RespNr = 1:4,
#'   bDSf01 = c(-3, 0, 1, 2),
#'   bDSb01 = c(-2, -1, 1, 2)
#' )
#' dat <- apply_lasa020_labels(dat, wave = "3B")
#' attr(dat$bDSf01, "label")
#' attr(dat$bDSf01, "labels")
#'
#' numeric_dat <- apply_lasa020_labels(
#'   dat, wave = "3B", to_numeric = TRUE,
#'   standardize_names = TRUE
#' )
#' numeric_dat$dsf01
apply_lasa020_labels <- function(data,
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
  if (wave != "3B") {
    stop("Unknown LASA 020 wave: ", wave, ". Use: 3B.", call. = FALSE)
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
    fn_name = "apply_lasa020_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  value_labels <- c(
    "na, see BRMDS" = -3,
    "na, previous answers incorrect" = -2,
    "test broken off" = -1,
    "0 correct" = 0,
    "1 correct" = 1,
    "2 correct" = 2
  )

  forwards <- data.frame(
    suffix = sprintf("DSf%02d", 1:8),
    span = 2:9,
    stringsAsFactors = FALSE
  )
  backwards <- data.frame(
    suffix = sprintf("DSb%02d", 1:7),
    span = 2:8,
    stringsAsFactors = FALSE
  )

  for (i in seq_len(nrow(forwards))) {
    engine$label_variable(
      suffix = forwards$suffix[[i]],
      variable_label = paste0(
        "Digit Span forwards: ", forwards$span[[i]],
        " numbers, attempt 1+2"
      ),
      value_label_map = value_labels,
      force_numeric = TRUE
    )
  }

  for (i in seq_len(nrow(backwards))) {
    engine$label_variable(
      suffix = backwards$suffix[[i]],
      variable_label = paste0(
        "Digit Span backwards: ", backwards$span[[i]],
        " numbers, attempt 1+2"
      ),
      value_label_map = value_labels,
      force_numeric = TRUE
    )
  }

  engine$finalize()
}
