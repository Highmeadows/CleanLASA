## LASA filecode 706 -- variable names, variable labels, value labels,
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
  trcedep = "numeric",
  trces01 = "categorical",
  trces02 = "categorical",
  trces03 = "categorical",
  trces04 = "categorical",
  trces05 = "categorical",
  trces06 = "categorical",
  trces07 = "categorical",
  trces08 = "categorical",
  trces09 = "categorical",
  trces10 = "categorical",
  trces11 = "categorical",
  trces12 = "categorical",
  trces13 = "categorical",
  trces14 = "categorical",
  trces15 = "categorical",
  trces16 = "categorical",
  trces17 = "categorical",
  trces18 = "categorical",
  trces19 = "categorical",
  trces20 = "categorical"
)

# define variable labels ----
variable_labels(
  trcedep = "Telephone interview: depressive affect",
  trces01 = "1. Last week: bothered",
  trces02 = "2. Last week: appetite",
  trces03 = "3. Last week: blues",
  trces04 = "4. Last week: good: positive",
  trces05 = "5. Last week: mind",
  trces06 = "6. Last week: depressed",
  trces07 = "7. Last week: effort",
  trces08 = "8. Last week: hopeful: positive",
  trces09 = "9. Last week: failure",
  trces10 = "10. Last week: fearful",
  trces11 = "11. Last week: sleep",
  trces12 = "12. Last week: happy: positive",
  trces13 = "13. Last week: talk",
  trces14 = "14. Last week: lonely",
  trces15 = "15. Last week: unfriendly",
  trces16 = "16. Last week: enjoy: positive",
  trces17 = "17. Last week: cry",
  trces18 = "18. Last week: sad",
  trces19 = "19. Last week: dislike",
  trces20 = "20. Last week: get going",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trces01", "trces06", "trces10", "trces14",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "trces02", "trces03", "trces04", "trces05", "trces07", "trces08", "trces09", "trces11", "trces12", "trces13", "trces15", "trces16", "trces17", "trces18", "trces19", "trces20",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  trcedep = "Telephone interview: depressive affect low-high",
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-1` = "missing values",
  .applies_to_vars = c("trcedep"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked", `0` = "rarely or never", `1` = "some of the time", `2` = "occasionally", `3` = "mostly or always",
  .applies_to_vars = c("trces01", "trces06", "trces10", "trces14"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "rarely or never", `1` = "some of the time", `2` = "occasionally", `3` = "mostly or always",
  .applies_to_vars = c("trces02", "trces03", "trces04", "trces05", "trces07", "trces08", "trces09", "trces11", "trces12", "trces13", "trces15", "trces16", "trces17", "trces18", "trces19", "trces20"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

.lasa_fc_706 <- .lasa_finalize_fc("706")

