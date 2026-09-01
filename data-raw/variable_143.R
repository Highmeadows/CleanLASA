## LASA filecode 143 -- variable names, variable labels, value labels,
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
  qmetem1 = "categorical",
  qmetem2 = "categorical",
  qmetem3 = "categorical",
  qmetem4 = "categorical"
)

# define variable labels ----
variable_labels(
  qmetem1 = "meta emotion item 01: emotional",
  qmetem2 = "meta emotion item 02: feelings",
  qmetem3 = "meta emotion item 03: satisfied",
  qmetem4 = "meta emotion item 04: change",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qmetem1", "qmetem2", "qmetem3", "qmetem4",
  .applies_to_waves = c("2B")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "absolutely not emotional", `2` = "a little emotional", `3` = "fairly emotional", `4` = "very emotional",
  .applies_to_vars = c("qmetem1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "very little", `2` = "little", `3` = "much", `4` = "very much",
  .applies_to_vars = c("qmetem2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "absolutely not satisfied", `2` = "a bit satisfied", `3` = "rather satisfied", `4` = "very satisfied",
  .applies_to_vars = c("qmetem3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "rarely or never", `2` = "sometimes", `3` = "often", `4` = "very often",
  .applies_to_vars = c("qmetem4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "absolutely not emotional", `2` = "a little emotional", `3` = "fairly emotional", `4` = "very emotional",
  .applies_to_vars = c("qmetem1"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-1` = "no answer", `1` = "very little", `2` = "little", `3` = "much", `4` = "very much",
  .applies_to_vars = c("qmetem2"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-1` = "no answer", `1` = "absolutely not satisfied", `2` = "a bit satisfied", `3` = "rather satisfied", `4` = "very satisfied",
  .applies_to_vars = c("qmetem3"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-1` = "no answer", `1` = "rarely or never", `2` = "sometimes", `3` = "often", `4` = "very often",
  .applies_to_vars = c("qmetem4"),
  .applies_to_waves = c("2B")
)

.lasa_fc_143 <- .lasa_finalize_fc("143")

