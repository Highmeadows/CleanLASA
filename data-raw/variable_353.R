## LASA filecode 353 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  malcnei = "NEI: standardized alcohol use corrected for sex",
  malconw = "Number of alcoholic drinks per week",
  malcopp = "R is potential problem drinker (at present)",
  malcppp = "Potential Problem drinker in the past",
  mgarret = "Garretsen Indication of present alcohol use"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_D_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_E_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_2B_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_F_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_G_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_H_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_3B_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_MB_labels = harmonized_labels[c("malcnei", "malconw", "mgarret")],
  Wave_I_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_J_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_K_labels = harmonized_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  malcnei = c(
    `-4` = "no valid data",
    `0` = "no use",
    `1` = "moderate use",
    `2` = "grey area",
    `3` = "excessive use"
  ),
  malconw = c(`-4` = "no valid data", `0` = "R does not drink", `0.5` = NA_character_, `77` = NA_character_),
  malcopp = c(`-4` = "no valid data", `0` = "not a problem drinker", `1` = "potential problem drinker"),
  malcppp = c(
    `-4` = "no valid data",
    `-3` = "R never drank",
    `-2` = "R drinks at present",
    `0` = "not a problem drinker",
    `1` = "potential problem drinker"
  ),
  mgarret = c(
    `-4` = "no valid data",
    `-1` = "no answer",
    `0` = "R does not drink",
    `1` = "light",
    `2` = "moderate",
    `3` = "excessive",
    `4` = "very excessive"
  )
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Wave_C_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_D_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_E_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_2B_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_F_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_G_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_H_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_3B_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_MB_labels = standardized_value_labels[c("malcnei", "malconw", "mgarret")],
  Wave_I_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_J_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Wave_K_labels = standardized_value_labels[c("malcnei", "malconw", "malcopp", "mgarret")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  malcnei = "categorical",
  malconw = "numeric",
  malcopp = "categorical",
  malcppp = "categorical",
  mgarret = "categorical"
)

.lasa_fc_353 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "353", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "353", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "353", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "353", waves = .lasa_wave_rows())
)
