## LASA filecode 182 -- variable names, variable labels, value labels,
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
  mbackp = "categorical",
  mbackpd = "categorical",
  mconfbed = "categorical",
  mconfbeda25 = "categorical",
  mconfbedb25 = "categorical",
  mconfbedpy = "categorical",
  mthyrover = "categorical"
)

# define variable labels ----
variable_labels(
  mbackp = "Back pain since last interview",
  mbackpd = "Back pain duration",
  mconfbed = "Confined to bed",
  mconfbeda25 = "Confined to bed: after age 25",
  mconfbedb25 = "Confined to bed: before age 25",
  mconfbedpy = "Confined to bed: past year",
  mthyrover = "Thyroid gland: overactive",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mbackp", "mbackpd",
  .applies_to_waves = c("C", "D", "E")
)

variable_labels(
  "mconfbeda25", "mconfbedb25", "mconfbedpy",
  .applies_to_waves = c("C")
)

variable_labels(
  "mthyrover",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  mconfbed = "Confined to bed yes/no",
  .applies_to_waves = c("C")
)

variable_labels(
  mconfbed = "Confined to bed since last interview",
  .applies_to_waves = c("D", "F", "G", "H")
)

variable_labels(
  mconfbed = "Confined to bed in last 3 years for 6 weeks or more",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbackp"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-2` = "na, see EMBACKP", `-1` = "na, asked", `1` = "less than one week", `2` = "> week < one month", `3` = "> one month",
  .applies_to_vars = c("mbackpd"),
  .applies_to_waves = c("Z", "E")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "do not know",
  .applies_to_vars = c("mconfbed"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "na, see CMCONFBED", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mconfbeda25", "mconfbedb25", "mconfbedpy"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-5` = "na, interview terminated", `1` = "no", `2` = "yes", `3` = "do not know",
  .applies_to_vars = c("mthyrover"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-2` = "na, see C/DMBACKP", `1` = "less than one week", `2` = "> week < one month", `3` = "> one month",
  .applies_to_vars = c("mbackpd"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes, not the past year", `3` = "yes, the past year",
  .applies_to_vars = c("mconfbed"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbackp"),
  .applies_to_waves = c("E")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes, not the past year", `3` = "yes, the past year",
  .applies_to_vars = c("mconfbed"),
  .applies_to_waves = c("F", "G", "H", "3B")
)

.lasa_fc_182 <- .lasa_finalize_fc("182")

