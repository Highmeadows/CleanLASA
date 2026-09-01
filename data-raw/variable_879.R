## LASA filecode 879 -- variable names, variable labels, value labels,
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
  madipo = "numeric",
  mghrel = "numeric",
  mlepti = "numeric",
  mrm879 = "categorical"
)

# define variable labels ----
variable_labels(
  madipo = "HMW adiponectin (ug/mL)",
  mghrel = "ghrelin (ng/L - lower limit <240 ng/L)",
  mlepti = "leptin (ug/L)",
  mrm879 = "remarks file LASAG879",
  .applies_to_waves = c("Z")
)

variable_labels(
  madipo = "HMW adiponectine (ug/mL)",
  mghrel = "ghreline (ng/L - lower limit <240 ng/L)",
  mlepti = "leptine (ug/L)",
  mrm879 = "remarks file lasag879",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `-2` = "see MRM879",
  .applies_to_vars = c("madipo", "mghrel", "mlepti"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "data", `1` = "no determination / no blood sample available", `2` = "haemolytic", `3` = "too little material",
  .applies_to_vars = c("mrm879"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-2` = "see GMRM879",
  .applies_to_vars = c("madipo", "mghrel", "mlepti"),
  .applies_to_waves = c("G")
)

.lasa_fc_879 <- .lasa_finalize_fc("879")

