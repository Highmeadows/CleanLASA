## LASA filecode zdc1 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: give it its own variable_labels()/value_labels() calls
## (or add it to .applies_to_waves of an existing call sharing its text).
## To add a new variable: add it to var_types_vec, then declare its
## text/codes below.

# define variable types ----
## Every canonical variable name this filecode declares, and its
## collapsed type ("numeric"/"categorical"/"text"/"date"). Free order --
## matched by name everywhere below, never by position.
var_types_vec <- c(
  DM = "categorical",
  alg_DM_ruw = "categorical"
)

# define variable labels ----
variable_labels(
  DM = "diabetes mellitus status",
  alg_DM_ruw = "diabetes mellitus status unadjusted for previous-wave status",
  .applies_to_waves = c("Z")
)

variable_labels(
  DM = "B wave: diabetes mellitus",
  .applies_to_waves = c("B")
)

variable_labels(
  DM = "diabetes at C wave, dropouts defined",
  alg_DM_ruw = "DM at C, unadjusted for DM status at previous waves",
  .applies_to_waves = c("C")
)

variable_labels(
  DM = "diabetes at D wave, dropouts defined",
  alg_DM_ruw = "DM at D, unadjusted for DM status at previous waves",
  .applies_to_waves = c("D")
)

variable_labels(
  DM = "diabetes at E wave, dropouts defined",
  alg_DM_ruw = "DM at E, unadjusted for DM status at previous waves",
  .applies_to_waves = c("E")
)

variable_labels(
  DM = "diabetes at F wave, dropouts defined",
  alg_DM_ruw = "DM at F, unadjusted for DM status at previous waves",
  .applies_to_waves = c("F")
)

variable_labels(
  DM = "diabetes at G wave, dropouts defined",
  alg_DM_ruw = "DM at G, unadjusted for DM status at previous waves",
  .applies_to_waves = c("G")
)

variable_labels(
  DM = "diabetes at H wave, dropouts defined",
  alg_DM_ruw = "DM at H, unadjusted for DM status at previous waves",
  .applies_to_waves = c("H")
)

variable_labels(
  DM = "diabetes at I wave, dropouts defined",
  alg_DM_ruw = "DM at I, unadjusted for DM status at previous waves",
  .applies_to_waves = c("I")
)

# define value labels ----
value_labels(
  `-1` = "missing", `0` = "no DM", `1` = "definite DM", `2` = "possible DM", `3` = "contradictory", `5` = "drop-out",
  .applies_to_vars = c("DM", "alg_DM_ruw"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-1` = "missing", `0` = "no DM", `1` = "definite DM", `2` = "possible DM", `3` = "contradictory",
  .applies_to_vars = c("DM"),
  .applies_to_waves = c("B")
)

.lasa_fc_zdc1 <- .lasa_finalize_fc("zdc1")
.lasa_fc_zdc1$variables <- .lasa_fc_zdc1$variables |>
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
  .override_label(wave = "I", variable = "alg_DM_ruw", override_value = "i_alg_DM_ruw")

