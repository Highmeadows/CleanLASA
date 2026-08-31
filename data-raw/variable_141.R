## LASA filecode 141 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qan1 = "want to talk about feelings",
  qan10 = "when difficulties, like to lean on someone",
  qan4 = "when in trouble I need support",
  qan6 = "cope with sorrows on my own",
  qan8 = "go to others when something bothers me",
  qan9 = "my feelings are my own business"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `2B` = c(
    "qan1",
    "qan10",
    "qan4",
    "qan6",
    "qan8",
    "qan9"
  ),
  `G` = c(
    "qan1",
    "qan10",
    "qan4",
    "qan6",
    "qan8",
    "qan9"
  )
)

variable_labels_list <- list(
  Wave_2B_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qan1 = c(`-1` = "not available", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  qan10 = c(`-1` = "not available", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  qan4 = c(`-1` = "not available", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  qan6 = c(`-1` = "not available", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  qan8 = c(`-1` = "not available", `1` = "no", `2` = "more-or-less", `3` = "yes"),
  qan9 = c(`-1` = "not available", `1` = "no", `2` = "more-or-less", `3` = "yes")
)

value_labels_list <- list(
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qan1 = .replace_labels(
    standardized_value_labels$qan1,
    `-1` = "no answer"
  ),
    qan10 = .replace_labels(
    standardized_value_labels$qan10,
    `-1` = "no answer"
  ),
    qan4 = .replace_labels(
    standardized_value_labels$qan4,
    `-1` = "no answer"
  ),
    qan6 = .replace_labels(
    standardized_value_labels$qan6,
    `-1` = "no answer"
  ),
    qan8 = .replace_labels(
    standardized_value_labels$qan8,
    `-1` = "no answer"
  ),
    qan9 = .replace_labels(
    standardized_value_labels$qan9,
    `-1` = "no answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    qan1 = .replace_labels(
    standardized_value_labels$qan1,
    `-1` = "no answer"
  ),
    qan10 = .replace_labels(
    standardized_value_labels$qan10,
    `-1` = "no answer"
  ),
    qan4 = .replace_labels(
    standardized_value_labels$qan4,
    `-1` = "no answer"
  ),
    qan6 = .replace_labels(
    standardized_value_labels$qan6,
    `-1` = "no answer"
  ),
    qan8 = .replace_labels(
    standardized_value_labels$qan8,
    `-1` = "no answer"
  ),
    qan9 = .replace_labels(
    standardized_value_labels$qan9,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qan1 = "categorical",
  qan10 = "categorical",
  qan4 = "categorical",
  qan6 = "categorical",
  qan8 = "categorical",
  qan9 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "141", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "141", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "141", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "141", waves = .lasa_wave_rows())
)

.lasa_fc_141 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

