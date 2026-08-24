## LASA filecode z991 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  zdeceas17 = "respondent deceased before 2018",
  zdedate_y = "date of death, year part",
  zecdl = "external cause of death: location",
  zecdmi = "external cause of death: main injury",
  zpcod = "primary cause of death",
  zscod1 = "first secondary cause of death",
  zscod2 = "second secondary cause of death",
  zscod3 = "third secondary cause of death"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  zdeceas17 = c(`-2` = "no data, see gbadata", `0` = "no", `1` = "yes"),
  zdedate_y = c(`-2` = "no data, see deceas"),
  zecdl = stats::setNames(character(0), character(0)),
  zecdmi = stats::setNames(character(0), character(0)),
  zpcod = c(
    `-5` = "not deceased (before 2018)",
    `-4` = "deceased abroad / no gbadata",
    `-3` = "cause unknown / no matching (LASA/CBS)",
    `-2` = "no data CBS asked (no LASA data)",
    `-1` = "no informed consent for enquiry"
  ),
  zscod1 = stats::setNames(character(0), character(0)),
  zscod2 = stats::setNames(character(0), character(0)),
  zscod3 = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("zdeceas17", "zdedate_y", "zpcod")],
    zdeceas17 = .replace_labels(
    standardized_value_labels$zdeceas17,
    `-2` = "no data, see GBADATA"
  ),
    zdedate_y = .replace_labels(
    standardized_value_labels$zdedate_y,
    `-2` = "no data, see DECEAS"
  ),
    zpcod = .replace_labels(
    standardized_value_labels$zpcod,
    `-4` = "deceased abroad / no GBADATA"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  zdeceas17 = "categorical",
  zdedate_y = "numeric",
  zecdl = "text",
  zecdmi = "text",
  zpcod = "text",
  zscod1 = "text",
  zscod2 = "text",
  zscod3 = "text"
)

.lasa_fc_z991 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "z991", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "zdeceas17", override_value = "zdeceas17") |>
    .override_label(wave = "B", variable = "zdedate_y", override_value = "zdedate_y") |>
    .override_label(wave = "B", variable = "zecdl", override_value = "zecdl") |>
    .override_label(wave = "B", variable = "zecdmi", override_value = "zecdmi") |>
    .override_label(wave = "B", variable = "zpcod", override_value = "zpcod") |>
    .override_label(wave = "B", variable = "zscod1", override_value = "zscod1") |>
    .override_label(wave = "B", variable = "zscod2", override_value = "zscod2") |>
    .override_label(wave = "B", variable = "zscod3", override_value = "zscod3"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "z991", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "z991", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "z991", waves = .lasa_wave_rows())
)
