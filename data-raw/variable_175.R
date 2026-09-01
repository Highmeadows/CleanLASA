## LASA filecode 175 -- variable names, variable labels, value labels,
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
  mnh01 = "categorical",
  mnh02 = "categorical",
  mnh03 = "categorical",
  mnh04 = "categorical",
  mnh05 = "categorical",
  mnh06 = "categorical",
  mnh07 = "categorical",
  mnh08 = "categorical",
  mnh09 = "categorical"
)

# define variable labels ----
variable_labels(
  mnh01 = "Good quality nursing homes in Netherlands",
  mnh02 = "Enough privacy in nursing home",
  mnh03 = "Residents spend little to no time outside nursing home",
  mnh04 = "Fun being together with other residents of nursing home",
  mnh05 = "Control over toilet visits in nursing home",
  mnh06 = "Residents nursing home barely get visitors",
  mnh07 = "Treated with respect by staff nursing home",
  mnh08 = "Control over when to wake up in nursing home",
  mnh09 = "Good conversations with residents of nursing home",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mnh01", "mnh02", "mnh03", "mnh04", "mnh05", "mnh06", "mnh07", "mnh08", "mnh09",
  .applies_to_waves = c("J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mnh01", "mnh02", "mnh03", "mnh04", "mnh05", "mnh06", "mnh07", "mnh08", "mnh09"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `1` = "completely disagree", `2` = "disagree", `3` = "do not agree/disagree", `4` = "agree", `5` = "completely agree",
  .applies_to_vars = c("mnh01", "mnh02", "mnh03", "mnh04", "mnh05", "mnh06", "mnh07", "mnh08", "mnh09"),
  .applies_to_waves = c("Z", "J", "K")
)

.lasa_fc_175 <- .lasa_finalize_fc("175")

