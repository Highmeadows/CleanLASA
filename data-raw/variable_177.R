## LASA filecode 177 -- variable names, variable labels, value labels,
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
  mwvg01 = "categorical",
  mwvg02 = "categorical",
  mwvg03 = "categorical",
  mwvg04 = "categorical",
  mwvg05 = "categorical",
  mwvg06 = "categorical",
  mwvg07 = "categorical",
  mwvg08 = "categorical",
  mwvg09 = "categorical",
  mwvg10 = "categorical",
  mwvg11 = "categorical"
)

# define variable labels ----
variable_labels(
  mwvg01 = "WVG 01: Walking frame",
  mwvg02 = "WVG 02: Wheelchair",
  mwvg03 = "WVG 03: Mobility scooter, adjusted bicycle",
  mwvg04 = "WVG 04: Taxi pass",
  mwvg05 = "WVG 05: Car adjustment",
  mwvg06 = "WVG 06: Transport compensation",
  mwvg07 = "WVG 07: Disabled parking permit",
  mwvg08 = "WVG 08: Personal alarm",
  mwvg09 = "WVG 09: Meals on wheels",
  mwvg10 = "WVG 10: Handyman",
  mwvg11 = "WVG 11: Grocery shopping service",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mwvg01",
  .applies_to_waves = c("G", "H", "I", "J")
)

variable_labels(
  "mwvg02", "mwvg03", "mwvg05", "mwvg06", "mwvg07",
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

variable_labels(
  "mwvg04", "mwvg08", "mwvg09", "mwvg10",
  .applies_to_waves = c("G", "H")
)

variable_labels(
  "mwvg11",
  .applies_to_waves = c("G", "H", "I")
)

# define value labels ----
value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no",
  .applies_to_vars = c("mwvg01", "mwvg02", "mwvg03", "mwvg04", "mwvg05", "mwvg06", "mwvg07", "mwvg08", "mwvg09", "mwvg10", "mwvg11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mwvg01", "mwvg02", "mwvg03", "mwvg04", "mwvg05", "mwvg06", "mwvg07", "mwvg08", "mwvg09", "mwvg10", "mwvg11"),
  .applies_to_waves = c("G")
)

value_labels(
  `-1` = "na, asked", `1` = "own and use", `2` = "own, no use", `3` = "no",
  .applies_to_vars = c("mwvg01"),
  .applies_to_waves = c("H", "I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "own and use", `2` = "own, no use", `3` = "no",
  .applies_to_vars = c("mwvg02", "mwvg03", "mwvg05", "mwvg06", "mwvg07"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "own and use", `2` = "own, no use", `3` = "no",
  .applies_to_vars = c("mwvg04", "mwvg08", "mwvg09", "mwvg10"),
  .applies_to_waves = c("H")
)

value_labels(
  `-1` = "na, asked", `1` = "own and use", `2` = "own, no use", `3` = "no",
  .applies_to_vars = c("mwvg11"),
  .applies_to_waves = c("H", "I")
)

.lasa_fc_177 <- .lasa_finalize_fc("177")

