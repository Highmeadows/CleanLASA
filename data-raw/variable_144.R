## LASA filecode 144 -- variable names, variable labels, value labels,
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
  qindf01 = "categorical",
  qindf02 = "categorical",
  qindf03 = "categorical",
  qindf04 = "categorical",
  qindf05 = "categorical",
  qindf06 = "categorical",
  qindf07 = "categorical",
  qindf08 = "categorical",
  qindf09 = "categorical",
  qindf10 = "categorical",
  qindf11 = "categorical",
  qindf12 = "categorical",
  qindf13 = "categorical",
  qindf14 = "categorical",
  qindf15 = "categorical",
  qindf16 = "categorical",
  qindf17 = "numeric"
)

# define variable labels ----
variable_labels(
  qindf01 = "able to do things for myself",
  qindf02 = "proud to take care of myself",
  qindf03 = "bothers me when others notice",
  qindf04 = "live independently not very important",
  qindf05 = "does not bother me when unable to do a task",
  qindf06 = "important to work at sustaining my independence",
  qindf07 = "trying to improve my ability to function on my own",
  qindf08 = "admire people who live on their own",
  qindf09 = "friends often notice my self-sufficiency",
  qindf10 = "often notice my friends self-sufficiency",
  qindf11 = "be very accurate when remembering appointments",
  qindf12 = "be very accurate when taking my medications",
  qindf13 = "bothers me when unable to run errands on my own",
  qindf14 = "do things on my own, without relying on other people",
  qindf15 = "highly motivated to do things on my own",
  qindf16 = "great satisfaction to accomplish tasks independently",
  qindf17 = "ability to cope, independently or with help from others (score from 1 to 10)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qindf01", "qindf02", "qindf03", "qindf04", "qindf05", "qindf06", "qindf07", "qindf08", "qindf09", "qindf10", "qindf11", "qindf12", "qindf13", "qindf14", "qindf15", "qindf16",
  .applies_to_waves = c("F", "G", "H", "I", "J", "K")
)

variable_labels(
  "qindf17",
  .applies_to_waves = c("I")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qindf01", "qindf02", "qindf03", "qindf04", "qindf05", "qindf06", "qindf07", "qindf08", "qindf09", "qindf10", "qindf11", "qindf12", "qindf13", "qindf14", "qindf15", "qindf16", "qindf17"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qindf01", "qindf02", "qindf03", "qindf04", "qindf05", "qindf06", "qindf07", "qindf08", "qindf09", "qindf10", "qindf11", "qindf12", "qindf13", "qindf14", "qindf15", "qindf16"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/disagreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qindf01", "qindf02", "qindf03", "qindf04", "qindf05", "qindf06", "qindf07", "qindf08", "qindf09", "qindf10", "qindf11", "qindf12", "qindf13", "qindf14", "qindf15", "qindf16"),
  .applies_to_waves = c("F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qindf17"),
  .applies_to_waves = c("I")
)

.lasa_fc_144 <- .lasa_finalize_fc("144")

