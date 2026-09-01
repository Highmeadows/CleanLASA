## LASA filecode 274 -- variable names, variable labels, value labels,
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
  vignet = "numeric"
)

# define variable labels ----
variable_labels(
  vignet = "Total vignettes FRE score",
  .applies_to_waves = c("Z")
)

variable_labels(
  vignet = "total score vignettes FRE",
  .applies_to_waves = c("D")
)

# define value labels ----
value_labels(
  `-1` = ">3 missings", `0` = NA_character_, `19` = NA_character_,
  .applies_to_vars = c("vignet"),
  .applies_to_waves = c("Z", "D")
)

.lasa_fc_274 <- .lasa_finalize_fc("274")

