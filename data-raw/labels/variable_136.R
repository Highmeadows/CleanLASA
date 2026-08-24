## LASA filecode 136 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qworr01 = "Worry 01: not enough time",
  qworr02 = "Worry 02: overpower",
  qworr03 = "Worry 03: no tendency to worry",
  qworr04 = "Worry 04: situations trigger",
  qworr05 = "Worry 05: cannot help it",
  qworr06 = "Worry 06: under pressure",
  qworr07 = "Worry 07: all the time",
  qworr08 = "Worry 08: overcome easy",
  qworr09 = "Worry 09: tasks ahead",
  qworr10 = "Worry 10: never",
  qworr11 = "Worry 11: no influence",
  qworr12 = "Worry 12: all my life",
  qworr13 = "Worry 13: notice it",
  qworr14 = "Worry 14: cannot stop",
  qworr15 = "Worry 15: constantly",
  qworr16 = "Worry 16: when finished"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qworr01 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr02 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr03 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr04 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr05 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr06 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr07 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr08 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr09 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr10 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr11 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr12 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr13 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr14 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr15 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  ),
  qworr16 = c(
    `-1` = "not available",
    `1` = "not at all characteristic",
    `2` = "not characteristic",
    `3` = "somewhat characteristic",
    `4` = "characteristic",
    `5` = "very characteristic"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qworr01 = .replace_labels(
    standardized_value_labels$qworr01,
    `-1` = "no answer"
  ),
    qworr02 = .replace_labels(
    standardized_value_labels$qworr02,
    `-1` = "no answer"
  ),
    qworr03 = .replace_labels(
    standardized_value_labels$qworr03,
    `-1` = "no answer"
  ),
    qworr04 = .replace_labels(
    standardized_value_labels$qworr04,
    `-1` = "no answer"
  ),
    qworr05 = .replace_labels(
    standardized_value_labels$qworr05,
    `-1` = "no answer"
  ),
    qworr06 = .replace_labels(
    standardized_value_labels$qworr06,
    `-1` = "no answer"
  ),
    qworr07 = .replace_labels(
    standardized_value_labels$qworr07,
    `-1` = "no answer"
  ),
    qworr08 = .replace_labels(
    standardized_value_labels$qworr08,
    `-1` = "no answer"
  ),
    qworr09 = .replace_labels(
    standardized_value_labels$qworr09,
    `-1` = "no answer"
  ),
    qworr10 = .replace_labels(
    standardized_value_labels$qworr10,
    `-1` = "no answer"
  ),
    qworr11 = .replace_labels(
    standardized_value_labels$qworr11,
    `-1` = "no answer"
  ),
    qworr12 = .replace_labels(
    standardized_value_labels$qworr12,
    `-1` = "no answer"
  ),
    qworr13 = .replace_labels(
    standardized_value_labels$qworr13,
    `-1` = "no answer"
  ),
    qworr14 = .replace_labels(
    standardized_value_labels$qworr14,
    `-1` = "no answer"
  ),
    qworr15 = .replace_labels(
    standardized_value_labels$qworr15,
    `-1` = "no answer"
  ),
    qworr16 = .replace_labels(
    standardized_value_labels$qworr16,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qworr01 = "categorical",
  qworr02 = "categorical",
  qworr03 = "categorical",
  qworr04 = "categorical",
  qworr05 = "categorical",
  qworr06 = "categorical",
  qworr07 = "categorical",
  qworr08 = "categorical",
  qworr09 = "categorical",
  qworr10 = "categorical",
  qworr11 = "categorical",
  qworr12 = "categorical",
  qworr13 = "categorical",
  qworr14 = "categorical",
  qworr15 = "categorical",
  qworr16 = "categorical"
)

.lasa_fc_136 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "136", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "136", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "136", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "136", waves = .lasa_wave_rows())
)
