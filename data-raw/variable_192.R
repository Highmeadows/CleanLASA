## LASA filecode 192 -- variable names, variable labels, value labels,
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
  mvcm101 = "categorical",
  mvcm102 = "categorical",
  mvcm103 = "categorical",
  mvcm104 = "categorical",
  mvcm105 = "categorical",
  mvcm106 = "categorical",
  mvcm107 = "categorical",
  mvcm108 = "categorical",
  mvcm109 = "categorical",
  mvcm110 = "categorical",
  mvq1 = "categorical",
  mvq2 = "categorical"
)

# define variable labels ----
variable_labels(
  mvcm101 = "VCM1: feeling ashamed",
  mvcm102 = "VCM1: feeling frustrated or annoyed",
  mvcm103 = "VCM1: feeling lonely or abandoned",
  mvcm104 = "VCM1: feeling sad or unhappy",
  mvcm105 = "VCM1: worried about decline of eyesight",
  mvcm106 = "VCM1: worried about general safety at home",
  mvcm107 = "VCM1: worried about general safety outdoors",
  mvcm108 = "VCM1: worried about dealing with daily life",
  mvcm109 = "VCM1: eyesight an obstacle for things you wanted to do",
  mvcm110 = "VCM1: eyesight an obstacle for life in general",
  mvq1 = "eye surgery or eye/vision measurement in past month",
  mvq2 = "different glasses/contacts or change of eyesight in past month",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mvcm101", "mvcm102", "mvcm103", "mvcm104", "mvcm105", "mvcm106", "mvcm107", "mvcm108", "mvcm109", "mvcm110", "mvq1", "mvq2",
  .applies_to_waves = c("E", "F", "G", "H")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mvcm101", "mvcm102", "mvcm103", "mvcm104", "mvcm105", "mvcm106", "mvcm107", "mvcm108", "mvcm109", "mvcm110", "mvq1", "mvq2"),
  .applies_to_waves = c("Z", "E", "F", "G", "H")
)

value_labels(
  `1` = "never", `2` = "seldom", `3` = "sometimes", `4` = "reasonably often", `5` = "often", `6` = "very often",
  .applies_to_vars = c("mvcm101", "mvcm102", "mvcm103", "mvcm104", "mvcm105", "mvcm106", "mvcm107", "mvcm108", "mvcm109", "mvcm110"),
  .applies_to_waves = c("Z", "E", "F", "G", "H")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("mvq1", "mvq2"),
  .applies_to_waves = c("Z", "E", "F", "G", "H")
)

.lasa_fc_192 <- .lasa_finalize_fc("192")

