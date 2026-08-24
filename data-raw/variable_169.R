## LASA filecode 169 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mdexp1 = "daily experiences: treated with less respect",
  mdexp2 = "daily experiences: lower service level in restaurants/shops",
  mdexp3 = "daily experiences: people assuming I am not smart",
  mdexp4 = "daily experiences: being harassed",
  mdexp5 = "daily experiences: less good treatment from doctors or in hospitals",
  mdexp61 = "perceived reason for experience: your gender",
  mdexp62 = "perceived reason for experience: your ethnicity",
  mdexp63 = "perceived reason for experience: your age",
  mdexp64 = "perceived reason for experience: your weight",
  mdexp65 = "perceived reason for experience: a physical disability",
  mdexp66 = "perceived reason for experience: an aspect of your physical appearance",
  mdexp67 = "perceived reason for experience: your sexual orientation",
  mdexp68 = "perceived reason for experience: your financial situation",
  mdexp69 = "perceived reason for experience: other"
)

variable_labels_list <- list(
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    mdexp61 = "perceived reason experience: your gender",
    mdexp62 = "perceived reason experience: your ethnicity",
    mdexp63 = "perceived reason experience: your age",
    mdexp64 = "perceived reason experience: your weight",
    mdexp65 = "perceived reason experience: a physical disability",
    mdexp66 = "perceived reason experience: an aspect of your physical appearance",
    mdexp67 = "perceived reason experience: your sexual orientation",
    mdexp68 = "perceived reason experience: your financial situation",
    mdexp69 = "perceived reason experience: other"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mdexp1 = c(
    `-1` = "na, asked",
    `1` = "almost daily",
    `2` = "at least once a week",
    `3` = "few times a month",
    `4` = "few times a year",
    `5` = "less than once a year",
    `6` = "never"
  ),
  mdexp2 = c(
    `-1` = "na, asked",
    `1` = "almost daily",
    `2` = "at least once a week",
    `3` = "few times a month",
    `4` = "few times a year",
    `5` = "less than once a year",
    `6` = "never"
  ),
  mdexp3 = c(
    `-1` = "na, asked",
    `1` = "almost daily",
    `2` = "at least once a week",
    `3` = "few times a month",
    `4` = "few times a year",
    `5` = "less than once a year",
    `6` = "never"
  ),
  mdexp4 = c(
    `-1` = "na, asked",
    `1` = "almost daily",
    `2` = "at least once a week",
    `3` = "few times a month",
    `4` = "few times a year",
    `5` = "less than once a year",
    `6` = "never"
  ),
  mdexp5 = c(
    `-1` = "na, asked",
    `1` = "almost daily",
    `2` = "at least once a week",
    `3` = "few times a month",
    `4` = "few times a year",
    `5` = "less than once a year",
    `6` = "never"
  ),
  mdexp61 = c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mdexp62 = c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mdexp63 = c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mdexp64 = c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mdexp65 = c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mdexp66 = c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mdexp67 = c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mdexp68 = c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mdexp69 = c(`-2` = "na, never experienced", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")
)

value_labels_list <- list(
  Wave_J_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mdexp1 = "categorical",
  mdexp2 = "categorical",
  mdexp3 = "categorical",
  mdexp4 = "categorical",
  mdexp5 = "categorical",
  mdexp61 = "categorical",
  mdexp62 = "categorical",
  mdexp63 = "categorical",
  mdexp64 = "categorical",
  mdexp65 = "categorical",
  mdexp66 = "categorical",
  mdexp67 = "categorical",
  mdexp68 = "categorical",
  mdexp69 = "categorical"
)

.lasa_fc_169 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "169", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "169", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "169", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "169", waves = .lasa_wave_rows())
)
