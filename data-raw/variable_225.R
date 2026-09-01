## LASA filecode 225 -- variable names, variable labels, value labels,
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
  cesdint = "numeric",
  rmcesd = "categorical"
)

# define variable labels ----
variable_labels(
  cesdint = "CES-D total score",
  rmcesd = "Reason for missing CES-D score",
  .applies_to_waves = c("Z")
)

variable_labels(
  cesdint = "B CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("B")
)

variable_labels(
  rmcesd = "reason missing ces-d score",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  cesdint = "C CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("C")
)

variable_labels(
  cesdint = "D CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("D")
)

variable_labels(
  cesdint = "E CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("E")
)

variable_labels(
  cesdint = "2B CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("2B")
)

variable_labels(
  cesdint = "F CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("F")
)

variable_labels(
  cesdint = "G CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("G")
)

variable_labels(
  cesdint = "H CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("H")
)

variable_labels(
  cesdint = "3B CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("3B")
)

variable_labels(
  cesdint = "MB CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("MB")
)

variable_labels(
  cesdint = "I CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("I")
)

variable_labels(
  cesdint = "J CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("J")
)

variable_labels(
  cesdint = "K CES-D SCALE TOTAL SCORE INTEGER",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("cesdint"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "valid score",
  .applies_to_vars = c("rmcesd"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `0` = NA_character_, `16` = "cut off", `60` = NA_character_,
  .applies_to_vars = c("cesdint"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test / no valid data",
  .applies_to_vars = c("rmcesd"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BRMCESD", `0` = NA_character_, `16` = "cut off", `60` = NA_character_,
  .applies_to_vars = c("cesdint"),
  .applies_to_waves = c("B")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test",
  .applies_to_vars = c("rmcesd"),
  .applies_to_waves = c("B")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "too many missings",
  .applies_to_vars = c("rmcesd"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `2` = "interview terminated", `3` = "too many missings",
  .applies_to_vars = c("rmcesd"),
  .applies_to_waves = c("2B")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "no valid data",
  .applies_to_vars = c("rmcesd"),
  .applies_to_waves = c("MB")
)

.lasa_fc_225 <- .lasa_finalize_fc("225")

