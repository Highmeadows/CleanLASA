## LASA filecode mb008 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  age = "Age at LASA main interview (w1)",
  days = "Age at LASA main interview in days (w1)",
  mage = "Age at LASA medical interview (w1)",
  mdays = "Age at LASA medical interview in days (w1)",
  t2dat_ = "LASA main interview date (w1)",
  t2mdat_ = "LASA medical interview date (w1)"
)

variable_labels_list <- list(
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  age = stats::setNames(character(0), character(0)),
  days = stats::setNames(character(0), character(0)),
  mage = stats::setNames(character(0), character(0)),
  mdays = stats::setNames(character(0), character(0)),
  t2dat_ = stats::setNames(character(0), character(0)),
  t2mdat_ = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_MB_labels = standardized_value_labels[character(0)],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  age = "numeric",
  days = "numeric",
  mage = "numeric",
  mdays = "numeric",
  t2dat_ = "date",
  t2mdat_ = "date"
)

.lasa_fc_mb008 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "mb008", waves = .lasa_wave_rows()) |>
    .override_label(wave = "MB", variable = "t2dat_", override_value = "t2dat_") |>
    .override_label(wave = "MB", variable = "t2mdat_", override_value = "t2mdat_"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "mb008", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "mb008", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "mb008", waves = .lasa_wave_rows())
)
