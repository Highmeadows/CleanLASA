## LASA filecode zoa1 -- variable names, variable labels, value labels,
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
  oah = "categorical",
  oak = "categorical"
)

# define variable labels ----
variable_labels(
  oah = "Symptomatic hip osteoarthritis",
  oak = "Symptomatic knee osteoarthritis",
  .applies_to_waves = c("Z")
)

variable_labels(
  oah = "symptomatic hip OA at B",
  oak = "symptomatic knee OA at B",
  .applies_to_waves = c("B")
)

variable_labels(
  oah = "symptomatic hip OA at C",
  oak = "symptomatic knee OA at C",
  .applies_to_waves = c("C")
)

variable_labels(
  oah = "symptomatic hip OA at D",
  oak = "symptomatic knee OA at D",
  .applies_to_waves = c("D")
)

variable_labels(
  oah = "symptomatic hip OA at E",
  oak = "symptomatic knee OA at E",
  .applies_to_waves = c("E")
)

variable_labels(
  oah = "symptomatic hip OA at F",
  oak = "symptomatic knee OA at F",
  .applies_to_waves = c("F")
)

variable_labels(
  oah = "symptomatic hip OA at G",
  oak = "symptomatic knee OA at G",
  .applies_to_waves = c("G")
)

variable_labels(
  oah = "symptomatic hip OA at H",
  oak = "symptomatic knee OA at H",
  .applies_to_waves = c("H")
)

variable_labels(
  oah = "symptomatic hip OA at I",
  oak = "symptomatic knee OA at I",
  .applies_to_waves = c("I")
)

# define value labels ----
value_labels(
  `-9` = "missing",
  .applies_to_vars = c("oah", "oak"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `0` = "no", `1` = "possible", `2` = "yes", `8` = "dropout", `9` = "dropout at previous waves",
  .applies_to_vars = c("oah", "oak"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `0` = "no", `1` = "possible", `2` = "yes",
  .applies_to_vars = c("oah", "oak"),
  .applies_to_waves = c("B")
)

.lasa_fc_zoa1 <- .lasa_finalize_fc("zoa1")

