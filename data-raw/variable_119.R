## LASA filecode 119 -- variable names, variable labels, value labels,
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
  qmeno01 = "numeric",
  qmeno02 = "numeric",
  qmeno03 = "numeric",
  qmeno04 = "categorical",
  qmeno05 = "numeric",
  qmeno06 = "categorical",
  qmeno07 = "categorical",
  qmeno08 = "numeric",
  qmeno09 = "categorical",
  qmeno10 = "categorical",
  qmeno11 = "categorical",
  qmeno12 = "categorical",
  qmeno13 = "categorical"
)

# define variable labels ----
variable_labels(
  qmeno01 = "menopause 01: age start period",
  qmeno02 = "menopause 02: number of children",
  qmeno03 = "menopause 03: age first child born",
  qmeno04 = "menopause 04: pregnant no children",
  qmeno05 = "menopause 05: age last period",
  qmeno06 = "menopause 06: menopause natural",
  qmeno07 = "menopause 07: used contraceptive pill",
  qmeno08 = "menopause 08: # years contraceptive pill",
  qmeno09 = "menopause 09: hot flushes",
  qmeno10 = "menopause 10: excessive transpiration",
  qmeno11 = "menopause 11: pain in muscles",
  qmeno12 = "menopause 12: dry vagina",
  qmeno13 = "menopause 13: pain during intercourse",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qmeno01", "qmeno02", "qmeno03", "qmeno04", "qmeno05", "qmeno06", "qmeno07", "qmeno08", "qmeno09", "qmeno10", "qmeno11", "qmeno12", "qmeno13",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qmeno01", "qmeno02", "qmeno03", "qmeno04", "qmeno05", "qmeno06", "qmeno07", "qmeno08", "qmeno09", "qmeno10", "qmeno11", "qmeno12", "qmeno13"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no answer, skipped", `-2` = "male respondent",
  .applies_to_vars = c("qmeno01", "qmeno02", "qmeno03", "qmeno04", "qmeno05", "qmeno06", "qmeno07", "qmeno08", "qmeno09", "qmeno10", "qmeno11", "qmeno12", "qmeno13"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("qmeno04", "qmeno07", "qmeno09", "qmeno10", "qmeno11", "qmeno12", "qmeno13"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "normal", `2` = "operation", `3` = "no menopause yet",
  .applies_to_vars = c("qmeno06"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qmeno01", "qmeno02", "qmeno03", "qmeno04", "qmeno05", "qmeno06", "qmeno07", "qmeno08", "qmeno09", "qmeno10", "qmeno11", "qmeno12", "qmeno13"),
  .applies_to_waves = c("B")
)

.lasa_fc_119 <- .lasa_finalize_fc("119")

