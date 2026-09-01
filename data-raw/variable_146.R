## LASA filecode 146 -- variable names, variable labels, value labels,
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
  qdecf01 = "categorical",
  qdecf02 = "categorical",
  qdecf03 = "categorical",
  qdecf04 = "categorical",
  qdecf05 = "categorical",
  qdecf06 = "categorical",
  qdecf07 = "categorical",
  qdecf08 = "categorical",
  qdecf09 = "categorical",
  qdecf10 = "categorical",
  qdecf11 = "categorical"
)

# define variable labels ----
variable_labels(
  qdecf01 = "if I die, I hope: not to be dependent upon others",
  qdecf02 = "if I die, I hope: to self decide about treatment",
  qdecf03 = "if I die, I hope: to receive help from family",
  qdecf04 = "if I die, I hope: to receive help from volunteers or caretakers",
  qdecf05 = "if I die, I hope: not to be alone",
  qdecf06 = "if I die, I hope: to self decide about moment of dying",
  qdecf07 = "if I die, I hope: to be at home",
  qdecf08 = "if I die, I hope: to be in a hospice",
  qdecf09 = "if I die, I hope: to be in a nursing home",
  qdecf10 = "if I die, I hope: to be in a hospital",
  qdecf11 = "if I die, I hope: something else",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qdecf01", "qdecf02", "qdecf03", "qdecf04", "qdecf05", "qdecf06", "qdecf07", "qdecf08", "qdecf09", "qdecf10", "qdecf11",
  .applies_to_waves = c("F")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qdecf01", "qdecf02", "qdecf03", "qdecf04", "qdecf05", "qdecf06", "qdecf07", "qdecf08", "qdecf09", "qdecf10", "qdecf11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qdecf01", "qdecf02", "qdecf03", "qdecf04", "qdecf05", "qdecf06", "qdecf07", "qdecf08", "qdecf09", "qdecf10"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qdecf11"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qdecf01", "qdecf02", "qdecf03", "qdecf04", "qdecf05", "qdecf06", "qdecf07", "qdecf08", "qdecf09", "qdecf10", "qdecf11"),
  .applies_to_waves = c("F")
)

.lasa_fc_146 <- .lasa_finalize_fc("146")

