## LASA filecode 304 -- variable names, variable labels, value labels,
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
  qpsstot = "numeric"
)

# define variable labels ----
variable_labels(
  qpsstot = "Perceived Stress Scale total score",
  .applies_to_waves = c("Z")
)

variable_labels(
  qpsstot = "perceived stress scale total score",
  .applies_to_waves = c("H", "3B")
)

# define value labels ----
value_labels(
  `-2` = "questionnaire not done", `-1` = "too many missings",
  .applies_to_vars = c("qpsstot"),
  .applies_to_waves = c("Z", "H", "3B")
)

.lasa_fc_304 <- .lasa_finalize_fc("304")

