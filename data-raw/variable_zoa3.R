## LASA filecode zoa3 -- variable names, variable labels, value labels,
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
  oah = "categorical",
  oak = "categorical"
)

# define variable labels ----
variable_labels(
  oah = "Symptomatic hip osteoarthritis",
  oak = "Symptomatic knee osteoarthritis",
  .applies_to_waves = c("Z")
)

variable_labels(
  oah = "symptomatic hip OA at 3B",
  oak = "symptomatic knee OA at 3B",
  .applies_to_waves = c("3B")
)

variable_labels(
  oah = "symptomatic hip OA at I",
  oak = "symptomatic knee OA at I",
  .applies_to_waves = c("I")
)

# define value labels ----
value_labels(
  `-9` = "missing", `0` = "no", `1` = "possible", `2` = "yes", `8` = "dropout", `9` = "dropout at previous waves",
  .applies_to_vars = c("oah", "oak"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-9` = "missing", `0` = "no", `1` = "possible", `2` = "yes",
  .applies_to_vars = c("oah", "oak"),
  .applies_to_waves = c("3B")
)

.lasa_fc_zoa3 <- .lasa_finalize_fc("zoa3")
.lasa_fc_zoa3$variables <- .lasa_fc_zoa3$variables |>
  .override_label(wave = "3B", variable = "oah", override_value = "b3oah") |>
  .override_label(wave = "3B", variable = "oak", override_value = "b3oak")

