## LASA filecode 121 -- variable names, variable labels, value labels,
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
  qsocp01 = "categorical",
  qsocp02 = "categorical",
  qsocp03 = "categorical"
)

# define variable labels ----
variable_labels(
  qsocp01 = "conversation about magazine/paper",
  qsocp02 = "conversation about life",
  qsocp03 = "make calculations",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qsocp01", "qsocp02", "qsocp03",
  .applies_to_waves = c("B", "C", "D")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "rarely or never", `2` = "monthly", `3` = "weekly or more often",
  .applies_to_vars = c("qsocp01", "qsocp02", "qsocp03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "rarely or never", `2` = "monthly", `3` = "weekly or more often",
  .applies_to_vars = c("qsocp01", "qsocp02", "qsocp03"),
  .applies_to_waves = c("B", "C", "D")
)

.lasa_fc_121 <- .lasa_finalize_fc("121")

