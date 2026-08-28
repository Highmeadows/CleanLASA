## LASA filecode 802 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qlgs1 = "LGS01: I try to pass along the knowledge I have gained through my experiences",
  qlgs2 = "LGS02: I do not feel that other people need me",
  qlgs3 = "LGS12: I have important skills that I try to teach others",
  qlgs4 = "LGS13: I feel that I have done nothing that will survive after I die",
  qlgs5 = "LGS18: I have a responsibility to improve the neighborhood in which I live",
  qlgs6 = "LGS20: I feel as though my contributions will exist after I die"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `J` = c(
    "qlgs1",
    "qlgs2",
    "qlgs3",
    "qlgs4",
    "qlgs5",
    "qlgs6"
  ),
  `K` = c(
    "qlgs1",
    "qlgs2",
    "qlgs3",
    "qlgs4",
    "qlgs5",
    "qlgs6"
  )
)

variable_labels_list <- list(
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qlgs1 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "slightly disagree",
    `3` = "slightly agree",
    `4` = "strongly agree"
  ),
  qlgs2 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "slightly disagree",
    `3` = "slightly agree",
    `4` = "strongly agree"
  ),
  qlgs3 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "slightly disagree",
    `3` = "slightly agree",
    `4` = "strongly agree"
  ),
  qlgs4 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "slightly disagree",
    `3` = "slightly agree",
    `4` = "strongly agree"
  ),
  qlgs5 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "slightly disagree",
    `3` = "slightly agree",
    `4` = "strongly agree"
  ),
  qlgs6 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "slightly disagree",
    `3` = "slightly agree",
    `4` = "strongly agree"
  )
)

value_labels_list <- list(
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qlgs1 = "categorical",
  qlgs2 = "categorical",
  qlgs3 = "categorical",
  qlgs4 = "categorical",
  qlgs5 = "categorical",
  qlgs6 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "802", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "802", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "802", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "802", waves = .lasa_wave_rows())
)

.lasa_fc_802 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

