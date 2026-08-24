## LASA filecode 111 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qhumor1 = "Humor 1: less problems (+)",
  qhumor2 = "Humor 2: tense situation (+)",
  qhumor3 = "Humor 3: cry/laugh (+)",
  qhumor4 = "Humor 4: joke (+)",
  qhumor5 = "Humor 5: efficient (+)"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qhumor1 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhumor2 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhumor3 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhumor4 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhumor5 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qhumor1 = .replace_labels(
    standardized_value_labels$qhumor1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhumor2 = .replace_labels(
    standardized_value_labels$qhumor2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhumor3 = .replace_labels(
    standardized_value_labels$qhumor3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhumor4 = .replace_labels(
    standardized_value_labels$qhumor4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhumor5 = .replace_labels(
    standardized_value_labels$qhumor5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qhumor1 = .replace_labels(
    standardized_value_labels$qhumor1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhumor2 = .replace_labels(
    standardized_value_labels$qhumor2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhumor3 = .replace_labels(
    standardized_value_labels$qhumor3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhumor4 = .replace_labels(
    standardized_value_labels$qhumor4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhumor5 = .replace_labels(
    standardized_value_labels$qhumor5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qhumor1 = "categorical",
  qhumor2 = "categorical",
  qhumor3 = "categorical",
  qhumor4 = "categorical",
  qhumor5 = "categorical"
)

.lasa_fc_111 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "111", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "111", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "111", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "111", waves = .lasa_wave_rows())
)
