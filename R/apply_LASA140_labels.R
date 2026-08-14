# Apply LASA 140 (Parental data) SPSS variable and value labels
#
# Source: LASA140_varinfo.pdf (10-Jan-2018)

#' Apply LASA140 (Parental data) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the six parental-data variables documented in
#' LASA140 for replenishment waves 2B and 3B.
#'
#' Both waves contain parental church membership, maternal employment and
#' volunteer work during the respondent's youth, parental separation/divorce,
#' and year of separation/divorce. The church-denomination coding differs
#' materially: 2B uses eight substantive categories, whereas 3B uses ten and
#' distinguishes several Reformed and Protestant denominations. Both waves
#' store these variables with the `b` prefix.
#'
#' Church membership and yes/no variables are categorical. The separation
#' year is numeric; with `to_numeric = TRUE`, its documented -2 and -1 missing
#' codes become `NA`. With `to_factor = TRUE`, categorical fields become
#' factors and observed unlabelled codes remain numeric-text levels.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive match, then a case-insensitive exact match. Original SPSS
#' labels and values are preserved. Standardized naming optionally removes
#' the `b` prefix, standardizes `respnr`, and adds the selected `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LAS2B140 or LAS3B140
#'   `.sav` file, for example via [haven::read_sav()], containing any of
#'   `bqmo_ch`, `bqfa_ch`, `bqmo_emp`, `bqmo_vol`, `bqparsep`, or `bqparsey`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"2B"` or `"3B"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the `b` prefix (`qmo_ch`, `qfa_ch`, `qmo_emp`,
#'   `qmo_vol`, `qparsep`, or `qparsey`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, categorical variables with documented
#'   value labels are converted to factors. Observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, the parental separation year is
#'   restored to plain numeric and negative values are replaced by `NA`.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the `b`
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with LASA140 variable/value labels, optional conversion and
#'   standardized naming, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, bqmo_ch = c(1, 5), bqparsey = c(-2, 1990))
#' dat <- apply_lasa140_labels(dat, wave = "2B", to_numeric = TRUE)
#' attr(dat$bqmo_ch, "labels")
apply_lasa140_labels <- function(data,
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
  if (!wave %in% c("2B", "3B")) {
    stop("Unknown LASA 140 wave: ", wave, ". Use one of: 2B, 3B.", call. = FALSE)
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
    fn_name = "apply_lasa140_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  church_values <- if (wave == "2B") {
    c(
      "no answer" = -1,
      "no church member" = 1,
      "Reformed" = 2,
      "Dutch reformed" = 3,
      "small reformed denomination" = 4,
      "Roman-Catholic" = 5,
      "Humanistic society" = 6,
      "Jewish" = 7,
      "other" = 8
    )
  } else {
    c(
      "no answer" = -1,
      "no church member" = 1,
      "Dutch reformed" = 2,
      "Reformed Association within the Dutch Reformed Church" = 3,
      "Reformed churches in the Netherlands (Synodal)" = 4,
      "Other Reformed churches" = 5,
      "Other protestant churches" = 6,
      "Roman-Catholic" = 7,
      "Humanistic society" = 8,
      "Jewish" = 9,
      "other" = 10
    )
  }
  yes_no <- c("no answer" = -1, "no" = 1, "yes" = 2)

  if (wave == "2B") {
    engine$label_variable(
      "qmo_ch", "Mother church member during youth R?", church_values,
      force_numeric = FALSE
    )
    engine$label_variable(
      "qfa_ch", "Father church member during youth R?", church_values,
      force_numeric = FALSE
    )
  } else {
    engine$label_variable(
      "qfa_ch", "Father church member during youth R?", church_values,
      force_numeric = FALSE
    )
    engine$label_variable(
      "qmo_ch", "Mother church member during youth R?", church_values,
      force_numeric = FALSE
    )
  }
  engine$label_variable(
    "qmo_emp", "Mother employed during youth R?", yes_no,
    force_numeric = FALSE
  )
  engine$label_variable(
    "qmo_vol", "Mother volunteer work during youth R?", yes_no,
    force_numeric = FALSE
  )
  engine$label_variable(
    "qparsep", "Parents ever separated/divorced?", yes_no,
    force_numeric = FALSE
  )
  engine$label_variable(
    "qparsey", "Year parents separated/divorced",
    c("no answer, see BQPARSEP" = -2, "no answer" = -1),
    force_numeric = TRUE
  )

  engine$finalize()
}
