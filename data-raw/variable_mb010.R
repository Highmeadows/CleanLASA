## LASA filecode mb010 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  marst = "marital status",
  partner = "partner status (none, co-residing, residing outside the household)",
  partst = "partner status",
  separ = "why not living with spouse (for married and with registered partnership)"
)

variable_labels_list <- list(
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  marst = c(
    `-1` = "unknown",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowhood",
    `5` = "registered partnership"
  ),
  partner = c(
    `-1` = "unknown",
    `0` = "no partner",
    `1` = "partner (co-residence)",
    `2` = "partner (outside household)"
  ),
  partst = c(
    `-1` = "unknown",
    `0` = "no partner",
    `1` = "lives with spouse (married or registered partnership)",
    `2` = "lives with opposite sex (not married)",
    `3` = "lives with same sex (not married)",
    `4` = "partner opposite sex outside household (not married)",
    `5` = "partner same sex outside household (not married)",
    `6` = "spouse outside household (married or registered partnership; relationship sometimes broken; see SEPAR)",
    `7` = "combination 4 & 6",
    `8` = "combination 1 & 4",
    `9` = "combination 2 & 6",
    `10` = "registered partnership: lives with spouse (same sex)"
  ),
  separ = c(
    `-3` = "not married / data collection (birth cohort not included)",
    `-2` = "not separated (i.e. living with spouse)",
    `-1` = "unknown",
    `1` = "partner in hospital/nursing home",
    `2` = "R in hospital/nursing home",
    `3` = "partner elsewhere (e.g. employment)",
    `4` = "R elsewhere (e.g. employment)",
    `5` = "other (relationship exists)",
    `6` = "relationship broken",
    `7` = "other",
    `8` = "wants to live alone",
    `9` = "political refugee",
    `10` = "wife abroad, no house",
    `11` = "wife abroad, waiting for reunification"
  )
)

value_labels_list <- list(
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    separ = .replace_labels(
    standardized_value_labels$separ,
    `-3` = "not married"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(marst = "categorical", partner = "categorical", partst = "categorical", separ = "categorical")

.lasa_fc_mb010 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "mb010", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "mb010", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "mb010", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "mb010", waves = .lasa_wave_rows())
)
