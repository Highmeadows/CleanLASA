## LASA filecode 021 -- variable names, variable labels, value labels,
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
  immse01 = "categorical",
  immse02 = "categorical",
  immse03 = "categorical",
  immse04 = "categorical",
  immse05 = "categorical",
  immse06 = "categorical",
  immse07 = "categorical",
  immse08 = "categorical",
  immse09 = "categorical",
  immse10 = "categorical",
  immse11 = "numeric",
  immse13 = "numeric",
  immse14 = "numeric",
  immse15 = "categorical",
  immse16 = "categorical",
  immse17 = "categorical",
  immse18 = "categorical",
  immse19 = "categorical",
  immse20 = "categorical",
  immse21 = "categorical",
  immse22 = "categorical",
  immse23 = "categorical",
  memory1 = "categorical",
  memory2 = "categorical",
  mmse01 = "categorical",
  mmse02 = "categorical",
  mmse03 = "categorical",
  mmse04 = "categorical",
  mmse05 = "categorical",
  mmse06 = "categorical",
  mmse07 = "categorical",
  mmse08 = "categorical",
  mmse09 = "categorical",
  mmse10 = "categorical",
  mmse11 = "numeric",
  mmse12 = "numeric",
  mmse13 = "numeric",
  mmse14 = "numeric",
  mmse15 = "categorical",
  mmse16 = "categorical",
  mmse17 = "categorical",
  mmse18 = "categorical",
  mmse19 = "categorical",
  mmse20 = "categorical",
  mmse21 = "categorical",
  mmse22 = "categorical",
  mmse23 = "categorical",
  mmsevrs = "categorical"
)

# define variable labels ----
variable_labels(
  immse01 = "Illiterate MMSE: Part of the day",
  immse02 = "Illiterate MMSE: Season",
  immse03 = "Illiterate MMSE: Part of the month",
  immse04 = "Illiterate MMSE: Day of the week",
  immse05 = "Illiterate MMSE: Month",
  immse06 = "Illiterate MMSE: Country",
  immse07 = "Illiterate MMSE: City/Village",
  immse08 = "Illiterate MMSE: District/neighbourhood",
  immse09 = "Illiterate MMSE: Floor",
  immse10 = "Illiterate MMSE: Address",
  immse11 = "Illiterate MMSE: Three objects",
  immse13 = "Illiterate MMSE: Days of the week in reverse order",
  immse14 = "Illiterate MMSE: Remembering three objects",
  immse15 = "Illiterate MMSE: Watch",
  immse16 = "Illiterate MMSE: Pencil",
  immse17 = "Illiterate MMSE: Remember sentence",
  immse18 = "Illiterate MMSE: Close eyes",
  immse19 = "Illiterate MMSE: Paper (1): Right hand",
  immse20 = "Illiterate MMSE: Paper (2): Folds",
  immse21 = "Illiterate MMSE: Paper (3): In lap",
  immse22 = "Illiterate MMSE: Formulate question",
  immse23 = "Illiterate MMSE: Drawing",
  memory1 = "Problems with memory",
  memory2 = "Consulted doctor for memory problems",
  mmse01 = "MMSE item01: Year",
  mmse02 = "MMSE item02: Season",
  mmse03 = "MMSE item03: Date/day of month",
  mmse04 = "MMSE item04: Day of the week",
  mmse05 = "MMSE item05: Month",
  mmse06 = "MMSE item06: Province/country",
  mmse07 = "MMSE item07: Municipality/city/village",
  mmse08 = "MMSE item08: Local-area orientation",
  mmse09 = "MMSE item09: Floor",
  mmse10 = "MMSE item10: Address",
  mmse11 = "MMSE item11: Three objects",
  mmse12 = "MMSE item12: Serial subtraction task",
  mmse13 = "MMSE item13: Reverse-order verbal task",
  mmse14 = "MMSE item14: Remembering three objects",
  mmse15 = "MMSE item15: Watch",
  mmse16 = "MMSE item16: Pencil",
  mmse17 = "MMSE item17: Remember sentence",
  mmse18 = "MMSE item18: close eyes",
  mmse19 = "MMSE item19: paper (1): Right hand",
  mmse20 = "MMSE item20: paper (2): Folds",
  mmse21 = "MMSE item21: paper (3): In lap",
  mmse22 = "MMSE item22: Write sentence",
  mmse23 = "MMSE item23: Drawing",
  mmsevrs = "MMSE version",
  .applies_to_waves = c("Z")
)

variable_labels(
  "memory1", "memory2",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "mmse01", "mmse02", "mmse04", "mmse05", "mmse09", "mmse10", "mmse11", "mmse14", "mmse15", "mmse16", "mmse17", "mmse18", "mmse19", "mmse20", "mmse21", "mmse22", "mmse23",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "immse01", "immse02", "immse03", "immse04", "immse05", "immse06", "immse07", "immse08", "immse09", "immse10", "immse11", "immse13", "immse14", "immse15", "immse16", "immse17", "immse18", "immse19", "immse20", "immse21", "immse22", "immse23", "mmsevrs",
  .applies_to_waves = c("MB")
)

variable_labels(
  mmse03 = "MMSE item03: Date",
  mmse06 = "MMSE item06: Province",
  mmse07 = "MMSE item07: Municipality",
  mmse08 = "MMSE item08: Two main streets",
  mmse12 = "MMSE item12: subtraction of 7",
  mmse13 = "MMSE item13: Spelling backwards",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  mmse01 = "MMSE: Year",
  mmse02 = "MMSE: Season",
  mmse03 = "MMSE: Day of the month",
  mmse04 = "MMSE: Day of the week",
  mmse05 = "MMSE: Month",
  mmse06 = "MMSE: Country",
  mmse07 = "MMSE: City/Village",
  mmse08 = "MMSE: District/neighbourhood",
  mmse09 = "MMSE: Floor",
  mmse10 = "MMSE: Address",
  mmse11 = "MMSE: Three objects",
  mmse12 = "MMSE: Subtraction of 3",
  mmse13 = "MMSE: Days in reverse order/spelling backwards",
  mmse14 = "MMSE: Remembering three objects",
  mmse15 = "MMSE: Watch",
  mmse16 = "MMSE: Pencil",
  mmse17 = "MMSE: Remember sentence",
  mmse18 = "MMSE: Close eyes",
  mmse19 = "MMSE: Paper (1): Right hand",
  mmse20 = "MMSE: Paper (2): Folds",
  mmse21 = "MMSE: Paper (3): In lap",
  mmse22 = "MMSE: Write sentence",
  mmse23 = "MMSE: Drawing",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("immse01", "immse02", "immse03", "immse04", "immse05", "immse06", "immse07", "immse08", "immse09", "immse10", "immse11", "immse13", "immse14", "immse15", "immse16", "immse17", "immse18", "immse19", "immse20", "immse21", "immse22", "immse23", "memory1", "memory2", "mmse01", "mmse02", "mmse03", "mmse04", "mmse05", "mmse06", "mmse07", "mmse08", "mmse09", "mmse10", "mmse11", "mmse12", "mmse13", "mmse14", "mmse15", "mmse16", "mmse17", "mmse18", "mmse19", "mmse20", "mmse21", "mmse22", "mmse23"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip",
  .applies_to_vars = c("memory2"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "wrong", `2` = "correct",
  .applies_to_vars = c("immse01", "immse02", "immse03", "immse04", "immse05", "immse06", "immse07", "immse08", "immse09", "immse10", "immse15", "immse16", "immse17", "immse18", "immse19", "immse20", "immse21", "immse22", "immse23"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right",
  .applies_to_vars = c("immse11", "immse14"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right", `4` = "4 right", `5` = "5 right",
  .applies_to_vars = c("immse13"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("memory1"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("memory2"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "wrong", `2` = "correct",
  .applies_to_vars = c("mmse01", "mmse02", "mmse03", "mmse04", "mmse05", "mmse06", "mmse07", "mmse08", "mmse09", "mmse10", "mmse15", "mmse16", "mmse17", "mmse18", "mmse19", "mmse20", "mmse21", "mmse22", "mmse23"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right",
  .applies_to_vars = c("mmse11", "mmse14"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "0 right", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "3 right", `4` = "4 right", `5` = "5 right",
  .applies_to_vars = c("mmse12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right", `4` = "4 right", `5` = "5 right",
  .applies_to_vars = c("mmse13"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "MMSE version", `1` = "regular version MMSE", `2` = "regular version MMSE",
  .applies_to_vars = c("mmsevrs"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-2` = "na, see B/CMEMORY1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("memory2"),
  .applies_to_waves = c("B", "C")
)

value_labels(
  `-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right", `4` = "4 right", `5` = "5 right",
  .applies_to_vars = c("mmse12"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
  .applies_to_vars = c("memory2"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
  .applies_to_vars = c("memory1", "mmse01", "mmse02", "mmse03", "mmse04", "mmse05", "mmse06", "mmse07", "mmse08", "mmse09", "mmse10", "mmse11", "mmse12", "mmse13", "mmse14", "mmse15", "mmse16", "mmse17", "mmse18", "mmse19", "mmse20", "mmse21", "mmse22", "mmse23"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BMMSEVRS",
  .applies_to_vars = c("immse01", "immse02", "immse03", "immse04", "immse05", "immse06", "immse07", "immse08", "immse09", "immse10", "immse11", "immse13", "immse14", "immse15", "immse16", "immse17", "immse18", "immse19", "immse20", "immse21", "immse22", "immse23", "mmse01", "mmse02", "mmse03", "mmse04", "mmse05", "mmse06", "mmse07", "mmse08", "mmse09", "mmse10", "mmse11", "mmse12", "mmse13", "mmse14", "mmse15", "mmse16", "mmse17", "mmse18", "mmse19", "mmse20", "mmse21", "mmse22", "mmse23"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMMSESC in LASMB221", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("memory1"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMEMORY1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("memory2"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-1` = "na, asked", `1` = "wrong", `2` = "correct",
  .applies_to_vars = c("mmse12"),
  .applies_to_waves = c("MB")
)

.lasa_fc_021 <- .lasa_finalize_fc("021")

