## LASA filecode 220 -- variable names, variable labels, value labels,
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
  dsbsp = "numeric",
  dsbw = "numeric",
  dsfsp = "numeric",
  dsfw = "numeric",
  dstot = "numeric",
  rmds = "categorical"
)

# define variable labels ----
variable_labels(
  dsbsp = "WAIS Digit Span backward span",
  dsbw = "WAIS Digit Span number of correct backward items",
  dsfsp = "WAIS Digit Span forward span",
  dsfw = "WAIS Digit Span number of correct forward items",
  dstot = "WAIS Digit Span total number of correct items",
  rmds = "Reason for missing Digit Span score",
  .applies_to_waves = c("Z")
)

variable_labels(
  dsbsp = "WAIS Digit Span: Span backwards",
  dsbw = "WAIS Digit Span: number of correct backward items",
  dsfsp = "WAIS Digit Span: Span forwards",
  dsfw = "WAIS Digit Span: number of correct forward items",
  dstot = "WAIS Digit Span: total number of correct items",
  rmds = "reason missing Digit Span",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-2` = "no score, see BRMDS", `-1` = "no score, too many missings",
  .applies_to_vars = c("dsbsp", "dsbw", "dsfsp", "dsfw", "dstot"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "language problem",
  .applies_to_vars = c("rmds"),
  .applies_to_waves = c("Z", "3B")
)

.lasa_fc_220 <- .lasa_finalize_fc("220")

