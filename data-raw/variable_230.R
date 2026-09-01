## LASA filecode 230 -- variable names, variable labels, value labels,
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
  flwd6 = "categorical",
  flwd7 = "categorical",
  flwdiff = "categorical"
)

# define variable labels ----
variable_labels(
  flwd6 = "Functional limitations with difficulties, 6-item score",
  flwd7 = "Functional limitations with difficulties, 7-item score",
  flwdiff = "Functional limitations with difficulties, 3-item score",
  .applies_to_waves = c("Z")
)

variable_labels(
  flwdiff = "functional limitations, with difficulties #3",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  flwd6 = "functional limitations, with difficulties #6",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  flwd7 = "functional limitations, with difficulties #7",
  .applies_to_waves = c("2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "no valid data", `0` = "no difficulties", `1` = "5 without difficulty", `2` = "4 without difficulty", `3` = "3 without difficulty", `4` = "2 without difficulty", `5` = "1 without difficulty", `6` = "all with difficulty",
  .applies_to_vars = c("flwd6"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "no valid data", `0` = "no difficulties", `1` = "6 without difficulty", `2` = "5 without difficulty", `3` = "4 without difficulty", `4` = "3 without difficulty", `5` = "2 without difficulty", `6` = "1 without difficulty", `7` = "all with difficulty",
  .applies_to_vars = c("flwd7"),
  .applies_to_waves = c("Z", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "no valid data", `0` = "no difficulties", `1` = "2 without difficulty", `2` = "1 without difficulty", `3` = "all with difficulty",
  .applies_to_vars = c("flwdiff"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

.lasa_fc_230 <- .lasa_finalize_fc("230")

