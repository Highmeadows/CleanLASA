## LASA filecode 194 -- variable names, variable labels, value labels,
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
  mhearpv = "numeric",
  mheartd = "categorical",
  mheartdoth = "text",
  mhearup = "categorical",
  mhearwa = "categorical",
  mhearwh = "categorical",
  msrtnbnote = "numeric",
  msrtnsnote = "numeric"
)

# define variable labels ----
variable_labels(
  mhearpv = "hearing: position volume control",
  mheartd = "hearing: test done",
  mheartdoth = "if gmheartd = 5 (other), info by interviewer from booklet",
  mhearup = "hearing: understanding talk at party",
  mhearwa = "hearing: wearing aids",
  mhearwh = "hearing: wearing aid hours a day",
  msrtnbnote = "hearing: noted score broadband srt test (second test)",
  msrtnsnote = "hearing: noted score smallband srt test (first test)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mhearpv",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  "mheartd", "mhearup", "mhearwa",
  .applies_to_waves = c("E", "F", "G")
)

variable_labels(
  "mheartdoth", "mhearwh", "msrtnbnote", "msrtnsnote",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mhearpv"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "test failed", `2` = "with very much difficulty", `3` = "with a little difficulty", `4` = "easily", `5` = "other: [to be coded]", `6` = "technical failure", `7` = "unknown error",
  .applies_to_vars = c("mheartd"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "almost never", `2` = "sometimes", `3` = "often", `4` = "almost always",
  .applies_to_vars = c("mhearup"),
  .applies_to_waves = c("Z", "E", "F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "none", `2` = "1 hearing aid", `3` = "2 hearing aids",
  .applies_to_vars = c("mhearwa"),
  .applies_to_waves = c("Z", "E", "F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "I do not have hearing aids", `2` = "I do not wear my hearing aids", `3` = "<1h", `4` = "1-4 h", `5` = "4-8 h", `6` = "whole day",
  .applies_to_vars = c("mhearwh"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("msrtnbnote", "msrtnsnote"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "test failed", `2` = "with very much difficulty", `3` = "with a little difficulty", `4` = "easily", `5` = "other: [to be coded]",
  .applies_to_vars = c("mheartd"),
  .applies_to_waves = c("E", "F")
)

.lasa_fc_194 <- .lasa_finalize_fc("194")

