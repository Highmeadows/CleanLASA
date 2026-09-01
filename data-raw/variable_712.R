## LASA filecode 712 -- variable names, variable labels, value labels,
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
  trlo10 = "categorical",
  trlo3 = "categorical",
  trlo4 = "categorical",
  trlo7 = "categorical",
  trlo8 = "categorical",
  trlo9 = "categorical"
)

# define variable labels ----
variable_labels(
  trlo10 = "often, I feel rejected",
  trlo3 = "experience emptiness",
  trlo4 = "people to lean on if in trouble",
  trlo7 = "many people I can count on",
  trlo8 = "enough people I feel close to",
  trlo9 = "miss having people around",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trlo10", "trlo3", "trlo4", "trlo7", "trlo8", "trlo9",
  .applies_to_waves = c("H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("trlo10", "trlo3", "trlo4", "trlo7", "trlo8", "trlo9"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `1` = "no", `2` = "more-or-less", `3` = "yes",
  .applies_to_vars = c("trlo10", "trlo3", "trlo4", "trlo7", "trlo8", "trlo9"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

.lasa_fc_712 <- .lasa_finalize_fc("712")

