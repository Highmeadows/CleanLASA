## LASA filecode 379 -- variable names, variable labels, value labels,
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
  madint = "numeric"
)

# define variable labels ----
variable_labels(
  madint = "AD total score",
  .applies_to_waves = c("Z")
)

variable_labels(
  "madint",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `-5` = "na, section not done", `-4` = "score unavailable", `0` = NA_character_, `9` = NA_character_,
  .applies_to_vars = c("madint"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, section not done", `-4` = "not able to [cognitive]", `0` = NA_character_, `9` = NA_character_,
  .applies_to_vars = c("madint"),
  .applies_to_waves = c("G")
)

.lasa_fc_379 <- .lasa_finalize_fc("379")

