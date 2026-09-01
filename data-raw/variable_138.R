## LASA filecode 138 -- variable names, variable labels, value labels,
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
  qreli02 = "categorical",
  qreli03 = "categorical",
  qreli04 = "categorical",
  qreli05 = "categorical",
  qreli06 = "categorical",
  qreli07 = "categorical"
)

# define variable labels ----
variable_labels(
  qreli02 = "Life after death",
  qreli03 = "Heaven",
  qreli04 = "Hell",
  qreli05 = "Devil",
  qreli06 = "Adam and Eve",
  qreli07 = "Bible as word God",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qreli02", "qreli03", "qreli04", "qreli05", "qreli06", "qreli07",
  .applies_to_waves = c("E")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qreli02", "qreli03", "qreli04", "qreli05", "qreli06", "qreli07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qreli02", "qreli03", "qreli04", "qreli05", "qreli06", "qreli07"),
  .applies_to_waves = c("E")
)

.lasa_fc_138 <- .lasa_finalize_fc("138")

