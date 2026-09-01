## LASA filecode 184 -- variable names, variable labels, value labels,
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
  mdiet = "categorical",
  mdiethcal = "categorical",
  mdietlcal = "categorical",
  mdietlchol = "categorical",
  mdietlsalt = "categorical",
  mdietoth = "categorical",
  mdietsugf = "categorical",
  mdietveg = "categorical",
  mmilka50y = "numeric",
  mmilkb25y = "numeric",
  mmilkb50y = "categorical",
  mmilkhchs = "numeric",
  mmilkmlk = "numeric",
  mmilkschs = "numeric",
  mmilkvar = "numeric",
  mmilkyght = "numeric"
)

# define variable labels ----
variable_labels(
  mdiet = "Diet: yes/no",
  mdiethcal = "Diet: high-calorie",
  mdietlcal = "Diet: low-calorie",
  mdietlchol = "Diet: low-cholesterol",
  mdietlsalt = "Diet: low-salt",
  mdietoth = "Diet: other",
  mdietsugf = "Diet: sugar free",
  mdietveg = "Diet: vegetarian",
  mmilka50y = "Milk consumption: from age 50 on",
  mmilkb25y = "Milk consumption: up to 25 years",
  mmilkb50y = "Milk consumption: between 25 and 50 yr",
  mmilkhchs = "Milk products: number of days hard cheese",
  mmilkmlk = "Milk products: number of days milk",
  mmilkschs = "Milk products: number of days soft cheese",
  mmilkvar = "Milk products: number of days various",
  mmilkyght = "Milk products: number of days yoghurt",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mdiet", "mdietlcal", "mdietlchol", "mdietlsalt", "mdietsugf", "mdietveg",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  "mdiethcal", "mdietoth", "mmilka50y", "mmilkb25y", "mmilkb50y", "mmilkhchs", "mmilkmlk", "mmilkschs", "mmilkvar", "mmilkyght",
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-2` = "na, see C/DMDIET",
  .applies_to_vars = c("mdietlcal", "mdietlchol", "mdietlsalt", "mdietsugf", "mdietveg"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mdiet"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-2` = "na, see CMDIET", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mdiethcal", "mdietoth"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mdietlcal", "mdietlchol", "mdietlsalt", "mdietsugf", "mdietveg"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "no valid data", `1` = "about every meal", `2` = "every day but not every meal", `3` = "every week but not every day", `4` = "< once a week",
  .applies_to_vars = c("mmilka50y", "mmilkb25y", "mmilkb50y"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "no valid data", `0` = "none",
  .applies_to_vars = c("mmilkhchs", "mmilkmlk", "mmilkschs", "mmilkvar", "mmilkyght"),
  .applies_to_waves = c("Z", "C")
)

.lasa_fc_184 <- .lasa_finalize_fc("184")

