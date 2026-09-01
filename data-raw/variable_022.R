## LASA filecode 022 -- variable names, variable labels, value labels,
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
  mraabmis = "numeric",
  mrava1 = "categorical",
  mrava10 = "categorical",
  mrava11 = "categorical",
  mrava12 = "categorical",
  mrava2 = "categorical",
  mrava3 = "categorical",
  mrava4 = "categorical",
  mrava5 = "categorical",
  mrava6 = "categorical",
  mrava7 = "categorical",
  mrava8 = "categorical",
  mrava9 = "categorical",
  mravamis = "numeric",
  mravb1 = "categorical",
  mravb10 = "categorical",
  mravb11 = "categorical",
  mravb12 = "categorical",
  mravb2 = "categorical",
  mravb3 = "categorical",
  mravb4 = "categorical",
  mravb5 = "categorical",
  mravb6 = "categorical",
  mravb7 = "categorical",
  mravb8 = "categorical",
  mravb9 = "categorical",
  mravbmis = "numeric",
  raabmis = "numeric",
  rava1 = "categorical",
  rava10 = "categorical",
  rava11 = "categorical",
  rava12 = "categorical",
  rava2 = "categorical",
  rava3 = "categorical",
  rava4 = "categorical",
  rava5 = "categorical",
  rava6 = "categorical",
  rava7 = "categorical",
  rava8 = "categorical",
  rava9 = "categorical",
  ravamis = "numeric",
  ravb1 = "categorical",
  ravb10 = "categorical",
  ravb11 = "categorical",
  ravb12 = "categorical",
  ravb2 = "categorical",
  ravb3 = "categorical",
  ravb4 = "categorical",
  ravb5 = "categorical",
  ravb6 = "categorical",
  ravb7 = "categorical",
  ravb8 = "categorical",
  ravb9 = "categorical",
  ravbmis = "numeric"
)

# define variable labels ----
variable_labels(
  mraabmis = "Medical interview: # of missing answers total test",
  mrava1 = "Medical interview C. Raven Section A: item 1",
  mrava10 = "Medical interview C. Raven Section A: item 10",
  mrava11 = "Medical interview C. Raven Section A: item 11",
  mrava12 = "Medical interview C. Raven Section A: item 12",
  mrava2 = "Medical interview C. Raven Section A: item 2",
  mrava3 = "Medical interview C. Raven Section A: item 3",
  mrava4 = "Medical interview C. Raven Section A: item 4",
  mrava5 = "Medical interview C. Raven Section A: item 5",
  mrava6 = "Medical interview C. Raven Section A: item 6",
  mrava7 = "Medical interview C. Raven Section A: item 7",
  mrava8 = "Medical interview C. Raven Section A: item 8",
  mrava9 = "Medical interview C. Raven Section A: item 9",
  mravamis = "Medical interview: # of missing answers first Raven test (A)",
  mravb1 = "Medical interview C. Raven Section B: item 1",
  mravb10 = "Medical interview C. Raven Section B: item 10",
  mravb11 = "Medical interview C. Raven Section B: item 11",
  mravb12 = "Medical interview C. Raven Section B: item 12",
  mravb2 = "Medical interview C. Raven Section B: item 2",
  mravb3 = "Medical interview C. Raven Section B: item 3",
  mravb4 = "Medical interview C. Raven Section B: item 4",
  mravb5 = "Medical interview C. Raven Section B: item 5",
  mravb6 = "Medical interview C. Raven Section B: item 6",
  mravb7 = "Medical interview C. Raven Section B: item 7",
  mravb8 = "Medical interview C. Raven Section B: item 8",
  mravb9 = "Medical interview C. Raven Section B: item 9",
  mravbmis = "Medical interview: # of missing answers second Raven test (B)",
  raabmis = "Main interview: # of missing answers total test",
  rava1 = "Main interview C. Raven Section A: item 1",
  rava10 = "Main interview C. Raven Section A: item 10",
  rava11 = "Main interview C. Raven Section A: item 11",
  rava12 = "Main interview C. Raven Section A: item 12",
  rava2 = "Main interview C. Raven Section A: item 2",
  rava3 = "Main interview C. Raven Section A: item 3",
  rava4 = "Main interview C. Raven Section A: item 4",
  rava5 = "Main interview C. Raven Section A: item 5",
  rava6 = "Main interview C. Raven Section A: item 6",
  rava7 = "Main interview C. Raven Section A: item 7",
  rava8 = "Main interview C. Raven Section A: item 8",
  rava9 = "Main interview C. Raven Section A: item 9",
  ravamis = "Main interview: # of missing answers first Raven test (A)",
  ravb1 = "Main interview C. Raven Section B: item 1",
  ravb10 = "Main interview C. Raven Section B: item 10",
  ravb11 = "Main interview C. Raven Section B: item 11",
  ravb12 = "Main interview C. Raven Section B: item 12",
  ravb2 = "Main interview C. Raven Section B: item 2",
  ravb3 = "Main interview C. Raven Section B: item 3",
  ravb4 = "Main interview C. Raven Section B: item 4",
  ravb5 = "Main interview C. Raven Section B: item 5",
  ravb6 = "Main interview C. Raven Section B: item 6",
  ravb7 = "Main interview C. Raven Section B: item 7",
  ravb8 = "Main interview C. Raven Section B: item 8",
  ravb9 = "Main interview C. Raven Section B: item 9",
  ravbmis = "Main interview: # of missing answers second Raven test (B)",
  .applies_to_waves = c("Z")
)

variable_labels(
  raabmis = "#N of missing answers total test",
  ravamis = "#N of missing answers first (A) Raven test",
  ravbmis = "#N of missing answers second (B) Raven test",
  .applies_to_waves = c("B")
)

variable_labels(
  rava1 = "C. Raven Section A: item 1",
  rava10 = "C. Raven Section A: item 10",
  rava11 = "C. Raven Section A: item 11",
  rava12 = "C. Raven Section A: item 12",
  rava2 = "C. Raven Section A: item 2",
  rava3 = "C. Raven Section A: item 3",
  rava4 = "C. Raven Section A: item 4",
  rava5 = "C. Raven Section A: item 5",
  rava6 = "C. Raven Section A: item 6",
  rava7 = "C. Raven Section A: item 7",
  rava8 = "C. Raven Section A: item 8",
  rava9 = "C. Raven Section A: item 9",
  ravb1 = "C. Raven Section B: item 1",
  ravb10 = "C. Raven Section B: item 10",
  ravb11 = "C. Raven Section B: item 11",
  ravb12 = "C. Raven Section B: item 12",
  ravb2 = "C. Raven Section A: item 2",
  ravb3 = "C. Raven Section B: item 3",
  ravb4 = "C. Raven Section B: item 4",
  ravb5 = "C. Raven Section B: item 5",
  ravb6 = "C. Raven Section B: item 6",
  ravb7 = "C. Raven Section B: item 7",
  ravb8 = "C. Raven Section B: item 8",
  ravb9 = "C. Raven Section B: item 9",
  .applies_to_waves = c("B", "C", "D")
)

variable_labels(
  raabmis = "# of missing answers total test",
  ravamis = "# of missing answers first Raven test (A)",
  ravbmis = "# of missing answers second Raven test (B)",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  mraabmis = "# of missing answers total test",
  mrava1 = "C. Raven Section A: item 1",
  mrava10 = "C. Raven Section A: item 10",
  mrava11 = "C. Raven Section A: item 11",
  mrava12 = "C. Raven Section A: item 12",
  mrava2 = "C. Raven Section A: item 2",
  mrava3 = "C. Raven Section A: item 3",
  mrava4 = "C. Raven Section A: item 4",
  mrava5 = "C. Raven Section A: item 5",
  mrava6 = "C. Raven Section A: item 6",
  mrava7 = "C. Raven Section A: item 7",
  mrava8 = "C. Raven Section A: item 8",
  mrava9 = "C. Raven Section A: item 9",
  mravamis = "# of missing answers first Raven test (A)",
  mravb1 = "C. Raven Section B: item 1",
  mravb10 = "C. Raven Section B: item 10",
  mravb11 = "C. Raven Section B: item 11",
  mravb12 = "C. Raven Section B: item 12",
  mravb2 = "C. Raven Section A: item 2",
  mravb3 = "C. Raven Section B: item 3",
  mravb4 = "C. Raven Section B: item 4",
  mravb5 = "C. Raven Section B: item 5",
  mravb6 = "C. Raven Section B: item 6",
  mravb7 = "C. Raven Section B: item 7",
  mravb8 = "C. Raven Section B: item 8",
  mravb9 = "C. Raven Section B: item 9",
  mravbmis = "# of missing answers second Raven test (B)",
  .applies_to_waves = c("E", "2B", "F", "G")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("mraabmis", "mrava1", "mrava10", "mrava11", "mrava12", "mrava2", "mrava3", "mrava4", "mrava5", "mrava6", "mrava7", "mrava8", "mrava9", "mravamis", "mravb1", "mravb10", "mravb11", "mravb12", "mravb2", "mravb3", "mravb4", "mravb5", "mravb6", "mravb7", "mravb8", "mravb9", "mravbmis", "raabmis", "rava1", "rava10", "rava11", "rava12", "rava2", "rava3", "rava4", "rava5", "rava6", "rava7", "rava8", "rava9", "ravamis", "ravb1", "ravb10", "ravb11", "ravb12", "ravb2", "ravb3", "ravb4", "ravb5", "ravb6", "ravb7", "ravb8", "ravb9", "ravbmis"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, no valid data", `-5` = "not available, interview terminated", `-4` = "na, short interview",
  .applies_to_vars = c("raabmis", "rava1", "rava10", "rava11", "rava12", "rava2", "rava3", "rava4", "rava5", "rava6", "rava7", "rava8", "rava9", "ravamis", "ravb1", "ravb10", "ravb11", "ravb12", "ravb2", "ravb3", "ravb4", "ravb5", "ravb6", "ravb7", "ravb8", "ravb9", "ravbmis"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `4` = "correct",
  .applies_to_vars = c("mrava1", "mrava11", "mravb11", "mravb9"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G")
)

value_labels(
  `-1` = "na, asked", `3` = "correct",
  .applies_to_vars = c("mrava10", "mrava6", "mravb10", "mravb6"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G")
)

value_labels(
  `-1` = "na, asked", `5` = "correct",
  .applies_to_vars = c("mrava12", "mrava2", "mravb12", "mravb7"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "correct",
  .applies_to_vars = c("mrava3", "mravb3", "mravb5"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G")
)

value_labels(
  `-1` = "na, asked", `2` = "correct",
  .applies_to_vars = c("mrava4", "mrava8", "mravb1", "mravb4"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G")
)

value_labels(
  `-1` = "na, asked", `6` = "correct",
  .applies_to_vars = c("mrava5", "mrava7", "mravb2", "mravb8"),
  .applies_to_waves = c("Z", "E", "2B", "F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "correct",
  .applies_to_vars = c("mrava9"),
  .applies_to_waves = c("Z", "E", "F", "G")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("raabmis", "ravamis", "ravbmis"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "na, asked", `4` = "correct",
  .applies_to_vars = c("rava1", "rava11", "ravb11", "ravb9"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-1` = "na, asked", `3` = "correct",
  .applies_to_vars = c("rava10", "rava6", "ravb10", "ravb6"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-1` = "na, asked", `5` = "correct",
  .applies_to_vars = c("rava12", "rava2", "ravb12", "ravb7"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-1` = "na, asked", `1` = "correct",
  .applies_to_vars = c("rava3", "rava9", "ravb3", "ravb5"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-1` = "na, asked", `2` = "correct",
  .applies_to_vars = c("rava4", "rava8", "ravb1", "ravb4"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-1` = "na, asked", `6` = "correct",
  .applies_to_vars = c("rava5", "rava7", "ravb2", "ravb8"),
  .applies_to_waves = c("Z", "B", "C", "D")
)

value_labels(
  `-6` = "no valid data", `-5` = "interview broken off", `-4` = "no answer, short version", `-2` = "na, see BRMCRAV in LASAB222",
  .applies_to_vars = c("raabmis", "rava1", "rava10", "rava11", "rava12", "rava2", "rava3", "rava4", "rava5", "rava6", "rava7", "rava8", "rava9", "ravamis", "ravb1", "ravb10", "ravb11", "ravb12", "ravb2", "ravb3", "ravb4", "ravb5", "ravb6", "ravb7", "ravb8", "ravb9", "ravbmis"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see C/DRMCRAV in LASAC/D/E222",
  .applies_to_vars = c("raabmis", "rava1", "rava10", "rava11", "rava12", "rava2", "rava3", "rava4", "rava5", "rava6", "rava7", "rava8", "rava9", "ravamis", "ravb1", "ravb10", "ravb11", "ravb12", "ravb2", "ravb3", "ravb4", "ravb5", "ravb6", "ravb7", "ravb8", "ravb9", "ravbmis"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-2` = "na, see E/F/GMRMCRAV in LASAF/G222",
  .applies_to_vars = c("mraabmis", "mrava1", "mrava10", "mrava11", "mrava12", "mrava2", "mrava3", "mrava4", "mrava5", "mrava6", "mrava7", "mrava8", "mrava9", "mravamis", "mravb1", "mravb10", "mravb11", "mravb12", "mravb2", "mravb3", "mravb4", "mravb5", "mravb6", "mravb7", "mravb8", "mravb9", "mravbmis"),
  .applies_to_waves = c("E", "F", "G")
)

value_labels(
  `-2` = "na, see BRMCRAV in LAS2B222",
  .applies_to_vars = c("mrava1", "mrava10", "mrava11", "mrava12", "mrava2", "mrava3", "mrava4", "mrava5", "mrava6", "mrava7", "mrava8", "mravb1", "mravb10", "mravb11", "mravb12", "mravb2", "mravb3", "mravb4", "mravb5", "mravb6", "mravb7", "mravb8", "mravb9"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see C/DRMCRAV in LAS2B222", `-1` = "na, asked", `1` = "correct",
  .applies_to_vars = c("mrava9"),
  .applies_to_waves = c("2B")
)

.lasa_fc_022 <- .lasa_finalize_fc("022")
.lasa_fc_022$variables <- .lasa_fc_022$variables |>
  .override_label(wave = "E", variable = "mraabmis", override_value = "emrabmis") |>
  .override_label(wave = "F", variable = "mraabmis", override_value = "fmrabmis") |>
  .override_label(wave = "G", variable = "mraabmis", override_value = "gmrabmis")

