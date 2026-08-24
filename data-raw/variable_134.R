## LASA filecode 134 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qbwght = "weight at birth in grams",
  qbwghts = "weight at birth in grams: source",
  qbwghtw = "weight at birth in grams: which source"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels[c("qbwght", "qbwghts")],
  Wave_2B_labels = harmonized_labels[c("qbwght", "qbwghts")],
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qbwght = c(`-1` = "not available"),
  qbwghts = c(
    `-1` = "not available",
    `1` = "checked in documentation",
    `2` = "known without check",
    `3` = "estimation"
  ),
  qbwghtw = c(
    `-1` = "not available",
    `1` = "birth certificate",
    `2` = "birth announcement card",
    `3` = "baby book",
    `4` = "other"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("qbwght", "qbwghts")],
    qbwght = .replace_labels(
    standardized_value_labels$qbwght,
    `-1` = "no answer"
  ),
    qbwghts = .replace_labels(
    standardized_value_labels$qbwghts,
    `-1` = "no answer"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("qbwght", "qbwghts")],
    qbwght = .replace_labels(
    standardized_value_labels$qbwght,
    `-1` = "no answer"
  ),
    qbwghts = .replace_labels(
    standardized_value_labels$qbwghts,
    `-1` = "no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qbwght = .replace_labels(
    standardized_value_labels$qbwght,
    `-1` = "no answer"
  ),
    qbwghts = .replace_labels(
    standardized_value_labels$qbwghts,
    `-1` = "no answer"
  ),
    qbwghtw = .replace_labels(
    standardized_value_labels$qbwghtw,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qbwght = "numeric", qbwghts = "categorical", qbwghtw = "categorical")

.lasa_fc_134 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "134", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "134", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "134", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "134", waves = .lasa_wave_rows())
)
