## LASA filecode 117 -- variable names, variable labels, value labels,
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
  qsleep1 = "numeric",
  qsleep2 = "categorical",
  qsleep3 = "categorical",
  qsleep4 = "categorical",
  qsleep5 = "categorical",
  qsleeph = "numeric",
  qsleepm = "numeric"
)

# define variable labels ----
variable_labels(
  qsleep1 = "Sleep 1: hours sleep in 24 hours",
  qsleep2 = "Sleep 2: falling a sleep",
  qsleep3 = "Sleep 3: continue sleeping",
  qsleep4 = "Sleep 4: awake too early",
  qsleep5 = "Sleep 5: sleep quality past month",
  qsleeph = "going to sleep: hour of the day",
  qsleepm = "going to sleep: minute",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qsleep1", "qsleep2", "qsleep3",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "qsleep4", "qsleeph", "qsleepm",
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

variable_labels(
  qsleep4 = "Sleep 4: awake to early",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F")
)

variable_labels(
  qsleep5 = "sleep 5: sleep quality past month",
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qsleep1", "qsleeph", "qsleepm"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "almost never", `2` = "some of the time", `3` = "often", `4` = "most of the time",
  .applies_to_vars = c("qsleep2", "qsleep3", "qsleep4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "very good", `2` = "somewhat good", `3` = "somewhat bad", `4` = "very bad",
  .applies_to_vars = c("qsleep5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qsleep1"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "almost never", `2` = "some of the time", `3` = "often", `4` = "most of the time",
  .applies_to_vars = c("qsleep2", "qsleep3", "qsleep4"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "very good", `2` = "somewhat good", `3` = "somewhat bad", `4` = "very bad",
  .applies_to_vars = c("qsleep5"),
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qsleeph"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qsleepm"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

.lasa_fc_117 <- .lasa_finalize_fc("117")

