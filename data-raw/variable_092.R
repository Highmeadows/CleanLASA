## LASA filecode 092 -- variable names, variable labels, value labels,
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
  fademen = "categorical",
  fatreat = "categorical",
  modemen = "categorical",
  motreat = "categorical",
  rmpar = "categorical"
)

# define variable labels ----
variable_labels(
  fademen = "dementia father",
  fatreat = "treatment dementia father",
  modemen = "dementia mother",
  motreat = "treatment dementia mother",
  rmpar = "reason no valid data on parents",
  .applies_to_waves = c("Z")
)

variable_labels(
  "fademen", "fatreat", "modemen", "motreat", "rmpar",
  .applies_to_waves = c("D")
)

# define value labels ----
value_labels(
  `-3` = "na, wrong skip", `-2` = "not available, routing", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("fademen", "fatreat", "modemen", "motreat"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid score", `1` = "short version", `2` = "interview terminated",
  .applies_to_vars = c("rmpar"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see DRMPAR", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("fademen", "modemen"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see DFADEMEN", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("fatreat"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see DMODEMEN", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("motreat"),
  .applies_to_waves = c("D")
)

.lasa_fc_092 <- .lasa_finalize_fc("092")

