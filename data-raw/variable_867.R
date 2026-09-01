## LASA filecode 867 -- variable names, variable labels, value labels,
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
  mchol2 = "numeric",
  mfructo = "numeric",
  mhdl2 = "numeric",
  mldl2 = "numeric",
  mtrigl2 = "numeric"
)

# define variable labels ----
variable_labels(
  mchol2 = "Blood: total cholesterol mmol/L",
  mfructo = "Blood: fructosamin umol/L",
  mhdl2 = "Blood: hdl-cholesterol mmol/L",
  mldl2 = "Blood: ldl-cholesterol mmol/l",
  mtrigl2 = "Blood: triglycerids mmol/L",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mchol2", "mfructo", "mhdl2", "mldl2", "mtrigl2",
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mchol2", "mfructo", "mhdl2", "mldl2", "mtrigl2"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "no data, see MLAB(-2) in LASAC850",
  .applies_to_vars = c("mchol2", "mfructo", "mhdl2", "mldl2", "mtrigl2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no data, see CMLAB(-2) in LASAC850",
  .applies_to_vars = c("mchol2", "mfructo", "mhdl2", "mldl2", "mtrigl2"),
  .applies_to_waves = c("C")
)

.lasa_fc_867 <- .lasa_finalize_fc("867")

