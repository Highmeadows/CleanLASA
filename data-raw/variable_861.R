## LASA filecode 861 -- variable names, variable labels, value labels,
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
  mact = "numeric",
  mcrp = "numeric",
  mhscrp = "numeric",
  mil1b = "numeric",
  mil6 = "numeric",
  mil8 = "numeric",
  mrem861 = "text",
  msaa = "numeric",
  mtnfa = "numeric",
  selg861 = "categorical"
)

# define variable labels ----
variable_labels(
  mact = "B: a1-antichymotrypsin % NMP 02",
  mcrp = "C-Reactive Protein (\302\265g/mL)",
  mhscrp = "C-reactive protein concentration",
  mil1b = "Interleukin-1 beta (pg/mL)",
  mil6 = "interleukin-6 concentration",
  mil8 = "Interleukin-8 (pg/mL)",
  mrem861 = "remarks about determination",
  msaa = "Serum Amyloid A (\302\265g/mL)",
  mtnfa = "Tumor Necrosis Factor - alpha (pg/mL)",
  selg861 = "Selection g861: APO E4 allele present",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mact",
  .applies_to_waves = c("B")
)

variable_labels(
  "mcrp", "mil1b", "mil8", "msaa", "mtnfa", "selg861",
  .applies_to_waves = c("G")
)

variable_labels(
  "mrem861",
  .applies_to_waves = c("3B")
)

variable_labels(
  mhscrp = "B: C-reactive protein ug/mL",
  mil6 = "B: interleukin-6 pg/mL",
  .applies_to_waves = c("B")
)

variable_labels(
  mact = "C: a1-antichymotrypsin % NMP 02",
  mhscrp = "C: C-reactive protein ug/mL",
  mil6 = "C: interleukin-6 pg/mL",
  .applies_to_waves = c("C")
)

variable_labels(
  mil6 = "Interleukin-6 (pg/mL)",
  .applies_to_waves = c("G")
)

variable_labels(
  mhscrp = "serum: C-reactive protein mg/L",
  mil6 = "serum: interleukin-6 pg/mL",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-3` = "incorrect value", `-2` = "value below determination", `-1` = "no valid data / no determination",
  .applies_to_vars = c("mact"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no serum, not determined", `-1` = "no valid data",
  .applies_to_vars = c("mhscrp"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-1` = "too low concentration (< 0,03 pg/mL)",
  .applies_to_vars = c("mil1b"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-3` = "incorrect value", `-2` = "value below determination / no serum, not determined", `-1` = "no valid data / no determination",
  .applies_to_vars = c("mil6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("selg861"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mact", "mil6"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination",
  .applies_to_vars = c("mact", "mil6"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "no serum, not determined", `-1` = "no valid data",
  .applies_to_vars = c("mil6"),
  .applies_to_waves = c("3B")
)

.lasa_fc_861 <- .lasa_finalize_fc("861")
.lasa_fc_861$variables <- .lasa_fc_861$variables |>
  .override_label(wave = "G", variable = "selg861", override_value = "selg861")

