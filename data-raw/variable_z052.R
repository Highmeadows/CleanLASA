## LASA filecode z052 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  `052record` = "domestic-address record type",
  municipality = "municipality or country (Statistics Netherlands coding)",
  sample = "sample cohort"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    `052record` = "municipality at birth / after 1st move / in 1944 / at age 45 years / of current residence",
    municipality = "municipality (coding Statistics Netherlands) or country",
    sample = "description of sample 1992 - 2002 - 2012"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  `052record` = c(
    `1` = "at birth",
    `2` = "after 1st move",
    `3` = "in 1944",
    `4` = "at age 45 years",
    `5` = "of current residence"
  ),
  municipality = c(
    `-6` = "not applicable: first move",
    `-3` = "1944:not born",
    `-2` = "not applicable: from abroad",
    `-1` = "no answer",
    `3` = "Appingedam",
    `1987` = NA_character_,
    `7001` = "Neth:Groningen",
    `7012` = "Neth:Flevoland",
    `7098` = "Neth:travelling",
    `7099` = "Neth:not classifiable",
    `8001` = "BRD",
    `9020` = "China",
    `9098` = "travelling abroad",
    `9099` = "abroad:not classifiable",
    `9999` = "not classifiable"
  ),
  sample = c(
    `0` = "1992 sample - oldest LSN birth cohort",
    `1` = "1992 sample - birth cohorts LASA",
    `2` = "2002 sample LASA",
    `3` = "2012 sample LASA"
  )
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(`052record` = "categorical", municipality = "categorical", sample = "categorical")

.lasa_fc_z052 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "z052", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "sample", override_value = "sample"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "z052", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "z052", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "z052", waves = .lasa_wave_rows())
)
