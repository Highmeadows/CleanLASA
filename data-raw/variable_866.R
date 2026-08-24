## LASA filecode 866 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mhcy = "homocysteine (µMol/l)",
  mmma = "methylmalonic acid (µMol/l)",
  mvb12 = "vitamin b12 (pMol/l)"
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mhcy = c(`-1` = "no determination"),
  mmma = c(`-1` = "no determination"),
  mvb12 = c(`-1` = "no determination")
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mhcy = "numeric", mmma = "numeric", mvb12 = "numeric")

.lasa_fc_866 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "866", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "866", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "866", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "866", waves = .lasa_wave_rows())
)
