## LASA filecode 711 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  trwvg01 = "WVG 01: Walking frame",
  trwvg02 = "WVG 02: Wheelchair",
  trwvg03 = "WVG 03: Mobility scooter, adjusted bicycle",
  trwvg04 = "WVG 04: Taxi pass",
  trwvg05 = "WVG 05: Car adjustment",
  trwvg06 = "WVG 06: Transport compensation",
  trwvg07 = "WVG 07: Disabled parking permit",
  trwvg08 = "WVG 08: Personal alarm",
  trwvg09 = "WVG 09: Meals on wheels",
  trwvg10 = "WVG 10: Handyman",
  trwvg11 = "WVG 11: Grocery shopping service"
)

variable_labels_list <- list(
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trwvg01 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg02 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg03 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg04 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg05 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg06 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg07 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg08 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg09 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg10 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trwvg11 = c(`-1` = "na, asked", `1` = "no", `2` = "yes")
)

value_labels_list <- list(
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  trwvg01 = "categorical",
  trwvg02 = "categorical",
  trwvg03 = "categorical",
  trwvg04 = "categorical",
  trwvg05 = "categorical",
  trwvg06 = "categorical",
  trwvg07 = "categorical",
  trwvg08 = "categorical",
  trwvg09 = "categorical",
  trwvg10 = "categorical",
  trwvg11 = "categorical"
)

.lasa_fc_711 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "711", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "711", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "711", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "711", waves = .lasa_wave_rows())
)
