## LASA filecode 020 -- variable names, variable labels, value labels,
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
  dsb01 = "numeric",
  dsb02 = "numeric",
  dsb03 = "numeric",
  dsb04 = "numeric",
  dsb05 = "numeric",
  dsb06 = "numeric",
  dsb07 = "numeric",
  dsf01 = "numeric",
  dsf02 = "numeric",
  dsf03 = "numeric",
  dsf04 = "numeric",
  dsf05 = "numeric",
  dsf06 = "numeric",
  dsf07 = "numeric",
  dsf08 = "numeric"
)

# define variable labels ----
variable_labels(
  dsb01 = "Digit Span backwards: 2 numbers, attempt 1+2",
  dsb02 = "Digit Span backwards: 3 numbers, attempt 1+2",
  dsb03 = "Digit Span backwards: 4 numbers, attempt 1+2",
  dsb04 = "Digit Span backwards: 5 numbers, attempt 1+2",
  dsb05 = "Digit Span backwards: 6 numbers, attempt 1+2",
  dsb06 = "Digit Span backwards: 7 numbers, attempt 1+2",
  dsb07 = "Digit Span backwards: 8 numbers, attempt 1+2",
  dsf01 = "Digit Span forwards: 2 numbers, attempt 1+2",
  dsf02 = "Digit Span forwards: 3 numbers, attempt 1+2",
  dsf03 = "Digit Span forwards: 4 numbers, attempt 1+2",
  dsf04 = "Digit Span forwards: 5 numbers, attempt 1+2",
  dsf05 = "Digit Span forwards: 6 numbers, attempt 1+2",
  dsf06 = "Digit Span forwards: 7 numbers, attempt 1+2",
  dsf07 = "Digit Span forwards: 8 numbers, attempt 1+2",
  dsf08 = "Digit Span forwards: 9 numbers, attempt 1+2",
  .applies_to_waves = c("Z")
)

variable_labels(
  "dsb01", "dsb02", "dsb03", "dsb04", "dsb05", "dsb06", "dsb07", "dsf01", "dsf02", "dsf03", "dsf04", "dsf05", "dsf06", "dsf07", "dsf08",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-3` = "not available, routing", `-2` = "not available, previous answers incorrect", `-1` = "not available, test broken off",
  .applies_to_vars = c("dsb01", "dsb02", "dsb03", "dsb04", "dsb05", "dsb06", "dsb07", "dsf01", "dsf02", "dsf03", "dsf04", "dsf05", "dsf06", "dsf07", "dsf08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "0 correct", `1` = "1 correct", `2` = "2 correct",
  .applies_to_vars = c("dsb01", "dsb02", "dsb03", "dsb04", "dsb05", "dsb06", "dsb07", "dsf01", "dsf02", "dsf03", "dsf04", "dsf05", "dsf06", "dsf07", "dsf08"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-3` = "na, see BRMDS", `-2` = "na, previous answers incorrect", `-1` = "test broken off",
  .applies_to_vars = c("dsb01", "dsb02", "dsb03", "dsb04", "dsb05", "dsb06", "dsb07", "dsf01", "dsf02", "dsf03", "dsf04", "dsf05", "dsf06", "dsf07", "dsf08"),
  .applies_to_waves = c("3B")
)

.lasa_fc_020 <- .lasa_finalize_fc("020")

