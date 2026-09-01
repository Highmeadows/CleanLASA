## LASA filecode 111 -- variable names, variable labels, value labels,
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
  qhumor1 = "categorical",
  qhumor2 = "categorical",
  qhumor3 = "categorical",
  qhumor4 = "categorical",
  qhumor5 = "categorical"
)

# define variable labels ----
variable_labels(
  qhumor1 = "Humor 1: less problems (+)",
  qhumor2 = "Humor 2: tense situation (+)",
  qhumor3 = "Humor 3: cry/laugh (+)",
  qhumor4 = "Humor 4: joke (+)",
  qhumor5 = "Humor 5: efficient (+)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qhumor1", "qhumor2", "qhumor3", "qhumor4", "qhumor5",
  .applies_to_waves = c("B", "D")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "strongly disagree", `2` = "disagree", `3` = "neither agree nor disagree", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qhumor1", "qhumor2", "qhumor3", "qhumor4", "qhumor5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qhumor1", "qhumor2", "qhumor3", "qhumor4", "qhumor5"),
  .applies_to_waves = c("B", "D")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qhumor1", "qhumor2", "qhumor3", "qhumor4", "qhumor5"),
  .applies_to_waves = c("B", "D")
)

.lasa_fc_111 <- .lasa_finalize_fc("111")

