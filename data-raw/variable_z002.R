## LASA filecode z002 -- variable names, variable labels, value labels,
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
  cohort = "categorical",
  mresult = "categorical",
  pdd = "categorical",
  resint = "categorical",
  result = "categorical",
  selfr = "categorical"
)

# define variable labels ----
variable_labels(
  cohort = "cohort sample",
  mresult = "result of enlisting attempt medical interview",
  pdd = "permission for data distribution",
  resint = "interview type",
  result = "result of enlisting attempt",
  selfr = "result of self-administered questionnaire",
  .applies_to_waves = c("Z")
)

variable_labels(
  "cohort",
  .applies_to_waves = c("B")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w2/w1",
  resint = "interview type w2/w1",
  result = "result of enlisting attempt w2/w1",
  selfr = "result of selfadministered questionnaire w2/w1",
  .applies_to_waves = c("B")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w3",
  resint = "interview type w3",
  result = "result of enlisting attempt w3",
  selfr = "result of selfadministered questionnaire w3",
  .applies_to_waves = c("C")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w4",
  resint = "interview type w4",
  result = "result of enlisting attempt w4",
  selfr = "result of selfadministered questionnaire w4",
  .applies_to_waves = c("D")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w5",
  resint = "interview type w5",
  result = "result of enlisting attempt w5",
  selfr = "result of selfadministered questionnaire w5",
  .applies_to_waves = c("E")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w6",
  resint = "interview type w6",
  result = "result of enlisting attempt w6",
  selfr = "result of selfadministered questionnaire w6",
  .applies_to_waves = c("F")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w7",
  resint = "interview type w7",
  result = "result of enlisting attempt w7",
  selfr = "result of selfadministered questionnaire w7",
  .applies_to_waves = c("G")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w8",
  resint = "interview type w8",
  result = "result of enlisting attempt w8",
  selfr = "result of selfadministered questionnaire w8",
  .applies_to_waves = c("H")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w9",
  resint = "interview type w9",
  result = "result of enlisting attempt w9",
  selfr = "result of selfadministered questionnaire w9",
  .applies_to_waves = c("I")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w10",
  pdd = "permission for data distribution wave 10",
  resint = "interview type w10",
  result = "result of enlisting attempt w10",
  selfr = "result of selfadministered questionnaire w10",
  .applies_to_waves = c("J")
)

variable_labels(
  mresult = "result of enlisting attempt medical interview w11",
  resint = "interview type w11",
  result = "result of enlisting attempt w11",
  selfr = "result of selfadministered questionnaire w11",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-3` = "no data main interview", `-2` = "not in sample medical interview", `-1` = "medical interview",
  .applies_to_vars = c("mresult"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "no participation self-administered questionnaire",
  .applies_to_vars = c("selfr"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-4` = "cohort 3", `-3` = "cohort 2", `-2` = "no data, see previous waves",
  .applies_to_vars = c("resint", "result"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-6` = "cohort 3", `-5` = "cohort 2", `-4` = "no data, see previous waves",
  .applies_to_vars = c("mresult", "selfr"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = "cohort 1 (1992)", `2` = "cohort 2 (2002)", `3` = "cohort 3 (2012)",
  .applies_to_vars = c("cohort"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "deceased before approach", `2` = "refusal", `3` = "ineligible", `4` = "not contacted", `5` = "reason not scored",
  .applies_to_vars = c("mresult"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no data, see other waves", `-1` = "no data current wave", `1` = "no permission for data distribution outside Europe", `2` = "permission for data distribution",
  .applies_to_vars = c("pdd"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no data current LASA wave", `1` = "face to face: complete", `2` = "face to face: short", `3` = "face to face: terminated", `4` = "face to face: short/terminated", `5` = "telephone: respondent", `6` = "telephone: proxy",
  .applies_to_vars = c("resint"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "deceased before approach", `2` = "refusal", `3` = "ineligible", `4` = "not contacted", `5` = "data",
  .applies_to_vars = c("result"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-3` = "no data current LASA wave", `-2` = "telephone interview", `1` = "participation in written self-administered questionnaire", `2` = "participation in digital self-administered questionnaire",
  .applies_to_vars = c("selfr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no data current wave", `-2` = "telephone main interview",
  .applies_to_vars = c("selfr"),
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "no data current wave", `1` = "face to face: complete", `2` = "face to face: short", `3` = "face to face: terminated", `4` = "face to face: short/terminated", `5` = "telephone: respondent", `6` = "telephone: proxy",
  .applies_to_vars = c("resint"),
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = "participation in written self-administered questionnaire", `2` = "participation in digital self-administered questionnaire",
  .applies_to_vars = c("selfr"),
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no data, see other waves", `-1` = "no data wave 10", `1` = "no permission for data distribution outside Europe", `2` = "permission for data distribution w10",
  .applies_to_vars = c("pdd"),
  .applies_to_waves = c("J")
)

.lasa_fc_z002 <- .lasa_finalize_fc("z002")
.lasa_fc_z002$variables <- .lasa_fc_z002$variables |>
  .override_label(wave = "B", variable = "cohort", override_value = "cohort")

