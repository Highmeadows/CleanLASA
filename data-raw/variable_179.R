## LASA filecode 179 -- variable names, variable labels, value labels,
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
  mad01 = "categorical",
  mad02 = "categorical",
  mad03 = "categorical",
  mad04 = "categorical",
  mad05 = "categorical",
  mad06 = "categorical",
  mad07 = "categorical",
  mad08 = "categorical",
  mad09 = "categorical",
  mad10 = "categorical"
)

# define variable labels ----
variable_labels(
  mad01 = "AD 01: easily distracted",
  mad02 = "AD 02: impulsive decisions",
  mad03 = "AD 03: difficult to stop activities",
  mad04 = "AD 04: starting without instructions",
  mad05 = "AD 05: does not keep promises",
  mad06 = "AD 06: difficult to do things in order",
  mad07 = "AD 07: speeding to much / difficult to relax",
  mad08 = "AD 08: difficult to focus attention",
  mad09 = "AD 09: difficult to organise activities",
  mad10 = "AD 10: symptoms starting before 16",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mad01", "mad02", "mad03", "mad04", "mad05", "mad06", "mad07", "mad08", "mad09", "mad10",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mad01", "mad02", "mad03", "mad04", "mad05", "mad06", "mad07", "mad08", "mad09", "mad10"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("mad01", "mad02", "mad03", "mad04", "mad05", "mad06", "mad07", "mad08", "mad09"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-2` = "no symptoms mentioned", `0` = "no", `1` = "yes",
  .applies_to_vars = c("mad10"),
  .applies_to_waves = c("Z", "G")
)

.lasa_fc_179 <- .lasa_finalize_fc("179")

