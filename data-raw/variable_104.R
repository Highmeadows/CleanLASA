## LASA filecode 104 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qpss01 = "upset because something unexpected",
  qpss02 = "felt unable to control things",
  qpss03 = "felt nervous and stressed",
  qpss04 = "felt confident",
  qpss05 = "felt things going your way",
  qpss06 = "felt could not cope with things",
  qpss07 = "been able to control irritations",
  qpss08 = "felt on top of things",
  qpss09 = "angered because things outside control",
  qpss10 = "felt difficulties piling up"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `H` = c(
    "qpss01",
    "qpss02",
    "qpss03",
    "qpss04",
    "qpss05",
    "qpss06",
    "qpss07",
    "qpss08",
    "qpss09",
    "qpss10"
  ),
  `3B` = c(
    "qpss01",
    "qpss02",
    "qpss03",
    "qpss04",
    "qpss05",
    "qpss06",
    "qpss07",
    "qpss08",
    "qpss09",
    "qpss10"
  )
)

variable_labels_list <- list(
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "almost never",
  `2` = "sometimes",
  `3` = "often",
  `4` = "very often"
)

standardized_value_labels <- list(
  qpss01 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qpss02 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qpss03 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qpss04 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qpss05 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qpss06 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qpss07 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qpss08 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qpss09 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  qpss10 = c(
    default_missing_labels[c("-1")],
    `0` = "never",
    default_answer_labels[c("1", "2", "3", "4")]
  )
)

value_labels_list <- list(
  Wave_H_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qpss01 = "categorical",
  qpss02 = "categorical",
  qpss03 = "categorical",
  qpss04 = "categorical",
  qpss05 = "categorical",
  qpss06 = "categorical",
  qpss07 = "categorical",
  qpss08 = "categorical",
  qpss09 = "categorical",
  qpss10 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "104", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "104", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "104", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "104", waves = .lasa_wave_rows())
)

.lasa_fc_104 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

