## LASA filecode 356 -- variable names, variable labels, value labels,
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
  mdelta = "numeric",
  mrecal = "numeric",
  mret1pc = "numeric",
  mret2pc = "numeric",
  mtmax = "numeric",
  mtotal = "numeric",
  mwtdr = "numeric",
  mwtt1 = "numeric",
  mwtt2 = "numeric",
  mwtt3 = "numeric"
)

# define variable labels ----
variable_labels(
  mdelta = "Learning effect: highest-lowest trial score",
  mrecal = "15-word test time interval in minutes",
  mret1pc = "Retention 1",
  mret2pc = "Retention 2",
  mtmax = "Maximum score across trials 1-3",
  mtotal = "Learning/memory total across trials 1-3",
  mwtdr = "Number of words correct: delayed recall",
  mwtt1 = "Number of words correct: trial 1",
  mwtt2 = "Number of words correct: trial 2",
  mwtt3 = "Number of words correct: trial 3",
  .applies_to_waves = c("Z")
)

variable_labels(
  mdelta = "learning effect highest-lowest",
  mwtdr = "number of words delayed recall",
  mwtt1 = "number of words correct: trial 1",
  mwtt2 = "number of words correct: trial 2",
  mwtt3 = "number of words correct: trial 3",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  mrecal = "15 word test time interval in minutes",
  mret1pc = "retention 1: bmwtdr/bmwtt3",
  mtmax = "maximum score: Highest on 1, 2, 3",
  .applies_to_waves = c("B")
)

variable_labels(
  mtotal = "learning/memory: total of 1, 2 and 3",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  mret1pc = "retention 1: cmwtdr/cmwtt3",
  .applies_to_waves = c("C")
)

variable_labels(
  mtmax = "maximum score: highest on 1, 2, 3",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  mdelta = "learning highest-lowest",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  mret1pc = "retention 1: dmwtdr - dmwtt3",
  mret2pc = "retention 2: dmwtdr - dmtmax",
  .applies_to_waves = c("D")
)

variable_labels(
  mret1pc = "retention 1: emwtdr - emwtt3",
  mret2pc = "retention 2: emwtdr - emtmax",
  .applies_to_waves = c("E")
)

variable_labels(
  mret1pc = "retention 1: bmwtdr - bmwtt3",
  mret2pc = "retention 2: bmwtdr - bmtmax",
  .applies_to_waves = c("2B", "3B")
)

variable_labels(
  mret1pc = "retention 1: fmwtdr - fmwtt3",
  mret2pc = "retention 2: fmwtdr - fmtmax",
  .applies_to_waves = c("F")
)

variable_labels(
  mret1pc = "retention 1: gmwtdr - gmwtt3",
  mret2pc = "retention 2: gmwtdr - gmtmax",
  .applies_to_waves = c("G")
)

variable_labels(
  mret1pc = "retention 1: hmwtdr - hmwtt3",
  mret2pc = "retention 2: hmwtdr - hmtmax",
  .applies_to_waves = c("H")
)

variable_labels(
  mret1pc = "retention 1: imwtdr - imwtt3",
  mret2pc = "retention 2: imwtdr - imtmax",
  .applies_to_waves = c("I")
)

variable_labels(
  mret1pc = "retention 1: jmwtdr - jmwtt3",
  mret2pc = "retention 2: jmwtdr - jmtmax",
  .applies_to_waves = c("J")
)

variable_labels(
  mret1pc = "retention 1: kmwtdr - kmwtt3",
  mret2pc = "retention 2: kmwtdr - kmtmax",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mret1pc", "mtmax"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "recall test not done",
  .applies_to_vars = c("mret1pc"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "test not done",
  .applies_to_vars = c("mtotal"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no valid time data", `-1` = "test not done",
  .applies_to_vars = c("mrecal"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "no valid data",
  .applies_to_vars = c("mtmax"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-4` = "interview terminated",
  .applies_to_vars = c("mtotal"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-4` = "interview terminated", `-2` = "zero on trial",
  .applies_to_vars = c("mwtt1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "test not done",
  .applies_to_vars = c("mwtt2"),
  .applies_to_waves = c("Z", "B", "C")
)

value_labels(
  `-2` = "zero on trial",
  .applies_to_vars = c("mwtt1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "interview terminated",
  .applies_to_vars = c("mwtt1"),
  .applies_to_waves = c("C")
)

.lasa_fc_356 <- .lasa_finalize_fc("356")

