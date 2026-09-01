## LASA filecode 112 -- variable names, variable labels, value labels,
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
  maid1 = "categorical",
  maid2 = "categorical",
  maid4 = "categorical",
  maid6 = "categorical",
  maid7 = "categorical",
  maid9 = "categorical",
  qaid1 = "categorical",
  qaid2 = "categorical",
  qaid3 = "categorical",
  qaid4 = "categorical",
  qaid5 = "categorical",
  qaid6 = "categorical",
  qaid7 = "categorical",
  qaid8 = "categorical",
  qaid9 = "categorical"
)

# define variable labels ----
variable_labels(
  maid1 = "Assistance 1: professional",
  maid2 = "Assistance 2: children",
  maid4 = "Assistance 4: independent",
  maid6 = "Assistance 6: personal",
  maid7 = "Assistance 7: official services",
  maid9 = "Assistance 9: too often appeal",
  qaid1 = "Assistance 1: professional",
  qaid2 = "Assistance 2: children",
  qaid3 = "Assistance 3: do not pay",
  qaid4 = "Assistance 4: independent",
  qaid5 = "Assistance 5: burden",
  qaid6 = "Assistance 6: personal",
  qaid7 = "Assistance 7: official services",
  qaid8 = "Assistance 8: long waiting",
  qaid9 = "Assistance 9: too often appeal",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qaid1", "qaid2", "qaid4", "qaid6", "qaid7",
  .applies_to_waves = c("B", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "qaid3", "qaid5", "qaid8",
  .applies_to_waves = c("B", "2B", "F")
)

variable_labels(
  "qaid9",
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "maid1", "maid2", "maid4", "maid6", "maid7", "maid9",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("maid1", "maid2", "maid4", "maid6", "maid7", "maid9", "qaid1", "qaid2", "qaid3", "qaid4", "qaid5", "qaid6", "qaid7", "qaid8", "qaid9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, interview terminated", `1` = "strongly disagree", `2` = "disagree", `3` = "neither agree nor disagree", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("maid1", "maid2", "maid4", "maid6", "maid7", "maid9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "neither agree nor disagree", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qaid1", "qaid2", "qaid3", "qaid4", "qaid5", "qaid6", "qaid7", "qaid8", "qaid9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qaid1", "qaid2", "qaid3", "qaid4", "qaid5", "qaid6", "qaid7", "qaid8"),
  .applies_to_waves = c("B", "2B", "F")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qaid1", "qaid2", "qaid3", "qaid4", "qaid5", "qaid6", "qaid7", "qaid8"),
  .applies_to_waves = c("B", "2B", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qaid1", "qaid2", "qaid4", "qaid6", "qaid7", "qaid9"),
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, interview broken off", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("maid1", "maid2", "maid4", "maid6", "maid7", "maid9"),
  .applies_to_waves = c("MB")
)

.lasa_fc_112 <- .lasa_finalize_fc("112")

