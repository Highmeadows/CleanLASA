## LASA filecode 278 -- variable names, variable labels, value labels,
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
  an = "numeric"
)

# define variable labels ----
variable_labels(
  an = "Need for affiliation scale (6 items)",
  .applies_to_waves = c("Z")
)

variable_labels(
  an = "need for affiliation <6 items>",
  .applies_to_waves = c("B", "E")
)

# define value labels ----
value_labels(
  `-4` = "not assessed", `-3` = "interview terminated", `-2` = "no valid scale score", `-1` = ">0 missing items", `6` = NA_character_, `18` = NA_character_,
  .applies_to_vars = c("an"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "short version questionnaire", `-3` = "interview terminated", `-2` = "no valid data", `-1` = ">0 missing items", `6` = NA_character_, `18` = NA_character_,
  .applies_to_vars = c("an"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "refusal/skip by interviewer", `-3` = "interview terminated", `-2` = ">0 missing items", `-1` = ">0 missing items", `6` = NA_character_, `18` = NA_character_,
  .applies_to_vars = c("an"),
  .applies_to_waves = c("E")
)

.lasa_fc_278 <- .lasa_finalize_fc("278")

