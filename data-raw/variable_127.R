## LASA filecode 127 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qeol07 = "ever death thoughts",
  qeol08 = "ever death wishes",
  qeol09 = "feelings towards living past week",
  qeol10 = "feelings towards dying past week",
  qeol11 = "feelings towards reasons for living/dying"
)

variable_labels_list <- list(
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qeol07 = c(`-1` = "not available", `1` = "yes", `2` = "no", `3` = "R does not know"),
  qeol08 = c(`-1` = "not available", `1` = "yes", `2` = "no", `3` = "R does not know"),
  qeol09 = c(
    `-1` = "not available",
    `1` = "a moderate to strong wish to live",
    `2` = "a weak wish to live",
    `3` = "no wish to live"
  ),
  qeol10 = c(
    `-1` = "not available",
    `1` = "no wish to die",
    `2` = "a weak wish to die",
    `3` = "a moderate to strong wish to die"
  ),
  qeol11 = c(
    `-1` = "not available",
    `1` = "for living outweigh those for dying",
    `2` = "about equal",
    `3` = "for dying outweigh those for living"
  )
)

value_labels_list <- list(
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qeol07 = .replace_labels(
    standardized_value_labels$qeol07,
    `-1` = "na, asked"
  ),
    qeol08 = .replace_labels(
    standardized_value_labels$qeol08,
    `-1` = "na, asked"
  ),
    qeol09 = .replace_labels(
    standardized_value_labels$qeol09,
    `-1` = "na, asked"
  ),
    qeol10 = .replace_labels(
    standardized_value_labels$qeol10,
    `-1` = "na, asked"
  ),
    qeol11 = .replace_labels(
    standardized_value_labels$qeol11,
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qeol07 = .replace_labels(
    standardized_value_labels$qeol07,
    `-1` = "na, asked"
  ),
    qeol08 = .replace_labels(
    standardized_value_labels$qeol08,
    `-1` = "na, asked"
  ),
    qeol09 = .replace_labels(
    standardized_value_labels$qeol09,
    `-1` = "na, asked"
  ),
    qeol10 = .replace_labels(
    standardized_value_labels$qeol10,
    `-1` = "na, asked"
  ),
    qeol11 = .replace_labels(
    standardized_value_labels$qeol11,
    `-1` = "na, asked"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    qeol07 = .replace_labels(
    standardized_value_labels$qeol07,
    `-1` = "na, asked"
  ),
    qeol08 = .replace_labels(
    standardized_value_labels$qeol08,
    `-1` = "na, asked"
  ),
    qeol09 = .replace_labels(
    standardized_value_labels$qeol09,
    `-1` = "na, asked"
  ),
    qeol10 = .replace_labels(
    standardized_value_labels$qeol10,
    `-1` = "na, asked"
  ),
    qeol11 = .replace_labels(
    standardized_value_labels$qeol11,
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qeol07 = "categorical",
  qeol08 = "categorical",
  qeol09 = "categorical",
  qeol10 = "categorical",
  qeol11 = "categorical"
)

.lasa_fc_127 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "127", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "127", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "127", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "127", waves = .lasa_wave_rows())
)
