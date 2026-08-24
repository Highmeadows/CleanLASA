## LASA filecode 421 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(mmsesc1 = "MMSE-score based on subtraction", mmsesc2 = "MMSE-score based on spelling")

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Wave_MB_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mmsesc1 = c(
    `-5` = "na, see BMMSEVRS",
    `-4` = "na, no valid data",
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `2` = NA_character_,
    `30` = NA_character_
  ),
  mmsesc2 = c(
    `-5` = "na, see BMMSEVRS",
    `-4` = "na, no valid data",
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `2` = NA_character_,
    `30` = NA_character_
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(`-2` = "no scale (too many missing)", `2` = NA_character_, `30` = NA_character_),
    mmsesc2 = c(`-2` = "no scale (too many missing)", `2` = NA_character_, `30` = NA_character_)
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(`-2` = "no scale (too many missing)", `1` = NA_character_, `30` = NA_character_),
    mmsesc2 = c(`-2` = "no scale (too many missing)", `1` = NA_character_, `30` = NA_character_)
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-5` = "na, see BMMSEVRS",
    `-4` = "na, no valid data",
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-5` = "na, see BMMSEVRS",
    `-4` = "na, no valid data",
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc1 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mmsesc1 = "numeric", mmsesc2 = "numeric")

.lasa_fc_421 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "421", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "421", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "421", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "421", waves = .lasa_wave_rows())
)
