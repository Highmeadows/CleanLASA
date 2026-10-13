## LASA filecode 029 -- variable names, variable labels, value labels,
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
  metaem1 = "categorical",
  metaem2 = "categorical",
  metaem3 = "categorical",
  metaem4 = "categorical",
  rmmeemo = "categorical"
)

# define variable labels ----
variable_labels(
  metaem1 = "Meta emotion item 01: emotional",
  metaem2 = "Meta emotion item 02: feelings",
  metaem3 = "Meta emotion item 03: satisfied",
  metaem4 = "Meta emotion item 04: change",
  rmmeemo = "Reason missing: Meta emotion",
  .applies_to_waves = c("Z")
)

variable_labels(
  "metaem1", "metaem2", "metaem3", "metaem4", "rmmeemo",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "absolutely not emotional", `2` = "a little emotional", `3` = "fairly emotional", `4` = "very emotional",
  .applies_to_vars = c("metaem1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "very little", `2` = "little", `3` = "much", `4` = "very much",
  .applies_to_vars = c("metaem2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "not satisfied at all", `2` = "a bit satisfied", `3` = "rather satisfied", `4` = "very satisfied",
  .applies_to_vars = c("metaem3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `-1` = "na, asked", `1` = "rarely or never", `2` = "sometimes", `3` = "often", `4` = "very often",
  .applies_to_vars = c("metaem4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not missing", `1` = "short interview", `2` = "interview terminated", `5` = "no valid data",
  .applies_to_vars = c("rmmeemo"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see BRMMEEMO", `-1` = "na, asked", `1` = "absolutely not emotional", `2` = "a little emotional", `3` = "fairly emotional", `4` = "very emotional",
  .applies_to_vars = c("metaem1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRMMEEMO", `-1` = "na, asked", `1` = "very little", `2` = "little", `3` = "much", `4` = "very much",
  .applies_to_vars = c("metaem2"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRMMEEMO", `-1` = "na, asked", `1` = "not satisfied at all", `2` = "a bit satisfied", `3` = "rather satisfied", `4` = "very satisfied",
  .applies_to_vars = c("metaem3"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRMMEEMO", `-1` = "na, asked", `1` = "rarely or never", `2` = "sometimes", `3` = "often", `4` = "very often",
  .applies_to_vars = c("metaem4"),
  .applies_to_waves = c("B")
)

.lasa_fc_029 <- .lasa_finalize_fc("029")

