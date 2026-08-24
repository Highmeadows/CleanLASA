## LASA filecode 149 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qgsr01 = "MK2: exhausting to pursue goal, search a new goal",
  qgsr02 = "SU3: harder to get same results, keep trying harder",
  qgsr03 = "MK3: try to pursue several goals",
  qgsr04 = "SU1: effort to achieve a given goal",
  qgsr05 = "SU2: set goals clearly, stick to them",
  qgsr06 = "AP3: for goals detailed plans how to implement them",
  qgsr07 = "CP1: have a backup plan in case something goes wrong",
  qgsr08 = "MK1: if difficulty try to achieve goal by other means",
  qgsr09 = "MK4: goal difficult to reach, find alternative route",
  qgsr10 = "CP3: plan for things other people consider unlikely",
  qgsr11 = "AP1: always make detailed plans for my goals",
  qgsr12 = "SU4: cannot do something the way before look for new goal",
  qgsr13 = "CP2: plan for difficult situations according my intentions",
  qgsr14 = "AP2: for my goals make detailed plans when to implement"
)

variable_labels_list <- list(
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qgsr01 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr02 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr03 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr04 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr05 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr06 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr07 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr08 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr09 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr10 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr11 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr12 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr13 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  ),
  qgsr14 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "slightly disagree",
    `4` = "slightly agree",
    `5` = "agree",
    `6` = "strongly agree"
  )
)

value_labels_list <- list(
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    qgsr01 = .replace_labels(
    standardized_value_labels$qgsr01,
    `-1` = "no answer"
  ),
    qgsr02 = .replace_labels(
    standardized_value_labels$qgsr02,
    `-1` = "no answer"
  ),
    qgsr03 = .replace_labels(
    standardized_value_labels$qgsr03,
    `-1` = "no answer"
  ),
    qgsr04 = .replace_labels(
    standardized_value_labels$qgsr04,
    `-1` = "no answer"
  ),
    qgsr05 = .replace_labels(
    standardized_value_labels$qgsr05,
    `-1` = "no answer"
  ),
    qgsr06 = .replace_labels(
    standardized_value_labels$qgsr06,
    `-1` = "no answer"
  ),
    qgsr07 = .replace_labels(
    standardized_value_labels$qgsr07,
    `-1` = "no answer"
  ),
    qgsr08 = .replace_labels(
    standardized_value_labels$qgsr08,
    `-1` = "no answer"
  ),
    qgsr09 = .replace_labels(
    standardized_value_labels$qgsr09,
    `-1` = "no answer"
  ),
    qgsr10 = .replace_labels(
    standardized_value_labels$qgsr10,
    `-1` = "no answer"
  ),
    qgsr11 = .replace_labels(
    standardized_value_labels$qgsr11,
    `-1` = "no answer"
  ),
    qgsr12 = .replace_labels(
    standardized_value_labels$qgsr12,
    `-1` = "no answer"
  ),
    qgsr13 = .replace_labels(
    standardized_value_labels$qgsr13,
    `-1` = "no answer"
  ),
    qgsr14 = .replace_labels(
    standardized_value_labels$qgsr14,
    `-1` = "no answer"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    qgsr01 = .replace_labels(
    standardized_value_labels$qgsr01,
    `-1` = "no answer"
  ),
    qgsr02 = .replace_labels(
    standardized_value_labels$qgsr02,
    `-1` = "no answer"
  ),
    qgsr03 = .replace_labels(
    standardized_value_labels$qgsr03,
    `-1` = "no answer"
  ),
    qgsr04 = .replace_labels(
    standardized_value_labels$qgsr04,
    `-1` = "no answer"
  ),
    qgsr05 = .replace_labels(
    standardized_value_labels$qgsr05,
    `-1` = "no answer"
  ),
    qgsr06 = .replace_labels(
    standardized_value_labels$qgsr06,
    `-1` = "no answer"
  ),
    qgsr07 = .replace_labels(
    standardized_value_labels$qgsr07,
    `-1` = "no answer"
  ),
    qgsr08 = .replace_labels(
    standardized_value_labels$qgsr08,
    `-1` = "no answer"
  ),
    qgsr09 = .replace_labels(
    standardized_value_labels$qgsr09,
    `-1` = "no answer"
  ),
    qgsr10 = .replace_labels(
    standardized_value_labels$qgsr10,
    `-1` = "no answer"
  ),
    qgsr11 = .replace_labels(
    standardized_value_labels$qgsr11,
    `-1` = "no answer"
  ),
    qgsr12 = .replace_labels(
    standardized_value_labels$qgsr12,
    `-1` = "no answer"
  ),
    qgsr13 = .replace_labels(
    standardized_value_labels$qgsr13,
    `-1` = "no answer"
  ),
    qgsr14 = .replace_labels(
    standardized_value_labels$qgsr14,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qgsr01 = "categorical",
  qgsr02 = "categorical",
  qgsr03 = "categorical",
  qgsr04 = "categorical",
  qgsr05 = "categorical",
  qgsr06 = "categorical",
  qgsr07 = "categorical",
  qgsr08 = "categorical",
  qgsr09 = "categorical",
  qgsr10 = "categorical",
  qgsr11 = "categorical",
  qgsr12 = "categorical",
  qgsr13 = "categorical",
  qgsr14 = "categorical"
)

.lasa_fc_149 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "149", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "149", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "149", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "149", waves = .lasa_wave_rows())
)
