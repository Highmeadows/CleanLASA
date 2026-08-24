## LASA filecode 144 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qindf01 = "able to do things for myself",
  qindf02 = "proud to take care of myself",
  qindf03 = "bothers me when others notice",
  qindf04 = "live independently not very important",
  qindf05 = "does not bother me when unable to do a task",
  qindf06 = "important to work at sustaining my independence",
  qindf07 = "trying to improve my ability to function on my own",
  qindf08 = "admire people who live on their own",
  qindf09 = "friends often notice my self-sufficiency",
  qindf10 = "often notice my friends self-sufficiency",
  qindf11 = "be very accurate when remembering appointments",
  qindf12 = "be very accurate when taking my medications",
  qindf13 = "bothers me when unable to run errands on my own",
  qindf14 = "do things on my own, without relying on other people",
  qindf15 = "highly motivated to do things on my own",
  qindf16 = "great satisfaction to accomplish tasks independently",
  qindf17 = "ability to cope, independently or with help from others (score from 1 to 10)"
)

variable_labels_list <- list(
  Wave_F_labels = harmonized_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
  Wave_G_labels = harmonized_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
  Wave_H_labels = harmonized_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
  Wave_K_labels = harmonized_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qindf01 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf02 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf03 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf04 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf05 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf06 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf07 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf08 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf09 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf10 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf11 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf12 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf13 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf14 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf15 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf16 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qindf17 = c(`-1` = "not available")
)

value_labels_list <- list(
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
    qindf01 = .replace_labels(
    standardized_value_labels$qindf01,
    `-1` = "no answer"
  ),
    qindf02 = .replace_labels(
    standardized_value_labels$qindf02,
    `-1` = "no answer"
  ),
    qindf03 = .replace_labels(
    standardized_value_labels$qindf03,
    `-1` = "no answer"
  ),
    qindf04 = .replace_labels(
    standardized_value_labels$qindf04,
    `-1` = "no answer"
  ),
    qindf05 = .replace_labels(
    standardized_value_labels$qindf05,
    `-1` = "no answer"
  ),
    qindf06 = .replace_labels(
    standardized_value_labels$qindf06,
    `-1` = "no answer"
  ),
    qindf07 = .replace_labels(
    standardized_value_labels$qindf07,
    `-1` = "no answer"
  ),
    qindf08 = .replace_labels(
    standardized_value_labels$qindf08,
    `-1` = "no answer"
  ),
    qindf09 = .replace_labels(
    standardized_value_labels$qindf09,
    `-1` = "no answer"
  ),
    qindf10 = .replace_labels(
    standardized_value_labels$qindf10,
    `-1` = "no answer"
  ),
    qindf11 = .replace_labels(
    standardized_value_labels$qindf11,
    `-1` = "no answer"
  ),
    qindf12 = .replace_labels(
    standardized_value_labels$qindf12,
    `-1` = "no answer"
  ),
    qindf13 = .replace_labels(
    standardized_value_labels$qindf13,
    `-1` = "no answer"
  ),
    qindf14 = .replace_labels(
    standardized_value_labels$qindf14,
    `-1` = "no answer"
  ),
    qindf15 = .replace_labels(
    standardized_value_labels$qindf15,
    `-1` = "no answer"
  ),
    qindf16 = .replace_labels(
    standardized_value_labels$qindf16,
    `-1` = "no answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
    qindf01 = .replace_labels(
    standardized_value_labels$qindf01,
    `-1` = "no answer"
  ),
    qindf02 = .replace_labels(
    standardized_value_labels$qindf02,
    `-1` = "no answer"
  ),
    qindf03 = .replace_labels(
    standardized_value_labels$qindf03,
    `-1` = "no answer"
  ),
    qindf04 = .replace_labels(
    standardized_value_labels$qindf04,
    `-1` = "no answer"
  ),
    qindf05 = .replace_labels(
    standardized_value_labels$qindf05,
    `-1` = "no answer"
  ),
    qindf06 = .replace_labels(
    standardized_value_labels$qindf06,
    `-1` = "no answer"
  ),
    qindf07 = .replace_labels(
    standardized_value_labels$qindf07,
    `-1` = "no answer"
  ),
    qindf08 = .replace_labels(
    standardized_value_labels$qindf08,
    `-1` = "no answer"
  ),
    qindf09 = .replace_labels(
    standardized_value_labels$qindf09,
    `-1` = "no answer"
  ),
    qindf10 = .replace_labels(
    standardized_value_labels$qindf10,
    `-1` = "no answer"
  ),
    qindf11 = .replace_labels(
    standardized_value_labels$qindf11,
    `-1` = "no answer"
  ),
    qindf12 = .replace_labels(
    standardized_value_labels$qindf12,
    `-1` = "no answer"
  ),
    qindf13 = .replace_labels(
    standardized_value_labels$qindf13,
    `-1` = "no answer"
  ),
    qindf14 = .replace_labels(
    standardized_value_labels$qindf14,
    `-1` = "no answer"
  ),
    qindf15 = .replace_labels(
    standardized_value_labels$qindf15,
    `-1` = "no answer"
  ),
    qindf16 = .replace_labels(
    standardized_value_labels$qindf16,
    `-1` = "no answer"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
    qindf01 = .replace_labels(
    standardized_value_labels$qindf01,
    `-1` = "no answer"
  ),
    qindf02 = .replace_labels(
    standardized_value_labels$qindf02,
    `-1` = "no answer"
  ),
    qindf03 = .replace_labels(
    standardized_value_labels$qindf03,
    `-1` = "no answer"
  ),
    qindf04 = .replace_labels(
    standardized_value_labels$qindf04,
    `-1` = "no answer"
  ),
    qindf05 = .replace_labels(
    standardized_value_labels$qindf05,
    `-1` = "no answer"
  ),
    qindf06 = .replace_labels(
    standardized_value_labels$qindf06,
    `-1` = "no answer"
  ),
    qindf07 = .replace_labels(
    standardized_value_labels$qindf07,
    `-1` = "no answer"
  ),
    qindf08 = .replace_labels(
    standardized_value_labels$qindf08,
    `-1` = "no answer"
  ),
    qindf09 = .replace_labels(
    standardized_value_labels$qindf09,
    `-1` = "no answer"
  ),
    qindf10 = .replace_labels(
    standardized_value_labels$qindf10,
    `-1` = "no answer"
  ),
    qindf11 = .replace_labels(
    standardized_value_labels$qindf11,
    `-1` = "no answer"
  ),
    qindf12 = .replace_labels(
    standardized_value_labels$qindf12,
    `-1` = "no answer"
  ),
    qindf13 = .replace_labels(
    standardized_value_labels$qindf13,
    `-1` = "no answer"
  ),
    qindf14 = .replace_labels(
    standardized_value_labels$qindf14,
    `-1` = "no answer"
  ),
    qindf15 = .replace_labels(
    standardized_value_labels$qindf15,
    `-1` = "no answer"
  ),
    qindf16 = .replace_labels(
    standardized_value_labels$qindf16,
    `-1` = "no answer"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qindf01 = .replace_labels(
    standardized_value_labels$qindf01,
    `-1` = "no answer"
  ),
    qindf02 = .replace_labels(
    standardized_value_labels$qindf02,
    `-1` = "no answer"
  ),
    qindf03 = .replace_labels(
    standardized_value_labels$qindf03,
    `-1` = "no answer"
  ),
    qindf04 = .replace_labels(
    standardized_value_labels$qindf04,
    `-1` = "no answer"
  ),
    qindf05 = .replace_labels(
    standardized_value_labels$qindf05,
    `-1` = "no answer"
  ),
    qindf06 = .replace_labels(
    standardized_value_labels$qindf06,
    `-1` = "no answer"
  ),
    qindf07 = .replace_labels(
    standardized_value_labels$qindf07,
    `-1` = "no answer"
  ),
    qindf08 = .replace_labels(
    standardized_value_labels$qindf08,
    `-1` = "no answer"
  ),
    qindf09 = .replace_labels(
    standardized_value_labels$qindf09,
    `-1` = "no answer"
  ),
    qindf10 = .replace_labels(
    standardized_value_labels$qindf10,
    `-1` = "no answer"
  ),
    qindf11 = .replace_labels(
    standardized_value_labels$qindf11,
    `-1` = "no answer"
  ),
    qindf12 = .replace_labels(
    standardized_value_labels$qindf12,
    `-1` = "no answer"
  ),
    qindf13 = .replace_labels(
    standardized_value_labels$qindf13,
    `-1` = "no answer"
  ),
    qindf14 = .replace_labels(
    standardized_value_labels$qindf14,
    `-1` = "no answer"
  ),
    qindf15 = .replace_labels(
    standardized_value_labels$qindf15,
    `-1` = "no answer"
  ),
    qindf16 = .replace_labels(
    standardized_value_labels$qindf16,
    `-1` = "no answer"
  ),
    qindf17 = .replace_labels(
    standardized_value_labels$qindf17,
    `-1` = "no answer"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
    qindf01 = .replace_labels(
    standardized_value_labels$qindf01,
    `-1` = "no answer"
  ),
    qindf02 = .replace_labels(
    standardized_value_labels$qindf02,
    `-1` = "no answer"
  ),
    qindf03 = .replace_labels(
    standardized_value_labels$qindf03,
    `-1` = "no answer"
  ),
    qindf04 = .replace_labels(
    standardized_value_labels$qindf04,
    `-1` = "no answer"
  ),
    qindf05 = .replace_labels(
    standardized_value_labels$qindf05,
    `-1` = "no answer"
  ),
    qindf06 = .replace_labels(
    standardized_value_labels$qindf06,
    `-1` = "no answer"
  ),
    qindf07 = .replace_labels(
    standardized_value_labels$qindf07,
    `-1` = "no answer"
  ),
    qindf08 = .replace_labels(
    standardized_value_labels$qindf08,
    `-1` = "no answer"
  ),
    qindf09 = .replace_labels(
    standardized_value_labels$qindf09,
    `-1` = "no answer"
  ),
    qindf10 = .replace_labels(
    standardized_value_labels$qindf10,
    `-1` = "no answer"
  ),
    qindf11 = .replace_labels(
    standardized_value_labels$qindf11,
    `-1` = "no answer"
  ),
    qindf12 = .replace_labels(
    standardized_value_labels$qindf12,
    `-1` = "no answer"
  ),
    qindf13 = .replace_labels(
    standardized_value_labels$qindf13,
    `-1` = "no answer"
  ),
    qindf14 = .replace_labels(
    standardized_value_labels$qindf14,
    `-1` = "no answer"
  ),
    qindf15 = .replace_labels(
    standardized_value_labels$qindf15,
    `-1` = "no answer"
  ),
    qindf16 = .replace_labels(
    standardized_value_labels$qindf16,
    `-1` = "no answer"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "qindf01",
    "qindf02",
    "qindf03",
    "qindf04",
    "qindf05",
    "qindf06",
    "qindf07",
    "qindf08",
    "qindf09",
    "qindf10",
    "qindf11",
    "qindf12",
    "qindf13",
    "qindf14",
    "qindf15",
    "qindf16"
  )],
    qindf01 = .replace_labels(
    standardized_value_labels$qindf01,
    `-1` = "no answer"
  ),
    qindf02 = .replace_labels(
    standardized_value_labels$qindf02,
    `-1` = "no answer"
  ),
    qindf03 = .replace_labels(
    standardized_value_labels$qindf03,
    `-1` = "no answer"
  ),
    qindf04 = .replace_labels(
    standardized_value_labels$qindf04,
    `-1` = "no answer"
  ),
    qindf05 = .replace_labels(
    standardized_value_labels$qindf05,
    `-1` = "no answer"
  ),
    qindf06 = .replace_labels(
    standardized_value_labels$qindf06,
    `-1` = "no answer"
  ),
    qindf07 = .replace_labels(
    standardized_value_labels$qindf07,
    `-1` = "no answer"
  ),
    qindf08 = .replace_labels(
    standardized_value_labels$qindf08,
    `-1` = "no answer"
  ),
    qindf09 = .replace_labels(
    standardized_value_labels$qindf09,
    `-1` = "no answer"
  ),
    qindf10 = .replace_labels(
    standardized_value_labels$qindf10,
    `-1` = "no answer"
  ),
    qindf11 = .replace_labels(
    standardized_value_labels$qindf11,
    `-1` = "no answer"
  ),
    qindf12 = .replace_labels(
    standardized_value_labels$qindf12,
    `-1` = "no answer"
  ),
    qindf13 = .replace_labels(
    standardized_value_labels$qindf13,
    `-1` = "no answer"
  ),
    qindf14 = .replace_labels(
    standardized_value_labels$qindf14,
    `-1` = "no answer"
  ),
    qindf15 = .replace_labels(
    standardized_value_labels$qindf15,
    `-1` = "no answer"
  ),
    qindf16 = .replace_labels(
    standardized_value_labels$qindf16,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qindf01 = "categorical",
  qindf02 = "categorical",
  qindf03 = "categorical",
  qindf04 = "categorical",
  qindf05 = "categorical",
  qindf06 = "categorical",
  qindf07 = "categorical",
  qindf08 = "categorical",
  qindf09 = "categorical",
  qindf10 = "categorical",
  qindf11 = "categorical",
  qindf12 = "categorical",
  qindf13 = "categorical",
  qindf14 = "categorical",
  qindf15 = "categorical",
  qindf16 = "categorical",
  qindf17 = "numeric"
)

.lasa_fc_144 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "144", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "144", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "144", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "144", waves = .lasa_wave_rows())
)
