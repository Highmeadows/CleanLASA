## LASA filecode 379 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(madint = "AD total score")

variable_labels_list <- list(
  Wave_G_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  madint = c(
    `-5` = "na, section not done",
    `-4` = "score unavailable",
    `0` = NA_character_,
    `9` = NA_character_
  )
)

value_labels_list <- list(
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    madint = .replace_labels(
    standardized_value_labels$madint,
    `-4` = "not able to [cognitive]"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(madint = "numeric")

.lasa_fc_379 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "379", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "379", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "379", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "379", waves = .lasa_wave_rows())
)
