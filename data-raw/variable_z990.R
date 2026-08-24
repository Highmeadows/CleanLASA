## LASA filecode z990 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  cdcertnr = "death certificate number known?",
  cdplace = "death place known?",
  de210815 = "death status at August 15, 2021",
  de_age = "age at death",
  de_date = "date of death",
  deceas = "respondent deceased?",
  dedate = "date of death (yyyymmdd)",
  dedate_d = "date of death, day part",
  dedate_m = "date of death, month part",
  dedate_y = "date of death, year part",
  followup = "followup from baseline to 15-8-2021 (days)",
  gbadata = "GBA data available",
  lasadata = "participation lasa baseline"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  cdcertnr = c(`-2` = "no data, see deceas", `-1` = "missing data", `0` = "no", `1` = "yes"),
  cdplace = c(`-2` = "no data, see deceas", `-1` = "missing data", `0` = "no", `1` = "yes"),
  de210815 = c(`-2` = "no GBA data", `0` = "alive at 15-8-2021", `1` = "deceased at 15-8-2021"),
  de_age = c(`-2` = "no data, see deceas"),
  de_date = stats::setNames(character(0), character(0)),
  deceas = c(`-2` = "no data, see gbadata", `0` = "no", `1` = "yes"),
  dedate = c(`-2` = "no data, see deceas"),
  dedate_d = c(`-2` = "no data, see deceas"),
  dedate_m = c(`-2` = "no data, see deceas"),
  dedate_y = c(`-2` = "no data, see deceas"),
  followup = c(`-2` = "no GBA data", `-1` = "no participation lasa"),
  gbadata = c(`-2` = "no records found", `-1` = "no records, moved abroad", `1` = "data available"),
  lasadata = c(`0` = "no", `1` = "yes")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "cdcertnr",
    "cdplace",
    "de210815",
    "de_age",
    "deceas",
    "dedate",
    "dedate_d",
    "dedate_m",
    "dedate_y",
    "followup",
    "gbadata",
    "lasadata"
  )],
    cdcertnr = .replace_labels(
    standardized_value_labels$cdcertnr,
    `-2` = "no data, see DECEAS"
  ),
    cdplace = .replace_labels(
    standardized_value_labels$cdplace,
    `-2` = "no data, see DECEAS"
  ),
    de_age = .replace_labels(
    standardized_value_labels$de_age,
    `-2` = "no data, see DECEAS"
  ),
    deceas = .replace_labels(
    standardized_value_labels$deceas,
    `-2` = "no data, see GBADATA"
  ),
    dedate = .replace_labels(
    standardized_value_labels$dedate,
    `-2` = "no data, see DECEAS"
  ),
    dedate_d = .replace_labels(
    standardized_value_labels$dedate_d,
    `-2` = "no data, see DECEAS"
  ),
    dedate_m = .replace_labels(
    standardized_value_labels$dedate_m,
    `-2` = "no data, see DECEAS"
  ),
    dedate_y = .replace_labels(
    standardized_value_labels$dedate_y,
    `-2` = "no data, see DECEAS"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  cdcertnr = "categorical",
  cdplace = "categorical",
  de210815 = "categorical",
  de_age = "numeric",
  de_date = "date",
  deceas = "categorical",
  dedate = "date",
  dedate_d = "numeric",
  dedate_m = "numeric",
  dedate_y = "numeric",
  followup = "numeric",
  gbadata = "categorical",
  lasadata = "categorical"
)

.lasa_fc_z990 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "z990", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "cdcertnr", override_value = "cdcertnr") |>
    .override_label(wave = "B", variable = "cdplace", override_value = "cdplace") |>
    .override_label(wave = "B", variable = "de210815", override_value = "de210815") |>
    .override_label(wave = "B", variable = "de_age", override_value = "de_age") |>
    .override_label(wave = "B", variable = "de_date", override_value = "de_date") |>
    .override_label(wave = "B", variable = "deceas", override_value = "deceas") |>
    .override_label(wave = "B", variable = "dedate", override_value = "dedate") |>
    .override_label(wave = "B", variable = "dedate_d", override_value = "dedate_d") |>
    .override_label(wave = "B", variable = "dedate_m", override_value = "dedate_m") |>
    .override_label(wave = "B", variable = "dedate_y", override_value = "dedate_y") |>
    .override_label(wave = "B", variable = "followup", override_value = "followup") |>
    .override_label(wave = "B", variable = "gbadata", override_value = "GBAdata") |>
    .override_label(wave = "B", variable = "lasadata", override_value = "lasadata"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "z990", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "z990", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "z990", waves = .lasa_wave_rows())
)
