## LASA filecode 112 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  maid1 = "Assistance 1: professional",
  maid2 = "Assistance 2: children",
  maid4 = "Assistance 4: independent",
  maid6 = "Assistance 6: personal",
  maid7 = "Assistance 7: official services",
  maid9 = "Assistance 9: too often appeal",
  qaid1 = "Assistance 1: professional",
  qaid2 = "Assistance 2: children",
  qaid3 = "Assistance 3: do not pay",
  qaid4 = "Assistance 4: independent",
  qaid5 = "Assistance 5: burden",
  qaid6 = "Assistance 6: personal",
  qaid7 = "Assistance 7: official services",
  qaid8 = "Assistance 8: long waiting",
  qaid9 = "Assistance 9: too often appeal"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "qaid1",
    "qaid2",
    "qaid3",
    "qaid4",
    "qaid5",
    "qaid6",
    "qaid7",
    "qaid8"
  ),
  `2B` = c(
    "qaid1",
    "qaid2",
    "qaid3",
    "qaid4",
    "qaid5",
    "qaid6",
    "qaid7",
    "qaid8"
  ),
  `F` = c(
    "qaid1",
    "qaid2",
    "qaid3",
    "qaid4",
    "qaid5",
    "qaid6",
    "qaid7",
    "qaid8"
  ),
  `G` = c(
    "qaid1",
    "qaid2",
    "qaid4",
    "qaid6",
    "qaid7",
    "qaid9"
  ),
  `H` = c(
    "qaid1",
    "qaid2",
    "qaid4",
    "qaid6",
    "qaid7",
    "qaid9"
  ),
  `3B` = c(
    "qaid1",
    "qaid2",
    "qaid4",
    "qaid6",
    "qaid7",
    "qaid9"
  ),
  `MB` = c(
    "maid1",
    "maid2",
    "maid4",
    "maid6",
    "maid7",
    "maid9"
  ),
  `I` = c(
    "qaid1",
    "qaid2",
    "qaid4",
    "qaid6",
    "qaid7",
    "qaid9"
  ),
  `J` = c(
    "qaid1",
    "qaid2",
    "qaid4",
    "qaid6",
    "qaid7",
    "qaid9"
  ),
  `K` = c(
    "qaid1",
    "qaid2",
    "qaid4",
    "qaid6",
    "qaid7",
    "qaid9"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Wave_MB_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "neither agree nor disagree",
  `4` = "agree",
  `5` = "strongly agree"
)

standardized_value_labels <- list(
  maid1 = c(
    `-2` = "not available, interview terminated",
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maid2 = c(
    `-2` = "not available, interview terminated",
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maid4 = c(
    `-2` = "not available, interview terminated",
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maid6 = c(
    `-2` = "not available, interview terminated",
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maid7 = c(
    `-2` = "not available, interview terminated",
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maid9 = c(
    `-2` = "not available, interview terminated",
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qaid1 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qaid2 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qaid3 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qaid4 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qaid5 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qaid6 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qaid7 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qaid8 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qaid9 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4", "5")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qaid1 = .replace_labels(
    standardized_value_labels$qaid1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid2 = .replace_labels(
    standardized_value_labels$qaid2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid3 = .replace_labels(
    standardized_value_labels$qaid3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid4 = .replace_labels(
    standardized_value_labels$qaid4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid5 = .replace_labels(
    standardized_value_labels$qaid5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid6 = .replace_labels(
    standardized_value_labels$qaid6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid7 = .replace_labels(
    standardized_value_labels$qaid7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid8 = .replace_labels(
    standardized_value_labels$qaid8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qaid1 = .replace_labels(
    standardized_value_labels$qaid1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid2 = .replace_labels(
    standardized_value_labels$qaid2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid3 = .replace_labels(
    standardized_value_labels$qaid3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid4 = .replace_labels(
    standardized_value_labels$qaid4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid5 = .replace_labels(
    standardized_value_labels$qaid5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid6 = .replace_labels(
    standardized_value_labels$qaid6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid7 = .replace_labels(
    standardized_value_labels$qaid7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid8 = .replace_labels(
    standardized_value_labels$qaid8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qaid1 = .replace_labels(
    standardized_value_labels$qaid1,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid2 = .replace_labels(
    standardized_value_labels$qaid2,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid3 = .replace_labels(
    standardized_value_labels$qaid3,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid4 = .replace_labels(
    standardized_value_labels$qaid4,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid5 = .replace_labels(
    standardized_value_labels$qaid5,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid6 = .replace_labels(
    standardized_value_labels$qaid6,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid7 = .replace_labels(
    standardized_value_labels$qaid7,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  ),
    qaid8 = .replace_labels(
    standardized_value_labels$qaid8,
    `-1` = "no answer",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    qaid1 = .replace_labels(
    standardized_value_labels$qaid1,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid2 = .replace_labels(
    standardized_value_labels$qaid2,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid4 = .replace_labels(
    standardized_value_labels$qaid4,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid6 = .replace_labels(
    standardized_value_labels$qaid6,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid7 = .replace_labels(
    standardized_value_labels$qaid7,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid9 = .replace_labels(
    standardized_value_labels$qaid9,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    qaid1 = .replace_labels(
    standardized_value_labels$qaid1,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid2 = .replace_labels(
    standardized_value_labels$qaid2,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid4 = .replace_labels(
    standardized_value_labels$qaid4,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid6 = .replace_labels(
    standardized_value_labels$qaid6,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid7 = .replace_labels(
    standardized_value_labels$qaid7,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid9 = .replace_labels(
    standardized_value_labels$qaid9,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qaid1 = .replace_labels(
    standardized_value_labels$qaid1,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid2 = .replace_labels(
    standardized_value_labels$qaid2,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid4 = .replace_labels(
    standardized_value_labels$qaid4,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid6 = .replace_labels(
    standardized_value_labels$qaid6,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid7 = .replace_labels(
    standardized_value_labels$qaid7,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid9 = .replace_labels(
    standardized_value_labels$qaid9,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    maid1 = .replace_labels(
    standardized_value_labels$maid1,
    `-2` = "na, interview broken off",
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    maid2 = .replace_labels(
    standardized_value_labels$maid2,
    `-2` = "na, interview broken off",
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    maid4 = .replace_labels(
    standardized_value_labels$maid4,
    `-2` = "na, interview broken off",
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    maid6 = .replace_labels(
    standardized_value_labels$maid6,
    `-2` = "na, interview broken off",
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    maid7 = .replace_labels(
    standardized_value_labels$maid7,
    `-2` = "na, interview broken off",
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    maid9 = .replace_labels(
    standardized_value_labels$maid9,
    `-2` = "na, interview broken off",
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qaid1 = .replace_labels(
    standardized_value_labels$qaid1,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid2 = .replace_labels(
    standardized_value_labels$qaid2,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid4 = .replace_labels(
    standardized_value_labels$qaid4,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid6 = .replace_labels(
    standardized_value_labels$qaid6,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid7 = .replace_labels(
    standardized_value_labels$qaid7,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid9 = .replace_labels(
    standardized_value_labels$qaid9,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qaid1 = .replace_labels(
    standardized_value_labels$qaid1,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid2 = .replace_labels(
    standardized_value_labels$qaid2,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid4 = .replace_labels(
    standardized_value_labels$qaid4,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid6 = .replace_labels(
    standardized_value_labels$qaid6,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid7 = .replace_labels(
    standardized_value_labels$qaid7,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid9 = .replace_labels(
    standardized_value_labels$qaid9,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    qaid1 = .replace_labels(
    standardized_value_labels$qaid1,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid2 = .replace_labels(
    standardized_value_labels$qaid2,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid4 = .replace_labels(
    standardized_value_labels$qaid4,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid6 = .replace_labels(
    standardized_value_labels$qaid6,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid7 = .replace_labels(
    standardized_value_labels$qaid7,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  ),
    qaid9 = .replace_labels(
    standardized_value_labels$qaid9,
    `-1` = "na, asked",
    `3` = "no agreement/disagreement"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  maid1 = "categorical",
  maid2 = "categorical",
  maid4 = "categorical",
  maid6 = "categorical",
  maid7 = "categorical",
  maid9 = "categorical",
  qaid1 = "categorical",
  qaid2 = "categorical",
  qaid3 = "categorical",
  qaid4 = "categorical",
  qaid5 = "categorical",
  qaid6 = "categorical",
  qaid7 = "categorical",
  qaid8 = "categorical",
  qaid9 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "112", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "112", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "112", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "112", waves = .lasa_wave_rows())
)

.lasa_fc_112 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

