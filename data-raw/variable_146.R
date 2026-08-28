## LASA filecode 146 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qdecf01 = "if I die, I hope: not to be dependent upon others",
  qdecf02 = "if I die, I hope: to self decide about treatment",
  qdecf03 = "if I die, I hope: to receive help from family",
  qdecf04 = "if I die, I hope: to receive help from volunteers or caretakers",
  qdecf05 = "if I die, I hope: not to be alone",
  qdecf06 = "if I die, I hope: to self decide about moment of dying",
  qdecf07 = "if I die, I hope: to be at home",
  qdecf08 = "if I die, I hope: to be in a hospice",
  qdecf09 = "if I die, I hope: to be in a nursing home",
  qdecf10 = "if I die, I hope: to be in a hospital",
  qdecf11 = "if I die, I hope: something else"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `F` = c(
    "qdecf01",
    "qdecf02",
    "qdecf03",
    "qdecf04",
    "qdecf05",
    "qdecf06",
    "qdecf07",
    "qdecf08",
    "qdecf09",
    "qdecf10",
    "qdecf11"
  )
)

variable_labels_list <- list(
  Wave_F_labels = harmonized_labels,
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
  qdecf01 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf02 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf03 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf04 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf05 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf06 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf07 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf08 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf09 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf10 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qdecf11 = c(`-1` = "not available", `0` = "not mentioned", `1` = "mentioned")
)

value_labels_list <- list(
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qdecf01 = .replace_labels(
    standardized_value_labels$qdecf01,
    `-1` = "no answer"
  ),
    qdecf02 = .replace_labels(
    standardized_value_labels$qdecf02,
    `-1` = "no answer"
  ),
    qdecf03 = .replace_labels(
    standardized_value_labels$qdecf03,
    `-1` = "no answer"
  ),
    qdecf04 = .replace_labels(
    standardized_value_labels$qdecf04,
    `-1` = "no answer"
  ),
    qdecf05 = .replace_labels(
    standardized_value_labels$qdecf05,
    `-1` = "no answer"
  ),
    qdecf06 = .replace_labels(
    standardized_value_labels$qdecf06,
    `-1` = "no answer"
  ),
    qdecf07 = .replace_labels(
    standardized_value_labels$qdecf07,
    `-1` = "no answer"
  ),
    qdecf08 = .replace_labels(
    standardized_value_labels$qdecf08,
    `-1` = "no answer"
  ),
    qdecf09 = .replace_labels(
    standardized_value_labels$qdecf09,
    `-1` = "no answer"
  ),
    qdecf10 = .replace_labels(
    standardized_value_labels$qdecf10,
    `-1` = "no answer"
  ),
    qdecf11 = .replace_labels(
    standardized_value_labels$qdecf11,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qdecf01 = "categorical",
  qdecf02 = "categorical",
  qdecf03 = "categorical",
  qdecf04 = "categorical",
  qdecf05 = "categorical",
  qdecf06 = "categorical",
  qdecf07 = "categorical",
  qdecf08 = "categorical",
  qdecf09 = "categorical",
  qdecf10 = "categorical",
  qdecf11 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "146", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "146", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "146", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "146", waves = .lasa_wave_rows())
)

.lasa_fc_146 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

