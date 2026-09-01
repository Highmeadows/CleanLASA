## LASA filecode 028 -- variable names, variable labels, value labels,
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
  advemv = "numeric",
  alcmv = "numeric",
  alcos01 = "categorical",
  alcos02 = "categorical",
  alcos03 = "categorical",
  alcos04 = "categorical",
  alcos05 = "categorical",
  alcos06 = "categorical",
  alcos07 = "categorical",
  alcos08 = "categorical",
  alcos09 = "categorical",
  alcos10 = "categorical",
  alcos11 = "categorical",
  alcos12 = "categorical",
  compmv = "numeric",
  initmv = "numeric"
)

# define variable labels ----
variable_labels(
  advemv = "# missing values adver-alcos items",
  alcmv = "# missing values alcos items",
  alcos01 = "Alcos item 01: plans",
  alcos02 = "Alcos item 02: failure",
  alcos03 = "Alcos item 03: wrong",
  alcos04 = "Alcos item 04: complicated",
  alcos05 = "Alcos item 05: unpleasant",
  alcos06 = "Alcos item 06: problem solving",
  alcos07 = "Alcos item 07: decision",
  alcos08 = "Alcos item 08: quickly",
  alcos09 = "Alcos item 09: unexpected",
  alcos10 = "Alcos item 10: mistake",
  alcos11 = "Alcos item 11: new things",
  alcos12 = "Alcos item 12: doubt",
  compmv = "# missing values comp-alcos items",
  initmv = "# missing values init-alcos items",
  .applies_to_waves = c("Z")
)

variable_labels(
  "advemv", "alcmv", "alcos01", "alcos02", "alcos03", "alcos04", "alcos05", "alcos06", "alcos07", "alcos08", "alcos09", "alcos10", "alcos11", "alcos12", "compmv", "initmv",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("alcos01", "alcos02", "alcos03", "alcos04", "alcos05", "alcos06", "alcos07", "alcos08", "alcos09", "alcos10", "alcos11", "alcos12"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("alcos01", "alcos02", "alcos03", "alcos04", "alcos05", "alcos06", "alcos07", "alcos08", "alcos09", "alcos10", "alcos11", "alcos12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available",
  .applies_to_vars = c("advemv", "alcmv", "compmv", "initmv"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("alcos01", "alcos02", "alcos03", "alcos04", "alcos05", "alcos06", "alcos07", "alcos08", "alcos09", "alcos10", "alcos11", "alcos12"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see BRMALC in LASAB228",
  .applies_to_vars = c("advemv", "alcmv", "alcos01", "alcos02", "alcos03", "alcos04", "alcos05", "alcos06", "alcos07", "alcos08", "alcos09", "alcos10", "alcos11", "alcos12", "compmv", "initmv"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
  .applies_to_vars = c("alcos01", "alcos02", "alcos03", "alcos04", "alcos05", "alcos06", "alcos07", "alcos08", "alcos09", "alcos10", "alcos11", "alcos12"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("advemv", "alcmv", "compmv", "initmv"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/ agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("alcos01", "alcos02", "alcos03", "alcos04", "alcos05", "alcos06", "alcos07", "alcos08", "alcos09", "alcos10", "alcos11", "alcos12"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

.lasa_fc_028 <- .lasa_finalize_fc("028")

