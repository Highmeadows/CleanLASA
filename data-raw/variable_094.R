## LASA filecode 094 -- variable names, variable labels, value labels,
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
  dltd = "numeric",
  eltd = "numeric",
  happy = "numeric",
  lifeli = "numeric",
  lijnen = "categorical",
  pflt = "categorical",
  resint = "categorical",
  subjage = "numeric"
)

# define variable labels ----
variable_labels(
  dltd = "Desired life time duration",
  eltd = "Expected life time duration",
  happy = "Happiness line: standardised",
  lifeli = "Life line: standardised",
  lijnen = "Did R draw a cross on the lines/ zijn er kruisjes op de lijn gezet",
  pflt = "Preferences for future life time",
  resint = "type of interview",
  subjage = "Subjective age",
  .applies_to_waves = c("Z")
)

variable_labels(
  "happy", "lijnen", "resint",
  .applies_to_waves = c("D")
)

variable_labels(
  "lifeli",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "dltd", "eltd", "pflt", "subjage",
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("dltd", "eltd", "subjage"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not asked", `-1` = "na, asked", `0` = NA_character_, `1` = NA_character_,
  .applies_to_vars = c("happy"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "interview terminated", `-3` = "short interview", `-2` = "not available, routing", `-1` = "na, asked", `0` = NA_character_, `1` = NA_character_,
  .applies_to_vars = c("lifeli"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "none/op geen van beide", `2` = "only on the happiness line/alleen op de gelukslijn", `3` = "only on the life line/alleen op de levenslijn", `4` = "on both lines/op allebei de lijnen",
  .applies_to_vars = c("lijnen"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "as old as possible, irrespective health problems", `2` = "shorter life, if without major health problems",
  .applies_to_vars = c("pflt"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no data", `1` = "face to face: complete", `2` = "face to face: short", `3` = "face to face: terminated", `4` = "face to face: sh/term", `5` = "telephone: respondent", `6` = "telephone: respondent",
  .applies_to_vars = c("resint"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "not asked", `-1` = "asked, no score", `0` = NA_character_, `1` = NA_character_,
  .applies_to_vars = c("happy", "lifeli"),
  .applies_to_waves = c("D")
)

value_labels(
  `-4` = "interview terminated", `-3` = "short interview", `-2` = "na, refused", `0` = NA_character_, `1` = NA_character_,
  .applies_to_vars = c("lifeli"),
  .applies_to_waves = c("E", "F")
)

value_labels(
  `-2` = "na, see G/H/I/J/KLIFELI",
  .applies_to_vars = c("dltd", "eltd", "pflt", "subjage"),
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("dltd", "eltd", "subjage"),
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

value_labels(
  `-4` = "interview terminated", `-3` = "short interview", `-2` = "na, refused", `-1` = "na, asked", `0` = NA_character_, `1` = NA_character_,
  .applies_to_vars = c("lifeli"),
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "as old as possible, irrespective health problems", `2` = "shorter life, if without major health problems",
  .applies_to_vars = c("pflt"),
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

.lasa_fc_094 <- .lasa_finalize_fc("094")
.lasa_fc_094$variables <- .lasa_fc_094$variables |>
  .override_label(wave = "D", variable = "lijnen", override_value = "lijnen")

