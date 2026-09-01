## LASA filecode 868 -- variable names, variable labels, value labels,
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
  mab1_40 = "numeric",
  mab1_42 = "numeric",
  mgfap = "numeric",
  mnflight = "numeric",
  mp_tau181 = "numeric",
  msap = "numeric",
  selg868 = "categorical"
)

# define variable labels ----
variable_labels(
  mab1_40 = "Amyloid-Beta 1 \342\200\223 40 (pg/mL)",
  mab1_42 = "Amyloid-Beta 1 \342\200\223 42 (pg/mL)",
  mgfap = "Glial Fibrillary Acidic Protein (pg/mL)",
  mnflight = "Neurofilament Light (pg/mL)",
  mp_tau181 = "Phosphorylated - Tau181 (pg/mL)",
  msap = "serum amyloid P component",
  selg868 = "Selection g868: APO E4 allele present",
  .applies_to_waves = c("Z")
)

variable_labels(
  "msap",
  .applies_to_waves = c("C")
)

variable_labels(
  "mab1_40", "mab1_42", "mgfap", "mnflight", "mp_tau181", "selg868",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("selg868"),
  .applies_to_waves = c("Z", "G")
)

.lasa_fc_868 <- .lasa_finalize_fc("868")
.lasa_fc_868$variables <- .lasa_fc_868$variables |>
  .override_label(wave = "G", variable = "selg868", override_value = "selg868")

