## LASA filecode 181 -- variable names, variable labels, value labels,
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
  menno18 = "numeric",
  mmenno61 = "categorical",
  mmeno01 = "numeric",
  mmeno02 = "numeric",
  mmeno03 = "numeric",
  mmeno04 = "categorical",
  mmeno05 = "numeric",
  mmeno07 = "categorical",
  mmeno08 = "numeric",
  mmeno09 = "categorical",
  mmeno10 = "categorical",
  mmeno11 = "categorical",
  mmeno12 = "categorical",
  mmeno13 = "categorical",
  mmeno14 = "categorical",
  mmeno15 = "numeric",
  mmeno16 = "numeric",
  mmeno17 = "numeric",
  mmeno61 = "categorical",
  mmeno62 = "numeric",
  mmeno63 = "categorical",
  mmeno64 = "numeric",
  mmeno65 = "numeric",
  mmeno66 = "numeric",
  mmeno81 = "numeric",
  mmeno82 = "categorical",
  mmeno83 = "categorical",
  mmeno84 = "numeric",
  mmeno85 = "numeric"
)

# define variable labels ----
variable_labels(
  menno18 = "Menopause 10: number of months",
  mmenno61 = "Menopause: hysterectomy",
  mmeno01 = "Menopause: age start period",
  mmeno02 = "Menopause: number of children",
  mmeno03 = "Menopause: age first child born",
  mmeno04 = "Menopause: ever pregnant",
  mmeno05 = "Menopause: age last period",
  mmeno07 = "Menopause: used contraceptive pill",
  mmeno08 = "Menopause: # years contraceptive pill",
  mmeno09 = "Menopause: hot flushes",
  mmeno10 = "Menopause: excessive transpiration",
  mmeno11 = "Menopause: pain in muscles",
  mmeno12 = "Menopause: dry vagina",
  mmeno13 = "Menopause: pain during intercourse",
  mmeno14 = "Menopause: hot flushes in the past",
  mmeno15 = "Menopause: age first hot flushes",
  mmeno16 = "Menopause: age last hot flushes",
  mmeno17 = "Menopause 07: age first time",
  mmeno61 = "Menopause 02: had a hysterectomy",
  mmeno62 = "Menopause: age hysterectomy",
  mmeno63 = "Menopause: ovary removed",
  mmeno64 = "Menopause: age first ovary removed",
  mmeno65 = "Menopause: age second ovary removed",
  mmeno66 = "Menopause: age one ovary removed",
  mmeno81 = "Menopause: age start use contraceptive pill",
  mmeno82 = "Menopause: females sex hormones",
  mmeno83 = "Menopause: hormones type",
  mmeno84 = "Menopause: hormones start age",
  mmeno85 = "Menopause: hormones # months",
  .applies_to_waves = c("Z")
)

variable_labels(
  "menno18", "mmeno17", "mmeno61",
  .applies_to_waves = c("C")
)

variable_labels(
  "mmenno61", "mmeno02", "mmeno03", "mmeno04", "mmeno07", "mmeno08", "mmeno11", "mmeno12", "mmeno13", "mmeno15", "mmeno16", "mmeno81", "mmeno83",
  .applies_to_waves = c("2B", "3B")
)

variable_labels(
  "mmeno01", "mmeno05", "mmeno09", "mmeno10", "mmeno14", "mmeno62", "mmeno63", "mmeno64", "mmeno82", "mmeno84", "mmeno85",
  .applies_to_waves = c("2B", "3B", "MB")
)

variable_labels(
  "mmeno65", "mmeno66",
  .applies_to_waves = c("3B", "MB")
)

variable_labels(
  mmeno05 = "Menopause 01: age period stopped",
  mmeno09 = "Menopause 06: hot flushes",
  mmeno62 = "Menopause 03: hysterectomy age",
  mmeno63 = "Menopause 04: ovary removed",
  mmeno66 = "Menopause 05: ovary age (last operation)",
  mmeno82 = "Menopause 08: female sex hormones",
  mmeno83 = "Menopause 09: hormones type",
  .applies_to_waves = c("C")
)

variable_labels(
  mmeno61 = "Menopause: hysterectomy",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-5` = "na, interview terminated",
  .applies_to_vars = c("mmeno05", "mmeno09", "mmeno61", "mmeno63", "mmeno82"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMMENO82", `-1` = "R does not know age",
  .applies_to_vars = c("menno18"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmenno61"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked",
  .applies_to_vars = c("mmeno01"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-2` = "see BMMENO03", `-1` = "na, asked",
  .applies_to_vars = c("mmeno02"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-3` = "did not bear children", `-2` = "see BMMENO04", `-1` = "na, asked",
  .applies_to_vars = c("mmeno03"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-2` = "male respondent", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mmeno04", "mmeno07"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "missing / source-specific",
  .applies_to_vars = c("mmeno05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mmeno08", "mmeno16"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-3` = "missing / source-specific", `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "no", `3` = "R refused to answer", `4` = "R does not know",
  .applies_to_vars = c("mmeno09", "mmeno10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "R does not know", `-2` = "male respondent", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mmeno11", "mmeno12", "mmeno13"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-3` = "missing / source-specific", `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R refused to answer", `4` = "R does not know",
  .applies_to_vars = c("mmeno14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "see BMMENO14",
  .applies_to_vars = c("mmeno15"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMMENO09", `-1` = "R does not know age",
  .applies_to_vars = c("mmeno17"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmeno61"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "see BMMENO61", `-1` = "missing / source-specific",
  .applies_to_vars = c("mmeno62"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "missing / source-specific", `1` = "no", `2` = "yes, one taken", `3` = "yes, both taken",
  .applies_to_vars = c("mmeno63"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "see BMMENO63", `-1` = "na, asked",
  .applies_to_vars = c("mmeno64"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-2` = "na, see BMMENO63", `-1` = "na, asked",
  .applies_to_vars = c("mmeno65"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMMENO63", `-1` = "missing / source-specific",
  .applies_to_vars = c("mmeno66"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "see BMMENO07",
  .applies_to_vars = c("mmeno81"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "yes, after menopause", `4` = "yes, during and after menopause",
  .applies_to_vars = c("mmeno82"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "see BMMENO82", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("mmeno83"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "see BMMENO82",
  .applies_to_vars = c("mmeno84"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mmeno85"),
  .applies_to_waves = c("Z", "2B", "3B", "MB")
)

value_labels(
  `-2` = "male respondent", `-1` = "R does not know age",
  .applies_to_vars = c("mmeno05"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "male respondent", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmeno09", "mmeno61", "mmeno82"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMMENO61", `-1` = "R does not know age",
  .applies_to_vars = c("mmeno62"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "male respondent", `-1` = "R does not know age", `1` = "no", `2` = "yes, one taken", `3` = "yes, both taken",
  .applies_to_vars = c("mmeno63"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMMENO63", `-1` = "R does not know age",
  .applies_to_vars = c("mmeno66"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMMENO82", `0` = "to be coded",
  .applies_to_vars = c("mmeno83"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "male respondent", `-1` = "na, asked",
  .applies_to_vars = c("mmeno01", "mmeno05"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "R does not know", `-2` = "male respondent", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mmeno09", "mmeno10"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "R does not know", `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmeno14"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "see BMMENO61", `-1` = "na, asked",
  .applies_to_vars = c("mmeno62"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes, one removed", `3` = "yes, both removed",
  .applies_to_vars = c("mmeno63"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmeno82"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "see BMMENO82", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("mmeno83"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMMENO63", `-1` = "na, asked",
  .applies_to_vars = c("mmeno66"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked",
  .applies_to_vars = c("mmeno05"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R refused to answer", `4` = "R does not know",
  .applies_to_vars = c("mmeno09", "mmeno10", "mmeno14"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMMENO61", `-1` = "na, asked",
  .applies_to_vars = c("mmeno62"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes, one removed", `3` = "yes, both removed",
  .applies_to_vars = c("mmeno63"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMMENO63",
  .applies_to_vars = c("mmeno64"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mmeno65", "mmeno66"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes, during menopause", `3` = "yes, after menopause", `4` = "yes, during and after menopause",
  .applies_to_vars = c("mmeno82"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMMENO82",
  .applies_to_vars = c("mmeno84"),
  .applies_to_waves = c("MB")
)

.lasa_fc_181 <- .lasa_finalize_fc("181")

