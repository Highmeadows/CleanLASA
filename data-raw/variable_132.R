## LASA filecode 132 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qfioe01 = "Fil Obl Exp 01: live",
  qfioe02 = "Fil Obl Exp 02: sick",
  qfioe03 = "Fil Obl Exp 03: financial",
  qfioe04 = "Fil Obl Exp 04: visit",
  qfioe05 = "Fil Obl Exp 05: phone",
  qfioe06 = "Fil Obl Exp 06: responsible",
  qfioe07 = "Fil Obl Exp 07: together",
  qfioe08 = "Fil Obl Exp 08: personal",
  qfioe09 = "Fil Obl Exp 09: support",
  qfioe10 = "Fil Obl Exp 10: time",
  qfioe11 = "Fil Obl Exp 11: need",
  qfioe12 = "Fil Obl Exp 12: advise",
  qfioe13 = "Fil Obl Exp 13: work",
  qfioe14 = "Fil Obl Exp 14: check",
  qfioe15 = "Fil Obl Exp 15: help",
  qfioe16 = "Fil Obl Exp 16: care"
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qfioe01 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe02 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe03 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe04 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe05 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe06 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe07 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe08 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe09 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe10 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe11 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe12 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe13 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe14 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe15 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qfioe16 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/disagreement",
    `4` = "agree",
    `5` = "strongly agree"
  )
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qfioe01 = .replace_labels(
    standardized_value_labels$qfioe01,
    `-1` = "no answer"
  ),
    qfioe02 = .replace_labels(
    standardized_value_labels$qfioe02,
    `-1` = "no answer"
  ),
    qfioe03 = .replace_labels(
    standardized_value_labels$qfioe03,
    `-1` = "no answer"
  ),
    qfioe04 = .replace_labels(
    standardized_value_labels$qfioe04,
    `-1` = "no answer"
  ),
    qfioe05 = .replace_labels(
    standardized_value_labels$qfioe05,
    `-1` = "no answer"
  ),
    qfioe06 = .replace_labels(
    standardized_value_labels$qfioe06,
    `-1` = "no answer"
  ),
    qfioe07 = .replace_labels(
    standardized_value_labels$qfioe07,
    `-1` = "no answer"
  ),
    qfioe08 = .replace_labels(
    standardized_value_labels$qfioe08,
    `-1` = "no answer"
  ),
    qfioe09 = .replace_labels(
    standardized_value_labels$qfioe09,
    `-1` = "no answer"
  ),
    qfioe10 = .replace_labels(
    standardized_value_labels$qfioe10,
    `-1` = "no answer"
  ),
    qfioe11 = .replace_labels(
    standardized_value_labels$qfioe11,
    `-1` = "no answer"
  ),
    qfioe12 = .replace_labels(
    standardized_value_labels$qfioe12,
    `-1` = "no answer"
  ),
    qfioe13 = .replace_labels(
    standardized_value_labels$qfioe13,
    `-1` = "no answer"
  ),
    qfioe14 = .replace_labels(
    standardized_value_labels$qfioe14,
    `-1` = "no answer"
  ),
    qfioe15 = .replace_labels(
    standardized_value_labels$qfioe15,
    `-1` = "no answer"
  ),
    qfioe16 = .replace_labels(
    standardized_value_labels$qfioe16,
    `-1` = "no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qfioe01 = .replace_labels(
    standardized_value_labels$qfioe01,
    `-1` = "no answer"
  ),
    qfioe02 = .replace_labels(
    standardized_value_labels$qfioe02,
    `-1` = "no answer"
  ),
    qfioe03 = .replace_labels(
    standardized_value_labels$qfioe03,
    `-1` = "no answer"
  ),
    qfioe04 = .replace_labels(
    standardized_value_labels$qfioe04,
    `-1` = "no answer"
  ),
    qfioe05 = .replace_labels(
    standardized_value_labels$qfioe05,
    `-1` = "no answer"
  ),
    qfioe06 = .replace_labels(
    standardized_value_labels$qfioe06,
    `-1` = "no answer"
  ),
    qfioe07 = .replace_labels(
    standardized_value_labels$qfioe07,
    `-1` = "no answer"
  ),
    qfioe08 = .replace_labels(
    standardized_value_labels$qfioe08,
    `-1` = "no answer"
  ),
    qfioe09 = .replace_labels(
    standardized_value_labels$qfioe09,
    `-1` = "no answer"
  ),
    qfioe10 = .replace_labels(
    standardized_value_labels$qfioe10,
    `-1` = "no answer"
  ),
    qfioe11 = .replace_labels(
    standardized_value_labels$qfioe11,
    `-1` = "no answer"
  ),
    qfioe12 = .replace_labels(
    standardized_value_labels$qfioe12,
    `-1` = "no answer"
  ),
    qfioe13 = .replace_labels(
    standardized_value_labels$qfioe13,
    `-1` = "no answer"
  ),
    qfioe14 = .replace_labels(
    standardized_value_labels$qfioe14,
    `-1` = "no answer"
  ),
    qfioe15 = .replace_labels(
    standardized_value_labels$qfioe15,
    `-1` = "no answer"
  ),
    qfioe16 = .replace_labels(
    standardized_value_labels$qfioe16,
    `-1` = "no answer"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qfioe01 = .replace_labels(
    standardized_value_labels$qfioe01,
    `-1` = "no answer"
  ),
    qfioe02 = .replace_labels(
    standardized_value_labels$qfioe02,
    `-1` = "no answer"
  ),
    qfioe03 = .replace_labels(
    standardized_value_labels$qfioe03,
    `-1` = "no answer"
  ),
    qfioe04 = .replace_labels(
    standardized_value_labels$qfioe04,
    `-1` = "no answer"
  ),
    qfioe05 = .replace_labels(
    standardized_value_labels$qfioe05,
    `-1` = "no answer"
  ),
    qfioe06 = .replace_labels(
    standardized_value_labels$qfioe06,
    `-1` = "no answer"
  ),
    qfioe07 = .replace_labels(
    standardized_value_labels$qfioe07,
    `-1` = "no answer"
  ),
    qfioe08 = .replace_labels(
    standardized_value_labels$qfioe08,
    `-1` = "no answer"
  ),
    qfioe09 = .replace_labels(
    standardized_value_labels$qfioe09,
    `-1` = "no answer"
  ),
    qfioe10 = .replace_labels(
    standardized_value_labels$qfioe10,
    `-1` = "no answer"
  ),
    qfioe11 = .replace_labels(
    standardized_value_labels$qfioe11,
    `-1` = "no answer"
  ),
    qfioe12 = .replace_labels(
    standardized_value_labels$qfioe12,
    `-1` = "no answer"
  ),
    qfioe13 = .replace_labels(
    standardized_value_labels$qfioe13,
    `-1` = "no answer"
  ),
    qfioe14 = .replace_labels(
    standardized_value_labels$qfioe14,
    `-1` = "no answer"
  ),
    qfioe15 = .replace_labels(
    standardized_value_labels$qfioe15,
    `-1` = "no answer"
  ),
    qfioe16 = .replace_labels(
    standardized_value_labels$qfioe16,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qfioe01 = "categorical",
  qfioe02 = "categorical",
  qfioe03 = "categorical",
  qfioe04 = "categorical",
  qfioe05 = "categorical",
  qfioe06 = "categorical",
  qfioe07 = "categorical",
  qfioe08 = "categorical",
  qfioe09 = "categorical",
  qfioe10 = "categorical",
  qfioe11 = "categorical",
  qfioe12 = "categorical",
  qfioe13 = "categorical",
  qfioe14 = "categorical",
  qfioe15 = "categorical",
  qfioe16 = "categorical"
)

.lasa_fc_132 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "132", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "132", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "132", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "132", waves = .lasa_wave_rows())
)
