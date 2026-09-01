## LASA filecode 185 -- variable names, variable labels, value labels,
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
  mankle1 = "numeric",
  mankle2 = "numeric",
  mfeetinsp = "categorical",
  mfeetinsp1 = "categorical",
  mfeetinsp2 = "categorical",
  mfeetinsp3 = "categorical",
  mfeetinsp4 = "categorical",
  mfeetinsp5 = "categorical",
  mfeetinsp6 = "categorical",
  mfeetinsp7 = "categorical",
  mfeetinsp8 = "categorical",
  mfeetinspo = "categorical",
  mfeetpllts = "categorical",
  mfeetsmf = "categorical",
  mknee1 = "categorical",
  mknee2 = "categorical",
  mpulse1 = "categorical",
  mpulse2 = "categorical"
)

# define variable labels ----
variable_labels(
  mankle1 = "Ankle (1): width in mm",
  mankle2 = "Ankle (2): width in mm",
  mfeetinsp = "Inspection feet: whole",
  mfeetinsp1 = "Inspection feet: sores",
  mfeetinsp2 = "Inspection feet: plaster",
  mfeetinsp3 = "Inspection feet: corns",
  mfeetinsp4 = "Inspection feet: skewed toes",
  mfeetinsp5 = "Inspection feet: amputation toes",
  mfeetinsp6 = "Inspection feet: amputation part of foot",
  mfeetinsp7 = "Inspection feet: amputation feet",
  mfeetinsp8 = "Inspection feet: other",
  mfeetinspo = "Inspection feet: other specification",
  mfeetpllts = "Inspection feet: pull up toes",
  mfeetsmf = "Inspection feet: smack feet",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mankle1", "mankle2",
  .applies_to_waves = c("C")
)

variable_labels(
  "mfeetinsp", "mfeetinsp1", "mfeetinsp2", "mfeetinsp3", "mfeetinsp4", "mfeetinsp5", "mfeetinsp6", "mfeetinsp7", "mfeetinsp8", "mfeetinspo", "mfeetsmf",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  "mfeetpllts",
  .applies_to_waves = c("C", "D", "E", "F")
)

variable_labels(
  mknee1 = NA_character_,
  mknee2 = NA_character_,
  mpulse1 = NA_character_,
  mpulse2 = NA_character_,
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-2` = "na, see C/DMFEETINSP",
  .applies_to_vars = c("mfeetinsp1", "mfeetinsp2", "mfeetinsp3", "mfeetinsp4", "mfeetinsp5", "mfeetinsp6", "mfeetinsp7", "mfeetinsp8"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-5` = "na, interview terminated",
  .applies_to_vars = c("mankle1"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mankle2"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-5` = "interview terminated", `-1` = "no valid data", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mfeetinsp"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "no valid data / na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfeetinsp1", "mfeetinsp2", "mfeetinsp3", "mfeetinsp4", "mfeetinsp5", "mfeetinsp6", "mfeetinsp7", "mfeetinsp8"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMFEETINSP8", `-1` = "no valid data / na, asked", `0` = "to be coded",
  .applies_to_vars = c("mfeetinspo"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-5` = "interview terminated", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mfeetpllts"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "interview terminated", `-1` = "no valid data / na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mfeetsmf"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `1` = "Knee",
  .applies_to_vars = c("mknee1"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `2` = "Knee",
  .applies_to_vars = c("mknee2"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `1` = "Pulse",
  .applies_to_vars = c("mpulse1"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `2` = "Pulse",
  .applies_to_vars = c("mpulse2"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-5` = "interview terminated", `-1` = "no valid data / na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mfeetpllts"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "no valid data", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mfeetinsp"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "no valid data / na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mfeetpllts", "mfeetsmf"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mfeetpllts"),
  .applies_to_waves = c("E", "F")
)

.lasa_fc_185 <- .lasa_finalize_fc("185")

