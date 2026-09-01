## LASA filecode 136 -- variable names, variable labels, value labels,
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
  qworr01 = "categorical",
  qworr02 = "categorical",
  qworr03 = "categorical",
  qworr04 = "categorical",
  qworr05 = "categorical",
  qworr06 = "categorical",
  qworr07 = "categorical",
  qworr08 = "categorical",
  qworr09 = "categorical",
  qworr10 = "categorical",
  qworr11 = "categorical",
  qworr12 = "categorical",
  qworr13 = "categorical",
  qworr14 = "categorical",
  qworr15 = "categorical",
  qworr16 = "categorical"
)

# define variable labels ----
variable_labels(
  qworr01 = "Worry 01: not enough time",
  qworr02 = "Worry 02: overpower",
  qworr03 = "Worry 03: no tendency to worry",
  qworr04 = "Worry 04: situations trigger",
  qworr05 = "Worry 05: cannot help it",
  qworr06 = "Worry 06: under pressure",
  qworr07 = "Worry 07: all the time",
  qworr08 = "Worry 08: overcome easy",
  qworr09 = "Worry 09: tasks ahead",
  qworr10 = "Worry 10: never",
  qworr11 = "Worry 11: no influence",
  qworr12 = "Worry 12: all my life",
  qworr13 = "Worry 13: notice it",
  qworr14 = "Worry 14: cannot stop",
  qworr15 = "Worry 15: constantly",
  qworr16 = "Worry 16: when finished",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qworr01", "qworr02", "qworr03", "qworr04", "qworr05", "qworr06", "qworr07", "qworr08", "qworr09", "qworr10", "qworr11", "qworr12", "qworr13", "qworr14", "qworr15", "qworr16",
  .applies_to_waves = c("E")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qworr01", "qworr02", "qworr03", "qworr04", "qworr05", "qworr06", "qworr07", "qworr08", "qworr09", "qworr10", "qworr11", "qworr12", "qworr13", "qworr14", "qworr15", "qworr16"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "not at all characteristic", `2` = "not characteristic", `3` = "somewhat characteristic", `4` = "characteristic", `5` = "very characteristic",
  .applies_to_vars = c("qworr01", "qworr02", "qworr03", "qworr04", "qworr05", "qworr06", "qworr07", "qworr08", "qworr09", "qworr10", "qworr11", "qworr12", "qworr13", "qworr14", "qworr15", "qworr16"),
  .applies_to_waves = c("Z", "E")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qworr01", "qworr02", "qworr03", "qworr04", "qworr05", "qworr06", "qworr07", "qworr08", "qworr09", "qworr10", "qworr11", "qworr12", "qworr13", "qworr14", "qworr15", "qworr16"),
  .applies_to_waves = c("E")
)

.lasa_fc_136 <- .lasa_finalize_fc("136")

