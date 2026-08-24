## LASA filecode 130 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qsocd1 = "social des. 1: always courteous",
  qsocd2 = "social des. 2: profited",
  qsocd3 = "social des. 3: get even",
  qsocd4 = "social des. 4: annoyed",
  qsocd5 = "social des. 5: listen good"
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qsocd1 = c(
    `-1` = "not available",
    `1` = "certainly true",
    `2` = "true",
    `3` = "do not know",
    `4` = "not true",
    `5` = "certainly not true"
  ),
  qsocd2 = c(
    `-1` = "not available",
    `1` = "certainly true",
    `2` = "true",
    `3` = "do not know",
    `4` = "not true",
    `5` = "certainly not true"
  ),
  qsocd3 = c(
    `-1` = "not available",
    `1` = "certainly true",
    `2` = "true",
    `3` = "do not know",
    `4` = "not true",
    `5` = "certainly not true"
  ),
  qsocd4 = c(
    `-1` = "not available",
    `1` = "certainly true",
    `2` = "true",
    `3` = "do not know",
    `4` = "not true",
    `5` = "certainly not true"
  ),
  qsocd5 = c(
    `-1` = "not available",
    `1` = "certainly true",
    `2` = "true",
    `3` = "do not know",
    `4` = "not true",
    `5` = "certainly not true"
  )
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qsocd1 = .replace_labels(
    standardized_value_labels$qsocd1,
    `-1` = "no valid data"
  ),
    qsocd2 = .replace_labels(
    standardized_value_labels$qsocd2,
    `-1` = "no valid data"
  ),
    qsocd3 = .replace_labels(
    standardized_value_labels$qsocd3,
    `-1` = "no valid data"
  ),
    qsocd4 = .replace_labels(
    standardized_value_labels$qsocd4,
    `-1` = "no valid data"
  ),
    qsocd5 = .replace_labels(
    standardized_value_labels$qsocd5,
    `-1` = "no valid data"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qsocd1 = .replace_labels(
    standardized_value_labels$qsocd1,
    `-1` = "no valid data"
  ),
    qsocd2 = .replace_labels(
    standardized_value_labels$qsocd2,
    `-1` = "no valid data"
  ),
    qsocd3 = .replace_labels(
    standardized_value_labels$qsocd3,
    `-1` = "no valid data"
  ),
    qsocd4 = .replace_labels(
    standardized_value_labels$qsocd4,
    `-1` = "no valid data"
  ),
    qsocd5 = .replace_labels(
    standardized_value_labels$qsocd5,
    `-1` = "no valid data"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qsocd1 = "categorical",
  qsocd2 = "categorical",
  qsocd3 = "categorical",
  qsocd4 = "categorical",
  qsocd5 = "categorical"
)

.lasa_fc_130 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "130", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "130", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "130", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "130", waves = .lasa_wave_rows())
)
