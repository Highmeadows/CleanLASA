## LASA filecode 071 -- variable names, variable labels, value labels,
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
  eval01 = "categorical",
  eval02 = "categorical",
  eval03 = "categorical",
  eval04 = "categorical"
)

# define variable labels ----
variable_labels(
  eval01 = "Evaluation age norms: daily pursuits",
  eval02 = "Evaluation age norms: financial situation",
  eval03 = "Evaluation age norms: contact with family/friends",
  eval04 = "Evaluation age norms: current affairs",
  .applies_to_waves = c("Z")
)

variable_labels(
  "eval01", "eval02", "eval03", "eval04",
  .applies_to_waves = c("B", "K")
)

# define value labels ----
value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "more or less", `3` = "yes",
  .applies_to_vars = c("eval01", "eval02", "eval03", "eval04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "no answer, short version", `-1` = "no answer, asked", `1` = "no", `2` = "more or less", `3` = "yes",
  .applies_to_vars = c("eval01", "eval02", "eval03", "eval04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `1` = "no", `2` = "more or less", `3` = "yes",
  .applies_to_vars = c("eval01", "eval02", "eval03", "eval04"),
  .applies_to_waves = c("K")
)

.lasa_fc_071 <- .lasa_finalize_fc("071")
.lasa_fc_071$variables <- .lasa_fc_071$variables |>
  .override_label(wave = "K", variable = "eval03", override_value = "kbeval03")

