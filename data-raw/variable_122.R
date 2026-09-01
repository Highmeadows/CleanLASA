## LASA filecode 122 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  qvalu18e = "circumstances using suicide medication: other",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qvalu01",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "I")
)

variable_labels(
  "qvalu02",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "I", "J")
)

variable_labels(
  "qvalu03",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I")
)

variable_labels(
  "qvalu04", "qvalu05", "qvalu06", "qvalu07", "qvalu08", "qvalu09", "qvalu10", "qvalu11", "qvalu12", "qvalu13", "qvalu14", "qvalu15",
  .applies_to_waves = c("B")
)

variable_labels(
  "qvalu16", "qvalu17", "qvalu18",
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "qvalu18a", "qvalu18b", "qvalu18c", "qvalu18d", "qvalu18e",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qvalu01", "qvalu02", "qvalu03", "qvalu04", "qvalu05", "qvalu06", "qvalu07", "qvalu08", "qvalu09", "qvalu10", "qvalu11", "qvalu12", "qvalu13", "qvalu14", "qvalu15", "qvalu16", "qvalu17", "qvalu18"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "acceptable", `2` = "not acceptable", `3` = "opposed", `4` = "no opinion",
  .applies_to_vars = c("qvalu01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes, there are", `2` = "no, there are not", `3` = "label varies by wave",
  .applies_to_vars = c("qvalu02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes, (s)he should", `2` = "it depends", `3` = "no, (s)he should not", `4` = "no opinion",
  .applies_to_vars = c("qvalu03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qvalu04", "qvalu05", "qvalu06", "qvalu07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "public school", `2` = "religious school", `3` = "does not matter", `4` = "do not know",
  .applies_to_vars = c("qvalu08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "independent", `2` = "it depends", `3` = "not independent", `4` = "do not know",
  .applies_to_vars = c("qvalu09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes", `2` = "no",
  .applies_to_vars = c("qvalu10", "qvalu11", "qvalu12", "qvalu13", "qvalu14", "qvalu16"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "extreme left", `2` = "left", `3` = "moderate left", `4` = "not left, nor right", `5` = "moderate right", `6` = "right", `7` = "extreme right", `8` = "do not know",
  .applies_to_vars = c("qvalu15"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes", `2` = "no", `3` = "no opinion",
  .applies_to_vars = c("qvalu17"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "label varies by wave", `2` = "label varies by wave", `3` = "no",
  .applies_to_vars = c("qvalu18"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qvalu18a", "qvalu18b", "qvalu18c", "qvalu18d", "qvalu18e"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "acceptable", `2` = "not acceptable", `3` = "opposed", `4` = "no opinion",
  .applies_to_vars = c("qvalu01"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "I")
)

value_labels(
  `-1` = "no answer", `1` = "yes, there are", `2` = "no, there are not", `3` = "no opinion",
  .applies_to_vars = c("qvalu02"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "I")
)

value_labels(
  `-1` = "no answer", `1` = "yes, he should", `2` = "it depends", `3` = "no, he should not", `4` = "no opinion",
  .applies_to_vars = c("qvalu03"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer", `1` = "strongly disagree", `2` = "disagree", `3` = "no agreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("qvalu04", "qvalu05", "qvalu06", "qvalu07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer", `1` = "public school", `2` = "religious school", `3` = "does not matter", `4` = "do not know",
  .applies_to_vars = c("qvalu08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer", `1` = "independent", `2` = "it depends", `3` = "not independent", `4` = "do not know",
  .applies_to_vars = c("qvalu09"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qvalu10", "qvalu11", "qvalu12", "qvalu13", "qvalu14"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer", `1` = "extreme left", `2` = "left", `3` = "moderate left", `4` = "not left, nor right", `5` = "moderate right", `6` = "right", `7` = "extreme right", `8` = "do not know",
  .applies_to_vars = c("qvalu15"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer", `1` = "yes, (s)he should", `2` = "it depends", `3` = "no, (s)he should not", `4` = "no opinion",
  .applies_to_vars = c("qvalu03"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qvalu16"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no", `3` = "no opinion",
  .applies_to_vars = c("qvalu17"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qvalu18"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "I")
)

value_labels(
  `-1` = "no answer", `1` = "yes, there are", `2` = "no, there are not", `3` = "opinion",
  .applies_to_vars = c("qvalu02"),
  .applies_to_waves = c("J")
)

value_labels(
  `-1` = "no answer", `1` = "yes, to be sure", `2` = "yes, to use soon", `3` = "no",
  .applies_to_vars = c("qvalu18"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "no answer, see jqvalu18", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qvalu18a", "qvalu18b", "qvalu18c", "qvalu18d", "qvalu18e"),
  .applies_to_waves = c("J")
)

.lasa_fc_122 <- .lasa_finalize_fc("122")
.lasa_fc_122$variables <- .lasa_fc_122$variables |>
  .override_label(wave = "J", variable = "qvalu16", override_value = "bqvalu16") |>
  .override_label(wave = "J", variable = "qvalu17", override_value = "bqvalu17") |>
  .override_label(wave = "J", variable = "qvalu18", override_value = "bqvalu18")

