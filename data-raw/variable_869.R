## LASA filecode 869 -- variable names, variable labels, value labels,
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
  mcmgp = "numeric",
  mlabrem = "categorical",
  mucmgp = "numeric"
)

# define variable labels ----
variable_labels(
  mcmgp = "dp-cMGP (pMol/l)",
  mlabrem = "remarks VITAK lab",
  mucmgp = "dp-ucMGP (pMol/l)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mcmgp", "mlabrem", "mucmgp",
  .applies_to_waves = c("2B")
)

# define value labels ----
value_labels(
  `-3` = "incorrect value", `-1` = "no determination",
  .applies_to_vars = c("mcmgp", "mucmgp"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-2` = "no remarks", `1` = "whole blood", `2` = "lipaemic", `3` = "light lipaemic", `4` = "hemolytic", `5` = "light hemolytic",
  .applies_to_vars = c("mlabrem"),
  .applies_to_waves = c("Z", "2B")
)

.lasa_fc_869 <- .lasa_finalize_fc("869")

