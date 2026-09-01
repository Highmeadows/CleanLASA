## LASA filecode 127 -- variable names, variable labels, value labels,
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
  qeol07 = "categorical",
  qeol08 = "categorical",
  qeol09 = "categorical",
  qeol10 = "categorical",
  qeol11 = "categorical"
)

# define variable labels ----
variable_labels(
  qeol07 = "ever death thoughts",
  qeol08 = "ever death wishes",
  qeol09 = "feelings towards living past week",
  qeol10 = "feelings towards dying past week",
  qeol11 = "feelings towards reasons for living/dying",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qeol07", "qeol08", "qeol09", "qeol10", "qeol11",
  .applies_to_waves = c("I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("qeol07", "qeol08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "a moderate to strong wish to live", `2` = "a weak wish to live", `3` = "no wish to live",
  .applies_to_vars = c("qeol09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "no wish to die", `2` = "a weak wish to die", `3` = "a moderate to strong wish to die",
  .applies_to_vars = c("qeol10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "for living outweigh those for dying", `2` = "about equal", `3` = "for dying outweigh those for living",
  .applies_to_vars = c("qeol11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("qeol07", "qeol08", "qeol09", "qeol10", "qeol11"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("qeol07", "qeol08"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `1` = "a moderate to strong wish to live", `2` = "a weak wish to live", `3` = "no wish to live",
  .applies_to_vars = c("qeol09"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `1` = "no wish to die", `2` = "a weak wish to die", `3` = "a moderate to strong wish to die",
  .applies_to_vars = c("qeol10"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `1` = "for living outweigh those for dying", `2` = "about equal", `3` = "for dying outweigh those for living",
  .applies_to_vars = c("qeol11"),
  .applies_to_waves = c("I", "J", "K")
)

.lasa_fc_127 <- .lasa_finalize_fc("127")

