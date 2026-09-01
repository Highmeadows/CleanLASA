## LASA filecode 032 -- variable names, variable labels, value labels,
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
  prefe01 = "categorical",
  prefe02 = "categorical",
  prefe03 = "categorical",
  prefe04 = "categorical",
  prefe05 = "categorical",
  prefe06 = "categorical",
  prefe07 = "categorical",
  prefe08 = "categorical",
  prefe09 = "categorical",
  prefe10 = "categorical",
  prefe11 = "categorical",
  prefe12 = "categorical"
)

# define variable labels ----
variable_labels(
  prefe01 = "When I need help, I want to organize it",
  prefe02 = "When move because health I want move to",
  prefe03 = "When I need help, I want to organize it",
  prefe04 = "When move because health I want move to",
  prefe05 = "When I need help, I want to organize it",
  prefe06 = "When move because health I want move to",
  prefe07 = "When could choose again I would live at",
  prefe08 = "When could choose again I would live at",
  prefe09 = "When could choose again I would live at",
  prefe10 = "When could choose again I would live at",
  prefe11 = "When could choose again I would live at",
  prefe12 = "When could choose again I would live at",
  .applies_to_waves = c("Z")
)

variable_labels(
  "prefe01", "prefe02", "prefe03", "prefe04", "prefe05", "prefe06", "prefe07", "prefe08", "prefe09", "prefe10", "prefe11", "prefe12",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("prefe01", "prefe02", "prefe03", "prefe04", "prefe05", "prefe06", "prefe07", "prefe08", "prefe09", "prefe10", "prefe11", "prefe12"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("prefe01", "prefe02", "prefe03", "prefe04", "prefe05", "prefe06", "prefe07", "prefe08", "prefe09", "prefe10", "prefe11", "prefe12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, technical reason", `-5` = "not available, interview terminated", `-4` = "na, short interview", `1` = "myself", `2` = "by the family doctor",
  .applies_to_vars = c("prefe01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "family", `2` = "residential home",
  .applies_to_vars = c("prefe02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "by family doctor", `2` = "by children",
  .applies_to_vars = c("prefe03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "residential home", `2` = "old peoples home (with service)",
  .applies_to_vars = c("prefe04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "myself", `2` = "by children",
  .applies_to_vars = c("prefe05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "family", `2` = "old peoples home (with service)",
  .applies_to_vars = c("prefe06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, technical reason", `-5` = "not available, interview terminated", `-4` = "na, short interview", `1` = "home", `2` = "residential home",
  .applies_to_vars = c("prefe07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "home", `2` = "family",
  .applies_to_vars = c("prefe08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "nursing home", `2` = "home",
  .applies_to_vars = c("prefe09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "family", `2` = "nursing home",
  .applies_to_vars = c("prefe10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "residential home", `2` = "nursing home",
  .applies_to_vars = c("prefe11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "residential home", `2` = "family",
  .applies_to_vars = c("prefe12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "na, technical reason", `-5` = "na, interview terminated", `-4` = "na, short interview", `-2` = "na, BHINDEP<>1", `1` = "myself", `2` = "by the family doctor",
  .applies_to_vars = c("prefe01"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE01", `1` = "family", `2` = "residential home",
  .applies_to_vars = c("prefe02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE01", `1` = "by family doctor", `2` = "by children",
  .applies_to_vars = c("prefe03"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE01", `1` = "residential home", `2` = "old peoples home (with service)",
  .applies_to_vars = c("prefe04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE01", `1` = "myself", `2` = "by children",
  .applies_to_vars = c("prefe05"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE01", `1` = "family", `2` = "old peoples home (with service)",
  .applies_to_vars = c("prefe06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "na, technical reason", `-5` = "na, interview terminated", `-4` = "na, short interview", `-2` = "na, BHINDEP<>2,3,4", `1` = "home", `2` = "residential home",
  .applies_to_vars = c("prefe07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE07", `1` = "home", `2` = "family",
  .applies_to_vars = c("prefe08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE07", `1` = "nursing home", `2` = "home",
  .applies_to_vars = c("prefe09"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE07", `1` = "family", `2` = "nursing home",
  .applies_to_vars = c("prefe10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE07", `1` = "residential home", `2` = "nursing home",
  .applies_to_vars = c("prefe11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPREFE07", `1` = "residential home", `2` = "family",
  .applies_to_vars = c("prefe12"),
  .applies_to_waves = c("B")
)

.lasa_fc_032 <- .lasa_finalize_fc("032")

