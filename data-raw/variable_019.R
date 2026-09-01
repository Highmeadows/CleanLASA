## LASA filecode 019 -- variable names, variable labels, value labels,
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
  incdclm = "date",
  incdcly = "date",
  incdecl = "categorical",
  incfutu = "categorical",
  incsat1 = "categorical",
  incsat2 = "categorical"
)

# define variable labels ----
variable_labels(
  incdclm = "Moment of (major) decline: month",
  incdcly = "Moment of (major) decline: year",
  incdecl = "Net monthly decline in income",
  incfutu = "Next two years income: increase/decrease",
  incsat1 = "Satisfaction with income level",
  incsat2 = "Satisfaction with income and living standard",
  .applies_to_waves = c("Z")
)

variable_labels(
  "incfutu",
  .applies_to_waves = c("B", "C", "D")
)

variable_labels(
  "incsat1", "incsat2",
  .applies_to_waves = c("B")
)

variable_labels(
  incdecl = "Income decline last 5 years net/month (in Dutch Guilders)",
  .applies_to_waves = c("B")
)

variable_labels(
  incdclm = "moment of (major) decline: month",
  incdcly = "moment of (major) decline: year",
  .applies_to_waves = c("C", "D", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  incdecl = "net monthly decline in income last 3 years (in Dutch Guilders)",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  incsat1 = "satisfaction with income level",
  incsat2 = "satisfaction with income and living standard",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  incdecl = "net monthly decline in income last 5 years",
  .applies_to_waves = c("2B", "3B", "MB")
)

variable_labels(
  incdecl = "net monthly decline in income last 3 years",
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-3` = "na, wrong skip", `-2` = "not available, routing", `-1` = "na, asked", `1` = "january", `2` = "february", `3` = "march", `4` = "april", `5` = "may", `6` = "june", `7` = "july", `8` = "august", `9` = "september", `10` = "october", `11` = "november", `12` = "december",
  .applies_to_vars = c("incdclm"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("incdcly"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, refused", `-5` = "not available, refused", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "not available, routing", `-1` = "not available", `1` = "no", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "label varies by wave", `8` = "yes, do not know how many",
  .applies_to_vars = c("incdecl"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-1` = "na, asked", `1` = "decrease", `2` = "same", `3` = "increase",
  .applies_to_vars = c("incfutu"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, refused", `-5` = "not available, refused", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "not available", `1` = "dissatisfied", `2` = "a little dissatisfied", `3` = "not dissatisfied/satisfied", `4` = "a little satisfied", `5` = "satisfied",
  .applies_to_vars = c("incsat1", "incsat2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "na, refused", `-4` = "na, short version", `-1` = "na, do not know", `1` = "no", `2` = "yes, < \306\222 100", `3` = "yes, \306\222 100 - 200", `4` = "yes, \306\222 200 - 300", `5` = "yes, \306\222 300 - 400", `6` = "yes, \306\222 400 - 500", `7` = "yes, > \306\222 500",
  .applies_to_vars = c("incdecl"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short version", `-1` = "na, asked", `1` = "decrease", `2` = "same", `3` = "increase",
  .applies_to_vars = c("incfutu"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "na, refused", `-4` = "na, short version", `-1` = "na, do not know", `1` = "dissatisfied", `2` = "a little dissatisfied", `3` = "not dissatisfied/satisfied", `4` = "a little satisfied", `5` = "satisfied",
  .applies_to_vars = c("incsat1", "incsat2"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DINCDECL", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("incdclm"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DINCDECL", `-1` = "na, asked",
  .applies_to_vars = c("incdcly"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-5` = "na, refused", `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "no answer, routing", `-1` = "na, asked", `1` = "no", `2` = "yes, < \306\222 100", `3` = "yes, \306\222 100 - 200", `4` = "yes, \306\222 200 - 300", `5` = "yes, \306\222 300 - 400", `6` = "yes, \306\222 400 - 500", `7` = "yes, \306\222 500 >", `8` = "yes, do not know how many",
  .applies_to_vars = c("incdecl"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-4` = "na, short version", `-1` = "na, asked", `1` = "decrease", `2` = "stays the same", `3` = "increase",
  .applies_to_vars = c("incfutu"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-4` = "na, short version", `-1` = "na, asked", `1` = "dissatisfied", `2` = "a little dissatisfied", `3` = "not dissatisfied/satisfied", `4` = "a little satisfied", `5` = "satisfied",
  .applies_to_vars = c("incsat1", "incsat2"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-5` = "na, refused", `-4` = "na, short version", `-1` = "na, asked", `1` = "dissatisfied", `2` = "a little dissatisfied", `3` = "not dissatisfied/satisfied", `4` = "a little satisfied", `5` = "satisfied",
  .applies_to_vars = c("incsat1", "incsat2"),
  .applies_to_waves = c("E", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-5` = "na, refusal", `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "no answer, routing", `-1` = "no answer, asked", `1` = "no", `2` = "yes, < 45,45 euro", `3` = "yes, 45,45 - 90,90 euro", `4` = "yes, 90,90 - 136,36 euro", `5` = "yes, 136,36 - 181,81 euro", `6` = "yes, 181,81 - 227,27 euro", `7` = "yes, > 227,27 euro", `8` = "yes, do not know how many",
  .applies_to_vars = c("incdecl"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-4` = "na, short version", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "dissatisfied", `2` = "a little dissatisfied", `3` = "not dissatisfied/satisfied", `4` = "a little satisfied", `5` = "satisfied",
  .applies_to_vars = c("incsat1", "incsat2"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see G/H/I/J/KINCDECL",
  .applies_to_vars = c("incdclm", "incdcly"),
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("incdclm"),
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("incdcly"),
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

value_labels(
  `-5` = "na, refused", `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "no answer, routing", `-1` = "na, asked", `1` = "no", `2` = "yes, < 45 euro", `3` = "yes, 45 - 136 euro", `4` = "yes, 136 - 227 euro", `5` = "yes, 227 - 318 euro", `6` = "yes, 318 - 410 euro", `7` = "yes, > 410 euro",
  .applies_to_vars = c("incdecl"),
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCDECL", `-1` = "na, asked",
  .applies_to_vars = c("incdclm", "incdcly"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-5` = "na, refused", `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes, < 45 euro", `3` = "yes, 45 - 136 euro", `4` = "yes, 136 - 227 euro", `5` = "yes, 227 - 318 euro", `6` = "yes, 318 - 410 euro", `7` = "yes, > 410 euro",
  .applies_to_vars = c("incdecl"),
  .applies_to_waves = c("MB")
)

.lasa_fc_019 <- .lasa_finalize_fc("019")

