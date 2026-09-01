## LASA filecode mb008 -- variable names, variable labels, value labels,
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
  age = "numeric",
  days = "numeric",
  mage = "numeric",
  mdays = "numeric",
  t2dat_ = "date",
  t2mdat_ = "date"
)

# define variable labels ----
variable_labels(
  age = "Age at LASA main interview (w1)",
  days = "Age at LASA main interview in days (w1)",
  mage = "Age at LASA medical interview (w1)",
  mdays = "Age at LASA medical interview in days (w1)",
  t2dat_ = "LASA main interview date (w1)",
  t2mdat_ = "LASA medical interview date (w1)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "age", "days", "mage", "mdays", "t2dat_", "t2mdat_",
  .applies_to_waves = c("MB")
)

# define value labels ----
.lasa_fc_mb008 <- .lasa_finalize_fc("mb008")
.lasa_fc_mb008$variables <- .lasa_fc_mb008$variables |>
  .override_label(wave = "MB", variable = "t2dat_", override_value = "t2dat_") |>
  .override_label(wave = "MB", variable = "t2mdat_", override_value = "t2mdat_")

