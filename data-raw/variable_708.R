## LASA filecode 708 -- variable names, variable labels, value labels,
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
  trrel09 = "categorical",
  trrel10 = "categorical"
)

# define variable labels ----
variable_labels(
  trrel09 = "Influences daily life",
  trrel10 = "Role in important decisions",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trrel09", "trrel10",
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-1` = "na, asked", `1` = "strongly agree", `2` = "agree", `3` = "no agreement/no disagreement", `4` = "disagree", `5` = "strongly disagree",
  .applies_to_vars = c("trrel09", "trrel10"),
  .applies_to_waves = c("Z", "C")
)

.lasa_fc_708 <- .lasa_finalize_fc("708")

