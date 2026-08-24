## LASA filecode 291 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(ptsdint = "PTSD total scale score", rmptsd = "Reason for missing PTSD score")

variable_labels_list <- list(
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    ptsdint = "PTSD SCALE TOTAL SCORE INTEGER",
    rmptsd = "reason missing ptsd score"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    ptsdint = "PTSD SCALE TOTAL SCORE INTEGER",
    rmptsd = "reason missing ptsd score"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  ptsdint = c(
    `-2` = "no valid data",
    `22` = NA_character_,
    `39` = "cut off",
    `52` = "cut off",
    `69` = NA_character_,
    `75` = NA_character_
  ),
  rmptsd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    ptsdint = c(`-2` = "no valid data", `22` = NA_character_, `52` = "cut off", `75` = NA_character_)
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    ptsdint = c(`-2` = "no valid data", `22` = NA_character_, `39` = "cut off", `69` = NA_character_)
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(ptsdint = "numeric", rmptsd = "categorical")

.lasa_fc_291 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "291", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "291", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "291", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "291", waves = .lasa_wave_rows())
)
