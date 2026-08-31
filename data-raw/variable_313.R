## LASA filecode 313 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qrand1 = "Rand scale 1: evaluation present health",
  qrand2 = "Rand scale 2: future health perspective"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "qrand1",
    "qrand2"
  ),
  `C` = c(
    "qrand1",
    "qrand2"
  ),
  `D` = c(
    "qrand1",
    "qrand2"
  ),
  `E` = c(
    "qrand1",
    "qrand2"
  ),
  `2B` = c(
    "qrand1",
    "qrand2"
  ),
  `F` = c(
    "qrand1",
    "qrand2"
  ),
  `G` = c(
    "qrand1",
    "qrand2"
  ),
  `H` = c(
    "qrand1",
    "qrand2"
  ),
  `3B` = c(
    "qrand1",
    "qrand2"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qrand1 = c(`-1` = "no valid data", `4` = NA_character_, `20` = NA_character_),
  qrand2 = c(`-1` = "no valid data", `3` = NA_character_, `15` = NA_character_)
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_2B_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qrand1 = "numeric", qrand2 = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "313", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "313", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "313", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "313", waves = .lasa_wave_rows())
)

.lasa_fc_313 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

