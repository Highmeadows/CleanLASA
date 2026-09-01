## LASA filecode 878 -- variable names, variable labels, value labels,
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
  mse_selectin = "numeric",
  msicam_1 = "numeric",
  msvcam_1 = "numeric",
  selg878 = "categorical"
)

# define variable labels ----
variable_labels(
  mse_selectin = "Soluble E-selectin (ng/mL)",
  msicam_1 = "Soluble Intercellular Adhesion molecule-1 (ng/mL)",
  msvcam_1 = "Soluble Vascular Cell Adhesion molecule-1 (ng/mL)",
  selg878 = "Selection g878: APO E4 allele present",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mse_selectin", "msicam_1", "msvcam_1", "selg878",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("selg878"),
  .applies_to_waves = c("Z", "G")
)

.lasa_fc_878 <- .lasa_finalize_fc("878")
.lasa_fc_878$variables <- .lasa_fc_878$variables |>
  .override_label(wave = "G", variable = "selg878", override_value = "selg878")

