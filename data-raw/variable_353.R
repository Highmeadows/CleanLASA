## LASA filecode 353 -- variable names, variable labels, value labels,
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
  malcnei = "categorical",
  malconw = "numeric",
  malcopp = "categorical",
  malcppp = "categorical",
  mgarret = "categorical"
)

# define variable labels ----
variable_labels(
  malcnei = "NEI: standardized alcohol use corrected for sex",
  malconw = "Number of alcoholic drinks per week",
  malcopp = "R is potential problem drinker (at present)",
  malcppp = "Potential Problem drinker in the past",
  mgarret = "Garretsen Indication of present alcohol use",
  .applies_to_waves = c("Z")
)

variable_labels(
  "malcnei", "malconw", "mgarret",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "malcopp",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "malcppp",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mgarret"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-4` = "no valid data", `0` = "no use", `1` = "moderate use", `2` = "grey area", `3` = "excessive use",
  .applies_to_vars = c("malcnei"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-4` = "no valid data", `0` = "R does not drink", `0.5` = NA_character_, `77` = NA_character_,
  .applies_to_vars = c("malconw"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-4` = "no valid data", `0` = "not a problem drinker", `1` = "potential problem drinker",
  .applies_to_vars = c("malcopp"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-4` = "no valid data", `-3` = "R never drank", `-2` = "R drinks at present", `0` = "not a problem drinker", `1` = "potential problem drinker",
  .applies_to_vars = c("malcppp"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-4` = "no valid data", `0` = "R does not drink", `1` = "light", `2` = "moderate", `3` = "excessive", `4` = "very excessive",
  .applies_to_vars = c("mgarret"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

.lasa_fc_353 <- .lasa_finalize_fc("353")

