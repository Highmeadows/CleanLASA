## LASA filecode 139 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qpadl1 = "Partner func. lim. 1: stairs",
  qpadl2 = "Partner func. lim. 2: dress",
  qpadl3 = "Partner func. lim. 3: chair",
  qpadl4 = "Partner func. lim. 4: toenails",
  qpadl5 = "Partner func. lim. 5: walk",
  qpadl6 = "Partner func. lim. 6: public transportation",
  qpdeme = "Partner diagnosed with dementia",
  qpdis1 = "Partner dispute 1: financial affairs",
  qpdis2 = "Partner dispute 2: domestic affairs",
  qpdis3 = "Partner dispute 3: spare time",
  qpdis4 = "Partner dispute 4: consideration",
  qpmemo = "Partner problem with memory",
  qprel1 = "Partner rel. 1: daily support",
  qprel2 = "Partner rel. 2: motivated",
  qprel3 = "Partner rel. 3: personality",
  qprel4 = "Partner rel. 4: consideration",
  qprel5 = "Partner rel. 5: disputes",
  qprel6 = "Partner rel. 6: decision making",
  qprel7 = "Partner rel. 7: evaluation now",
  qprel8 = "Partner rel. 8: evaluation 10 years ago",
  qprespc1 = "Partner respite care: daytime activities",
  qprespc2 = "Partner respite care: overnight stay in care institution",
  qprespc3 = "Partner respite care: lodging facility for a few days",
  qprespc4 = "Partner respite care: minder, so R can go away part of the day",
  qptalk = "Partner important conversation"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
  Wave_F_labels = harmonized_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
  Wave_G_labels = harmonized_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
  Wave_H_labels = harmonized_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
  Wave_3B_labels = harmonized_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpdeme",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprespc1",
    "qprespc2",
    "qprespc3",
    "qprespc4",
    "qptalk"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qpadl1 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "no, partner cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  qpadl2 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "no, partner cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  qpadl3 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "no, partner cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  qpadl4 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "no, partner cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  qpadl5 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "no, partner cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  qpadl6 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "no, partner cannot",
    `2` = "only with help",
    `3` = "yes, with much difficulty",
    `4` = "yes, with some difficulty",
    `5` = "yes, without help"
  ),
  qpdeme = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qpdis1 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "strongly in disagreement",
    `2` = "reasonably in disagreement",
    `3` = "a little in disagreement",
    `4` = "totally not in disagreement"
  ),
  qpdis2 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "strongly in disagreement",
    `2` = "reasonably in disagreement",
    `3` = "a little in disagreement",
    `4` = "totally not in disagreement"
  ),
  qpdis3 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "strongly in disagreement",
    `2` = "reasonably in disagreement",
    `3` = "a little in disagreement",
    `4` = "totally not in disagreement"
  ),
  qpdis4 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "strongly in disagreement",
    `2` = "reasonably in disagreement",
    `3` = "a little in disagreement",
    `4` = "totally not in disagreement"
  ),
  qpmemo = c(`-2` = "not available", `-1` = "not available", `1` = "no", `2` = "yes"),
  qprel1 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "a little dissatisfied",
    `4` = "satisfied",
    `5` = "very satisfied"
  ),
  qprel2 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "a little dissatisfied",
    `4` = "satisfied",
    `5` = "very satisfied"
  ),
  qprel3 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "a little dissatisfied",
    `4` = "satisfied",
    `5` = "very satisfied"
  ),
  qprel4 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "a little dissatisfied",
    `4` = "satisfied",
    `5` = "very satisfied"
  ),
  qprel5 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "a little dissatisfied",
    `4` = "satisfied",
    `5` = "very satisfied"
  ),
  qprel6 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "a little dissatisfied",
    `4` = "satisfied",
    `5` = "very satisfied"
  ),
  qprel7 = c(`-2` = "not available", `-1` = "not available", `1` = NA_character_, `10` = NA_character_),
  qprel8 = c(`-2` = "not available", `-1` = "not available", `1` = NA_character_, `10` = NA_character_),
  qprespc1 = c(`-2` = "not available, routing", `-1` = "not available", `1` = "no", `2` = "yes"),
  qprespc2 = c(`-2` = "not available, routing", `-1` = "not available", `1` = "no", `2` = "yes"),
  qprespc3 = c(`-2` = "not available, routing", `-1` = "not available", `1` = "no", `2` = "yes"),
  qprespc4 = c(`-2` = "not available, routing", `-1` = "not available", `1` = "no", `2` = "yes"),
  qptalk = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "at least once a day",
    `2` = "a few times a week",
    `3` = "once a week",
    `4` = "once a month",
    `5` = "less than once a month"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
    qpadl1 = .replace_labels(
    standardized_value_labels$qpadl1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl2 = .replace_labels(
    standardized_value_labels$qpadl2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl3 = .replace_labels(
    standardized_value_labels$qpadl3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl4 = .replace_labels(
    standardized_value_labels$qpadl4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl5 = .replace_labels(
    standardized_value_labels$qpadl5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl6 = .replace_labels(
    standardized_value_labels$qpadl6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdeme = .replace_labels(
    standardized_value_labels$qpdeme,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis1 = .replace_labels(
    standardized_value_labels$qpdis1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis2 = .replace_labels(
    standardized_value_labels$qpdis2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis3 = .replace_labels(
    standardized_value_labels$qpdis3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis4 = .replace_labels(
    standardized_value_labels$qpdis4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpmemo = .replace_labels(
    standardized_value_labels$qpmemo,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel1 = .replace_labels(
    standardized_value_labels$qprel1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel2 = .replace_labels(
    standardized_value_labels$qprel2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel3 = .replace_labels(
    standardized_value_labels$qprel3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel4 = .replace_labels(
    standardized_value_labels$qprel4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel5 = .replace_labels(
    standardized_value_labels$qprel5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel6 = .replace_labels(
    standardized_value_labels$qprel6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel7 = .replace_labels(
    standardized_value_labels$qprel7,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel8 = .replace_labels(
    standardized_value_labels$qprel8,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qptalk = .replace_labels(
    standardized_value_labels$qptalk,
    `-2` = "no partner",
    `-1` = "no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
    qpadl1 = .replace_labels(
    standardized_value_labels$qpadl1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl2 = .replace_labels(
    standardized_value_labels$qpadl2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl3 = .replace_labels(
    standardized_value_labels$qpadl3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl4 = .replace_labels(
    standardized_value_labels$qpadl4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl5 = .replace_labels(
    standardized_value_labels$qpadl5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl6 = .replace_labels(
    standardized_value_labels$qpadl6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdeme = .replace_labels(
    standardized_value_labels$qpdeme,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis1 = .replace_labels(
    standardized_value_labels$qpdis1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis2 = .replace_labels(
    standardized_value_labels$qpdis2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis3 = .replace_labels(
    standardized_value_labels$qpdis3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis4 = .replace_labels(
    standardized_value_labels$qpdis4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpmemo = .replace_labels(
    standardized_value_labels$qpmemo,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel1 = .replace_labels(
    standardized_value_labels$qprel1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel2 = .replace_labels(
    standardized_value_labels$qprel2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel3 = .replace_labels(
    standardized_value_labels$qprel3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel4 = .replace_labels(
    standardized_value_labels$qprel4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel5 = .replace_labels(
    standardized_value_labels$qprel5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel6 = .replace_labels(
    standardized_value_labels$qprel6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel7 = .replace_labels(
    standardized_value_labels$qprel7,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel8 = .replace_labels(
    standardized_value_labels$qprel8,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qptalk = .replace_labels(
    standardized_value_labels$qptalk,
    `-2` = "no partner",
    `-1` = "no answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
    qpadl1 = .replace_labels(
    standardized_value_labels$qpadl1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl2 = .replace_labels(
    standardized_value_labels$qpadl2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl3 = .replace_labels(
    standardized_value_labels$qpadl3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl4 = .replace_labels(
    standardized_value_labels$qpadl4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl5 = .replace_labels(
    standardized_value_labels$qpadl5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl6 = .replace_labels(
    standardized_value_labels$qpadl6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdeme = .replace_labels(
    standardized_value_labels$qpdeme,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis1 = .replace_labels(
    standardized_value_labels$qpdis1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis2 = .replace_labels(
    standardized_value_labels$qpdis2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis3 = .replace_labels(
    standardized_value_labels$qpdis3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis4 = .replace_labels(
    standardized_value_labels$qpdis4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpmemo = .replace_labels(
    standardized_value_labels$qpmemo,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel1 = .replace_labels(
    standardized_value_labels$qprel1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel2 = .replace_labels(
    standardized_value_labels$qprel2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel3 = .replace_labels(
    standardized_value_labels$qprel3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel4 = .replace_labels(
    standardized_value_labels$qprel4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel5 = .replace_labels(
    standardized_value_labels$qprel5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel6 = .replace_labels(
    standardized_value_labels$qprel6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel7 = .replace_labels(
    standardized_value_labels$qprel7,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel8 = .replace_labels(
    standardized_value_labels$qprel8,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qptalk = .replace_labels(
    standardized_value_labels$qptalk,
    `-2` = "no partner",
    `-1` = "no answer"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
    qpadl1 = .replace_labels(
    standardized_value_labels$qpadl1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl2 = .replace_labels(
    standardized_value_labels$qpadl2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl3 = .replace_labels(
    standardized_value_labels$qpadl3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl4 = .replace_labels(
    standardized_value_labels$qpadl4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl5 = .replace_labels(
    standardized_value_labels$qpadl5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl6 = .replace_labels(
    standardized_value_labels$qpadl6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdeme = .replace_labels(
    standardized_value_labels$qpdeme,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis1 = .replace_labels(
    standardized_value_labels$qpdis1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis2 = .replace_labels(
    standardized_value_labels$qpdis2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis3 = .replace_labels(
    standardized_value_labels$qpdis3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis4 = .replace_labels(
    standardized_value_labels$qpdis4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpmemo = .replace_labels(
    standardized_value_labels$qpmemo,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel1 = .replace_labels(
    standardized_value_labels$qprel1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel2 = .replace_labels(
    standardized_value_labels$qprel2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel3 = .replace_labels(
    standardized_value_labels$qprel3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel4 = .replace_labels(
    standardized_value_labels$qprel4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel5 = .replace_labels(
    standardized_value_labels$qprel5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel6 = .replace_labels(
    standardized_value_labels$qprel6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel7 = .replace_labels(
    standardized_value_labels$qprel7,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel8 = .replace_labels(
    standardized_value_labels$qprel8,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qptalk = .replace_labels(
    standardized_value_labels$qptalk,
    `-2` = "no partner",
    `-1` = "no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpadl6",
    "qpdeme",
    "qpdis1",
    "qpdis2",
    "qpdis3",
    "qpdis4",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprel7",
    "qprel8",
    "qptalk"
  )],
    qpadl1 = .replace_labels(
    standardized_value_labels$qpadl1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl2 = .replace_labels(
    standardized_value_labels$qpadl2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl3 = .replace_labels(
    standardized_value_labels$qpadl3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl4 = .replace_labels(
    standardized_value_labels$qpadl4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl5 = .replace_labels(
    standardized_value_labels$qpadl5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl6 = .replace_labels(
    standardized_value_labels$qpadl6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdeme = .replace_labels(
    standardized_value_labels$qpdeme,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis1 = .replace_labels(
    standardized_value_labels$qpdis1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis2 = .replace_labels(
    standardized_value_labels$qpdis2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis3 = .replace_labels(
    standardized_value_labels$qpdis3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis4 = .replace_labels(
    standardized_value_labels$qpdis4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpmemo = .replace_labels(
    standardized_value_labels$qpmemo,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel1 = .replace_labels(
    standardized_value_labels$qprel1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel2 = .replace_labels(
    standardized_value_labels$qprel2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel3 = .replace_labels(
    standardized_value_labels$qprel3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel4 = .replace_labels(
    standardized_value_labels$qprel4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel5 = .replace_labels(
    standardized_value_labels$qprel5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel6 = .replace_labels(
    standardized_value_labels$qprel6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel7 = .replace_labels(
    standardized_value_labels$qprel7,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel8 = .replace_labels(
    standardized_value_labels$qprel8,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qptalk = .replace_labels(
    standardized_value_labels$qptalk,
    `-2` = "no partner",
    `-1` = "no answer"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qpadl1 = .replace_labels(
    standardized_value_labels$qpadl1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl2 = .replace_labels(
    standardized_value_labels$qpadl2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl3 = .replace_labels(
    standardized_value_labels$qpadl3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl4 = .replace_labels(
    standardized_value_labels$qpadl4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl5 = .replace_labels(
    standardized_value_labels$qpadl5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl6 = .replace_labels(
    standardized_value_labels$qpadl6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdeme = .replace_labels(
    standardized_value_labels$qpdeme,
    `-2` = "na, see I/J/KQPMEMO",
    `-1` = "no answer"
  ),
    qpdis1 = .replace_labels(
    standardized_value_labels$qpdis1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis2 = .replace_labels(
    standardized_value_labels$qpdis2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis3 = .replace_labels(
    standardized_value_labels$qpdis3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis4 = .replace_labels(
    standardized_value_labels$qpdis4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpmemo = .replace_labels(
    standardized_value_labels$qpmemo,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel1 = .replace_labels(
    standardized_value_labels$qprel1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel2 = .replace_labels(
    standardized_value_labels$qprel2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel3 = .replace_labels(
    standardized_value_labels$qprel3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel4 = .replace_labels(
    standardized_value_labels$qprel4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel5 = .replace_labels(
    standardized_value_labels$qprel5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel6 = .replace_labels(
    standardized_value_labels$qprel6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel7 = .replace_labels(
    standardized_value_labels$qprel7,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel8 = .replace_labels(
    standardized_value_labels$qprel8,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprespc1 = .replace_labels(
    standardized_value_labels$qprespc1,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qprespc2 = .replace_labels(
    standardized_value_labels$qprespc2,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qprespc3 = .replace_labels(
    standardized_value_labels$qprespc3,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qprespc4 = .replace_labels(
    standardized_value_labels$qprespc4,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qptalk = .replace_labels(
    standardized_value_labels$qptalk,
    `-2` = "no partner",
    `-1` = "no answer"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qpadl1 = .replace_labels(
    standardized_value_labels$qpadl1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl2 = .replace_labels(
    standardized_value_labels$qpadl2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl3 = .replace_labels(
    standardized_value_labels$qpadl3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl4 = .replace_labels(
    standardized_value_labels$qpadl4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl5 = .replace_labels(
    standardized_value_labels$qpadl5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl6 = .replace_labels(
    standardized_value_labels$qpadl6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdeme = .replace_labels(
    standardized_value_labels$qpdeme,
    `-2` = "na, see I/J/KQPMEMO",
    `-1` = "no answer"
  ),
    qpdis1 = .replace_labels(
    standardized_value_labels$qpdis1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis2 = .replace_labels(
    standardized_value_labels$qpdis2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis3 = .replace_labels(
    standardized_value_labels$qpdis3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdis4 = .replace_labels(
    standardized_value_labels$qpdis4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpmemo = .replace_labels(
    standardized_value_labels$qpmemo,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel1 = .replace_labels(
    standardized_value_labels$qprel1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel2 = .replace_labels(
    standardized_value_labels$qprel2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel3 = .replace_labels(
    standardized_value_labels$qprel3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel4 = .replace_labels(
    standardized_value_labels$qprel4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel5 = .replace_labels(
    standardized_value_labels$qprel5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel6 = .replace_labels(
    standardized_value_labels$qprel6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel7 = .replace_labels(
    standardized_value_labels$qprel7,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel8 = .replace_labels(
    standardized_value_labels$qprel8,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprespc1 = .replace_labels(
    standardized_value_labels$qprespc1,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qprespc2 = .replace_labels(
    standardized_value_labels$qprespc2,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qprespc3 = .replace_labels(
    standardized_value_labels$qprespc3,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qprespc4 = .replace_labels(
    standardized_value_labels$qprespc4,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qptalk = .replace_labels(
    standardized_value_labels$qptalk,
    `-2` = "no partner",
    `-1` = "no answer"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "qpadl1",
    "qpadl2",
    "qpadl3",
    "qpadl4",
    "qpadl5",
    "qpdeme",
    "qpmemo",
    "qprel1",
    "qprel2",
    "qprel3",
    "qprel4",
    "qprel5",
    "qprel6",
    "qprespc1",
    "qprespc2",
    "qprespc3",
    "qprespc4",
    "qptalk"
  )],
    qpadl1 = .replace_labels(
    standardized_value_labels$qpadl1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl2 = .replace_labels(
    standardized_value_labels$qpadl2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl3 = .replace_labels(
    standardized_value_labels$qpadl3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl4 = .replace_labels(
    standardized_value_labels$qpadl4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpadl5 = .replace_labels(
    standardized_value_labels$qpadl5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qpdeme = .replace_labels(
    standardized_value_labels$qpdeme,
    `-2` = "na, see I/J/KQPMEMO",
    `-1` = "no answer"
  ),
    qpmemo = .replace_labels(
    standardized_value_labels$qpmemo,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel1 = .replace_labels(
    standardized_value_labels$qprel1,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel2 = .replace_labels(
    standardized_value_labels$qprel2,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel3 = .replace_labels(
    standardized_value_labels$qprel3,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel4 = .replace_labels(
    standardized_value_labels$qprel4,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel5 = .replace_labels(
    standardized_value_labels$qprel5,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprel6 = .replace_labels(
    standardized_value_labels$qprel6,
    `-2` = "no partner",
    `-1` = "no answer"
  ),
    qprespc1 = .replace_labels(
    standardized_value_labels$qprespc1,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qprespc2 = .replace_labels(
    standardized_value_labels$qprespc2,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qprespc3 = .replace_labels(
    standardized_value_labels$qprespc3,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qprespc4 = .replace_labels(
    standardized_value_labels$qprespc4,
    `-2` = "na, see I/J/KQPDEME",
    `-1` = "no answer"
  ),
    qptalk = .replace_labels(
    standardized_value_labels$qptalk,
    `-2` = "no partner",
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qpadl1 = "categorical",
  qpadl2 = "categorical",
  qpadl3 = "categorical",
  qpadl4 = "categorical",
  qpadl5 = "categorical",
  qpadl6 = "categorical",
  qpdeme = "categorical",
  qpdis1 = "categorical",
  qpdis2 = "categorical",
  qpdis3 = "categorical",
  qpdis4 = "categorical",
  qpmemo = "categorical",
  qprel1 = "categorical",
  qprel2 = "categorical",
  qprel3 = "categorical",
  qprel4 = "categorical",
  qprel5 = "categorical",
  qprel6 = "categorical",
  qprel7 = "numeric",
  qprel8 = "numeric",
  qprespc1 = "categorical",
  qprespc2 = "categorical",
  qprespc3 = "categorical",
  qprespc4 = "categorical",
  qptalk = "categorical"
)

.lasa_fc_139 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "139", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "139", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "139", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "139", waves = .lasa_wave_rows())
)
