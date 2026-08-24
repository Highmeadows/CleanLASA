## LASA filecode 092 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  fademen = "dementia father",
  fatreat = "treatment dementia father",
  modemen = "dementia mother",
  motreat = "treatment dementia mother",
  rmpar = "reason no valid data on parents"
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  fademen = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "yes",
    `2` = "no"
  ),
  fatreat = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "yes",
    `2` = "no"
  ),
  modemen = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "yes",
    `2` = "no"
  ),
  motreat = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "yes",
    `2` = "no"
  ),
  rmpar = c(`-2` = "valid score", `1` = "short version", `2` = "interview terminated")
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    fademen = .replace_labels(
    standardized_value_labels$fademen,
    `-3` = "na, wrong skip",
    `-2` = "na, see DRMPAR",
    `-1` = "na, asked"
  ),
    fatreat = .replace_labels(
    standardized_value_labels$fatreat,
    `-3` = "na, wrong skip",
    `-2` = "na, see DFADEMEN",
    `-1` = "na, asked"
  ),
    modemen = .replace_labels(
    standardized_value_labels$modemen,
    `-3` = "na, wrong skip",
    `-2` = "na, see DRMPAR",
    `-1` = "na, asked"
  ),
    motreat = .replace_labels(
    standardized_value_labels$motreat,
    `-3` = "na, wrong skip",
    `-2` = "na, see DMODEMEN",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  fademen = "categorical",
  fatreat = "categorical",
  modemen = "categorical",
  motreat = "categorical",
  rmpar = "categorical"
)

.lasa_fc_092 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "092", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "092", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "092", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "092", waves = .lasa_wave_rows())
)
