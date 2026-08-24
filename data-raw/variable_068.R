## LASA filecode 068 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcarc1 = "Medical care: contact with pharmacy",
  mcarc2 = "Medical care: contact with physician or specialist",
  mcarc3 = "Medical care: contact with hospital or health centre",
  mcarc4 = "Medical care: contact with dentist",
  mcarc5 = "Medical care: contact with alternative or traditional healer",
  mcarc6 = "Medical care: contact with other",
  mcarr01 = "Medical care reason: new complaint / sickness during stay",
  mcarr02 = "Medical care reason: dissatisfaction about care in the Netherlands",
  mcarr03 = "Medical care reason: severity of the complaint during stay",
  mcarr04 = "Medical care reason: no language barriers with physician or specialist",
  mcarr05 = "Medical care reason: periodic consultation / health check",
  mcarr06 = "Medical care reason: to buy medicines not prescribed in the Netherlands",
  mcarr07 = "Medical care reason: to buy medicines not available in the Netherlands",
  mcarr08 = "Medical care reason: cheaper in country of origin",
  mcarr09 = "Medical care reason: because of the waiting lists in the Netherlands",
  mcarr10 = "Medical care reason: other"
)

variable_labels_list <- list(
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcarc1 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarc2 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarc3 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarc4 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarc5 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarc6 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr01 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr02 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr03 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr04 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr05 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr06 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr07 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr08 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr09 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  mcarr10 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned")
)

value_labels_list <- list(
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    mcarc1 = .replace_labels(
    standardized_value_labels$mcarc1,
    `-2` = "na, see BMCARCO"
  ),
    mcarc2 = .replace_labels(
    standardized_value_labels$mcarc2,
    `-2` = "na, see BMCARCO"
  ),
    mcarc3 = .replace_labels(
    standardized_value_labels$mcarc3,
    `-2` = "na, see BMCARCO"
  ),
    mcarc4 = .replace_labels(
    standardized_value_labels$mcarc4,
    `-2` = "na, see BMCARCO"
  ),
    mcarc5 = .replace_labels(
    standardized_value_labels$mcarc5,
    `-2` = "na, see BMCARCO"
  ),
    mcarc6 = .replace_labels(
    standardized_value_labels$mcarc6,
    `-2` = "na, see BMCARCO"
  ),
    mcarr01 = .replace_labels(
    standardized_value_labels$mcarr01,
    `-2` = "na, see BMCARCO"
  ),
    mcarr02 = .replace_labels(
    standardized_value_labels$mcarr02,
    `-2` = "na, see BMCARCO"
  ),
    mcarr03 = .replace_labels(
    standardized_value_labels$mcarr03,
    `-2` = "na, see BMCARCO"
  ),
    mcarr04 = .replace_labels(
    standardized_value_labels$mcarr04,
    `-2` = "na, see BMCARCO"
  ),
    mcarr05 = .replace_labels(
    standardized_value_labels$mcarr05,
    `-2` = "na, see BMCARCO"
  ),
    mcarr06 = .replace_labels(
    standardized_value_labels$mcarr06,
    `-2` = "na, see BMCARCO"
  ),
    mcarr07 = .replace_labels(
    standardized_value_labels$mcarr07,
    `-2` = "na, see BMCARCO"
  ),
    mcarr08 = .replace_labels(
    standardized_value_labels$mcarr08,
    `-2` = "na, see BMCARCO"
  ),
    mcarr09 = .replace_labels(
    standardized_value_labels$mcarr09,
    `-2` = "na, see BMCARCO"
  ),
    mcarr10 = .replace_labels(
    standardized_value_labels$mcarr10,
    `-2` = "na, see BMCARCO"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mcarc1 = "categorical",
  mcarc2 = "categorical",
  mcarc3 = "categorical",
  mcarc4 = "categorical",
  mcarc5 = "categorical",
  mcarc6 = "categorical",
  mcarr01 = "categorical",
  mcarr02 = "categorical",
  mcarr03 = "categorical",
  mcarr04 = "categorical",
  mcarr05 = "categorical",
  mcarr06 = "categorical",
  mcarr07 = "categorical",
  mcarr08 = "categorical",
  mcarr09 = "categorical",
  mcarr10 = "categorical"
)

.lasa_fc_068 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "068", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "068", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "068", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "068", waves = .lasa_wave_rows())
)
