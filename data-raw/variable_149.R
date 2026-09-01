## LASA filecode 149 -- variable names, variable labels, value labels,
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
  qgsr01 = "categorical",
  qgsr02 = "categorical",
  qgsr03 = "categorical",
  qgsr04 = "categorical",
  qgsr05 = "categorical",
  qgsr06 = "categorical",
  qgsr07 = "categorical",
  qgsr08 = "categorical",
  qgsr09 = "categorical",
  qgsr10 = "categorical",
  qgsr11 = "categorical",
  qgsr12 = "categorical",
  qgsr13 = "categorical",
  qgsr14 = "categorical"
)

# define variable labels ----
variable_labels(
  qgsr01 = "MK2: exhausting to pursue goal, search a new goal",
  qgsr02 = "SU3: harder to get same results, keep trying harder",
  qgsr03 = "MK3: try to pursue several goals",
  qgsr04 = "SU1: effort to achieve a given goal",
  qgsr05 = "SU2: set goals clearly, stick to them",
  qgsr06 = "AP3: for goals detailed plans how to implement them",
  qgsr07 = "CP1: have a backup plan in case something goes wrong",
  qgsr08 = "MK1: if difficulty try to achieve goal by other means",
  qgsr09 = "MK4: goal difficult to reach, find alternative route",
  qgsr10 = "CP3: plan for things other people consider unlikely",
  qgsr11 = "AP1: always make detailed plans for my goals",
  qgsr12 = "SU4: cannot do something the way before look for new goal",
  qgsr13 = "CP2: plan for difficult situations according my intentions",
  qgsr14 = "AP2: for my goals make detailed plans when to implement",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qgsr01", "qgsr02", "qgsr03", "qgsr04", "qgsr05", "qgsr06", "qgsr07", "qgsr08", "qgsr09", "qgsr10", "qgsr11", "qgsr12", "qgsr13", "qgsr14",
  .applies_to_waves = c("G", "H")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qgsr01", "qgsr02", "qgsr03", "qgsr04", "qgsr05", "qgsr06", "qgsr07", "qgsr08", "qgsr09", "qgsr10", "qgsr11", "qgsr12", "qgsr13", "qgsr14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "slightly disagree", `4` = "slightly agree", `5` = "agree", `6` = "strongly agree",
  .applies_to_vars = c("qgsr01", "qgsr02", "qgsr03", "qgsr04", "qgsr05", "qgsr06", "qgsr07", "qgsr08", "qgsr09", "qgsr10", "qgsr11", "qgsr12", "qgsr13", "qgsr14"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qgsr01", "qgsr02", "qgsr03", "qgsr04", "qgsr05", "qgsr06", "qgsr07", "qgsr08", "qgsr09", "qgsr10", "qgsr11", "qgsr12", "qgsr13", "qgsr14"),
  .applies_to_waves = c("G", "H")
)

.lasa_fc_149 <- .lasa_finalize_fc("149")

