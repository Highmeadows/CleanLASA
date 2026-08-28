## LASA filecode 880 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(cortrsp = "(non)response saliva cortisol determination")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `E` = c(
    "cortrsp"
  )
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  cortrsp = c(
    `-3` = "no participation LASA t5",
    `-2` = "na, tel. int.",
    `-1` = "cortisol data",
    `1` = "deceased before approach",
    `2` = "refusals",
    `3` = "ineligible",
    `4` = "not contacted",
    `5` = "technical error"
  )
)

value_labels_list <- list(
  Wave_E_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(cortrsp = "categorical")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "880", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "880", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "880", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "880", waves = .lasa_wave_rows())
)

.lasa_fc_880 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

