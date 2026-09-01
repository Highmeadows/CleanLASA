## LASA filecode 865 -- variable names, variable labels, value labels,
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
  mft3 = "numeric",
  mft4 = "numeric",
  mtsh2 = "numeric"
)

# define variable labels ----
variable_labels(
  mft3 = "free T3 (pmol/l)",
  mft4 = "free T4 (pmol/l)",
  mtsh2 = "thyroid-stimulating hormone (mU/l)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mft3", "mft4", "mtsh2",
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-2` = "na, see MTSH2 & MFT4", `-1` = "no determination",
  .applies_to_vars = c("mft3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see MTSH2", `-1` = "no determination",
  .applies_to_vars = c("mft4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no determination",
  .applies_to_vars = c("mtsh2"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "na, see CMTSH2 & CMFT4", `-1` = "no determination",
  .applies_to_vars = c("mft3"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CMTSH2", `-1` = "no determination",
  .applies_to_vars = c("mft4"),
  .applies_to_waves = c("C")
)

.lasa_fc_865 <- .lasa_finalize_fc("865")

