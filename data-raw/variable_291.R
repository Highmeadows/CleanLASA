## LASA filecode 291 -- variable names, variable labels, value labels,
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
  ptsdint = "numeric",
  rmptsd = "categorical"
)

# define variable labels ----
variable_labels(
  ptsdint = "PTSD total scale score",
  rmptsd = "Reason for missing PTSD score",
  .applies_to_waves = c("Z")
)

variable_labels(
  ptsdint = "PTSD SCALE TOTAL SCORE INTEGER",
  rmptsd = "reason missing ptsd score",
  .applies_to_waves = c("D", "E")
)

# define value labels ----
value_labels(
  `-2` = "no valid data", `22` = NA_character_, `39` = "cut off", `52` = "cut off", `69` = NA_character_, `75` = NA_character_,
  .applies_to_vars = c("ptsdint"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings",
  .applies_to_vars = c("rmptsd"),
  .applies_to_waves = c("Z", "D", "E")
)

value_labels(
  `-2` = "no valid data", `22` = NA_character_, `52` = "cut off", `75` = NA_character_,
  .applies_to_vars = c("ptsdint"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "no valid data", `22` = NA_character_, `39` = "cut off", `69` = NA_character_,
  .applies_to_vars = c("ptsdint"),
  .applies_to_waves = c("E")
)

.lasa_fc_291 <- .lasa_finalize_fc("291")

