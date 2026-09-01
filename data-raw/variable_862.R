## LASA filecode 862 -- variable names, variable labels, value labels,
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
  mcreat = "numeric",
  mdpd = "numeric",
  mdpdcre = "numeric",
  migf1 = "numeric",
  most = "numeric",
  mpth = "numeric",
  mrem862 = "text",
  mvitd25 = "numeric",
  mvitd25st = "numeric"
)

# define variable labels ----
variable_labels(
  mcreat = "creatinine",
  mdpd = "urine: deoxypyridinoline (DPD)",
  mdpdcre = "urine: deoxypyridinoline/creatinine ratio",
  migf1 = "serum: insuline-like growth factor-1 (IGF-1)",
  most = "serum: osteocalcin (OC)",
  mpth = "serum: parathyroid hormone (PTH)",
  mrem862 = "remarks about determination",
  mvitd25 = "serum: 25-hydroxyvitamin D (25(OH)D), nmol/L",
  mvitd25st = "serum: 25-hydroxyvitamin D (25(OH)D), nmol/L, ODIN-standardized",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mdpd", "mdpdcre", "migf1", "most", "mpth",
  .applies_to_waves = c("C")
)

variable_labels(
  "mvitd25", "mvitd25st",
  .applies_to_waves = c("C", "2B", "G")
)

variable_labels(
  "mrem862",
  .applies_to_waves = c("3B")
)

variable_labels(
  mcreat = "urine: creatinine (mmol/l)",
  .applies_to_waves = c("C")
)

variable_labels(
  mpth = "serum: parathyroid hormone (PTH), pmol/L",
  .applies_to_waves = c("2B", "G")
)

variable_labels(
  mcreat = "serum: creatinine (umol/L)",
  mvitd25 = "serum: 25-hydroxyvitamin D (25(OH)D) (nmol/l)",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-3` = "incorrect value", `-2` = "value below determination / no serum, not determined", `-1` = "no determination / no valid data",
  .applies_to_vars = c("mcreat", "mvitd25"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination",
  .applies_to_vars = c("mdpd", "mdpdcre", "migf1", "most"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination",
  .applies_to_vars = c("mpth"),
  .applies_to_waves = c("Z", "C", "2B", "G")
)

value_labels(
  `-1` = "no determination",
  .applies_to_vars = c("mvitd25st"),
  .applies_to_waves = c("Z", "C", "2B", "G")
)

value_labels(
  `-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination",
  .applies_to_vars = c("mcreat"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination",
  .applies_to_vars = c("mvitd25"),
  .applies_to_waves = c("C", "2B", "G")
)

value_labels(
  `-2` = "no serum, not determined", `-1` = "no valid data",
  .applies_to_vars = c("mcreat", "mvitd25"),
  .applies_to_waves = c("3B")
)

.lasa_fc_862 <- .lasa_finalize_fc("862")

