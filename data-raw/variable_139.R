## LASA filecode 139 -- variable names, variable labels, value labels,
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
  qpadl1 = "categorical",
  qpadl2 = "categorical",
  qpadl3 = "categorical",
  qpadl4 = "categorical",
  qpadl5 = "categorical",
  qpadl6 = "categorical",
  qpdeme = "categorical",
  qpdis1 = "categorical",
  qpdis2 = "categorical",
  qpdis3 = "categorical",
  qpdis4 = "categorical",
  qpmemo = "categorical",
  qprel1 = "categorical",
  qprel2 = "categorical",
  qprel3 = "categorical",
  qprel4 = "categorical",
  qprel5 = "categorical",
  qprel6 = "categorical",
  qprel7 = "numeric",
  qprel8 = "numeric",
  qprespc1 = "categorical",
  qprespc2 = "categorical",
  qprespc3 = "categorical",
  qprespc4 = "categorical",
  qptalk = "categorical"
)

# define variable labels ----
variable_labels(
  qpadl1 = "Partner func. lim. 1: stairs",
  qpadl2 = "Partner func. lim. 2: dress",
  qpadl3 = "Partner func. lim. 3: chair",
  qpadl4 = "Partner func. lim. 4: toenails",
  qpadl5 = "Partner func. lim. 5: walk",
  qpadl6 = "Partner func. lim. 6: public transportation",
  qpdeme = "Partner diagnosed with dementia",
  qpdis1 = "Partner dispute 1: financial affairs",
  qpdis2 = "Partner dispute 2: domestic affairs",
  qpdis3 = "Partner dispute 3: spare time",
  qpdis4 = "Partner dispute 4: consideration",
  qpmemo = "Partner problem with memory",
  qprel1 = "Partner rel. 1: daily support",
  qprel2 = "Partner rel. 2: motivated",
  qprel3 = "Partner rel. 3: personality",
  qprel4 = "Partner rel. 4: consideration",
  qprel5 = "Partner rel. 5: disputes",
  qprel6 = "Partner rel. 6: decision making",
  qprel7 = "Partner rel. 7: evaluation now",
  qprel8 = "Partner rel. 8: evaluation 10 years ago",
  qprespc1 = "Partner respite care: daytime activities",
  qprespc2 = "Partner respite care: overnight stay in care institution",
  qprespc3 = "Partner respite care: lodging facility for a few days",
  qprespc4 = "Partner respite care: minder, so R can go away part of the day",
  qptalk = "Partner important conversation",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qpadl1", "qpadl2", "qpadl3", "qpadl4", "qpadl5", "qpdeme", "qpmemo", "qprel1", "qprel2", "qprel3", "qprel4", "qprel5", "qprel6", "qptalk",
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "qpadl6", "qpdis1", "qpdis2", "qpdis3", "qpdis4", "qprel7", "qprel8",
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "qprespc1", "qprespc2", "qprespc3", "qprespc4",
  .applies_to_waves = c("I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qpadl1", "qpadl2", "qpadl3", "qpadl4", "qpadl5", "qpadl6", "qpdeme", "qpdis1", "qpdis2", "qpdis3", "qpdis4", "qpmemo", "qprel1", "qprel2", "qprel3", "qprel4", "qprel5", "qprel6", "qprel7", "qprel8", "qprespc1", "qprespc2", "qprespc3", "qprespc4", "qptalk"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available",
  .applies_to_vars = c("qpadl1", "qpadl2", "qpadl3", "qpadl4", "qpadl5", "qpadl6", "qpdeme", "qpdis1", "qpdis2", "qpdis3", "qpdis4", "qpmemo", "qprel1", "qprel2", "qprel3", "qprel4", "qprel5", "qprel6", "qprel7", "qprel8", "qptalk"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "no, partner cannot", `2` = "only with help", `3` = "yes, with much difficulty", `4` = "yes, with some difficulty", `5` = "yes, without help",
  .applies_to_vars = c("qpadl1", "qpadl2", "qpadl3", "qpadl4", "qpadl5", "qpadl6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("qpdeme", "qpmemo"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly in disagreement", `2` = "reasonably in disagreement", `3` = "a little in disagreement", `4` = "totally not in disagreement",
  .applies_to_vars = c("qpdis1", "qpdis2", "qpdis3", "qpdis4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "very dissatisfied", `2` = "dissatisfied", `3` = "a little dissatisfied", `4` = "satisfied", `5` = "very satisfied",
  .applies_to_vars = c("qprel1", "qprel2", "qprel3", "qprel4", "qprel5", "qprel6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("qprel7", "qprel8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qprespc1", "qprespc2", "qprespc3", "qprespc4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "at least once a day", `2` = "a few times a week", `3` = "once a week", `4` = "once a month", `5` = "less than once a month",
  .applies_to_vars = c("qptalk"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no partner", `-1` = "no answer", `1` = "no, partner cannot", `2` = "only with help", `3` = "yes, with much difficulty", `4` = "yes, with some difficulty", `5` = "yes, without help",
  .applies_to_vars = c("qpadl1", "qpadl2", "qpadl3", "qpadl4", "qpadl5"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no partner", `-1` = "no answer", `1` = "no, partner cannot", `2` = "only with help", `3` = "yes, with much difficulty", `4` = "yes, with some difficulty", `5` = "yes, without help",
  .applies_to_vars = c("qpadl6"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "no partner", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qpdeme"),
  .applies_to_waves = c("E", "F", "G", "H", "3B")
)

value_labels(
  `-2` = "no partner", `-1` = "no answer", `1` = "strongly in disagreement", `2` = "reasonably in disagreement", `3` = "a little in disagreement", `4` = "totally not in disagreement",
  .applies_to_vars = c("qpdis1", "qpdis2", "qpdis3", "qpdis4"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "no partner", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qpmemo"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no partner", `-1` = "no answer", `1` = "very dissatisfied", `2` = "dissatisfied", `3` = "a little dissatisfied", `4` = "satisfied", `5` = "very satisfied",
  .applies_to_vars = c("qprel1", "qprel2", "qprel3", "qprel4", "qprel5", "qprel6"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no partner", `-1` = "no answer", `1` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("qprel7", "qprel8"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "no partner", `-1` = "no answer", `1` = "at least once a day", `2` = "a few times a week", `3` = "once a week", `4` = "once a month", `5` = "less than once a month",
  .applies_to_vars = c("qptalk"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPDEME",
  .applies_to_vars = c("qprespc1", "qprespc2", "qprespc3", "qprespc4"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KQPMEMO", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qpdeme"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qprespc1", "qprespc2", "qprespc3", "qprespc4"),
  .applies_to_waves = c("I", "J", "K")
)

.lasa_fc_139 <- .lasa_finalize_fc("139")

