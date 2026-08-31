## LASA filecode 611 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  tpwvg01 = "WVG 01: Walking frame",
  tpwvg02 = "WVG 02: Wheelchair",
  tpwvg03 = "WVG 03: Mobility scooter, adjusted bicycle",
  tpwvg04 = "WVG 04: Taxi pass",
  tpwvg05 = "WVG 05: Car adjustment",
  tpwvg06 = "WVG 06: Transport compensation",
  tpwvg07 = "WVG 07: Disabled parking permit",
  tpwvg08 = "WVG 08: Personal alarm",
  tpwvg09 = "WVG 09: Meals on wheels",
  tpwvg10 = "WVG 10: Handyman",
  tpwvg11 = "WVG 11: Grocery shopping service"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `G` = c(
    "tpwvg01",
    "tpwvg02",
    "tpwvg03",
    "tpwvg04",
    "tpwvg05",
    "tpwvg06",
    "tpwvg07",
    "tpwvg08",
    "tpwvg09",
    "tpwvg10",
    "tpwvg11"
  ),
  `H` = c(
    "tpwvg01",
    "tpwvg02",
    "tpwvg03",
    "tpwvg04",
    "tpwvg05",
    "tpwvg06",
    "tpwvg07",
    "tpwvg08",
    "tpwvg09",
    "tpwvg10",
    "tpwvg11"
  ),
  `I` = c(
    "tpwvg01",
    "tpwvg02",
    "tpwvg03",
    "tpwvg04",
    "tpwvg05",
    "tpwvg06",
    "tpwvg07",
    "tpwvg08",
    "tpwvg09",
    "tpwvg10",
    "tpwvg11"
  ),
  `J` = c(
    "tpwvg01",
    "tpwvg02",
    "tpwvg03",
    "tpwvg04",
    "tpwvg05",
    "tpwvg06",
    "tpwvg07",
    "tpwvg08",
    "tpwvg09",
    "tpwvg10",
    "tpwvg11"
  ),
  `K` = c(
    "tpwvg01",
    "tpwvg02",
    "tpwvg03",
    "tpwvg04",
    "tpwvg05",
    "tpwvg06",
    "tpwvg07",
    "tpwvg08",
    "tpwvg09",
    "tpwvg10",
    "tpwvg11"
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
  `2` = "yes"
)

standardized_value_labels <- list(
  tpwvg01 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg02 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg03 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg04 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg05 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg06 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg07 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg08 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg09 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg10 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  tpwvg11 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  )
)

value_labels_list <- list(
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  tpwvg01 = "categorical",
  tpwvg02 = "categorical",
  tpwvg03 = "categorical",
  tpwvg04 = "categorical",
  tpwvg05 = "categorical",
  tpwvg06 = "categorical",
  tpwvg07 = "categorical",
  tpwvg08 = "categorical",
  tpwvg09 = "categorical",
  tpwvg10 = "categorical",
  tpwvg11 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "611", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "611", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "611", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "611", waves = .lasa_wave_rows())
)

.lasa_fc_611 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

