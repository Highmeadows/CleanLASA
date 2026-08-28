## LASA filecode 533 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(mcs12 = "Mental Component Summary", pcs12 = "Physical Component Summary")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `D` = c(
    "mcs12",
    "pcs12"
  ),
  `E` = c(
    "mcs12",
    "pcs12"
  ),
  `F` = c(
    "mcs12",
    "pcs12"
  ),
  `G` = c(
    "mcs12",
    "pcs12"
  ),
  `H` = c(
    "mcs12",
    "pcs12"
  ),
  `3B` = c(
    "mcs12",
    "pcs12"
  ),
  `I` = c(
    "mcs12",
    "pcs12"
  ),
  `J` = c(
    "mcs12",
    "pcs12"
  ),
  `K` = c(
    "mcs12",
    "pcs12"
  )
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcs12 = c(`-1` = "no scale (missing value)"),
  pcs12 = c(`-1` = "no scale (missing value)")
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    mcs12 = .replace_labels(
    standardized_value_labels$mcs12,
    `-1` = "no scale (mv)"
  ),
    pcs12 = .replace_labels(
    standardized_value_labels$pcs12,
    `-1` = "no scale (mv)"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    mcs12 = .replace_labels(
    standardized_value_labels$mcs12,
    `-1` = "no scale (mv)"
  ),
    pcs12 = .replace_labels(
    standardized_value_labels$pcs12,
    `-1` = "no scale (mv)"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    mcs12 = .replace_labels(
    standardized_value_labels$mcs12,
    `-1` = "no scale (mv)"
  ),
    pcs12 = .replace_labels(
    standardized_value_labels$pcs12,
    `-1` = "no scale (mv)"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    mcs12 = .replace_labels(
    standardized_value_labels$mcs12,
    `-1` = "no scale (mv)"
  ),
    pcs12 = .replace_labels(
    standardized_value_labels$pcs12,
    `-1` = "no scale (mv)"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    mcs12 = .replace_labels(
    standardized_value_labels$mcs12,
    `-1` = "no scale (mv)"
  ),
    pcs12 = .replace_labels(
    standardized_value_labels$pcs12,
    `-1` = "no scale (mv)"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    mcs12 = .replace_labels(
    standardized_value_labels$mcs12,
    `-1` = "no scale (mv)"
  ),
    pcs12 = .replace_labels(
    standardized_value_labels$pcs12,
    `-1` = "no scale (mv)"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    mcs12 = .replace_labels(
    standardized_value_labels$mcs12,
    `-1` = "no scale (mv)"
  ),
    pcs12 = .replace_labels(
    standardized_value_labels$pcs12,
    `-1` = "no scale (mv)"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    mcs12 = .replace_labels(
    standardized_value_labels$mcs12,
    `-1` = "no scale (mv)"
  ),
    pcs12 = .replace_labels(
    standardized_value_labels$pcs12,
    `-1` = "no scale (mv)"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    mcs12 = .replace_labels(
    standardized_value_labels$mcs12,
    `-1` = "no scale (mv)"
  ),
    pcs12 = .replace_labels(
    standardized_value_labels$pcs12,
    `-1` = "no scale (mv)"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mcs12 = "numeric", pcs12 = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "533", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "533", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "533", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "533", waves = .lasa_wave_rows())
)

.lasa_fc_533 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

