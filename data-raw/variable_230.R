## LASA filecode 230 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  flwd6 = "Functional limitations with difficulties, 6-item score",
  flwd7 = "Functional limitations with difficulties, 7-item score",
  flwdiff = "Functional limitations with difficulties, 3-item score"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("flwdiff")],
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("flwd6", "flwdiff")],
    flwd6 = "functional limitations, with difficulties #6",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("flwd6", "flwdiff")],
    flwd6 = "functional limitations, with difficulties #6",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("flwd6", "flwdiff")],
    flwd6 = "functional limitations, with difficulties #6",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    flwd6 = "functional limitations, with difficulties #6",
    flwd7 = "functional limitations, with difficulties #7",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    flwd6 = "functional limitations, with difficulties #6",
    flwd7 = "functional limitations, with difficulties #7",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    flwd6 = "functional limitations, with difficulties #6",
    flwd7 = "functional limitations, with difficulties #7",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    flwd6 = "functional limitations, with difficulties #6",
    flwd7 = "functional limitations, with difficulties #7",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    flwd6 = "functional limitations, with difficulties #6",
    flwd7 = "functional limitations, with difficulties #7",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    flwd6 = "functional limitations, with difficulties #6",
    flwd7 = "functional limitations, with difficulties #7",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    flwd6 = "functional limitations, with difficulties #6",
    flwd7 = "functional limitations, with difficulties #7",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    flwd6 = "functional limitations, with difficulties #6",
    flwd7 = "functional limitations, with difficulties #7",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    flwd6 = "functional limitations, with difficulties #6",
    flwd7 = "functional limitations, with difficulties #7",
    flwdiff = "functional limitations, with difficulties #3"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  flwd6 = c(
    `-1` = "no valid data",
    `0` = "no difficulties",
    `1` = "5 without difficulty",
    `2` = "4 without difficulty",
    `3` = "3 without difficulty",
    `4` = "2 without difficulty",
    `5` = "1 without difficulty",
    `6` = "all with difficulty"
  ),
  flwd7 = c(
    `-1` = "no valid data",
    `0` = "no difficulties",
    `1` = "6 without difficulty",
    `2` = "5 without difficulty",
    `3` = "4 without difficulty",
    `4` = "3 without difficulty",
    `5` = "2 without difficulty",
    `6` = "1 without difficulty",
    `7` = "all with difficulty"
  ),
  flwdiff = c(
    `-1` = "no valid data",
    `0` = "no difficulties",
    `1` = "2 without difficulty",
    `2` = "1 without difficulty",
    `3` = "all with difficulty"
  )
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels[c("flwdiff")],
  Wave_C_labels = standardized_value_labels[c("flwd6", "flwdiff")],
  Wave_D_labels = standardized_value_labels[c("flwd6", "flwdiff")],
  Wave_E_labels = standardized_value_labels[c("flwd6", "flwdiff")],
  Wave_2B_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Wave_MB_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(flwd6 = "categorical", flwd7 = "categorical", flwdiff = "categorical")

.lasa_fc_230 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "230", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "230", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "230", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "230", waves = .lasa_wave_rows())
)
