## LASA filecode 162 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(mlphyand = "number of days per week >30 minutes physically active")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `J` = c(
    "mlphyand"
  )
)

variable_labels_list <- list(
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    mlphyand = "number of days a week >30 min physically active"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mlphyand = c(
    `-4` = "na, interview terminated",
    default_missing_labels[c("-1")],
    `0` = "0 days",
    `1` = "1 day",
    `2` = "2 days",
    `3` = "3 days",
    `4` = "4 days",
    `5` = "5 days",
    `6` = "6 days",
    `7` = "7 days"
  )
)

value_labels_list <- list(
  Wave_J_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mlphyand = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "162", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "162", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "162", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "162", waves = .lasa_wave_rows())
)

.lasa_fc_162 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

