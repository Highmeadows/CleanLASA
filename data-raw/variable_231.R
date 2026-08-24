## LASA filecode 231 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  senseh = "hearing without a hearing aid",
  senseha = "hearing with a hearing aid",
  sensev = "vision without glasses",
  sensevg = "vision with glasses"
)

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
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  senseh = stats::setNames(character(0), character(0)),
  senseha = stats::setNames(character(0), character(0)),
  sensev = c(
    `-1` = "no valid data",
    `0` = "without or with some difficulty",
    `1` = "> 1 item with some difficulty"
  ),
  sensevg = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels[c("sensev")],
  Wave_C_labels = standardized_value_labels[c("sensev")],
  Wave_D_labels = standardized_value_labels[c("sensev")],
  Wave_E_labels = standardized_value_labels[c("sensev")],
  Wave_2B_labels = standardized_value_labels[c("sensev")],
  Wave_F_labels = standardized_value_labels[c("sensev")],
  Wave_G_labels = standardized_value_labels[c("sensev")],
  Wave_H_labels = standardized_value_labels[c("sensev")],
  Wave_3B_labels = standardized_value_labels[c("sensev")],
  Wave_I_labels = standardized_value_labels[c("sensev")],
  Wave_J_labels = standardized_value_labels[c("sensev")],
  Wave_K_labels = standardized_value_labels[c("sensev")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  senseh = "categorical",
  senseha = "categorical",
  sensev = "categorical",
  sensevg = "categorical"
)

.lasa_fc_231 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "231", waves = .lasa_wave_rows()) |>
    .override_label(wave = "F", variable = "senseh", override_value = "fmsensh") |>
    .override_label(wave = "F", variable = "senseha", override_value = "fmsensha") |>
    .override_label(wave = "F", variable = "sensev", override_value = "fmsensv") |>
    .override_label(wave = "F", variable = "sensevg", override_value = "fmsensvg") |>
    .override_label(wave = "G", variable = "senseh", override_value = "gmsensh") |>
    .override_label(wave = "G", variable = "senseha", override_value = "gmsensha") |>
    .override_label(wave = "G", variable = "sensev", override_value = "gmsensv") |>
    .override_label(wave = "G", variable = "sensevg", override_value = "gmsensvg") |>
    .override_label(wave = "H", variable = "senseh", override_value = "hmsensh") |>
    .override_label(wave = "H", variable = "senseha", override_value = "hmsensha") |>
    .override_label(wave = "H", variable = "sensev", override_value = "hmsensv") |>
    .override_label(wave = "H", variable = "sensevg", override_value = "hmsensvg") |>
    .override_label(wave = "I", variable = "senseh", override_value = "imsensh") |>
    .override_label(wave = "I", variable = "senseha", override_value = "imsensha") |>
    .override_label(wave = "I", variable = "sensev", override_value = "imsensv") |>
    .override_label(wave = "I", variable = "sensevg", override_value = "imsensvg") |>
    .override_label(wave = "J", variable = "senseh", override_value = "jmsensh") |>
    .override_label(wave = "J", variable = "senseha", override_value = "jmsensha") |>
    .override_label(wave = "J", variable = "sensev", override_value = "jmsensv") |>
    .override_label(wave = "J", variable = "sensevg", override_value = "jmsensvg") |>
    .override_label(wave = "K", variable = "senseh", override_value = "kmsensh") |>
    .override_label(wave = "K", variable = "senseha", override_value = "kmsensha") |>
    .override_label(wave = "K", variable = "sensev", override_value = "kmsensv") |>
    .override_label(wave = "K", variable = "sensevg", override_value = "kmsensvg"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "231", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "231", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "231", waves = .lasa_wave_rows())
)
