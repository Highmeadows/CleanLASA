## LASA filecode 315 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(qpain = "Evaluation of pain at present")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "qpain"
  ),
  `C` = c(
    "qpain"
  ),
  `D` = c(
    "qpain"
  ),
  `E` = c(
    "qpain"
  ),
  `2B` = c(
    "qpain"
  ),
  `F` = c(
    "qpain"
  ),
  `G` = c(
    "qpain"
  ),
  `H` = c(
    "qpain"
  ),
  `3B` = c(
    "qpain"
  ),
  `MB` = c(
    "qpain"
  ),
  `I` = c(
    "qpain"
  ),
  `J` = c(
    "qpain"
  ),
  `K` = c(
    "qpain"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Wave_MB_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qpain = c(`-1` = "no valid data", `5` = NA_character_, `10` = NA_character_)
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_2B_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Wave_MB_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qpain = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "315", waves = .lasa_wave_rows()) |>
    .override_label(wave = "MB", variable = "qpain", override_value = "bmpain"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "315", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "315", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "315", waves = .lasa_wave_rows())
)

.lasa_fc_315 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

