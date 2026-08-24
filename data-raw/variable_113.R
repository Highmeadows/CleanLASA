## LASA filecode 113 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qhealt1 = "Health 1: sick in future",
  qhealt2 = "Health 2: somewhat ill",
  qhealt3 = "Health 3: better health",
  qhealt4 = "Health 4: equal health",
  qhealt5 = "Health 5: less healthy",
  qhealt6 = "Health 6: excellent",
  qhealt7 = "Health 7: healthy life",
  qhealt8 = "Health 8: feeling bad"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qhealt1 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhealt2 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhealt3 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhealt4 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhealt5 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhealt6 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhealt7 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "neither agree nor disagree",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qhealt8 = c(
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
    qhealt1 = .replace_labels(
    standardized_value_labels$qhealt1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt2 = .replace_labels(
    standardized_value_labels$qhealt2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt3 = .replace_labels(
    standardized_value_labels$qhealt3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt4 = .replace_labels(
    standardized_value_labels$qhealt4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt5 = .replace_labels(
    standardized_value_labels$qhealt5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt6 = .replace_labels(
    standardized_value_labels$qhealt6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt7 = .replace_labels(
    standardized_value_labels$qhealt7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt8 = .replace_labels(
    standardized_value_labels$qhealt8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qhealt1 = .replace_labels(
    standardized_value_labels$qhealt1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt2 = .replace_labels(
    standardized_value_labels$qhealt2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt3 = .replace_labels(
    standardized_value_labels$qhealt3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt4 = .replace_labels(
    standardized_value_labels$qhealt4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt5 = .replace_labels(
    standardized_value_labels$qhealt5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt6 = .replace_labels(
    standardized_value_labels$qhealt6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt7 = .replace_labels(
    standardized_value_labels$qhealt7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt8 = .replace_labels(
    standardized_value_labels$qhealt8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qhealt1 = .replace_labels(
    standardized_value_labels$qhealt1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt2 = .replace_labels(
    standardized_value_labels$qhealt2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt3 = .replace_labels(
    standardized_value_labels$qhealt3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt4 = .replace_labels(
    standardized_value_labels$qhealt4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt5 = .replace_labels(
    standardized_value_labels$qhealt5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt6 = .replace_labels(
    standardized_value_labels$qhealt6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt7 = .replace_labels(
    standardized_value_labels$qhealt7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt8 = .replace_labels(
    standardized_value_labels$qhealt8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qhealt1 = .replace_labels(
    standardized_value_labels$qhealt1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt2 = .replace_labels(
    standardized_value_labels$qhealt2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt3 = .replace_labels(
    standardized_value_labels$qhealt3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt4 = .replace_labels(
    standardized_value_labels$qhealt4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt5 = .replace_labels(
    standardized_value_labels$qhealt5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt6 = .replace_labels(
    standardized_value_labels$qhealt6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt7 = .replace_labels(
    standardized_value_labels$qhealt7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt8 = .replace_labels(
    standardized_value_labels$qhealt8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qhealt1 = .replace_labels(
    standardized_value_labels$qhealt1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt2 = .replace_labels(
    standardized_value_labels$qhealt2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt3 = .replace_labels(
    standardized_value_labels$qhealt3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt4 = .replace_labels(
    standardized_value_labels$qhealt4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt5 = .replace_labels(
    standardized_value_labels$qhealt5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt6 = .replace_labels(
    standardized_value_labels$qhealt6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt7 = .replace_labels(
    standardized_value_labels$qhealt7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt8 = .replace_labels(
    standardized_value_labels$qhealt8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qhealt1 = .replace_labels(
    standardized_value_labels$qhealt1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt2 = .replace_labels(
    standardized_value_labels$qhealt2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt3 = .replace_labels(
    standardized_value_labels$qhealt3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt4 = .replace_labels(
    standardized_value_labels$qhealt4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt5 = .replace_labels(
    standardized_value_labels$qhealt5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt6 = .replace_labels(
    standardized_value_labels$qhealt6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt7 = .replace_labels(
    standardized_value_labels$qhealt7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt8 = .replace_labels(
    standardized_value_labels$qhealt8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    qhealt1 = .replace_labels(
    standardized_value_labels$qhealt1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt2 = .replace_labels(
    standardized_value_labels$qhealt2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt3 = .replace_labels(
    standardized_value_labels$qhealt3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt4 = .replace_labels(
    standardized_value_labels$qhealt4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt5 = .replace_labels(
    standardized_value_labels$qhealt5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt6 = .replace_labels(
    standardized_value_labels$qhealt6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt7 = .replace_labels(
    standardized_value_labels$qhealt7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt8 = .replace_labels(
    standardized_value_labels$qhealt8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    qhealt1 = .replace_labels(
    standardized_value_labels$qhealt1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt2 = .replace_labels(
    standardized_value_labels$qhealt2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt3 = .replace_labels(
    standardized_value_labels$qhealt3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt4 = .replace_labels(
    standardized_value_labels$qhealt4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt5 = .replace_labels(
    standardized_value_labels$qhealt5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt6 = .replace_labels(
    standardized_value_labels$qhealt6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt7 = .replace_labels(
    standardized_value_labels$qhealt7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt8 = .replace_labels(
    standardized_value_labels$qhealt8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qhealt1 = .replace_labels(
    standardized_value_labels$qhealt1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt2 = .replace_labels(
    standardized_value_labels$qhealt2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt3 = .replace_labels(
    standardized_value_labels$qhealt3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt4 = .replace_labels(
    standardized_value_labels$qhealt4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt5 = .replace_labels(
    standardized_value_labels$qhealt5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt6 = .replace_labels(
    standardized_value_labels$qhealt6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt7 = .replace_labels(
    standardized_value_labels$qhealt7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qhealt8 = .replace_labels(
    standardized_value_labels$qhealt8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qhealt1 = "categorical",
  qhealt2 = "categorical",
  qhealt3 = "categorical",
  qhealt4 = "categorical",
  qhealt5 = "categorical",
  qhealt6 = "categorical",
  qhealt7 = "categorical",
  qhealt8 = "categorical"
)

.lasa_fc_113 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "113", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "113", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "113", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "113", waves = .lasa_wave_rows())
)
