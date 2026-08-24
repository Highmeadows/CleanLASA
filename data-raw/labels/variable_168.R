## LASA filecode 168 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcat1 = "CAT1: cough",
  mcat2 = "CAT2: production of phlegm",
  mcat3 = "CAT3: chest tightness",
  mcat4 = "CAT4: breathlessness",
  mcat5 = "CAT5: activity limitation",
  mcat6 = "CAT6: confidence",
  mcat7 = "CAT7: sleep",
  mcat8 = "CAT8: energy",
  mcattot = "CAT total score",
  mlftd = "long-function test done",
  mlftrn = "reason long-function test not done"
)

variable_labels_list <- list(
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    mlftd = "Long function: test done",
    mlftrn = "Long function: reason test not done"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcat1 = c(`-1` = "na, asked"),
  mcat2 = c(`-1` = "na, asked"),
  mcat3 = c(`-1` = "na, asked"),
  mcat4 = c(`-1` = "na, asked"),
  mcat5 = c(`-1` = "na, asked"),
  mcat6 = c(`-1` = "na, asked"),
  mcat7 = c(`-1` = "na, asked"),
  mcat8 = c(`-1` = "na, asked"),
  mcattot = c(`-2` = "no valid data"),
  mlftd = c(`-1` = "test not completed / no response", `2` = "yes"),
  mlftrn = c(
    `-2` = "LF test done",
    `1` = "device not working or parts missing",
    `2` = "physical reasons",
    `3` = "R does not want to perform spirometry",
    `4` = "limited time",
    `5` = "no medication",
    `6` = "environment not suitable",
    `7` = "unknown"
  )
)

value_labels_list <- list(
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    mcat1 = .replace_labels(
    standardized_value_labels$mcat1,
    `-1` = "no answer, asked"
  ),
    mcat2 = .replace_labels(
    standardized_value_labels$mcat2,
    `-1` = "no answer, asked"
  ),
    mcat3 = .replace_labels(
    standardized_value_labels$mcat3,
    `-1` = "no answer, asked"
  ),
    mcat4 = .replace_labels(
    standardized_value_labels$mcat4,
    `-1` = "no answer, asked"
  ),
    mcat5 = .replace_labels(
    standardized_value_labels$mcat5,
    `-1` = "no answer, asked"
  ),
    mcat6 = .replace_labels(
    standardized_value_labels$mcat6,
    `-1` = "no answer, asked"
  ),
    mcat7 = .replace_labels(
    standardized_value_labels$mcat7,
    `-1` = "no answer, asked"
  ),
    mcat8 = .replace_labels(
    standardized_value_labels$mcat8,
    `-1` = "no answer, asked"
  ),
    mlftd = .replace_labels(
    standardized_value_labels$mlftd,
    `-1` = "no answer, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mcat1 = "text",
  mcat2 = "text",
  mcat3 = "text",
  mcat4 = "text",
  mcat5 = "text",
  mcat6 = "text",
  mcat7 = "text",
  mcat8 = "text",
  mcattot = "numeric",
  mlftd = "categorical",
  mlftrn = "categorical"
)

.lasa_fc_168 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "168", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "168", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "168", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "168", waves = .lasa_wave_rows())
)
