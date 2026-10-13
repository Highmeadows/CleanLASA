## LASA filecode z990 -- variable names, variable labels, value labels,
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
  cdcertnr = "categorical",
  cdplace = "categorical",
  de210815 = "categorical",
  de_age = "numeric",
  de_date = "date",
  deceas = "categorical",
  dedate = "date",
  dedate_d = "numeric",
  dedate_m = "numeric",
  dedate_y = "numeric",
  followup = "numeric",
  gbadata = "categorical",
  lasadata = "categorical"
)

# define variable labels ----
variable_labels(
  cdcertnr = "death certificate number known?",
  cdplace = "death place known?",
  de210815 = "death status at August 15, 2021",
  de_age = "age at death",
  de_date = "date of death",
  deceas = "respondent deceased?",
  dedate = "date of death (yyyymmdd)",
  dedate_d = "date of death, day part",
  dedate_m = "date of death, month part",
  dedate_y = "date of death, year part",
  followup = "followup from baseline to 15-8-2021 (days)",
  gbadata = "GBA data available",
  lasadata = "participation lasa baseline",
  .applies_to_waves = c("Z")
)

variable_labels(
  "cdcertnr", "cdplace", "de210815", "de_age", "de_date", "deceas", "dedate", "dedate_d", "dedate_m", "dedate_y", "followup", "gbadata", "lasadata",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-2` = "no data, see deceas", `-1` = "missing data", `0` = "no", `1` = "yes",
  .applies_to_vars = c("cdcertnr", "cdplace"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no GBA data", `0` = "alive at 15-8-2021", `1` = "deceased at 15-8-2021",
  .applies_to_vars = c("de210815"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "no data, see deceas",
  .applies_to_vars = c("de_age", "dedate", "dedate_d", "dedate_m", "dedate_y"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no data, see gbadata", `0` = "no", `1` = "yes",
  .applies_to_vars = c("deceas"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no GBA data", `-1` = "no participation lasa",
  .applies_to_vars = c("followup"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "no records found", `-1` = "no records, moved abroad", `1` = "data available",
  .applies_to_vars = c("gbadata"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("lasadata"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "no data, see DECEAS", `-1` = "missing data", `0` = "no", `1` = "yes",
  .applies_to_vars = c("cdcertnr", "cdplace"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no data, see DECEAS",
  .applies_to_vars = c("de_age", "dedate", "dedate_d", "dedate_m", "dedate_y"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no data, see GBADATA", `0` = "no", `1` = "yes",
  .applies_to_vars = c("deceas"),
  .applies_to_waves = c("B")
)

.lasa_fc_z990 <- .lasa_finalize_fc("z990")
.lasa_fc_z990$variables <- .lasa_fc_z990$variables |>
  .override_label(wave = "B", variable = "cdcertnr", override_value = "cdcertnr") |>
  .override_label(wave = "B", variable = "cdplace", override_value = "cdplace") |>
  .override_label(wave = "B", variable = "de210815", override_value = "de210815") |>
  .override_label(wave = "B", variable = "de_age", override_value = "de_age") |>
  .override_label(wave = "B", variable = "de_date", override_value = "de_date") |>
  .override_label(wave = "B", variable = "deceas", override_value = "deceas") |>
  .override_label(wave = "B", variable = "dedate", override_value = "dedate") |>
  .override_label(wave = "B", variable = "dedate_d", override_value = "dedate_d") |>
  .override_label(wave = "B", variable = "dedate_m", override_value = "dedate_m") |>
  .override_label(wave = "B", variable = "dedate_y", override_value = "dedate_y") |>
  .override_label(wave = "B", variable = "followup", override_value = "followup") |>
  .override_label(wave = "B", variable = "gbadata", override_value = "GBAdata") |>
  .override_label(wave = "B", variable = "lasadata", override_value = "lasadata")

