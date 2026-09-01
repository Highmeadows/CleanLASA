## LASA filecode 169 -- variable names, variable labels, value labels,
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
  mdexp1 = "categorical",
  mdexp2 = "categorical",
  mdexp3 = "categorical",
  mdexp4 = "categorical",
  mdexp5 = "categorical",
  mdexp61 = "categorical",
  mdexp62 = "categorical",
  mdexp63 = "categorical",
  mdexp64 = "categorical",
  mdexp65 = "categorical",
  mdexp66 = "categorical",
  mdexp67 = "categorical",
  mdexp68 = "categorical",
  mdexp69 = "categorical"
)

# define variable labels ----
variable_labels(
  mdexp1 = "daily experiences: treated with less respect",
  mdexp2 = "daily experiences: lower service level in restaurants/shops",
  mdexp3 = "daily experiences: people assuming I am not smart",
  mdexp4 = "daily experiences: being harassed",
  mdexp5 = "daily experiences: less good treatment from doctors or in hospitals",
  mdexp61 = "perceived reason for experience: your gender",
  mdexp62 = "perceived reason for experience: your ethnicity",
  mdexp63 = "perceived reason for experience: your age",
  mdexp64 = "perceived reason for experience: your weight",
  mdexp65 = "perceived reason for experience: a physical disability",
  mdexp66 = "perceived reason for experience: an aspect of your physical appearance",
  mdexp67 = "perceived reason for experience: your sexual orientation",
  mdexp68 = "perceived reason for experience: your financial situation",
  mdexp69 = "perceived reason for experience: other",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mdexp1", "mdexp2", "mdexp3", "mdexp4", "mdexp5",
  .applies_to_waves = c("J")
)

variable_labels(
  mdexp61 = "perceived reason experience: your gender",
  mdexp62 = "perceived reason experience: your ethnicity",
  mdexp63 = "perceived reason experience: your age",
  mdexp64 = "perceived reason experience: your weight",
  mdexp65 = "perceived reason experience: a physical disability",
  mdexp66 = "perceived reason experience: an aspect of your physical appearance",
  mdexp67 = "perceived reason experience: your sexual orientation",
  mdexp68 = "perceived reason experience: your financial situation",
  mdexp69 = "perceived reason experience: other",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mdexp1", "mdexp2", "mdexp3", "mdexp4", "mdexp5", "mdexp61", "mdexp62", "mdexp63", "mdexp64", "mdexp65", "mdexp66", "mdexp67", "mdexp68", "mdexp69"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-2` = "na, never experienced",
  .applies_to_vars = c("mdexp61", "mdexp62", "mdexp63", "mdexp64", "mdexp65", "mdexp66", "mdexp67", "mdexp68", "mdexp69"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `1` = "almost daily", `2` = "at least once a week", `3` = "few times a month", `4` = "few times a year", `5` = "less than once a year", `6` = "never",
  .applies_to_vars = c("mdexp1", "mdexp2", "mdexp3", "mdexp4", "mdexp5"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mdexp61", "mdexp62", "mdexp63", "mdexp64", "mdexp65", "mdexp66", "mdexp67", "mdexp68", "mdexp69"),
  .applies_to_waves = c("Z", "J")
)

.lasa_fc_169 <- .lasa_finalize_fc("169")

