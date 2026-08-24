## LASA filecode 182 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mbackp = "Back pain since last interview",
  mbackpd = "Back pain duration",
  mconfbed = "Confined to bed",
  mconfbeda25 = "Confined to bed: after age 25",
  mconfbedb25 = "Confined to bed: before age 25",
  mconfbedpy = "Confined to bed: past year",
  mthyrover = "Thyroid gland: overactive"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    mconfbed = "Confined to bed yes/no"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("mbackp", "mbackpd", "mconfbed", "mthyrover")],
    mconfbed = "Confined to bed since last interview"
  ),
  Wave_E_labels = harmonized_labels[c("mbackp", "mbackpd")],
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("mconfbed")],
    mconfbed = "Confined to bed since last interview"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("mconfbed")],
    mconfbed = "Confined to bed since last interview"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("mconfbed")],
    mconfbed = "Confined to bed since last interview"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("mconfbed")],
    mconfbed = "Confined to bed in last 3 years for 6 weeks or more"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mbackp = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mbackpd = c(
    `-2` = "na, see EMBACKP",
    `-1` = "na, asked",
    `1` = "less than one week",
    `2` = "> week < one month",
    `3` = "> one month"
  ),
  mconfbed = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "do not know"
  ),
  mconfbeda25 = c(`-2` = "na, see CMCONFBED", `0` = "not mentioned", `1` = "mentioned"),
  mconfbedb25 = c(`-2` = "na, see CMCONFBED", `0` = "not mentioned", `1` = "mentioned"),
  mconfbedpy = c(`-2` = "na, see CMCONFBED", `0` = "not mentioned", `1` = "mentioned"),
  mthyrover = c(`-5` = "na, interview terminated", `1` = "no", `2` = "yes", `3` = "do not know")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mbackpd = c(
    `-2` = "na, see C/DMBACKP",
    `1` = "less than one week",
    `2` = "> week < one month",
    `3` = "> one month"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("mbackp", "mbackpd", "mconfbed", "mthyrover")],
    mbackpd = c(
    `-2` = "na, see C/DMBACKP",
    `1` = "less than one week",
    `2` = "> week < one month",
    `3` = "> one month"
  ),
    mconfbed = .replace_labels(
    standardized_value_labels$mconfbed,
    `2` = "yes, not the past year",
    `3` = "yes, the past year"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("mbackp", "mbackpd")],
    mbackp = c(`-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("mconfbed")],
    mconfbed = c(`-1` = "na, asked", `1` = "no", `2` = "yes, not the past year", `3` = "yes, the past year")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("mconfbed")],
    mconfbed = c(`-1` = "na, asked", `1` = "no", `2` = "yes, not the past year", `3` = "yes, the past year")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("mconfbed")],
    mconfbed = c(`-1` = "na, asked", `1` = "no", `2` = "yes, not the past year", `3` = "yes, the past year")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("mconfbed")],
    mconfbed = c(`-1` = "na, asked", `1` = "no", `2` = "yes, not the past year", `3` = "yes, the past year")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mbackp = "categorical",
  mbackpd = "categorical",
  mconfbed = "categorical",
  mconfbeda25 = "categorical",
  mconfbedb25 = "categorical",
  mconfbedpy = "categorical",
  mthyrover = "categorical"
)

.lasa_fc_182 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "182", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "182", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "182", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "182", waves = .lasa_wave_rows())
)
