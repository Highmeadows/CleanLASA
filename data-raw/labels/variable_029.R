## LASA filecode 029 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  metaem1 = "Meta emotion item 01: emotional",
  metaem2 = "Meta emotion item 02: feelings",
  metaem3 = "Meta emotion item 03: satisfied",
  metaem4 = "Meta emotion item 04: change",
  rmmeemo = "Reason missing: Meta emotion"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  metaem1 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "absolutely not emotional",
    `2` = "a little emotional",
    `3` = "fairly emotional",
    `4` = "very emotional"
  ),
  metaem2 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "very little",
    `2` = "little",
    `3` = "much",
    `4` = "very much"
  ),
  metaem3 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not satisfied at all",
    `2` = "a bit satisfied",
    `3` = "rather satisfied",
    `4` = "very satisfied"
  ),
  metaem4 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "rarely or never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "very often"
  ),
  rmmeemo = c(
    `-2` = "not missing",
    `1` = "short interview",
    `2` = "interview terminated",
    `5` = "no valid data"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    metaem1 = .replace_labels(
    standardized_value_labels$metaem1,
    `-2` = "na, see BRMMEEMO",
    `-1` = "na, asked"
  ),
    metaem2 = .replace_labels(
    standardized_value_labels$metaem2,
    `-2` = "na, see BRMMEEMO",
    `-1` = "na, asked"
  ),
    metaem3 = .replace_labels(
    standardized_value_labels$metaem3,
    `-2` = "na, see BRMMEEMO",
    `-1` = "na, asked"
  ),
    metaem4 = .replace_labels(
    standardized_value_labels$metaem4,
    `-2` = "na, see BRMMEEMO",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  metaem1 = "categorical",
  metaem2 = "categorical",
  metaem3 = "categorical",
  metaem4 = "categorical",
  rmmeemo = "categorical"
)

.lasa_fc_029 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "029", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "029", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "029", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "029", waves = .lasa_wave_rows())
)
