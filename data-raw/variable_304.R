## LASA filecode 304 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(qpsstot = "Perceived Stress Scale total score")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `H` = c(
    "qpsstot"
  ),
  `3B` = c(
    "qpsstot"
  )
)

variable_labels_list <- list(
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    qpsstot = "perceived stress scale total score"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    qpsstot = "perceived stress scale total score"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qpsstot = c(`-2` = "questionnaire not done", `-1` = "too many missings")
)

value_labels_list <- list(
  Wave_H_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qpsstot = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "304", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "304", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "304", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "304", waves = .lasa_wave_rows())
)

.lasa_fc_304 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

