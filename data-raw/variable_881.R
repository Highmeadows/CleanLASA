## LASA filecode 881 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  corteve = "evening cortisol saliva unstimulated (nmol/L)",
  cortwak = "waking cortisol saliva unstimulated (nmol/L)"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  corteve = c(`-2` = "insufficient volume", `0` = "< 1,5 nmol/L"),
  cortwak = c(`-2` = "insufficient volume", `0` = "< 1,5 nmol/L")
)

value_labels_list <- list(
  Wave_E_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(corteve = "numeric", cortwak = "numeric")

.lasa_fc_881 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "881", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "881", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "881", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "881", waves = .lasa_wave_rows())
)
