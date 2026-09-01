## LASA filecode 323 -- variable names, variable labels, value labels,
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
  qneurot = "numeric",
  qsocina = "numeric"
)

# define variable labels ----
variable_labels(
  qneurot = "Dutch Personality Questionnaire neuroticism score",
  qsocina = "Dutch Personality Questionnaire social inadequacy score",
  .applies_to_waves = c("Z")
)

variable_labels(
  qneurot = "Dutch Personality Questionnaire: Neuroticism",
  qsocina = "Dutch Personality Questionnaire: Social inadequacy",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B")
)

# define value labels ----
value_labels(
  `-1` = "no scale, missing values", `0` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("qneurot"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no scale, missing values", `0` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("qsocina"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no scale, mv",
  .applies_to_vars = c("qneurot", "qsocina"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B")
)

value_labels(
  `0` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("qneurot"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B")
)

value_labels(
  `0` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("qsocina"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B")
)

.lasa_fc_323 <- .lasa_finalize_fc("323")

