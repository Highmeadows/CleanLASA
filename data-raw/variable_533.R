## LASA filecode 533 -- variable names, variable labels, value labels,
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
  mcs12 = "numeric",
  pcs12 = "numeric"
)

# define variable labels ----
variable_labels(
  mcs12 = "Mental Component Summary",
  pcs12 = "Physical Component Summary",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mcs12", "pcs12",
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "no scale (missing value)",
  .applies_to_vars = c("mcs12", "pcs12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no scale (mv)",
  .applies_to_vars = c("mcs12", "pcs12"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

.lasa_fc_533 <- .lasa_finalize_fc("533")

