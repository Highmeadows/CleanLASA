## LASA filecode 018 -- variable names, variable labels, value labels,
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
  hinsura = "categorical"
)

# define variable labels ----
variable_labels(
  hinsura = "HEALTH INSURANCE",
  .applies_to_waves = c("Z")
)

variable_labels(
  "hinsura",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-5` = "no insurance", `-1` = "not available, do not know", `1` = "sick-fund: mandatory", `2` = "sick-fund: voluntary", `3` = "private insurance",
  .applies_to_vars = c("hinsura"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "no insurance", `-1` = "na, do not know", `1` = "sick-fund: mandatory", `2` = "sick-fund: voluntary", `3` = "private Insurance",
  .applies_to_vars = c("hinsura"),
  .applies_to_waves = c("B")
)

.lasa_fc_018 <- .lasa_finalize_fc("018")

