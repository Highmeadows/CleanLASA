## LASA filecode z095 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  urb = "level of urbanization (addresses per km2)",
  urbyear = "year of urbanization observation"
)

variable_labels_list <- list(
  Wave_A_labels = .replace_labels(
    harmonized_labels,
    urb = "URBA: level of urbanization (number addresses per km2)",
    urbyear = "URByearA: year of observation characteristic quarter or neighborhood"
  ),
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    urb = "URBB: level of urbanization (number addresses per km2)",
    urbyear = "URByearB: year of observation characteristic quarter or neighborhood"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    urb = "URBC: level of urbanization (number addresses per km2)",
    urbyear = "URByearC: year of observation characteristic quarter or neighborhood"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    urb = "URBD: level of urbanization (number addresses per km2)",
    urbyear = "URByearD: year of observation characteristic quarter or neighborhood"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    urb = "URBE: level of urbanization (number addresses per km2)",
    urbyear = "URByearE: year of observation characteristic quarter or neighborhood"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    urb = "URBF: level of urbanization (number addresses per km2)",
    urbyear = "URByearF: year of observation characteristic quarter or neighborhood"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    urb = "URBG: level of urbanization (number addresses per km2)",
    urbyear = "URByearG: year of observation characteristic quarter or neighborhood"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    urb = "URBH: level of urbanization (number addresses per km2)",
    urbyear = "URByearH: year of observation characteristic quarter or neighborhood"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    urb = "URBI: level of urbanization (number addresses per km2)",
    urbyear = "URByearI: year of observation characteristic quarter or neighborhood"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    urb = "level of urbanization (number addresses per km2 in quarter)",
    urbyear = "year of data urbanization"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  urb = c(
    `-7` = "birthyr 1948-1957",
    `-6` = "birthyr 1938-1947",
    `-5` = "birthyr 1903-1907",
    `-4` = "address unknown/secret",
    `-3` = "no observation / sample attrition",
    `-2` = "abroad",
    `-1` = "missing data",
    `1` = "not (<500)",
    `2` = "little (500-1000)",
    `3` = "somewhat (1000-1500)",
    `4` = "highly (1500-2500)",
    `5` = "very highly (>=2500)"
  ),
  urbyear = c(
    `-7` = "birthyr 1948-1957",
    `-6` = "birthyr 1938-1947",
    `-5` = "birthyr 1903-1907",
    `-4` = "address unknown/secret",
    `-3` = "no data collected (sample attrition)",
    `-2` = "abroad",
    `-1` = "missing data"
  )
)

value_labels_list <- list(
  Wave_A_labels = .replace_in_list(
    standardized_value_labels,
    urb = .replace_labels(
    standardized_value_labels$urb,
    `-4` = "address unknown",
    `-3` = "no data collected (sample attrition)"
  ),
    urbyear = .replace_labels(
    standardized_value_labels$urbyear,
    `-4` = "address unknown"
  )
  ),
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    urb = .replace_labels(
    standardized_value_labels$urb,
    `-4` = "address unknown",
    `-3` = "no data collected (sample attrition)"
  ),
    urbyear = .replace_labels(
    standardized_value_labels$urbyear,
    `-4` = "address unknown"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    urb = .replace_labels(
    standardized_value_labels$urb,
    `-4` = "address unknown",
    `-3` = "no data collected (sample attrition)"
  ),
    urbyear = .replace_labels(
    standardized_value_labels$urbyear,
    `-4` = "address unknown"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    urb = .replace_labels(
    standardized_value_labels$urb,
    `-4` = "address unknown",
    `-3` = "no data collected (sample attrition)"
  ),
    urbyear = .replace_labels(
    standardized_value_labels$urbyear,
    `-4` = "address unknown"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    urb = .replace_labels(
    standardized_value_labels$urb,
    `-4` = "address unknown",
    `-3` = "no data collected (sample attrition)"
  ),
    urbyear = .replace_labels(
    standardized_value_labels$urbyear,
    `-4` = "address unknown"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    urb = .replace_labels(
    standardized_value_labels$urb,
    `-4` = "address unknown",
    `-3` = "no data collected (sample attrition)"
  ),
    urbyear = .replace_labels(
    standardized_value_labels$urbyear,
    `-4` = "address unknown"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    urb = .replace_labels(
    standardized_value_labels$urb,
    `-4` = "address unknown",
    `-3` = "no data collected (sample attrition)"
  ),
    urbyear = .replace_labels(
    standardized_value_labels$urbyear,
    `-4` = "address unknown"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    urb = .replace_labels(
    standardized_value_labels$urb,
    `-4` = "address unknown",
    `-3` = "no data collected (sample attrition)"
  ),
    urbyear = .replace_labels(
    standardized_value_labels$urbyear,
    `-4` = "address unknown"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    urb = .replace_labels(
    standardized_value_labels$urb,
    `-4` = "address unknown",
    `-3` = "no data collected (sample attrition)"
  ),
    urbyear = .replace_labels(
    standardized_value_labels$urbyear,
    `-4` = "address unknown"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    urb = c(
    `-4` = "address unknown/secret",
    `-3` = "no observation",
    `1` = "not (<500)",
    `2` = "little (500-1000)",
    `3` = "somewhat (1000-1500)",
    `4` = "highly (1500-2500)",
    `5` = "very highly (>=2500)"
  ),
    urbyear = c(`-4` = "address unknown/secret", `-2` = "abroad")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(urb = "categorical", urbyear = "numeric")

.lasa_fc_z095 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "z095", waves = .lasa_wave_rows(has_wave_a = TRUE)),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "z095", waves = .lasa_wave_rows(has_wave_a = TRUE)),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "z095", waves = .lasa_wave_rows(has_wave_a = TRUE)),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "z095", waves = .lasa_wave_rows(has_wave_a = TRUE))
)
