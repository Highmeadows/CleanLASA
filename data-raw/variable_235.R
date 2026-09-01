## LASA filecode 235 -- variable names, variable labels, value labels,
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
  nochrom = "numeric",
  nochrot = "numeric",
  xnochrom = "numeric",
  xnochrot = "numeric"
)

# define variable labels ----
variable_labels(
  nochrom = "Number of chronic diseases from 7 major diseases",
  nochrot = "Number of chronic diseases including others",
  xnochrom = "Longitudinal number of chronic diseases from 7 major diseases",
  xnochrot = "Longitudinal number of chronic diseases including others",
  .applies_to_waves = c("Z")
)

variable_labels(
  nochrom = "# chronic diseases from 7 Majors",
  nochrot = "# chronic diseases incl Others",
  xnochrom = "(longitudinal) # chronic diseases from 7 Majors",
  xnochrot = "(longitudinal) # chronic diseases incl Others",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  nochrom = "Number chronic diseases from 7 majors",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  nochrot = "Number chronic diseases incl. others",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("nochrom"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("nochrot"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("xnochrom", "xnochrot"),
  .applies_to_waves = c("Z", "B", "C")
)

.lasa_fc_235 <- .lasa_finalize_fc("235")
.lasa_fc_235$variables <- .lasa_fc_235$variables |>
  .override_label(wave = "B", variable = "xnochrom", override_value = "xnochrom") |>
  .override_label(wave = "B", variable = "xnochrot", override_value = "xnochrot") |>
  .override_label(wave = "C", variable = "xnochrom", override_value = "xnochrom") |>
  .override_label(wave = "C", variable = "xnochrot", override_value = "xnochrot")

