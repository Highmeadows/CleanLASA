## LASA filecode 159 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mdecu01 = "Decubitus: reported No/Yes",
  mdecu02 = "reported decubitus medical interview",
  mdecu03 = "Decubitus: most severe reported",
  mdecu04 = "Decubitus: stadium observed",
  mdecu05 = "Decubitus: treatment at home by",
  mdecu06 = "Decubitus: treatment at nursing home by",
  mdecu07 = "Decubitus: present past year",
  mdecu08 = "Decubitus: past year how often"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "mdecu01",
    "mdecu02",
    "mdecu03",
    "mdecu04",
    "mdecu05",
    "mdecu06",
    "mdecu07",
    "mdecu08"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mdecu01 = c(
    `-3` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mdecu02 = c(
    `-3` = "no valid data",
    default_missing_labels[c("-1")],
    `0` = "not reported",
    `1` = "heel",
    `2` = "ankle",
    `3` = "hip",
    `4` = "coccyx",
    `5` = "other place"
  ),
  mdecu03 = c(
    `-3` = "no valid data",
    default_missing_labels[c("-1")],
    `0` = "not reported",
    `1` = "heel",
    `2` = "ankle",
    `3` = "hip",
    `4` = "coccyx",
    `5` = "other place"
  ),
  mdecu04 = c(`-3` = "no valid data", `0` = "not reported", `1` = "no decubitus", `2` = "phase 1"),
  mdecu05 = c(
    `-3` = "no valid data",
    `-2` = "in nursing home",
    default_missing_labels[c("-1")],
    `0` = "not reported",
    `1` = "oneself"
  ),
  mdecu06 = c(
    `-3` = "no valid data",
    `-2` = "living at home",
    default_missing_labels[c("-1")],
    `0` = "not reported",
    `4` = "nurse",
    `7` = "other: elderly care"
  ),
  mdecu07 = c(
    `-3` = "no valid data",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mdecu08 = c(
    `-3` = "no valid data",
    default_missing_labels[c("-2", "-1")],
    `1` = "1 time"
  )
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mdecu01 = "categorical",
  mdecu02 = "categorical",
  mdecu03 = "categorical",
  mdecu04 = "categorical",
  mdecu05 = "categorical",
  mdecu06 = "categorical",
  mdecu07 = "categorical",
  mdecu08 = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "159", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "159", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "159", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "159", waves = .lasa_wave_rows())
)

.lasa_fc_159 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

