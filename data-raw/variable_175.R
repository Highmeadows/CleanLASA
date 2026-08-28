## LASA filecode 175 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
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

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `J` = c(
    "mnh01",
    "mnh02",
    "mnh03",
    "mnh04",
    "mnh05",
    "mnh06",
    "mnh07",
    "mnh08",
    "mnh09"
  ),
  `K` = c(
    "mnh01",
    "mnh02",
    "mnh03",
    "mnh04",
    "mnh05",
    "mnh06",
    "mnh07",
    "mnh08",
    "mnh09"
  )
)

variable_labels_list <- list(
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mnh01 = c(
    default_missing_labels[c("-1")],
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh02 = c(
    default_missing_labels[c("-1")],
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh03 = c(
    default_missing_labels[c("-1")],
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh04 = c(
    default_missing_labels[c("-1")],
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh05 = c(
    default_missing_labels[c("-1")],
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh06 = c(
    default_missing_labels[c("-1")],
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh07 = c(
    default_missing_labels[c("-1")],
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh08 = c(
    default_missing_labels[c("-1")],
    `1` = "completely disagree",
    `2` = "disagree",
    `3` = "do not agree/disagree",
    `4` = "agree",
    `5` = "completely agree"
  ),
  mnh09 = c(
    default_missing_labels[c("-1")],
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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "175", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "175", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "175", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "175", waves = .lasa_wave_rows())
)

.lasa_fc_175 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

