## LASA filecode 023 -- variable names, variable labels, value labels,
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
  evmem01 = "categorical",
  evmem02 = "categorical",
  evmem03 = "categorical",
  evmem04 = "categorical",
  evmem05 = "categorical",
  evmem06 = "categorical",
  evmem07 = "categorical",
  evmem08 = "categorical",
  ndays = "categorical"
)

# define variable labels ----
variable_labels(
  evmem01 = "Everyday memory 01: choice pencil",
  evmem02 = "Everyday memory 02: recognition photo",
  evmem03 = "Everyday memory 03: object",
  evmem04 = "Q about diabetes asked?",
  evmem05 = "Q about raising arm asked?",
  evmem06 = "Q about occupation father asked?",
  evmem07 = "Q about emotions asked?",
  evmem08 = "Respondent left/right handed",
  ndays = "Day of interviewing",
  .applies_to_waves = c("Z")
)

variable_labels(
  "evmem01", "evmem02", "evmem03", "evmem04", "evmem05", "evmem06", "evmem07",
  .applies_to_waves = c("B")
)

variable_labels(
  "evmem08",
  .applies_to_waves = c("B", "F")
)

variable_labels(
  ndays = "day of interviewing",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-5` = "not available, various reasons", `-1` = "na, asked", `0` = "wrong", `1` = "right corrected", `2` = "right",
  .applies_to_vars = c("evmem01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, various reasons", `-1` = "na, asked", `0` = "wrong", `1` = "right (partial)", `2` = "right",
  .applies_to_vars = c("evmem02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, various reasons", `-1` = "na, asked", `0` = "wrong", `1` = "partially right", `2` = "right",
  .applies_to_vars = c("evmem03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, various reasons", `-1` = "na, asked", `1` = "not asked", `2` = "asked", `3` = "cannot remember",
  .applies_to_vars = c("evmem04", "evmem05", "evmem06", "evmem07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, various reasons", `-3` = "not available, interview terminated", `-1` = "not available", `1` = "left handed", `2` = "right handed", `3` = "other handedness/writing category",
  .applies_to_vars = c("evmem08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, various reasons", `0` = "one day", `1` = "two days", `2` = "three days",
  .applies_to_vars = c("ndays"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, various reasons", `-1` = "na, asked", `0` = "wrong", `1` = "right corrected", `2` = "right",
  .applies_to_vars = c("evmem01"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, various reasons", `-1` = "na, asked", `0` = "wrong", `1` = "right (partial)", `2` = "right",
  .applies_to_vars = c("evmem02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, various reasons", `-1` = "na, asked", `0` = "wrong", `1` = "partially right", `2` = "right",
  .applies_to_vars = c("evmem03"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, various reasons", `-1` = "na, asked", `1` = "not asked", `2` = "asked", `3` = "cannot remember",
  .applies_to_vars = c("evmem04", "evmem05", "evmem06", "evmem07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, various reasons", `-1` = "na, asked", `1` = "left handed", `2` = "right handed", `3` = "left handed but right hand",
  .applies_to_vars = c("evmem08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, various reasons", `0` = "one day", `1` = "two days", `2` = "three days",
  .applies_to_vars = c("ndays"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, interview terminated", `-1` = "no observation", `1` = "R writes left handed", `2` = "R writes right handed", `3` = "R cannot write / other remark",
  .applies_to_vars = c("evmem08"),
  .applies_to_waves = c("F")
)

.lasa_fc_023 <- .lasa_finalize_fc("023")
.lasa_fc_023$variables <- .lasa_fc_023$variables |>
  .override_label(wave = "B", variable = "ndays", override_value = "ndays")

