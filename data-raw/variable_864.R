## LASA filecode 864 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcbg = "corticosteroid binding globuline (mg/L)",
  mco = "serum: total cortisol (nmol/L)",
  mfcort = "free cortisol (nmol/l)"
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcbg = c(`-3` = "incorrect value", `-1` = "no determination"),
  mco = c(`-3` = "incorrect value", `-1` = "no determination"),
  mfcort = c(`-3` = "incorrect value", `-1` = "no determination")
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mcbg = "numeric", mco = "numeric", mfcort = "numeric")

.lasa_fc_864 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "864", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "864", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "864", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "864", waves = .lasa_wave_rows())
)
