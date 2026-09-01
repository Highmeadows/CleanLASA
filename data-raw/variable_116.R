## LASA filecode 116 -- variable names, variable labels, value labels,
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
  qdecu01 = "categorical",
  qdecu02 = "categorical"
)

# define variable labels ----
variable_labels(
  qdecu01 = "Decubitus: suffering bed sores (Self adm. questionnaire)",
  qdecu02 = "Decubitus: treatment (Self adm. questionnaire)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qdecu01", "qdecu02",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "no", `2` = "yes, <two weeks", `3` = "yes, 2wks><3mths", `4` = "yes, >3months",
  .applies_to_vars = c("qdecu01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qdecu02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "no", `2` = "yes, <two weeks", `3` = "yes, 2wks><3mths", `4` = "yes, >3months",
  .applies_to_vars = c("qdecu01"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qdecu02"),
  .applies_to_waves = c("B")
)

.lasa_fc_116 <- .lasa_finalize_fc("116")

