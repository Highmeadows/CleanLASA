## LASA filecode 226 -- variable names, variable labels, value labels,
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
  anxint = "numeric",
  rmanx = "categorical"
)

# define variable labels ----
variable_labels(
  anxint = "Anxiety scale total score",
  rmanx = "Reason for missing anxiety scale score",
  .applies_to_waves = c("Z")
)

variable_labels(
  anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
  rmanx = "Reason no anxiety scale score",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J")
)

# define value labels ----
value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("anxint"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J")
)

value_labels(
  `-2` = "valid score",
  .applies_to_vars = c("rmanx"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J")
)

value_labels(
  `0` = NA_character_, `21` = NA_character_,
  .applies_to_vars = c("anxint"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test",
  .applies_to_vars = c("rmanx"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see BRMANX", `0` = NA_character_, `21` = NA_character_,
  .applies_to_vars = c("anxint"),
  .applies_to_waves = c("B")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "too many missings",
  .applies_to_vars = c("rmanx"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J")
)

.lasa_fc_226 <- .lasa_finalize_fc("226")
.lasa_fc_226$variables <- .lasa_fc_226$variables |>
  .override_label(wave = "MB", variable = "anxint", override_value = "bmanxint") |>
  .override_label(wave = "MB", variable = "rmanx", override_value = "bmrmanx")

