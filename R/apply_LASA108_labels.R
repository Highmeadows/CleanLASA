# Apply LASA 108 (advance care planning) SPSS labels
#
# Source: LASA108_varinfo.pdf (24-Jan-2024)

#' Apply LASA108 (Advance care planning) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to advance-care-planning variables documented in
#' LASA108 for waves I and K.
#'
#' Wave I contains 48 yes/no items across ten planning topics: future health,
#' a partner's future health, future care and guidance, informal care,
#' substitute medical decision-making, nursing-home admission,
#' life-extending treatment, resuscitation, euthanasia, and deathbed wishes.
#' The four partner-health items additionally use code -2 for not applicable.
#' Wave K uses a redesigned 35-item mention inventory across seven topics,
#' with five indicators per topic for thinking, discussion, and a living will.
#'
#' The source PDF repeats `kqacp1a` through `kqacp2e` verbatim on its final
#' page. They are implemented once in their first documented position, so the
#' wave-K inventory contains 35 unique variables rather than 45 rows.
#'
#' All LASA108 variables are categorical. `to_numeric` is accepted for the
#' shared interface but does not convert them. With `to_factor = TRUE`,
#' matched variables become factors and observed unlabelled codes remain
#' numeric-text levels.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive name, then a case-insensitive exact name. Matched columns
#' preserve the original SPSS coding in `original_labels` and
#' `original_values`. Requested standardization removes the wave prefix,
#' standardizes `respnr`, and inserts `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA108 `.sav` file.
#'   Names range from `iqacp1a` through `iqacp10e` in I and from `kqacp1a`
#'   through `kqacp7e` in K.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"I"` or `"K"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix (for example `qacp1a`, `qacp5e`, or
#'   `qacp10e`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, matched variables are converted to
#'   factors using the documented labels; observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. Accepted for interface consistency; LASA108 has
#'   no variables eligible for numeric conversion.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched names have their wave
#'   prefix removed and `LASA_wave` is inserted immediately after the
#'   respondent-number column.
#'
#' @return `data`, with LASA108 labels, optional factor conversion and name
#'   standardization, preserved original SPSS coding, the `LASA_wave`
#'   provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(iqacp1a = c(-1, 1, 2), iqacp2a = c(-2, 1, 2))
#' dat <- apply_lasa108_labels(dat, wave = "I")
#' attr(dat$iqacp2a, "labels")
apply_lasa108_labels <- function(data,
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
  if (!wave %in% c("I", "K")) {
    stop(
      "Unknown LASA 108 wave: ", wave, ". Use one of: I, K.",
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
    fn_name = "apply_lasa108_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  if (wave == "I") {
    yes_no <- c("no answer" = -1, "yes" = 1, "no" = 2)
    partner_yes_no <- c("not applicable" = -2, yes_no)
    topics <- c(
      `1` = "future health",
      `2` = "future health partner",
      `3` = "future medical care and guidance",
      `4` = "who to take care of me not being able to care for myself",
      `5` = paste0(
        "who to take medical decisions for me not being able doing it myself"
      ),
      `6` = paste0(
        "whether a nursing home is an option for me when not being able to ",
        "stay at home"
      ),
      `7` = paste0(
        "situations where I no longer want to have a life-extending treatment"
      ),
      `8` = "I would like to be resuscitated if I had a cardiac arrest",
      `9` = "euthanasia as an option for me if life has become unbearable",
      `10` = "wishes for my deathbed"
    )
    group_letters <- list(
      `1` = letters[1:4], `2` = letters[1:4], `3` = letters[1:5],
      `4` = letters[1:5], `5` = letters[1:5], `6` = letters[1:5],
      `7` = letters[1:5], `8` = letters[1:5], `9` = letters[1:5],
      `10` = letters[1:5]
    )
    action_stems <- c(
      a = "sometimes think about ",
      b = "talk to people close to me about ",
      c = "talk to my general physician about ",
      d = "would like to talk to my general physician about ",
      e = "put something on paper about "
    )

    for (group in names(group_letters)) {
      for (item_letter in group_letters[[group]]) {
        topic <- topics[[group]]
        if (group == "9" && item_letter == "e") {
          topic <- "future euthanasia as an option for me if life has become unbearable"
        }
        variable_label <- paste0(
          "acp ", group, item_letter, ": ", action_stems[[item_letter]], topic
        )
        if (group == "4" && item_letter == "d") {
          variable_label <- paste0(
            "acp 4d: would like to talk to my general physician who to take ",
            "care of me not being able to care for myself"
          )
        }
        response <- if (group == "2") partner_yes_no else yes_no
        engine$label_variable(
          paste0("qacp", group, item_letter), variable_label, response,
          force_numeric = FALSE
        )
      }
    }
  }

  if (wave == "K") {
    response <- c("no answer" = -1, "not mentioned" = 0, "mentioned" = 1)
    topic_stems <- c(
      `1` = "Advanced care planning, staying at home: ",
      `2` = "Advanced care planning: going to hospital: ",
      `3` = "Advanced care planning: admitted to nursing home: ",
      `4` = "Advanced care planning: desired treatments: ",
      `5` = "Advanced care planning: who should make medical decisions: ",
      `6` = "Advanced care planning: be resuscitated: ",
      `7` = "Advanced care planning: euthanasia: "
    )
    indicator_text <- c(
      a = "no, not thought about (past months)",
      b = "yes, thought about (past months)",
      c = "yes, spoken about with doctor/healthcare provider (past months)",
      d = "yes, spoken about with relatives (past months)",
      e = "yes, living will (past months)"
    )

    for (group in names(topic_stems)) {
      for (item_letter in names(indicator_text)) {
        engine$label_variable(
          paste0("qacp", group, item_letter),
          paste0(topic_stems[[group]], indicator_text[[item_letter]]),
          response,
          force_numeric = FALSE
        )
      }
    }
  }

  engine$finalize()
}
