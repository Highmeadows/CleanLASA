## LASA filecode 148 -- variable names, variable labels, value labels,
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
  qeoldt1 = "categorical",
  qeoldt2 = "categorical",
  qeoldt3 = "categorical",
  qeoldt4 = "categorical",
  qeoldt5 = "categorical",
  qvgcan1 = "categorical",
  qvgcan2 = "categorical",
  qvgcan3 = "categorical",
  qvgcan4 = "categorical",
  qvgcan5 = "categorical",
  qvgdem1 = "categorical",
  qvgdem2 = "categorical",
  qvgdem3 = "categorical",
  qvgdem4 = "categorical",
  qvgdem5 = "categorical"
)

# define variable labels ----
variable_labels(
  qeoldt1 = "EOL: dec. treatm.: R self",
  qeoldt2 = "EOL: dec. treatm.: R self after consulting GP",
  qeoldt3 = "EOL: dec. treatm.: R self and GP",
  qeoldt4 = "EOL: dec. treatm.: GP after consulting R self",
  qeoldt5 = "EOL: dec. treatm.: GP",
  qvgcan1 = "vignet cancer: nasal gastric tube",
  qvgcan2 = "vignet cancer: antibiotics",
  qvgcan3 = "vignet cancer: resuscitation",
  qvgcan4 = "vignet cancer: mechanical respiration",
  qvgcan5 = "vignet cancer: euthanasia",
  qvgdem1 = "vignet dementia: nasal gastric tube",
  qvgdem2 = "vignet dementia: antibiotics",
  qvgdem3 = "vignet dementia: resuscitation",
  qvgdem4 = "vignet dementia: mechanical respiration",
  qvgdem5 = "vignet dementia: euthanasia",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qeoldt1", "qeoldt2", "qeoldt3", "qeoldt4", "qeoldt5", "qvgcan1", "qvgcan2", "qvgcan3", "qvgcan4", "qvgcan5", "qvgdem1", "qvgdem2", "qvgdem3", "qvgdem4", "qvgdem5",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qeoldt1", "qeoldt2", "qeoldt3", "qeoldt4", "qeoldt5", "qvgcan1", "qvgcan2", "qvgcan3", "qvgcan4", "qvgcan5", "qvgdem1", "qvgdem2", "qvgdem3", "qvgdem4", "qvgdem5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned",
  .applies_to_vars = c("qeoldt1", "qeoldt2", "qeoldt3", "qeoldt4", "qeoldt5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no",
  .applies_to_vars = c("qvgcan1", "qvgcan2", "qvgcan3", "qvgcan4", "qvgcan5", "qvgdem1", "qvgdem2", "qvgdem3", "qvgdem4", "qvgdem5"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-1` = "no answer, asked",
  .applies_to_vars = c("qvgcan1", "qvgcan2", "qvgcan3", "qvgcan4", "qvgcan5", "qvgdem1", "qvgdem2", "qvgdem3", "qvgdem4", "qvgdem5"),
  .applies_to_waves = c("G")
)

value_labels(
  `-1` = "mentioned", `0` = "not mentioned",
  .applies_to_vars = c("qeoldt1", "qeoldt2", "qeoldt3", "qeoldt4", "qeoldt5"),
  .applies_to_waves = c("G")
)

.lasa_fc_148 <- .lasa_finalize_fc("148")

