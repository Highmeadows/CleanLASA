## LASA filecode 132 -- variable names, variable labels, value labels,
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
  qfioe01 = "categorical",
  qfioe02 = "categorical",
  qfioe03 = "categorical",
  qfioe04 = "categorical",
  qfioe05 = "categorical",
  qfioe06 = "categorical",
  qfioe07 = "categorical",
  qfioe08 = "categorical",
  qfioe09 = "categorical",
  qfioe10 = "categorical",
  qfioe11 = "categorical",
  qfioe12 = "categorical",
  qfioe13 = "categorical",
  qfioe14 = "categorical",
  qfioe15 = "categorical",
  qfioe16 = "categorical"
)

# define variable labels ----
variable_labels(
  qfioe01 = "Fil Obl Exp 01: live",
  qfioe02 = "Fil Obl Exp 02: sick",
  qfioe03 = "Fil Obl Exp 03: financial",
  qfioe04 = "Fil Obl Exp 04: visit",
  qfioe05 = "Fil Obl Exp 05: phone",
  qfioe06 = "Fil Obl Exp 06: responsible",
  qfioe07 = "Fil Obl Exp 07: together",
  qfioe08 = "Fil Obl Exp 08: personal",
  qfioe09 = "Fil Obl Exp 09: support",
  qfioe10 = "Fil Obl Exp 10: time",
  qfioe11 = "Fil Obl Exp 11: need",
  qfioe12 = "Fil Obl Exp 12: advise",
  qfioe13 = "Fil Obl Exp 13: work",
  qfioe14 = "Fil Obl Exp 14: check",
  qfioe15 = "Fil Obl Exp 15: help",
  qfioe16 = "Fil Obl Exp 16: care",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qfioe01", "qfioe02", "qfioe03", "qfioe04", "qfioe05", "qfioe06", "qfioe07", "qfioe08", "qfioe09", "qfioe10", "qfioe11", "qfioe12", "qfioe13", "qfioe14", "qfioe15", "qfioe16",
  .applies_to_waves = c("D", "E", "J")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qfioe01", "qfioe02", "qfioe03", "qfioe04", "qfioe05", "qfioe06", "qfioe07", "qfioe08", "qfioe09", "qfioe10", "qfioe11", "qfioe12", "qfioe13", "qfioe14", "qfioe15", "qfioe16"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qfioe01", "qfioe02", "qfioe03", "qfioe04", "qfioe05", "qfioe06", "qfioe07", "qfioe08", "qfioe09", "qfioe10", "qfioe11", "qfioe12", "qfioe13", "qfioe14", "qfioe15", "qfioe16"),
  .applies_to_waves = c("Z", "D", "E", "J")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qfioe01", "qfioe02", "qfioe03", "qfioe04", "qfioe05", "qfioe06", "qfioe07", "qfioe08", "qfioe09", "qfioe10", "qfioe11", "qfioe12", "qfioe13", "qfioe14", "qfioe15", "qfioe16"),
  .applies_to_waves = c("D", "E", "J")
)

.lasa_fc_132 <- .lasa_finalize_fc("132")

