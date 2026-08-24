## LASA filecode 604 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  tphear = "Change in hearing over past 3 years",
  tpsen01 = "Usually wears glasses or contact lenses",
  tpsen03 = "Read small newspaper print without glasses or contact lenses",
  tpsen04 = "Read small newspaper print with glasses or other aid",
  tpsen07 = "Usually wears hearing aid",
  tpsen09 = "Follow conversation with 3 or 4 persons without hearing aid",
  tpsen10 = "Follow conversation with 3 or 4 persons with hearing aid",
  tpsight = "Change in vision over past 3 years"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("tphear", "tpsight")],
    tphear = "Senses: change hearing last 3 years",
    tpsight = "Senses: change visus last 3 years"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("tphear", "tpsight")],
    tphear = "Senses: change hearing last 3 years",
    tpsight = "Senses: change visus last 3 years"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("tphear", "tpsight")],
    tphear = "Senses: change hearing last 3 years",
    tpsight = "Senses: change visus last 3 years"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen01 = "R usually wears glasses or contactlenses",
    tpsen03 = "Small print in paper without glasses (or contactlenses)",
    tpsen04 = "Small print in paper with glasses or other aid",
    tpsen07 = "R usually wears hearing aid",
    tpsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    tpsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen01 = "R usually wears glasses or contactlenses",
    tpsen03 = "Small print in paper without glasses (or contactlenses)",
    tpsen04 = "Small print in paper with glasses or other aid",
    tpsen07 = "R usually wears hearing aid",
    tpsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    tpsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen01 = "R usually wears glasses or contactlenses",
    tpsen03 = "Small print in paper without glasses (or contactlenses)",
    tpsen04 = "Small print in paper with glasses or other aid",
    tpsen07 = "R usually wears hearing aid",
    tpsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    tpsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen01 = "R usually wears glasses or contactlenses",
    tpsen03 = "Small print in paper without glasses (or contactlenses)",
    tpsen04 = "Small print in paper with glasses or other aid",
    tpsen07 = "R usually wears hearing aid",
    tpsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    tpsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen01 = "R usually wears glasses or contactlenses",
    tpsen03 = "Small print in paper without glasses (or contactlenses)",
    tpsen04 = "Small print in paper with glasses or other aid",
    tpsen07 = "R usually wears hearing aid",
    tpsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    tpsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen01 = "R usually wears glasses or contactlenses",
    tpsen03 = "Small print in paper without glasses (or contactlenses)",
    tpsen04 = "Small print in paper with glasses or other aid",
    tpsen07 = "R usually wears hearing aid",
    tpsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    tpsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  tphear = c(
    `-1` = "does not know",
    `1` = "much better",
    `2` = "better",
    `3` = "the same",
    `4` = "worse",
    `5` = "much worse"
  ),
  tpsen01 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpsen03 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
  tpsen04 = c(
    `-2` = "na, see TPSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot",
    `5` = "R does not use aid"
  ),
  tpsen07 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpsen09 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
  tpsen10 = c(
    `-2` = "na, see TPSEN09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot",
    `5` = "R does not have a hearing aid"
  ),
  tpsight = c(
    `-1` = "asked, no answer",
    `1` = "much better",
    `2` = "better",
    `3` = "the same",
    `4` = "worse",
    `5` = "much worse"
  )
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels[c("tphear", "tpsight")],
  Wave_D_labels = standardized_value_labels[c("tphear", "tpsight")],
  Wave_E_labels = standardized_value_labels[c("tphear", "tpsight")],
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen04 = c(
    `-2` = "na, see FTPSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    tpsen10 = c(
    `-2` = "na, see FTPSEN09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen04 = c(
    `-2` = "na, see GTPSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    tpsen10 = c(
    `-2` = "na, see GTPSEN09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen04 = .replace_labels(
    standardized_value_labels$tpsen04,
    `-2` = "na, see HTPSEN03"
  ),
    tpsen10 = .replace_labels(
    standardized_value_labels$tpsen10,
    `-2` = "na, see HTPSEN09"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen04 = .replace_labels(
    standardized_value_labels$tpsen04,
    `-2` = "na, see ITPSEN03"
  ),
    tpsen10 = .replace_labels(
    standardized_value_labels$tpsen10,
    `-2` = "na, see ITPSEN09"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen04 = .replace_labels(
    standardized_value_labels$tpsen04,
    `-2` = "na, see JTPSEN03"
  ),
    tpsen10 = .replace_labels(
    standardized_value_labels$tpsen10,
    `-2` = "na, see JTPSEN09"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("tpsen01", "tpsen03", "tpsen04", "tpsen07", "tpsen09", "tpsen10")],
    tpsen04 = .replace_labels(
    standardized_value_labels$tpsen04,
    `-2` = "na, see KTPSEN03"
  ),
    tpsen10 = .replace_labels(
    standardized_value_labels$tpsen10,
    `-2` = "na, see KTPSEN09"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  tphear = "categorical",
  tpsen01 = "categorical",
  tpsen03 = "categorical",
  tpsen04 = "categorical",
  tpsen07 = "categorical",
  tpsen09 = "categorical",
  tpsen10 = "categorical",
  tpsight = "categorical"
)

.lasa_fc_604 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "604", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "604", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "604", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "604", waves = .lasa_wave_rows())
)
