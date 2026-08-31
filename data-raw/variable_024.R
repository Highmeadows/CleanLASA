## LASA filecode 024 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mecog1 = "Evaluation Raven test: relaxation",
  mecog2 = "Present capability raven test",
  mecog3 = "Future capability raven test: better"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "mecog1",
    "mecog2",
    "mecog3"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mecog1 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-1")],
    `0` = "no answer",
    `1` = "very tense",
    `2` = "tensed",
    `3` = "not tense, not relaxed",
    `4` = "relaxed",
    `5` = "very relaxed"
  ),
  mecog2 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-1")],
    `0` = "no answer",
    `1` = "very bad",
    `2` = "bad",
    `3` = "fair",
    `4` = "good",
    `5` = "very good"
  ),
  mecog3 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-1")],
    `0` = "no answer",
    `1` = "no, certain",
    `2` = "no probably",
    `3` = "maybe yes/no",
    `4` = "yes, probably",
    `5` = "yes, certain"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    mecog1 = .replace_labels(
    standardized_value_labels$mecog1,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-1` = "asked, no answer"
  ),
    mecog2 = .replace_labels(
    standardized_value_labels$mecog2,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-1` = "asked, no answer"
  ),
    mecog3 = .replace_labels(
    standardized_value_labels$mecog3,
    `-5` = "interview broken off",
    `-4` = "no answer, short version",
    `-1` = "asked, no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mecog1 = "categorical", mecog2 = "categorical", mecog3 = "categorical")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "024", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "024", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "024", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "024", waves = .lasa_wave_rows())
)

.lasa_fc_024 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

