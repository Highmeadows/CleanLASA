## LASA filecode 104 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qpss01 = "upset because something unexpected",
  qpss02 = "felt unable to control things",
  qpss03 = "felt nervous and stressed",
  qpss04 = "felt confident",
  qpss05 = "felt things going your way",
  qpss06 = "felt could not cope with things",
  qpss07 = "been able to control irritations",
  qpss08 = "felt on top of things",
  qpss09 = "angered because things outside control",
  qpss10 = "felt difficulties piling up"
)

variable_labels_list <- list(
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qpss01 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  qpss02 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  qpss03 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  qpss04 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  qpss05 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  qpss06 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  qpss07 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  qpss08 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  qpss09 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  qpss10 = c(
    `-1` = "no answer",
    `0` = "never",
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  )
)

value_labels_list <- list(
  Wave_H_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qpss01 = "categorical",
  qpss02 = "categorical",
  qpss03 = "categorical",
  qpss04 = "categorical",
  qpss05 = "categorical",
  qpss06 = "categorical",
  qpss07 = "categorical",
  qpss08 = "categorical",
  qpss09 = "categorical",
  qpss10 = "categorical"
)

.lasa_fc_104 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "104", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "104", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "104", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "104", waves = .lasa_wave_rows())
)
