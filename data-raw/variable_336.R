## LASA filecode 336 -- variable names, variable labels, value labels,
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
  qworry = "numeric"
)

# define variable labels ----
variable_labels(
  qworry = "Worry scale",
  .applies_to_waves = c("Z")
)

variable_labels(
  qworry = "Worry-scale Low-High",
  .applies_to_waves = c("E")
)

# define value labels ----
value_labels(
  `-16` = NA_character_, `-1` = "no valid data", `80` = NA_character_,
  .applies_to_vars = c("qworry"),
  .applies_to_waves = c("Z", "E")
)

.lasa_fc_336 <- .lasa_finalize_fc("336")

