## LASA filecode 122 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qvalu01 = "decision no children",
  qvalu02 = "circumstances for abortion",
  qvalu03 = "euthanasia on own request",
  qvalu04 = "school less important for girl",
  qvalu05 = "boys with more freedom",
  qvalu06 = "women for bring up small children",
  qvalu07 = "not natural woman",
  qvalu08 = "preference elementary school type",
  qvalu09 = "connection politics/religion",
  qvalu10 = "broadcast society: religious ?",
  qvalu11 = "sports club: religious ?",
  qvalu12 = "trade union: religious?",
  qvalu13 = "youth organisation: religious?",
  qvalu14 = "political party: religious",
  qvalu15 = "Self evaluation: political direction",
  qvalu16 = "euthanasia: R self",
  qvalu17 = "Drion: suicide medication",
  qvalu18 = "Drion: suicide medication in possession",
  qvalu18a = "circumstances using suicide medication: old age",
  qvalu18b = "circumstances using suicide medication: seriously ill",
  qvalu18c = "circumstances using suicide medication: dementia",
  qvalu18d = "circumstances using suicide medication: dependent",
  qvalu18e = "circumstances using suicide medication: other"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels[c(
    "qvalu01",
    "qvalu02",
    "qvalu03",
    "qvalu04",
    "qvalu05",
    "qvalu06",
    "qvalu07",
    "qvalu08",
    "qvalu09",
    "qvalu10",
    "qvalu11",
    "qvalu12",
    "qvalu13",
    "qvalu14",
    "qvalu15"
  )],
  Wave_C_labels = harmonized_labels[c("qvalu01", "qvalu02", "qvalu03")],
  Wave_D_labels = harmonized_labels[c("qvalu01", "qvalu02", "qvalu03")],
  Wave_E_labels = harmonized_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
  Wave_2B_labels = harmonized_labels[c("qvalu01", "qvalu02", "qvalu03")],
  Wave_F_labels = harmonized_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
  Wave_G_labels = harmonized_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
  Wave_H_labels = harmonized_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
  Wave_3B_labels = harmonized_labels[c("qvalu03", "qvalu16", "qvalu17", "qvalu18")],
  Wave_I_labels = harmonized_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
  Wave_J_labels = harmonized_labels[c(
    "qvalu02",
    "qvalu16",
    "qvalu17",
    "qvalu18",
    "qvalu18a",
    "qvalu18b",
    "qvalu18c",
    "qvalu18d",
    "qvalu18e"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qvalu01 = c(
    `-1` = "not available",
    `1` = "acceptable",
    `2` = "not acceptable",
    `3` = "opposed",
    `4` = "no opinion"
  ),
  qvalu02 = c(
    `-1` = "not available",
    `1` = "yes, there are",
    `2` = "no, there are not",
    `3` = "coding category 3"
  ),
  qvalu03 = c(
    `-1` = "not available",
    `1` = "yes, (s)he should",
    `2` = "it depends",
    `3` = "no, (s)he should not",
    `4` = "no opinion"
  ),
  qvalu04 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qvalu05 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qvalu06 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qvalu07 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qvalu08 = c(
    `-1` = "not available",
    `1` = "public school",
    `2` = "religious school",
    `3` = "does not matter",
    `4` = "do not know"
  ),
  qvalu09 = c(
    `-1` = "not available",
    `1` = "independent",
    `2` = "it depends",
    `3` = "not independent",
    `4` = "do not know"
  ),
  qvalu10 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qvalu11 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qvalu12 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qvalu13 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qvalu14 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qvalu15 = c(
    `-1` = "not available",
    `1` = "extreme left",
    `2` = "left",
    `3` = "moderate left",
    `4` = "not left, nor right",
    `5` = "moderate right",
    `6` = "right",
    `7` = "extreme right",
    `8` = "do not know"
  ),
  qvalu16 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qvalu17 = c(`-1` = "not available", `1` = "yes", `2` = "no", `3` = "no opinion"),
  qvalu18 = c(`-1` = "not available", `1` = "coding category 1", `2` = "coding category 2", `3` = "no"),
  qvalu18a = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  qvalu18b = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  qvalu18c = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  qvalu18d = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  qvalu18e = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qvalu01",
    "qvalu02",
    "qvalu03",
    "qvalu04",
    "qvalu05",
    "qvalu06",
    "qvalu07",
    "qvalu08",
    "qvalu09",
    "qvalu10",
    "qvalu11",
    "qvalu12",
    "qvalu13",
    "qvalu14",
    "qvalu15"
  )],
    qvalu01 = .replace_labels(
    standardized_value_labels$qvalu01,
    `-1` = "no answer"
  ),
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "no opinion"
  ),
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer",
    `1` = "yes, he should",
    `3` = "no, he should not"
  ),
    qvalu04 = .replace_labels(
    standardized_value_labels$qvalu04,
    `-1` = "no answer"
  ),
    qvalu05 = .replace_labels(
    standardized_value_labels$qvalu05,
    `-1` = "no answer"
  ),
    qvalu06 = .replace_labels(
    standardized_value_labels$qvalu06,
    `-1` = "no answer"
  ),
    qvalu07 = .replace_labels(
    standardized_value_labels$qvalu07,
    `-1` = "no answer"
  ),
    qvalu08 = .replace_labels(
    standardized_value_labels$qvalu08,
    `-1` = "no answer"
  ),
    qvalu09 = .replace_labels(
    standardized_value_labels$qvalu09,
    `-1` = "no answer"
  ),
    qvalu10 = .replace_labels(
    standardized_value_labels$qvalu10,
    `-1` = "no answer"
  ),
    qvalu11 = .replace_labels(
    standardized_value_labels$qvalu11,
    `-1` = "no answer"
  ),
    qvalu12 = .replace_labels(
    standardized_value_labels$qvalu12,
    `-1` = "no answer"
  ),
    qvalu13 = .replace_labels(
    standardized_value_labels$qvalu13,
    `-1` = "no answer"
  ),
    qvalu14 = .replace_labels(
    standardized_value_labels$qvalu14,
    `-1` = "no answer"
  ),
    qvalu15 = .replace_labels(
    standardized_value_labels$qvalu15,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("qvalu01", "qvalu02", "qvalu03")],
    qvalu01 = .replace_labels(
    standardized_value_labels$qvalu01,
    `-1` = "no answer"
  ),
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "no opinion"
  ),
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("qvalu01", "qvalu02", "qvalu03")],
    qvalu01 = .replace_labels(
    standardized_value_labels$qvalu01,
    `-1` = "no answer"
  ),
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "no opinion"
  ),
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
    qvalu01 = .replace_labels(
    standardized_value_labels$qvalu01,
    `-1` = "no answer"
  ),
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "no opinion"
  ),
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer"
  ),
    qvalu16 = .replace_labels(
    standardized_value_labels$qvalu16,
    `-1` = "no answer"
  ),
    qvalu17 = .replace_labels(
    standardized_value_labels$qvalu17,
    `-1` = "no answer"
  ),
    qvalu18 = c(`-1` = "no answer", `1` = "yes", `2` = "no")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("qvalu01", "qvalu02", "qvalu03")],
    qvalu01 = .replace_labels(
    standardized_value_labels$qvalu01,
    `-1` = "no answer"
  ),
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "no opinion"
  ),
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
    qvalu01 = .replace_labels(
    standardized_value_labels$qvalu01,
    `-1` = "no answer"
  ),
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "no opinion"
  ),
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer"
  ),
    qvalu16 = .replace_labels(
    standardized_value_labels$qvalu16,
    `-1` = "no answer"
  ),
    qvalu17 = .replace_labels(
    standardized_value_labels$qvalu17,
    `-1` = "no answer"
  ),
    qvalu18 = c(`-1` = "no answer", `1` = "yes", `2` = "no")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
    qvalu01 = .replace_labels(
    standardized_value_labels$qvalu01,
    `-1` = "no answer"
  ),
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "no opinion"
  ),
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer"
  ),
    qvalu16 = .replace_labels(
    standardized_value_labels$qvalu16,
    `-1` = "no answer"
  ),
    qvalu17 = .replace_labels(
    standardized_value_labels$qvalu17,
    `-1` = "no answer"
  ),
    qvalu18 = c(`-1` = "no answer", `1` = "yes", `2` = "no")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
    qvalu01 = .replace_labels(
    standardized_value_labels$qvalu01,
    `-1` = "no answer"
  ),
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "no opinion"
  ),
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer"
  ),
    qvalu16 = .replace_labels(
    standardized_value_labels$qvalu16,
    `-1` = "no answer"
  ),
    qvalu17 = .replace_labels(
    standardized_value_labels$qvalu17,
    `-1` = "no answer"
  ),
    qvalu18 = c(`-1` = "no answer", `1` = "yes", `2` = "no")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("qvalu03", "qvalu16", "qvalu17", "qvalu18")],
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer"
  ),
    qvalu16 = .replace_labels(
    standardized_value_labels$qvalu16,
    `-1` = "no answer"
  ),
    qvalu17 = .replace_labels(
    standardized_value_labels$qvalu17,
    `-1` = "no answer"
  ),
    qvalu18 = c(`-1` = "no answer", `1` = "yes", `2` = "no")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("qvalu01", "qvalu02", "qvalu03", "qvalu16", "qvalu17", "qvalu18")],
    qvalu01 = .replace_labels(
    standardized_value_labels$qvalu01,
    `-1` = "no answer"
  ),
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "no opinion"
  ),
    qvalu03 = .replace_labels(
    standardized_value_labels$qvalu03,
    `-1` = "no answer"
  ),
    qvalu16 = .replace_labels(
    standardized_value_labels$qvalu16,
    `-1` = "no answer"
  ),
    qvalu17 = .replace_labels(
    standardized_value_labels$qvalu17,
    `-1` = "no answer"
  ),
    qvalu18 = c(`-1` = "no answer", `1` = "yes", `2` = "no")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "qvalu02",
    "qvalu16",
    "qvalu17",
    "qvalu18",
    "qvalu18a",
    "qvalu18b",
    "qvalu18c",
    "qvalu18d",
    "qvalu18e"
  )],
    qvalu02 = .replace_labels(
    standardized_value_labels$qvalu02,
    `-1` = "no answer",
    `3` = "opinion"
  ),
    qvalu16 = .replace_labels(
    standardized_value_labels$qvalu16,
    `-1` = "no answer"
  ),
    qvalu17 = .replace_labels(
    standardized_value_labels$qvalu17,
    `-1` = "no answer"
  ),
    qvalu18 = .replace_labels(
    standardized_value_labels$qvalu18,
    `-1` = "no answer",
    `1` = "yes, to be sure",
    `2` = "yes, to use soon"
  ),
    qvalu18a = .replace_labels(
    standardized_value_labels$qvalu18a,
    `-2` = "no answer, see jqvalu18"
  ),
    qvalu18b = .replace_labels(
    standardized_value_labels$qvalu18b,
    `-2` = "no answer, see jqvalu18"
  ),
    qvalu18c = .replace_labels(
    standardized_value_labels$qvalu18c,
    `-2` = "no answer, see jqvalu18"
  ),
    qvalu18d = .replace_labels(
    standardized_value_labels$qvalu18d,
    `-2` = "no answer, see jqvalu18"
  ),
    qvalu18e = .replace_labels(
    standardized_value_labels$qvalu18e,
    `-2` = "no answer, see jqvalu18"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qvalu01 = "categorical",
  qvalu02 = "categorical",
  qvalu03 = "categorical",
  qvalu04 = "categorical",
  qvalu05 = "categorical",
  qvalu06 = "categorical",
  qvalu07 = "categorical",
  qvalu08 = "categorical",
  qvalu09 = "categorical",
  qvalu10 = "categorical",
  qvalu11 = "categorical",
  qvalu12 = "categorical",
  qvalu13 = "categorical",
  qvalu14 = "categorical",
  qvalu15 = "categorical",
  qvalu16 = "categorical",
  qvalu17 = "categorical",
  qvalu18 = "categorical",
  qvalu18a = "categorical",
  qvalu18b = "categorical",
  qvalu18c = "categorical",
  qvalu18d = "categorical",
  qvalu18e = "categorical"
)

.lasa_fc_122 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "122", waves = .lasa_wave_rows()) |>
    .override_label(wave = "J", variable = "qvalu16", override_value = "bqvalu16") |>
    .override_label(wave = "J", variable = "qvalu17", override_value = "bqvalu17") |>
    .override_label(wave = "J", variable = "qvalu18", override_value = "bqvalu18"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "122", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "122", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "122", waves = .lasa_wave_rows())
)
