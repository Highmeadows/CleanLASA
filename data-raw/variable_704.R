## LASA filecode 704 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  trhear = "Senses: change hearing last 3 years",
  trsen01 = "R usually wears glasses or contact lenses",
  trsen03 = "Small print in paper without glasses/contact lenses",
  trsen04 = "Small print in paper with glasses or other aid",
  trsen07 = "R usually wears hearing aid",
  trsen09 = "Follow conversation 3 or 4 persons without/not using hearing aid",
  trsen09c = "Using 1 or 2 hearing aids: follow conversation 3 or 4 persons without hearing aid",
  trsen10 = "Follow conversation 3 or 4 persons with hearing aid",
  trsen10c = "Using 1 or 2 hearing aids: follow conversation 3 or 4 persons with hearing aid",
  trsen7a = "R possesses hearing aid(s)",
  trsen7b = "Using 1 or 2 hearing aids: hours per day",
  trsen7c = "Using 1 or 2 hearing aids: R is wearing right now",
  trsight = "Senses: change vision last 3 years"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("trhear", "trsight")],
    trsight = "Senses: change visus last 3 years"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen01 = "R usually wears glasses or contactlenses",
    trsen03 = "Small print in paper without glasses or contactlenses",
    trsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    trsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen01 = "R usually wears glasses or contactlenses",
    trsen03 = "Small print in paper without glasses or contactlenses",
    trsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    trsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen01 = "R usually wears glasses or contactlenses",
    trsen03 = "Small print in paper without glasses or contactlenses",
    trsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    trsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen01 = "R usually wears glasses or contactlenses",
    trsen03 = "Small print in paper without glasses or contactlenses",
    trsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    trsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen01 = "R usually wears glasses or contactlenses",
    trsen03 = "Small print in paper without glasses or contactlenses",
    trsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    trsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen01 = "R usually wears glasses or contactlenses",
    trsen03 = "Small print in paper without glasses or contactlenses",
    trsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
    trsen10 = "Follow conversation 3 or 4 persons: with hearing aid"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "trsen01",
    "trsen03",
    "trsen04",
    "trsen09",
    "trsen09c",
    "trsen10c",
    "trsen7a",
    "trsen7b",
    "trsen7c"
  )],
    trsen01 = "R usually wears glasses or contactlenses",
    trsen03 = "Small print in paper without glasses",
    trsen09 = "No hearing aid/not using hearing aid: follow conversation 3 or 4 persons"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c(
    "trsen01",
    "trsen03",
    "trsen04",
    "trsen09",
    "trsen09c",
    "trsen10c",
    "trsen7a",
    "trsen7b",
    "trsen7c"
  )],
    trsen01 = "R usually wears glasses or contactlenses",
    trsen03 = "Small print in paper without glasses",
    trsen09 = "No hearing aid/not using hearing aid: follow conversation 3 or 4 persons"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trhear = c(
    `-1` = "does not know",
    `1` = "much better",
    `2` = "better",
    `3` = "the same",
    `4` = "worse",
    `5` = "much worse"
  ),
  trsen01 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trsen03 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
  trsen04 = c(
    `-2` = "na, see TRSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot",
    `5` = "R does not use aid"
  ),
  trsen07 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trsen09 = c(
    `-2` = "na, see TRSEN7A",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
  trsen09c = c(
    `-2` = "na, see TRSEN7A",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
  trsen10 = c(
    `-2` = "na, see TRSEN09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
  trsen10c = c(
    `-2` = "na, see TRSEN7A",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot",
    `5` = "R does not wear a hearing aid in this specific situation"
  ),
  trsen7a = c(
    `-1` = "na, asked",
    `1` = "no, never had hearing aid",
    `2` = "yes, possesses 1 hearing aid, but does not (no longer) use it",
    `3` = "yes, possesses 2 hearing aids, but does not (no longer) use it",
    `4` = "yes, possesses 1 hearing aid and uses it",
    `5` = "yes, possesses 2 hearing aids, but uses 1",
    `6` = "yes, possesses 2 hearing aids and uses both"
  ),
  trsen7b = c(
    `-2` = "na, see TRSEN7A",
    `1` = "< 1 hour per day",
    `2` = "1-4 hours per day",
    `3` = "4-8 hours per day",
    `4` = "whole day"
  ),
  trsen7c = c(
    `-2` = "na, see TRSEN7A",
    `1` = "R does not wear a hearing aid right now",
    `2` = "R wears hearing aid left",
    `3` = "R wears hearing aid right",
    `4` = "R wears 2 hearing aids"
  ),
  trsight = c(
    `-1` = "asked, no answer",
    `1` = "much better",
    `2` = "better",
    `3` = "the same",
    `4` = "worse",
    `5` = "much worse"
  )
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels[c("trhear", "trsight")],
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen04 = c(
    `-2` = "na, see DTRSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen09 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen10 = .replace_labels(
    standardized_value_labels$trsen10,
    `-2` = "na, see DTRSEN09"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen04 = c(
    `-2` = "na, see ETRSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen09 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen10 = .replace_labels(
    standardized_value_labels$trsen10,
    `-2` = "na, see ETRSEN09"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen04 = c(
    `-2` = "na, see FTRSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen09 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen10 = .replace_labels(
    standardized_value_labels$trsen10,
    `-2` = "na, see FTRSEN09"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen04 = c(
    `-2` = "na, see GTRSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen09 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen10 = .replace_labels(
    standardized_value_labels$trsen10,
    `-2` = "na, see GTRSEN09"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen04 = c(
    `-2` = "na, see HTRSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen09 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen10 = .replace_labels(
    standardized_value_labels$trsen10,
    `-2` = "na, see HTRSEN09"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("trsen01", "trsen03", "trsen04", "trsen07", "trsen09", "trsen10")],
    trsen04 = c(
    `-2` = "na, see ITRSEN03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen09 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, R cannot"
  ),
    trsen10 = .replace_labels(
    standardized_value_labels$trsen10,
    `-2` = "na, see ITRSEN09"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "trsen01",
    "trsen03",
    "trsen04",
    "trsen09",
    "trsen09c",
    "trsen10c",
    "trsen7a",
    "trsen7b",
    "trsen7c"
  )],
    trsen04 = .replace_labels(
    standardized_value_labels$trsen04,
    `-2` = "na, see JTRSEN03"
  ),
    trsen09 = .replace_labels(
    standardized_value_labels$trsen09,
    `-2` = "na, see JTRSEN7A"
  ),
    trsen09c = .replace_labels(
    standardized_value_labels$trsen09c,
    `-2` = "na, see JTRSEN7A"
  ),
    trsen10c = .replace_labels(
    standardized_value_labels$trsen10c,
    `-2` = "na, see JTRSEN7A"
  ),
    trsen7b = .replace_labels(
    standardized_value_labels$trsen7b,
    `-2` = "na, see JTRSEN7A"
  ),
    trsen7c = .replace_labels(
    standardized_value_labels$trsen7c,
    `-2` = "na, see JTRSEN7A"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "trsen01",
    "trsen03",
    "trsen04",
    "trsen09",
    "trsen09c",
    "trsen10c",
    "trsen7a",
    "trsen7b",
    "trsen7c"
  )],
    trsen04 = .replace_labels(
    standardized_value_labels$trsen04,
    `-2` = "na, see KTRSEN03"
  ),
    trsen09 = .replace_labels(
    standardized_value_labels$trsen09,
    `-2` = "na, see KTRSEN7A"
  ),
    trsen09c = .replace_labels(
    standardized_value_labels$trsen09c,
    `-2` = "na, see KTRSEN7A"
  ),
    trsen10c = .replace_labels(
    standardized_value_labels$trsen10c,
    `-2` = "na, see KTRSEN7A"
  ),
    trsen7b = .replace_labels(
    standardized_value_labels$trsen7b,
    `-2` = "na, see KTRSEN7A"
  ),
    trsen7c = .replace_labels(
    standardized_value_labels$trsen7c,
    `-2` = "na, see KTRSEN7A"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  trhear = "categorical",
  trsen01 = "categorical",
  trsen03 = "categorical",
  trsen04 = "categorical",
  trsen07 = "categorical",
  trsen09 = "categorical",
  trsen09c = "categorical",
  trsen10 = "categorical",
  trsen10c = "categorical",
  trsen7a = "categorical",
  trsen7b = "categorical",
  trsen7c = "categorical",
  trsight = "categorical"
)

.lasa_fc_704 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "704", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "704", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "704", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "704", waves = .lasa_wave_rows())
)
