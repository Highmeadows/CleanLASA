## LASA filecode mb095 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(urb = "level of urbanization (number addresses per km2)")

variable_labels_list <- list(
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  urb = c(
    `-3` = "no observation",
    `-2` = "abroad",
    `-1` = "unknown",
    `1` = "not (<500)",
    `2` = "little (500-1000)",
    `3` = "somewhat (1000-1500)",
    `4` = "highly (1500-2500)",
    `5` = "very highly (>=2500)"
  )
)

value_labels_list <- list(
  Wave_MB_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(urb = "categorical")

.lasa_fc_mb095 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "mb095", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "mb095", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "mb095", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "mb095", waves = .lasa_wave_rows())
)
