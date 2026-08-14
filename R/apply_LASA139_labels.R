# Apply LASA 139 (Partner questions) SPSS variable and value labels
#
# Source: LASA139_varinfo.pdf (31-Jan-2024)

#' Apply LASA139 (Partner questions) SPSS labels
#'
#' Attaches SPSS-style variable labels (`attr(x, "label")`) and value labels
#' (`attr(x, "labels")`) to the partner-question variables documented in
#' LASA139 for waves E, F, G, H, 3B, I, J, and K.
#'
#' Every wave contains six relationship-satisfaction items, important
#' conversation frequency, five partner functional-limitation items, partner
#' memory problems, and partner dementia. Waves E through J (but not K) also
#' contain two relationship evaluations, four dispute items, and public
#' transportation. Dementia is routed from partner status through 3B and from
#' partner memory problems in I--K. Waves I--K additionally contain four
#' respite-care items. Consequently, the documented inventories contain 21
#' variables in E/F/G/H/3B, 25 in I/J, and 18 in K.
#'
#' All documented variables are categorical. With `to_factor = TRUE`, they
#' become factors and observed unlabelled codes (including intermediate 2--9
#' relationship-evaluation scores) remain numeric-text levels. `to_numeric`
#' is retained for the shared parameter contract but does not change them.
#'
#' Column matching tries an explicit `name_corrections` override, an exact
#' case-sensitive match, then a case-insensitive exact match. Absent variables
#' are recorded as `"not found"`. Original SPSS labels and values are
#' preserved. Standardized naming optionally removes the wave prefix,
#' standardizes `respnr`, and adds `LASA_wave`.
#'
#' @param data A data frame or tibble imported from a LASA139 `.sav` file,
#'   for example via [haven::read_sav()]. Names include wave-prefixed forms
#'   such as `eqprel1`, `bqpadl6`, `iqpdeme`, and `kqprespc4`.
#' @param wave Character scalar identifying the LASA wave, matched
#'   case-insensitively. One of `"E"`, `"F"`, `"G"`, `"H"`, `"3B"`, `"I"`,
#'   `"J"`, or `"K"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   LASA139 suffixes without the wave prefix (for example `qprel1`, `qpdis1`,
#'   `qpadl6`, or `qprespc1`) to actual column names in `data`.
#' @param to_factor Logical. If `TRUE`, categorical variables with documented
#'   value labels are converted to factors. Observed unlabelled codes remain
#'   numeric-text levels.
#' @param to_numeric Logical. Retained for the shared parameter contract.
#'   LASA139 contains no numeric count or continuous variables, so it does not
#'   change the documented variables.
#' @param standardize_names Logical. If `TRUE`, matched columns are renamed to
#'   canonical lowercase suffixes without the wave prefix, `respnr` is
#'   standardized, and `split_wavecode` is treated as `TRUE`.
#' @param split_wavecode Logical. If `TRUE`, matched columns have the wave
#'   prefix removed and a `LASA_wave` column containing the selected wave is
#'   inserted immediately after the respondent-number column.
#'
#' @return `data`, with LASA139 variable/value labels, optional factor
#'   conversion and standardized naming, preserved original SPSS coding, the
#'   `LASA_wave` provenance attribute, and a `label_report` matching audit.
#'
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(RespNr = 1:2, eqprel1 = c(1, 5), eqpdeme = c(-2, 2))
#' dat <- apply_lasa139_labels(dat, wave = "E", to_factor = TRUE)
#' attr(dat$eqprel1, "labels")
apply_lasa139_labels <- function(data,
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
  valid_waves <- c("E", "F", "G", "H", "3B", "I", "J", "K")
  if (!wave %in% valid_waves) {
    stop(
      "Unknown LASA 139 wave: ", wave,
      ". Use one of: E, F, G, H, 3B, I, J, K.",
      call. = FALSE
    )
  }

  .lasa_assert_scalar_logical(to_factor, "to_factor")
  .lasa_assert_scalar_logical(to_numeric, "to_numeric")
  .lasa_assert_scalar_logical(standardize_names, "standardize_names")
  .lasa_assert_scalar_logical(split_wavecode, "split_wavecode")
  .lasa_assert_name_corrections(name_corrections)

  prefix <- switch(
    wave,
    E = "e", F = "f", G = "g", H = "h", `3B` = "b", I = "i", J = "j", K = "k"
  )
  engine <- .lasa_label_engine(
    data = data,
    wave = wave,
    prefix = prefix,
    fn_name = "apply_lasa139_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )

  satisfaction_values <- c(
    "no partner" = -2,
    "no answer" = -1,
    "very dissatisfied" = 1,
    "dissatisfied" = 2,
    "a little dissatisfied" = 3,
    "satisfied" = 4,
    "very satisfied" = 5
  )
  relationship_labels <- c(
    "Partner rel. 1: daily support",
    "Partner rel. 2: motivated",
    "Partner rel. 3: personality",
    "Partner rel. 4: consideration",
    "Partner rel. 5: disputes",
    "Partner rel. 6: decision making"
  )
  for (i in seq_along(relationship_labels)) {
    engine$label_variable(
      paste0("qprel", i), relationship_labels[[i]], satisfaction_values,
      force_numeric = FALSE
    )
  }

  if (wave != "K") {
    evaluation_values <- c(
      "no partner" = -2,
      "no answer" = -1,
      "worst conceivable relation" = 1,
      "best conceivable relation" = 10
    )
    engine$label_variable(
      "qprel7", "Partner rel. 7: evaluation now", evaluation_values,
      force_numeric = FALSE
    )
    engine$label_variable(
      "qprel8", "Partner rel. 8: evaluation 10 years ago",
      evaluation_values, force_numeric = FALSE
    )

    disagreement_values <- c(
      "no partner" = -2,
      "no answer" = -1,
      "strongly in disagreement" = 1,
      "reasonably in disagreement" = 2,
      "a little in disagreement" = 3,
      "totally not in disagreement" = 4
    )
    dispute_labels <- c(
      "Partner dispute 1: financial affairs",
      "Partner dispute 2: domestic affairs",
      "Partner dispute 3: spare time",
      "Partner dispute 4: consideration"
    )
    for (i in seq_along(dispute_labels)) {
      engine$label_variable(
        paste0("qpdis", i), dispute_labels[[i]], disagreement_values,
        force_numeric = FALSE
      )
    }
  }

  engine$label_variable(
    "qptalk", "Partner important conversation",
    c(
      "no partner" = -2,
      "no answer" = -1,
      "at least once a day" = 1,
      "a few times a week" = 2,
      "once a week" = 3,
      "once a month" = 4,
      "less than once a month" = 5
    ),
    force_numeric = FALSE
  )

  functional_values <- c(
    "no partner" = -2,
    "no answer" = -1,
    "no, partner cannot" = 1,
    "only with help" = 2,
    "yes, with much difficulty" = 3,
    "yes, with some difficulty" = 4,
    "yes, without help" = 5
  )
  functional_labels <- c(
    "Partner func. lim. 1: stairs",
    "Partner func. lim. 2: dress",
    "Partner func. lim. 3: chair",
    "Partner func. lim. 4: toenails",
    "Partner func. lim. 5: walk"
  )
  for (i in seq_along(functional_labels)) {
    engine$label_variable(
      paste0("qpadl", i), functional_labels[[i]], functional_values,
      force_numeric = FALSE
    )
  }
  if (wave != "K") {
    engine$label_variable(
      "qpadl6", "Partner func. lim. 6: public transportation",
      functional_values, force_numeric = FALSE
    )
  }

  partner_yes_no <- c(
    "no partner" = -2, "no answer" = -1, "no" = 1, "yes" = 2
  )
  engine$label_variable(
    "qpmemo", "Partner problem with memory", partner_yes_no,
    force_numeric = FALSE
  )

  dementia_values <- if (wave %in% c("E", "F", "G", "H", "3B")) {
    partner_yes_no
  } else {
    c(
      stats::setNames(-2, paste0("na, see ", wave, "QPMEMO")),
      "no answer" = -1,
      "no" = 1,
      "yes" = 2
    )
  }
  engine$label_variable(
    "qpdeme", "Partner diagnosed with dementia", dementia_values,
    force_numeric = FALSE
  )

  if (wave %in% c("I", "J", "K")) {
    respite_values <- c(
      stats::setNames(-2, paste0("na, see ", wave, "QPDEME")),
      "no answer" = -1,
      "no" = 1,
      "yes" = 2
    )
    respite_labels <- c(
      "Partner respite care: daytime activities",
      "Partner respite care: overnight stay in care institution",
      "Partner respite care: lodging facility for a few days",
      "Partner respite care: minder, so R can go away part of the day"
    )
    for (i in seq_along(respite_labels)) {
      engine$label_variable(
        paste0("qprespc", i), respite_labels[[i]], respite_values,
        force_numeric = FALSE
      )
    }
  }

  engine$finalize()
}
