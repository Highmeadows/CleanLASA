## LASA filecode 158 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  peakfc = "Peakflow: cooperation with test"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("mpeakf1", "mpeakf2", "mpeakf3", "mpeakfc", "mpeakfp", "mpeakfu", "mpeamax")],
    mpeakfc = "participation in peakflow test",
    mpeakfp = "position of peakflow test",
    mpeakfu = "understanding of peakflow test",
    mpeamax = "peakflow: maximum score 3 trials"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "mpeakf1",
    "mpeakf2",
    "mpeakf3",
    "mpeakfc",
    "mpeakfl",
    "mpeakfp",
    "mpeakfu",
    "mpeamax",
    "mrmpf"
  )],
    mpeakfp = "position of peakflow test",
    mpeakfu = "Understanding of peakflow test"
  ),
  Wave_D_labels = harmonized_labels[c("mpeakf1", "mpeakf2", "mpeakf3", "mpeakfp", "mpeakfu", "peakfc")],
  Wave_E_labels = harmonized_labels[c("mpeakf1", "mpeakf2", "mpeakf3", "mpeakfm", "mpeakfp", "mpeakfu", "peakfc")],
  Wave_G_labels = harmonized_labels[c("mpeakf1", "mpeakf2", "mpeakf3", "mpeakfm", "mpeakfp", "mpeakfu", "peakfc")],
  Wave_H_labels = harmonized_labels[c("mpeakf1", "mpeakf2", "mpeakf3", "mpeakfm", "mpeakfp", "mpeakfu", "peakfc")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mpeakf1 = c(
    `-3` = "na, wrong skip",
    `-2` = "R refused / na, see CMPEAKFL / test not done",
    `-1` = "na, asked / no valid measurement",
    `30` = "attempted score < 60"
  ),
  mpeakf2 = c(
    `-2` = "R refused / test not done",
    `-1` = "no valid data / no valid measurement",
    `30` = "attempted score < 60"
  ),
  mpeakf3 = c(
    `-2` = "R refused / test not done",
    `-1` = "no valid measurement",
    `30` = "attempted score < 60"
  ),
  mpeakfc = c(
    `-2` = "no answer, skipped",
    `-1` = "no answer, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "bad",
    `5` = "refused",
    `6` = "other reason"
  ),
  mpeakfl = c(
    `-1` = "na, interview terminated",
    `1` = "done",
    `2` = "not done",
    `3` = "terminated",
    `4` = "not able (physical)"
  ),
  mpeakfm = stats::setNames(character(0), character(0)),
  mpeakfp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMPEAKFL / no valid measurement",
    `-1` = "no answer, asked",
    `1` = "standing",
    `2` = "sitting",
    `3` = "lying down",
    `4` = "other",
    `10` = "other: not done",
    `20` = "other : not able to: physical",
    `30` = "other: not able to: cognitive",
    `40` = "other: not done: technical"
  ),
  mpeakfu = c(
    `-3` = "na, wrong skip",
    `-2` = "no answer, skipped / na, see CMPEAKFL / no valid measurement",
    `-1` = "no answer, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "bad",
    `5` = "refused",
    `6` = "other",
    `10` = "other: not done",
    `20` = "other : not able to: physical",
    `30` = "other: not able to: cognitive",
    `40` = "other: not done: technical"
  ),
  mpeamax = c(`-2` = "R refused / na, see CMPEAKFL", `-1` = "no valid data"),
  mrmpf = c(
    `-2` = "valid data",
    `4` = "refused",
    `5` = "not able (cognitive)",
    `6` = "not able (physical)",
    `7` = "technical problem",
    `8` = "unknown"
  ),
  peakfc = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("mpeakf1", "mpeakf2", "mpeakfc", "mpeakfp", "mpeakfu", "mpeamax")],
    mpeakf1 = c(`-2` = "R refused"),
    mpeakf2 = c(`-1` = "no valid data"),
    mpeakfp = c(
    `-1` = "no answer, asked",
    `1` = "standing",
    `2` = "sitting",
    `3` = "lying down",
    `4` = "other"
  ),
    mpeakfu = c(
    `-2` = "no answer, skipped",
    `-1` = "no answer, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "bad",
    `5` = "refused"
  ),
    mpeamax = .replace_labels(
    standardized_value_labels$mpeamax,
    `-2` = "R refused"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("mpeakf1", "mpeakfl", "mpeakfp", "mpeakfu", "mpeamax", "mrmpf")],
    mpeakf1 = c(`-3` = "na, wrong skip", `-2` = "na, see CMPEAKFL", `-1` = "na, asked"),
    mpeakfp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMPEAKFL",
    `-1` = "na, asked",
    `1` = "standing",
    `2` = "sitting",
    `3` = "lying down",
    `10` = "other: not done",
    `20` = "other : not able to: physical",
    `30` = "other: not able to: cognitive",
    `40` = "other: not done: technical"
  ),
    mpeakfu = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMPEAKFL",
    `-1` = "na, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "bad",
    `5` = "refused",
    `10` = "other: not done",
    `20` = "other : not able to: physical",
    `30` = "other: not able to: cognitive",
    `40` = "other: not done: technical"
  ),
    mpeamax = c(`-2` = "na, see CMPEAKFL")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("mpeakf1", "mpeakf2", "mpeakf3", "mpeakfp", "mpeakfu")],
    mpeakf1 = c(`-2` = "R refused", `-1` = "no valid measurement"),
    mpeakf2 = c(`-2` = "R refused", `-1` = "no valid measurement"),
    mpeakf3 = c(`-2` = "R refused", `-1` = "no valid measurement"),
    mpeakfp = c(`-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "lying"),
    mpeakfu = c(
    `-2` = "no valid measurement",
    `-1` = "na, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "bad",
    `5` = "refused",
    `6` = "other"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("mpeakf1", "mpeakf2", "mpeakf3", "mpeakfp", "mpeakfu")],
    mpeakf1 = c(`-2` = "test not done", `-1` = "no valid measurement", `30` = "attempted score < 60"),
    mpeakf2 = .replace_labels(
    standardized_value_labels$mpeakf2,
    `-2` = "test not done",
    `-1` = "no valid measurement"
  ),
    mpeakf3 = .replace_labels(
    standardized_value_labels$mpeakf3,
    `-2` = "test not done"
  ),
    mpeakfp = c(`-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "lying"),
    mpeakfu = c(
    `-2` = "no valid measurement",
    `-1` = "na, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "bad",
    `5` = "refused",
    `6` = "other"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("mpeakf1", "mpeakf2", "mpeakf3", "mpeakfp", "mpeakfu")],
    mpeakf1 = c(`-2` = "test not done", `-1` = "no valid measurement", `30` = "attempted score < 60"),
    mpeakf2 = .replace_labels(
    standardized_value_labels$mpeakf2,
    `-2` = "test not done",
    `-1` = "no valid measurement"
  ),
    mpeakf3 = .replace_labels(
    standardized_value_labels$mpeakf3,
    `-2` = "test not done"
  ),
    mpeakfp = c(`-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "lying"),
    mpeakfu = c(
    `-2` = "no valid measurement",
    `-1` = "na, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "bad",
    `5` = "refused",
    `6` = "other"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("mpeakf1", "mpeakf2", "mpeakf3", "mpeakfp", "mpeakfu")],
    mpeakf1 = c(`-2` = "test not done", `-1` = "no valid measurement", `30` = "attempted score < 60"),
    mpeakf2 = .replace_labels(
    standardized_value_labels$mpeakf2,
    `-2` = "test not done",
    `-1` = "no valid measurement"
  ),
    mpeakf3 = .replace_labels(
    standardized_value_labels$mpeakf3,
    `-2` = "test not done"
  ),
    mpeakfp = c(
    `-2` = "no valid measurement",
    `-1` = "na, asked",
    `1` = "standing",
    `2` = "sitting",
    `3` = "lying"
  ),
    mpeakfu = c(
    `-2` = "no valid measurement",
    `-1` = "na, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "fair",
    `4` = "bad",
    `5` = "refused",
    `6` = "other"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

.lasa_fc_158 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "158", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "158", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "158", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "158", waves = .lasa_wave_rows())
)
