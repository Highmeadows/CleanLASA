## LASA filecode 024 -- variable names, variable labels, value labels,
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
  mecog1 = "categorical",
  mecog2 = "categorical",
  mecog3 = "categorical"
)

# define variable labels ----
variable_labels(
  mecog1 = "Evaluation Raven test: relaxation",
  mecog2 = "Present capability raven test",
  mecog3 = "Future capability raven test: better",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mecog1", "mecog2", "mecog3",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-5` = "not available, interview terminated", `-4` = "na, short interview", `-1` = "na, asked", `0` = "no answer", `1` = "very tense", `2` = "tensed", `3` = "not tense, not relaxed", `4` = "relaxed", `5` = "very relaxed",
  .applies_to_vars = c("mecog1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `-4` = "na, short interview", `-1` = "na, asked", `0` = "no answer", `1` = "very bad", `2` = "bad", `3` = "fair", `4` = "good", `5` = "very good",
  .applies_to_vars = c("mecog2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `-4` = "na, short interview", `-1` = "na, asked", `0` = "no answer", `1` = "no, certain", `2` = "no probably", `3` = "maybe yes/no", `4` = "yes, probably", `5` = "yes, certain",
  .applies_to_vars = c("mecog3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "interview broken off", `-4` = "no answer, short version", `-1` = "asked, no answer", `0` = "no answer", `1` = "very tense", `2` = "tensed", `3` = "not tense, not relaxed", `4` = "relaxed", `5` = "very relaxed",
  .applies_to_vars = c("mecog1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "interview broken off", `-4` = "no answer, short version", `-1` = "asked, no answer", `0` = "no answer", `1` = "very bad", `2` = "bad", `3` = "fair", `4` = "good", `5` = "very good",
  .applies_to_vars = c("mecog2"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "interview broken off", `-4` = "no answer, short version", `-1` = "asked, no answer", `0` = "no answer", `1` = "no, certain", `2` = "no probably", `3` = "maybe yes/no", `4` = "yes, probably", `5` = "yes, certain",
  .applies_to_vars = c("mecog3"),
  .applies_to_waves = c("B")
)

.lasa_fc_024 <- .lasa_finalize_fc("024")

