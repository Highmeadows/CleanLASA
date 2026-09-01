## LASA filecode 133 -- variable names, variable labels, value labels,
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
  quli01 = "categorical",
  quli02 = "categorical",
  quli03 = "categorical",
  quli04 = "categorical",
  quli05 = "categorical",
  quli06 = "categorical",
  quli07 = "categorical",
  quli08 = "categorical",
  quli09 = "categorical",
  quli10 = "categorical",
  quli11 = "categorical",
  quli12 = "categorical",
  quli13 = "categorical",
  quli14 = "categorical"
)

# define variable labels ----
variable_labels(
  quli01 = "SF12-01: GH, general health",
  quli02 = "SF12-02: PF, moderate activities",
  quli03 = "SF12-03: PF, climbing stairs",
  quli04 = "SF12-04: RP, physical accomplished less",
  quli05 = "SF12-05: RP, limited in activities",
  quli06 = "SF12-06: RE, mental accomplished less",
  quli07 = "SF12-07: RE, work not careful",
  quli08 = "SF12-08: BP, pain",
  quli09 = "SF12-09: MH, calm",
  quli10 = "SF12-10: VT, energy",
  quli11 = "SF12-11: MH, blue",
  quli12 = "SF12-12: SF, social activities",
  quli13 = "WHOQOL: rating quality of life",
  quli14 = "WHOQOL: feeling life is meaningful",
  .applies_to_waves = c("Z")
)

variable_labels(
  "quli01", "quli02", "quli03", "quli04", "quli05", "quli06", "quli07", "quli08", "quli09", "quli10", "quli11", "quli12",
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "quli13", "quli14",
  .applies_to_waves = c("I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("quli01", "quli02", "quli03", "quli04", "quli05", "quli06", "quli07", "quli08", "quli09", "quli10", "quli11", "quli12", "quli13", "quli14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "excellent", `2` = "very good", `3` = "good", `4` = "fair", `5` = "poor",
  .applies_to_vars = c("quli01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes, limited a lot", `2` = "yes, limited a little", `3` = "no, not limited at all",
  .applies_to_vars = c("quli02", "quli03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes", `2` = "no",
  .applies_to_vars = c("quli04", "quli05", "quli06", "quli07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "not at all", `2` = "a little bit", `3` = "moderately", `4` = "quite a bit", `5` = "extremely",
  .applies_to_vars = c("quli08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "all of the time", `2` = "most of the time", `3` = "a good bit of the time", `4` = "some of the time", `5` = "a little of the time", `6` = "none of the time",
  .applies_to_vars = c("quli09", "quli10", "quli11", "quli12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "very poor", `2` = "rather poor", `3` = "neither poor nor good", `4` = "rather good", `5` = "very good",
  .applies_to_vars = c("quli13"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "not at all", `2` = "a little", `3` = "a moderate amount", `4` = "very much", `5` = "an extreme amount",
  .applies_to_vars = c("quli14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "asked, no answer", `1` = "excellent", `2` = "very good", `3` = "good", `4` = "fair", `5` = "poor",
  .applies_to_vars = c("quli01"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "asked, no answer", `1` = "yes, limited a lot", `2` = "yes, limited a little", `3` = "no, not limited at all",
  .applies_to_vars = c("quli02", "quli03"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "asked, no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("quli04", "quli05", "quli06", "quli07"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "asked, no answer", `1` = "not at all", `2` = "a little bit", `3` = "moderately", `4` = "quite a bit", `5` = "extremely",
  .applies_to_vars = c("quli08"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "asked, no answer", `1` = "all of the time", `2` = "most of the time", `3` = "a good bit of the time", `4` = "some of the time", `5` = "a little of the time", `6` = "none of the time",
  .applies_to_vars = c("quli09", "quli10", "quli11", "quli12"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "asked, no answer", `1` = "very poor", `2` = "rather poor", `3` = "neither poor nor good", `4` = "rather good", `5` = "very good",
  .applies_to_vars = c("quli13"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-1` = "asked, no answer", `1` = "not at all", `2` = "a little", `3` = "a moderate amount", `4` = "very much", `5` = "an extreme amount",
  .applies_to_vars = c("quli14"),
  .applies_to_waves = c("I", "J", "K")
)

.lasa_fc_133 <- .lasa_finalize_fc("133")

