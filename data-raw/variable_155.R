## LASA filecode 155 -- variable names, variable labels, value labels,
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
  mcodt1 = "numeric",
  mcodt2 = "numeric",
  mcodt3 = "numeric",
  mcodtp = "categorical",
  mcodtp1 = "categorical",
  mcodtp2 = "categorical",
  mcodtp3 = "categorical",
  mcodtp4 = "categorical",
  mcodtp5 = "categorical",
  mcodtpoth = "text",
  mcormis = "categorical",
  mnotest = "categorical"
)

# define variable labels ----
variable_labels(
  mcodt1 = "Coding: trial 1",
  mcodt2 = "Coding: trial 2",
  mcodt3 = "Coding: trial 3",
  mcodtp = "particularities: no particularities",
  mcodtp1 = "particularities: others present",
  mcodtp2 = "particularities: visually handicapped",
  mcodtp3 = "particularities: radio or tv noise",
  mcodtp4 = "particularities: interrupted",
  mcodtp5 = "particularities: other reason",
  mcodtpoth = "particularities other specification",
  mcormis = "Coding task: reason no trail(s)",
  mnotest = "(part of) Coding test done",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mcodt1", "mcodt2", "mcodt3", "mcodtp", "mcodtp1", "mcodtp2", "mcodtp3", "mcodtp4", "mcodtp5", "mnotest",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "mcodtpoth",
  .applies_to_waves = c("B", "C", "D", "2B", "J")
)

variable_labels(
  "mcormis",
  .applies_to_waves = c("F", "G", "H", "3B")
)

variable_labels(
  mcormis = "coding task: reason no trial(s)",
  .applies_to_waves = c("B", "C", "D", "2B")
)

# define value labels ----
value_labels(
  `-1` = "no trial",
  .applies_to_vars = c("mcodt1", "mcodt2", "mcodt3"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-4` = "no valid data",
  .applies_to_vars = c("mcodt1", "mcodt2", "mcodt3"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-4` = "no valid data", `-3` = "no test", `-2` = "no particularities", `0` = "not mentioned / no", `1` = "mentioned / yes",
  .applies_to_vars = c("mcodtp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "no valid data", `-3` = "no test", `-2` = "no particularities", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcodtp1", "mcodtp2", "mcodtp3", "mcodtp4", "mcodtp5"),
  .applies_to_waves = c("Z", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-4` = "no valid data", `-3` = "no test", `-2` = "no particularities", `-1` = "no others mentioned", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit", `4` = "stopped/technical", `5` = "not specified",
  .applies_to_vars = c("mcodtpoth"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-4` = "no valid data", `-2` = "valid score", `0` = "complete test done / to be coded", `1` = "visus problems / short interview", `2` = "refused / interview terminated", `3` = "cognitive / too many missings", `4` = "physical / refused test", `5` = "technical / not able to (cognitive)", `6` = "unknown / not able to (physical)", `7` = "technical/interruption",
  .applies_to_vars = c("mcormis"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "no valid data", `0` = "test not done", `1` = "1 trial done", `2` = "2 trials done", `3` = "3 trials done",
  .applies_to_vars = c("mnotest"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcodtp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities", `-1` = "no others mentioned", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit", `4` = "stopped/technical", `5` = "not specified",
  .applies_to_vars = c("mcodtpoth"),
  .applies_to_waves = c("B", "C", "D", "2B")
)

value_labels(
  `-4` = "no valid data", `0` = "complete test done", `1` = "visus problems", `2` = "refused", `3` = "cognitive", `4` = "physical", `5` = "technical", `6` = "unknown",
  .applies_to_vars = c("mcormis"),
  .applies_to_waves = c("B", "C", "D", "2B")
)

value_labels(
  `-4` = "no valid data", `-3` = "no test", `-2` = "no particularities", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcodtp"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-4` = "no valid data", `-3` = "no test", `0` = "no", `1` = "yes",
  .applies_to_vars = c("mcodtp"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "valid score", `0` = "to be coded", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to (cognitive)", `6` = "not able to (physical)", `7` = "technical/interruption",
  .applies_to_vars = c("mcormis"),
  .applies_to_waves = c("F", "G", "H", "3B")
)

.lasa_fc_155 <- .lasa_finalize_fc("155")

