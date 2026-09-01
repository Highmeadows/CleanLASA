## LASA filecode 128 -- variable names, variable labels, value labels,
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
  qdona1 = "categorical",
  qdona1_2 = "categorical",
  qdona1_3 = "categorical",
  qdona1_4 = "categorical",
  qdona1_5 = "categorical",
  qdona2 = "categorical",
  qdona3 = "numeric",
  qdona4 = "categorical",
  qdona5 = "numeric",
  qdona6 = "categorical",
  qdona7 = "categorical",
  qdona8 = "categorical"
)

# define variable labels ----
variable_labels(
  qdona1 = "registered as a blood or plasma donor",
  qdona1_2 = "New donor law: returned form about organ donation",
  qdona1_3 = "Previous decision about organ donation",
  qdona1_4 = "Choice changed since the new donor law",
  qdona1_5 = "Current decision about organ donation",
  qdona2 = "ever registered as a blood or plasma donor",
  qdona3 = "former blood or plasma donor: until which year registered",
  qdona4 = "former blood or plasma donor: reason stopped",
  qdona5 = "former blood or plasma donor: from which year first registration",
  qdona6 = "current blood or plasma donor: how often donation past 12 months",
  qdona7 = "received form from ministry about organ donation",
  qdona8 = "decision about organ donation",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qdona1",
  .applies_to_waves = c("I", "J")
)

variable_labels(
  "qdona2", "qdona3", "qdona4", "qdona5", "qdona6", "qdona7", "qdona8",
  .applies_to_waves = c("I")
)

variable_labels(
  "qdona1_2", "qdona1_3", "qdona1_4", "qdona1_5",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qdona1", "qdona1_2", "qdona1_3", "qdona1_4", "qdona1_5", "qdona3", "qdona4", "qdona5", "qdona6", "qdona7", "qdona8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes, blood", `2` = "yes, plasma", `3` = "no",
  .applies_to_vars = c("qdona1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes", `2` = "no", `3` = "do not know",
  .applies_to_vars = c("qdona1_2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "I do not make my organs available", `2` = "I make all my organs available", `3` = "I make some organs available", `4` = "I leave the choice to my next of kin", `5` = "I do not know / do not want to say it",
  .applies_to_vars = c("qdona1_3", "qdona1_5", "qdona8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qdona1_4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "yes, blood", `2` = "yes, plasma", `3` = "no",
  .applies_to_vars = c("qdona2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("qdona3", "qdona5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "disapproved based on age", `2` = "disapproved for health reasons", `3` = "no time anymore", `4` = "not interested anymore", `5` = "other reason",
  .applies_to_vars = c("qdona4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "more than once a month", `2` = "once a month", `3` = "2-3 times", `4` = "once", `5` = "not at all", `6` = "R does not know",
  .applies_to_vars = c("qdona6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes", `2` = "no", `3` = "R does not know anymore",
  .applies_to_vars = c("qdona7"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, blood", `2` = "yes, plasma", `3` = "no",
  .applies_to_vars = c("qdona1"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see IQDONA1", `1` = "yes, blood", `2` = "yes, plasma", `3` = "no",
  .applies_to_vars = c("qdona2"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IQDONA2", `-1` = "na, asked",
  .applies_to_vars = c("qdona3", "qdona5"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IQDONA2", `-1` = "na, asked", `1` = "disapproved based on age", `2` = "disapproved for health reasons", `3` = "no time anymore", `4` = "not interested anymore", `5` = "other reason",
  .applies_to_vars = c("qdona4"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IQDONA1", `-1` = "na, asked", `1` = "more than once a month", `2` = "once a month", `3` = "2-3 times", `4` = "once", `5` = "not at all", `6` = "R does not know",
  .applies_to_vars = c("qdona6"),
  .applies_to_waves = c("I")
)

value_labels(
  `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know anymore",
  .applies_to_vars = c("qdona7"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IQDONA7", `-1` = "na, asked", `1` = "I do not make my organs available", `2` = "I make all my organs available", `3` = "I make some organs available", `4` = "I leave the choice to my next of kin", `5` = "I do not know / do not want to say it",
  .applies_to_vars = c("qdona8"),
  .applies_to_waves = c("I")
)

value_labels(
  `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "do not know",
  .applies_to_vars = c("qdona1_2"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JQDONA1_2", `-1` = "na, asked", `1` = "I do not make my organs available", `2` = "I make all my organs available", `3` = "I make some organs available", `4` = "I leave the choice to my next of kin", `5` = "I do not know / do not want to say it",
  .applies_to_vars = c("qdona1_3"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JQDONA1_2", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qdona1_4"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JQDONA1_4", `-1` = "na, asked", `1` = "I do not make my organs available", `2` = "I make all my organs available", `3` = "I make some organs available", `4` = "I leave the choice to my next of kin", `5` = "I do not know / do not want to say it",
  .applies_to_vars = c("qdona1_5"),
  .applies_to_waves = c("J")
)

.lasa_fc_128 <- .lasa_finalize_fc("128")

