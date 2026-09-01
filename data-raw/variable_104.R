## LASA filecode 104 -- variable names, variable labels, value labels,
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
  qpss01 = "categorical",
  qpss02 = "categorical",
  qpss03 = "categorical",
  qpss04 = "categorical",
  qpss05 = "categorical",
  qpss06 = "categorical",
  qpss07 = "categorical",
  qpss08 = "categorical",
  qpss09 = "categorical",
  qpss10 = "categorical"
)

# define variable labels ----
variable_labels(
  qpss01 = "upset because something unexpected",
  qpss02 = "felt unable to control things",
  qpss03 = "felt nervous and stressed",
  qpss04 = "felt confident",
  qpss05 = "felt things going your way",
  qpss06 = "felt could not cope with things",
  qpss07 = "been able to control irritations",
  qpss08 = "felt on top of things",
  qpss09 = "angered because things outside control",
  qpss10 = "felt difficulties piling up",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qpss01", "qpss02", "qpss03", "qpss04", "qpss05", "qpss06", "qpss07", "qpss08", "qpss09", "qpss10",
  .applies_to_waves = c("H", "3B")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("qpss01", "qpss02", "qpss03", "qpss04", "qpss05", "qpss06", "qpss07", "qpss08", "qpss09", "qpss10"),
  .applies_to_waves = c("Z", "H", "3B")
)

value_labels(
  `0` = "never", `1` = "almost never", `2` = "sometimes", `3` = "often", `4` = "very often",
  .applies_to_vars = c("qpss01", "qpss02", "qpss03", "qpss04", "qpss05", "qpss06", "qpss07", "qpss08", "qpss09", "qpss10"),
  .applies_to_waves = c("Z", "H", "3B")
)

.lasa_fc_104 <- .lasa_finalize_fc("104")

