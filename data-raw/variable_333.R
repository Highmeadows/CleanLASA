## LASA filecode 333 -- variable names, variable labels, value labels,
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
  qqulims = "numeric",
  qqulips = "numeric",
  qqulisf = "numeric"
)

# define variable labels ----
variable_labels(
  qqulims = "Mental health (SF-12)",
  qqulips = "Physical health (SF-12)",
  qqulisf = "Physical and mental health (SF-12)",
  .applies_to_waves = c("Z")
)

variable_labels(
  qqulims = "Mental health (SF-12) Low-High",
  qqulips = "Physical health (SF-12) Low-High",
  qqulisf = "Physical and mental health (SF-12) Low-High",
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("qqulims", "qqulips", "qqulisf"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `6` = NA_character_, `7` = NA_character_, `8` = NA_character_, `27` = NA_character_,
  .applies_to_vars = c("qqulims"),
  .applies_to_waves = c("Z")
)

value_labels(
  `6` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("qqulips"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `12` = NA_character_, `13` = NA_character_, `14` = NA_character_, `47` = NA_character_,
  .applies_to_vars = c("qqulisf"),
  .applies_to_waves = c("Z")
)

value_labels(
  `6` = NA_character_, `27` = NA_character_,
  .applies_to_vars = c("qqulims"),
  .applies_to_waves = c("D", "G")
)

value_labels(
  `12` = NA_character_, `47` = NA_character_,
  .applies_to_vars = c("qqulisf"),
  .applies_to_waves = c("D")
)

value_labels(
  `8` = NA_character_, `27` = NA_character_,
  .applies_to_vars = c("qqulims"),
  .applies_to_waves = c("E", "F")
)

value_labels(
  `14` = NA_character_, `47` = NA_character_,
  .applies_to_vars = c("qqulisf"),
  .applies_to_waves = c("E", "F")
)

value_labels(
  `13` = NA_character_, `47` = NA_character_,
  .applies_to_vars = c("qqulisf"),
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

value_labels(
  `7` = NA_character_, `27` = NA_character_,
  .applies_to_vars = c("qqulims"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

.lasa_fc_333 <- .lasa_finalize_fc("333")

