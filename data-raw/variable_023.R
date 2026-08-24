## LASA filecode 023 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  evmem01 = "Everyday memory 01: choice pencil",
  evmem02 = "Everyday memory 02: recognition photo",
  evmem03 = "Everyday memory 03: object",
  evmem04 = "Q about diabetes asked?",
  evmem05 = "Q about raising arm asked?",
  evmem06 = "Q about occupation father asked?",
  evmem07 = "Q about emotions asked?",
  evmem08 = "Respondent left/right handed",
  ndays = "Day of interviewing"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    ndays = "day of interviewing"
  ),
  Wave_F_labels = harmonized_labels[c("evmem08")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  evmem01 = c(
    `-5` = "not available, various reasons",
    `-1` = "not available, asked",
    `0` = "wrong",
    `1` = "right corrected",
    `2` = "right"
  ),
  evmem02 = c(
    `-5` = "not available, various reasons",
    `-1` = "not available, asked",
    `0` = "wrong",
    `1` = "right (partial)",
    `2` = "right"
  ),
  evmem03 = c(
    `-5` = "not available, various reasons",
    `-1` = "not available, asked",
    `0` = "wrong",
    `1` = "partially right",
    `2` = "right"
  ),
  evmem04 = c(
    `-5` = "not available, various reasons",
    `-1` = "not available, asked",
    `1` = "not asked",
    `2` = "asked",
    `3` = "cannot remember"
  ),
  evmem05 = c(
    `-5` = "not available, various reasons",
    `-1` = "not available, asked",
    `1` = "not asked",
    `2` = "asked",
    `3` = "cannot remember"
  ),
  evmem06 = c(
    `-5` = "not available, various reasons",
    `-1` = "not available, asked",
    `1` = "not asked",
    `2` = "asked",
    `3` = "cannot remember"
  ),
  evmem07 = c(
    `-5` = "not available, various reasons",
    `-1` = "not available, asked",
    `1` = "not asked",
    `2` = "asked",
    `3` = "cannot remember"
  ),
  evmem08 = c(
    `-5` = "not available, various reasons",
    `-3` = "not available, interview terminated",
    `-1` = "not available",
    `1` = "left handed",
    `2` = "right handed",
    `3` = "other handedness/writing category"
  ),
  ndays = c(
    `-5` = "not available, various reasons",
    `0` = "one day",
    `1` = "two days",
    `2` = "three days"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    evmem01 = .replace_labels(
    standardized_value_labels$evmem01,
    `-5` = "na, various reasons",
    `-1` = "na, asked"
  ),
    evmem02 = .replace_labels(
    standardized_value_labels$evmem02,
    `-5` = "na, various reasons",
    `-1` = "na, asked"
  ),
    evmem03 = .replace_labels(
    standardized_value_labels$evmem03,
    `-5` = "na, various reasons",
    `-1` = "na, asked"
  ),
    evmem04 = .replace_labels(
    standardized_value_labels$evmem04,
    `-5` = "na, various reasons",
    `-1` = "na, asked"
  ),
    evmem05 = .replace_labels(
    standardized_value_labels$evmem05,
    `-5` = "na, various reasons",
    `-1` = "na, asked"
  ),
    evmem06 = .replace_labels(
    standardized_value_labels$evmem06,
    `-5` = "na, various reasons",
    `-1` = "na, asked"
  ),
    evmem07 = .replace_labels(
    standardized_value_labels$evmem07,
    `-5` = "na, various reasons",
    `-1` = "na, asked"
  ),
    evmem08 = c(
    `-5` = "na, various reasons",
    `-1` = "na, asked",
    `1` = "left handed",
    `2` = "right handed",
    `3` = "left handed but right hand"
  ),
    ndays = .replace_labels(
    standardized_value_labels$ndays,
    `-5` = "na, various reasons"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("evmem08")],
    evmem08 = c(
    `-3` = "na, interview terminated",
    `-1` = "no observation",
    `1` = "R writes left handed",
    `2` = "R writes right handed",
    `3` = "R cannot write / other remark"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  evmem01 = "categorical",
  evmem02 = "categorical",
  evmem03 = "categorical",
  evmem04 = "categorical",
  evmem05 = "categorical",
  evmem06 = "categorical",
  evmem07 = "categorical",
  evmem08 = "categorical",
  ndays = "categorical"
)

.lasa_fc_023 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "023", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "ndays", override_value = "ndays"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "023", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "023", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "023", waves = .lasa_wave_rows())
)
