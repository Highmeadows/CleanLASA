## LASA filecode mb095 -- variable names, variable labels, value labels,
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
  urb = "categorical"
)

# define variable labels ----
variable_labels(
  urb = "level of urbanization (number addresses per km2)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "urb",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-3` = "no observation", `-2` = "abroad", `-1` = "unknown", `1` = "not (<500)", `2` = "little (500-1000)", `3` = "somewhat (1000-1500)", `4` = "highly (1500-2500)", `5` = "very highly (>=2500)",
  .applies_to_vars = c("urb"),
  .applies_to_waves = c("Z", "MB")
)

.lasa_fc_mb095 <- .lasa_finalize_fc("mb095")

