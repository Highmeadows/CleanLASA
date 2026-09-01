## LASA filecode 130 -- variable names, variable labels, value labels,
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
  qsocd1 = "categorical",
  qsocd2 = "categorical",
  qsocd3 = "categorical",
  qsocd4 = "categorical",
  qsocd5 = "categorical"
)

# define variable labels ----
variable_labels(
  qsocd1 = "social des. 1: always courteous",
  qsocd2 = "social des. 2: profited",
  qsocd3 = "social des. 3: get even",
  qsocd4 = "social des. 4: annoyed",
  qsocd5 = "social des. 5: listen good",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qsocd1", "qsocd2", "qsocd3", "qsocd4", "qsocd5",
  .applies_to_waves = c("C", "F")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "certainly true", `2` = "true", `3` = "do not know", `4` = "not true", `5` = "certainly not true",
  .applies_to_vars = c("qsocd1", "qsocd2", "qsocd3", "qsocd4", "qsocd5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("qsocd1", "qsocd2", "qsocd3", "qsocd4", "qsocd5"),
  .applies_to_waves = c("C", "F")
)

value_labels(
  `1` = "certainly true", `2` = "true", `3` = "do not know", `4` = "not true", `5` = "certainly not true",
  .applies_to_vars = c("qsocd1", "qsocd2", "qsocd3", "qsocd4", "qsocd5"),
  .applies_to_waves = c("C", "F")
)

.lasa_fc_130 <- .lasa_finalize_fc("130")

