## LASA filecode 606 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  tpces01 = "1. Last week: bothered",
  tpces06 = "6. Last week: depressed",
  tpces10 = "10. Last week: fearful",
  tpces14 = "14. Last week: lonely"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `C` = c(
    "tpces01",
    "tpces06",
    "tpces10",
    "tpces14"
  ),
  `D` = c(
    "tpces01",
    "tpces06",
    "tpces10",
    "tpces14"
  ),
  `E` = c(
    "tpces01",
    "tpces06",
    "tpces10",
    "tpces14"
  )
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  tpces01 = c(
    default_missing_labels[c("-1")],
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  tpces06 = c(
    default_missing_labels[c("-1")],
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  tpces10 = c(
    default_missing_labels[c("-1")],
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  tpces14 = c(
    default_missing_labels[c("-1")],
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  )
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  tpces01 = "categorical",
  tpces06 = "categorical",
  tpces10 = "categorical",
  tpces14 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "606", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "606", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "606", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "606", waves = .lasa_wave_rows())
)

.lasa_fc_606 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

