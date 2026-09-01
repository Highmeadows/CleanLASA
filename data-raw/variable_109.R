## LASA filecode 109 -- variable names, variable labels, value labels,
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
  qpchc05 = "categorical",
  qpchc06 = "categorical",
  qpchc07 = "categorical",
  qpchc08 = "categorical",
  qpchc09 = "categorical",
  qpchc10 = "categorical",
  qpchc11 = "categorical",
  qpchc12 = "categorical",
  qpchc13 = "categorical",
  qpchc14 = "categorical",
  qpchc15 = "categorical",
  qpchc17 = "categorical",
  qpchc18 = "categorical"
)

# define variable labels ----
variable_labels(
  qpchc05 = "Perceived control in health care: I know when it is time to call in care",
  qpchc06 = "Perceived control in health care: I can find information about health or care when I need it",
  qpchc07 = "Perceived control in health care: I will find out if there are any aids or services I could really use",
  qpchc08 = "Perceived control in health care: I know where to apply for care, aids or services",
  qpchc09 = "Perceived control in health care: I am able to arrange any care, aids or services I need",
  qpchc10 = "Perceived control in health care: I understand the regulations of care organisations that are relevant for me",
  qpchc11 = "Perceived control in health care: I can manage to get to my healthcare professional(s) when I need to",
  qpchc12 = "Perceived control in health care: I can keep track of all appointments with my healthcare professional(s)",
  qpchc13 = "Perceived control in health care: I explain what is going on to my healthcare professional(s)",
  qpchc14 = "Perceived control in health care: I ask any questions I have about my health or treatment",
  qpchc15 = "Perceived control in health care: I indicate any wishes I have",
  qpchc17 = "Perceived control in health care: I can deal with the medication I am prescribed by my healthcare professional(s)",
  qpchc18 = "Perceived control in health care: I am able to carry out the recommendations I am prescribed by my healthcare professional(s)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qpchc05", "qpchc06", "qpchc07", "qpchc08", "qpchc09", "qpchc10", "qpchc11", "qpchc12", "qpchc13", "qpchc14", "qpchc15", "qpchc17", "qpchc18",
  .applies_to_waves = c("I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("qpchc05", "qpchc06", "qpchc07", "qpchc08", "qpchc09", "qpchc10", "qpchc11", "qpchc12", "qpchc13", "qpchc14", "qpchc15", "qpchc17", "qpchc18"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no (dis)agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qpchc05", "qpchc06", "qpchc07", "qpchc08", "qpchc09", "qpchc10", "qpchc11", "qpchc12", "qpchc13", "qpchc14", "qpchc15"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no (dis)agreement", `4` = "agree", `5` = "strongly agree", `6` = "not applicable",
  .applies_to_vars = c("qpchc17", "qpchc18"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

.lasa_fc_109 <- .lasa_finalize_fc("109")

