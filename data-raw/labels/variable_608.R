## LASA filecode 608 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(tprel09 = "Influences daily life", tprel10 = "Role in important decisions")

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  tprel09 = c(
    `-1` = "asked, no answer",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/no disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  tprel10 = c(
    `-1` = "asked, no answer",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/no disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  )
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(tprel09 = "categorical", tprel10 = "categorical")

.lasa_fc_608 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "608", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "608", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "608", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "608", waves = .lasa_wave_rows())
)
