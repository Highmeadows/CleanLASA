## LASA filecode 118 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  qfood27 = "phys. cond. limit shopping and cooking",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qfood01",
  .applies_to_waves = c("B", "C", "D")
)

variable_labels(
  "qfood02", "qfood03", "qfood04", "qfood05", "qfood06", "qfood07", "qfood08", "qfood09", "qfood10", "qfood11", "qfood12", "qfood13", "qfood14", "qfood15", "qfood16", "qfood17", "qfood18", "qfood19", "qfood20",
  .applies_to_waves = c("B")
)

variable_labels(
  "qfood21", "qfood22", "qfood23", "qfood24", "qfood25", "qfood26", "qfood27",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  "qapp1", "qapp2", "qapp3", "qapp4",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("qapp1", "qapp2", "qapp3", "qapp4", "qfood01", "qfood02", "qfood03", "qfood04", "qfood05", "qfood06", "qfood07", "qfood08", "qfood09", "qfood10", "qfood11", "qfood12", "qfood13", "qfood14", "qfood15", "qfood16", "qfood17", "qfood18", "qfood19", "qfood20", "qfood21", "qfood22", "qfood23", "qfood24", "qfood25", "qfood26", "qfood27"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "satiated after a few bites", `2` = "satiated after 1/3 the meal", `3` = "satiated after 1/2 the meal", `4` = "satiated after most of the meal", `5` = "never satiated",
  .applies_to_vars = c("qapp1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "very bad", `2` = "bad", `3` = "moderate", `4` = "good", `5` = "very good",
  .applies_to_vars = c("qapp2", "qapp3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "< 1 meal per day", `2` = "1 meals per day", `3` = "2 meals per day", `4` = "3 meals per day", `5` = "> 3 meals per day",
  .applies_to_vars = c("qapp4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave",
  .applies_to_vars = c("qfood01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("qfood06", "qfood07", "qfood08", "qfood09", "qfood10", "qfood11", "qfood12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes", `2` = "no",
  .applies_to_vars = c("qfood21", "qfood22", "qfood23", "qfood24", "qfood25", "qfood26", "qfood27"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer", `1` = "almost never", `2` = "some of the day", `3` = "often", `4` = "most of the time",
  .applies_to_vars = c("qfood01"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qfood02", "qfood03", "qfood04", "qfood05", "qfood13", "qfood14", "qfood15", "qfood16", "qfood17", "qfood18", "qfood19", "qfood20"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qfood06", "qfood07", "qfood08", "qfood09", "qfood10", "qfood11", "qfood12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no value", `1` = "yes, without trouble", `2` = "yes, with some trouble", `3` = "yes, with much trouble", `4` = "no, I cannot",
  .applies_to_vars = c("qfood01"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-1` = "no answer", `1` = "yes", `2` = "no",
  .applies_to_vars = c("qfood21", "qfood22", "qfood23", "qfood24", "qfood25", "qfood26", "qfood27"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-1` = "no answer", `1` = "satiated after a few bites", `2` = "satiated after 1/3 the meal", `3` = "satiated after 1/2 the meal", `4` = "satiated after most of the meal", `5` = "never satiated",
  .applies_to_vars = c("qapp1"),
  .applies_to_waves = c("K")
)

value_labels(
  `-1` = "no answer", `1` = "very bad", `2` = "bad", `3` = "moderate", `4` = "good", `5` = "very good",
  .applies_to_vars = c("qapp2", "qapp3"),
  .applies_to_waves = c("K")
)

value_labels(
  `-1` = "no answer", `1` = "< 1 meal per day", `2` = "1 meals per day", `3` = "2 meals per day", `4` = "3 meals per day", `5` = "> 3 meals per day",
  .applies_to_vars = c("qapp4"),
  .applies_to_waves = c("K")
)

.lasa_fc_118 <- .lasa_finalize_fc("118")

