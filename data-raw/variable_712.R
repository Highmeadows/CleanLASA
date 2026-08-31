## LASA filecode 712 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  trlo10 = "often, I feel rejected",
  trlo3 = "experience emptiness",
  trlo4 = "people to lean on if in trouble",
  trlo7 = "many people I can count on",
  trlo8 = "enough people I feel close to",
  trlo9 = "miss having people around"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `H` = c(
    "trlo10",
    "trlo3",
    "trlo4",
    "trlo7",
    "trlo8",
    "trlo9"
  ),
  `I` = c(
    "trlo10",
    "trlo3",
    "trlo4",
    "trlo7",
    "trlo8",
    "trlo9"
  ),
  `J` = c(
    "trlo10",
    "trlo3",
    "trlo4",
    "trlo7",
    "trlo8",
    "trlo9"
  ),
  `K` = c(
    "trlo10",
    "trlo3",
    "trlo4",
    "trlo7",
    "trlo8",
    "trlo9"
  )
)

variable_labels_list <- list(
  Wave_H_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trlo10 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "more-or-less",
    `3` = "yes"
  ),
  trlo3 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "more-or-less",
    `3` = "yes"
  ),
  trlo4 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "more-or-less",
    `3` = "yes"
  ),
  trlo7 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "more-or-less",
    `3` = "yes"
  ),
  trlo8 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "more-or-less",
    `3` = "yes"
  ),
  trlo9 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "more-or-less",
    `3` = "yes"
  )
)

value_labels_list <- list(
  Wave_H_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  trlo10 = "categorical",
  trlo3 = "categorical",
  trlo4 = "categorical",
  trlo7 = "categorical",
  trlo8 = "categorical",
  trlo9 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "712", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "712", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "712", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "712", waves = .lasa_wave_rows())
)

.lasa_fc_712 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

