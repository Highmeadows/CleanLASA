## LASA filecode 168 -- variable names, variable labels, value labels,
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
  mcat1 = "text",
  mcat2 = "text",
  mcat3 = "text",
  mcat4 = "text",
  mcat5 = "text",
  mcat6 = "text",
  mcat7 = "text",
  mcat8 = "text",
  mcattot = "numeric",
  mlftd = "categorical",
  mlftrn = "categorical"
)

# define variable labels ----
variable_labels(
  mcat1 = "CAT1: cough",
  mcat2 = "CAT2: production of phlegm",
  mcat3 = "CAT3: chest tightness",
  mcat4 = "CAT4: breathlessness",
  mcat5 = "CAT5: activity limitation",
  mcat6 = "CAT6: confidence",
  mcat7 = "CAT7: sleep",
  mcat8 = "CAT8: energy",
  mcattot = "CAT total score",
  mlftd = "long-function test done",
  mlftrn = "reason long-function test not done",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mcat1", "mcat2", "mcat3", "mcat4", "mcat5", "mcat6", "mcat7", "mcat8", "mcattot",
  .applies_to_waves = c("3B")
)

variable_labels(
  mlftd = "Long function: test done",
  mlftrn = "Long function: reason test not done",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mcat1", "mcat2", "mcat3", "mcat4", "mcat5", "mcat6", "mcat7", "mcat8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("mcattot"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-1` = "test not completed / no response", `2` = "yes",
  .applies_to_vars = c("mlftd"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "LF test done", `1` = "device not working or parts missing", `2` = "physical reasons", `3` = "R does not want to perform spirometry", `4` = "limited time", `5` = "no medication", `6` = "environment not suitable", `7` = "unknown",
  .applies_to_vars = c("mlftrn"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-1` = "no answer, asked",
  .applies_to_vars = c("mcat1", "mcat2", "mcat3", "mcat4", "mcat5", "mcat6", "mcat7", "mcat8"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-1` = "no answer, asked", `2` = "yes",
  .applies_to_vars = c("mlftd"),
  .applies_to_waves = c("3B")
)

.lasa_fc_168 <- .lasa_finalize_fc("168")

