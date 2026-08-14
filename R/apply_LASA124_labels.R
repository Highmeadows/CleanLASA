# Apply LASA 124 (metamemory) SPSS labels
#
# Source: LASA124_varinfo.pdf (03-Oct-2012)

#' Apply LASA124 (Metamemory) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the metamemory items documented in LASA124 for
#' waves B, C, and D.
#'
#' Wave B contains 30 items. Waves C and D contain the same 30 items plus 11
#' additional items, for 41 variables in total. Items 1--10 measure memory
#' strategies on a never--always scale; items 11 onward use a
#' strongly-disagree--strongly-agree scale. Scale scores stored in the
#' separate LASA324 files are intentionally outside this function's scope.
#'
#' All LASA124 variables are categorical. Consequently, `to_numeric` is
#' accepted for interface consistency but does not convert them. With
#' `to_factor = TRUE`, matched variables become factors and observed
#' unlabelled codes remain numeric-text levels.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive match, and then a case-insensitive exact match. Every
#' documented variable is recorded in the final `label_report`, including
#' variables absent from `data`.
#'
#' Original SPSS codes and labels are preserved in `original_values` and
#' `original_labels`. Standardized naming removes the wave prefix,
#' standardizes `respnr`, and inserts a `LASA_wave` column.
#'
#' @param data A data frame or tibble imported from a LASA124 `.sav` file.
#'   Expected names include `bqmemo01`, `cqmemo31`, and `dqmemo41`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"B"`, `"C"`, or `"D"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `qmemo01` or `qmemo39`) to
#'   actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented value labels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA124 has
#'   no numeric variables eligible for conversion.
#' @param standardize_names Logical. If `TRUE`, matched names are standardized,
#'   `respnr` is standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column is inserted after `respnr`.
#'
#' @return `data`, with LASA124 labels, requested conversion or renaming,
#'   preserved original coding, a `LASA_wave` provenance attribute, and a
#'   `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(bqmemo01 = c(1, 5), bqmemo11 = c(2, 4))
#' dat <- apply_lasa124_labels(dat, wave = "B", to_factor = TRUE)
#' attr(dat$bqmemo01, "labels")
apply_lasa124_labels <- function(data,
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
  if (!wave %in% c("B", "C", "D")) {
    stop(
      "Unknown LASA 124 wave: ", wave, ". Use one of: B, C, D.",
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
    prefix = tolower(wave),
    fn_name = "apply_lasa124_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  frequency <- c(
    "no answer" = -1, "never" = 1, "seldom" = 2,
    "some of the time" = 3, "often" = 4, "always" = 5
  )
  agreement <- c(
    "no answer" = -1, "strongly disagree" = 1, "disagree" = 2,
    "no agreement/agreement" = 3, "agree" = 4, "strongly agree" = 5
  )
  item_text <- c(
    "important dates", "beginning of the day", "suitcase", "names and faces",
    "difficulties", "conscious", "other relation", "mental images",
    "mentally repeat", "reminders", "nervous", "remember names",
    "difficult if nervous", "10 years", "problems", "introduce", "improve",
    "memory test", "practice", "questions", "use", "accurate", "tense",
    "declines", "did not do", "appointment", "exercise", "not as good",
    "decline when elder", "improve when practice", "always declines",
    "no improvement", "upset", "difficult when upset", "nervous new place",
    "proud", "admire others", "important to be precise", "self without help",
    "pleasant", "well"
  )
  last_item <- if (wave == "B") 30L else 41L

  for (i in seq_len(last_item)) {
    engine$label_variable(
      sprintf("qmemo%02d", i),
      paste0("memory ", sprintf("%02d", i), ": ", item_text[[i]]),
      if (i <= 10L) frequency else agreement
    )
  }

  engine$finalize()
}
