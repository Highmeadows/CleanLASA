## LASA filecode 120 -- variable names, variable labels, value labels,
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
  qsex01 = "categorical",
  qsex02 = "categorical",
  qsex03 = "categorical",
  qsex04 = "categorical",
  qsex05 = "categorical"
)

# define variable labels ----
variable_labels(
  qsex01 = "sexual life 01: evaluation past",
  qsex02 = "sexual life 02: importance present",
  qsex03 = "sexual life 03: evaluation present",
  qsex04 = "sexual life 04: not important at this age",
  qsex05 = "sexual life 5: need for intimacy",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qsex01",
  .applies_to_waves = c("B", "E", "2B", "3B")
)

variable_labels(
  "qsex02", "qsex03",
  .applies_to_waves = c("B", "E", "2B", "F", "3B")
)

variable_labels(
  "qsex04", "qsex05",
  .applies_to_waves = c("E", "F")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "very unpleasant", `2` = "unpleasant", `3` = "not unpleasant/pleasant", `4` = "pleasant", `5` = "very pleasant",
  .applies_to_vars = c("qsex01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "very unimportant", `2` = "unimportant", `3` = "not unimportant/important", `4` = "important", `5` = "very important",
  .applies_to_vars = c("qsex02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "very unpleasant", `2` = "unpleasant", `3` = "not unpleasant/pleasant", `4` = "pleasant", `5` = "very pleasant", `6` = "not applicable",
  .applies_to_vars = c("qsex03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qsex04", "qsex05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "very unpleasant", `2` = "unpleasant", `3` = "not unpleasant/pleasant", `4` = "pleasant", `5` = "very pleasant",
  .applies_to_vars = c("qsex01"),
  .applies_to_waves = c("B", "E", "2B", "3B")
)

value_labels(
  `-1` = "no answer", `1` = "very unimportant", `2` = "unimportant", `3` = "not unimportant/important", `4` = "important", `5` = "very important",
  .applies_to_vars = c("qsex02"),
  .applies_to_waves = c("B", "E", "2B", "F", "3B")
)

value_labels(
  `-1` = "no answer", `1` = "very unpleasant", `2` = "unpleasant", `3` = "not unpleasant/pleasant", `4` = "pleasant", `5` = "very pleasant", `6` = "not applicable",
  .applies_to_vars = c("qsex03"),
  .applies_to_waves = c("B", "E", "2B", "F", "3B")
)

value_labels(
  `-1` = "no answer", `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qsex04", "qsex05"),
  .applies_to_waves = c("E", "F")
)

.lasa_fc_120 <- .lasa_finalize_fc("120")

