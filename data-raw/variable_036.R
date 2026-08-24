## LASA filecode 036 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  subhea1 = "Self-perceived health",
  subhea2 = "Self-perceived health compared to age peers",
  subhea3 = "Self-perceived health compared to 10 years ago",
  subhea4 = "Self-perceived health 3 (or 4) years ago"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels[c("subhea1", "subhea2")],
  Wave_C_labels = harmonized_labels[c("subhea1", "subhea2")],
  Wave_D_labels = harmonized_labels[c("subhea1", "subhea2")],
  Wave_E_labels = harmonized_labels[c("subhea1", "subhea2")],
  Wave_2B_labels = harmonized_labels[c("subhea1", "subhea2", "subhea3")],
  Wave_F_labels = harmonized_labels[c("subhea1", "subhea2", "subhea4")],
  Wave_G_labels = harmonized_labels[c("subhea1", "subhea2", "subhea4")],
  Wave_H_labels = harmonized_labels[c("subhea1", "subhea2", "subhea4")],
  Wave_3B_labels = harmonized_labels[c("subhea1", "subhea2")],
  Wave_I_labels = harmonized_labels[c("subhea1", "subhea2", "subhea4")],
  Wave_J_labels = harmonized_labels[c("subhea1", "subhea2", "subhea4")],
  Wave_K_labels = harmonized_labels[c("subhea1", "subhea2", "subhea4")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  subhea1 = c(
    `-5` = "not available, interview terminated",
    `-1` = "not available, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "sometimes good/bad",
    `5` = "poor"
  ),
  subhea2 = c(
    `-5` = "not available, interview terminated",
    `-1` = "not available, asked",
    `1` = "much better",
    `2` = "a little better",
    `3` = "do not know/just as good",
    `4` = "a little worse",
    `5` = "much worse"
  ),
  subhea3 = c(
    `-5` = "not available, interview terminated",
    `-1` = "not available, asked",
    `1` = "much better",
    `2` = "a little better",
    `3` = "do not know/just as good",
    `4` = "a little worse",
    `5` = "much worse"
  ),
  subhea4 = c(
    `-5` = "not available, interview terminated",
    `-1` = "not available, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "sometimes good/bad",
    `5` = "poor"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2", "subhea3")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea3 = .replace_labels(
    standardized_value_labels$subhea3,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2", "subhea4")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `3` = "do not know/just as good as other"
  ),
    subhea4 = .replace_labels(
    standardized_value_labels$subhea4,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2", "subhea4")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `3` = "do not know/just as good as other"
  ),
    subhea4 = .replace_labels(
    standardized_value_labels$subhea4,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2", "subhea4")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `3` = "do not know/just as good as other"
  ),
    subhea4 = .replace_labels(
    standardized_value_labels$subhea4,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2", "subhea4")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `3` = "do not know/just as good as other"
  ),
    subhea4 = .replace_labels(
    standardized_value_labels$subhea4,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2", "subhea4")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `3` = "do not know/just as good as other"
  ),
    subhea4 = .replace_labels(
    standardized_value_labels$subhea4,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("subhea1", "subhea2", "subhea4")],
    subhea1 = .replace_labels(
    standardized_value_labels$subhea1,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    subhea2 = .replace_labels(
    standardized_value_labels$subhea2,
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `3` = "do not know/just as good as other"
  ),
    subhea4 = .replace_labels(
    standardized_value_labels$subhea4,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  subhea1 = "categorical",
  subhea2 = "categorical",
  subhea3 = "categorical",
  subhea4 = "categorical"
)

.lasa_fc_036 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "036", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "036", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "036", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "036", waves = .lasa_wave_rows())
)
