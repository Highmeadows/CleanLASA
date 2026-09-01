## LASA filecode 159 -- variable names, variable labels, value labels,
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
  mdecu01 = "categorical",
  mdecu02 = "categorical",
  mdecu03 = "categorical",
  mdecu04 = "categorical",
  mdecu05 = "categorical",
  mdecu06 = "categorical",
  mdecu07 = "categorical",
  mdecu08 = "numeric"
)

# define variable labels ----
variable_labels(
  mdecu01 = "Decubitus: reported No/Yes",
  mdecu02 = "reported decubitus medical interview",
  mdecu03 = "Decubitus: most severe reported",
  mdecu04 = "Decubitus: stadium observed",
  mdecu05 = "Decubitus: treatment at home by",
  mdecu06 = "Decubitus: treatment at nursing home by",
  mdecu07 = "Decubitus: present past year",
  mdecu08 = "Decubitus: past year how often",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mdecu01", "mdecu02", "mdecu03", "mdecu04", "mdecu05", "mdecu06", "mdecu07", "mdecu08",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mdecu01", "mdecu02", "mdecu03", "mdecu05", "mdecu06", "mdecu07", "mdecu08"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "no valid data",
  .applies_to_vars = c("mdecu01", "mdecu02", "mdecu03", "mdecu04", "mdecu05", "mdecu06", "mdecu07", "mdecu08"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("mdecu01", "mdecu07"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `0` = "not reported", `1` = "heel", `2` = "ankle", `3` = "hip", `4` = "coccyx", `5` = "other place",
  .applies_to_vars = c("mdecu02", "mdecu03"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `0` = "not reported", `1` = "no decubitus", `2` = "phase 1",
  .applies_to_vars = c("mdecu04"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "in nursing home", `0` = "not reported", `1` = "oneself",
  .applies_to_vars = c("mdecu05"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "living at home", `0` = "not reported", `4` = "nurse", `7` = "other: elderly care",
  .applies_to_vars = c("mdecu06"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "not available, routing", `1` = "1 time",
  .applies_to_vars = c("mdecu08"),
  .applies_to_waves = c("Z", "B")
)

.lasa_fc_159 <- .lasa_finalize_fc("159")

