## LASA filecode 128 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qdona1 = "registered as a blood or plasma donor",
  qdona1_2 = "New donor law: returned form about organ donation",
  qdona1_3 = "Previous decision about organ donation",
  qdona1_4 = "Choice changed since the new donor law",
  qdona1_5 = "Current decision about organ donation",
  qdona2 = "ever registered as a blood or plasma donor",
  qdona3 = "former blood or plasma donor: until which year registered",
  qdona4 = "former blood or plasma donor: reason stopped",
  qdona5 = "former blood or plasma donor: from which year first registration",
  qdona6 = "current blood or plasma donor: how often donation past 12 months",
  qdona7 = "received form from ministry about organ donation",
  qdona8 = "decision about organ donation"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `I` = c(
    "qdona1",
    "qdona2",
    "qdona3",
    "qdona4",
    "qdona5",
    "qdona6",
    "qdona7",
    "qdona8"
  ),
  `J` = c(
    "qdona1",
    "qdona1_2",
    "qdona1_3",
    "qdona1_4",
    "qdona1_5"
  )
)

variable_labels_list <- list(
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qdona1 = c(`-1` = "not available", `1` = "yes, blood", `2` = "yes, plasma", `3` = "no"),
  qdona1_2 = c(`-1` = "not available", `1` = "yes", `2` = "no", `3` = "do not know"),
  qdona1_3 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "I do not make my organs available",
    `2` = "I make all my organs available",
    `3` = "I make some organs available",
    `4` = "I leave the choice to my next of kin",
    `5` = "I do not know / do not want to say it"
  ),
  qdona1_4 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "yes",
    `2` = "no"
  ),
  qdona1_5 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "I do not make my organs available",
    `2` = "I make all my organs available",
    `3` = "I make some organs available",
    `4` = "I leave the choice to my next of kin",
    `5` = "I do not know / do not want to say it"
  ),
  qdona2 = c(
    default_missing_labels[c("-2")],
    `1` = "yes, blood",
    `2` = "yes, plasma",
    `3` = "no"
  ),
  qdona3 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available"
  ),
  qdona4 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "disapproved based on age",
    `2` = "disapproved for health reasons",
    `3` = "no time anymore",
    `4` = "not interested anymore",
    `5` = "other reason"
  ),
  qdona5 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available"
  ),
  qdona6 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "more than once a month",
    `2` = "once a month",
    `3` = "2-3 times",
    `4` = "once",
    `5` = "not at all",
    `6` = "R does not know"
  ),
  qdona7 = c(`-1` = "not available", `1` = "yes", `2` = "no", `3` = "R does not know anymore"),
  qdona8 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "I do not make my organs available",
    `2` = "I make all my organs available",
    `3` = "I make some organs available",
    `4` = "I leave the choice to my next of kin",
    `5` = "I do not know / do not want to say it"
  )
)

value_labels_list <- list(
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qdona1 = .replace_labels(
    standardized_value_labels$qdona1,
    `-1` = "na, asked"
  ),
    qdona2 = .replace_labels(
    standardized_value_labels$qdona2,
    `-2` = "na, see IQDONA1"
  ),
    qdona3 = .replace_labels(
    standardized_value_labels$qdona3,
    `-2` = "na, see IQDONA2",
    `-1` = "na, asked"
  ),
    qdona4 = .replace_labels(
    standardized_value_labels$qdona4,
    `-2` = "na, see IQDONA2",
    `-1` = "na, asked"
  ),
    qdona5 = .replace_labels(
    standardized_value_labels$qdona5,
    `-2` = "na, see IQDONA2",
    `-1` = "na, asked"
  ),
    qdona6 = .replace_labels(
    standardized_value_labels$qdona6,
    `-2` = "na, see IQDONA1",
    `-1` = "na, asked"
  ),
    qdona7 = .replace_labels(
    standardized_value_labels$qdona7,
    `-1` = "na, asked"
  ),
    qdona8 = .replace_labels(
    standardized_value_labels$qdona8,
    `-2` = "na, see IQDONA7",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qdona1 = .replace_labels(
    standardized_value_labels$qdona1,
    `-1` = "na, asked"
  ),
    qdona1_2 = .replace_labels(
    standardized_value_labels$qdona1_2,
    `-1` = "na, asked"
  ),
    qdona1_3 = .replace_labels(
    standardized_value_labels$qdona1_3,
    `-2` = "na, see JQDONA1_2",
    `-1` = "na, asked"
  ),
    qdona1_4 = .replace_labels(
    standardized_value_labels$qdona1_4,
    `-2` = "na, see JQDONA1_2",
    `-1` = "na, asked"
  ),
    qdona1_5 = .replace_labels(
    standardized_value_labels$qdona1_5,
    `-2` = "na, see JQDONA1_4",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qdona1 = "categorical",
  qdona1_2 = "categorical",
  qdona1_3 = "categorical",
  qdona1_4 = "categorical",
  qdona1_5 = "categorical",
  qdona2 = "categorical",
  qdona3 = "numeric",
  qdona4 = "categorical",
  qdona5 = "numeric",
  qdona6 = "categorical",
  qdona7 = "categorical",
  qdona8 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "128", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "128", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "128", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "128", waves = .lasa_wave_rows())
)

.lasa_fc_128 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

