## LASA filecode 135 -- variable names, variable labels, value labels,
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
  qeq5d1 = "categorical",
  qeq5d2 = "categorical",
  qeq5d3 = "categorical",
  qeq5d4 = "categorical",
  qeq5d5 = "categorical",
  qeqvas = "numeric"
)

# define variable labels ----
variable_labels(
  qeq5d1 = "EQ5D1: Mobility",
  qeq5d2 = "EQ5D2: Self-care",
  qeq5d3 = "EQ5D3: Usual activities",
  qeq5d4 = "EQ5D4: Pain/discomfort",
  qeq5d5 = "EQ5D5: Anxiety/depression",
  qeqvas = "EQVAS: Self-rated health (scale)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qeq5d1", "qeq5d2", "qeq5d3", "qeq5d4", "qeq5d5", "qeqvas",
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "no problems walking", `2` = "some problems walking", `3` = "confined to bed",
  .applies_to_vars = c("qeq5d1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "no problems washing/dressing", `2` = "some problems washing/dressing", `3` = "unable to wash/dress",
  .applies_to_vars = c("qeq5d2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "no problems usual activities", `2` = "some problems usual activities", `3` = "unable to perform usual activities",
  .applies_to_vars = c("qeq5d3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "no pain/discomfort", `2` = "moderate pain/discomfort", `3` = "extreme pain/discomfort",
  .applies_to_vars = c("qeq5d4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "not anxious/depressed", `2` = "moderately anxious/depressed", `3` = "extreme anxious/depressed",
  .applies_to_vars = c("qeq5d5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `0` = NA_character_, `100` = NA_character_,
  .applies_to_vars = c("qeqvas"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qeq5d1", "qeq5d2", "qeq5d3", "qeq5d4", "qeq5d5", "qeqvas"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I")
)

value_labels(
  `1` = "no problems walking", `2` = "some problems walking", `3` = "confined to bed",
  .applies_to_vars = c("qeq5d1"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I")
)

value_labels(
  `1` = "no problems washing/dressing", `2` = "some problems washing/dressing", `3` = "unable to wash/dress",
  .applies_to_vars = c("qeq5d2"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I")
)

value_labels(
  `1` = "no problems usual activities", `2` = "some problems usual activities", `3` = "unable to perform usual activities",
  .applies_to_vars = c("qeq5d3"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I")
)

value_labels(
  `1` = "no pain/discomfort", `2` = "moderate pain/discomfort", `3` = "extreme pain/discomfort",
  .applies_to_vars = c("qeq5d4"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I")
)

value_labels(
  `1` = "not anxious/depressed", `2` = "moderately anxious/depressed", `3` = "extreme anxious/depressed",
  .applies_to_vars = c("qeq5d5"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I")
)

value_labels(
  `0` = NA_character_, `100` = NA_character_,
  .applies_to_vars = c("qeqvas"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I")
)

.lasa_fc_135 <- .lasa_finalize_fc("135")

