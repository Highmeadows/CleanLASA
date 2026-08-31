## LASA filecode 179 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mad01 = "AD 01: easily distracted",
  mad02 = "AD 02: impulsive decisions",
  mad03 = "AD 03: difficult to stop activities",
  mad04 = "AD 04: starting without instructions",
  mad05 = "AD 05: does not keep promises",
  mad06 = "AD 06: difficult to do things in order",
  mad07 = "AD 07: speeding to much / difficult to relax",
  mad08 = "AD 08: difficult to focus attention",
  mad09 = "AD 09: difficult to organise activities",
  mad10 = "AD 10: symptoms starting before 16"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `G` = c(
    "mad01",
    "mad02",
    "mad03",
    "mad04",
    "mad05",
    "mad06",
    "mad07",
    "mad08",
    "mad09",
    "mad10"
  )
)

variable_labels_list <- list(
  Wave_G_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "yes"
)

standardized_value_labels <- list(
  mad01 = c(
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mad02 = c(
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mad03 = c(
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mad04 = c(
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mad05 = c(
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mad06 = c(
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mad07 = c(
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mad08 = c(
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mad09 = c(
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mad10 = c(
    `-2` = "no symptoms mentioned",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  )
)

value_labels_list <- list(
  Wave_G_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mad01 = "categorical",
  mad02 = "categorical",
  mad03 = "categorical",
  mad04 = "categorical",
  mad05 = "categorical",
  mad06 = "categorical",
  mad07 = "categorical",
  mad08 = "categorical",
  mad09 = "categorical",
  mad10 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "179", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "179", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "179", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "179", waves = .lasa_wave_rows())
)

.lasa_fc_179 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

