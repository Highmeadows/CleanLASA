## LASA filecode 708 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(trrel09 = "Influences daily life", trrel10 = "Role in important decisions")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `C` = c(
    "trrel09",
    "trrel10"
  )
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trrel09 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/no disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  trrel10 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/no disagreement",
    `4` = "disagree",
    `5` = "strongly disagree"
  )
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(trrel09 = "categorical", trrel10 = "categorical")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "708", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "708", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "708", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "708", waves = .lasa_wave_rows())
)

.lasa_fc_708 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

