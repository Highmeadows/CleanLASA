## LASA filecode 175 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mnh01 = "Good quality nursing homes in Netherlands",
  mnh02 = "Enough privacy in nursing home",
  mnh03 = "Residents spend little to no time outside nursing home",
  mnh04 = "Fun being together with other residents of nursing home",
  mnh05 = "Control over toilet visits in nursing home",
  mnh06 = "Residents nursing home barely get visitors",
  mnh07 = "Treated with respect by staff nursing home",
  mnh08 = "Control over when to wake up in nursing home",
  mnh09 = "Good conversations with residents of nursing home"
)

variable_labels_list <- list(
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mnh01 = c(
    `-1` = "na, asked",
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh02 = c(
    `-1` = "na, asked",
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh03 = c(
    `-1` = "na, asked",
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh04 = c(
    `-1` = "na, asked",
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh05 = c(
    `-1` = "na, asked",
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh06 = c(
    `-1` = "na, asked",
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh07 = c(
    `-1` = "na, asked",
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh08 = c(
    `-1` = "na, asked",
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh09 = c(
    `-1` = "na, asked",
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  )
)

value_labels_list <- list(
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mnh01 = "categorical",
  mnh02 = "categorical",
  mnh03 = "categorical",
  mnh04 = "categorical",
  mnh05 = "categorical",
  mnh06 = "categorical",
  mnh07 = "categorical",
  mnh08 = "categorical",
  mnh09 = "categorical"
)

.lasa_fc_175 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "175", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "175", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "175", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "175", waves = .lasa_wave_rows())
)
