## LASA filecode 143 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qmetem1 = "meta emotion item 01: emotional",
  qmetem2 = "meta emotion item 02: feelings",
  qmetem3 = "meta emotion item 03: satisfied",
  qmetem4 = "meta emotion item 04: change"
)

variable_labels_list <- list(
  Wave_2B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qmetem1 = c(
    `-1` = "not available",
    `1` = "absolutely not emotional",
    `2` = "a little emotional",
    `3` = "fairly emotional",
    `4` = "very emotional"
  ),
  qmetem2 = c(`-1` = "not available", `1` = "very little", `2` = "little", `3` = "much", `4` = "very much"),
  qmetem3 = c(
    `-1` = "not available",
    `1` = "absolutely not satisfied",
    `2` = "a bit satisfied",
    `3` = "rather satisfied",
    `4` = "very satisfied"
  ),
  qmetem4 = c(
    `-1` = "not available",
    `1` = "rarely or never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  )
)

value_labels_list <- list(
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qmetem1 = .replace_labels(
    standardized_value_labels$qmetem1,
    `-1` = "no answer"
  ),
    qmetem2 = .replace_labels(
    standardized_value_labels$qmetem2,
    `-1` = "no answer"
  ),
    qmetem3 = .replace_labels(
    standardized_value_labels$qmetem3,
    `-1` = "no answer"
  ),
    qmetem4 = .replace_labels(
    standardized_value_labels$qmetem4,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qmetem1 = "categorical",
  qmetem2 = "categorical",
  qmetem3 = "categorical",
  qmetem4 = "categorical"
)

.lasa_fc_143 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "143", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "143", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "143", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "143", waves = .lasa_wave_rows())
)
