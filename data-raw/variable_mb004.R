## LASA filecode mb004 -- variable names, variable labels, value labels,
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
  aeducat = "categorical",
  aethnic = "categorical",
  bycohort = "categorical",
  byear = "numeric",
  migcoh = "categorical",
  sex = "categorical"
)

# define variable labels ----
variable_labels(
  aeducat = "education level attained (categorical)",
  aethnic = "ethnic identification",
  bycohort = "5-years-cohort birthyear",
  byear = "birthyear of respondent",
  migcoh = "migrant cohort",
  sex = "sex respondent",
  .applies_to_waves = c("Z")
)

variable_labels(
  "aeducat", "aethnic", "bycohort", "byear", "migcoh", "sex",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-1` = "na, asked", `1` = "elementary not completed", `2` = "elementary education", `3` = "lower vocational education", `4` = "general intermediate education", `5` = "intermediate vocational education", `6` = "general secondary education", `7` = "higher vocational education", `8` = "college education", `9` = "university education",
  .applies_to_vars = c("aeducat"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "na, asked", `1` = "Dutch/Netherlands", `2` = "Moroccan Arabic", `3` = "Moroccan Berber", `4` = "Turkish", `5` = "Kurdish", `7` = "Dutch + Moroccan", `8` = "Dutch + Turkish", `9` = "Moroccan (not specific Arabic or Berber)", `10` = "Dutch + Moroccan Arabic)", `11` = "Dutch + Moroccan Berber)", `12` = "Moroccan (Arabic + Berber)", `13` = "Dutch + Moroccan (Arabic + Berber)", `14` = "Armenian", `15` = "world citizen", `16` = "other",
  .applies_to_vars = c("aethnic"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `10` = "1948-52", `11` = "1953-57",
  .applies_to_vars = c("bycohort"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `1` = "Moroccan", `2` = "Turkish",
  .applies_to_vars = c("migcoh"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `1` = "male", `2` = "female",
  .applies_to_vars = c("sex"),
  .applies_to_waves = c("Z", "MB")
)

.lasa_fc_mb004 <- .lasa_finalize_fc("mb004")
.lasa_fc_mb004$variables <- .lasa_fc_mb004$variables |>
  .override_label(wave = "MB", variable = "aeducat", override_value = "aeducat") |>
  .override_label(wave = "MB", variable = "aethnic", override_value = "aethnic") |>
  .override_label(wave = "MB", variable = "bycohort", override_value = "bycohort") |>
  .override_label(wave = "MB", variable = "byear", override_value = "byear") |>
  .override_label(wave = "MB", variable = "migcoh", override_value = "migcoh") |>
  .override_label(wave = "MB", variable = "sex", override_value = "sex")

