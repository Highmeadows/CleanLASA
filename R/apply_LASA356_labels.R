# Apply LASA 356 (15-word test constructed scores) SPSS labels
#
# Source: LASA156_varinfo.pdf (05-Apr-2024)

#' Apply LASA356 (15-Word Test Constructed Scores) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the constructed 15-word-test variables documented
#' in LASA356 for waves B through K, including replenishment waves 2B and 3B.
#'
#' Wave B contains trial, delayed-recall, total, maximum, learning-effect,
#' retention, and recall-interval variables. Wave C contains the same
#' constructed cognitive scores except the recall interval. From wave D
#' onward, LASA356 contains five derived scores: total, maximum, learning
#' effect, and two retention percentages. The much larger set of test
#' administration and item variables in the same source belongs to LASA156
#' and is intentionally outside this function's inventory.
#'
#' The source prints the second B/C retention variable as `mret1pc` a second
#' time. This function uses `mret2pc`, consistent with its documented
#' retention-2 formula and with the explicit `mret1pc`/`mret2pc` distinction
#' in every later wave. Wave-specific missing codes and variable-label
#' capitalization are otherwise reproduced from the source.
#'
#' All LASA356 variables are numeric. With `to_numeric = TRUE`, documented
#' negative codes become `NA`; `to_numeric` therefore takes precedence over
#' `to_factor`. With `to_factor = TRUE` alone, documented missing codes become
#' factor levels and observed unlabelled scores remain numeric-text levels.
#'
#' Column matching tries, in order: (1) an explicit override in
#' `name_corrections`, (2) an exact case-sensitive match, and (3) a
#' case-insensitive exact match. Variables absent from `data` are recorded as
#' `"not found"` in the matching audit. Original labels and values are
#' preserved, and optional standardized naming removes the wave prefix,
#' standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA356 `.sav` file.
#'   Variables use their documented wave prefix followed by suffixes such as
#'   `mtotal`, `mtmax`, `mdelta`, `mret1pc`, and `mret2pc`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`,
#'   `"F"`, `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA356 suffixes without the wave prefix to actual column names in
#'   `data`.
#' @param to_factor Logical. If `TRUE`, variables carrying documented value
#'   labels are converted to factors. Observed unlabelled scores remain
#'   numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, all LASA356 variables are restored to
#'   plain numeric and negative values are replaced by `NA`.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with LASA356 variable/value labels, optional conversion and
#'   standardized naming, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, dmtotal = c(-2, 34), dmret1pc = c(-1, 75))
#' dat <- apply_lasa356_labels(dat, wave = "D", to_numeric = TRUE)
#' attr(dat$dmtotal, "label")
apply_lasa356_labels <- function(data,
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
  valid_waves <- c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 356 wave: ", wave, ". Use one of: ",
      paste(valid_waves, collapse = ", "), ".",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- switch(wave, `2B` = "b", `3B` = "b", tolower(wave))
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa356_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  if (wave == "B") {
    score_labels <- c("zero on trial" = -2, "test not done" = -1)
    specs <- list(
      c("mwtt1", "number of words correct: trial 1"),
      c("mwtt2", "number of words correct: trial 2"),
      c("mwtt3", "number of words correct: trial 3"),
      c("mwtdr", "number of words delayed recall"),
      c("mtotal", "learning/memory: total of 1, 2 and 3"),
      c("mtmax", "maximum score: Highest on 1, 2, 3"),
      c("mdelta", "learning effect highest-lowest"),
      c("mret1pc", "retention 1: bmwtdr/bmwtt3"),
      c("mret2pc", "retention 2: bmwtdr/bmtmax")
    )
    for (spec in specs) {
      engine$label_variable(
        spec[[1L]], spec[[2L]], score_labels, force_numeric = TRUE
      )
    }
    engine$label_variable(
      "mrecal",
      "15 word test time interval in minutes",
      c("no valid time data" = -2, "test not done" = -1),
      force_numeric = TRUE
    )
  } else if (wave == "C") {
    test_labels <- c("interview terminated" = -4, "no test" = -1)
    for (spec in list(
      c("mwtt1", "number of words correct: trial 1"),
      c("mwtt2", "number of words correct: trial 2"),
      c("mwtt3", "number of words correct: trial 3"),
      c("mwtdr", "number of words delayed recall")
    )) {
      engine$label_variable(
        spec[[1L]], spec[[2L]], test_labels, force_numeric = TRUE
      )
    }

    score_labels <- c("interview terminated" = -4, "no valid data" = 1)
    for (spec in list(
      c("mtotal", "learning/memory: total of 1, 2 and 3"),
      c("mtmax", "maximum score: highest on 1, 2, 3"),
      c("mdelta", "learning effect highest-lowest"),
      c("mret1pc", "retention 1: cmwtdr/cmwtt3"),
      c("mret2pc", "retention 2: cmwtdr/cmtmax")
    )) {
      engine$label_variable(
        spec[[1L]], spec[[2L]], score_labels, force_numeric = TRUE
      )
    }
  } else {
    score_labels <- c("test not done" = -2, "no valid data" = -1)
    retention_labels <- c(
      "recall test not done" = -2,
      "no valid data" = -1
    )
    engine$label_variable(
      "mtotal", "learning/memory: total of 1, 2 and 3", score_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mtmax", "maximum score: highest on 1, 2, 3", score_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mdelta", "learning highest-lowest", score_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mret1pc",
      paste0("retention 1: ", prefix, "mwtdr - ", prefix, "mwtt3"),
      retention_labels,
      force_numeric = TRUE
    )
    engine$label_variable(
      "mret2pc",
      paste0("retention 2: ", prefix, "mwtdr - ", prefix, "mtmax"),
      retention_labels,
      force_numeric = TRUE
    )
  }

  engine$finalize()
}
