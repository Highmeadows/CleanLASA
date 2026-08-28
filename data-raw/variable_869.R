## LASA filecode 869 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(mcmgp = "dp-cMGP (pMol/l)", mlabrem = "remarks VITAK lab", mucmgp = "dp-ucMGP (pMol/l)")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `2B` = c(
    "mcmgp",
    "mlabrem",
    "mucmgp"
  )
)

variable_labels_list <- list(
  Wave_2B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcmgp = c(`-3` = "incorrect value", `-1` = "no determination"),
  mlabrem = c(
    `-2` = "no remarks",
    `1` = "whole blood",
    `2` = "lipaemic",
    `3` = "light lipaemic",
    `4` = "hemolytic",
    `5` = "light hemolytic"
  ),
  mucmgp = c(`-3` = "incorrect value", `-1` = "no determination")
)

value_labels_list <- list(
  Wave_2B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mcmgp = "numeric", mlabrem = "categorical", mucmgp = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "869", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "869", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "869", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "869", waves = .lasa_wave_rows())
)

.lasa_fc_869 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

