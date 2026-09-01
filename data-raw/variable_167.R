## LASA filecode 167 -- variable names, variable labels, value labels,
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
  mnwctf1 = "categorical",
  mnwctf2 = "categorical",
  mnwctf3 = "categorical",
  mnwctf4 = "categorical",
  mnwctf6 = "categorical",
  mnwctf8 = "categorical",
  nwctf1 = "categorical",
  nwctf2 = "categorical",
  nwctf3 = "categorical",
  nwctf4 = "categorical",
  nwctf5 = "categorical",
  nwctf6 = "categorical",
  nwctf7 = "categorical",
  nwctf8 = "categorical",
  reschild = "categorical",
  resinlaws = "categorical",
  resotherkin = "categorical",
  ressibs = "categorical"
)

# define variable labels ----
variable_labels(
  mnwctf1 = "contact frequency children (not co-residing)",
  mnwctf2 = "contact frequency grandchildren (not co-residing)",
  mnwctf3 = "contact frequency children-in-law",
  mnwctf4 = "contact frequency uncles, aunts, siblings, in-laws",
  mnwctf6 = "contact frequency friends, acquaintances",
  mnwctf8 = "contact frequency neighbors",
  nwctf1 = "contact frequency children (not co-residing)",
  nwctf2 = "contact frequency grandchildren (not co-residing)",
  nwctf3 = "contact frequency children-in-law",
  nwctf4 = "contact frequency uncles, aunts, siblings, in-laws",
  nwctf5 = "contact frequency MT friends, acquaintances",
  nwctf6 = "contact frequency NL/other friends, acquaintances",
  nwctf7 = "contact frequency MT neighbors",
  nwctf8 = "contact frequency NL/other neighbors",
  reschild = "residence of children (in-law): Netherlands or abroad",
  resinlaws = "residence of in-laws: Netherlands or abroad",
  resotherkin = "residence of other kin: Netherlands or abroad",
  ressibs = "residence of siblings: Netherlands or abroad",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mnwctf1", "mnwctf2", "mnwctf3", "mnwctf4", "mnwctf6", "mnwctf8",
  .applies_to_waves = c("3B", "I")
)

variable_labels(
  "nwctf1", "nwctf2", "nwctf3", "nwctf4", "nwctf5", "nwctf6", "nwctf7", "nwctf8",
  .applies_to_waves = c("MB")
)

variable_labels(
  reschild = "residence children (in-law): in NL or abroad",
  resinlaws = "residence in-laws: in NL or abroad",
  resotherkin = "residence other kin: in NL or abroad",
  ressibs = "residence siblings: in NL or abroad",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-4` = "no medical interview", `-3` = "not asked (interview terminated)",
  .applies_to_vars = c("mnwctf1", "mnwctf2", "mnwctf3", "mnwctf4", "mnwctf6", "mnwctf8"),
  .applies_to_waves = c("Z", "3B", "I")
)

value_labels(
  `-3` = "not asked (interview terminated/skip)",
  .applies_to_vars = c("nwctf1", "nwctf2", "nwctf3", "nwctf4", "nwctf5", "nwctf6", "nwctf7", "nwctf8", "reschild", "resinlaws", "resotherkin", "ressibs"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-2` = "answer: not applicable", `-1` = "na, asked", `1` = "never or less than once a year", `2` = "once or few times a year", `3` = "once or few times a month", `4` = "once or few times a week", `5` = "daily",
  .applies_to_vars = c("mnwctf1", "mnwctf2", "mnwctf3", "mnwctf4", "mnwctf6", "mnwctf8"),
  .applies_to_waves = c("Z", "3B", "I")
)

value_labels(
  `-2` = "answer: not applicable", `-1` = "na, asked",
  .applies_to_vars = c("nwctf1", "nwctf2", "nwctf3", "nwctf4", "nwctf5", "nwctf6", "nwctf7", "nwctf8"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-2` = "answer: not applicable", `-1` = "na, asked", `1` = "in Netherlands", `2` = "in Morocco/Turkey", `3` = "elsewhere", `4` = "equal number in Morocco/Turkey and NL",
  .applies_to_vars = c("reschild", "resinlaws", "resotherkin", "ressibs"),
  .applies_to_waves = c("Z", "MB")
)

.lasa_fc_167 <- .lasa_finalize_fc("167")

