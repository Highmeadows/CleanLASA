## LASA filecode 020 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  dsb01 = "Digit Span backwards: 2 numbers, attempt 1+2",
  dsb02 = "Digit Span backwards: 3 numbers, attempt 1+2",
  dsb03 = "Digit Span backwards: 4 numbers, attempt 1+2",
  dsb04 = "Digit Span backwards: 5 numbers, attempt 1+2",
  dsb05 = "Digit Span backwards: 6 numbers, attempt 1+2",
  dsb06 = "Digit Span backwards: 7 numbers, attempt 1+2",
  dsb07 = "Digit Span backwards: 8 numbers, attempt 1+2",
  dsf01 = "Digit Span forwards: 2 numbers, attempt 1+2",
  dsf02 = "Digit Span forwards: 3 numbers, attempt 1+2",
  dsf03 = "Digit Span forwards: 4 numbers, attempt 1+2",
  dsf04 = "Digit Span forwards: 5 numbers, attempt 1+2",
  dsf05 = "Digit Span forwards: 6 numbers, attempt 1+2",
  dsf06 = "Digit Span forwards: 7 numbers, attempt 1+2",
  dsf07 = "Digit Span forwards: 8 numbers, attempt 1+2",
  dsf08 = "Digit Span forwards: 9 numbers, attempt 1+2"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `3B` = c(
    "dsb01",
    "dsb02",
    "dsb03",
    "dsb04",
    "dsb05",
    "dsb06",
    "dsb07",
    "dsf01",
    "dsf02",
    "dsf03",
    "dsf04",
    "dsf05",
    "dsf06",
    "dsf07",
    "dsf08"
  )
)

variable_labels_list <- list(
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "1 correct",
  `2` = "2 correct"
)

standardized_value_labels <- list(
  dsb01 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsb02 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsb03 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsb04 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsb05 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsb06 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsb07 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsf01 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsf02 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsf03 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsf04 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsf05 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsf06 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsf07 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  dsf08 = c(
    `-3` = "not available, routing",
    `-2` = "not available, previous answers incorrect",
    `-1` = "not available, test broken off",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  )
)

value_labels_list <- list(
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    dsb01 = .replace_labels(
    standardized_value_labels$dsb01,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsb02 = .replace_labels(
    standardized_value_labels$dsb02,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsb03 = .replace_labels(
    standardized_value_labels$dsb03,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsb04 = .replace_labels(
    standardized_value_labels$dsb04,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsb05 = .replace_labels(
    standardized_value_labels$dsb05,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsb06 = .replace_labels(
    standardized_value_labels$dsb06,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsb07 = .replace_labels(
    standardized_value_labels$dsb07,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsf01 = .replace_labels(
    standardized_value_labels$dsf01,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsf02 = .replace_labels(
    standardized_value_labels$dsf02,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsf03 = .replace_labels(
    standardized_value_labels$dsf03,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsf04 = .replace_labels(
    standardized_value_labels$dsf04,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsf05 = .replace_labels(
    standardized_value_labels$dsf05,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsf06 = .replace_labels(
    standardized_value_labels$dsf06,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsf07 = .replace_labels(
    standardized_value_labels$dsf07,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  ),
    dsf08 = .replace_labels(
    standardized_value_labels$dsf08,
    `-3` = "na, see BRMDS",
    `-2` = "na, previous answers incorrect",
    `-1` = "test broken off"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  dsb01 = "numeric",
  dsb02 = "numeric",
  dsb03 = "numeric",
  dsb04 = "numeric",
  dsb05 = "numeric",
  dsb06 = "numeric",
  dsb07 = "numeric",
  dsf01 = "numeric",
  dsf02 = "numeric",
  dsf03 = "numeric",
  dsf04 = "numeric",
  dsf05 = "numeric",
  dsf06 = "numeric",
  dsf07 = "numeric",
  dsf08 = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "020", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "020", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "020", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "020", waves = .lasa_wave_rows())
)

.lasa_fc_020 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

