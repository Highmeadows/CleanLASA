## LASA filecode 018 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(hinsura = "HEALTH INSURANCE")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "hinsura"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  hinsura = c(
    `-5` = "no insurance",
    `-1` = "not available, do not know",
    `1` = "sick-fund: mandatory",
    `2` = "sick-fund: voluntary",
    `3` = "private insurance"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    hinsura = .replace_labels(
    standardized_value_labels$hinsura,
    `-1` = "na, do not know",
    `3` = "private Insurance"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(hinsura = "categorical")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "018", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "018", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "018", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "018", waves = .lasa_wave_rows())
)

.lasa_fc_018 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

