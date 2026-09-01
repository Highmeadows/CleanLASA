## LASA filecode 188 -- variable names, variable labels, value labels,
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
  mpain1 = "categorical",
  mpain10 = "categorical",
  mpain11 = "categorical",
  mpain12 = "categorical",
  mpain13 = "categorical",
  mpain14 = "categorical",
  mpain15 = "categorical",
  mpain16 = "categorical",
  mpain17 = "categorical",
  mpain18 = "categorical",
  mpain19 = "categorical",
  mpain2 = "categorical",
  mpain3 = "categorical",
  mpain4 = "categorical",
  mpain5 = "categorical",
  mpain6 = "categorical",
  mpain7 = "categorical",
  mpain8 = "categorical",
  mpain9 = "categorical"
)

# define variable labels ----
variable_labels(
  mpain1 = "Pain: past 3 month",
  mpain10 = "Pain: fixed on place and intensity",
  mpain11 = "Pain: suppress feelings of anger",
  mpain12 = "Pain: exercise or go to physiotherapy",
  mpain13 = "Pain: ignore the pain",
  mpain14 = "Pain: stay active",
  mpain15 = "Pain: banish troubling thoughts",
  mpain16 = "Pain: read",
  mpain17 = "Pain: do leisure activities",
  mpain18 = "Pain: try to divert attention",
  mpain19 = "Pain: drawing",
  mpain2 = "Pain: think pain wears me out",
  mpain3 = "Pain: tell others how bad",
  mpain4 = "Pain: pray for relief",
  mpain5 = "Pain: restrict social activities",
  mpain6 = "Pain: need help for daily duties",
  mpain7 = "Pain: think nothing helps for relief",
  mpain8 = "Pain: take medicine for relief",
  mpain9 = "Pain: call doctor or nurse",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mpain1", "mpain10", "mpain11", "mpain12", "mpain13", "mpain14", "mpain15", "mpain16", "mpain17", "mpain18", "mpain19", "mpain2", "mpain3", "mpain4", "mpain5", "mpain6", "mpain7", "mpain8", "mpain9",
  .applies_to_waves = c("E")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mpain1", "mpain10", "mpain11", "mpain12", "mpain13", "mpain14", "mpain15", "mpain16", "mpain17", "mpain18", "mpain19", "mpain2", "mpain3", "mpain4", "mpain5", "mpain6", "mpain7", "mpain8", "mpain9"),
  .applies_to_waves = c("Z", "E")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("mpain1"),
  .applies_to_waves = c("Z", "E")
)

value_labels(
  `1` = "never", `2` = "seldom", `3` = "sometimes", `4` = "often", `5` = "very often",
  .applies_to_vars = c("mpain10", "mpain11", "mpain12", "mpain13", "mpain14", "mpain15", "mpain16", "mpain17", "mpain18", "mpain2", "mpain3", "mpain4", "mpain5", "mpain6", "mpain7", "mpain8", "mpain9"),
  .applies_to_waves = c("Z", "E")
)

value_labels(
  `-2` = "no valid data", `1` = "not applicable", `2` = "drawing filled in", `3` = "drawing partial filled in", `4` = "filling in failed", `5` = "interviewer filled in drawing",
  .applies_to_vars = c("mpain19"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see EMPAIN1", `1` = "not applicable", `2` = "drawing filled in", `3` = "drawing partial filled in", `4` = "filling in failed", `5` = "interviewer filled in drawing",
  .applies_to_vars = c("mpain19"),
  .applies_to_waves = c("E")
)

.lasa_fc_188 <- .lasa_finalize_fc("188")

