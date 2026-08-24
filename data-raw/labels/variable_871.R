## LASA filecode 871 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(ms01 = "COLIA1 allele frequency", ms012 = "COLIA1 genotype")

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  ms01 = c(`-1` = "no determination"),
  ms012 = c(`-1` = "no determination")
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(ms01 = "categorical", ms012 = "categorical")

.lasa_fc_871 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "871", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "871", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "871", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "871", waves = .lasa_wave_rows())
)
