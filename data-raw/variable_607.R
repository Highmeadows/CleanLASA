## LASA filecode 607 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  tpcogd1 = "Cognition: talks",
  tpcogd2 = "Cognition: remembering addresses",
  tpcogd3 = "Cognition: familiar machines",
  tpcogd4 = "Cognition: decisions",
  tpcogd5 = "Cognition: handling money",
  tpcogd6 = "Cognition: financial affairs",
  tpcogdc = "Informant questionnaire of cognitive decline"
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels[c("tpcogd1", "tpcogd2", "tpcogd3", "tpcogd4", "tpcogd5", "tpcogd6")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  tpcogd1 = c(
    `-1` = "does not know",
    `1` = "much better",
    `2` = "a bit better",
    `3` = "not changed",
    `4` = "a bit worse",
    `5` = "much worse"
  ),
  tpcogd2 = c(
    `-1` = "does not know",
    `1` = "much better",
    `2` = "a bit better",
    `3` = "not changed",
    `4` = "a bit worse",
    `5` = "much worse"
  ),
  tpcogd3 = c(
    `-1` = "does not know",
    `1` = "much better",
    `2` = "a bit better",
    `3` = "not changed",
    `4` = "a bit worse",
    `5` = "much worse"
  ),
  tpcogd4 = c(
    `-1` = "does not know",
    `1` = "much better",
    `2` = "a bit better",
    `3` = "not changed",
    `4` = "a bit worse",
    `5` = "much worse"
  ),
  tpcogd5 = c(
    `-1` = "does not know",
    `1` = "much better",
    `2` = "a bit better",
    `3` = "not changed",
    `4` = "a bit worse",
    `5` = "much worse"
  ),
  tpcogd6 = c(
    `-1` = "does not know",
    `1` = "much better",
    `2` = "a bit better",
    `3` = "not changed",
    `4` = "a bit worse",
    `5` = "much worse"
  ),
  tpcogdc = c(`-1` = "missing values", `6` = NA_character_, `30` = NA_character_)
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels[c("tpcogd1", "tpcogd2", "tpcogd3", "tpcogd4", "tpcogd5", "tpcogd6")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  tpcogd1 = "categorical",
  tpcogd2 = "categorical",
  tpcogd3 = "categorical",
  tpcogd4 = "categorical",
  tpcogd5 = "categorical",
  tpcogd6 = "categorical",
  tpcogdc = "numeric"
)

.lasa_fc_607 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "607", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "607", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "607", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "607", waves = .lasa_wave_rows())
)
