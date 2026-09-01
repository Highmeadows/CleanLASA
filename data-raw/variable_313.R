## LASA filecode 313 -- variable names, variable labels, value labels,
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
  qrand1 = "numeric",
  qrand2 = "numeric"
)

# define variable labels ----
variable_labels(
  qrand1 = "Rand scale 1: evaluation present health",
  qrand2 = "Rand scale 2: future health perspective",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qrand1", "qrand2",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

# define value labels ----
value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("qrand1", "qrand2"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `4` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("qrand1"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `3` = NA_character_, `15` = NA_character_,
  .applies_to_vars = c("qrand2"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

.lasa_fc_313 <- .lasa_finalize_fc("313")

