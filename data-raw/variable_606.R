## LASA filecode 606 -- variable names, variable labels, value labels,
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
  tpces01 = "categorical",
  tpces06 = "categorical",
  tpces10 = "categorical",
  tpces14 = "categorical"
)

# define variable labels ----
variable_labels(
  tpces01 = "1. Last week: bothered",
  tpces06 = "6. Last week: depressed",
  tpces10 = "10. Last week: fearful",
  tpces14 = "14. Last week: lonely",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tpces01", "tpces06", "tpces10", "tpces14",
  .applies_to_waves = c("C", "D", "E")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("tpces01", "tpces06", "tpces10", "tpces14"),
  .applies_to_waves = c("Z", "C", "D", "E")
)

value_labels(
  `0` = "rarely or never", `1` = "some of the time", `2` = "occasionally", `3` = "mostly or always",
  .applies_to_vars = c("tpces01", "tpces06", "tpces10", "tpces14"),
  .applies_to_waves = c("Z", "C", "D", "E")
)

.lasa_fc_606 <- .lasa_finalize_fc("606")

