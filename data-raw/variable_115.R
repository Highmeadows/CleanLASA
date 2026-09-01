## LASA filecode 115 -- variable names, variable labels, value labels,
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
  mpain1 = "categorical",
  mpain2 = "categorical",
  mpain3 = "categorical",
  mpain4 = "categorical",
  mpain5 = "categorical",
  mpain6 = "categorical",
  qpain1 = "categorical",
  qpain2 = "categorical",
  qpain3 = "categorical",
  qpain4 = "categorical",
  qpain5 = "categorical",
  qpain6 = "categorical"
)

# define variable labels ----
variable_labels(
  mpain1 = "Pain 1: standing",
  mpain2 = "Pain 2: change position",
  mpain3 = "Pain 3: sitting",
  mpain4 = "Pain 4: walking",
  mpain5 = "Pain 5: unbearable",
  mpain6 = "Pain 6: constant",
  qpain1 = "Pain 1: standing",
  qpain2 = "Pain 2: change position",
  qpain3 = "Pain 3: sitting",
  qpain4 = "Pain 4: walking",
  qpain5 = "Pain 5: unbearable",
  qpain6 = "Pain 6: constant",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qpain1", "qpain2", "qpain3", "qpain4", "qpain5", "qpain6",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "mpain1", "mpain2", "mpain3", "mpain4", "mpain5", "mpain6",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("mpain1", "mpain2", "mpain3", "mpain4", "mpain5", "mpain6", "qpain1", "qpain2", "qpain3", "qpain4", "qpain5", "qpain6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes", `2` = "no",
  .applies_to_vars = c("mpain1", "mpain2", "mpain3", "mpain4", "mpain5", "mpain6", "qpain1", "qpain2", "qpain3", "qpain4", "qpain5", "qpain6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qpain1", "qpain2", "qpain3", "qpain4", "qpain5", "qpain6"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mpain1", "mpain2", "mpain3", "mpain4", "mpain5", "mpain6"),
  .applies_to_waves = c("MB")
)

.lasa_fc_115 <- .lasa_finalize_fc("115")

