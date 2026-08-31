## LASA filecode 177 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mwvg01 = "WVG 01: Walking frame",
  mwvg02 = "WVG 02: Wheelchair",
  mwvg03 = "WVG 03: Mobility scooter, adjusted bicycle",
  mwvg04 = "WVG 04: Taxi pass",
  mwvg05 = "WVG 05: Car adjustment",
  mwvg06 = "WVG 06: Transport compensation",
  mwvg07 = "WVG 07: Disabled parking permit",
  mwvg08 = "WVG 08: Personal alarm",
  mwvg09 = "WVG 09: Meals on wheels",
  mwvg10 = "WVG 10: Handyman",
  mwvg11 = "WVG 11: Grocery shopping service"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `G` = c(
    "mwvg01",
    "mwvg02",
    "mwvg03",
    "mwvg04",
    "mwvg05",
    "mwvg06",
    "mwvg07",
    "mwvg08",
    "mwvg09",
    "mwvg10",
    "mwvg11"
  ),
  `H` = c(
    "mwvg01",
    "mwvg02",
    "mwvg03",
    "mwvg04",
    "mwvg05",
    "mwvg06",
    "mwvg07",
    "mwvg08",
    "mwvg09",
    "mwvg10",
    "mwvg11"
  ),
  `I` = c(
    "mwvg01",
    "mwvg02",
    "mwvg03",
    "mwvg05",
    "mwvg06",
    "mwvg07",
    "mwvg11"
  ),
  `J` = c(
    "mwvg01",
    "mwvg02",
    "mwvg03",
    "mwvg05",
    "mwvg06",
    "mwvg07"
  ),
  `K` = c(
    "mwvg02",
    "mwvg03",
    "mwvg05",
    "mwvg06",
    "mwvg07"
  )
)

variable_labels_list <- list(
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "no",
  `2` = "yes",
  `3` = "no"
)

standardized_value_labels <- list(
  mwvg01 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg02 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg03 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg04 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg05 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg06 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg07 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg08 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg09 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg10 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mwvg11 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  )
)

value_labels_list <- list(
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    mwvg01 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg02 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg03 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg04 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg05 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg06 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg07 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg08 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg09 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg10 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwvg11 = c(`-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    mwvg01 = .replace_labels(
    standardized_value_labels$mwvg01,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg02 = .replace_labels(
    standardized_value_labels$mwvg02,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg03 = .replace_labels(
    standardized_value_labels$mwvg03,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg04 = .replace_labels(
    standardized_value_labels$mwvg04,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg05 = .replace_labels(
    standardized_value_labels$mwvg05,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg06 = .replace_labels(
    standardized_value_labels$mwvg06,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg07 = .replace_labels(
    standardized_value_labels$mwvg07,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg08 = .replace_labels(
    standardized_value_labels$mwvg08,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg09 = .replace_labels(
    standardized_value_labels$mwvg09,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg10 = .replace_labels(
    standardized_value_labels$mwvg10,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg11 = .replace_labels(
    standardized_value_labels$mwvg11,
    `1` = "own and use",
    `2` = "own, no use"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    mwvg01 = .replace_labels(
    standardized_value_labels$mwvg01,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg02 = .replace_labels(
    standardized_value_labels$mwvg02,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg03 = .replace_labels(
    standardized_value_labels$mwvg03,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg05 = .replace_labels(
    standardized_value_labels$mwvg05,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg06 = .replace_labels(
    standardized_value_labels$mwvg06,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg07 = .replace_labels(
    standardized_value_labels$mwvg07,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg11 = .replace_labels(
    standardized_value_labels$mwvg11,
    `1` = "own and use",
    `2` = "own, no use"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    mwvg01 = .replace_labels(
    standardized_value_labels$mwvg01,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg02 = .replace_labels(
    standardized_value_labels$mwvg02,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg03 = .replace_labels(
    standardized_value_labels$mwvg03,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg05 = .replace_labels(
    standardized_value_labels$mwvg05,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg06 = .replace_labels(
    standardized_value_labels$mwvg06,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg07 = .replace_labels(
    standardized_value_labels$mwvg07,
    `1` = "own and use",
    `2` = "own, no use"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    mwvg02 = .replace_labels(
    standardized_value_labels$mwvg02,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg03 = .replace_labels(
    standardized_value_labels$mwvg03,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg05 = .replace_labels(
    standardized_value_labels$mwvg05,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg06 = .replace_labels(
    standardized_value_labels$mwvg06,
    `1` = "own and use",
    `2` = "own, no use"
  ),
    mwvg07 = .replace_labels(
    standardized_value_labels$mwvg07,
    `1` = "own and use",
    `2` = "own, no use"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mwvg01 = "categorical",
  mwvg02 = "categorical",
  mwvg03 = "categorical",
  mwvg04 = "categorical",
  mwvg05 = "categorical",
  mwvg06 = "categorical",
  mwvg07 = "categorical",
  mwvg08 = "categorical",
  mwvg09 = "categorical",
  mwvg10 = "categorical",
  mwvg11 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "177", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "177", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "177", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "177", waves = .lasa_wave_rows())
)

.lasa_fc_177 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

