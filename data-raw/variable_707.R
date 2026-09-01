## LASA filecode 707 -- variable names, variable labels, value labels,
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
  tpcogd2 = "categorical",
  trcogd1 = "categorical",
  trcogd3 = "categorical",
  trcogd4 = "categorical",
  trcogd5 = "categorical",
  trcogd6 = "categorical",
  trcogdc = "numeric",
  trmemo1 = "categorical",
  trmemo2 = "categorical",
  trmms10 = "categorical",
  trmms11 = "categorical",
  trmms12 = "categorical",
  trmms13 = "categorical",
  trmms14 = "categorical",
  trmmsc = "numeric",
  trmmsc1 = "numeric",
  trmmsc2 = "numeric",
  trmmse1 = "categorical",
  trmmse4 = "categorical",
  trmmse5 = "categorical",
  trmmse8 = "categorical"
)

# define variable labels ----
variable_labels(
  tpcogd2 = "Cognition: remembering addresses",
  trcogd1 = "Cognition: talks",
  trcogd3 = "Cognition: familiar machines",
  trcogd4 = "Cognition: decisions",
  trcogd5 = "Cognition: handling money",
  trcogd6 = "Cognition: financial affairs",
  trcogdc = "Informant questionnaire of cognitive decline",
  trmemo1 = "Memory1: problems with memory",
  trmemo2 = "Memory2: consulted doctor for memory problems",
  trmms10 = "MMSE item10: address",
  trmms11 = "MMSE item11: three objects",
  trmms12 = "MMSE item12: subtraction of 7",
  trmms13 = "MMSE item13: spelling backwards",
  trmms14 = "MMSE item14: remembering three objects",
  trmmsc = "(partial) MMSE-score based on maximum spelling/subtraction",
  trmmsc1 = "(partial) MMSE-score based on subtraction",
  trmmsc2 = "(partial) MMSE-score based on spelling",
  trmmse1 = "MMSE item01: year",
  trmmse4 = "MMSE item04: day",
  trmmse5 = "MMSE item05: month",
  trmmse8 = "MMSE item08: two main streets",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tpcogd2", "trcogd1", "trcogd3", "trcogd4", "trcogd5", "trcogd6", "trcogdc",
  .applies_to_waves = c("C")
)

variable_labels(
  "trmemo1", "trmemo2", "trmms10", "trmms11", "trmms12", "trmms13", "trmms14", "trmmsc", "trmmsc1", "trmmsc2", "trmmse1", "trmmse4", "trmmse5", "trmmse8",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "no scale (too many missing)",
  .applies_to_vars = c("trmmsc", "trmmsc1", "trmmsc2"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "much better", `2` = "a bit better", `3` = "not changed", `4` = "a bit worse", `5` = "much worse",
  .applies_to_vars = c("tpcogd2", "trcogd1", "trcogd3", "trcogd4", "trcogd5", "trcogd6"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "missing values", `6` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("trcogdc"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo1"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no problems, see TRMEMO1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "wrong", `2` = "correct",
  .applies_to_vars = c("trmms10", "trmmse1", "trmmse4", "trmmse5", "trmmse8"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right",
  .applies_to_vars = c("trmms11", "trmms14"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right", `4` = "4 right", `5` = "5 right",
  .applies_to_vars = c("trmms12", "trmms13"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = NA_character_, `16` = NA_character_,
  .applies_to_vars = c("trmmsc", "trmmsc1", "trmmsc2"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no problems, see DTRMEMO1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo2"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "no problems, see ETRMEMO1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo2"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "no problems, see FTRMEMO1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo2"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "no problems, see GTRMEMO1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo2"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "no problems, see HTRMEMO1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo2"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "no problems, see ITRMEMO1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo2"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "no problems, see JTRMEMO1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo2"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "no problems, see KTRMEMO1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmemo2"),
  .applies_to_waves = c("K")
)

.lasa_fc_707 <- .lasa_finalize_fc("707")

