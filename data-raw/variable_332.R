## LASA filecode 332 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(qfioe = "Filial obligation expectations scale score")

variable_labels_list <- list(
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    qfioe = "Filial obligation expectations"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    qfioe = "Filial obligation expectations"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    qfioe = "Filial obligation expectations"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qfioe = c(`-1` = ">2 missing items", `16` = NA_character_, `80` = NA_character_)
)

value_labels_list <- list(
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qfioe = "numeric")

.lasa_fc_332 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "332", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "332", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "332", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "332", waves = .lasa_wave_rows())
)
