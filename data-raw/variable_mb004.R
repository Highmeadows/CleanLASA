## LASA filecode mb004 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  aeducat = "education level attained (categorical)",
  aethnic = "ethnic identification",
  bycohort = "5-years-cohort birthyear",
  byear = "birthyear of respondent",
  migcoh = "migrant cohort",
  sex = "sex respondent"
)

variable_labels_list <- list(
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  aeducat = c(
    `-1` = "no answer",
    `1` = "elementary not completed",
    `2` = "elementary education",
    `3` = "lower vocational education",
    `4` = "general intermediate education",
    `5` = "intermediate vocational education",
    `6` = "general secondary education",
    `7` = "higher vocational education",
    `8` = "college education",
    `9` = "university education"
  ),
  aethnic = c(
    `-1` = "no answer, asked",
    `1` = "Dutch/Netherlands",
    `2` = "Moroccan Arabic",
    `3` = "Moroccan Berber",
    `4` = "Turkish",
    `5` = "Kurdish",
    `7` = "Dutch + Moroccan",
    `8` = "Dutch + Turkish",
    `9` = "Moroccan (not specific Arabic or Berber)",
    `10` = "Dutch + Moroccan Arabic)",
    `11` = "Dutch + Moroccan Berber)",
    `12` = "Moroccan (Arabic + Berber)",
    `13` = "Dutch + Moroccan (Arabic + Berber)",
    `14` = "Armenian",
    `15` = "world citizen",
    `16` = "other"
  ),
  bycohort = c(`10` = "1948-52", `11` = "1953-57"),
  byear = stats::setNames(character(0), character(0)),
  migcoh = c(`1` = "Moroccan", `2` = "Turkish"),
  sex = c(`1` = "male", `2` = "female")
)

value_labels_list <- list(
  Wave_MB_labels = standardized_value_labels[c("aeducat", "aethnic", "bycohort", "migcoh", "sex")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  aeducat = "categorical",
  aethnic = "categorical",
  bycohort = "categorical",
  byear = "numeric",
  migcoh = "categorical",
  sex = "categorical"
)

.lasa_fc_mb004 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "mb004", waves = .lasa_wave_rows()) |>
    .override_label(wave = "MB", variable = "aeducat", override_value = "aeducat") |>
    .override_label(wave = "MB", variable = "aethnic", override_value = "aethnic") |>
    .override_label(wave = "MB", variable = "bycohort", override_value = "bycohort") |>
    .override_label(wave = "MB", variable = "byear", override_value = "byear") |>
    .override_label(wave = "MB", variable = "migcoh", override_value = "migcoh") |>
    .override_label(wave = "MB", variable = "sex", override_value = "sex"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "mb004", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "mb004", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "mb004", waves = .lasa_wave_rows())
)
