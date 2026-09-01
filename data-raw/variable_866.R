## LASA filecode 866 -- variable names, variable labels, value labels,
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
  mhcy = "numeric",
  mmma = "numeric",
  mvb12 = "numeric"
)

# define variable labels ----
variable_labels(
  mhcy = "homocysteine (\302\265Mol/l)",
  mmma = "methylmalonic acid (\302\265Mol/l)",
  mvb12 = "vitamin b12 (pMol/l)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mhcy", "mmma", "mvb12",
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-1` = "no determination",
  .applies_to_vars = c("mhcy", "mmma", "mvb12"),
  .applies_to_waves = c("Z", "C")
)

.lasa_fc_866 <- .lasa_finalize_fc("866")

