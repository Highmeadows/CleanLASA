## LASA filecode z002 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  cohort = "cohort sample",
  mresult = "result of enlisting attempt medical interview",
  pdd = "permission for data distribution",
  resint = "interview type",
  result = "result of enlisting attempt",
  selfr = "result of self-administered questionnaire"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("cohort", "mresult", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w2/w1",
    resint = "interview type w2/w1",
    result = "result of enlisting attempt w2/w1",
    selfr = "result of selfadministered questionnaire w2/w1"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("mresult", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w3",
    resint = "interview type w3",
    result = "result of enlisting attempt w3",
    selfr = "result of selfadministered questionnaire w3"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("mresult", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w4",
    resint = "interview type w4",
    result = "result of enlisting attempt w4",
    selfr = "result of selfadministered questionnaire w4"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("mresult", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w5",
    resint = "interview type w5",
    result = "result of enlisting attempt w5",
    selfr = "result of selfadministered questionnaire w5"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("mresult", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w6",
    resint = "interview type w6",
    result = "result of enlisting attempt w6",
    selfr = "result of selfadministered questionnaire w6"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("mresult", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w7",
    resint = "interview type w7",
    result = "result of enlisting attempt w7",
    selfr = "result of selfadministered questionnaire w7"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("mresult", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w8",
    resint = "interview type w8",
    result = "result of enlisting attempt w8",
    selfr = "result of selfadministered questionnaire w8"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c("mresult", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w9",
    resint = "interview type w9",
    result = "result of enlisting attempt w9",
    selfr = "result of selfadministered questionnaire w9"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c("mresult", "pdd", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w10",
    pdd = "permission for data distribution wave 10",
    resint = "interview type w10",
    result = "result of enlisting attempt w10",
    selfr = "result of selfadministered questionnaire w10"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c("mresult", "resint", "result", "selfr")],
    mresult = "result of enlisting attempt medical interview w11",
    resint = "interview type w11",
    result = "result of enlisting attempt w11",
    selfr = "result of selfadministered questionnaire w11"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  cohort = c(`1` = "cohort 1 (1992)", `2` = "cohort 2 (2002)", `3` = "cohort 3 (2012)"),
  mresult = c(
    `-6` = "cohort 3",
    `-5` = "cohort 2",
    `-4` = "no data, see previous waves",
    `-3` = "no data main interview",
    `-2` = "not in sample medical interview",
    `-1` = "medical interview",
    `1` = "deceased before approach",
    `2` = "refusal",
    `3` = "ineligible",
    `4` = "not contacted",
    `5` = "reason not scored"
  ),
  pdd = c(
    `-2` = "no data, see other waves",
    `-1` = "no data current wave",
    `1` = "no permission for data distribution outside Europe",
    `2` = "permission for data distribution"
  ),
  resint = c(
    `-4` = "cohort 3",
    `-3` = "cohort 2",
    `-2` = "no data, see previous waves",
    `-1` = "no data current LASA wave",
    `1` = "face to face: complete",
    `2` = "face to face: short",
    `3` = "face to face: terminated",
    `4` = "face to face: short/terminated",
    `5` = "telephone: respondent",
    `6` = "telephone: proxy"
  ),
  result = c(
    `-4` = "cohort 3",
    `-3` = "cohort 2",
    `-2` = "no data, see previous waves",
    `1` = "deceased before approach",
    `2` = "refusal",
    `3` = "ineligible",
    `4` = "not contacted",
    `5` = "data"
  ),
  selfr = c(
    `-6` = "cohort 3",
    `-5` = "cohort 2",
    `-4` = "no data, see previous waves",
    `-3` = "no data current LASA wave",
    `-2` = "telephone interview",
    `-1` = "no participation self-administered questionnaire",
    `1` = "participation in written self-administered questionnaire",
    `2` = "participation in digital self-administered questionnaire"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("cohort", "mresult", "resint", "result", "selfr")],
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("mresult", "resint", "result", "selfr")],
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("mresult", "resint", "result", "selfr")],
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("mresult", "resint", "result", "selfr")],
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("mresult", "resint", "result", "selfr")],
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("mresult", "resint", "result", "selfr")],
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("mresult", "resint", "result", "selfr")],
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("mresult", "resint", "result", "selfr")],
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("mresult", "pdd", "resint", "result", "selfr")],
    pdd = .replace_labels(
    standardized_value_labels$pdd,
    `-1` = "no data wave 10",
    `2` = "permission for data distribution w10"
  ),
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("mresult", "resint", "result", "selfr")],
    resint = .replace_labels(
    standardized_value_labels$resint,
    `-1` = "no data current wave"
  ),
    selfr = .replace_labels(
    standardized_value_labels$selfr,
    `-3` = "no data current wave",
    `-2` = "telephone main interview"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  cohort = "categorical",
  mresult = "categorical",
  pdd = "categorical",
  resint = "categorical",
  result = "categorical",
  selfr = "categorical"
)

.lasa_fc_z002 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "z002", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "cohort", override_value = "cohort"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "z002", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "z002", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "z002", waves = .lasa_wave_rows())
)
