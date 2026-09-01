## LASA filecode 180 -- variable names, variable labels, value labels,
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
  mbathhand = "categorical",
  mbathshand = "categorical",
  mbathslp = "categorical",
  mbedswtch = "categorical",
  mkitcup = "categorical",
  mkitstpl = "categorical",
  mkitstplbr = "categorical",
  mkitucup = "categorical",
  mkituwin = "categorical",
  mkitwin = "categorical",
  mlivcarp = "categorical",
  mlivwksp = "categorical",
  mstairhand = "categorical",
  mstairlmat = "categorical",
  mstairrgh = "categorical",
  mstairslmat = "categorical",
  mstairturn = "categorical",
  mwalkfootb = "categorical",
  mwalklightsw = "categorical",
  mwalkrill = "categorical"
)

# define variable labels ----
variable_labels(
  mbathhand = "Bathroom/toilet: handrail",
  mbathshand = "Bathroom/toilet: shower handrail",
  mbathslp = "Bathroom/toil: antislip",
  mbedswtch = "Bedroom: light switch",
  mkitcup = "Kitchen: cupboard",
  mkitstpl = "Kitchen: stepladder",
  mkitstplbr = "Kitchen: stepladder brace",
  mkitucup = "Kitchen: use of cupboard",
  mkituwin = "Kitchen: use of upper window",
  mkitwin = "Kitchen: upper window",
  mlivcarp = "Living room: loose carpets",
  mlivwksp = "Living room: enough walking space",
  mstairhand = "Stairs: double handrails",
  mstairlmat = "Stairs: loose material",
  mstairrgh = "Stairs: rough",
  mstairslmat = "Stairs: sometimes loose material",
  mstairturn = "Stairs: turned (home)",
  mwalkfootb = "Walking route: footboard",
  mwalklightsw = "Walking route: light switch",
  mwalkrill = "Walkingroute: illumination",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mbathhand", "mbathslp", "mbedswtch", "mkitstpl", "mkitstplbr", "mkitucup", "mkituwin", "mkitwin", "mlivcarp", "mlivwksp", "mstairhand", "mstairlmat", "mstairrgh", "mstairslmat", "mstairturn", "mwalkfootb", "mwalklightsw",
  .applies_to_waves = c("C")
)

variable_labels(
  "mbathshand", "mkitcup",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  "mwalkrill",
  .applies_to_waves = c("D")
)

# define value labels ----
value_labels(
  `-5` = "interview terminated", `-2` = "not asked, routing", `-1` = "no valid answer", `1` = "no", `2` = "yes", `3` = "not applicable",
  .applies_to_vars = c("mbathhand", "mbathslp", "mbedswtch", "mkitstpl", "mkitstplbr", "mkitucup", "mkituwin", "mkitwin", "mlivcarp", "mlivwksp", "mstairhand", "mstairlmat", "mstairrgh", "mstairslmat", "mstairturn", "mwalkfootb", "mwalklightsw"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-5` = "interview terminated", `-2` = "not asked, routing", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "not applicable",
  .applies_to_vars = c("mbathshand", "mkitcup", "mwalkrill"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-5` = "interview terminated", `-2` = "not asked, routing", `-1` = "no valid answer", `1` = "no", `2` = "yes", `3` = "not applicable",
  .applies_to_vars = c("mbathshand", "mkitcup"),
  .applies_to_waves = c("C")
)

.lasa_fc_180 <- .lasa_finalize_fc("180")

