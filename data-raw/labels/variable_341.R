## LASA filecode 341 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(qan = "Need for affiliation scale (6 items)")

variable_labels_list <- list(
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    qan = "need for affiliation <6 items>"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    qan = "need for affiliation <6 items>"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qan = c(`-1` = "no valid data", `6` = NA_character_, `18` = NA_character_)
)

value_labels_list <- list(
  Wave_2B_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qan = "numeric")

.lasa_fc_341 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "341", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "341", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "341", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "341", waves = .lasa_wave_rows())
)
