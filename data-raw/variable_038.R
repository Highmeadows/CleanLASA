## LASA filecode 038 -- variable names, variable labels, value labels,
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
  relig01 = "categorical",
  relig02 = "categorical",
  relig03 = "categorical",
  relig04 = "categorical",
  relig05 = "categorical",
  relig06 = "categorical",
  relig07 = "categorical",
  relig08 = "categorical",
  relig09 = "categorical",
  relig10 = "categorical",
  relig11 = "categorical",
  relig12 = "categorical",
  relig13 = "categorical",
  relig14 = "categorical",
  relig15 = "categorical",
  relig16 = "categorical",
  relig17 = "categorical",
  relig18 = "categorical",
  relig19 = "categorical",
  relig1a = "categorical",
  relig1b = "categorical",
  relig8a = "categorical",
  rmgl = "categorical"
)

# define variable labels ----
variable_labels(
  relig01 = "Member of a church or a particular ideological group?",
  relig02 = "Life after death",
  relig03 = "Heaven",
  relig04 = "Hell",
  relig05 = "Devil",
  relig06 = "Adam and Eve",
  relig07 = "Bible as God",
  relig08 = "Praying: meaningful",
  relig09 = "Influences my daily life",
  relig10 = "Role in important decisions",
  relig11 = "Influences my political opinion",
  relig12 = "Life would look different without",
  relig13 = "Faith: very interesting",
  relig14 = "Border life/death less striking",
  relig15 = "Unimportance individual life",
  relig16 = "Mutual connection universe",
  relig17 = "Close presence persons",
  relig18 = "Distance past/present disappears",
  relig19 = "Belonging with earlier/coming generation",
  relig1a = "Which church or particular ideological group?",
  relig1b = "Church attendance frequency",
  relig8a = "Praying: frequency",
  rmgl = "Reason missing",
  .applies_to_waves = c("Z")
)

variable_labels(
  "relig01", "relig09", "relig10", "relig11", "relig12", "relig13",
  .applies_to_waves = c("C", "D", "E", "2B")
)

variable_labels(
  "relig02", "relig03", "relig04", "relig05", "relig06", "relig07",
  .applies_to_waves = c("C")
)

variable_labels(
  "relig08",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "relig14", "relig15", "relig16", "relig17", "relig18", "relig19",
  .applies_to_waves = c("C", "D", "E", "2B", "F")
)

variable_labels(
  "rmgl",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H")
)

variable_labels(
  "relig1a",
  .applies_to_waves = c("D")
)

variable_labels(
  "relig1b",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "MB", "I", "J", "K")
)

variable_labels(
  "relig8a",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  relig08 = "Praying:",
  relig8a = "Praying:",
  .applies_to_waves = c("3B")
)

variable_labels(
  relig1a = "Member of a church or particular ideological group",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("relig01", "relig02", "relig03", "relig04", "relig05", "relig06", "relig07", "relig08", "relig09", "relig10", "relig11", "relig12", "relig13", "relig14", "relig15", "relig16", "relig17", "relig18", "relig19", "relig1a", "relig1b", "relig8a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("relig01"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("relig02", "relig03", "relig04", "relig05", "relig06", "relig07"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-5` = "meaningful interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("relig08"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "strongly agree", `2` = "agree", `3` = "no agreement/no disagree", `4` = "disagree", `5` = "strongly disagree",
  .applies_to_vars = c("relig09", "relig10", "relig11", "relig12", "relig13"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B")
)

value_labels(
  `-1` = "na, asked", `1` = "not recognizing content", `2` = "recognizing content",
  .applies_to_vars = c("relig14", "relig15", "relig16", "relig17", "relig18", "relig19"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B")
)

value_labels(
  `-1` = "na, asked", `0` = "no member (not religious)", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "Roman-Catholic", `6` = "other protestant denomination", `7` = "label varies by wave", `8` = "label varies by wave", `9` = "label varies by wave", `10` = "Hinduism", `11` = "other",
  .applies_to_vars = c("relig1a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "never", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "once a day", `8` = "more than once a day",
  .applies_to_vars = c("relig1b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "frequency interview terminated", `-1` = "na, asked", `1` = "never", `2` = "less than once a month", `3` = "once a month", `4` = "a few times a month", `5` = "once a week", `6` = "a few times a week", `7` = "once a day", `8` = "more than once a day",
  .applies_to_vars = c("relig8a"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-2` = "valid data", `1` = "short interview", `2` = "interview terminated",
  .applies_to_vars = c("rmgl"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-2` = "na, see CRMGL",
  .applies_to_vars = c("relig01", "relig02", "relig03", "relig04", "relig05", "relig06", "relig07", "relig08", "relig09", "relig10", "relig11", "relig12", "relig13", "relig14", "relig15", "relig16", "relig17", "relig18", "relig19"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("relig08"),
  .applies_to_waves = c("C", "D", "E", "2B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see D/E/BRMGL",
  .applies_to_vars = c("relig01", "relig08", "relig09", "relig10", "relig11", "relig12", "relig13", "relig14", "relig15", "relig16", "relig17", "relig18", "relig19", "relig8a"),
  .applies_to_waves = c("D", "E", "2B")
)

value_labels(
  `-2` = "na, see DRELIG01", `-1` = "na, asked", `1` = "Dutch Reformed (without Ger. Bond)", `2` = "Ger. Bond (Dutch Reformed)", `3` = "Reformed Calvinist", `4` = "small Reformed denomination", `5` = "Roman-Catholic", `6` = "other protestant denomination", `7` = "Humanistic Society", `8` = "Jewish", `9` = "Muslim", `10` = "Hinduism", `11` = "other",
  .applies_to_vars = c("relig1a"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see D/E/BRELIG01", `-1` = "na, asked", `1` = "never", `2` = "once a year or less", `3` = "a few times a year", `4` = "approx. once a month", `5` = "2 or 3 times a month", `6` = "once a week or more",
  .applies_to_vars = c("relig1b"),
  .applies_to_waves = c("D", "E", "2B")
)

value_labels(
  `-1` = "na, asked", `1` = "never", `2` = "less than once a month", `3` = "once a month", `4` = "a few times a month", `5` = "once a week", `6` = "a few times a week", `7` = "once a day", `8` = "more than once a day",
  .applies_to_vars = c("relig8a"),
  .applies_to_waves = c("D", "E", "2B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see FRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("relig08"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FRMGL", `-1` = "na, asked", `1` = "not recognizing content", `2` = "recognizing content",
  .applies_to_vars = c("relig14", "relig15", "relig16", "relig17", "relig18", "relig19"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FRMGL", `-1` = "na, asked", `1` = "never", `2` = "once a year or less", `3` = "a few times a year", `4` = "approx. once a month", `5` = "2 or 3 times a month", `6` = "once a week or more",
  .applies_to_vars = c("relig1b"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FRMGL", `-1` = "na, asked", `1` = "never", `2` = "less than once a month", `3` = "once a month", `4` = "a few times a month", `5` = "once a week", `6` = "a few times a week", `7` = "once a day", `8` = "more than once a day",
  .applies_to_vars = c("relig8a"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see G/HRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("relig08"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see G/HRMGL", `-1` = "na, asked", `1` = "never", `2` = "once a year or less", `3` = "a few times a year", `4` = "approx. once a month", `5` = "2 or 3 times a month", `6` = "once a week or more",
  .applies_to_vars = c("relig1b"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see G/HRMGL", `-1` = "na, asked", `1` = "never", `2` = "less than once a month", `3` = "once a month", `4` = "a few times a month", `5` = "once a week", `6` = "a few times a week", `7` = "once a day", `8` = "more than once a day",
  .applies_to_vars = c("relig8a"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-1` = "na, asked", `0` = "no member (not religious)", `1` = "Islam", `2` = "Roman-Catholic", `3` = "Protestant", `4` = "Jewish", `7` = "Orthodox", `8` = "Alevism", `9` = "Bahai",
  .applies_to_vars = c("relig1a"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-1` = "na, asked", `1` = "never", `2` = "less than once a month", `3` = "once a month", `4` = "a few times a month", `5` = "once a week", `6` = "a few times a week", `7` = "once a day", `8` = "more than once a day",
  .applies_to_vars = c("relig1b"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-1` = "na, asked", `1` = "never", `2` = "once a year or less", `3` = "a few times a year", `4` = "approx. once a month", `5` = "2 or 3 times a month", `6` = "once a week or more",
  .applies_to_vars = c("relig1b"),
  .applies_to_waves = c("I", "J", "K")
)

.lasa_fc_038 <- .lasa_finalize_fc("038")

