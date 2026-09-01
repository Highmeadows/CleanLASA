## LASA filecode 221 -- variable names, variable labels, value labels,
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
  mmsesc = "numeric",
  mmsesc2 = "numeric"
)

# define variable labels ----
variable_labels(
  mmsesc = "MMSE score based on maximum spelling/number performance",
  mmsesc2 = "Illiterate MMSE score based on spelling",
  .applies_to_waves = c("Z")
)

variable_labels(
  mmsesc = "MMSE-score based on maximum spel/num",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  mmsesc2 = "Illiterate MMSE-score based on spelling",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-5` = "no valid data", `-4` = "na, no valid data", `-3` = "interview terminated", `-2` = "no scale (too many missing)", `1` = NA_character_, `2` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("mmsesc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "no valid data", `-4` = "na, no valid data", `-3` = "interview terminated", `-2` = "no scale (too many missing)", `1` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("mmsesc2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no scale (too many missing)", `2` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("mmsesc"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no scale (too many missing)", `1` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("mmsesc"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "interview terminated", `-2` = "no scale (too many missing)", `1` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("mmsesc"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-5` = "na, see BMMSEVRS", `-4` = "na, no valid data", `-3` = "interview terminated", `-2` = "no scale (too many missing)", `1` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("mmsesc", "mmsesc2"),
  .applies_to_waves = c("MB")
)

.lasa_fc_221 <- .lasa_finalize_fc("221")
.lasa_fc_221$variables <- .lasa_fc_221$variables |>
  .override_label(wave = "MB", variable = "mmsesc", override_value = "bmmsesc1")

