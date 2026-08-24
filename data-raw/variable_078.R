## LASA filecode 078 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  an1 = "want to talk about feelings",
  an10 = "when difficulties, like to lean on someone",
  an4 = "when in trouble, I need support",
  an6 = "cope with sorrows on my own",
  an8 = "go to others when something bothers me",
  an9 = "my feelings are my own business"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  an1 = c(
    `-4` = "coding category -4",
    `-3` = "interview terminated",
    `-2` = "no valid data",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  an10 = c(
    `-4` = "coding category -4",
    `-3` = "interview terminated",
    `-2` = "no valid data",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  an4 = c(
    `-4` = "coding category -4",
    `-3` = "interview terminated",
    `-2` = "no valid data",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  an6 = c(
    `-4` = "coding category -4",
    `-3` = "interview terminated",
    `-2` = "no valid data",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  an8 = c(
    `-4` = "coding category -4",
    `-3` = "interview terminated",
    `-2` = "no valid data",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  an9 = c(
    `-4` = "coding category -4",
    `-3` = "interview terminated",
    `-2` = "no valid data",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    an1 = .replace_labels(
    standardized_value_labels$an1,
    `-4` = "short version Q",
    `-3` = "interview broken off",
    `2` = "more-or-less"
  ),
    an10 = .replace_labels(
    standardized_value_labels$an10,
    `-4` = "short version Q",
    `-3` = "interview broken off",
    `2` = "more-or-less"
  ),
    an4 = .replace_labels(
    standardized_value_labels$an4,
    `-4` = "short version Q",
    `-3` = "interview broken off",
    `2` = "more-or-less"
  ),
    an6 = .replace_labels(
    standardized_value_labels$an6,
    `-4` = "short version Q",
    `-3` = "interview broken off",
    `2` = "more-or-less"
  ),
    an8 = .replace_labels(
    standardized_value_labels$an8,
    `-4` = "short version Q",
    `-3` = "interview broken off",
    `2` = "more-or-less"
  ),
    an9 = .replace_labels(
    standardized_value_labels$an9,
    `-4` = "short version Q",
    `-3` = "interview broken off",
    `2` = "more-or-less"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    an1 = .replace_labels(
    standardized_value_labels$an1,
    `-4` = "refusal/skip by I",
    `-3` = "terminated interview",
    `2` = "more-or-less"
  ),
    an10 = .replace_labels(
    standardized_value_labels$an10,
    `-4` = "refusal/skip by I",
    `-3` = "terminated interview",
    `2` = "more-or-less"
  ),
    an4 = .replace_labels(
    standardized_value_labels$an4,
    `-4` = "refusal/skip by I",
    `-3` = "terminated interview",
    `2` = "more-or-less"
  ),
    an6 = .replace_labels(
    standardized_value_labels$an6,
    `-4` = "refusal/skip by I",
    `-3` = "terminated interview",
    `2` = "more-or-less"
  ),
    an8 = .replace_labels(
    standardized_value_labels$an8,
    `-4` = "refusal/skip by I",
    `-3` = "terminated interview",
    `2` = "more-or-less"
  ),
    an9 = .replace_labels(
    standardized_value_labels$an9,
    `-4` = "refusal/skip by I",
    `-3` = "terminated interview",
    `2` = "more-or-less"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  an1 = "categorical",
  an10 = "categorical",
  an4 = "categorical",
  an6 = "categorical",
  an8 = "categorical",
  an9 = "categorical"
)

.lasa_fc_078 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "078", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "078", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "078", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "078", waves = .lasa_wave_rows())
)
