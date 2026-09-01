## LASA filecode 324 -- variable names, variable labels, value labels,
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
  qachcha = "numeric",
  qachiev = "numeric",
  qanxadd = "numeric",
  qanxiet = "numeric",
  qlocus = "numeric",
  qlocusa = "numeric",
  qstrat1 = "numeric",
  qstrat2 = "numeric",
  qstratt = "numeric"
)

# define variable labels ----
variable_labels(
  qachcha = "Metamemory achievement/change score",
  qachiev = "Metamemory achievement score",
  qanxadd = "Metamemory anxiety score (extra items)",
  qanxiet = "Metamemory anxiety score",
  qlocus = "Metamemory locus of control score",
  qlocusa = "Metamemory locus of control score (extra items)",
  qstrat1 = "Metamemory strategy 1 score",
  qstrat2 = "Metamemory strategy 2 score",
  qstratt = "Metamemory strategy total score",
  .applies_to_waves = c("Z")
)

variable_labels(
  qachcha = "Achievement/change metamemory concept low-high",
  qanxiet = "Anxiety in metamemory concept low-high",
  qlocus = "Locus of control in metamemory concept low-high",
  qstrat1 = "Strategy 1 in metamemory concept low-high",
  qstrat2 = "Strategy 2 in metamemory concept low-high",
  qstratt = "Strategy total in metamemory concept low-high",
  .applies_to_waves = c("B", "C", "D")
)

variable_labels(
  qachiev = "Achievement metamemory concept low-high",
  qanxadd = "Anxiety with extra items low-high",
  qlocusa = "Locus of control with extra items low-high",
  .applies_to_waves = c("C", "D")
)

# define value labels ----
value_labels(
  `-1` = "no valid data", `4` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("qachcha", "qstrat1"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-1` = "no valid data", `8` = NA_character_, `40` = NA_character_,
  .applies_to_vars = c("qachiev"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-1` = "no valid data", `12` = NA_character_, `60` = NA_character_,
  .applies_to_vars = c("qanxadd"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-1` = "no valid data", `9` = NA_character_, `45` = NA_character_,
  .applies_to_vars = c("qanxiet"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-1` = "no valid data", `5` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("qlocus"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-1` = "no valid data", `7` = NA_character_, `35` = NA_character_,
  .applies_to_vars = c("qlocusa"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-1` = "no valid data", `6` = NA_character_, `30` = NA_character_,
  .applies_to_vars = c("qstrat2"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-1` = "no valid data", `10` = NA_character_, `50` = NA_character_,
  .applies_to_vars = c("qstratt"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

.lasa_fc_324 <- .lasa_finalize_fc("324")
.lasa_fc_324$variables <- .lasa_fc_324$variables |>
  .override_label(wave = "C", variable = "qstrat1", override_value = "cstrat1") |>
  .override_label(wave = "D", variable = "qstrat1", override_value = "dstrat1")

