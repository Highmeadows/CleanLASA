## LASA filecode 607 -- variable names, variable labels, value labels,
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
  tpcogd1 = "categorical",
  tpcogd2 = "categorical",
  tpcogd3 = "categorical",
  tpcogd4 = "categorical",
  tpcogd5 = "categorical",
  tpcogd6 = "categorical",
  tpcogdc = "numeric"
)

# define variable labels ----
variable_labels(
  tpcogd1 = "Cognition: talks",
  tpcogd2 = "Cognition: remembering addresses",
  tpcogd3 = "Cognition: familiar machines",
  tpcogd4 = "Cognition: decisions",
  tpcogd5 = "Cognition: handling money",
  tpcogd6 = "Cognition: financial affairs",
  tpcogdc = "Informant questionnaire of cognitive decline",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tpcogd1", "tpcogd2", "tpcogd3", "tpcogd4", "tpcogd5", "tpcogd6",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "tpcogdc",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("tpcogd1", "tpcogd2", "tpcogd3", "tpcogd4", "tpcogd5", "tpcogd6"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = "much better", `2` = "a bit better", `3` = "not changed", `4` = "a bit worse", `5` = "much worse",
  .applies_to_vars = c("tpcogd1", "tpcogd2", "tpcogd3", "tpcogd4", "tpcogd5", "tpcogd6"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "missing values", `6` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("tpcogdc"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J")
)

.lasa_fc_607 <- .lasa_finalize_fc("607")

