## LASA filecode 137 -- variable names, variable labels, value labels,
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
  qvall01 = "categorical",
  qvall02 = "categorical",
  qvall03 = "categorical",
  qvall04 = "categorical",
  qvall05 = "categorical",
  qvall06 = "categorical",
  qvall07 = "categorical",
  qvall08 = "categorical",
  qvall09 = "categorical",
  qvall10 = "categorical",
  qvall11 = "categorical",
  qvall12 = "categorical",
  qvall13 = "categorical",
  qvall14 = "categorical",
  qvall15 = "categorical",
  qvall16 = "categorical",
  qvall17 = "categorical",
  qvall18 = "categorical",
  qvall19 = "categorical"
)

# define variable labels ----
variable_labels(
  qvall01 = "Value of late life 01: difficult",
  qvall02 = "Value of late life 02: much",
  qvall03 = "Value of late life 03: daily basis",
  qvall04 = "Value of late life 04: lifeaims",
  qvall05 = "Value of late life 05: useful",
  qvall06 = "Value of late life 06: important",
  qvall07 = "Value of late life 07: attain",
  qvall08 = "Value of late life 08: plans",
  qvall09 = "Value of late life 09: many ways",
  qvall10 = "Value of late life 10: problems",
  qvall11 = "Value of late life 11: positive",
  qvall12 = "Value of late life 12: hopeful",
  qvall13 = "Value of late life 13: give up",
  qvall14 = "Value of late life 14: strong will",
  qvall15 = "Value of late life 15: enjoy",
  qvall16 = "Value of late life 16: best",
  qvall17 = "Value of late life 17: ethical",
  qvall18 = "Value of late life 18: make sense",
  qvall19 = "Value of late life 19: few aims",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qvall01", "qvall04", "qvall06", "qvall07", "qvall10", "qvall11", "qvall13", "qvall14", "qvall15", "qvall16", "qvall18", "qvall19",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  "qvall02", "qvall03", "qvall05", "qvall08", "qvall09", "qvall12", "qvall17",
  .applies_to_waves = c("E")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qvall01", "qvall02", "qvall03", "qvall04", "qvall05", "qvall06", "qvall07", "qvall08", "qvall09", "qvall10", "qvall11", "qvall12", "qvall13", "qvall14", "qvall15", "qvall16", "qvall17", "qvall18", "qvall19"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly agree", `2` = "agree", `3` = "no agreement/disagreement", `4` = "disagree", `5` = "strongly disagree",
  .applies_to_vars = c("qvall01", "qvall02", "qvall03", "qvall04", "qvall05", "qvall06", "qvall07", "qvall08", "qvall09", "qvall10", "qvall11", "qvall12", "qvall13", "qvall14", "qvall15", "qvall16", "qvall17", "qvall18", "qvall19"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "strongly agree", `2` = "agree", `3` = "no agreement/disagreement", `4` = "disagree", `5` = "strongly disagree",
  .applies_to_vars = c("qvall01", "qvall04", "qvall06", "qvall07", "qvall10", "qvall11", "qvall13", "qvall14", "qvall15", "qvall16", "qvall18", "qvall19"),
  .applies_to_waves = c("E", "F")
)

value_labels(
  `-1` = "no answer", `1` = "strongly agree", `2` = "agree", `3` = "no agreement/disagreement", `4` = "disagree", `5` = "strongly disagree",
  .applies_to_vars = c("qvall02", "qvall03", "qvall05", "qvall08", "qvall09", "qvall12", "qvall17"),
  .applies_to_waves = c("E")
)

.lasa_fc_137 <- .lasa_finalize_fc("137")

