## LASA filecode 114 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qseff01 = "Self efficacy 1: flexible (+)",
  qseff02 = "Self efficacy 2: reaction time (+)",
  qseff03 = "Self efficacy 3: strong (-)",
  qseff04 = "Self efficacy 4: good condition (+)",
  qseff05 = "Self efficacy 5: move smoothly (-)",
  qseff06 = "Self efficacy 6: stairs (+)",
  qseff07 = "Self efficacy 7: strong grip (+)",
  qseff08 = "Self efficacy 8: walk fast (-)",
  qseff09 = "Self efficacy 9: good balance (+)",
  qseff10 = "Self efficacy 10: active (-)"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    qseff03 = "self efficacy 3: strong (-)",
    qseff05 = "self efficacy 5: move smoothly (-)",
    qseff07 = "self efficacy 7: strong grip (+)"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    qseff03 = "self efficacy 3: strong (-)",
    qseff05 = "self efficacy 5: move smoothly (-)",
    qseff07 = "self efficacy 7: strong grip (+)"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    qseff03 = "self efficacy 3: strong (-)",
    qseff05 = "self efficacy 5: move smoothly (-)",
    qseff07 = "self efficacy 7: strong grip (+)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    qseff03 = "self efficacy 3: strong (-)",
    qseff05 = "self efficacy 5: move smoothly (-)",
    qseff07 = "self efficacy 7: strong grip (+)"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    qseff03 = "self efficacy 3: strong (-)",
    qseff05 = "self efficacy 5: move smoothly (-)",
    qseff07 = "self efficacy 7: strong grip (+)"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    qseff03 = "self efficacy 3: strong (-)",
    qseff05 = "self efficacy 5: move smoothly (-)",
    qseff07 = "self efficacy 7: strong grip (+)"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qseff01 = c(
    `-1` = "not available",
    `1` = "much more flexible",
    `2` = "more flexible",
    `3` = "just as flexible",
    `4` = "less flexible",
    `5` = "much less flexible"
  ),
  qseff02 = c(
    `-1` = "not available",
    `1` = "much better",
    `2` = "better",
    `3` = "just as good",
    `4` = "worse",
    `5` = "much worse"
  ),
  qseff03 = c(
    `-1` = "not available",
    `1` = "much less strong",
    `2` = "less strong",
    `3` = "just as strong",
    `4` = "stronger",
    `5` = "much stronger"
  ),
  qseff04 = c(
    `-1` = "not available",
    `1` = "much better",
    `2` = "better",
    `3` = "just as good",
    `4` = "worse",
    `5` = "much worse"
  ),
  qseff05 = c(
    `-1` = "not available",
    `1` = "much less smoothly",
    `2` = "less smoothly",
    `3` = "just as smoothly",
    `4` = "more smoothly",
    `5` = "much more smoothly"
  ),
  qseff06 = c(
    `-1` = "not available",
    `1` = "much more easy",
    `2` = "more easy",
    `3` = "just as easy",
    `4` = "more difficult",
    `5` = "much more difficult"
  ),
  qseff07 = c(
    `-1` = "not available",
    `1` = "much greater",
    `2` = "greater",
    `3` = "smaller",
    `4` = "less",
    `5` = "much smaller"
  ),
  qseff08 = c(
    `-1` = "not available",
    `1` = "much slower",
    `2` = "slower",
    `3` = "just as fast",
    `4` = "faster",
    `5` = "much faster"
  ),
  qseff09 = c(
    `-1` = "not available",
    `1` = "much better",
    `2` = "better",
    `3` = "just as good",
    `4` = "worse",
    `5` = "much worse"
  ),
  qseff10 = c(
    `-1` = "not available",
    `1` = "much less active",
    `2` = "less active",
    `3` = "just as active",
    `4` = "more active",
    `5` = "much more active"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qseff01 = .replace_labels(
    standardized_value_labels$qseff01,
    `-1` = "no answer"
  ),
    qseff02 = .replace_labels(
    standardized_value_labels$qseff02,
    `-1` = "no answer"
  ),
    qseff03 = .replace_labels(
    standardized_value_labels$qseff03,
    `-1` = "no answer"
  ),
    qseff04 = .replace_labels(
    standardized_value_labels$qseff04,
    `-1` = "no answer"
  ),
    qseff05 = .replace_labels(
    standardized_value_labels$qseff05,
    `-1` = "no answer"
  ),
    qseff06 = .replace_labels(
    standardized_value_labels$qseff06,
    `-1` = "no answer"
  ),
    qseff07 = .replace_labels(
    standardized_value_labels$qseff07,
    `-1` = "no answer"
  ),
    qseff08 = .replace_labels(
    standardized_value_labels$qseff08,
    `-1` = "no answer"
  ),
    qseff09 = .replace_labels(
    standardized_value_labels$qseff09,
    `-1` = "no answer"
  ),
    qseff10 = .replace_labels(
    standardized_value_labels$qseff10,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qseff01 = .replace_labels(
    standardized_value_labels$qseff01,
    `-1` = "no answer"
  ),
    qseff02 = .replace_labels(
    standardized_value_labels$qseff02,
    `-1` = "no answer"
  ),
    qseff03 = .replace_labels(
    standardized_value_labels$qseff03,
    `-1` = "no answer"
  ),
    qseff04 = .replace_labels(
    standardized_value_labels$qseff04,
    `-1` = "no answer"
  ),
    qseff05 = .replace_labels(
    standardized_value_labels$qseff05,
    `-1` = "no answer"
  ),
    qseff06 = .replace_labels(
    standardized_value_labels$qseff06,
    `-1` = "no answer"
  ),
    qseff07 = .replace_labels(
    standardized_value_labels$qseff07,
    `-1` = "no answer"
  ),
    qseff08 = .replace_labels(
    standardized_value_labels$qseff08,
    `-1` = "no answer"
  ),
    qseff09 = .replace_labels(
    standardized_value_labels$qseff09,
    `-1` = "no answer"
  ),
    qseff10 = .replace_labels(
    standardized_value_labels$qseff10,
    `-1` = "no answer"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qseff01 = .replace_labels(
    standardized_value_labels$qseff01,
    `-1` = "no answer"
  ),
    qseff02 = .replace_labels(
    standardized_value_labels$qseff02,
    `-1` = "no answer"
  ),
    qseff03 = .replace_labels(
    standardized_value_labels$qseff03,
    `-1` = "no answer"
  ),
    qseff04 = .replace_labels(
    standardized_value_labels$qseff04,
    `-1` = "no answer"
  ),
    qseff05 = .replace_labels(
    standardized_value_labels$qseff05,
    `-1` = "no answer"
  ),
    qseff06 = .replace_labels(
    standardized_value_labels$qseff06,
    `-1` = "no answer"
  ),
    qseff07 = .replace_labels(
    standardized_value_labels$qseff07,
    `-1` = "no answer"
  ),
    qseff08 = .replace_labels(
    standardized_value_labels$qseff08,
    `-1` = "no answer"
  ),
    qseff09 = .replace_labels(
    standardized_value_labels$qseff09,
    `-1` = "no answer"
  ),
    qseff10 = .replace_labels(
    standardized_value_labels$qseff10,
    `-1` = "no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qseff01 = .replace_labels(
    standardized_value_labels$qseff01,
    `-1` = "no answer"
  ),
    qseff02 = .replace_labels(
    standardized_value_labels$qseff02,
    `-1` = "no answer"
  ),
    qseff03 = .replace_labels(
    standardized_value_labels$qseff03,
    `-1` = "no answer"
  ),
    qseff04 = .replace_labels(
    standardized_value_labels$qseff04,
    `-1` = "no answer"
  ),
    qseff05 = .replace_labels(
    standardized_value_labels$qseff05,
    `-1` = "no answer"
  ),
    qseff06 = .replace_labels(
    standardized_value_labels$qseff06,
    `-1` = "no answer"
  ),
    qseff07 = .replace_labels(
    standardized_value_labels$qseff07,
    `-1` = "no answer"
  ),
    qseff08 = .replace_labels(
    standardized_value_labels$qseff08,
    `-1` = "no answer"
  ),
    qseff09 = .replace_labels(
    standardized_value_labels$qseff09,
    `-1` = "no answer"
  ),
    qseff10 = .replace_labels(
    standardized_value_labels$qseff10,
    `-1` = "no answer"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qseff01 = .replace_labels(
    standardized_value_labels$qseff01,
    `-1` = "no answer"
  ),
    qseff02 = .replace_labels(
    standardized_value_labels$qseff02,
    `-1` = "no answer"
  ),
    qseff03 = .replace_labels(
    standardized_value_labels$qseff03,
    `-1` = "no answer"
  ),
    qseff04 = .replace_labels(
    standardized_value_labels$qseff04,
    `-1` = "no answer"
  ),
    qseff05 = .replace_labels(
    standardized_value_labels$qseff05,
    `-1` = "no answer"
  ),
    qseff06 = .replace_labels(
    standardized_value_labels$qseff06,
    `-1` = "no answer"
  ),
    qseff07 = .replace_labels(
    standardized_value_labels$qseff07,
    `-1` = "no answer"
  ),
    qseff08 = .replace_labels(
    standardized_value_labels$qseff08,
    `-1` = "no answer"
  ),
    qseff09 = .replace_labels(
    standardized_value_labels$qseff09,
    `-1` = "no answer"
  ),
    qseff10 = .replace_labels(
    standardized_value_labels$qseff10,
    `-1` = "no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qseff01 = .replace_labels(
    standardized_value_labels$qseff01,
    `-1` = "no answer"
  ),
    qseff02 = .replace_labels(
    standardized_value_labels$qseff02,
    `-1` = "no answer"
  ),
    qseff03 = .replace_labels(
    standardized_value_labels$qseff03,
    `-1` = "no answer"
  ),
    qseff04 = .replace_labels(
    standardized_value_labels$qseff04,
    `-1` = "no answer"
  ),
    qseff05 = .replace_labels(
    standardized_value_labels$qseff05,
    `-1` = "no answer"
  ),
    qseff06 = .replace_labels(
    standardized_value_labels$qseff06,
    `-1` = "no answer"
  ),
    qseff07 = .replace_labels(
    standardized_value_labels$qseff07,
    `-1` = "no answer"
  ),
    qseff08 = .replace_labels(
    standardized_value_labels$qseff08,
    `-1` = "no answer"
  ),
    qseff09 = .replace_labels(
    standardized_value_labels$qseff09,
    `-1` = "no answer"
  ),
    qseff10 = .replace_labels(
    standardized_value_labels$qseff10,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qseff01 = "categorical",
  qseff02 = "categorical",
  qseff03 = "categorical",
  qseff04 = "categorical",
  qseff05 = "categorical",
  qseff06 = "categorical",
  qseff07 = "categorical",
  qseff08 = "categorical",
  qseff09 = "categorical",
  qseff10 = "categorical"
)

.lasa_fc_114 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "114", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "114", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "114", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "114", waves = .lasa_wave_rows())
)
