## LASA filecode 882 -- variable names, variable labels, value labels,
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
  corteve = "numeric",
  cortwac = "numeric"
)

# define variable labels ----
variable_labels(
  corteve = "(constructed) evening cortisol saliva unstimulated (nmol/L)",
  cortwac = "(constructed) waking cortisol saliva unstimulated (nmol/L)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "corteve", "cortwac",
  .applies_to_waves = c("E")
)

# define value labels ----
value_labels(
  `-2` = "insufficient volume",
  .applies_to_vars = c("corteve", "cortwac"),
  .applies_to_waves = c("Z", "E")
)

.lasa_fc_882 <- .lasa_finalize_fc("882")

