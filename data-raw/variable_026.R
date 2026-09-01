## LASA filecode 026 -- variable names, variable labels, value labels,
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
  anxiet1 = "categorical",
  anxiet2 = "categorical",
  anxiet3 = "categorical",
  anxiet4 = "categorical",
  anxiet5 = "categorical",
  anxiet6 = "categorical",
  anxiet7 = "categorical",
  anxmv = "numeric",
  manxiet1 = "categorical",
  manxiet2 = "categorical",
  manxiet3 = "categorical",
  manxiet4 = "categorical",
  manxiet5 = "categorical",
  manxiet6 = "categorical",
  manxiet7 = "categorical"
)

# define variable labels ----
variable_labels(
  anxiet1 = "Main interview: 1. Lately: feel tense or wound up",
  anxiet2 = "Main interview: 2. Lately: frightened feeling",
  anxiet3 = "Main interview: 3. Lately: worrying thoughts",
  anxiet4 = "Main interview: 4. Lately: I feel relaxed: positive",
  anxiet5 = "Main interview: 5. Lately: frightened in stomach",
  anxiet6 = "Main interview: 6. Lately: feel restless",
  anxiet7 = "Main interview: 7. Lately: sudden feelings of panic",
  anxmv = "Main interview: number of missing anxiety-item values (max 7)",
  manxiet1 = "Medical interview: 1. Lately: feel tense or wound up",
  manxiet2 = "Medical interview: 2. Lately: frightened feeling",
  manxiet3 = "Medical interview: 3. Lately: worrying thoughts",
  manxiet4 = "Medical interview: 4. Lately: I feel relaxed: positive",
  manxiet5 = "Medical interview: 5. Lately: frightened in stomach",
  manxiet6 = "Medical interview: 6. Lately: feel restless",
  manxiet7 = "Medical interview: 7. Lately: sudden feelings of panic",
  .applies_to_waves = c("Z")
)

variable_labels(
  anxiet1 = "1. Lately: feel tense or wound up",
  anxiet2 = "2. Lately: frightened feeling",
  anxiet3 = "3. Lately: worrying thoughts",
  anxiet4 = "4. Lately: I feel relaxed: positive",
  anxiet5 = "5. Lately: frightened in stomach",
  anxiet6 = "6. Lately: feel restless",
  anxiet7 = "7. Lately: sudden feelings of panic",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  anxmv = "number of missing values (max 7)",
  .applies_to_waves = c("B")
)

variable_labels(
  manxiet1 = "1. Lately: feel tense or wound up",
  manxiet2 = "2. Lately: frightened feeling",
  manxiet3 = "3. Lately: worrying thoughts",
  manxiet4 = "4. Lately: I feel relaxed: positive",
  manxiet5 = "5. Lately: frightened in stomach",
  manxiet6 = "6. Lately: feel restless",
  manxiet7 = "7. Lately: sudden feelings of panic",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7", "manxiet1", "manxiet2", "manxiet3", "manxiet4", "manxiet5", "manxiet6", "manxiet7"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `0` = "rarely or never", `1` = "some of the time", `2` = "occasionally", `3` = "mostly or always",
  .applies_to_vars = c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-6` = "not available, no valid data", `-5` = "not available, interview terminated", `-4` = "na, short interview",
  .applies_to_vars = c("anxmv"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `0` = "rarely or never", `1` = "some of the time", `2` = "occasionally", `3` = "mostly or always",
  .applies_to_vars = c("manxiet1", "manxiet2", "manxiet3", "manxiet4", "manxiet5", "manxiet6", "manxiet7"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
  .applies_to_vars = c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7"),
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-6` = "no valid data", `-5` = "interview broken off", `-4` = "no answer, short version",
  .applies_to_vars = c("anxmv"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see bmrmanx in LASMB226", `-1` = "na, asked", `0` = "rarely or never", `1` = "some of the time", `2` = "occasionally", `3` = "mostly or always",
  .applies_to_vars = c("manxiet1", "manxiet2", "manxiet3", "manxiet4", "manxiet5", "manxiet6", "manxiet7"),
  .applies_to_waves = c("MB")
)

.lasa_fc_026 <- .lasa_finalize_fc("026")

