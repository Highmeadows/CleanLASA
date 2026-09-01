## LASA filecode 153 -- variable names, variable labels, value labels,
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
  malcage = "numeric",
  malcagestop = "numeric",
  malcbeer = "categorical",
  malcbefore = "categorical",
  malcd = "categorical",
  malcgin = "categorical",
  malclig = "categorical",
  malcliq = "categorical",
  malcmix = "categorical",
  malcnr = "categorical",
  malcnr6 = "categorical",
  malctod = "categorical",
  malcupy = "categorical",
  malcuse = "categorical",
  malcw = "categorical",
  malcwine = "categorical",
  malcyn = "categorical"
)

# define variable labels ----
variable_labels(
  malcage = "Age stopped drinking",
  malcagestop = "Age stopped",
  malcbeer = "Beer",
  malcbefore = "Drank before",
  malcd = "Number of days a week/month usage",
  malcgin = "Gin",
  malclig = "Light",
  malcliq = "Liqueur",
  malcmix = "Cocktail",
  malcnr = "Number of glasses at one time",
  malcnr6 = "Number of time six glasses or more",
  malctod = "Which time of day",
  malcupy = "Alcohol use for the past year",
  malcuse = "Use in past",
  malcw = "Other people worried about alcohol use",
  malcwine = "Wine",
  malcyn = "Do you drink alcohol",
  .applies_to_waves = c("Z")
)

variable_labels(
  "malcagestop", "malcbefore", "malctod",
  .applies_to_waves = c("B")
)

variable_labels(
  "malcbeer", "malcgin", "malclig", "malcliq", "malcmix", "malcwine",
  .applies_to_waves = c("B", "2B", "3B")
)

variable_labels(
  "malcnr",
  .applies_to_waves = c("B", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "malcyn",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "malcupy",
  .applies_to_waves = c("C")
)

variable_labels(
  "malcd",
  .applies_to_waves = c("D", "E", "F", "G", "H", "MB", "I", "J", "K")
)

variable_labels(
  "malcnr6",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "malcage", "malcuse",
  .applies_to_waves = c("2B", "3B")
)

variable_labels(
  "malcw",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  malcd = "Number of days a week",
  malcnr6 = "Number of times six glasses or more",
  .applies_to_waves = c("B")
)

variable_labels(
  malcnr = "number of glasses each time",
  malcnr6 = "number of times R 6 glasses a day past half year",
  .applies_to_waves = c("C")
)

variable_labels(
  malcd = "Days a week usage",
  .applies_to_waves = c("2B", "3B")
)

variable_labels(
  malcw = "Alcohol: other people worried about alcohol use",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-4` = "no valid data",
  .applies_to_vars = c("malcagestop", "malcbeer", "malcbefore", "malcd", "malcgin", "malclig", "malcliq", "malcmix", "malcnr", "malctod", "malcwine", "malcyn"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see BMALCUSE", `-1` = "na, asked",
  .applies_to_vars = c("malcage"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-3` = "R never drank", `-2` = "R drinks at present", `-1` = "na, asked",
  .applies_to_vars = c("malcagestop"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "R does not drink / na, see BMALCYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcbeer"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "R never drank", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcbefore"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "R does not drink", `-1` = "na, asked", `1` = "every day", `2` = "5-6 days a week", `3` = "3-4 days a week", `4` = "1-2 days a week", `5` = "1-3 days a month", `6` = "less than 1 day a month",
  .applies_to_vars = c("malcd"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "R does not drink", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcgin", "malclig", "malcliq", "malcmix", "malcwine"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "R never drank / na, wrong skip", `-2` = "R drinks at present / na, see CMALCYN / R does not drink", `-1` = "na, asked", `1` = "11 glasses or more", `2` = "8-10 glasses", `3` = "6-7 glasses", `4` = "4-5 glasses", `5` = "2-3 glasses", `6` = "1 glass",
  .applies_to_vars = c("malcnr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "no valid data", `-4` = "R never drank", `-3` = "R drink/drank > 6 glasses / na, wrong skip", `-2` = "R drink/drank < 2 glasses / na, see CMACLNR / R does not drink", `-1` = "na, asked", `1` = "every day / daily", `2` = "5-6 days a week", `3` = "3-4 days a week", `4` = "1-2 days a week", `5` = "1-3 days a month", `6` = "less than 1 day a month / < 1 glass a month",
  .applies_to_vars = c("malcnr6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no answer, skipped", `-1` = "na, asked", `1` = "morning 7-12 hour", `2` = "afternoon 12-18 hour", `3` = "evening 18-24 hour", `4` = "night 0-7 hour",
  .applies_to_vars = c("malctod"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMALCYN", `-1` = "na, asked", `1` = "daily", `2` = "5-6 days a week", `3` = "3-4 days a week", `4` = "1-2 days a week", `5` = "1-3 days a month", `6` = "<1 day a month",
  .applies_to_vars = c("malcupy"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "na, see BMALCYN", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcuse"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-2` = "R does not drink / R does not drink 6 or more glasses at one time", `-1` = "na, asked", `1` = "no", `2` = "yes, but not in past year", `3` = "yes, in past year",
  .applies_to_vars = c("malcw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, interview terminated", `-2` = "no answer, skipped", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcyn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "R does not drink", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcbeer"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "R never drank", `-2` = "R drinks at present", `-1` = "na, asked", `1` = "11 glasses or more", `2` = "8-10 glasses", `3` = "6-7 glasses", `4` = "4-5 glasses", `5` = "2-3 glasses", `6` = "1 glass",
  .applies_to_vars = c("malcnr"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "no valid data", `-4` = "R never drank", `-3` = "R drink/drank > 6 glasses", `-2` = "R drink/drank < 2 glasses", `-1` = "na, asked", `1` = "every day", `2` = "5-6 days a week", `3` = "3-4 days a week", `4` = "1-2 days a week", `5` = "1-3 days a month", `6` = "less than 1 day a month",
  .applies_to_vars = c("malcnr6"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no answer, skipped", `-1` = "no answer, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcyn"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMALCYN", `-1` = "na, asked", `1` = "11 glasses or more", `2` = "8-10 glasses", `3` = "6-7 glasses", `4` = "4-5 glasses", `5` = "2-3 glasses", `6` = "1 glass",
  .applies_to_vars = c("malcnr"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMACLNR", `-1` = "na, asked", `1` = "daily", `2` = "5-6 days a week", `3` = "3-4 days a week", `4` = "1-2 days a week", `5` = "1-3 days a month", `6` = "< 1 glass a month",
  .applies_to_vars = c("malcnr6"),
  .applies_to_waves = c("C")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcyn"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "R does not drink", `-1` = "no answer, asked", `1` = "every day", `2` = "5-6 days a week", `3` = "3-4 days a week", `4` = "1-2 days a week", `5` = "1-3 days a month", `6` = "<1 day a month",
  .applies_to_vars = c("malcd"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "R does not drink", `-1` = "no answer, asked", `1` = "11 glasses or more", `2` = "8-10 glasses", `3` = "6-7 glasses", `4` = "4-5 glasses", `5` = "2-3 glasses", `6` = "1 glass",
  .applies_to_vars = c("malcnr"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "R does not drink", `-1` = "no answer, asked", `1` = "every day", `2` = "5-6 days a week", `3` = "3-4 days a week", `4` = "1-2 days a week", `5` = "1-3 days a month", `6` = "<1 day a month",
  .applies_to_vars = c("malcnr6"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no answer, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcyn"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BMALCYN", `-1` = "no answer, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcbeer"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-1` = "no answer, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("malcgin", "malclig", "malcliq", "malcmix", "malcwine"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "R does not drink", `-1` = "na, asked", `1` = "no", `2` = "yes, but not in past year", `3` = "yes, in past year",
  .applies_to_vars = c("malcw"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-2` = "R does not drink 6 or more glasses at one time", `-1` = "na, asked", `1` = "no", `2` = "yes, but not in past year", `3` = "yes, in past year",
  .applies_to_vars = c("malcw"),
  .applies_to_waves = c("3B")
)

.lasa_fc_153 <- .lasa_finalize_fc("153")

