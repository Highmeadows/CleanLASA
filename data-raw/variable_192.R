## LASA filecode 192 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mvcm101 = "VCM1: feeling ashamed",
  mvcm102 = "VCM1: feeling frustrated or annoyed",
  mvcm103 = "VCM1: feeling lonely or abandoned",
  mvcm104 = "VCM1: feeling sad or unhappy",
  mvcm105 = "VCM1: worried about decline of eyesight",
  mvcm106 = "VCM1: worried about general safety at home",
  mvcm107 = "VCM1: worried about general safety outdoors",
  mvcm108 = "VCM1: worried about dealing with daily life",
  mvcm109 = "VCM1: eyesight an obstacle for things you wanted to do",
  mvcm110 = "VCM1: eyesight an obstacle for life in general",
  mvq1 = "eye surgery or eye/vision measurement in past month",
  mvq2 = "different glasses/contacts or change of eyesight in past month"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mvcm101 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvcm102 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvcm103 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvcm104 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvcm105 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvcm106 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvcm107 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvcm108 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvcm109 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvcm110 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "reasonably often",
    `5` = "often",
    `6` = "very often"
  ),
  mvq1 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  mvq2 = c(`-1` = "na, asked", `1` = "no", `2` = "yes")
)

value_labels_list <- list(
  Wave_E_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mvcm101 = "categorical",
  mvcm102 = "categorical",
  mvcm103 = "categorical",
  mvcm104 = "categorical",
  mvcm105 = "categorical",
  mvcm106 = "categorical",
  mvcm107 = "categorical",
  mvcm108 = "categorical",
  mvcm109 = "categorical",
  mvcm110 = "categorical",
  mvq1 = "categorical",
  mvq2 = "categorical"
)

.lasa_fc_192 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "192", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "192", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "192", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "192", waves = .lasa_wave_rows())
)
