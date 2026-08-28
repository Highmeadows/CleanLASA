## LASA filecode 221 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mmsesc = "MMSE score based on maximum spelling/number performance",
  mmsesc2 = "Illiterate MMSE score based on spelling"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "mmsesc"
  ),
  `C` = c(
    "mmsesc"
  ),
  `D` = c(
    "mmsesc"
  ),
  `E` = c(
    "mmsesc"
  ),
  `2B` = c(
    "mmsesc"
  ),
  `F` = c(
    "mmsesc"
  ),
  `G` = c(
    "mmsesc"
  ),
  `H` = c(
    "mmsesc"
  ),
  `3B` = c(
    "mmsesc"
  ),
  `MB` = c(
    "mmsesc",
    "mmsesc2"
  ),
  `I` = c(
    "mmsesc"
  ),
  `J` = c(
    "mmsesc"
  ),
  `K` = c(
    "mmsesc"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num",
    mmsesc2 = "Illiterate MMSE-score based on spelling"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    mmsesc = "MMSE-score based on maximum spel/num"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mmsesc = c(
    `-5` = "no valid data",
    `-4` = "na, no valid data",
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `2` = NA_character_,
    `30` = NA_character_
  ),
  mmsesc2 = c(
    `-5` = "no valid data",
    `-4` = "na, no valid data",
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(`-2` = "no scale (too many missing)", `2` = NA_character_, `30` = NA_character_)
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(`-2` = "no scale (too many missing)", `1` = NA_character_, `30` = NA_character_)
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-5` = "na, see BMMSEVRS",
    `-4` = "na, no valid data",
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  ),
    mmsesc2 = .replace_labels(
    standardized_value_labels$mmsesc2,
    `-5` = "na, see BMMSEVRS"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    mmsesc = c(
    `-3` = "interview terminated",
    `-2` = "no scale (too many missing)",
    `1` = NA_character_,
    `30` = NA_character_
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mmsesc = "numeric", mmsesc2 = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "221", waves = .lasa_wave_rows()) |>
    .override_label(wave = "MB", variable = "mmsesc", override_value = "bmmsesc1"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "221", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "221", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "221", waves = .lasa_wave_rows())
)

.lasa_fc_221 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

