## LASA filecode 092 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
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

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `D` = c(
    "fademen",
    "fatreat",
    "modemen",
    "motreat",
    "rmpar"
  )
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  fademen = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "yes",
    `2` = "no"
  ),
  fatreat = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "yes",
    `2` = "no"
  ),
  modemen = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "yes",
    `2` = "no"
  ),
  motreat = c(
    default_missing_labels[c("-3", "-2", "-1")],
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
    `-2` = "na, see DRMPAR"
  ),
    fatreat = .replace_labels(
    standardized_value_labels$fatreat,
    `-2` = "na, see DFADEMEN"
  ),
    modemen = .replace_labels(
    standardized_value_labels$modemen,
    `-2` = "na, see DRMPAR"
  ),
    motreat = .replace_labels(
    standardized_value_labels$motreat,
    `-2` = "na, see DMODEMEN"
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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "092", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "092", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "092", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "092", waves = .lasa_wave_rows())
)

.lasa_fc_092 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

