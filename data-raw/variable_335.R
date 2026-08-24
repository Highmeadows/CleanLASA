## LASA filecode 335 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(qeqixnl = "EuroQol TTO-method Index NL", qeqixuk = "EuroQol TTO-method Index UK")

variable_labels_list <- list(
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    qeqixnl = "Euroquol TTO-method Index NL",
    qeqixuk = "Euroquol TTO-method Index UK"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    qeqixnl = "Euroquol TTO-method Index NL",
    qeqixuk = "Euroquol TTO-method Index UK"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    qeqixnl = "Euroquol TTO-method Index NL",
    qeqixuk = "Euroquol TTO-method Index UK"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    qeqixnl = "Euroquol TTO-method Index NL",
    qeqixuk = "Euroquol TTO-method Index UK"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    qeqixnl = "Euroquol TTO-method Index NL",
    qeqixuk = "Euroquol TTO-method Index UK"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    qeqixnl = "Euroquol TTO-method Index NL",
    qeqixuk = "Euroquol TTO-method Index UK"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qeqixnl = c(`-2` = "no valid score", `1` = NA_character_),
  qeqixuk = c(`-2` = "no valid score", `1` = NA_character_)
)

value_labels_list <- list(
  Wave_E_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qeqixnl = "numeric", qeqixuk = "numeric")

.lasa_fc_335 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "335", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "335", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "335", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "335", waves = .lasa_wave_rows())
)
