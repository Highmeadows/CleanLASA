## LASA filecode 105 -- variable names, variable labels, value labels,
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
  qrco03 = "categorical",
  qrco05 = "categorical",
  qrco07 = "categorical",
  rco03 = "categorical",
  rco05 = "categorical",
  rco07 = "categorical"
)

# define variable labels ----
variable_labels(
  qrco03 = "Religious coping 03: in crisis turn to God",
  qrco05 = "Religious coping 05: confess sins and ask forgiveness",
  qrco07 = "Religious coping 07: God abandoned me",
  rco03 = "Religious coping 03: in crisis turn to God",
  rco05 = "Religious coping 05: confess sins and ask forgiveness",
  rco07 = "Religious coping 07: God abandoned me",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qrco03", "qrco05", "qrco07",
  .applies_to_waves = c("3B")
)

variable_labels(
  "rco03", "rco05", "rco07",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-2` = "short interview", `-1` = "na, asked", `1` = "never", `2` = "sometimes", `3` = "regularly", `4` = "very often",
  .applies_to_vars = c("qrco03", "qrco05", "qrco07", "rco03", "rco05", "rco07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, short interview", `-1` = "na, asked", `1` = "never", `2` = "sometimes", `3` = "regularly", `4` = "very often",
  .applies_to_vars = c("qrco03", "qrco05", "qrco07"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, short interview", `-1` = "na, asked", `1` = "never", `2` = "sometimes", `3` = "regularly", `4` = "very often",
  .applies_to_vars = c("rco03", "rco05", "rco07"),
  .applies_to_waves = c("MB")
)

.lasa_fc_105 <- .lasa_finalize_fc("105")

