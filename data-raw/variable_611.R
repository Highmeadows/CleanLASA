## LASA filecode 611 -- variable names, variable labels, value labels,
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
  tpwvg01 = "categorical",
  tpwvg02 = "categorical",
  tpwvg03 = "categorical",
  tpwvg04 = "categorical",
  tpwvg05 = "categorical",
  tpwvg06 = "categorical",
  tpwvg07 = "categorical",
  tpwvg08 = "categorical",
  tpwvg09 = "categorical",
  tpwvg10 = "categorical",
  tpwvg11 = "categorical"
)

# define variable labels ----
variable_labels(
  tpwvg01 = "WVG 01: Walking frame",
  tpwvg02 = "WVG 02: Wheelchair",
  tpwvg03 = "WVG 03: Mobility scooter, adjusted bicycle",
  tpwvg04 = "WVG 04: Taxi pass",
  tpwvg05 = "WVG 05: Car adjustment",
  tpwvg06 = "WVG 06: Transport compensation",
  tpwvg07 = "WVG 07: Disabled parking permit",
  tpwvg08 = "WVG 08: Personal alarm",
  tpwvg09 = "WVG 09: Meals on wheels",
  tpwvg10 = "WVG 10: Handyman",
  tpwvg11 = "WVG 11: Grocery shopping service",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tpwvg01", "tpwvg02", "tpwvg03", "tpwvg04", "tpwvg05", "tpwvg06", "tpwvg07", "tpwvg08", "tpwvg09", "tpwvg10", "tpwvg11",
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("tpwvg01", "tpwvg02", "tpwvg03", "tpwvg04", "tpwvg05", "tpwvg06", "tpwvg07", "tpwvg08", "tpwvg09", "tpwvg10", "tpwvg11"),
  .applies_to_waves = c("Z", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpwvg01", "tpwvg02", "tpwvg03", "tpwvg04", "tpwvg05", "tpwvg06", "tpwvg07", "tpwvg08", "tpwvg09", "tpwvg10", "tpwvg11"),
  .applies_to_waves = c("Z", "G", "H", "I", "J", "K")
)

.lasa_fc_611 <- .lasa_finalize_fc("611")

