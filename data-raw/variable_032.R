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

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "prefe01",
    "prefe02",
    "prefe03",
    "prefe04",
    "prefe05",
    "prefe06",
    "prefe07",
    "prefe08",
    "prefe09",
    "prefe10",
    "prefe11",
    "prefe12"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  prefe01 = c(
    `-6` = "not available, technical reason",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "myself",
    `2` = "by the family doctor"
  ),
  prefe02 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "family",
    `2` = "residential home"
  ),
  prefe03 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "by family doctor",
    `2` = "by children"
  ),
  prefe04 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "residential home",
    `2` = "old peoples home (with service)"
  ),
  prefe05 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "myself",
    `2` = "by children"
  ),
  prefe06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "family",
    `2` = "old peoples home (with service)"
  ),
  prefe07 = c(
    `-6` = "not available, technical reason",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "home",
    `2` = "residential home"
  ),
  prefe08 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "home",
    `2` = "family"
  ),
  prefe09 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "nursing home",
    `2` = "home"
  ),
  prefe10 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "family",
    `2` = "nursing home"
  ),
  prefe11 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "residential home",
    `2` = "nursing home"
  ),
  prefe12 = c(
    default_missing_labels[c("-3", "-2", "-1")],
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
    `-2` = "na, BHINDEP<>1"
  ),
    prefe02 = .replace_labels(
    standardized_value_labels$prefe02,
    `-2` = "na, see BPREFE01"
  ),
    prefe03 = .replace_labels(
    standardized_value_labels$prefe03,
    `-2` = "na, see BPREFE01"
  ),
    prefe04 = .replace_labels(
    standardized_value_labels$prefe04,
    `-2` = "na, see BPREFE01"
  ),
    prefe05 = .replace_labels(
    standardized_value_labels$prefe05,
    `-2` = "na, see BPREFE01"
  ),
    prefe06 = .replace_labels(
    standardized_value_labels$prefe06,
    `-2` = "na, see BPREFE01"
  ),
    prefe07 = .replace_labels(
    standardized_value_labels$prefe07,
    `-6` = "na, technical reason",
    `-5` = "na, interview terminated",
    `-2` = "na, BHINDEP<>2,3,4"
  ),
    prefe08 = .replace_labels(
    standardized_value_labels$prefe08,
    `-2` = "na, see BPREFE07"
  ),
    prefe09 = .replace_labels(
    standardized_value_labels$prefe09,
    `-2` = "na, see BPREFE07"
  ),
    prefe10 = .replace_labels(
    standardized_value_labels$prefe10,
    `-2` = "na, see BPREFE07"
  ),
    prefe11 = .replace_labels(
    standardized_value_labels$prefe11,
    `-2` = "na, see BPREFE07"
  ),
    prefe12 = .replace_labels(
    standardized_value_labels$prefe12,
    `-2` = "na, see BPREFE07"
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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "032", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "032", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "032", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "032", waves = .lasa_wave_rows())
)

.lasa_fc_032 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

