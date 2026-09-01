## LASA filecode 158 -- variable names, variable labels, value labels,
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
  mpeakf1 = "numeric",
  mpeakf2 = "numeric",
  mpeakf3 = "numeric",
  mpeakfc = "numeric",
  mpeakfl = "categorical",
  mpeakfm = "numeric",
  mpeakfp = "categorical",
  mpeakfu = "categorical",
  mpeamax = "numeric",
  mrmpf = "categorical",
  peakfc = "numeric"
)

# define variable labels ----
variable_labels(
  mpeakf1 = "Peakflow 1",
  mpeakf2 = "Peakflow 2",
  mpeakf3 = "Peakflow 3",
  mpeakfc = "Participation with peakflow test",
  mpeakfl = "Peakflow done: constructed",
  mpeakfm = "Peakflow: maximum score three trials",
  mpeakfp = "Peakflow: position during test",
  mpeakfu = "Peakflow: understanding of test",
  mpeamax = "peakflow: maximum score three trials",
  mrmpf = "reason peakflow not done",
  peakfc = "Peakflow: cooperation with test",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mpeakf1", "mpeakf2", "mpeakf3",
  .applies_to_waves = c("B", "C", "D", "E", "G", "H")
)

variable_labels(
  "mpeakfc", "mpeakfl", "mpeamax", "mrmpf",
  .applies_to_waves = c("C")
)

variable_labels(
  "mpeakfp", "mpeakfu", "peakfc",
  .applies_to_waves = c("D", "E", "G", "H")
)

variable_labels(
  "mpeakfm",
  .applies_to_waves = c("E", "G", "H")
)

variable_labels(
  mpeakfc = "participation in peakflow test",
  mpeakfu = "understanding of peakflow test",
  mpeamax = "peakflow: maximum score 3 trials",
  .applies_to_waves = c("B")
)

variable_labels(
  mpeakfp = "position of peakflow test",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  mpeakfu = "Understanding of peakflow test",
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-3` = "na, wrong skip", `-2` = "R refused / na, see CMPEAKFL / test not done", `-1` = "na, asked / no valid measurement", `30` = "attempted score < 60",
  .applies_to_vars = c("mpeakf1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "R refused / test not done", `-1` = "no valid data / no valid measurement", `30` = "attempted score < 60",
  .applies_to_vars = c("mpeakf2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "R refused / test not done", `-1` = "no valid measurement", `30` = "attempted score < 60",
  .applies_to_vars = c("mpeakf3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no answer, skipped", `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "bad", `5` = "refused", `6` = "other reason",
  .applies_to_vars = c("mpeakfc"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "na, interview terminated", `1` = "done", `2` = "not done", `3` = "terminated", `4` = "not able (physical)",
  .applies_to_vars = c("mpeakfl"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMPEAKFL / no valid measurement", `-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "lying down", `4` = "other", `10` = "other: not done", `20` = "other : not able to: physical", `30` = "other: not able to: cognitive", `40` = "other: not done: technical",
  .applies_to_vars = c("mpeakfp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "no answer, skipped / na, see CMPEAKFL / no valid measurement", `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "bad", `5` = "refused", `6` = "other", `10` = "other: not done", `20` = "other : not able to: physical", `30` = "other: not able to: cognitive", `40` = "other: not done: technical",
  .applies_to_vars = c("mpeakfu"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "R refused / na, see CMPEAKFL", `-1` = "no valid data",
  .applies_to_vars = c("mpeamax"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid data", `4` = "refused", `5` = "not able (cognitive)", `6` = "not able (physical)", `7` = "technical problem", `8` = "unknown",
  .applies_to_vars = c("mrmpf"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "R refused",
  .applies_to_vars = c("mpeakf1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mpeakf2"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer, asked", `1` = "standing", `2` = "sitting", `3` = "lying down", `4` = "other",
  .applies_to_vars = c("mpeakfp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no answer, skipped", `-1` = "no answer, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "bad", `5` = "refused",
  .applies_to_vars = c("mpeakfu"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "R refused", `-1` = "no valid data",
  .applies_to_vars = c("mpeamax"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMPEAKFL", `-1` = "na, asked",
  .applies_to_vars = c("mpeakf1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMPEAKFL", `-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "lying down", `10` = "other: not done", `20` = "other : not able to: physical", `30` = "other: not able to: cognitive", `40` = "other: not done: technical",
  .applies_to_vars = c("mpeakfp"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMPEAKFL", `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "bad", `5` = "refused", `10` = "other: not done", `20` = "other : not able to: physical", `30` = "other: not able to: cognitive", `40` = "other: not done: technical",
  .applies_to_vars = c("mpeakfu"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CMPEAKFL",
  .applies_to_vars = c("mpeamax"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "R refused", `-1` = "no valid measurement",
  .applies_to_vars = c("mpeakf1", "mpeakf2", "mpeakf3"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "lying",
  .applies_to_vars = c("mpeakfp"),
  .applies_to_waves = c("D", "E", "G")
)

value_labels(
  `-2` = "no valid measurement", `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "bad", `5` = "refused", `6` = "other",
  .applies_to_vars = c("mpeakfu"),
  .applies_to_waves = c("D", "E", "G", "H")
)

value_labels(
  `-2` = "test not done", `-1` = "no valid measurement", `30` = "attempted score < 60",
  .applies_to_vars = c("mpeakf1", "mpeakf2", "mpeakf3"),
  .applies_to_waves = c("E", "G", "H")
)

value_labels(
  `-2` = "no valid measurement", `-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "lying",
  .applies_to_vars = c("mpeakfp"),
  .applies_to_waves = c("H")
)

.lasa_fc_158 <- .lasa_finalize_fc("158")

