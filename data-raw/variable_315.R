## LASA filecode 315 -- variable names, variable labels, value labels,
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
  qpain = "numeric"
)

# define variable labels ----
variable_labels(
  qpain = "Evaluation of pain at present",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qpain",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("qpain"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `5` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("qpain"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

.lasa_fc_315 <- .lasa_finalize_fc("315")
.lasa_fc_315$variables <- .lasa_fc_315$variables |>
  .override_label(wave = "MB", variable = "qpain", override_value = "bmpain")

