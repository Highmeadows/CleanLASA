## LASA filecode 222 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  craven = "Total coloured Raven score",
  ravatot = "Total coloured Raven score, section A",
  ravbtot = "Total coloured Raven score, section B",
  rmcrab = "Reason for missing/invalid coloured Raven section B score",
  rmcrav = "Reason for missing/invalid coloured Raven score"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    craven = "Total score coloured raven",
    ravatot = "Total c. raven score section A",
    ravbtot = "Total c. raven score section B",
    rmcrav = "Reason, no valid data on c. raven"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    craven = "Total score coloured raven",
    ravatot = "Total c. raven score section A",
    ravbtot = "Total c. raven score section B",
    rmcrav = "Reason, no valid data on c. raven"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    craven = "Total score coloured raven",
    ravatot = "Total c. raven score section A",
    ravbtot = "Total c. raven score section B",
    rmcrav = "Reason, no valid data on c. raven"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    craven = "Total score coloured raven",
    ravatot = "Total c. raven score section A",
    ravbtot = "Total c. raven score section B",
    rmcrav = "Reason, no valid data on c. raven"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    craven = "Total score coloured raven",
    ravatot = "Total c. raven score section A",
    ravbtot = "Total c. raven score section B",
    rmcrav = "Reason, no valid data on c. raven"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    craven = "Total score coloured raven",
    ravatot = "Total c. raven score section A",
    ravbtot = "Total c. raven score section B",
    rmcrab = "Reason, no valid data b-section c. raven",
    rmcrav = "Reason, no valid data on c. raven"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    craven = "Total score coloured raven",
    ravatot = "Total c. raven score section A",
    ravbtot = "Total c. raven score section B",
    rmcrab = "Reason, no valid data b-section c. raven",
    rmcrav = "Reason, no valid data on c. raven"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  craven = c(`-2` = "no valid data"),
  ravatot = c(`-2` = "no valid data"),
  ravbtot = c(`-2` = "no valid data"),
  rmcrab = c(
    `-2` = "valid score",
    `-1` = "see FMRMCRAV",
    `0` = "- to be coded -",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical problems",
    `8` = "unknown"
  ),
  rmcrav = c(
    `-2` = "valid score",
    `-1` = "see FMRMCRAV",
    `0` = "- to be coded -",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to complete test (physical)",
    `7` = "technical problems",
    `8` = "unknown"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    craven = .replace_labels(
    standardized_value_labels$craven,
    `-2` = "na, see BRMCRAV"
  ),
    ravatot = .replace_labels(
    standardized_value_labels$ravatot,
    `-2` = "na, see BRMCRAV"
  ),
    ravbtot = .replace_labels(
    standardized_value_labels$ravbtot,
    `-2` = "na, see BRMCRAV"
  ),
    rmcrav = c(
    `-2` = "valid score",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical): visus",
    `7` = "technical problems",
    `8` = "unknown"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    rmcrav = c(
    `-2` = "valid score",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical): visus",
    `7` = "technical problems",
    `8` = "unknown"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    rmcrav = c(
    `-2` = "valid score",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical problems",
    `8` = "unknown"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    rmcrav = c(
    `-2` = "valid score",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical problems",
    `8` = "unknown"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("craven", "ravatot", "ravbtot", "rmcrav")],
    rmcrav = c(
    `-2` = "valid score",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical problems",
    `8` = "unknown"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    rmcrab = c(
    `-2` = "valid score",
    `-1` = "see FMRMCRAV",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical problems",
    `8` = "unknown"
  ),
    rmcrav = c(
    `-2` = "valid score",
    `-1` = "see FMRMCRAV",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical problems",
    `8` = "unknown"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    rmcrab = .replace_labels(
    standardized_value_labels$rmcrab,
    `-1` = "see GMRMCRAV"
  ),
    rmcrav = .replace_labels(
    standardized_value_labels$rmcrav,
    `-1` = "see GMRMCRAV",
    `6` = "not able to (physical)"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  craven = "numeric",
  ravatot = "numeric",
  ravbtot = "numeric",
  rmcrab = "categorical",
  rmcrav = "categorical"
)

.lasa_fc_222 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "222", waves = .lasa_wave_rows()) |>
    .override_label(wave = "E", variable = "craven", override_value = "emcraven") |>
    .override_label(wave = "E", variable = "ravatot", override_value = "emrvatot") |>
    .override_label(wave = "E", variable = "ravbtot", override_value = "emrvbtot") |>
    .override_label(wave = "E", variable = "rmcrav", override_value = "emrmcrav") |>
    .override_label(wave = "2B", variable = "craven", override_value = "bmcraven") |>
    .override_label(wave = "F", variable = "craven", override_value = "fmcraven") |>
    .override_label(wave = "F", variable = "ravatot", override_value = "fmrvatot") |>
    .override_label(wave = "F", variable = "ravbtot", override_value = "fmrvbtot") |>
    .override_label(wave = "F", variable = "rmcrab", override_value = "fmrmcrab") |>
    .override_label(wave = "F", variable = "rmcrav", override_value = "fmrmcrav") |>
    .override_label(wave = "G", variable = "craven", override_value = "gmcraven") |>
    .override_label(wave = "G", variable = "ravatot", override_value = "gmrvatot") |>
    .override_label(wave = "G", variable = "ravbtot", override_value = "gmrvbtot") |>
    .override_label(wave = "G", variable = "rmcrab", override_value = "gmrmcrab") |>
    .override_label(wave = "G", variable = "rmcrav", override_value = "gmrmcrav"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "222", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "222", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "222", waves = .lasa_wave_rows())
)
