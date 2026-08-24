## LASA filecode 125 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qsocp04 = "possession senior card (65+/60+)",
  qsocp05 = "usage senior card",
  qsocp06 = "listening to the radio: hours a day",
  qsocp07 = "radio: news",
  qsocp08 = "radio: commentaries",
  qsocp09 = "radio: religious services",
  qsocp10 = "radio: music",
  qsocp11 = "radio: sport",
  qsocp12 = "radio: quiz/games",
  qsocp13 = "watching television: hours a day",
  qsocp14 = "tv: news",
  qsocp15 = "tv: commentaries",
  qsocp16 = "tv: religious services",
  qsocp17 = "tv: music",
  qsocp18 = "tv: sport",
  qsocp19 = "tv: quiz/games",
  qsocp20 = "tv: films/soaps",
  qsocp20b = "tv: reality programmes",
  qsocp21 = "reading newspapers",
  qsocp22 = "involved: world",
  qsocp23 = "involved: europe",
  qsocp24 = "involved: dutch society",
  qsocp25 = "involved: province",
  qsocp26 = "involved: municipality",
  qsocp27 = "involved: neighborhood"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels[c(
    "qsocp04",
    "qsocp05",
    "qsocp06",
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp13",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21",
    "qsocp22",
    "qsocp23",
    "qsocp24",
    "qsocp25",
    "qsocp26",
    "qsocp27"
  )],
  Wave_C_labels = harmonized_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp21"
  )],
  Wave_D_labels = harmonized_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21"
  )],
  Wave_E_labels = harmonized_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21"
  )],
  Wave_2B_labels = harmonized_labels[c(
    "qsocp04",
    "qsocp05",
    "qsocp06",
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp13",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21"
  )],
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21"
  )],
    qsocp20 = "tv: films/tv series"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp20b",
    "qsocp21"
  )],
    qsocp20 = "tv: films/tv series"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qsocp04 = c(
    `-2` = "not available, routing",
    `-1` = "not available",
    `1` = "yes",
    `2` = "no",
    `3` = "R thinks not yet applicable"
  ),
  qsocp05 = c(
    `-2` = "not available, routing",
    `-1` = "not available",
    `1` = "almost never",
    `2` = "a few times a year",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "every day"
  ),
  qsocp06 = c(`-1` = "not available"),
  qsocp07 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp08 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp09 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp10 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp11 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp12 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp13 = c(`-1` = "not available"),
  qsocp14 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp15 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp16 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp17 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp18 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp19 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp20 = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp20b = c(
    `-1` = "not available",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  ),
  qsocp21 = c(
    `-1` = "not available",
    `1` = "coding category 1",
    `2` = "coding category 2",
    `3` = "coding category 3",
    `4` = "coding category 4",
    `5` = "never"
  ),
  qsocp22 = c(
    `-1` = "not available",
    `1` = "not at all involved",
    `2` = "not involved",
    `3` = "involved",
    `4` = "greatly involved"
  ),
  qsocp23 = c(
    `-1` = "not available",
    `1` = "not at all involved",
    `2` = "not involved",
    `3` = "involved",
    `4` = "greatly involved"
  ),
  qsocp24 = c(
    `-1` = "not available",
    `1` = "not at all involved",
    `2` = "not involved",
    `3` = "involved",
    `4` = "greatly involved"
  ),
  qsocp25 = c(
    `-1` = "not available",
    `1` = "not at all involved",
    `2` = "not involved",
    `3` = "involved",
    `4` = "greatly involved"
  ),
  qsocp26 = c(
    `-1` = "not available",
    `1` = "not at all involved",
    `2` = "not involved",
    `3` = "involved",
    `4` = "greatly involved"
  ),
  qsocp27 = c(
    `-1` = "not available",
    `1` = "not at all involved",
    `2` = "not involved",
    `3` = "involved",
    `4` = "greatly involved"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qsocp04",
    "qsocp05",
    "qsocp06",
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp13",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21",
    "qsocp22",
    "qsocp23",
    "qsocp24",
    "qsocp25",
    "qsocp26",
    "qsocp27"
  )],
    qsocp04 = .replace_labels(
    standardized_value_labels$qsocp04,
    `-2` = "no data, age",
    `-1` = "no answer"
  ),
    qsocp05 = .replace_labels(
    standardized_value_labels$qsocp05,
    `-2` = "no answer, routing",
    `-1` = "no answer"
  ),
    qsocp06 = .replace_labels(
    standardized_value_labels$qsocp06,
    `-1` = "no answer"
  ),
    qsocp07 = .replace_labels(
    standardized_value_labels$qsocp07,
    `-1` = "no answer"
  ),
    qsocp08 = .replace_labels(
    standardized_value_labels$qsocp08,
    `-1` = "no answer"
  ),
    qsocp09 = .replace_labels(
    standardized_value_labels$qsocp09,
    `-1` = "no answer"
  ),
    qsocp10 = .replace_labels(
    standardized_value_labels$qsocp10,
    `-1` = "no answer"
  ),
    qsocp11 = .replace_labels(
    standardized_value_labels$qsocp11,
    `-1` = "no answer"
  ),
    qsocp12 = .replace_labels(
    standardized_value_labels$qsocp12,
    `-1` = "no answer"
  ),
    qsocp13 = .replace_labels(
    standardized_value_labels$qsocp13,
    `-1` = "no answer"
  ),
    qsocp14 = .replace_labels(
    standardized_value_labels$qsocp14,
    `-1` = "no answer"
  ),
    qsocp15 = .replace_labels(
    standardized_value_labels$qsocp15,
    `-1` = "no answer"
  ),
    qsocp16 = .replace_labels(
    standardized_value_labels$qsocp16,
    `-1` = "no answer"
  ),
    qsocp17 = .replace_labels(
    standardized_value_labels$qsocp17,
    `-1` = "no answer"
  ),
    qsocp18 = .replace_labels(
    standardized_value_labels$qsocp18,
    `-1` = "no answer"
  ),
    qsocp19 = .replace_labels(
    standardized_value_labels$qsocp19,
    `-1` = "no answer"
  ),
    qsocp20 = .replace_labels(
    standardized_value_labels$qsocp20,
    `-1` = "no answer"
  ),
    qsocp21 = .replace_labels(
    standardized_value_labels$qsocp21,
    `-1` = "no answer",
    `1` = "every day",
    `2` = "4-5 times a week",
    `3` = "2-3 times a week",
    `4` = "<2 times a week"
  ),
    qsocp22 = .replace_labels(
    standardized_value_labels$qsocp22,
    `-1` = "no answer"
  ),
    qsocp23 = .replace_labels(
    standardized_value_labels$qsocp23,
    `-1` = "no answer"
  ),
    qsocp24 = .replace_labels(
    standardized_value_labels$qsocp24,
    `-1` = "no answer"
  ),
    qsocp25 = .replace_labels(
    standardized_value_labels$qsocp25,
    `-1` = "no answer"
  ),
    qsocp26 = .replace_labels(
    standardized_value_labels$qsocp26,
    `-1` = "no answer"
  ),
    qsocp27 = .replace_labels(
    standardized_value_labels$qsocp27,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp21"
  )],
    qsocp07 = .replace_labels(
    standardized_value_labels$qsocp07,
    `-1` = "no answer"
  ),
    qsocp08 = .replace_labels(
    standardized_value_labels$qsocp08,
    `-1` = "no answer"
  ),
    qsocp09 = .replace_labels(
    standardized_value_labels$qsocp09,
    `-1` = "no answer"
  ),
    qsocp10 = .replace_labels(
    standardized_value_labels$qsocp10,
    `-1` = "no answer"
  ),
    qsocp11 = .replace_labels(
    standardized_value_labels$qsocp11,
    `-1` = "no answer"
  ),
    qsocp12 = .replace_labels(
    standardized_value_labels$qsocp12,
    `-1` = "no answer"
  ),
    qsocp14 = .replace_labels(
    standardized_value_labels$qsocp14,
    `-1` = "no answer"
  ),
    qsocp15 = .replace_labels(
    standardized_value_labels$qsocp15,
    `-1` = "no answer"
  ),
    qsocp16 = .replace_labels(
    standardized_value_labels$qsocp16,
    `-1` = "no answer"
  ),
    qsocp17 = .replace_labels(
    standardized_value_labels$qsocp17,
    `-1` = "no answer"
  ),
    qsocp18 = .replace_labels(
    standardized_value_labels$qsocp18,
    `-1` = "no answer"
  ),
    qsocp19 = .replace_labels(
    standardized_value_labels$qsocp19,
    `-1` = "no answer"
  ),
    qsocp21 = .replace_labels(
    standardized_value_labels$qsocp21,
    `-1` = "no answer",
    `1` = "every day",
    `2` = "4-5 times a week",
    `3` = "2-3 times a week",
    `4` = "<2 times a week"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21"
  )],
    qsocp07 = .replace_labels(
    standardized_value_labels$qsocp07,
    `-1` = "no answer"
  ),
    qsocp08 = .replace_labels(
    standardized_value_labels$qsocp08,
    `-1` = "no answer"
  ),
    qsocp09 = .replace_labels(
    standardized_value_labels$qsocp09,
    `-1` = "no answer"
  ),
    qsocp10 = .replace_labels(
    standardized_value_labels$qsocp10,
    `-1` = "no answer"
  ),
    qsocp11 = .replace_labels(
    standardized_value_labels$qsocp11,
    `-1` = "no answer"
  ),
    qsocp12 = .replace_labels(
    standardized_value_labels$qsocp12,
    `-1` = "no answer"
  ),
    qsocp14 = .replace_labels(
    standardized_value_labels$qsocp14,
    `-1` = "no answer"
  ),
    qsocp15 = .replace_labels(
    standardized_value_labels$qsocp15,
    `-1` = "no answer"
  ),
    qsocp16 = .replace_labels(
    standardized_value_labels$qsocp16,
    `-1` = "no answer"
  ),
    qsocp17 = .replace_labels(
    standardized_value_labels$qsocp17,
    `-1` = "no answer"
  ),
    qsocp18 = .replace_labels(
    standardized_value_labels$qsocp18,
    `-1` = "no answer"
  ),
    qsocp19 = .replace_labels(
    standardized_value_labels$qsocp19,
    `-1` = "no answer"
  ),
    qsocp20 = .replace_labels(
    standardized_value_labels$qsocp20,
    `-1` = "no answer"
  ),
    qsocp21 = .replace_labels(
    standardized_value_labels$qsocp21,
    `-1` = "no answer",
    `1` = "every day",
    `2` = "4-5 times a week",
    `3` = "2-3 times a week",
    `4` = "<2 times a week"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21"
  )],
    qsocp07 = .replace_labels(
    standardized_value_labels$qsocp07,
    `-1` = "no answer"
  ),
    qsocp08 = .replace_labels(
    standardized_value_labels$qsocp08,
    `-1` = "no answer"
  ),
    qsocp09 = .replace_labels(
    standardized_value_labels$qsocp09,
    `-1` = "no answer"
  ),
    qsocp10 = .replace_labels(
    standardized_value_labels$qsocp10,
    `-1` = "no answer"
  ),
    qsocp11 = .replace_labels(
    standardized_value_labels$qsocp11,
    `-1` = "no answer"
  ),
    qsocp12 = .replace_labels(
    standardized_value_labels$qsocp12,
    `-1` = "no answer"
  ),
    qsocp14 = .replace_labels(
    standardized_value_labels$qsocp14,
    `-1` = "no answer"
  ),
    qsocp15 = .replace_labels(
    standardized_value_labels$qsocp15,
    `-1` = "no answer"
  ),
    qsocp16 = .replace_labels(
    standardized_value_labels$qsocp16,
    `-1` = "no answer"
  ),
    qsocp17 = .replace_labels(
    standardized_value_labels$qsocp17,
    `-1` = "no answer"
  ),
    qsocp18 = .replace_labels(
    standardized_value_labels$qsocp18,
    `-1` = "no answer"
  ),
    qsocp19 = .replace_labels(
    standardized_value_labels$qsocp19,
    `-1` = "no answer"
  ),
    qsocp20 = .replace_labels(
    standardized_value_labels$qsocp20,
    `-1` = "no answer"
  ),
    qsocp21 = .replace_labels(
    standardized_value_labels$qsocp21,
    `-1` = "no answer",
    `1` = "every day",
    `2` = "4-5 times a week",
    `3` = "2-3 times a week",
    `4` = "<2 times a week"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qsocp04",
    "qsocp05",
    "qsocp06",
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp13",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21"
  )],
    qsocp04 = .replace_labels(
    standardized_value_labels$qsocp04,
    `-2` = "no data, age",
    `-1` = "no answer"
  ),
    qsocp05 = .replace_labels(
    standardized_value_labels$qsocp05,
    `-2` = "no answer, routing",
    `-1` = "no answer"
  ),
    qsocp06 = .replace_labels(
    standardized_value_labels$qsocp06,
    `-1` = "no answer"
  ),
    qsocp07 = .replace_labels(
    standardized_value_labels$qsocp07,
    `-1` = "no answer"
  ),
    qsocp08 = .replace_labels(
    standardized_value_labels$qsocp08,
    `-1` = "no answer"
  ),
    qsocp09 = .replace_labels(
    standardized_value_labels$qsocp09,
    `-1` = "no answer"
  ),
    qsocp10 = .replace_labels(
    standardized_value_labels$qsocp10,
    `-1` = "no answer"
  ),
    qsocp11 = .replace_labels(
    standardized_value_labels$qsocp11,
    `-1` = "no answer"
  ),
    qsocp12 = .replace_labels(
    standardized_value_labels$qsocp12,
    `-1` = "no answer"
  ),
    qsocp13 = .replace_labels(
    standardized_value_labels$qsocp13,
    `-1` = "no answer"
  ),
    qsocp14 = .replace_labels(
    standardized_value_labels$qsocp14,
    `-1` = "no answer"
  ),
    qsocp15 = .replace_labels(
    standardized_value_labels$qsocp15,
    `-1` = "no answer"
  ),
    qsocp16 = .replace_labels(
    standardized_value_labels$qsocp16,
    `-1` = "no answer"
  ),
    qsocp17 = .replace_labels(
    standardized_value_labels$qsocp17,
    `-1` = "no answer"
  ),
    qsocp18 = .replace_labels(
    standardized_value_labels$qsocp18,
    `-1` = "no answer"
  ),
    qsocp19 = .replace_labels(
    standardized_value_labels$qsocp19,
    `-1` = "no answer"
  ),
    qsocp20 = .replace_labels(
    standardized_value_labels$qsocp20,
    `-1` = "no answer"
  ),
    qsocp21 = c(
    `-1` = "no answer",
    `1` = "very often",
    `2` = "often",
    `3` = "some of the time",
    `4` = "never"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp21"
  )],
    qsocp07 = .replace_labels(
    standardized_value_labels$qsocp07,
    `-1` = "no answer"
  ),
    qsocp08 = .replace_labels(
    standardized_value_labels$qsocp08,
    `-1` = "no answer"
  ),
    qsocp09 = .replace_labels(
    standardized_value_labels$qsocp09,
    `-1` = "no answer"
  ),
    qsocp10 = .replace_labels(
    standardized_value_labels$qsocp10,
    `-1` = "no answer"
  ),
    qsocp11 = .replace_labels(
    standardized_value_labels$qsocp11,
    `-1` = "no answer"
  ),
    qsocp12 = .replace_labels(
    standardized_value_labels$qsocp12,
    `-1` = "no answer"
  ),
    qsocp14 = .replace_labels(
    standardized_value_labels$qsocp14,
    `-1` = "no answer"
  ),
    qsocp15 = .replace_labels(
    standardized_value_labels$qsocp15,
    `-1` = "no answer"
  ),
    qsocp16 = .replace_labels(
    standardized_value_labels$qsocp16,
    `-1` = "no answer"
  ),
    qsocp17 = .replace_labels(
    standardized_value_labels$qsocp17,
    `-1` = "no answer"
  ),
    qsocp18 = .replace_labels(
    standardized_value_labels$qsocp18,
    `-1` = "no answer"
  ),
    qsocp19 = .replace_labels(
    standardized_value_labels$qsocp19,
    `-1` = "no answer"
  ),
    qsocp20 = .replace_labels(
    standardized_value_labels$qsocp20,
    `-1` = "no answer"
  ),
    qsocp21 = .replace_labels(
    standardized_value_labels$qsocp21,
    `-1` = "no answer",
    `1` = "every day",
    `2` = "4-5 times a week",
    `3` = "2-3 times a week",
    `4` = "<2 times a week"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "qsocp07",
    "qsocp08",
    "qsocp09",
    "qsocp10",
    "qsocp11",
    "qsocp12",
    "qsocp14",
    "qsocp15",
    "qsocp16",
    "qsocp17",
    "qsocp18",
    "qsocp19",
    "qsocp20",
    "qsocp20b",
    "qsocp21"
  )],
    qsocp07 = .replace_labels(
    standardized_value_labels$qsocp07,
    `-1` = "no answer"
  ),
    qsocp08 = .replace_labels(
    standardized_value_labels$qsocp08,
    `-1` = "no answer"
  ),
    qsocp09 = .replace_labels(
    standardized_value_labels$qsocp09,
    `-1` = "no answer"
  ),
    qsocp10 = .replace_labels(
    standardized_value_labels$qsocp10,
    `-1` = "no answer"
  ),
    qsocp11 = .replace_labels(
    standardized_value_labels$qsocp11,
    `-1` = "no answer"
  ),
    qsocp12 = .replace_labels(
    standardized_value_labels$qsocp12,
    `-1` = "no answer"
  ),
    qsocp14 = .replace_labels(
    standardized_value_labels$qsocp14,
    `-1` = "no answer"
  ),
    qsocp15 = .replace_labels(
    standardized_value_labels$qsocp15,
    `-1` = "no answer"
  ),
    qsocp16 = .replace_labels(
    standardized_value_labels$qsocp16,
    `-1` = "no answer"
  ),
    qsocp17 = .replace_labels(
    standardized_value_labels$qsocp17,
    `-1` = "no answer"
  ),
    qsocp18 = .replace_labels(
    standardized_value_labels$qsocp18,
    `-1` = "no answer"
  ),
    qsocp19 = .replace_labels(
    standardized_value_labels$qsocp19,
    `-1` = "no answer"
  ),
    qsocp20 = .replace_labels(
    standardized_value_labels$qsocp20,
    `-1` = "no answer"
  ),
    qsocp20b = .replace_labels(
    standardized_value_labels$qsocp20b,
    `-1` = "no answer"
  ),
    qsocp21 = .replace_labels(
    standardized_value_labels$qsocp21,
    `-1` = "no answer",
    `1` = "every day",
    `2` = "4-5 times a week",
    `3` = "2-3 times a week",
    `4` = "<2 times a week"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qsocp04 = "categorical",
  qsocp05 = "categorical",
  qsocp06 = "numeric",
  qsocp07 = "categorical",
  qsocp08 = "categorical",
  qsocp09 = "categorical",
  qsocp10 = "categorical",
  qsocp11 = "categorical",
  qsocp12 = "categorical",
  qsocp13 = "numeric",
  qsocp14 = "categorical",
  qsocp15 = "categorical",
  qsocp16 = "categorical",
  qsocp17 = "categorical",
  qsocp18 = "categorical",
  qsocp19 = "categorical",
  qsocp20 = "categorical",
  qsocp20b = "categorical",
  qsocp21 = "categorical",
  qsocp22 = "categorical",
  qsocp23 = "categorical",
  qsocp24 = "categorical",
  qsocp25 = "categorical",
  qsocp26 = "categorical",
  qsocp27 = "categorical"
)

.lasa_fc_125 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "125", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "125", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "125", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "125", waves = .lasa_wave_rows())
)
