## LASA filecode 331 -- variable names, variable labels, value labels,
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
  qsoid = "numeric"
)

# define variable labels ----
variable_labels(
  qsoid = "Solidarity with elderly as group",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qsoid",
  .applies_to_waves = c("D", "E")
)

# define value labels ----
value_labels(
  `-1` = "no valid data", `10` = NA_character_, `50` = NA_character_,
  .applies_to_vars = c("qsoid"),
  .applies_to_waves = c("Z", "D", "E")
)

.lasa_fc_331 <- .lasa_finalize_fc("331")

