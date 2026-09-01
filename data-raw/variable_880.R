## LASA filecode 880 -- variable names, variable labels, value labels,
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
  cortrsp = "categorical"
)

# define variable labels ----
variable_labels(
  cortrsp = "(non)response saliva cortisol determination",
  .applies_to_waves = c("Z")
)

variable_labels(
  "cortrsp",
  .applies_to_waves = c("E")
)

# define value labels ----
value_labels(
  `-3` = "no participation LASA t5", `-2` = "na, tel. int.", `-1` = "cortisol data", `1` = "deceased before approach", `2` = "refusals", `3` = "ineligible", `4` = "not contacted", `5` = "technical error",
  .applies_to_vars = c("cortrsp"),
  .applies_to_waves = c("Z", "E")
)

.lasa_fc_880 <- .lasa_finalize_fc("880")

