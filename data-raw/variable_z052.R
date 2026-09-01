## LASA filecode z052 -- variable names, variable labels, value labels,
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
  `052record` = "categorical",
  municipality = "categorical",
  sample = "categorical"
)

# define variable labels ----
variable_labels(
  `052record` = "domestic-address record type",
  municipality = "municipality or country (Statistics Netherlands coding)",
  sample = "sample cohort",
  .applies_to_waves = c("Z")
)

variable_labels(
  `052record` = "municipality at birth / after 1st move / in 1944 / at age 45 years / of current residence",
  municipality = "municipality (coding Statistics Netherlands) or country",
  sample = "description of sample 1992 - 2002 - 2012",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `1` = "at birth", `2` = "after 1st move", `3` = "in 1944", `4` = "at age 45 years", `5` = "of current residence",
  .applies_to_vars = c("052record"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-6` = "not applicable: first move", `-3` = "1944:not born", `-2` = "not applicable: from abroad", `-1` = "na, asked", `3` = "Appingedam", `1987` = NA_character_, `7001` = "Neth:Groningen", `7012` = "Neth:Flevoland", `7098` = "Neth:travelling", `7099` = "Neth:not classifiable", `8001` = "BRD", `9020` = "China", `9098` = "travelling abroad", `9099` = "abroad:not classifiable", `9999` = "not classifiable",
  .applies_to_vars = c("municipality"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `0` = "1992 sample - oldest LSN birth cohort", `1` = "1992 sample - birth cohorts LASA", `2` = "2002 sample LASA", `3` = "2012 sample LASA",
  .applies_to_vars = c("sample"),
  .applies_to_waves = c("Z", "B")
)

.lasa_fc_z052 <- .lasa_finalize_fc("z052")
.lasa_fc_z052$variables <- .lasa_fc_z052$variables |>
  .override_label(wave = "B", variable = "sample", override_value = "sample")

