## LASA filecode 162 -- variable names, variable labels, value labels,
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
  mlphyand = "numeric"
)

# define variable labels ----
variable_labels(
  mlphyand = "number of days per week >30 minutes physically active",
  .applies_to_waves = c("Z")
)

variable_labels(
  mlphyand = "number of days a week >30 min physically active",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-4` = "na, interview terminated", `-1` = "na, asked", `0` = "0 days", `1` = "1 day", `2` = "2 days", `3` = "3 days", `4` = "4 days", `5` = "5 days", `6` = "6 days", `7` = "7 days",
  .applies_to_vars = c("mlphyand"),
  .applies_to_waves = c("Z", "J")
)

.lasa_fc_162 <- .lasa_finalize_fc("162")

