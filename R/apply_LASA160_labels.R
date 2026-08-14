# Apply LASA 160 (weight change) SPSS labels
#
# Source: LASA160_varinfo.pdf (03-Aug-2022)

#' Apply LASA160 (Weight change) SPSS labels
#'
#' Applies the wave-specific LASA160 labels for recent weight change, amount
#' gained or lost, stated and coded reasons, lifetime weight history, body-
#' weight appraisal, weight-loss methods, appetite, stress or illness, and
#' migrant-cohort unintentional-weight-loss screening. Supported files are B,
#' C, D, E, 2B, F, G, H, 3B, MB, I, and J.
#'
#' Matching tries `name_corrections`, exact names, then case-insensitive exact
#' names. `to_factor` converts categorical variables to factors while keeping
#' observed undocumented codes. `to_numeric` restores documented weights,
#' amounts, ages, and heights to plain numeric and converts their negative
#' missing codes to `NA`. Original values and labels remain as attributes.
#'
#' @param data A data frame or tibble imported from a LASA160 `.sav` file.
#' @param wave Character scalar identifying wave `"B"`, `"C"`, `"D"`, `"E"`,
#'   `"2B"`, `"F"`, `"G"`, `"H"`, `"3B"`, `"MB"`, `"I"`, or `"J"`.
#' @param name_corrections Optional named character vector mapping canonical
#'   suffixes without the wave prefix to actual column names.
#' @param to_factor Logical. Convert labelled categorical variables to factors.
#' @param to_numeric Logical. Restore eligible weight, age, and height
#'   variables to numeric and replace negative missing codes with `NA`.
#' @param standardize_names Logical. Standardize matched names and `respnr`,
#'   remove the wave prefix, and add `LASA_wave`.
#' @param split_wavecode Logical. Remove wave prefixes and add `LASA_wave`;
#'   implied by `standardize_names = TRUE`.
#'
#' @return `data` with LASA160 metadata, optional reshaping, a `LASA_wave`
#'   attribute, and a `label_report` matching audit.
#' @seealso [lasa_label_report()], [read_lasa_sav()]
#' @export
#'
#' @examples
#' dat <- data.frame(bmweightch = c(-1, 1, 3), bmweightchkg = c(-1, 2, 5))
#' apply_lasa160_labels(dat, wave = "B")
apply_lasa160_labels <- function(data,
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
    G = "g", H = "h", `3B` = "b", MB = "b", I = "i", J = "j"
  )
  if (!wave %in% names(wave_prefix)) {
    stop(
      "Unknown LASA 160 wave: ", wave, ". Use one of: ",
      paste(names(wave_prefix), collapse = ", "), ".",
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
    fn_name = "apply_lasa160_labels",
    name_corrections = name_corrections,
    to_factor = to_factor,
    to_numeric = to_numeric,
    standardize_names = standardize_names,
    split_wavecode = split_wavecode
  )
  label_variable <- engine$label_variable

  weight_change_labels <- function(section_missing = FALSE, terminated = FALSE) {
    c(
      if (section_missing) c("na, section not done" = -3) else numeric(0),
      if (terminated) c("na, interview terminated" = -5) else numeric(0),
      "na, asked" = -1,
      "not changed" = 1, "gained weight" = 2, "lost weight" = 3
    )
  }
  reason_table <- function(modern = FALSE) {
    values <- c(
      1.0, 1.1, 1.2,
      if (!modern) 1.3 else numeric(0),
      2.0, 2.1, 2.2, 2.3, 2.4, 2.5,
      if (modern) c(2.6, 2.7) else numeric(0),
      3.0, 3.1, 5.0,
      if (modern) 5.1 else numeric(0),
      6.0, 6.1, 6.2, 6.3,
      if (modern) 6.4 else numeric(0),
      7.0, 8.0, 9.0, 9.1, 9.2
    )
    labels <- c(
      "sickness (unintentional)",
      "medication (unintentional)",
      "physical inactive due to sickness (unintentional)",
      if (!modern) "lost weight due to sickness: now gained weight (unintentional)" else character(0),
      "diet (intentional)",
      "eating less or different (unknown)",
      "eating more or different (unintentional)",
      "eating more and physical inactive (unintentional)",
      "quit smoking (unknown)",
      "smoking (unknown)",
      if (modern) c(
        "eating less and physical active (intentional)",
        "eating less or different (unintentional)"
      ) else character(0),
      "social factors (unintentional)",
      "social factors recoded (unintentional)",
      "do not know (unintentional)",
      if (modern) "other reason (implausible reason) (unknown)" else character(0),
      "physical activities (intentional)",
      "physical activity (unknown)",
      "physical inactivity (unintentional)",
      "working harder (unintentional)",
      if (modern) "physical activity (unintentional)" else character(0),
      "older age (unintentional)",
      "loss of appetite (unintentional)",
      "diuretics or dehydration", "oedeme/ascites", "quit prednison"
    )
    stats::setNames(values, labels)
  }
  old_loss_labels <- c(
    "no valid data" = -3, "no weight loss" = -2, "no answer, asked" = -1,
    "voluntary" = 1, "involuntary" = 2, "eating less or different" = 3
  )
  old_gain_labels <- c(
    "no valid data" = -3, "no weight gain" = -2, "no answer, asked" = -1,
    "related to eating" = 1, "physical inactivity" = 2,
    "eating and physical inactivity" = 3, "medical reasons" = 4,
    "other" = 5
  )

  if (wave == "B") {
    label_variable(
      "mweightch", "Weight: change",
      c("no valid data" = -3, "no answer, routing" = -2,
        "no answer, asked" = -1, "not changed" = 1,
        "gained weight" = 2, "lost weight" = 3),
      FALSE
    )
    label_variable(
      "mweightchkg", "Weight: change kilograms",
      c("no valid data" = -3, "no answer, routing" = -2,
        "no answer, asked" = -1),
      TRUE
    )
    label_variable(
      "mweightchr", "Weight: change reason",
      c("na, see BMWEIGHTCH" = -2, "na, asked" = -1,
        "sickness" = 1, "diet" = 2, "social factors" = 3,
        "other, see WEIGHTCHCR" = 4),
      FALSE
    )
    label_variable(
      "mweightchcr", "Weight: change reason: coded",
      c("no valid data" = -3, "no weight change" = -2,
        "no answer, asked" = -1, reason_table(FALSE)),
      FALSE
    )
    label_variable("mweightlr", "Reason weight loss", old_loss_labels, FALSE)
    label_variable("mweightgr", "Reason weight gain", old_gain_labels, FALSE)
    label_variable("mweighthigh", "Weight: highest in life kilogram", c("no valid data" = -3), TRUE)
    label_variable("mweightage", "Weight: highest in life age", c("no answer, routing" = -2), TRUE)
    label_variable("mweightk40y", "Weight: at 40 in kilogram", c("no answer, asked" = -1), TRUE)
    label_variable("mheight40y", "Length: at 40 in centimeters", c("no answer, asked" = -1), TRUE)
  } else if (wave %in% c("C", "D", "E", "2B")) {
    ref <- paste0(tolower(if (wave == "2B") "b" else wave), "MWEIGHTCH")
    label_variable("mweightch", "Weight: change last 6 months", weight_change_labels(terminated = wave != "2B"), FALSE)
    label_variable(
      "mweightchkg", "Weight: change kilograms",
      c(stats::setNames(-2, paste0("na, see ", ref)), "na, asked" = -1),
      TRUE
    )
    label_variable(
      "mweightchr", "Weight: change reason",
      c(stats::setNames(-2, paste0("na, see ", ref)), "na, asked" = -1,
        "sickness" = 1, "diet" = 2, "social factors" = 3,
        stats::setNames(4, paste0("other, see ", ref, "RC")),
        "do not know" = 5),
      FALSE
    )
    label_variable(
      "mweightchrc", "Weight: change reason: coded",
      c("no valid data" = -3, "no weight change" = -2,
        "no answer, asked" = -1, reason_table(FALSE)),
      FALSE
    )
    label_variable("mweightlr", "Reason weight loss", old_loss_labels, FALSE)
    label_variable("mweightgr", "Reason weight gain", old_gain_labels, FALSE)

    if (wave == "C") {
      label_variable("mheight25y", "Height: at age 25 in centimeters", c("na, interview terminated" = -5), TRUE)
      label_variable("mweightlow", "Weight: lowest after age 25", c("no valid data" = -1), TRUE)
    }
    if (wave == "2B") {
      label_variable("mwmax", "Weight: maximum in lifetime", c("na, asked" = -1), TRUE)
      label_variable("magewmx", "Weight: age at maximum weight", c("na, asked" = -1), TRUE)
      label_variable("mwage25", "Weight: weight at age 25", c("na, asked" = -1), TRUE)
      label_variable("mwage40", "Weight: weight at age 40", c("na, asked" = -1), TRUE)
      label_variable("mhage25", "Height: height at age 25", c("na, asked" = -1), TRUE)
    }
  } else if (wave %in% c("F", "G")) {
    label_variable("mweightch", "Weight: change last 6 months", weight_change_labels(), FALSE)
    label_variable(
      "mweightchkg", "Weight: change kilogram",
      c(stats::setNames(-2, paste0("na, see ", wave, "MWEIGHTCH")),
        "na, asked" = -1),
      TRUE
    )
    label_variable(
      "mweightchr", "Weight: change reason",
      c(stats::setNames(-2, paste0("na, see ", wave, "MWEIGHTCH")),
        "na, asked" = -1, "sickness" = 1, "diet" = 2,
        "social factors" = 3,
        stats::setNames(4, paste0("other, see ", wave, "MWEIGHTCHRC")),
        "do not know" = 5),
      FALSE
    )
    label_variable(
      "mweightchrc", "Weight: change reason: coded",
      c("no valid data" = -3, "no weight change" = -2,
        "no answer, asked" = -1, reason_table(wave == "G")),
      FALSE
    )
    label_variable("mweightlr", "Reason weight loss", old_loss_labels, FALSE)
    label_variable("mweightgr", "Reason weight gain", old_gain_labels, FALSE)
    if (wave == "F") {
      label_variable(
        "msatw", "Satisfied with body weight",
        c("na, asked / do not know" = -1, "very" = 1, "reasonably" = 2,
          "a little" = 3, "not at all" = 4),
        FALSE
      )
      label_variable(
        "mestw", "Estimation body weight",
        c("na, asked / do not know" = -1, "underweight" = 1,
          "approx.. normal weight" = 2, "overweight" = 3),
        FALSE
      )
    } else {
      label_variable(
        "msatw", "Satisfied with body weight",
        c("na, asked / do not know" = -1, "very dissatisfied" = 1,
          "dissatisfied" = 2, "not satisfied /dissatisfied" = 3,
          "satisfied" = 4, "very satisfied" = 5),
        FALSE
      )
      label_variable(
        "mestw", "Estimation body weight",
        c("na, asked / do not know" = -1, "severe underweight" = 1,
          "underweight" = 2, "approx.. normal weight" = 3,
          "overweight" = 4, "severe overweight" = 5),
        FALSE
      )
    }
    label_variable(
      "mattw", "Pay attention to body weight",
      c("na, asked / do not know" = -1,
        "yes, trying to lose weight" = 1,
        "yes, trying not to gain weight" = 2,
        "yes, trying not to lose weight" = 3,
        "yes, trying to gain weight" = 4, "no" = 5),
      FALSE
    )
    methods <- c(
      "eat less", "less snacks", "eat less fat", "drink less alcohol",
      "limit types of food", "light products", "replacements (Slim Fast)",
      "slimming program (WW)", "more exercise (sports)",
      "more daily exercise (stairs)", "more smoking", "slimming pills",
      "stomach reduction", "guidance dietician", "other method"
    )
    method_labels <- c(
      "no answer, see F/GMATTW" = -2, "no answer, asked" = -1,
      "not mentioned" = 0, "mentioned" = 1
    )
    for (i in seq_along(methods)) {
      label_variable(
        sprintf("mlwm%02d", i),
        paste0("LW method ", i, ": ", methods[[i]]),
        method_labels,
        FALSE
      )
    }
  } else if (wave %in% c("H", "3B")) {
    ref <- if (wave == "H") "H" else "B"
    label_variable("mweightch", "Weight: change last 6 months", weight_change_labels(), FALSE)
    label_variable(
      "mweightchkg", "Weight change kilogram",
      c(stats::setNames(-2, paste0("na, see ", ref, "MWEIGHTCH")), "na, asked" = -1),
      TRUE
    )
    loss_reason <- c(
      stats::setNames(-2, paste0("na, see ", ref, "MWEIGHTCH")), "na, asked" = -1,
      "sickness (unintentional)" = 1, "diet (intentional)" = 2,
      "other diet (unintentional)" = 3,
      "more physical activity (intentional)" = 4,
      "reason unknown (unintentional)" = 5,
      "social factors (unintentional)" = 6,
      stats::setNames(7, paste0("other reason -> ", ref, "MWEIGHTCHRC"))
    )
    gain_reason <- c(
      stats::setNames(-2, paste0("na, see ", ref, "MWEIGHTCH")), "na, asked" = -1,
      "sickness" = 1, "eating more or different" = 2,
      "less physical activity" = 3,
      "combination of eating more/different and physical inactive" = 4,
      "reason unknown" = 5,
      stats::setNames(6, paste0("other reason -> ", ref, "MWEIGHTCHRC"))
    )
    label_variable("mweightlr2", "Weight loss reason", loss_reason, FALSE)
    label_variable("mweightr2", "Weight gain reason", gain_reason, FALSE)
    label_variable(
      "mweightchrc", "Weight change other reason: coded",
      c("no valid data" = -3,
        stats::setNames(-2, paste0("na, see ", ref, "MWEIGHTLR2/GR2")),
        "na, asked" = -1, reason_table(TRUE)),
      FALSE
    )
    coded_loss <- c(
      "no valid data" = -3,
      stats::setNames(-2, paste0("na, see ", ref, "MWEIGHTLR2")),
      "na, asked" = -1, "sickness (unintentional)" = 1,
      "diet (intentional)" = 2, "different diet (unintentional)" = 3,
      "physical activity (intentional)" = 4,
      "reason unknown (unintentional)" = 5,
      "social factors (unintentional)" = 6, "other reason (7)" = 7,
      "eating less or different (unknown)" = 8,
      "eating less and physical active (intentional)" = 9,
      "physical activity (unintentional)" = 10,
      "physical activity (unknown)" = 11, "aging (unintentional)" = 12
    )
    coded_gain <- c(
      "no valid data" = -3,
      stats::setNames(-2, paste0("na, see ", ref, "MWEIGHTGR2")),
      "na, asked" = -1, "sickness" = 1, "related to eating" = 2,
      "physical inactivity" = 3, "eating and physical inactivity" = 4,
      "reason unknown" = 5, "other reason" = 6, "aging" = 7,
      "social factors" = 8
    )
    label_variable("mweightlr", "Reason weight loss: coded", coded_loss, FALSE)
    label_variable("mweightgr", "Reason weight gain: coded", coded_gain, FALSE)
    label_variable(
      "mealt6m", "Eating less last 6 months (problems)",
      c("na, asked" = -1, "did not eat less" = 1,
        "did eat somewhat less" = 2, "did eat much less" = 3),
      FALSE
    )
    label_variable(
      "mprob6m", "psychological stress or severe sickness last 6 months",
      c("na, asked" = -1, "no" = 1, "yes" = 2), FALSE
    )
    appetite <- c("na, asked" = -1, "good" = 1, "moderate" = 2, "poor" = 3)
    label_variable("mapp7d", "Appetite last 7 days", appetite, FALSE)
    label_variable("mapp6m", "Appetite last 6 months (average)", appetite, FALSE)
    satisfaction <- c(
      "na, asked" = -1, "very dissatisfied" = 1, "dissatisfied" = 2,
      "not satisfied/dissatisfied" = 3, "satisfied" = 4,
      "very satisfied" = 5, "do not know" = 6
    )
    estimation <- c(
      "na, asked" = -1, "severe underweight" = 1, "underweight" = 2,
      "approx.. normal weight" = 3, "overweight" = 4,
      "severe overweight" = 5, "do not know" = 6
    )
    attention <- c(
      "na, asked" = -1, "yes, trying to lose weight" = 1,
      "yes, trying not gain weight" = 2,
      "yes, trying not to lose weight" = 3,
      "yes, trying to gain weight" = 4, "no" = 5, "do not know" = 6
    )
    label_variable("msatw", "Satisfaction with body weight", satisfaction, FALSE)
    label_variable("mestw", "Estimation body weight", estimation, FALSE)
    label_variable("mattw", "Pay attention to body weight", attention, FALSE)

    if (wave == "H") {
      label_variable("mwage25", "Weight at age 25", c("na, asked" = -1), TRUE)
    } else {
      label_variable("mmaxw", "Maximum weight in lifetime", c("na, section not done" = -3), TRUE)
      label_variable("magemxw", "Age at maximum weight", c("na, asked" = -1), TRUE)
      label_variable("mwage25", "Weight at age 25", c("na, asked" = -1), TRUE)
      label_variable("mwage40", "Weight at age 40", c("na, asked" = -1), TRUE)
      label_variable("mhage25", "Height at age 25", c("na, asked" = -1), TRUE)
    }
  } else if (wave == "MB") {
    label_variable(
      "mwloss", "Unintentional weight loss in past 6 months: lost 4 kg or more",
      c("na, asked" = -1, "no" = 1, "yes" = 2, "unknown" = 3), FALSE
    )
    screen_labels <- c("na, see BMWLOSS" = -2, "na, asked" = -1,
                       "no" = 1, "yes" = 2)
    label_variable("mwlclot", "Unintentional weight loss in past 6 months: looser fitting clothing", screen_labels, FALSE)
    label_variable("mwlbelt", "Unintentional weight loss in past 6 months: tightened belt", screen_labels, FALSE)
    label_variable("mwlwatc", "Unintentional weight loss in past 6 months: looser fitting watch", screen_labels, FALSE)
  } else {
    label_variable("mweightch", "Weight: change last 6 months", weight_change_labels(section_missing = TRUE), FALSE)
    amount_labels <- c(
      stats::setNames(-2, paste0("na, see ", wave, "MWEIGHTCH")),
      "na, asked" = -1
    )
    label_variable("mweightchkgl", "Weight loss kilogram", amount_labels, TRUE)
    label_variable("mweightchkgg", "Weight gain kilogram", amount_labels, TRUE)
    loss_reason <- c(
      stats::setNames(-2, paste0("na, see ", wave, "MWEIGHTCH")), "na, asked" = -1,
      "sickness (unintentional)" = 1, "diet (intentional)" = 2,
      "other diet (unintentional)" = 3,
      "more physical activity (intentional)" = 4,
      "reason unknown (unintentional)" = 5,
      "social factors (unintentional)" = 6,
      stats::setNames(7, paste0("other reason -> ", wave, "MWEIGHTCHRC"))
    )
    gain_reason <- c(
      stats::setNames(-2, paste0("na, see ", if (wave == "J") "I" else wave, "MWEIGHTCH")),
      "na, asked" = -1, "sickness" = 1, "eating more or different" = 2,
      "less physical activity" = 3,
      "combination of eating more/different and physical inactive" = 4,
      "reason unknown" = 5,
      stats::setNames(6, paste0("other reason -> ", if (wave == "J") "I" else wave, "MWEIGHTCHRC"))
    )
    label_variable("mweightlr2", "Weight loss reason", loss_reason, FALSE)
    label_variable("mweightgr2", "Weight gain reason", gain_reason, FALSE)
    if (wave == "I") {
      label_variable(
        "mweightchrc", "Weight change other: coded",
        c("no valid data" = -3, "na, see IMWEIGHTLR2/GR2" = -2,
          "na, asked" = -1, reason_table(TRUE)),
        FALSE
      )
      label_variable(
        "mweightlr", "Reason weight loss: coded",
        c("no valid data" = -3, "na, see IMWEIGHTLR2" = -2,
          "na, asked" = -1, "sickness (unintentional)" = 1,
          "diet (intentional)" = 2, "different diet (unintentional)" = 3,
          "physical activity (intentional)" = 4,
          "reason unknown (unintentional)" = 5,
          "social factors (unintentional)" = 6, "other reason (7)" = 7,
          "eating less or different (unknown)" = 8,
          "eating less and physical active (intentional)" = 9,
          "physical activity (unintentional)" = 10,
          "physical activity (unknown)" = 11, "aging (unintentional)" = 12),
        FALSE
      )
      label_variable(
        "mweightgr", "Reason weight gain: coded",
        c("no valid data" = -3, "na, see IMWEIGHTGR2" = -2,
          "na, asked" = -1, "sickness" = 1, "related to eating" = 2,
          "physical inactivity" = 3, "eating and physical inactivity" = 4,
          "reason unknown" = 5, "other reason" = 6, "aging" = 7,
          "social factors" = 8),
        FALSE
      )
    }
    label_variable(
      "meatl6m", "Eating less last 6 months (problems)",
      c("na, section not done" = -3, "na, asked" = -1,
        "did not eat less" = 1, "did eat somewhat less" = 2,
        "did eat much less" = 3), FALSE
    )
    label_variable(
      "mprob6m", "Psychological stress or severe sickness last 6 months",
      c("na, section ot done" = -3, "na, asked" = -1,
        "no" = 1, "yes" = 2), FALSE
    )
    label_variable(
      "mapp7d", "Appetite last 7 days",
      c("na, section ot done" = -3, "na, asked" = -1,
        "good" = 1, "moderate" = 2, "poor" = 3), FALSE
    )
    label_variable(
      "mestw", "Estimation body weight",
      c("na, section not done" = -3, "na, asked" = -1,
        "severe underweight" = 1, "underweight" = 2,
        "approx. normal weight" = 3, "overweight" = 4,
        "severe overweight" = 5, "do not know" = 6), FALSE
    )
    if (wave == "I") {
      history_labels <- c("na, section not done" = -3, "na, asked" = -1)
      label_variable("mwage25", "Weight at age 25", history_labels, TRUE)
      label_variable("mwage40", "Weight at age 40", history_labels, TRUE)
      label_variable("mhage25", "Height at age 25", history_labels, TRUE)
    }
  }

  engine$finalize()
}
