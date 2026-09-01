## LASA filecode 045 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
  erh = "Visited emergency room hospital past 6 monthsnths",
  erhn = "Visited emergency room hospital: number of times",
  hosp = "Hospitalization past 6 monthsnths",
  medspec = "Contacted medical specialist past 6 monthsnths",
  psych = "Contacted psychiatrist past 6 monthsnths",
  psyhosp = "Psychiatric hospitalization past 6 monthsnths",
  seh_reden = "\342\200\241 Wat was/waren de reden(en) voor het bezoeken van de SEH? (what was/were the reason(s) for visiting the emergency room?)",
  sych = "Contacted psychiatrist past 6 monthsnths",
  ziekan = "\342\200\241 Wat was de reden voor deze opname? (what was the reason for this admission?)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "ziekan",
  .applies_to_waves = c("H", "3B", "MB", "I", "J")
)

variable_labels(
  "erhn", "seh_reden",
  .applies_to_waves = c("J")
)

variable_labels(
  hosp = "Hospitalization past 6 months",
  medspec = "Contacted medical specialist past 6 months",
  psyhosp = "Psychiatric hospitalization past 6 months",
  .applies_to_waves = c("B", "J")
)

variable_labels(
  psych = "Contacted psychiatrist past 6 months",
  .applies_to_waves = c("B")
)

variable_labels(
  hosp = "Hospitalization p 6 mo.",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I")
)

variable_labels(
  medspec = "Contacted medical specialist p 6 mo.",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I")
)

variable_labels(
  psych = "Contacted psychiatrist p 6 mo.",
  psyhosp = "Psychiatric hospitalization p 6 mo.",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "I")
)

variable_labels(
  hosp = "Hospitalization p 6 mo. (Including psych hosp.)",
  .applies_to_waves = c("MB")
)

variable_labels(
  erh = "Visited emergency room hospital past 6 months",
  sych = "Contacted psychiatrist past 6 months",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-4` = "not available, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "respondent does not know", `4` = "refused",
  .applies_to_vars = c("erh", "sych"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "not available, asked / respondent does not know",
  .applies_to_vars = c("erhn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `-4` = "not available, interview terminated", `-2` = "not available, routing", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes", `3` = "respondent does not know", `4` = "refused",
  .applies_to_vars = c("hosp", "psych"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `-4` = "not available, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes", `3` = "respondent does not know", `4` = "refused",
  .applies_to_vars = c("medspec"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not available, interview terminated", `-2` = "not available, routing", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes", `3` = "respondent does not know", `4` = "refused",
  .applies_to_vars = c("psyhosp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BMEDSPEC", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("hosp", "psych"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("medspec"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPSYCH", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("psyhosp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know", `4` = "refused",
  .applies_to_vars = c("hosp", "medspec"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "MB")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know", `4` = "refused",
  .applies_to_vars = c("psych"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/GPSYCH", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know", `4` = "refused",
  .applies_to_vars = c("psyhosp"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-4` = "na, short/terminated interview", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know", `4` = "refused",
  .applies_to_vars = c("hosp", "medspec"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-4` = "na, short/terminated interview", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know", `4` = "refused",
  .applies_to_vars = c("psych"),
  .applies_to_waves = c("H", "I")
)

value_labels(
  `-2` = "na, see H/IPSYCH", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know", `4` = "refused",
  .applies_to_vars = c("psyhosp"),
  .applies_to_waves = c("H", "I")
)

value_labels(
  `-4` = "na, short/terminated interview", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know", `4` = "refused",
  .applies_to_vars = c("erh", "psyhosp", "sych"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JER", `-1` = "na, asked / R does not know",
  .applies_to_vars = c("erhn"),
  .applies_to_waves = c("J")
)

.lasa_fc_045 <- .lasa_finalize_fc("045")
.lasa_fc_045$variables <- .lasa_fc_045$variables |>
  .override_label(wave = "H", variable = "ziekan", override_value = "ziekan") |>
  .override_label(wave = "3B", variable = "ziekan", override_value = "ziekan") |>
  .override_label(wave = "MB", variable = "ziekan", override_value = "ziekan") |>
  .override_label(wave = "I", variable = "ziekan", override_value = "ziekan") |>
  .override_label(wave = "J", variable = "seh_reden", override_value = "seh_reden") |>
  .override_label(wave = "J", variable = "ziekan", override_value = "ziekan")

