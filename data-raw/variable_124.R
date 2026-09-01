## LASA filecode 124 -- variable names, variable labels, value labels,
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
  qmemo01 = "categorical",
  qmemo02 = "categorical",
  qmemo03 = "categorical",
  qmemo04 = "categorical",
  qmemo05 = "categorical",
  qmemo06 = "categorical",
  qmemo07 = "categorical",
  qmemo08 = "categorical",
  qmemo09 = "categorical",
  qmemo10 = "categorical",
  qmemo11 = "categorical",
  qmemo12 = "categorical",
  qmemo13 = "categorical",
  qmemo14 = "categorical",
  qmemo15 = "categorical",
  qmemo16 = "categorical",
  qmemo17 = "categorical",
  qmemo18 = "categorical",
  qmemo19 = "categorical",
  qmemo20 = "categorical",
  qmemo21 = "categorical",
  qmemo22 = "categorical",
  qmemo23 = "categorical",
  qmemo24 = "categorical",
  qmemo25 = "categorical",
  qmemo26 = "categorical",
  qmemo27 = "categorical",
  qmemo28 = "categorical",
  qmemo29 = "categorical",
  qmemo30 = "categorical",
  qmemo31 = "categorical",
  qmemo32 = "categorical",
  qmemo33 = "categorical",
  qmemo34 = "categorical",
  qmemo35 = "categorical",
  qmemo36 = "categorical",
  qmemo37 = "categorical",
  qmemo38 = "categorical",
  qmemo39 = "categorical",
  qmemo40 = "categorical",
  qmemo41 = "categorical"
)

# define variable labels ----
variable_labels(
  qmemo01 = "memory 01: important dates",
  qmemo02 = "memory 02: beginning of the day",
  qmemo03 = "memory 03: suitcase",
  qmemo04 = "memory 04: names and faces",
  qmemo05 = "memory 05: difficulties",
  qmemo06 = "memory 06: conscious",
  qmemo07 = "memory 07: other relation",
  qmemo08 = "memory 08: mental images",
  qmemo09 = "memory 09: mentally repeat",
  qmemo10 = "memory 10: reminders",
  qmemo11 = "memory 11: nervous",
  qmemo12 = "memory 12: remember names",
  qmemo13 = "memory 13: difficult if nervous",
  qmemo14 = "memory 14: 10 years",
  qmemo15 = "memory 15: problems",
  qmemo16 = "memory 16: introduce",
  qmemo17 = "memory 17: improve",
  qmemo18 = "memory 18: memory test",
  qmemo19 = "memory 19: practice",
  qmemo20 = "memory 20: questions",
  qmemo21 = "memory 21: use",
  qmemo22 = "memory 22: accurate",
  qmemo23 = "memory 23: tense",
  qmemo24 = "memory 24: declines",
  qmemo25 = "memory 25: did not do",
  qmemo26 = "memory 26: appointment",
  qmemo27 = "memory 27: exercise",
  qmemo28 = "memory 28: not as good",
  qmemo29 = "memory 29: decline when elder",
  qmemo30 = "memory 30: improve when practice",
  qmemo31 = "memory 31: always declines",
  qmemo32 = "memory 32: no improvement",
  qmemo33 = "memory 33: upset",
  qmemo34 = "memory 34: difficult when upset",
  qmemo35 = "memory 35: nervous new place",
  qmemo36 = "memory 36: proud",
  qmemo37 = "memory 37: admire others",
  qmemo38 = "memory 38: important to be precise",
  qmemo39 = "memory 39: self without help",
  qmemo40 = "memory 40: pleasant",
  qmemo41 = "memory 41: well",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qmemo01", "qmemo02", "qmemo03", "qmemo04", "qmemo05", "qmemo06", "qmemo07", "qmemo08", "qmemo09", "qmemo10", "qmemo11", "qmemo12", "qmemo13", "qmemo14", "qmemo15", "qmemo16", "qmemo17", "qmemo18", "qmemo19", "qmemo20", "qmemo21", "qmemo22", "qmemo23", "qmemo24", "qmemo25", "qmemo26", "qmemo27", "qmemo28", "qmemo29", "qmemo30",
  .applies_to_waves = c("B", "C", "D")
)

variable_labels(
  "qmemo31", "qmemo32", "qmemo33", "qmemo34", "qmemo35", "qmemo36", "qmemo37", "qmemo38", "qmemo39", "qmemo40", "qmemo41",
  .applies_to_waves = c("C", "D")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qmemo01", "qmemo02", "qmemo03", "qmemo04", "qmemo05", "qmemo06", "qmemo07", "qmemo08", "qmemo09", "qmemo10", "qmemo11", "qmemo12", "qmemo13", "qmemo14", "qmemo15", "qmemo16", "qmemo17", "qmemo18", "qmemo19", "qmemo20", "qmemo21", "qmemo22", "qmemo23", "qmemo24", "qmemo25", "qmemo26", "qmemo27", "qmemo28", "qmemo29", "qmemo30", "qmemo31", "qmemo32", "qmemo33", "qmemo34", "qmemo35", "qmemo36", "qmemo37", "qmemo38", "qmemo39", "qmemo40", "qmemo41"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "never", `2` = "seldom", `3` = "some of the time", `4` = "often", `5` = "always",
  .applies_to_vars = c("qmemo01", "qmemo02", "qmemo03", "qmemo04", "qmemo05", "qmemo06", "qmemo07", "qmemo08", "qmemo09", "qmemo10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qmemo11", "qmemo12", "qmemo13", "qmemo14", "qmemo15", "qmemo16", "qmemo17", "qmemo18", "qmemo19", "qmemo20", "qmemo21", "qmemo22", "qmemo23", "qmemo24", "qmemo25", "qmemo26", "qmemo27", "qmemo28", "qmemo29", "qmemo30", "qmemo31", "qmemo32", "qmemo33", "qmemo34", "qmemo35", "qmemo36", "qmemo37", "qmemo38", "qmemo39", "qmemo40", "qmemo41"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "never", `2` = "seldom", `3` = "some of the time", `4` = "often", `5` = "always",
  .applies_to_vars = c("qmemo01", "qmemo02", "qmemo03", "qmemo04", "qmemo05", "qmemo06", "qmemo07", "qmemo08", "qmemo09", "qmemo10"),
  .applies_to_waves = c("B", "C", "D")
)

value_labels(
  `-1` = "no answer", `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qmemo11", "qmemo12", "qmemo13", "qmemo14", "qmemo15", "qmemo16", "qmemo17", "qmemo18", "qmemo19", "qmemo20", "qmemo21", "qmemo22", "qmemo23", "qmemo24", "qmemo25", "qmemo26", "qmemo27", "qmemo28", "qmemo29", "qmemo30"),
  .applies_to_waves = c("B", "C", "D")
)

value_labels(
  `-1` = "no answer", `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qmemo31", "qmemo32", "qmemo33", "qmemo34", "qmemo35", "qmemo36", "qmemo37", "qmemo38", "qmemo39", "qmemo40", "qmemo41"),
  .applies_to_waves = c("C", "D")
)

.lasa_fc_124 <- .lasa_finalize_fc("124")

