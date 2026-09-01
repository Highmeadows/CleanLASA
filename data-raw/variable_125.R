## LASA filecode 125 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  qsocp27 = "involved: neighborhood",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qsocp04", "qsocp05", "qsocp06", "qsocp13",
  .applies_to_waves = c("B", "2B")
)

variable_labels(
  "qsocp07", "qsocp08", "qsocp09", "qsocp10", "qsocp11", "qsocp12", "qsocp14", "qsocp15", "qsocp16", "qsocp17", "qsocp18", "qsocp19", "qsocp21",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "qsocp20",
  .applies_to_waves = c("B", "D", "E", "2B")
)

variable_labels(
  "qsocp22", "qsocp23", "qsocp24", "qsocp25", "qsocp26", "qsocp27",
  .applies_to_waves = c("B")
)

variable_labels(
  "qsocp20b",
  .applies_to_waves = c("G")
)

variable_labels(
  qsocp20 = "tv: films/tv series",
  .applies_to_waves = c("F", "G")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qsocp04", "qsocp05", "qsocp06", "qsocp07", "qsocp08", "qsocp09", "qsocp10", "qsocp11", "qsocp12", "qsocp13", "qsocp14", "qsocp15", "qsocp16", "qsocp17", "qsocp18", "qsocp19", "qsocp20", "qsocp20b", "qsocp21", "qsocp22", "qsocp23", "qsocp24", "qsocp25", "qsocp26", "qsocp27"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "yes", `2` = "no", `3` = "R thinks not yet applicable",
  .applies_to_vars = c("qsocp04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `1` = "almost never", `2` = "a few times a year", `3` = "once a month", `4` = "a few times a month", `5` = "once a week", `6` = "a few times a week", `7` = "every day",
  .applies_to_vars = c("qsocp05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "very often", `2` = "often", `3` = "some of the time", `4` = "never",
  .applies_to_vars = c("qsocp07", "qsocp08", "qsocp09", "qsocp10", "qsocp11", "qsocp12", "qsocp14", "qsocp15", "qsocp16", "qsocp17", "qsocp18", "qsocp19", "qsocp20", "qsocp20b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "never",
  .applies_to_vars = c("qsocp21"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "not at all involved", `2` = "not involved", `3` = "involved", `4` = "greatly involved",
  .applies_to_vars = c("qsocp22", "qsocp23", "qsocp24", "qsocp25", "qsocp26", "qsocp27"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no data, age", `-1` = "no answer", `1` = "yes", `2` = "no", `3` = "R thinks not yet applicable",
  .applies_to_vars = c("qsocp04"),
  .applies_to_waves = c("B", "2B")
)

value_labels(
  `-2` = "no answer, routing", `-1` = "no answer", `1` = "almost never", `2` = "a few times a year", `3` = "once a month", `4` = "a few times a month", `5` = "once a week", `6` = "a few times a week", `7` = "every day",
  .applies_to_vars = c("qsocp05"),
  .applies_to_waves = c("B", "2B")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qsocp06", "qsocp13"),
  .applies_to_waves = c("B", "2B")
)

value_labels(
  `-1` = "no answer", `1` = "very often", `2` = "often", `3` = "some of the time", `4` = "never",
  .applies_to_vars = c("qsocp07", "qsocp08", "qsocp09", "qsocp10", "qsocp11", "qsocp12", "qsocp14", "qsocp15", "qsocp16", "qsocp17", "qsocp18", "qsocp19"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-1` = "no answer", `1` = "very often", `2` = "often", `3` = "some of the time", `4` = "never",
  .applies_to_vars = c("qsocp20"),
  .applies_to_waves = c("B", "D", "E", "2B", "F", "G")
)

value_labels(
  `-1` = "no answer", `1` = "every day", `2` = "4-5 times a week", `3` = "2-3 times a week", `4` = "<2 times a week", `5` = "never",
  .applies_to_vars = c("qsocp21"),
  .applies_to_waves = c("B", "C", "D", "E", "F", "G")
)

value_labels(
  `-1` = "no answer", `1` = "not at all involved", `2` = "not involved", `3` = "involved", `4` = "greatly involved",
  .applies_to_vars = c("qsocp22", "qsocp23", "qsocp24", "qsocp25", "qsocp26", "qsocp27"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer", `1` = "very often", `2` = "often", `3` = "some of the time", `4` = "never",
  .applies_to_vars = c("qsocp21"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-1` = "no answer", `1` = "very often", `2` = "often", `3` = "some of the time", `4` = "never",
  .applies_to_vars = c("qsocp20b"),
  .applies_to_waves = c("G")
)

.lasa_fc_125 <- .lasa_finalize_fc("125")

