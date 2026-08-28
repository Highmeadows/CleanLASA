## LASA filecode 118 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qapp1 = "Appetite: eating a meal",
  qapp2 = "Appetite: general appetite",
  qapp3 = "Appetite: general liking of food",
  qapp4 = "Appetite: number of meals per day",
  qfood01 = "bite and chew",
  qfood02 = "#times eaten: morning",
  qfood03 = "#times eaten: afternoon",
  qfood04 = "#times eaten: evening",
  qfood05 = "#times eaten: night",
  qfood06 = "diet: low-calorie-poor",
  qfood07 = "diet: low-cholesterol",
  qfood08 = "diet: low-salt",
  qfood09 = "diet: sugar-free",
  qfood10 = "diet: high-calorie",
  qfood11 = "diet: vegetarian",
  qfood12 = "diet: other",
  qfood13 = "fruit spring summer:#days a week",
  qfood14 = "fruit spring summer:#times a day",
  qfood15 = "fruit autumn winter:#days a week",
  qfood16 = "fruit autumn winter:#times a day",
  qfood17 = "vegetables spring summer:#days a week",
  qfood18 = "vegetables spring summer:#times a day",
  qfood19 = "vegetables autums winter:#days a week",
  qfood20 = "vegetables autums winter:#times a day",
  qfood21 = "eat less: disease",
  qfood22 = "less than 2 meals a day",
  qfood23 = "few vegetables, fruit, dairy",
  qfood24 = "eat less: bite and chew problems",
  qfood25 = "eat less: money problems",
  qfood26 = "eat alone mostly",
  qfood27 = "phys. cond. limit shopping and cooking"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "qfood01",
    "qfood02",
    "qfood03",
    "qfood04",
    "qfood05",
    "qfood06",
    "qfood07",
    "qfood08",
    "qfood09",
    "qfood10",
    "qfood11",
    "qfood12",
    "qfood13",
    "qfood14",
    "qfood15",
    "qfood16",
    "qfood17",
    "qfood18",
    "qfood19",
    "qfood20"
  ),
  `C` = c(
    "qfood01"
  ),
  `D` = c(
    "qfood01"
  ),
  `H` = c(
    "qfood21",
    "qfood22",
    "qfood23",
    "qfood24",
    "qfood25",
    "qfood26",
    "qfood27"
  ),
  `I` = c(
    "qfood21",
    "qfood22",
    "qfood23",
    "qfood24",
    "qfood25",
    "qfood26",
    "qfood27"
  ),
  `J` = c(
    "qfood21",
    "qfood22",
    "qfood23",
    "qfood24",
    "qfood25",
    "qfood26",
    "qfood27"
  ),
  `K` = c(
    "qapp1",
    "qapp2",
    "qapp3",
    "qapp4",
    "qfood21",
    "qfood22",
    "qfood23",
    "qfood24",
    "qfood25",
    "qfood26",
    "qfood27"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qapp1 = c(
    `-1` = "not available",
    `1` = "satiated after a few bites",
    `2` = "satiated after 1/3 the meal",
    `3` = "satiated after 1/2 the meal",
    `4` = "satiated after most of the meal",
    `5` = "never satiated"
  ),
  qapp2 = c(
    `-1` = "not available",
    `1` = "very bad",
    `2` = "bad",
    `3` = "moderate",
    `4` = "good",
    `5` = "very good"
  ),
  qapp3 = c(
    `-1` = "not available",
    `1` = "very bad",
    `2` = "bad",
    `3` = "moderate",
    `4` = "good",
    `5` = "very good"
  ),
  qapp4 = c(
    `-1` = "not available",
    `1` = "< 1 meal per day",
    `2` = "1 meals per day",
    `3` = "2 meals per day",
    `4` = "3 meals per day",
    `5` = "> 3 meals per day"
  ),
  qfood01 = c(
    `-1` = "not available",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave"
  ),
  qfood02 = c(`-1` = "not available"),
  qfood03 = c(`-1` = "not available"),
  qfood04 = c(`-1` = "not available"),
  qfood05 = c(`-1` = "not available"),
  qfood06 = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qfood07 = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qfood08 = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qfood09 = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qfood10 = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qfood11 = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qfood12 = c(`-1` = "not available", `1` = "no", `2` = "yes"),
  qfood13 = c(`-1` = "not available"),
  qfood14 = c(`-1` = "not available"),
  qfood15 = c(`-1` = "not available"),
  qfood16 = c(`-1` = "not available"),
  qfood17 = c(`-1` = "not available"),
  qfood18 = c(`-1` = "not available"),
  qfood19 = c(`-1` = "not available"),
  qfood20 = c(`-1` = "not available"),
  qfood21 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qfood22 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qfood23 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qfood24 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qfood25 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qfood26 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qfood27 = c(`-1` = "not available", `1` = "yes", `2` = "no")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qfood01 = .replace_labels(
    standardized_value_labels$qfood01,
    `-1` = "no answer",
    `1` = "almost never",
    `2` = "some of the day",
    `3` = "often",
    `4` = "most of the time"
  ),
    qfood02 = .replace_labels(
    standardized_value_labels$qfood02,
    `-1` = "no answer"
  ),
    qfood03 = .replace_labels(
    standardized_value_labels$qfood03,
    `-1` = "no answer"
  ),
    qfood04 = .replace_labels(
    standardized_value_labels$qfood04,
    `-1` = "no answer"
  ),
    qfood05 = .replace_labels(
    standardized_value_labels$qfood05,
    `-1` = "no answer"
  ),
    qfood06 = .replace_labels(
    standardized_value_labels$qfood06,
    `-1` = "no answer"
  ),
    qfood07 = .replace_labels(
    standardized_value_labels$qfood07,
    `-1` = "no answer"
  ),
    qfood08 = .replace_labels(
    standardized_value_labels$qfood08,
    `-1` = "no answer"
  ),
    qfood09 = .replace_labels(
    standardized_value_labels$qfood09,
    `-1` = "no answer"
  ),
    qfood10 = .replace_labels(
    standardized_value_labels$qfood10,
    `-1` = "no answer"
  ),
    qfood11 = .replace_labels(
    standardized_value_labels$qfood11,
    `-1` = "no answer"
  ),
    qfood12 = .replace_labels(
    standardized_value_labels$qfood12,
    `-1` = "no answer"
  ),
    qfood13 = .replace_labels(
    standardized_value_labels$qfood13,
    `-1` = "no answer"
  ),
    qfood14 = .replace_labels(
    standardized_value_labels$qfood14,
    `-1` = "no answer"
  ),
    qfood15 = .replace_labels(
    standardized_value_labels$qfood15,
    `-1` = "no answer"
  ),
    qfood16 = .replace_labels(
    standardized_value_labels$qfood16,
    `-1` = "no answer"
  ),
    qfood17 = .replace_labels(
    standardized_value_labels$qfood17,
    `-1` = "no answer"
  ),
    qfood18 = .replace_labels(
    standardized_value_labels$qfood18,
    `-1` = "no answer"
  ),
    qfood19 = .replace_labels(
    standardized_value_labels$qfood19,
    `-1` = "no answer"
  ),
    qfood20 = .replace_labels(
    standardized_value_labels$qfood20,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qfood01 = .replace_labels(
    standardized_value_labels$qfood01,
    `-1` = "no value",
    `1` = "yes, without trouble",
    `2` = "yes, with some trouble",
    `3` = "yes, with much trouble",
    `4` = "no, I cannot"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qfood01 = .replace_labels(
    standardized_value_labels$qfood01,
    `-1` = "no value",
    `1` = "yes, without trouble",
    `2` = "yes, with some trouble",
    `3` = "yes, with much trouble",
    `4` = "no, I cannot"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    qfood21 = .replace_labels(
    standardized_value_labels$qfood21,
    `-1` = "no answer"
  ),
    qfood22 = .replace_labels(
    standardized_value_labels$qfood22,
    `-1` = "no answer"
  ),
    qfood23 = .replace_labels(
    standardized_value_labels$qfood23,
    `-1` = "no answer"
  ),
    qfood24 = .replace_labels(
    standardized_value_labels$qfood24,
    `-1` = "no answer"
  ),
    qfood25 = .replace_labels(
    standardized_value_labels$qfood25,
    `-1` = "no answer"
  ),
    qfood26 = .replace_labels(
    standardized_value_labels$qfood26,
    `-1` = "no answer"
  ),
    qfood27 = .replace_labels(
    standardized_value_labels$qfood27,
    `-1` = "no answer"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qfood21 = .replace_labels(
    standardized_value_labels$qfood21,
    `-1` = "no answer"
  ),
    qfood22 = .replace_labels(
    standardized_value_labels$qfood22,
    `-1` = "no answer"
  ),
    qfood23 = .replace_labels(
    standardized_value_labels$qfood23,
    `-1` = "no answer"
  ),
    qfood24 = .replace_labels(
    standardized_value_labels$qfood24,
    `-1` = "no answer"
  ),
    qfood25 = .replace_labels(
    standardized_value_labels$qfood25,
    `-1` = "no answer"
  ),
    qfood26 = .replace_labels(
    standardized_value_labels$qfood26,
    `-1` = "no answer"
  ),
    qfood27 = .replace_labels(
    standardized_value_labels$qfood27,
    `-1` = "no answer"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qfood21 = .replace_labels(
    standardized_value_labels$qfood21,
    `-1` = "no answer"
  ),
    qfood22 = .replace_labels(
    standardized_value_labels$qfood22,
    `-1` = "no answer"
  ),
    qfood23 = .replace_labels(
    standardized_value_labels$qfood23,
    `-1` = "no answer"
  ),
    qfood24 = .replace_labels(
    standardized_value_labels$qfood24,
    `-1` = "no answer"
  ),
    qfood25 = .replace_labels(
    standardized_value_labels$qfood25,
    `-1` = "no answer"
  ),
    qfood26 = .replace_labels(
    standardized_value_labels$qfood26,
    `-1` = "no answer"
  ),
    qfood27 = .replace_labels(
    standardized_value_labels$qfood27,
    `-1` = "no answer"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    qapp1 = .replace_labels(
    standardized_value_labels$qapp1,
    `-1` = "no answer"
  ),
    qapp2 = .replace_labels(
    standardized_value_labels$qapp2,
    `-1` = "no answer"
  ),
    qapp3 = .replace_labels(
    standardized_value_labels$qapp3,
    `-1` = "no answer"
  ),
    qapp4 = .replace_labels(
    standardized_value_labels$qapp4,
    `-1` = "no answer"
  ),
    qfood21 = .replace_labels(
    standardized_value_labels$qfood21,
    `-1` = "no answer"
  ),
    qfood22 = .replace_labels(
    standardized_value_labels$qfood22,
    `-1` = "no answer"
  ),
    qfood23 = .replace_labels(
    standardized_value_labels$qfood23,
    `-1` = "no answer"
  ),
    qfood24 = .replace_labels(
    standardized_value_labels$qfood24,
    `-1` = "no answer"
  ),
    qfood25 = .replace_labels(
    standardized_value_labels$qfood25,
    `-1` = "no answer"
  ),
    qfood26 = .replace_labels(
    standardized_value_labels$qfood26,
    `-1` = "no answer"
  ),
    qfood27 = .replace_labels(
    standardized_value_labels$qfood27,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qapp1 = "categorical",
  qapp2 = "categorical",
  qapp3 = "categorical",
  qapp4 = "categorical",
  qfood01 = "categorical",
  qfood02 = "numeric",
  qfood03 = "numeric",
  qfood04 = "numeric",
  qfood05 = "numeric",
  qfood06 = "categorical",
  qfood07 = "categorical",
  qfood08 = "categorical",
  qfood09 = "categorical",
  qfood10 = "categorical",
  qfood11 = "categorical",
  qfood12 = "categorical",
  qfood13 = "numeric",
  qfood14 = "numeric",
  qfood15 = "numeric",
  qfood16 = "numeric",
  qfood17 = "numeric",
  qfood18 = "numeric",
  qfood19 = "numeric",
  qfood20 = "numeric",
  qfood21 = "categorical",
  qfood22 = "categorical",
  qfood23 = "categorical",
  qfood24 = "categorical",
  qfood25 = "categorical",
  qfood26 = "categorical",
  qfood27 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "118", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "118", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "118", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "118", waves = .lasa_wave_rows())
)

.lasa_fc_118 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

