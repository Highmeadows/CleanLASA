## LASA filecode 311 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(qhumor = "Humor total scale score")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "qhumor"
  ),
  `D` = c(
    "qhumor"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    qhumor = "Humor total scale"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    qhumor = "Humor total scale"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qhumor = c(`-1` = "no valid data", `5` = NA_character_, `25` = NA_character_)
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qhumor = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "311", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "311", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "311", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "311", waves = .lasa_wave_rows())
)

.lasa_fc_311 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

