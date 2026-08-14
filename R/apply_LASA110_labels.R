# Apply LASA 110 (satisfaction and important life aspects) SPSS labels
#
# Source: LASA110_varinfo.pdf (24-Jan-2024)

#' Apply LASA110 (Satisfaction and important life aspects) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the life-satisfaction and important-life-aspect
#' variables documented in LASA110 for waves B through K, including
#' replenishment waves 2B and 3B.
#'
#' Every documented wave contains two five-point satisfaction items, nine
#' indicators for important life aspects, and a count of mentioned aspects.
#' The fourth aspect is labelled `sensible spending of time` in waves B--H
#' except 3B, and `meaningful pastime` in 3B, I, J, and K. Waves H, I, and J
#' additionally contain a 0--10 current-satisfaction score and a comparison
#' with the previous year.
#'
#' The aspect-count variable and the 0--10 current-satisfaction score are
#' eligible for `to_numeric`; observed negative missing codes become `NA`.
#' Other LASA110 fields are categorical. With `to_factor = TRUE`, categorical
#' variables become factors and observed unlabelled codes remain numeric-text
#' levels. `to_numeric` takes precedence for eligible fields.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive name, then a case-insensitive exact name. Every matched
#' field preserves its original SPSS coding in `original_labels` and
#' `original_values`. Requested standardization removes the wave prefix,
#' standardizes `respnr`, and inserts `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA110 `.sav` file.
#'   Names include a wave prefix followed by `qsatis1`, `qsatis2`,
#'   `qimpor1`--`qimpor9`, and `qnansw`; H, I, and J also use `qsatis3` and
#'   `qsatis4`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, `"D"`, `"E"`, `"2B"`, `"F"`,
#'   `"G"`, `"H"`, `"3B"`, `"I"`, `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `qsatis1`, `qimpor4`, or
#'   `qnansw`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, categorical variables are converted to
#'   factors using the documented labels; observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. If `TRUE`, the aspect-count variable and, where
#'   present, the 0--10 satisfaction score are restored to plain numeric and
#'   negative values are replaced by `NA`.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names have their wave
#'   prefix removed and `LASA_wave` is inserted immediately after the
#'   respondent-number column.
#'
#' @return `data`, with LASA110 labels, optional conversion and standardized
#'   naming, preserved original SPSS coding, the `LASA_wave` provenance
#'   attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(hqsatis1 = c(1, 5), hqnansw = c(0, 9))
#' dat <- apply_lasa110_labels(dat, wave = "H", to_numeric = TRUE)
#' attr(dat$hqsatis1, "labels")
apply_lasa110_labels <- function(data,
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
      "Unknown LASA 110 wave: ", wave,
      ". Use one of: B, C, D, E, 2B, F, G, H, 3B, I, J, K.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = unname(wave_prefix[[wave]]),
    fn_name = "apply_lasa110_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  satisfaction <- c(
    "no answer" = -1,
    "very dissatisfied" = 1,
    "dissatisfied" = 2,
    "not dissatisfied/satisfied" = 3,
    "satisfied" = 4,
    "very satisfied" = 5
  )
  importance <- c(
    "all 3 missing" = -1,
    "mentioned" = 1,
    "not mentioned" = 2
  )

  engine$label_variable(
    "qsatis1", "satisfied with life: lately", satisfaction,
    force_numeric = FALSE
  )
  engine$label_variable(
    "qsatis2", "satisfied with life: until now", satisfaction,
    force_numeric = FALSE
  )

  aspect_labels <- c(
    "good income",
    "nice family",
    "good physical health",
    if (wave %in% c("3B", "I", "J", "K")) {
      "meaningful pastime"
    } else {
      "sensible spending of time"
    },
    "good marital life",
    "strong faith",
    "good mental health",
    "many friends and acquaintances",
    "good housing"
  )
  for (i in seq_along(aspect_labels)) {
    engine$label_variable(
      paste0("qimpor", i), aspect_labels[[i]], importance,
      force_numeric = FALSE
    )
  }

  mentioned_count <- stats::setNames(
    0:9,
    c("none mentioned", paste0(1:9, " mentioned"))
  )
  engine$label_variable(
    "qnansw", "number of answers given on 9 items", mentioned_count,
    force_numeric = TRUE
  )

  if (wave %in% c("H", "I", "J")) {
    engine$label_variable(
      "qsatis3", "satisfied with life: now score from 0 to 10",
      c("no answer" = -1), force_numeric = TRUE
    )
    engine$label_variable(
      "qsatis4", "satisfied with life: now compared to year ago",
      c(
        "no answer" = -1,
        "much more satisfied" = 1,
        "more satisfied" = 2,
        "equally satisfied" = 3,
        "less dissatisfied" = 4,
        "much less satisfied" = 5
      ),
      force_numeric = FALSE
    )
  }

  engine$finalize()
}
