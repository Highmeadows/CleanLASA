## LASA filecode 712 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  trlo10 = "often, I feel rejected",
  trlo3 = "experience emptiness",
  trlo4 = "people to lean on if in trouble",
  trlo7 = "many people I can count on",
  trlo8 = "enough people I feel close to",
  trlo9 = "miss having people around"
)

variable_labels_list <- list(
  Wave_H_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trlo10 = c(`-1` = "na, asked", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  trlo3 = c(`-1` = "na, asked", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  trlo4 = c(`-1` = "na, asked", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  trlo7 = c(`-1` = "na, asked", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  trlo8 = c(`-1` = "na, asked", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  trlo9 = c(`-1` = "na, asked", `1` = "no", `2` = "more-or-less", `3` = "yes")
)

value_labels_list <- list(
  Wave_H_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  trlo10 = "categorical",
  trlo3 = "categorical",
  trlo4 = "categorical",
  trlo7 = "categorical",
  trlo8 = "categorical",
  trlo9 = "categorical"
)

.lasa_fc_712 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "712", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "712", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "712", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "712", waves = .lasa_wave_rows())
)
