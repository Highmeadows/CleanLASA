## LASA filecode 131 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qsoid01 = "Soc Iden 01: involved",
  qsoid02 = "Soc Iden 02: emotional link",
  qsoid03 = "Soc Iden 03: proud",
  qsoid04 = "Soc Iden 04: pleasant",
  qsoid05 = "Soc Iden 05: identification",
  qsoid06 = "Soc Iden 06: loyalty",
  qsoid07 = "Soc Iden 07: honoured",
  qsoid08 = "Soc Iden 08: joined",
  qsoid09 = "Soc Iden 09: avarage",
  qsoid10 = "Soc Iden 10: myself"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `D` = c(
    "qsoid01",
    "qsoid02",
    "qsoid03",
    "qsoid04",
    "qsoid05",
    "qsoid06",
    "qsoid07",
    "qsoid08",
    "qsoid09",
    "qsoid10"
  ),
  `E` = c(
    "qsoid01",
    "qsoid02",
    "qsoid03",
    "qsoid04",
    "qsoid05",
    "qsoid06",
    "qsoid07",
    "qsoid08",
    "qsoid09",
    "qsoid10"
  )
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no agreement/disagreement",
  `4` = "agree",
  `5` = "strongly agree"
)

standardized_value_labels <- list(
  qsoid01 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qsoid02 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qsoid03 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qsoid04 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qsoid05 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qsoid06 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qsoid07 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qsoid08 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qsoid09 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qsoid10 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  )
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qsoid01 = .replace_labels(
    standardized_value_labels$qsoid01,
    `-1` = "no answer"
  ),
    qsoid02 = .replace_labels(
    standardized_value_labels$qsoid02,
    `-1` = "no answer"
  ),
    qsoid03 = .replace_labels(
    standardized_value_labels$qsoid03,
    `-1` = "no answer"
  ),
    qsoid04 = .replace_labels(
    standardized_value_labels$qsoid04,
    `-1` = "no answer"
  ),
    qsoid05 = .replace_labels(
    standardized_value_labels$qsoid05,
    `-1` = "no answer"
  ),
    qsoid06 = .replace_labels(
    standardized_value_labels$qsoid06,
    `-1` = "no answer"
  ),
    qsoid07 = .replace_labels(
    standardized_value_labels$qsoid07,
    `-1` = "no answer"
  ),
    qsoid08 = .replace_labels(
    standardized_value_labels$qsoid08,
    `-1` = "no answer"
  ),
    qsoid09 = .replace_labels(
    standardized_value_labels$qsoid09,
    `-1` = "no answer"
  ),
    qsoid10 = .replace_labels(
    standardized_value_labels$qsoid10,
    `-1` = "no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qsoid01 = .replace_labels(
    standardized_value_labels$qsoid01,
    `-1` = "no answer"
  ),
    qsoid02 = .replace_labels(
    standardized_value_labels$qsoid02,
    `-1` = "no answer"
  ),
    qsoid03 = .replace_labels(
    standardized_value_labels$qsoid03,
    `-1` = "no answer"
  ),
    qsoid04 = .replace_labels(
    standardized_value_labels$qsoid04,
    `-1` = "no answer"
  ),
    qsoid05 = .replace_labels(
    standardized_value_labels$qsoid05,
    `-1` = "no answer"
  ),
    qsoid06 = .replace_labels(
    standardized_value_labels$qsoid06,
    `-1` = "no answer"
  ),
    qsoid07 = .replace_labels(
    standardized_value_labels$qsoid07,
    `-1` = "no answer"
  ),
    qsoid08 = .replace_labels(
    standardized_value_labels$qsoid08,
    `-1` = "no answer"
  ),
    qsoid09 = .replace_labels(
    standardized_value_labels$qsoid09,
    `-1` = "no answer"
  ),
    qsoid10 = .replace_labels(
    standardized_value_labels$qsoid10,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qsoid01 = "categorical",
  qsoid02 = "categorical",
  qsoid03 = "categorical",
  qsoid04 = "categorical",
  qsoid05 = "categorical",
  qsoid06 = "categorical",
  qsoid07 = "categorical",
  qsoid08 = "categorical",
  qsoid09 = "categorical",
  qsoid10 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "131", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "131", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "131", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "131", waves = .lasa_wave_rows())
)

.lasa_fc_131 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

