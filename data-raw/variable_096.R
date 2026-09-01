## LASA filecode 096 -- variable names, variable labels, value labels,
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
  bowmf = "categorical",
  pd01 = "categorical",
  pd02 = "categorical",
  pd03 = "categorical",
  pd04 = "categorical",
  pd05 = "categorical",
  pd06 = "categorical",
  pd07 = "categorical",
  pd08 = "categorical",
  pd09 = "categorical",
  remdis = "categorical"
)

# define variable labels ----
variable_labels(
  bowmf = "bowel movement frequency",
  pd01 = "PD01: difficulty getting up from a chair",
  pd02 = "PD02: handwriting smaller",
  pd03 = "PD03: someone noticed your voice softer",
  pd04 = "PD04: insecure while walking",
  pd05 = "PD05: feel feet sticking to floor",
  pd06 = "PD06: someone noticed your face less expression",
  pd07 = "PD07: trembling arms or legs",
  pd08 = "PD08: difficulty sealing buttons",
  pd09 = "PD09: small shuffling steps walking",
  remdis = "REM sleep behaviour disorder",
  .applies_to_waves = c("Z")
)

variable_labels(
  "bowmf", "pd01", "pd02", "pd03", "pd04", "pd05", "pd06", "pd07", "pd08", "pd09", "remdis",
  .applies_to_waves = c("3B", "MB")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("bowmf", "pd01", "pd02", "pd03", "pd04", "pd05", "pd06", "pd07", "pd08", "pd09", "remdis"),
  .applies_to_waves = c("Z", "3B", "MB")
)

value_labels(
  `-5` = "interview terminated",
  .applies_to_vars = c("bowmf", "pd01", "pd02", "pd03", "pd04", "pd05", "pd06", "pd07", "pd08", "pd09", "remdis"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "less than once a day", `2` = "once a day", `3` = "twice a day", `4` = "more than twice a day",
  .applies_to_vars = c("bowmf"),
  .applies_to_waves = c("Z", "3B", "MB")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("pd01", "pd03", "pd04", "pd05", "pd06", "pd07", "pd08", "pd09", "remdis"),
  .applies_to_waves = c("Z", "3B", "MB")
)

value_labels(
  `-2` = "R cannot write", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pd02"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-5` = "na, interview terminated",
  .applies_to_vars = c("bowmf", "pd01", "pd02", "pd03", "pd04", "pd05", "pd06", "pd07", "pd08", "pd09", "remdis"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("pd02"),
  .applies_to_waves = c("3B")
)

.lasa_fc_096 <- .lasa_finalize_fc("096")

