## LASA filecode 121 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qsocp01 = "conversation about magazine/paper",
  qsocp02 = "conversation about life",
  qsocp03 = "make calculations"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qsocp01 = c(
    `-1` = "not available",
    `1` = "rarely or never",
    `2` = "monthly",
    `3` = "weekly or more often"
  ),
  qsocp02 = c(
    `-1` = "not available",
    `1` = "rarely or never",
    `2` = "monthly",
    `3` = "weekly or more often"
  ),
  qsocp03 = c(
    `-1` = "not available",
    `1` = "rarely or never",
    `2` = "monthly",
    `3` = "weekly or more often"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qsocp01 = .replace_labels(
    standardized_value_labels$qsocp01,
    `-1` = "no answer"
  ),
    qsocp02 = .replace_labels(
    standardized_value_labels$qsocp02,
    `-1` = "no answer"
  ),
    qsocp03 = .replace_labels(
    standardized_value_labels$qsocp03,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qsocp01 = .replace_labels(
    standardized_value_labels$qsocp01,
    `-1` = "no answer"
  ),
    qsocp02 = .replace_labels(
    standardized_value_labels$qsocp02,
    `-1` = "no answer"
  ),
    qsocp03 = .replace_labels(
    standardized_value_labels$qsocp03,
    `-1` = "no answer"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qsocp01 = .replace_labels(
    standardized_value_labels$qsocp01,
    `-1` = "no answer"
  ),
    qsocp02 = .replace_labels(
    standardized_value_labels$qsocp02,
    `-1` = "no answer"
  ),
    qsocp03 = .replace_labels(
    standardized_value_labels$qsocp03,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qsocp01 = "categorical", qsocp02 = "categorical", qsocp03 = "categorical")

.lasa_fc_121 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "121", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "121", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "121", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "121", waves = .lasa_wave_rows())
)
