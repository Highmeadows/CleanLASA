## LASA filecode 222 -- variable names, variable labels, value labels,
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
  craven = "numeric",
  ravatot = "numeric",
  ravbtot = "numeric",
  rmcrab = "categorical",
  rmcrav = "categorical"
)

# define variable labels ----
variable_labels(
  craven = "Total coloured Raven score",
  ravatot = "Total coloured Raven score, section A",
  ravbtot = "Total coloured Raven score, section B",
  rmcrab = "Reason for missing/invalid coloured Raven section B score",
  rmcrav = "Reason for missing/invalid coloured Raven score",
  .applies_to_waves = c("Z")
)

variable_labels(
  craven = "Total score coloured raven",
  ravatot = "Total c. raven score section A",
  ravbtot = "Total c. raven score section B",
  rmcrav = "Reason, no valid data on c. raven",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  rmcrab = "Reason, no valid data b-section c. raven",
  .applies_to_waves = c("F", "G")
)

# define value labels ----
value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("craven", "ravatot", "ravbtot"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "valid score", `-1` = "see FMRMCRAV", `0` = "- to be coded -", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to (cognitive)", `6` = "not able to (physical)", `7` = "technical problems", `8` = "unknown",
  .applies_to_vars = c("rmcrab"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid score", `-1` = "see FMRMCRAV", `0` = "- to be coded -", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to (cognitive)", `6` = "not able to complete test (physical)", `7` = "technical problems", `8` = "unknown",
  .applies_to_vars = c("rmcrav"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BRMCRAV",
  .applies_to_vars = c("craven", "ravatot", "ravbtot"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "valid score", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to (cognitive)", `6` = "not able to (physical): visus", `7` = "technical problems", `8` = "unknown",
  .applies_to_vars = c("rmcrav"),
  .applies_to_waves = c("B", "C")
)

value_labels(
  `-2` = "valid score", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to (cognitive)", `6` = "not able to (physical)", `7` = "technical problems", `8` = "unknown",
  .applies_to_vars = c("rmcrav"),
  .applies_to_waves = c("D", "E", "2B")
)

value_labels(
  `-2` = "valid score", `-1` = "see FMRMCRAV", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to (cognitive)", `6` = "not able to (physical)", `7` = "technical problems", `8` = "unknown",
  .applies_to_vars = c("rmcrab", "rmcrav"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "valid score", `-1` = "see GMRMCRAV", `0` = "- to be coded -", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to (cognitive)", `6` = "not able to (physical)", `7` = "technical problems", `8` = "unknown",
  .applies_to_vars = c("rmcrab", "rmcrav"),
  .applies_to_waves = c("G")
)

.lasa_fc_222 <- .lasa_finalize_fc("222")
.lasa_fc_222$variables <- .lasa_fc_222$variables |>
  .override_label(wave = "E", variable = "craven", override_value = "emcraven") |>
  .override_label(wave = "E", variable = "ravatot", override_value = "emrvatot") |>
  .override_label(wave = "E", variable = "ravbtot", override_value = "emrvbtot") |>
  .override_label(wave = "E", variable = "rmcrav", override_value = "emrmcrav") |>
  .override_label(wave = "2B", variable = "craven", override_value = "bmcraven") |>
  .override_label(wave = "F", variable = "craven", override_value = "fmcraven") |>
  .override_label(wave = "F", variable = "ravatot", override_value = "fmrvatot") |>
  .override_label(wave = "F", variable = "ravbtot", override_value = "fmrvbtot") |>
  .override_label(wave = "F", variable = "rmcrab", override_value = "fmrmcrab") |>
  .override_label(wave = "F", variable = "rmcrav", override_value = "fmrmcrav") |>
  .override_label(wave = "G", variable = "craven", override_value = "gmcraven") |>
  .override_label(wave = "G", variable = "ravatot", override_value = "gmrvatot") |>
  .override_label(wave = "G", variable = "ravbtot", override_value = "gmrvbtot") |>
  .override_label(wave = "G", variable = "rmcrab", override_value = "gmrmcrab") |>
  .override_label(wave = "G", variable = "rmcrav", override_value = "gmrmcrav")

