## LASA filecode 714 -- variable names, variable labels, value labels,
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
  trapp6m = "categorical",
  trapp7d = "categorical",
  trestw = "categorical",
  trmed155 = "numeric",
  trvac144 = "categorical",
  trvar142 = "categorical",
  trvar143G = "numeric",
  trvar143L = "numeric",
  trvar144G = "categorical",
  trvar144L = "categorical",
  trvc144G = "categorical",
  trvc144L = "categorical"
)

# define variable labels ----
variable_labels(
  trapp6m = "Appetite last 6 months",
  trapp7d = "Appetite last 7 days",
  trestw = "Estimation body weight",
  trmed155 = "Weight: self-report",
  trvac144 = "Weight change other reason: coded",
  trvar142 = "Weight change last 6 months",
  trvar143G = "Weight gain kilogram",
  trvar143L = "Weight loss kilogram",
  trvar144G = "Weight gain reason",
  trvar144L = "Weight loss reason",
  trvc144G = "Reason weight gain (constructed)",
  trvc144L = "Reason weight loss (constructed)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trapp6m",
  .applies_to_waves = c("I")
)

variable_labels(
  "trestw", "trmed155", "trvac144", "trvar142", "trvar143G", "trvar143L", "trvar144G", "trvar144L", "trvc144G", "trvc144L",
  .applies_to_waves = c("I", "J")
)

variable_labels(
  "trapp7d",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor",
  .applies_to_vars = c("trapp6m"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor",
  .applies_to_vars = c("trapp7d"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-3` = "na, section not done", `-1` = "na, asked", `1` = "severe underweight", `2` = "underweight", `3` = "approx. normal weight", `4` = "overweight", `5` = "severe overweight", `6` = "do not know",
  .applies_to_vars = c("trestw"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("trmed155", "trvar143G", "trvar143L"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight",
  .applies_to_vars = c("trvar142"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "sickness", `2` = "eating more or different", `3` = "less physical activity", `4` = "combination of eating more/different and physical inactive", `5` = "reason unknown", `6` = "other reason",
  .applies_to_vars = c("trvar144G"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "sickness (unintentional)", `2` = "diet (intentional)", `3` = "other diet (unintentional)", `4` = "more physical activity (intentional)", `5` = "reason unknown (unintentional)", `6` = "social factors (unintentional)", `7` = "combination of eating less/healthier and more physically active (intentional)", `8` = "other reason",
  .applies_to_vars = c("trvar144L"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-2` = "na, see TRVAR144G", `-1` = "na, asked", `1` = "sickness", `2` = "related to eating", `3` = "physical inactivity", `4` = "eating and physical inactivity", `5` = "reason unknown", `6` = "other reason", `7` = "aging", `8` = "social factors",
  .applies_to_vars = c("trvc144G"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-2` = "na, see TRVAR144L", `-1` = "na, asked", `1` = "sickness (unintentional)", `2` = "diet (intentional)", `3` = "different diet (unintentional)", `4` = "physical activity (intentional)", `5` = "reason unknown (unintentional)", `6` = "social factors (unintentional)", `7` = "other reason", `8` = "eating less or different (unknown)", `9` = "eating less and physical active (intentional)", `10` = "physical activity (unintentional)", `11` = "physical activity (unknown)", `12` = "aging (unintentional)",
  .applies_to_vars = c("trvc144L"),
  .applies_to_waves = c("Z", "I", "J")
)

.lasa_fc_714 <- .lasa_finalize_fc("714")

