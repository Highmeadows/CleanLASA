## LASA filecode 141 -- variable names, variable labels, value labels,
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
  qan1 = "categorical",
  qan10 = "categorical",
  qan4 = "categorical",
  qan6 = "categorical",
  qan8 = "categorical",
  qan9 = "categorical"
)

# define variable labels ----
variable_labels(
  qan1 = "want to talk about feelings",
  qan10 = "when difficulties, like to lean on someone",
  qan4 = "when in trouble I need support",
  qan6 = "cope with sorrows on my own",
  qan8 = "go to others when something bothers me",
  qan9 = "my feelings are my own business",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qan1", "qan10", "qan4", "qan6", "qan8", "qan9",
  .applies_to_waves = c("2B", "G")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "no", `2` = "more-or-less", `3` = "yes",
  .applies_to_vars = c("qan1", "qan10", "qan4", "qan6", "qan8", "qan9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qan1", "qan10", "qan4", "qan6", "qan8", "qan9"),
  .applies_to_waves = c("2B", "G")
)

value_labels(
  `1` = "no", `2` = "more-or-less", `3` = "yes",
  .applies_to_vars = c("qan1", "qan10", "qan4", "qan6", "qan8", "qan9"),
  .applies_to_waves = c("2B", "G")
)

.lasa_fc_141 <- .lasa_finalize_fc("141")

