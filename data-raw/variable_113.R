## LASA filecode 113 -- variable names, variable labels, value labels,
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
  qhealt1 = "categorical",
  qhealt2 = "categorical",
  qhealt3 = "categorical",
  qhealt4 = "categorical",
  qhealt5 = "categorical",
  qhealt6 = "categorical",
  qhealt7 = "categorical",
  qhealt8 = "categorical"
)

# define variable labels ----
variable_labels(
  qhealt1 = "Health 1: sick in future",
  qhealt2 = "Health 2: somewhat ill",
  qhealt3 = "Health 3: better health",
  qhealt4 = "Health 4: equal health",
  qhealt5 = "Health 5: less healthy",
  qhealt6 = "Health 6: excellent",
  qhealt7 = "Health 7: healthy life",
  qhealt8 = "Health 8: feeling bad",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qhealt1", "qhealt2", "qhealt3", "qhealt4", "qhealt5", "qhealt6", "qhealt7", "qhealt8",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "strongly disagree", `2` = "disagree", `3` = "neither agree nor disagree", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qhealt1", "qhealt2", "qhealt3", "qhealt4", "qhealt5", "qhealt6", "qhealt7", "qhealt8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qhealt1", "qhealt2", "qhealt3", "qhealt4", "qhealt5", "qhealt6", "qhealt7", "qhealt8"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qhealt1", "qhealt2", "qhealt3", "qhealt4", "qhealt5", "qhealt6", "qhealt7", "qhealt8"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

.lasa_fc_113 <- .lasa_finalize_fc("113")

