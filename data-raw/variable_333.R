## LASA filecode 333 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qqulims = "Mental health (SF-12)",
  qqulips = "Physical health (SF-12)",
  qqulisf = "Physical and mental health (SF-12)"
)

variable_labels_list <- list(
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    qqulims = "Mental health (SF-12) Low-High",
    qqulips = "Physical health (SF-12) Low-High",
    qqulisf = "Physical and mental health (SF-12) Low-High"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    qqulims = "Mental health (SF-12) Low-High",
    qqulips = "Physical health (SF-12) Low-High",
    qqulisf = "Physical and mental health (SF-12) Low-High"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    qqulims = "Mental health (SF-12) Low-High",
    qqulips = "Physical health (SF-12) Low-High",
    qqulisf = "Physical and mental health (SF-12) Low-High"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    qqulims = "Mental health (SF-12) Low-High",
    qqulips = "Physical health (SF-12) Low-High",
    qqulisf = "Physical and mental health (SF-12) Low-High"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    qqulims = "Mental health (SF-12) Low-High",
    qqulips = "Physical health (SF-12) Low-High",
    qqulisf = "Physical and mental health (SF-12) Low-High"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    qqulims = "Mental health (SF-12) Low-High",
    qqulips = "Physical health (SF-12) Low-High",
    qqulisf = "Physical and mental health (SF-12) Low-High"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    qqulims = "Mental health (SF-12) Low-High",
    qqulips = "Physical health (SF-12) Low-High",
    qqulisf = "Physical and mental health (SF-12) Low-High"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    qqulims = "Mental health (SF-12) Low-High",
    qqulips = "Physical health (SF-12) Low-High",
    qqulisf = "Physical and mental health (SF-12) Low-High"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    qqulims = "Mental health (SF-12) Low-High",
    qqulips = "Physical health (SF-12) Low-High",
    qqulisf = "Physical and mental health (SF-12) Low-High"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qqulims = c(
    `-1` = "no valid data",
    `6` = NA_character_,
    `7` = NA_character_,
    `8` = NA_character_,
    `27` = NA_character_
  ),
  qqulips = c(`-1` = "no valid data", `6` = NA_character_, `20` = NA_character_),
  qqulisf = c(
    `-1` = "no valid data",
    `12` = NA_character_,
    `13` = NA_character_,
    `14` = NA_character_,
    `47` = NA_character_
  )
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qqulims = c(`-1` = "no valid data", `6` = NA_character_, `27` = NA_character_),
    qqulisf = c(`-1` = "no valid data", `12` = NA_character_, `47` = NA_character_)
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qqulims = c(`-1` = "no valid data", `8` = NA_character_, `27` = NA_character_),
    qqulisf = c(`-1` = "no valid data", `14` = NA_character_, `47` = NA_character_)
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qqulims = c(`-1` = "no valid data", `8` = NA_character_, `27` = NA_character_),
    qqulisf = c(`-1` = "no valid data", `14` = NA_character_, `47` = NA_character_)
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    qqulims = c(`-1` = "no valid data", `6` = NA_character_, `27` = NA_character_),
    qqulisf = c(`-1` = "no valid data", `13` = NA_character_, `47` = NA_character_)
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    qqulims = c(`-1` = "no valid data", `7` = NA_character_, `27` = NA_character_),
    qqulisf = c(`-1` = "no valid data", `13` = NA_character_, `47` = NA_character_)
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qqulims = c(`-1` = "no valid data", `7` = NA_character_, `27` = NA_character_),
    qqulisf = c(`-1` = "no valid data", `13` = NA_character_, `47` = NA_character_)
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qqulims = c(`-1` = "no valid data", `7` = NA_character_, `27` = NA_character_),
    qqulisf = c(`-1` = "no valid data", `13` = NA_character_, `47` = NA_character_)
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qqulims = c(`-1` = "no valid data", `7` = NA_character_, `27` = NA_character_),
    qqulisf = c(`-1` = "no valid data", `13` = NA_character_, `47` = NA_character_)
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    qqulims = c(`-1` = "no valid data", `7` = NA_character_, `27` = NA_character_),
    qqulisf = c(`-1` = "no valid data", `13` = NA_character_, `47` = NA_character_)
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qqulims = "numeric", qqulips = "numeric", qqulisf = "numeric")

.lasa_fc_333 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "333", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "333", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "333", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "333", waves = .lasa_wave_rows())
)
