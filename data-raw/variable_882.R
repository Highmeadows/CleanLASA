## LASA filecode 882 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  corteve = "(constructed) evening cortisol saliva unstimulated (nmol/L)",
  cortwac = "(constructed) waking cortisol saliva unstimulated (nmol/L)"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  corteve = c(`-2` = "insufficient volume"),
  cortwac = c(`-2` = "insufficient volume")
)

value_labels_list <- list(
  Wave_E_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(corteve = "numeric", cortwac = "numeric")

.lasa_fc_882 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "882", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "882", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "882", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "882", waves = .lasa_wave_rows())
)
