## LASA filecode zoa1 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(oah = "Symptomatic hip osteoarthritis", oak = "Symptomatic knee osteoarthritis")

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    oah = "symptomatic hip OA at B",
    oak = "symptomatic knee OA at B"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    oah = "symptomatic hip OA at C",
    oak = "symptomatic knee OA at C"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    oah = "symptomatic hip OA at D",
    oak = "symptomatic knee OA at D"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    oah = "symptomatic hip OA at E",
    oak = "symptomatic knee OA at E"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    oah = "symptomatic hip OA at F",
    oak = "symptomatic knee OA at F"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    oah = "symptomatic hip OA at G",
    oak = "symptomatic knee OA at G"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    oah = "symptomatic hip OA at H",
    oak = "symptomatic knee OA at H"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    oah = "symptomatic hip OA at I",
    oak = "symptomatic knee OA at I"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  oah = c(
    `-9` = "missing",
    `0` = "no",
    `1` = "possible",
    `2` = "yes",
    `8` = "dropout",
    `9` = "dropout at previous waves"
  ),
  oak = c(
    `-9` = "missing",
    `0` = "no",
    `1` = "possible",
    `2` = "yes",
    `8` = "dropout",
    `9` = "dropout at previous waves"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    oah = c(`-9` = "missing", `0` = "no", `1` = "possible", `2` = "yes"),
    oak = c(`-9` = "missing", `0` = "no", `1` = "possible", `2` = "yes")
  ),
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(oah = "categorical", oak = "categorical")

.lasa_fc_zoa1 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "zoa1", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "zoa1", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "zoa1", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "zoa1", waves = .lasa_wave_rows())
)
