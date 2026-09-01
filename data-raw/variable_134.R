## LASA filecode 134 -- variable names, variable labels, value labels,
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
  qbwght = "numeric",
  qbwghts = "categorical",
  qbwghtw = "categorical"
)

# define variable labels ----
variable_labels(
  qbwght = "weight at birth in grams",
  qbwghts = "weight at birth in grams: source",
  qbwghtw = "weight at birth in grams: which source",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qbwght", "qbwghts",
  .applies_to_waves = c("E", "2B", "3B")
)

variable_labels(
  "qbwghtw",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qbwght"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "checked in documentation", `2` = "known without check", `3` = "estimation",
  .applies_to_vars = c("qbwghts"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "birth certificate", `2` = "birth announcement card", `3` = "baby book", `4` = "other",
  .applies_to_vars = c("qbwghtw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qbwght"),
  .applies_to_waves = c("E", "2B", "3B")
)

value_labels(
  `-1` = "no answer", `1` = "checked in documentation", `2` = "known without check", `3` = "estimation",
  .applies_to_vars = c("qbwghts"),
  .applies_to_waves = c("E", "2B", "3B")
)

value_labels(
  `-1` = "no answer", `1` = "birth certificate", `2` = "birth announcement card", `3` = "baby book", `4` = "other",
  .applies_to_vars = c("qbwghtw"),
  .applies_to_waves = c("3B")
)

.lasa_fc_134 <- .lasa_finalize_fc("134")

