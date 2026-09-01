## LASA filecode 131 -- variable names, variable labels, value labels,
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
  qsoid01 = "categorical",
  qsoid02 = "categorical",
  qsoid03 = "categorical",
  qsoid04 = "categorical",
  qsoid05 = "categorical",
  qsoid06 = "categorical",
  qsoid07 = "categorical",
  qsoid08 = "categorical",
  qsoid09 = "categorical",
  qsoid10 = "categorical"
)

# define variable labels ----
variable_labels(
  qsoid01 = "Soc Iden 01: involved",
  qsoid02 = "Soc Iden 02: emotional link",
  qsoid03 = "Soc Iden 03: proud",
  qsoid04 = "Soc Iden 04: pleasant",
  qsoid05 = "Soc Iden 05: identification",
  qsoid06 = "Soc Iden 06: loyalty",
  qsoid07 = "Soc Iden 07: honoured",
  qsoid08 = "Soc Iden 08: joined",
  qsoid09 = "Soc Iden 09: avarage",
  qsoid10 = "Soc Iden 10: myself",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qsoid01", "qsoid02", "qsoid03", "qsoid04", "qsoid05", "qsoid06", "qsoid07", "qsoid08", "qsoid09", "qsoid10",
  .applies_to_waves = c("D", "E")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qsoid01", "qsoid02", "qsoid03", "qsoid04", "qsoid05", "qsoid06", "qsoid07", "qsoid08", "qsoid09", "qsoid10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qsoid01", "qsoid02", "qsoid03", "qsoid04", "qsoid05", "qsoid06", "qsoid07", "qsoid08", "qsoid09", "qsoid10"),
  .applies_to_waves = c("Z", "D", "E")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qsoid01", "qsoid02", "qsoid03", "qsoid04", "qsoid05", "qsoid06", "qsoid07", "qsoid08", "qsoid09", "qsoid10"),
  .applies_to_waves = c("D", "E")
)

.lasa_fc_131 <- .lasa_finalize_fc("131")

