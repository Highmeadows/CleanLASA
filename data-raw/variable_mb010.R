## LASA filecode mb010 -- variable names, variable labels, value labels,
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
  marst = "categorical",
  partner = "categorical",
  partst = "categorical",
  separ = "categorical"
)

# define variable labels ----
variable_labels(
  marst = "marital status",
  partner = "partner status (none, co-residing, residing outside the household)",
  partst = "partner status",
  separ = "why not living with spouse (for married and with registered partnership)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "marst", "partner", "partst", "separ",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-1` = "unknown", `1` = "never married", `2` = "married", `3` = "divorced", `4` = "widowhood", `5` = "registered partnership",
  .applies_to_vars = c("marst"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "unknown", `0` = "no partner", `1` = "partner (co-residence)", `2` = "partner (outside household)",
  .applies_to_vars = c("partner"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "unknown", `0` = "no partner", `1` = "lives with spouse (married or registered partnership)", `2` = "lives with opposite sex (not married)", `3` = "lives with same sex (not married)", `4` = "partner opposite sex outside household (not married)", `5` = "partner same sex outside household (not married)", `6` = "spouse outside household (married or registered partnership; relationship sometimes broken; see SEPAR)", `7` = "combination 4 & 6", `8` = "combination 1 & 4", `9` = "combination 2 & 6", `10` = "registered partnership: lives with spouse (same sex)",
  .applies_to_vars = c("partst"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-3` = "not married / data collection (birth cohort not included)", `-2` = "not separated (i.e. living with spouse)", `-1` = "unknown", `1` = "partner in hospital/nursing home", `2` = "R in hospital/nursing home", `3` = "partner elsewhere (e.g. employment)", `4` = "R elsewhere (e.g. employment)", `5` = "other (relationship exists)", `6` = "relationship broken", `7` = "other", `8` = "wants to live alone", `9` = "political refugee", `10` = "wife abroad, no house", `11` = "wife abroad, waiting for reunification",
  .applies_to_vars = c("separ"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not married", `-2` = "not separated (i.e. living with spouse)", `-1` = "unknown", `1` = "partner in hospital/nursing home", `2` = "R in hospital/nursing home", `3` = "partner elsewhere (e.g. employment)", `4` = "R elsewhere (e.g. employment)", `5` = "other (relationship exists)", `6` = "relationship broken", `7` = "other", `8` = "wants to live alone", `9` = "political refugee", `10` = "wife abroad, no house", `11` = "wife abroad, waiting for reunification",
  .applies_to_vars = c("separ"),
  .applies_to_waves = c("MB")
)

.lasa_fc_mb010 <- .lasa_finalize_fc("mb010")

