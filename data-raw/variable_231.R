## LASA filecode 231 -- variable names, variable labels, value labels,
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
  senseh = "categorical",
  senseha = "categorical",
  sensev = "categorical",
  sensevg = "categorical"
)

# define variable labels ----
variable_labels(
  senseh = "hearing without a hearing aid",
  senseha = "hearing with a hearing aid",
  sensev = "vision without glasses",
  sensevg = "vision with glasses",
  .applies_to_waves = c("Z")
)

variable_labels(
  "senseh", "senseha", "sensev", "sensevg",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("sensev"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `0` = "without or with some difficulty", `1` = "> 1 item with some difficulty",
  .applies_to_vars = c("sensev"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

.lasa_fc_231 <- .lasa_finalize_fc("231")
.lasa_fc_231$variables <- .lasa_fc_231$variables |>
  .override_label(wave = "F", variable = "senseh", override_value = "fmsensh") |>
  .override_label(wave = "F", variable = "senseha", override_value = "fmsensha") |>
  .override_label(wave = "F", variable = "sensev", override_value = "fmsensv") |>
  .override_label(wave = "F", variable = "sensevg", override_value = "fmsensvg") |>
  .override_label(wave = "G", variable = "senseh", override_value = "gmsensh") |>
  .override_label(wave = "G", variable = "senseha", override_value = "gmsensha") |>
  .override_label(wave = "G", variable = "sensev", override_value = "gmsensv") |>
  .override_label(wave = "G", variable = "sensevg", override_value = "gmsensvg") |>
  .override_label(wave = "H", variable = "senseh", override_value = "hmsensh") |>
  .override_label(wave = "H", variable = "senseha", override_value = "hmsensha") |>
  .override_label(wave = "H", variable = "sensev", override_value = "hmsensv") |>
  .override_label(wave = "H", variable = "sensevg", override_value = "hmsensvg") |>
  .override_label(wave = "I", variable = "senseh", override_value = "imsensh") |>
  .override_label(wave = "I", variable = "senseha", override_value = "imsensha") |>
  .override_label(wave = "I", variable = "sensev", override_value = "imsensv") |>
  .override_label(wave = "I", variable = "sensevg", override_value = "imsensvg") |>
  .override_label(wave = "J", variable = "senseh", override_value = "jmsensh") |>
  .override_label(wave = "J", variable = "senseha", override_value = "jmsensha") |>
  .override_label(wave = "J", variable = "sensev", override_value = "jmsensv") |>
  .override_label(wave = "J", variable = "sensevg", override_value = "jmsensvg") |>
  .override_label(wave = "K", variable = "senseh", override_value = "kmsensh") |>
  .override_label(wave = "K", variable = "senseha", override_value = "kmsensha") |>
  .override_label(wave = "K", variable = "sensev", override_value = "kmsensv") |>
  .override_label(wave = "K", variable = "sensevg", override_value = "kmsensvg")

