## LASA filecode zdc1 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  DM = "diabetes mellitus status",
  alg_DM_ruw = "diabetes mellitus status unadjusted for previous-wave status"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("DM")],
    DM = "B wave: diabetes mellitus"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    DM = "diabetes at C wave, dropouts defined",
    alg_DM_ruw = "DM at C, unadjusted for DM status at previous waves"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    DM = "diabetes at D wave, dropouts defined",
    alg_DM_ruw = "DM at D, unadjusted for DM status at previous waves"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    DM = "diabetes at E wave, dropouts defined",
    alg_DM_ruw = "DM at E, unadjusted for DM status at previous waves"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    DM = "diabetes at F wave, dropouts defined",
    alg_DM_ruw = "DM at F, unadjusted for DM status at previous waves"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    DM = "diabetes at G wave, dropouts defined",
    alg_DM_ruw = "DM at G, unadjusted for DM status at previous waves"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    DM = "diabetes at H wave, dropouts defined",
    alg_DM_ruw = "DM at H, unadjusted for DM status at previous waves"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    DM = "diabetes at I wave, dropouts defined",
    alg_DM_ruw = "DM at I, unadjusted for DM status at previous waves"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  DM = c(
    `-1` = "missing",
    `0` = "no DM",
    `1` = "definite DM",
    `2` = "possible DM",
    `3` = "contradictory",
    `5` = "drop-out"
  ),
  alg_DM_ruw = c(
    `-1` = "missing",
    `0` = "no DM",
    `1` = "definite DM",
    `2` = "possible DM",
    `3` = "contradictory",
    `5` = "drop-out"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("DM")],
    DM = c(
    `-1` = "missing",
    `0` = "no DM",
    `1` = "definite DM",
    `2` = "possible DM",
    `3` = "contradictory"
  )
  ),
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(DM = "categorical", alg_DM_ruw = "categorical")

.lasa_fc_zdc1 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "zdc1", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "DM", override_value = "b_DM") |>
    .override_label(wave = "C", variable = "DM", override_value = "c_DM") |>
    .override_label(wave = "C", variable = "alg_DM_ruw", override_value = "c_alg_DM_ruw") |>
    .override_label(wave = "D", variable = "DM", override_value = "d_DM") |>
    .override_label(wave = "D", variable = "alg_DM_ruw", override_value = "d_alg_DM_ruw") |>
    .override_label(wave = "E", variable = "DM", override_value = "e_DM") |>
    .override_label(wave = "E", variable = "alg_DM_ruw", override_value = "e_alg_DM_ruw") |>
    .override_label(wave = "F", variable = "DM", override_value = "f_DM") |>
    .override_label(wave = "F", variable = "alg_DM_ruw", override_value = "f_alg_DM_ruw") |>
    .override_label(wave = "G", variable = "DM", override_value = "g_DM") |>
    .override_label(wave = "G", variable = "alg_DM_ruw", override_value = "g_alg_DM_ruw") |>
    .override_label(wave = "H", variable = "DM", override_value = "h_DM") |>
    .override_label(wave = "H", variable = "alg_DM_ruw", override_value = "h_alg_DM_ruw") |>
    .override_label(wave = "I", variable = "DM", override_value = "i_DM") |>
    .override_label(wave = "I", variable = "alg_DM_ruw", override_value = "i_alg_DM_ruw"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "zdc1", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "zdc1", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "zdc1", waves = .lasa_wave_rows())
)
