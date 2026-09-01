## LASA filecode 330 -- variable names, variable labels, value labels,
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
  qsocdes = "numeric"
)

# define variable labels ----
variable_labels(
  qsocdes = "Social desirability scale score",
  .applies_to_waves = c("Z")
)

variable_labels(
  qsocdes = "Social desirability low-high",
  .applies_to_waves = c("C", "F")
)

# define value labels ----
value_labels(
  `-1` = "no valid data", `7` = NA_character_, `9` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("qsocdes"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no valid data", `7` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("qsocdes"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "no valid data", `9` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("qsocdes"),
  .applies_to_waves = c("F")
)

.lasa_fc_330 <- .lasa_finalize_fc("330")

