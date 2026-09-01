## LASA filecode 711 -- variable names, variable labels, value labels,
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
  trwvg01 = "categorical",
  trwvg02 = "categorical",
  trwvg03 = "categorical",
  trwvg04 = "categorical",
  trwvg05 = "categorical",
  trwvg06 = "categorical",
  trwvg07 = "categorical",
  trwvg08 = "categorical",
  trwvg09 = "categorical",
  trwvg10 = "categorical",
  trwvg11 = "categorical"
)

# define variable labels ----
variable_labels(
  trwvg01 = "WVG 01: Walking frame",
  trwvg02 = "WVG 02: Wheelchair",
  trwvg03 = "WVG 03: Mobility scooter, adjusted bicycle",
  trwvg04 = "WVG 04: Taxi pass",
  trwvg05 = "WVG 05: Car adjustment",
  trwvg06 = "WVG 06: Transport compensation",
  trwvg07 = "WVG 07: Disabled parking permit",
  trwvg08 = "WVG 08: Personal alarm",
  trwvg09 = "WVG 09: Meals on wheels",
  trwvg10 = "WVG 10: Handyman",
  trwvg11 = "WVG 11: Grocery shopping service",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trwvg01", "trwvg02", "trwvg03", "trwvg04", "trwvg05", "trwvg06", "trwvg07", "trwvg08", "trwvg09", "trwvg10", "trwvg11",
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("trwvg01", "trwvg02", "trwvg03", "trwvg04", "trwvg05", "trwvg06", "trwvg07", "trwvg08", "trwvg09", "trwvg10", "trwvg11"),
  .applies_to_waves = c("Z", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("trwvg01", "trwvg02", "trwvg03", "trwvg04", "trwvg05", "trwvg06", "trwvg07", "trwvg08", "trwvg09", "trwvg10", "trwvg11"),
  .applies_to_waves = c("Z", "G", "H", "I", "J", "K")
)

.lasa_fc_711 <- .lasa_finalize_fc("711")

