## LASA filecode 116 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qdecu01 = "Decubitus: suffering bed sores (Self adm. questionnaire)",
  qdecu02 = "Decubitus: treatment (Self adm. questionnaire)"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qdecu01 = c(
    `-1` = "not available",
    `1` = "no",
    `2` = "yes, <two weeks",
    `3` = "yes, 2wks><3mths",
    `4` = "yes, >3months"
  ),
  qdecu02 = c(`-1` = "not available", `1` = "no", `2` = "yes")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qdecu01 = .replace_labels(
    standardized_value_labels$qdecu01,
    `-1` = "no answer"
  ),
    qdecu02 = .replace_labels(
    standardized_value_labels$qdecu02,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qdecu01 = "categorical", qdecu02 = "categorical")

.lasa_fc_116 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "116", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "116", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "116", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "116", waves = .lasa_wave_rows())
)
