## LASA filecode 036 -- variable names, variable labels, value labels,
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
  subhea1 = "categorical",
  subhea2 = "categorical",
  subhea3 = "categorical",
  subhea4 = "categorical"
)

# define variable labels ----
variable_labels(
  subhea1 = "Self-perceived health",
  subhea2 = "Self-perceived health compared to age peers",
  subhea3 = "Self-perceived health compared to 10 years ago",
  subhea4 = "Self-perceived health 3 (or 4) years ago",
  .applies_to_waves = c("Z")
)

variable_labels(
  "subhea1", "subhea2",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "subhea3",
  .applies_to_waves = c("2B")
)

variable_labels(
  "subhea4",
  .applies_to_waves = c("F", "G", "H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-5` = "not available, interview terminated", `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "sometimes good/bad", `5` = "poor",
  .applies_to_vars = c("subhea1", "subhea4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `-1` = "na, asked", `1` = "much better", `2` = "a little better", `3` = "do not know/just as good", `4` = "a little worse", `5` = "much worse",
  .applies_to_vars = c("subhea2", "subhea3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "sometimes good/bad", `5` = "poor",
  .applies_to_vars = c("subhea1"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "much better", `2` = "a little better", `3` = "do not know/just as good", `4` = "a little worse", `5` = "much worse",
  .applies_to_vars = c("subhea2"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "much better", `2` = "a little better", `3` = "do not know/just as good", `4` = "a little worse", `5` = "much worse",
  .applies_to_vars = c("subhea3"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "much better", `2` = "a little better", `3` = "do not know/just as good as other", `4` = "a little worse", `5` = "much worse",
  .applies_to_vars = c("subhea2"),
  .applies_to_waves = c("F", "G", "H", "I", "J", "K")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "sometimes good/bad", `5` = "poor",
  .applies_to_vars = c("subhea4"),
  .applies_to_waves = c("F", "G", "H", "I", "J", "K")
)

.lasa_fc_036 <- .lasa_finalize_fc("036")

