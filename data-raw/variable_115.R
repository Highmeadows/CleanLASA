## LASA filecode 115 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mpain1 = "Pain 1: standing",
  mpain2 = "Pain 2: change position",
  mpain3 = "Pain 3: sitting",
  mpain4 = "Pain 4: walking",
  mpain5 = "Pain 5: unbearable",
  mpain6 = "Pain 6: constant",
  qpain1 = "Pain 1: standing",
  qpain2 = "Pain 2: change position",
  qpain3 = "Pain 3: sitting",
  qpain4 = "Pain 4: walking",
  qpain5 = "Pain 5: unbearable",
  qpain6 = "Pain 6: constant"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `C` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `D` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `E` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `2B` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `F` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `G` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `H` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `3B` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `MB` = c(
    "mpain1",
    "mpain2",
    "mpain3",
    "mpain4",
    "mpain5",
    "mpain6"
  ),
  `I` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `J` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  ),
  `K` = c(
    "qpain1",
    "qpain2",
    "qpain3",
    "qpain4",
    "qpain5",
    "qpain6"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
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
  `1` = "yes",
  `2` = "no"
)

standardized_value_labels <- list(
  mpain1 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  mpain2 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  mpain3 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  mpain4 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  mpain5 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  mpain6 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  qpain1 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  qpain2 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  qpain3 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  qpain4 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  qpain5 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  ),
  qpain6 = c(
    `-1` = "not available",
    default_answer_labels[c("1", "2")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    mpain1 = .replace_labels(
    standardized_value_labels$mpain1,
    `-1` = "no answer"
  ),
    mpain2 = .replace_labels(
    standardized_value_labels$mpain2,
    `-1` = "no answer"
  ),
    mpain3 = .replace_labels(
    standardized_value_labels$mpain3,
    `-1` = "no answer"
  ),
    mpain4 = .replace_labels(
    standardized_value_labels$mpain4,
    `-1` = "no answer"
  ),
    mpain5 = .replace_labels(
    standardized_value_labels$mpain5,
    `-1` = "no answer"
  ),
    mpain6 = .replace_labels(
    standardized_value_labels$mpain6,
    `-1` = "no answer"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    qpain1 = .replace_labels(
    standardized_value_labels$qpain1,
    `-1` = "no answer"
  ),
    qpain2 = .replace_labels(
    standardized_value_labels$qpain2,
    `-1` = "no answer"
  ),
    qpain3 = .replace_labels(
    standardized_value_labels$qpain3,
    `-1` = "no answer"
  ),
    qpain4 = .replace_labels(
    standardized_value_labels$qpain4,
    `-1` = "no answer"
  ),
    qpain5 = .replace_labels(
    standardized_value_labels$qpain5,
    `-1` = "no answer"
  ),
    qpain6 = .replace_labels(
    standardized_value_labels$qpain6,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mpain1 = "categorical",
  mpain2 = "categorical",
  mpain3 = "categorical",
  mpain4 = "categorical",
  mpain5 = "categorical",
  mpain6 = "categorical",
  qpain1 = "categorical",
  qpain2 = "categorical",
  qpain3 = "categorical",
  qpain4 = "categorical",
  qpain5 = "categorical",
  qpain6 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "115", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "115", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "115", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "115", waves = .lasa_wave_rows())
)

.lasa_fc_115 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

