## LASA filecode 867 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mchol2 = "Blood: total cholesterol mmol/L",
  mfructo = "Blood: fructosamin umol/L",
  mhdl2 = "Blood: hdl-cholesterol mmol/L",
  mldl2 = "Blood: ldl-cholesterol mmol/l",
  mtrigl2 = "Blood: triglycerids mmol/L"
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mchol2 = c(`-2` = "no data, see MLAB(-2) in LASAC850", `-1` = "no valid data"),
  mfructo = c(`-2` = "no data, see MLAB(-2) in LASAC850", `-1` = "no valid data"),
  mhdl2 = c(`-2` = "no data, see MLAB(-2) in LASAC850", `-1` = "no valid data"),
  mldl2 = c(`-2` = "no data, see MLAB(-2) in LASAC850", `-1` = "no valid data"),
  mtrigl2 = c(`-2` = "no data, see MLAB(-2) in LASAC850", `-1` = "no valid data")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mchol2 = .replace_labels(
    standardized_value_labels$mchol2,
    `-2` = "no data, see CMLAB(-2) in LASAC850"
  ),
    mfructo = .replace_labels(
    standardized_value_labels$mfructo,
    `-2` = "no data, see CMLAB(-2) in LASAC850"
  ),
    mhdl2 = .replace_labels(
    standardized_value_labels$mhdl2,
    `-2` = "no data, see CMLAB(-2) in LASAC850"
  ),
    mldl2 = .replace_labels(
    standardized_value_labels$mldl2,
    `-2` = "no data, see CMLAB(-2) in LASAC850"
  ),
    mtrigl2 = .replace_labels(
    standardized_value_labels$mtrigl2,
    `-2` = "no data, see CMLAB(-2) in LASAC850"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mchol2 = "numeric",
  mfructo = "numeric",
  mhdl2 = "numeric",
  mldl2 = "numeric",
  mtrigl2 = "numeric"
)

.lasa_fc_867 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "867", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "867", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "867", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "867", waves = .lasa_wave_rows())
)
