## LASA filecode 140 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qfa_ch = "Father church member during youth R?",
  qmo_ch = "Mother church member during youth R?",
  qmo_emp = "Mother employed during youth R?",
  qmo_vol = "Mother volunteer work during youth R?",
  qparsep = "Parents ever separated/divorced?",
  qparsey = "Year parents separated/divorced"
)

variable_labels_list <- list(
  Wave_2B_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qfa_ch = c(
    `-1` = "not available",
    `1` = "no church member",
    `2` = "Reformed",
    `3` = "Dutch reformed",
    `4` = "small reformed denomination",
    `5` = "Roman-Catholic",
    `6` = "Humanistic society",
    `7` = "Jewish",
    `8` = "other",
    `9` = "Jewish",
    `10` = "other"
  ),
  qmo_ch = c(
    `-1` = "not available",
    `1` = "no church member",
    `2` = "Reformed",
    `3` = "Dutch reformed",
    `4` = "small reformed denomination",
    `5` = "Roman-Catholic",
    `6` = "Humanistic society",
    `7` = "Jewish",
    `8` = "other",
    `9` = "Jewish",
    `10` = "other"
  ),
  qmo_emp = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qmo_vol = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qparsep = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qparsey = c(`-2` = "not available", `-1` = "not available")
)

value_labels_list <- list(
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qfa_ch = c(
    `-1` = "no answer",
    `1` = "no church member",
    `2` = "Reformed",
    `3` = "Dutch reformed",
    `4` = "small reformed denomination",
    `5` = "Roman-Catholic",
    `6` = "Humanistic society",
    `7` = "Jewish",
    `8` = "other"
  ),
    qmo_ch = c(
    `-1` = "no answer",
    `1` = "no church member",
    `2` = "Reformed",
    `3` = "Dutch reformed",
    `4` = "small reformed denomination",
    `5` = "Roman-Catholic",
    `6` = "Humanistic society",
    `7` = "Jewish",
    `8` = "other"
  ),
    qmo_emp = .replace_labels(
    standardized_value_labels$qmo_emp,
    `-1` = "no answer"
  ),
    qmo_vol = .replace_labels(
    standardized_value_labels$qmo_vol,
    `-1` = "no answer"
  ),
    qparsep = .replace_labels(
    standardized_value_labels$qparsep,
    `-1` = "no answer"
  ),
    qparsey = .replace_labels(
    standardized_value_labels$qparsey,
    `-2` = "no answer, see BQPARSEP",
    `-1` = "no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qfa_ch = .replace_labels(
    standardized_value_labels$qfa_ch,
    `-1` = "no answer",
    `2` = "Dutch reformed",
    `3` = "Reformed Association within the Dutch Reformed Church",
    `4` = "Reformed churches in the Netherlands (Synodal)",
    `5` = "Other Reformed churches",
    `6` = "Other protestant churches",
    `7` = "Roman-Catholic",
    `8` = "Humanistic society"
  ),
    qmo_ch = .replace_labels(
    standardized_value_labels$qmo_ch,
    `-1` = "no answer",
    `2` = "Dutch reformed",
    `3` = "Reformed Association within the Dutch Reformed Church",
    `4` = "Reformed churches in the Netherlands (Synodal)",
    `5` = "Other Reformed churches",
    `6` = "Other protestant churches",
    `7` = "Roman-Catholic",
    `8` = "Humanistic society"
  ),
    qmo_emp = .replace_labels(
    standardized_value_labels$qmo_emp,
    `-1` = "no answer"
  ),
    qmo_vol = .replace_labels(
    standardized_value_labels$qmo_vol,
    `-1` = "no answer"
  ),
    qparsep = .replace_labels(
    standardized_value_labels$qparsep,
    `-1` = "no answer"
  ),
    qparsey = .replace_labels(
    standardized_value_labels$qparsey,
    `-2` = "no answer, see BQPARSEP",
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qfa_ch = "categorical",
  qmo_ch = "categorical",
  qmo_emp = "categorical",
  qmo_vol = "categorical",
  qparsep = "categorical",
  qparsey = "numeric"
)

.lasa_fc_140 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "140", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "140", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "140", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "140", waves = .lasa_wave_rows())
)
