## LASA filecode 045 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  erh = "Visited emergency room hospital past 6 monthsnths",
  erhn = "Visited emergency room hospital: number of times",
  hosp = "Hospitalization past 6 monthsnths",
  medspec = "Contacted medical specialist past 6 monthsnths",
  psych = "Contacted psychiatrist past 6 monthsnths",
  psyhosp = "Psychiatric hospitalization past 6 monthsnths",
  seh_reden = "‡ Wat was/waren de reden(en) voor het bezoeken van de SEH? (what was/were the reason(s) for visiting the emergency room?)",
  sych = "Contacted psychiatrist past 6 monthsnths",
  ziekan = "‡ Wat was de reden voor deze opname? (what was the reason for this admission?)"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = "Hospitalization past 6 months",
    medspec = "Contacted medical specialist past 6 months",
    psych = "Contacted psychiatrist past 6 months",
    psyhosp = "Psychiatric hospitalization past 6 months"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = "Hospitalization p 6 mo.",
    medspec = "Contacted medical specialist p 6 mo.",
    psych = "Contacted psychiatrist p 6 mo.",
    psyhosp = "Psychiatric hospitalization p 6 mo."
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = "Hospitalization p 6 mo.",
    medspec = "Contacted medical specialist p 6 mo.",
    psych = "Contacted psychiatrist p 6 mo.",
    psyhosp = "Psychiatric hospitalization p 6 mo."
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = "Hospitalization p 6 mo.",
    medspec = "Contacted medical specialist p 6 mo.",
    psych = "Contacted psychiatrist p 6 mo.",
    psyhosp = "Psychiatric hospitalization p 6 mo."
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = "Hospitalization p 6 mo.",
    medspec = "Contacted medical specialist p 6 mo.",
    psych = "Contacted psychiatrist p 6 mo.",
    psyhosp = "Psychiatric hospitalization p 6 mo."
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = "Hospitalization p 6 mo.",
    medspec = "Contacted medical specialist p 6 mo.",
    psych = "Contacted psychiatrist p 6 mo.",
    psyhosp = "Psychiatric hospitalization p 6 mo."
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = "Hospitalization p 6 mo.",
    medspec = "Contacted medical specialist p 6 mo.",
    psych = "Contacted psychiatrist p 6 mo.",
    psyhosp = "Psychiatric hospitalization p 6 mo."
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "psych", "psyhosp", "ziekan")],
    hosp = "Hospitalization p 6 mo.",
    medspec = "Contacted medical specialist p 6 mo.",
    psych = "Contacted psychiatrist p 6 mo.",
    psyhosp = "Psychiatric hospitalization p 6 mo."
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "ziekan")],
    hosp = "Hospitalization p 6 mo.",
    medspec = "Contacted medical specialist p 6 mo."
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "ziekan")],
    hosp = "Hospitalization p 6 mo. (Including psych hosp.)",
    medspec = "Contacted medical specialist p 6 mo."
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c("hosp", "medspec", "psych", "psyhosp", "ziekan")],
    hosp = "Hospitalization p 6 mo.",
    medspec = "Contacted medical specialist p 6 mo.",
    psych = "Contacted psychiatrist p 6 mo.",
    psyhosp = "Psychiatric hospitalization p 6 mo."
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c("erh", "erhn", "hosp", "medspec", "psyhosp", "seh_reden", "sych", "ziekan")],
    erh = "Visited emergency room hospital past 6 months",
    hosp = "Hospitalization past 6 months",
    medspec = "Contacted medical specialist past 6 months",
    psyhosp = "Psychiatric hospitalization past 6 months",
    sych = "Contacted psychiatrist past 6 months"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  erh = c(
    `-4` = "not available, interview terminated",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "respondent does not know",
    `4` = "refused"
  ),
  erhn = c(`-2` = "not available, routing", `-1` = "not available, asked / respondent does not know"),
  hosp = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "numeric coding category 1",
    `2` = "yes",
    `3` = "respondent does not know",
    `4` = "refused"
  ),
  medspec = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "numeric coding category 1",
    `2` = "yes",
    `3` = "respondent does not know",
    `4` = "refused"
  ),
  psych = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, interview terminated",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "numeric coding category 1",
    `2` = "yes",
    `3` = "respondent does not know",
    `4` = "refused"
  ),
  psyhosp = c(
    `-4` = "not available, interview terminated",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "numeric coding category 1",
    `2` = "yes",
    `3` = "respondent does not know",
    `4` = "refused"
  ),
  seh_reden = stats::setNames(character(0), character(0)),
  sych = c(
    `-4` = "not available, interview terminated",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "respondent does not know",
    `4` = "refused"
  ),
  ziekan = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = c(`-2` = "na, see BMEDSPEC", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    medspec = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    psych = c(`-2` = "na, see BMEDSPEC", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    psyhosp = c(`-2` = "na, see BPSYCH", `-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psych = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psyhosp = c(
    `-2` = "na, see C/D/E/B/F/GPSYCH",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psych = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psyhosp = c(
    `-2` = "na, see C/D/E/B/F/GPSYCH",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psych = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psyhosp = c(
    `-2` = "na, see C/D/E/B/F/GPSYCH",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psych = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psyhosp = c(
    `-2` = "na, see C/D/E/B/F/GPSYCH",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psych = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psyhosp = c(
    `-2` = "na, see C/D/E/B/F/GPSYCH",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psych = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psyhosp = c(
    `-2` = "na, see C/D/E/B/F/GPSYCH",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psych = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psyhosp = c(
    `-2` = "na, see H/IPSYCH",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec")],
    hosp = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec")],
    hosp = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("hosp", "medspec", "psych", "psyhosp")],
    hosp = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psych = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psyhosp = c(
    `-2` = "na, see H/IPSYCH",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("erh", "erhn", "hosp", "medspec", "psyhosp", "sych")],
    erh = .replace_labels(
    standardized_value_labels$erh,
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `3` = "R does not know"
  ),
    erhn = .replace_labels(
    standardized_value_labels$erhn,
    `-2` = "na, see JER",
    `-1` = "na, asked / R does not know"
  ),
    hosp = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    medspec = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    psyhosp = c(
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R does not know",
    `4` = "refused"
  ),
    sych = .replace_labels(
    standardized_value_labels$sych,
    `-4` = "na, short/terminated interview",
    `-1` = "na, asked",
    `3` = "R does not know"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  erh = "numeric",
  erhn = "numeric",
  hosp = "numeric",
  medspec = "numeric",
  psych = "numeric",
  psyhosp = "numeric",
  seh_reden = "text",
  sych = "numeric",
  ziekan = "text"
)

.lasa_fc_045 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "045", waves = .lasa_wave_rows()) |>
    .override_label(wave = "H", variable = "ziekan", override_value = "ziekan") |>
    .override_label(wave = "3B", variable = "ziekan", override_value = "ziekan") |>
    .override_label(wave = "MB", variable = "ziekan", override_value = "ziekan") |>
    .override_label(wave = "I", variable = "ziekan", override_value = "ziekan") |>
    .override_label(wave = "J", variable = "seh_reden", override_value = "seh_reden") |>
    .override_label(wave = "J", variable = "ziekan", override_value = "ziekan"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "045", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "045", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "045", waves = .lasa_wave_rows())
)
