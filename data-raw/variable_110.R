## LASA filecode 110 -- variable names, variable labels, value labels,
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
  qimpor1 = "categorical",
  qimpor2 = "categorical",
  qimpor3 = "categorical",
  qimpor4 = "categorical",
  qimpor5 = "categorical",
  qimpor6 = "categorical",
  qimpor7 = "categorical",
  qimpor8 = "categorical",
  qimpor9 = "categorical",
  qnansw = "numeric",
  qsatis1 = "categorical",
  qsatis2 = "categorical",
  qsatis3 = "numeric",
  qsatis4 = "categorical"
)

# define variable labels ----
variable_labels(
  qimpor1 = "good income",
  qimpor2 = "nice family",
  qimpor3 = "good physical health",
  qimpor4 = "sensible spending of time / meaningful pastime",
  qimpor5 = "good marital life",
  qimpor6 = "strong faith",
  qimpor7 = "good mental health",
  qimpor8 = "many friends and acquaintances",
  qimpor9 = "good housing",
  qnansw = "number of answers given on 9 items",
  qsatis1 = "satisfied with life: lately",
  qsatis2 = "satisfied with life: until now",
  qsatis3 = "satisfied with life: now score from 0 to 10",
  qsatis4 = "satisfied with life: now compared to year ago",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qimpor1", "qimpor2", "qimpor3", "qimpor5", "qimpor6", "qimpor7", "qimpor8", "qimpor9", "qnansw", "qsatis1", "qsatis2",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "qsatis3", "qsatis4",
  .applies_to_waves = c("H", "I", "J")
)

variable_labels(
  qimpor4 = "sensible spending of time",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H")
)

variable_labels(
  qimpor4 = "meaningful pastime",
  .applies_to_waves = c("3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "missing", `1` = "mentioned", `2` = "not mentioned",
  .applies_to_vars = c("qimpor1", "qimpor2", "qimpor3", "qimpor4", "qimpor5", "qimpor6", "qimpor7", "qimpor8", "qimpor9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "none mentioned", `1` = "1 mentioned", `9` = "9 mentioned",
  .applies_to_vars = c("qnansw"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "not available", `1` = "very dissatisfied", `2` = "dissatisfied", `3` = "not dissatisfied/satisfied", `4` = "satisfied", `5` = "very satisfied",
  .applies_to_vars = c("qsatis1", "qsatis2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `0` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("qsatis3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "much more satisfied", `2` = "more satisfied", `3` = "equally satisfied", `4` = "less dissatisfied", `5` = "much less satisfied",
  .applies_to_vars = c("qsatis4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "all 3 missing",
  .applies_to_vars = c("qimpor1", "qimpor2", "qimpor3", "qimpor4", "qimpor5", "qimpor6", "qimpor7", "qimpor8", "qimpor9"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `1` = "mentioned", `2` = "not mentioned",
  .applies_to_vars = c("qimpor1", "qimpor2", "qimpor3", "qimpor4", "qimpor5", "qimpor6", "qimpor7", "qimpor8", "qimpor9"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "very dissatisfied", `2` = "dissatisfied", `3` = "not dissatisfied/satisfied", `4` = "satisfied", `5` = "very satisfied",
  .applies_to_vars = c("qsatis1", "qsatis2"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no answer", `0` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("qsatis3"),
  .applies_to_waves = c("H", "I", "J")
)

value_labels(
  `-1` = "no answer", `1` = "much more satisfied", `2` = "more satisfied", `3` = "equally satisfied", `4` = "less dissatisfied", `5` = "much less satisfied",
  .applies_to_vars = c("qsatis4"),
  .applies_to_waves = c("H", "I", "J")
)

.lasa_fc_110 <- .lasa_finalize_fc("110")

