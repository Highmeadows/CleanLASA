## LASA filecode 850 -- variable names, variable labels, value labels,
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
  mapro = "categorical",
  mbsstat = "categorical",
  mdna = "categorical",
  medta = "categorical",
  mlab = "categorical",
  mserum = "categorical"
)

# define variable labels ----
variable_labels(
  mapro = "aprotinine sample available",
  mbsstat = "status of blood sampling",
  mdna = "DNA sample available",
  medta = "edta sample available",
  mlab = "laboratory/place of blood sampling or analyses",
  mserum = "serum sample available",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mdna",
  .applies_to_waves = c("C", "2B", "G", "3B")
)

variable_labels(
  "mbsstat",
  .applies_to_waves = c("2B", "G", "3B")
)

variable_labels(
  "mapro", "medta", "mserum",
  .applies_to_waves = c("3B")
)

variable_labels(
  mlab = "laboratorium analyses",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  mlab = "(place of) laboratorium analyses",
  .applies_to_waves = c("2B", "G")
)

variable_labels(
  mlab = "place of blood sampling",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-2` = "no blood sample", `-1` = "no aprotonine sample", `1` = "aprotonine sample available",
  .applies_to_vars = c("mapro"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-2` = "no medical interview", `1` = "sampling on location", `2` = "sampling at home R", `3` = "refusal", `4` = "procedural mistake / soft refusal / no contact", `5` = "out of area / no sampling at home", `6` = "deceased",
  .applies_to_vars = c("mbsstat"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no blood sample", `-1` = "no DNA sample", `1` = "DNA sample available",
  .applies_to_vars = c("mdna"),
  .applies_to_waves = c("Z", "C", "2B", "G", "3B")
)

value_labels(
  `-2` = "no blood sample", `-1` = "no EDTA sample", `1` = "EDTA sample available",
  .applies_to_vars = c("medta"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-3` = "no blood sample", `-2` = "Oss regio, no blood sample / no measurement possible / no blood sample", `-1` = "no basic determinations: blood sample available / no blood measurement done / no measurement", `1` = "Amsterdam lab: PCA Valeriuskliniek / Amsterdam lab / Amsterdam", `2` = "Zwolle lab: de Weezenlanden / Zwolle lab / Zwolle", `3` = "Oss lab / Oss",
  .applies_to_vars = c("mlab"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no blood sample", `-1` = "no serum sample", `1` = "serum sample available",
  .applies_to_vars = c("mserum"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-2` = "Oss regio, no blood sample", `-1` = "no basic determinations: blood sample available", `1` = "Amsterdam lab: PCA Valeriuskliniek", `2` = "Zwolle lab: de Weezenlanden",
  .applies_to_vars = c("mlab"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no blood sample", `-2` = "no measurement possible", `-1` = "no blood measurement done", `1` = "Amsterdam lab", `2` = "Zwolle lab", `3` = "Oss lab",
  .applies_to_vars = c("mlab"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "no medical interview", `1` = "sampling on location", `2` = "sampling at home R", `3` = "refusal", `4` = "procedural mistake",
  .applies_to_vars = c("mbsstat"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "no blood sample", `-1` = "no measurement", `1` = "Amsterdam", `2` = "Zwolle", `3` = "Oss",
  .applies_to_vars = c("mlab"),
  .applies_to_waves = c("2B", "G")
)

value_labels(
  `-2` = "no medical interview", `1` = "sampling on location", `2` = "sampling at home R", `3` = "refusal", `4` = "soft refusal / no contact", `5` = "out of area / no sampling at home", `6` = "deceased",
  .applies_to_vars = c("mbsstat"),
  .applies_to_waves = c("G", "3B")
)

value_labels(
  `-2` = "no blood sample", `1` = "Amsterdam", `2` = "Zwolle", `3` = "Oss",
  .applies_to_vars = c("mlab"),
  .applies_to_waves = c("3B")
)

.lasa_fc_850 <- .lasa_finalize_fc("850")

