## LASA filecode 120 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qsex01 = "sexual life 01: evaluation past",
  qsex02 = "sexual life 02: importance present",
  qsex03 = "sexual life 03: evaluation present",
  qsex04 = "sexual life 04: not important at this age",
  qsex05 = "sexual life 5: need for intimacy"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels[c("qsex01", "qsex02", "qsex03")],
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels[c("qsex01", "qsex02", "qsex03")],
  Wave_F_labels = harmonized_labels[c("qsex02", "qsex03", "qsex04", "qsex05")],
  Wave_3B_labels = harmonized_labels[c("qsex01", "qsex02", "qsex03")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qsex01 = c(
    `-1` = "not available",
    `1` = "very unpleasant",
    `2` = "unpleasant",
    `3` = "not unpleasant/pleasant",
    `4` = "pleasant",
    `5` = "very pleasant"
  ),
  qsex02 = c(
    `-1` = "not available",
    `1` = "very unimportant",
    `2` = "unimportant",
    `3` = "not unimportant/important",
    `4` = "important",
    `5` = "very important"
  ),
  qsex03 = c(
    `-1` = "not available",
    `1` = "very unpleasant",
    `2` = "unpleasant",
    `3` = "not unpleasant/pleasant",
    `4` = "pleasant",
    `5` = "very pleasant",
    `6` = "not applicable"
  ),
  qsex04 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qsex05 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("qsex01", "qsex02", "qsex03")],
    qsex01 = .replace_labels(
    standardized_value_labels$qsex01,
    `-1` = "no answer"
  ),
    qsex02 = .replace_labels(
    standardized_value_labels$qsex02,
    `-1` = "no answer"
  ),
    qsex03 = .replace_labels(
    standardized_value_labels$qsex03,
    `-1` = "no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qsex01 = .replace_labels(
    standardized_value_labels$qsex01,
    `-1` = "no answer"
  ),
    qsex02 = .replace_labels(
    standardized_value_labels$qsex02,
    `-1` = "no answer"
  ),
    qsex03 = .replace_labels(
    standardized_value_labels$qsex03,
    `-1` = "no answer"
  ),
    qsex04 = .replace_labels(
    standardized_value_labels$qsex04,
    `-1` = "no answer"
  ),
    qsex05 = .replace_labels(
    standardized_value_labels$qsex05,
    `-1` = "no answer"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("qsex01", "qsex02", "qsex03")],
    qsex01 = .replace_labels(
    standardized_value_labels$qsex01,
    `-1` = "no answer"
  ),
    qsex02 = .replace_labels(
    standardized_value_labels$qsex02,
    `-1` = "no answer"
  ),
    qsex03 = .replace_labels(
    standardized_value_labels$qsex03,
    `-1` = "no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("qsex02", "qsex03", "qsex04", "qsex05")],
    qsex02 = .replace_labels(
    standardized_value_labels$qsex02,
    `-1` = "no answer"
  ),
    qsex03 = .replace_labels(
    standardized_value_labels$qsex03,
    `-1` = "no answer"
  ),
    qsex04 = .replace_labels(
    standardized_value_labels$qsex04,
    `-1` = "no answer"
  ),
    qsex05 = .replace_labels(
    standardized_value_labels$qsex05,
    `-1` = "no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("qsex01", "qsex02", "qsex03")],
    qsex01 = .replace_labels(
    standardized_value_labels$qsex01,
    `-1` = "no answer"
  ),
    qsex02 = .replace_labels(
    standardized_value_labels$qsex02,
    `-1` = "no answer"
  ),
    qsex03 = .replace_labels(
    standardized_value_labels$qsex03,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qsex01 = "categorical",
  qsex02 = "categorical",
  qsex03 = "categorical",
  qsex04 = "categorical",
  qsex05 = "categorical"
)

.lasa_fc_120 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "120", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "120", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "120", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "120", waves = .lasa_wave_rows())
)
