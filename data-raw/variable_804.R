## LASA filecode 804 -- variable names, variable labels, value labels,
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
  qphyfem = "categorical",
  qphymas = "categorical",
  qphyq = "categorical",
  qpsyfem = "categorical",
  qpsymas = "categorical",
  qpsyq = "categorical"
)

# define variable labels ----
variable_labels(
  qphyfem = "How feminine do you feel physically (scale)",
  qphymas = "How masculine do you feel physically (scale)",
  qphyq = "Physically: R does not want to answer (one of) these questions",
  qpsyfem = "How feminine do you feel psychologically/emotionally (scale)",
  qpsymas = "How masculine do you feel psychologically/emotionally (scale)",
  qpsyq = "Psychologically/emotionally: R does not want to answer (one of) these questions",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qphyfem", "qphymas", "qphyq", "qpsyfem", "qpsymas", "qpsyq",
  .applies_to_waves = c("J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("qphyfem", "qphymas", "qpsyfem", "qpsymas"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `0` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("qphyfem", "qphymas", "qpsyfem", "qpsymas"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qphyq", "qpsyq"),
  .applies_to_waves = c("Z", "J", "K")
)

.lasa_fc_804 <- .lasa_finalize_fc("804")

