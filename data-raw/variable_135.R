## LASA filecode 135 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qeq5d1 = "EQ5D1: Mobility",
  qeq5d2 = "EQ5D2: Self-care",
  qeq5d3 = "EQ5D3: Usual activities",
  qeq5d4 = "EQ5D4: Pain/discomfort",
  qeq5d5 = "EQ5D5: Anxiety/depression",
  qeqvas = "EQVAS: Self-rated health (scale)"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qeq5d1 = c(
    `-1` = "not available",
    `1` = "no problems walking",
    `2` = "some problems walking",
    `3` = "confined to bed"
  ),
  qeq5d2 = c(
    `-1` = "not available",
    `1` = "no problems washing/dressing",
    `2` = "some problems washing/dressing",
    `3` = "unable to wash/dress"
  ),
  qeq5d3 = c(
    `-1` = "not available",
    `1` = "no problems usual activities",
    `2` = "some problems usual activities",
    `3` = "unable to perform usual activities"
  ),
  qeq5d4 = c(
    `-1` = "not available",
    `1` = "no pain/discomfort",
    `2` = "moderate pain/discomfort",
    `3` = "extreme pain/discomfort"
  ),
  qeq5d5 = c(
    `-1` = "not available",
    `1` = "not anxious/depressed",
    `2` = "moderately anxious/depressed",
    `3` = "extreme anxious/depressed"
  ),
  qeqvas = c(`-1` = "not available", `0` = NA_character_, `100` = NA_character_)
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qeq5d1 = .replace_labels(
    standardized_value_labels$qeq5d1,
    `-1` = "no answer"
  ),
    qeq5d2 = .replace_labels(
    standardized_value_labels$qeq5d2,
    `-1` = "no answer"
  ),
    qeq5d3 = .replace_labels(
    standardized_value_labels$qeq5d3,
    `-1` = "no answer"
  ),
    qeq5d4 = .replace_labels(
    standardized_value_labels$qeq5d4,
    `-1` = "no answer"
  ),
    qeq5d5 = .replace_labels(
    standardized_value_labels$qeq5d5,
    `-1` = "no answer"
  ),
    qeqvas = .replace_labels(
    standardized_value_labels$qeqvas,
    `-1` = "no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qeq5d1 = .replace_labels(
    standardized_value_labels$qeq5d1,
    `-1` = "no answer"
  ),
    qeq5d2 = .replace_labels(
    standardized_value_labels$qeq5d2,
    `-1` = "no answer"
  ),
    qeq5d3 = .replace_labels(
    standardized_value_labels$qeq5d3,
    `-1` = "no answer"
  ),
    qeq5d4 = .replace_labels(
    standardized_value_labels$qeq5d4,
    `-1` = "no answer"
  ),
    qeq5d5 = .replace_labels(
    standardized_value_labels$qeq5d5,
    `-1` = "no answer"
  ),
    qeqvas = .replace_labels(
    standardized_value_labels$qeqvas,
    `-1` = "no answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    qeq5d1 = .replace_labels(
    standardized_value_labels$qeq5d1,
    `-1` = "no answer"
  ),
    qeq5d2 = .replace_labels(
    standardized_value_labels$qeq5d2,
    `-1` = "no answer"
  ),
    qeq5d3 = .replace_labels(
    standardized_value_labels$qeq5d3,
    `-1` = "no answer"
  ),
    qeq5d4 = .replace_labels(
    standardized_value_labels$qeq5d4,
    `-1` = "no answer"
  ),
    qeq5d5 = .replace_labels(
    standardized_value_labels$qeq5d5,
    `-1` = "no answer"
  ),
    qeqvas = .replace_labels(
    standardized_value_labels$qeqvas,
    `-1` = "no answer"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    qeq5d1 = .replace_labels(
    standardized_value_labels$qeq5d1,
    `-1` = "no answer"
  ),
    qeq5d2 = .replace_labels(
    standardized_value_labels$qeq5d2,
    `-1` = "no answer"
  ),
    qeq5d3 = .replace_labels(
    standardized_value_labels$qeq5d3,
    `-1` = "no answer"
  ),
    qeq5d4 = .replace_labels(
    standardized_value_labels$qeq5d4,
    `-1` = "no answer"
  ),
    qeq5d5 = .replace_labels(
    standardized_value_labels$qeq5d5,
    `-1` = "no answer"
  ),
    qeqvas = .replace_labels(
    standardized_value_labels$qeqvas,
    `-1` = "no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qeq5d1 = .replace_labels(
    standardized_value_labels$qeq5d1,
    `-1` = "no answer"
  ),
    qeq5d2 = .replace_labels(
    standardized_value_labels$qeq5d2,
    `-1` = "no answer"
  ),
    qeq5d3 = .replace_labels(
    standardized_value_labels$qeq5d3,
    `-1` = "no answer"
  ),
    qeq5d4 = .replace_labels(
    standardized_value_labels$qeq5d4,
    `-1` = "no answer"
  ),
    qeq5d5 = .replace_labels(
    standardized_value_labels$qeq5d5,
    `-1` = "no answer"
  ),
    qeqvas = .replace_labels(
    standardized_value_labels$qeqvas,
    `-1` = "no answer"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qeq5d1 = .replace_labels(
    standardized_value_labels$qeq5d1,
    `-1` = "no answer"
  ),
    qeq5d2 = .replace_labels(
    standardized_value_labels$qeq5d2,
    `-1` = "no answer"
  ),
    qeq5d3 = .replace_labels(
    standardized_value_labels$qeq5d3,
    `-1` = "no answer"
  ),
    qeq5d4 = .replace_labels(
    standardized_value_labels$qeq5d4,
    `-1` = "no answer"
  ),
    qeq5d5 = .replace_labels(
    standardized_value_labels$qeq5d5,
    `-1` = "no answer"
  ),
    qeqvas = .replace_labels(
    standardized_value_labels$qeqvas,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qeq5d1 = "categorical",
  qeq5d2 = "categorical",
  qeq5d3 = "categorical",
  qeq5d4 = "categorical",
  qeq5d5 = "categorical",
  qeqvas = "numeric"
)

.lasa_fc_135 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "135", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "135", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "135", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "135", waves = .lasa_wave_rows())
)
