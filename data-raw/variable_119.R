## LASA filecode 119 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qmeno01 = "menopause 01: age start period",
  qmeno02 = "menopause 02: number of children",
  qmeno03 = "menopause 03: age first child born",
  qmeno04 = "menopause 04: pregnant no children",
  qmeno05 = "menopause 05: age last period",
  qmeno06 = "menopause 06: menopause natural",
  qmeno07 = "menopause 07: used contraceptive pill",
  qmeno08 = "menopause 08: # years contraceptive pill",
  qmeno09 = "menopause 09: hot flushes",
  qmeno10 = "menopause 10: excessive transpiration",
  qmeno11 = "menopause 11: pain in muscles",
  qmeno12 = "menopause 12: dry vagina",
  qmeno13 = "menopause 13: pain during intercourse"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qmeno01 = c(`-3` = "no answer, skipped", `-2` = "male respondent", `-1` = "not available"),
  qmeno02 = c(`-3` = "no answer, skipped", `-2` = "male respondent", `-1` = "not available"),
  qmeno03 = c(`-3` = "no answer, skipped", `-2` = "male respondent", `-1` = "not available"),
  qmeno04 = c(
    `-3` = "no answer, skipped",
    `-2` = "male respondent",
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  qmeno05 = c(`-3` = "no answer, skipped", `-2` = "male respondent", `-1` = "not available"),
  qmeno06 = c(
    `-3` = "no answer, skipped",
    `-2` = "male respondent",
    `-1` = "not available",
    `1` = "normal",
    `2` = "operation",
    `3` = "no menopause yet"
  ),
  qmeno07 = c(
    `-3` = "no answer, skipped",
    `-2` = "male respondent",
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  qmeno08 = c(`-3` = "no answer, skipped", `-2` = "male respondent", `-1` = "not available"),
  qmeno09 = c(
    `-3` = "no answer, skipped",
    `-2` = "male respondent",
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  qmeno10 = c(
    `-3` = "no answer, skipped",
    `-2` = "male respondent",
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  qmeno11 = c(
    `-3` = "no answer, skipped",
    `-2` = "male respondent",
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  qmeno12 = c(
    `-3` = "no answer, skipped",
    `-2` = "male respondent",
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  qmeno13 = c(
    `-3` = "no answer, skipped",
    `-2` = "male respondent",
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qmeno01 = .replace_labels(
    standardized_value_labels$qmeno01,
    `-1` = "no answer"
  ),
    qmeno02 = .replace_labels(
    standardized_value_labels$qmeno02,
    `-1` = "no answer"
  ),
    qmeno03 = .replace_labels(
    standardized_value_labels$qmeno03,
    `-1` = "no answer"
  ),
    qmeno04 = .replace_labels(
    standardized_value_labels$qmeno04,
    `-1` = "no answer"
  ),
    qmeno05 = .replace_labels(
    standardized_value_labels$qmeno05,
    `-1` = "no answer"
  ),
    qmeno06 = .replace_labels(
    standardized_value_labels$qmeno06,
    `-1` = "no answer"
  ),
    qmeno07 = .replace_labels(
    standardized_value_labels$qmeno07,
    `-1` = "no answer"
  ),
    qmeno08 = .replace_labels(
    standardized_value_labels$qmeno08,
    `-1` = "no answer"
  ),
    qmeno09 = .replace_labels(
    standardized_value_labels$qmeno09,
    `-1` = "no answer"
  ),
    qmeno10 = .replace_labels(
    standardized_value_labels$qmeno10,
    `-1` = "no answer"
  ),
    qmeno11 = .replace_labels(
    standardized_value_labels$qmeno11,
    `-1` = "no answer"
  ),
    qmeno12 = .replace_labels(
    standardized_value_labels$qmeno12,
    `-1` = "no answer"
  ),
    qmeno13 = .replace_labels(
    standardized_value_labels$qmeno13,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qmeno01 = "numeric",
  qmeno02 = "numeric",
  qmeno03 = "numeric",
  qmeno04 = "categorical",
  qmeno05 = "numeric",
  qmeno06 = "categorical",
  qmeno07 = "categorical",
  qmeno08 = "numeric",
  qmeno09 = "categorical",
  qmeno10 = "categorical",
  qmeno11 = "categorical",
  qmeno12 = "categorical",
  qmeno13 = "categorical"
)

.lasa_fc_119 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "119", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "119", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "119", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "119", waves = .lasa_wave_rows())
)
