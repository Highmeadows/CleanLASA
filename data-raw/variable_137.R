## LASA filecode 137 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qvall01 = "Value of late life 01: difficult",
  qvall02 = "Value of late life 02: much",
  qvall03 = "Value of late life 03: daily basis",
  qvall04 = "Value of late life 04: lifeaims",
  qvall05 = "Value of late life 05: useful",
  qvall06 = "Value of late life 06: important",
  qvall07 = "Value of late life 07: attain",
  qvall08 = "Value of late life 08: plans",
  qvall09 = "Value of late life 09: many ways",
  qvall10 = "Value of late life 10: problems",
  qvall11 = "Value of late life 11: positive",
  qvall12 = "Value of late life 12: hopeful",
  qvall13 = "Value of late life 13: give up",
  qvall14 = "Value of late life 14: strong will",
  qvall15 = "Value of late life 15: enjoy",
  qvall16 = "Value of late life 16: best",
  qvall17 = "Value of late life 17: ethical",
  qvall18 = "Value of late life 18: make sense",
  qvall19 = "Value of late life 19: few aims"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels[c(
    "qvall01",
    "qvall04",
    "qvall06",
    "qvall07",
    "qvall10",
    "qvall11",
    "qvall13",
    "qvall14",
    "qvall15",
    "qvall16",
    "qvall18",
    "qvall19"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qvall01 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall02 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall03 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall04 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall05 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall06 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall07 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall08 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall09 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall10 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall11 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall12 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall13 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall14 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall15 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall16 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall17 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall18 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  qvall19 = c(
    `-1` = "not available",
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qvall01 = .replace_labels(
    standardized_value_labels$qvall01,
    `-1` = "no answer"
  ),
    qvall02 = .replace_labels(
    standardized_value_labels$qvall02,
    `-1` = "no answer"
  ),
    qvall03 = .replace_labels(
    standardized_value_labels$qvall03,
    `-1` = "no answer"
  ),
    qvall04 = .replace_labels(
    standardized_value_labels$qvall04,
    `-1` = "no answer"
  ),
    qvall05 = .replace_labels(
    standardized_value_labels$qvall05,
    `-1` = "no answer"
  ),
    qvall06 = .replace_labels(
    standardized_value_labels$qvall06,
    `-1` = "no answer"
  ),
    qvall07 = .replace_labels(
    standardized_value_labels$qvall07,
    `-1` = "no answer"
  ),
    qvall08 = .replace_labels(
    standardized_value_labels$qvall08,
    `-1` = "no answer"
  ),
    qvall09 = .replace_labels(
    standardized_value_labels$qvall09,
    `-1` = "no answer"
  ),
    qvall10 = .replace_labels(
    standardized_value_labels$qvall10,
    `-1` = "no answer"
  ),
    qvall11 = .replace_labels(
    standardized_value_labels$qvall11,
    `-1` = "no answer"
  ),
    qvall12 = .replace_labels(
    standardized_value_labels$qvall12,
    `-1` = "no answer"
  ),
    qvall13 = .replace_labels(
    standardized_value_labels$qvall13,
    `-1` = "no answer"
  ),
    qvall14 = .replace_labels(
    standardized_value_labels$qvall14,
    `-1` = "no answer"
  ),
    qvall15 = .replace_labels(
    standardized_value_labels$qvall15,
    `-1` = "no answer"
  ),
    qvall16 = .replace_labels(
    standardized_value_labels$qvall16,
    `-1` = "no answer"
  ),
    qvall17 = .replace_labels(
    standardized_value_labels$qvall17,
    `-1` = "no answer"
  ),
    qvall18 = .replace_labels(
    standardized_value_labels$qvall18,
    `-1` = "no answer"
  ),
    qvall19 = .replace_labels(
    standardized_value_labels$qvall19,
    `-1` = "no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "qvall01",
    "qvall04",
    "qvall06",
    "qvall07",
    "qvall10",
    "qvall11",
    "qvall13",
    "qvall14",
    "qvall15",
    "qvall16",
    "qvall18",
    "qvall19"
  )],
    qvall01 = .replace_labels(
    standardized_value_labels$qvall01,
    `-1` = "no answer"
  ),
    qvall04 = .replace_labels(
    standardized_value_labels$qvall04,
    `-1` = "no answer"
  ),
    qvall06 = .replace_labels(
    standardized_value_labels$qvall06,
    `-1` = "no answer"
  ),
    qvall07 = .replace_labels(
    standardized_value_labels$qvall07,
    `-1` = "no answer"
  ),
    qvall10 = .replace_labels(
    standardized_value_labels$qvall10,
    `-1` = "no answer"
  ),
    qvall11 = .replace_labels(
    standardized_value_labels$qvall11,
    `-1` = "no answer"
  ),
    qvall13 = .replace_labels(
    standardized_value_labels$qvall13,
    `-1` = "no answer"
  ),
    qvall14 = .replace_labels(
    standardized_value_labels$qvall14,
    `-1` = "no answer"
  ),
    qvall15 = .replace_labels(
    standardized_value_labels$qvall15,
    `-1` = "no answer"
  ),
    qvall16 = .replace_labels(
    standardized_value_labels$qvall16,
    `-1` = "no answer"
  ),
    qvall18 = .replace_labels(
    standardized_value_labels$qvall18,
    `-1` = "no answer"
  ),
    qvall19 = .replace_labels(
    standardized_value_labels$qvall19,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qvall01 = "categorical",
  qvall02 = "categorical",
  qvall03 = "categorical",
  qvall04 = "categorical",
  qvall05 = "categorical",
  qvall06 = "categorical",
  qvall07 = "categorical",
  qvall08 = "categorical",
  qvall09 = "categorical",
  qvall10 = "categorical",
  qvall11 = "categorical",
  qvall12 = "categorical",
  qvall13 = "categorical",
  qvall14 = "categorical",
  qvall15 = "categorical",
  qvall16 = "categorical",
  qvall17 = "categorical",
  qvall18 = "categorical",
  qvall19 = "categorical"
)

.lasa_fc_137 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "137", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "137", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "137", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "137", waves = .lasa_wave_rows())
)
