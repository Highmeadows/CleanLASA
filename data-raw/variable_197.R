## LASA filecode 197 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  maarc1 = "AARC: I appreciate relationships and people much more",
  maarc10 = "AARC: I find it harder to motivate myself",
  maarc2 = "AARC: my mental capacity is declining",
  maarc3 = "AARC: I pay more attention to my health",
  maarc4 = "AARC: I have to limit my activities",
  maarc5 = "AARC: I have more experience and knowledge to evaluate things and people",
  maarc6 = "AARC: I have less energy",
  maarc7 = "AARC: I have a better sense of what is important to me",
  maarc8 = "AARC: I feel more dependent on the help of others",
  maarc9 = "AARC: I have more freedom to live my days the way I want"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `K` = c(
    "maarc1",
    "maarc10",
    "maarc2",
    "maarc3",
    "maarc4",
    "maarc5",
    "maarc6",
    "maarc7",
    "maarc8",
    "maarc9"
  )
)

variable_labels_list <- list(
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "not at all",
  `2` = "a little",
  `3` = "moderately",
  `4` = "quite a bit",
  `5` = "very much"
)

standardized_value_labels <- list(
  maarc1 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maarc10 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maarc2 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maarc3 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maarc4 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maarc5 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maarc6 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maarc7 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maarc8 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  maarc9 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  )
)

value_labels_list <- list(
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  maarc1 = "categorical",
  maarc10 = "categorical",
  maarc2 = "categorical",
  maarc3 = "categorical",
  maarc4 = "categorical",
  maarc5 = "categorical",
  maarc6 = "categorical",
  maarc7 = "categorical",
  maarc8 = "categorical",
  maarc9 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "197", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "197", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "197", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "197", waves = .lasa_wave_rows())
)

.lasa_fc_197 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

