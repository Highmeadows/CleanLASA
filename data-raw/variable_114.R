## LASA filecode 114 -- variable names, variable labels, value labels,
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
  qseff01 = "categorical",
  qseff02 = "categorical",
  qseff03 = "categorical",
  qseff04 = "categorical",
  qseff05 = "categorical",
  qseff06 = "categorical",
  qseff07 = "categorical",
  qseff08 = "categorical",
  qseff09 = "categorical",
  qseff10 = "categorical"
)

# define variable labels ----
variable_labels(
  qseff01 = "Self efficacy 1: flexible (+)",
  qseff02 = "Self efficacy 2: reaction time (+)",
  qseff03 = "Self efficacy 3: strong (-)",
  qseff04 = "Self efficacy 4: good condition (+)",
  qseff05 = "Self efficacy 5: move smoothly (-)",
  qseff06 = "Self efficacy 6: stairs (+)",
  qseff07 = "Self efficacy 7: strong grip (+)",
  qseff08 = "Self efficacy 8: walk fast (-)",
  qseff09 = "Self efficacy 9: good balance (+)",
  qseff10 = "Self efficacy 10: active (-)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qseff01", "qseff02", "qseff04", "qseff06", "qseff08", "qseff09", "qseff10",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F")
)

variable_labels(
  qseff03 = "self efficacy 3: strong (-)",
  qseff05 = "self efficacy 5: move smoothly (-)",
  qseff07 = "self efficacy 7: strong grip (+)",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qseff01", "qseff02", "qseff03", "qseff04", "qseff05", "qseff06", "qseff07", "qseff08", "qseff09", "qseff10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "much more flexible", `2` = "more flexible", `3` = "just as flexible", `4` = "less flexible", `5` = "much less flexible",
  .applies_to_vars = c("qseff01"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F")
)

value_labels(
  `1` = "much better", `2` = "better", `3` = "just as good", `4` = "worse", `5` = "much worse",
  .applies_to_vars = c("qseff02", "qseff04", "qseff09"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F")
)

value_labels(
  `1` = "much less strong", `2` = "less strong", `3` = "just as strong", `4` = "stronger", `5` = "much stronger",
  .applies_to_vars = c("qseff03"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F")
)

value_labels(
  `1` = "much less smoothly", `2` = "less smoothly", `3` = "just as smoothly", `4` = "more smoothly", `5` = "much more smoothly",
  .applies_to_vars = c("qseff05"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F")
)

value_labels(
  `1` = "much more easy", `2` = "more easy", `3` = "just as easy", `4` = "more difficult", `5` = "much more difficult",
  .applies_to_vars = c("qseff06"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F")
)

value_labels(
  `1` = "much greater", `2` = "greater", `3` = "smaller", `4` = "less", `5` = "much smaller",
  .applies_to_vars = c("qseff07"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F")
)

value_labels(
  `1` = "much slower", `2` = "slower", `3` = "just as fast", `4` = "faster", `5` = "much faster",
  .applies_to_vars = c("qseff08"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F")
)

value_labels(
  `1` = "much less active", `2` = "less active", `3` = "just as active", `4` = "more active", `5` = "much more active",
  .applies_to_vars = c("qseff10"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qseff01", "qseff02", "qseff03", "qseff04", "qseff05", "qseff06", "qseff07", "qseff08", "qseff09", "qseff10"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F")
)

.lasa_fc_114 <- .lasa_finalize_fc("114")

