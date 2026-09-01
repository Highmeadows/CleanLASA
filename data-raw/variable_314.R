## LASA filecode 314 -- variable names, variable labels, value labels,
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
  qphseff = "numeric"
)

# define variable labels ----
variable_labels(
  qphseff = "Physical self-efficacy (LIVAS)",
  .applies_to_waves = c("Z")
)

variable_labels(
  qphseff = "Physical self-efficacy (LIVAS) Low-High",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F")
)

# define value labels ----
value_labels(
  `-1` = "no valid data", `10` = NA_character_, `50` = NA_character_,
  .applies_to_vars = c("qphseff"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F")
)

.lasa_fc_314 <- .lasa_finalize_fc("314")

