## LASA filecode 870 -- variable names, variable labels, value labels,
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
  mapo = "categorical",
  mapoe1 = "categorical",
  mapoe2 = "categorical",
  mbluse = "categorical",
  me4 = "categorical"
)

# define variable labels ----
variable_labels(
  mapo = "apoe phenotype",
  mapoe1 = "apoe allele 1",
  mapoe2 = "apoe allele 2",
  mbluse = "usage blood LASA-B-sample",
  me4 = "any e4 allele",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mapo", "mapoe1", "mapoe2",
  .applies_to_waves = c("B", "2B")
)

variable_labels(
  "mbluse", "me4",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-2` = "sample concentration too low", `-1` = "not determined / no valid determination", `22` = "e2/2", `23` = "e2/3", `33` = "e3/3", `42` = "e2/4", `43` = "e3/4", `44` = "e4/4",
  .applies_to_vars = c("mapo"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "sample concentration too low", `-1` = "not determined / no valid determination", `2` = "isoform 2", `3` = "isoform 3", `4` = "isoform 4", `9` = "missing",
  .applies_to_vars = c("mapoe1", "mapoe2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not determined", `0` = "usage blood LASA-B-sample", `1` = "LASA-B-sample blood used",
  .applies_to_vars = c("mbluse"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "not determined", `0` = "no e4 allele", `1` = "any e4 allele",
  .applies_to_vars = c("me4"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "not determined", `22` = "e2/2", `23` = "e2/3", `33` = "e3/3", `42` = "e2/4", `43` = "e3/4", `44` = "e4/4",
  .applies_to_vars = c("mapo"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "not determined", `2` = "isoform 2", `3` = "isoform 3", `4` = "isoform 4", `9` = "missing",
  .applies_to_vars = c("mapoe1", "mapoe2"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "sample concentration too low", `-1` = "no valid determination", `22` = "e2/2", `23` = "e2/3", `33` = "e3/3", `42` = "e2/4", `43` = "e3/4", `44` = "e4/4",
  .applies_to_vars = c("mapo"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "sample concentration too low", `-1` = "no valid determination", `2` = "isoform 2", `3` = "isoform 3", `4` = "isoform 4", `9` = "missing",
  .applies_to_vars = c("mapoe1", "mapoe2"),
  .applies_to_waves = c("2B")
)

.lasa_fc_870 <- .lasa_finalize_fc("870")

