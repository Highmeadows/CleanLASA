## LASA filecode 123 -- variable names, variable labels, value labels,
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
  qdpq01 = "categorical",
  qdpq02 = "categorical",
  qdpq03 = "categorical",
  qdpq04 = "categorical",
  qdpq05 = "categorical",
  qdpq06 = "categorical",
  qdpq07 = "categorical",
  qdpq08 = "categorical",
  qdpq09 = "categorical",
  qdpq10 = "categorical",
  qdpq11 = "categorical",
  qdpq12 = "categorical",
  qdpq13 = "categorical",
  qdpq14 = "categorical",
  qdpq15 = "categorical",
  qdpq16 = "categorical",
  qdpq17 = "categorical",
  qdpq18 = "categorical",
  qdpq19 = "categorical",
  qdpq20 = "categorical",
  qdpq21 = "categorical",
  qdpq22 = "categorical",
  qdpq23 = "categorical",
  qdpq24 = "categorical",
  qdpq25 = "categorical"
)

# define variable labels ----
variable_labels(
  qdpq01 = "DPQ 01: bad temper",
  qdpq02 = "DPQ 02: wander off",
  qdpq03 = "DPQ 03: strangers",
  qdpq04 = "DPQ 04: control",
  qdpq05 = "DPQ 05: nervous",
  qdpq06 = "DPQ 06: people",
  qdpq07 = "DPQ 07: humour",
  qdpq08 = "DPQ 08: contact",
  qdpq09 = "DPQ 09: feeling down",
  qdpq10 = "DPQ 10: receptions",
  qdpq11 = "DPQ 11: small matters",
  qdpq12 = "DPQ 12: shy",
  qdpq13 = "DPQ 13: different",
  qdpq14 = "DPQ 14: new friends",
  qdpq15 = "DPQ 15: useless",
  qdpq16 = "DPQ 16: background",
  qdpq17 = "DPQ 17: tension",
  qdpq18 = "DPQ 18: influence",
  qdpq19 = "DPQ 19: regret",
  qdpq20 = "DPQ 20: restlessness",
  qdpq21 = "DPQ 21: surrounded",
  qdpq22 = "DPQ 22: hate",
  qdpq23 = "DPQ 23: shy 2",
  qdpq24 = "DPQ 24: difficult",
  qdpq25 = "DPQ 25: inconvenience",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qdpq01", "qdpq02", "qdpq03", "qdpq04", "qdpq05", "qdpq06", "qdpq07", "qdpq08", "qdpq09", "qdpq10", "qdpq11", "qdpq12", "qdpq13", "qdpq14", "qdpq15", "qdpq16", "qdpq17", "qdpq18", "qdpq19", "qdpq20", "qdpq21", "qdpq22", "qdpq23", "qdpq24", "qdpq25",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qdpq01", "qdpq02", "qdpq03", "qdpq04", "qdpq05", "qdpq06", "qdpq07", "qdpq08", "qdpq09", "qdpq10", "qdpq11", "qdpq12", "qdpq13", "qdpq14", "qdpq15", "qdpq16", "qdpq17", "qdpq18", "qdpq19", "qdpq20", "qdpq21", "qdpq22", "qdpq23", "qdpq24", "qdpq25"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "applicable", `2` = "?", `3` = "not applicable",
  .applies_to_vars = c("qdpq01", "qdpq02", "qdpq03", "qdpq04", "qdpq05", "qdpq06", "qdpq07", "qdpq08", "qdpq09", "qdpq10", "qdpq11", "qdpq12", "qdpq13", "qdpq14", "qdpq15", "qdpq16", "qdpq17", "qdpq18", "qdpq19", "qdpq20", "qdpq21", "qdpq22", "qdpq23", "qdpq24", "qdpq25"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "3B")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qdpq01", "qdpq02", "qdpq03", "qdpq04", "qdpq05", "qdpq06", "qdpq07", "qdpq08", "qdpq09", "qdpq10", "qdpq11", "qdpq12", "qdpq13", "qdpq14", "qdpq15", "qdpq16", "qdpq17", "qdpq18", "qdpq19", "qdpq20", "qdpq21", "qdpq22", "qdpq23", "qdpq24", "qdpq25"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B")
)

.lasa_fc_123 <- .lasa_finalize_fc("123")

