## LASA filecode 032 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  prefe01 = "When I need help, I want to organize it",
  prefe02 = "When move because health I want move to",
  prefe03 = "When I need help, I want to organize it",
  prefe04 = "When move because health I want move to",
  prefe05 = "When I need help, I want to organize it",
  prefe06 = "When move because health I want move to",
  prefe07 = "When could choose again I would live at",
  prefe08 = "When could choose again I would live at",
  prefe09 = "When could choose again I would live at",
  prefe10 = "When could choose again I would live at",
  prefe11 = "When could choose again I would live at",
  prefe12 = "When could choose again I would live at"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  prefe01 = c(
    `-6` = "not available, technical reason",
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "myself",
    `2` = "by the family doctor"
  ),
  prefe02 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "family",
    `2` = "residential home"
  ),
  prefe03 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "by family doctor",
    `2` = "by children"
  ),
  prefe04 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "residential home",
    `2` = "old peoples home (with service)"
  ),
  prefe05 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "myself",
    `2` = "by children"
  ),
  prefe06 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "family",
    `2` = "old peoples home (with service)"
  ),
  prefe07 = c(
    `-6` = "not available, technical reason",
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "home",
    `2` = "residential home"
  ),
  prefe08 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "home",
    `2` = "family"
  ),
  prefe09 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "nursing home",
    `2` = "home"
  ),
  prefe10 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "family",
    `2` = "nursing home"
  ),
  prefe11 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "residential home",
    `2` = "nursing home"
  ),
  prefe12 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "residential home",
    `2` = "family"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    prefe01 = .replace_labels(
    standardized_value_labels$prefe01,
    `-6` = "na, technical reason",
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, BHINDEP<>1",
    `-1` = "na, asked"
  ),
    prefe02 = .replace_labels(
    standardized_value_labels$prefe02,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE01",
    `-1` = "na, asked"
  ),
    prefe03 = .replace_labels(
    standardized_value_labels$prefe03,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE01",
    `-1` = "na, asked"
  ),
    prefe04 = .replace_labels(
    standardized_value_labels$prefe04,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE01",
    `-1` = "na, asked"
  ),
    prefe05 = .replace_labels(
    standardized_value_labels$prefe05,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE01",
    `-1` = "na, asked"
  ),
    prefe06 = .replace_labels(
    standardized_value_labels$prefe06,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE01",
    `-1` = "na, asked"
  ),
    prefe07 = .replace_labels(
    standardized_value_labels$prefe07,
    `-6` = "na, technical reason",
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, BHINDEP<>2,3,4",
    `-1` = "na, asked"
  ),
    prefe08 = .replace_labels(
    standardized_value_labels$prefe08,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE07",
    `-1` = "na, asked"
  ),
    prefe09 = .replace_labels(
    standardized_value_labels$prefe09,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE07",
    `-1` = "na, asked"
  ),
    prefe10 = .replace_labels(
    standardized_value_labels$prefe10,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE07",
    `-1` = "na, asked"
  ),
    prefe11 = .replace_labels(
    standardized_value_labels$prefe11,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE07",
    `-1` = "na, asked"
  ),
    prefe12 = .replace_labels(
    standardized_value_labels$prefe12,
    `-3` = "na, wrong skip",
    `-2` = "na, see BPREFE07",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  prefe01 = "categorical",
  prefe02 = "categorical",
  prefe03 = "categorical",
  prefe04 = "categorical",
  prefe05 = "categorical",
  prefe06 = "categorical",
  prefe07 = "categorical",
  prefe08 = "categorical",
  prefe09 = "categorical",
  prefe10 = "categorical",
  prefe11 = "categorical",
  prefe12 = "categorical"
)

.lasa_fc_032 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "032", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "032", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "032", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "032", waves = .lasa_wave_rows())
)
