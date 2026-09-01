## LASA filecode 332 -- variable names, variable labels, value labels,
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
  qfioe = "numeric"
)

# define variable labels ----
variable_labels(
  qfioe = "Filial obligation expectations scale score",
  .applies_to_waves = c("Z")
)

variable_labels(
  qfioe = "Filial obligation expectations",
  .applies_to_waves = c("D", "E", "J")
)

# define value labels ----
value_labels(
  `-1` = ">2 missing items", `16` = NA_character_, `80` = NA_character_,
  .applies_to_vars = c("qfioe"),
  .applies_to_waves = c("Z", "D", "E", "J")
)

.lasa_fc_332 <- .lasa_finalize_fc("332")

