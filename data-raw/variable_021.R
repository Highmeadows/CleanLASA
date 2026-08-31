## LASA filecode 021 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  mmsevrs = "MMSE version"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `C` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `D` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `E` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `2B` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `F` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `G` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `H` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `3B` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `MB` = c(
    "immse01",
    "immse02",
    "immse03",
    "immse04",
    "immse05",
    "immse06",
    "immse07",
    "immse08",
    "immse09",
    "immse10",
    "immse11",
    "immse13",
    "immse14",
    "immse15",
    "immse16",
    "immse17",
    "immse18",
    "immse19",
    "immse20",
    "immse21",
    "immse22",
    "immse23",
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23",
    "mmsevrs"
  ),
  `I` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `J` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  ),
  `K` = c(
    "memory1",
    "memory2",
    "mmse01",
    "mmse02",
    "mmse03",
    "mmse04",
    "mmse05",
    "mmse06",
    "mmse07",
    "mmse08",
    "mmse09",
    "mmse10",
    "mmse11",
    "mmse12",
    "mmse13",
    "mmse14",
    "mmse15",
    "mmse16",
    "mmse17",
    "mmse18",
    "mmse19",
    "mmse20",
    "mmse21",
    "mmse22",
    "mmse23"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
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
    mmse23 = "MMSE: Drawing"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "wrong",
  `2` = "correct"
)

standardized_value_labels <- list(
  immse01 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse02 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse03 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse04 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse05 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse06 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse07 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse08 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse09 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse10 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse11 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right"
  ),
  immse13 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
  immse14 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right"
  ),
  immse15 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse16 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse17 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse18 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse19 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse20 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse21 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse22 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  immse23 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  memory1 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  memory2 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mmse01 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse02 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse03 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse04 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse05 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse06 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse07 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse08 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse09 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse10 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse11 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right"
  ),
  mmse12 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "0 right",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
  mmse13 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
  mmse14 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right"
  ),
  mmse15 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse16 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse17 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse18 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse19 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse20 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse21 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse22 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmse23 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  mmsevrs = c(`-2` = "MMSE version", `1` = "regular version MMSE", `2` = "regular version MMSE")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see B/CMEMORY1"
  ),
    mmse01 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse02 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse03 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse04 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse05 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse06 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse07 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse08 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse09 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse10 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse11 = c(`-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right"),
    mmse12 = c(
    `-1` = "na, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
    mmse13 = c(
    `-1` = "na, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
    mmse14 = c(`-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right"),
    mmse15 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse16 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse17 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse18 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse19 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse20 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse21 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse22 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse23 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see B/CMEMORY1"
  ),
    mmse01 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse02 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse03 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse04 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse05 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse06 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse07 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse08 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse09 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse10 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse11 = c(`-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right"),
    mmse12 = c(
    `-1` = "na, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
    mmse13 = c(
    `-1` = "na, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
    mmse14 = c(`-1` = "na, asked", `0` = "0 right", `1` = "1 right", `2` = "2 right", `3` = "3 right"),
    mmse15 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse16 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse17 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse18 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse19 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse20 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse21 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse22 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse23 = c(`-1` = "na, asked", `1` = "wrong", `2` = "correct")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    immse01 = .replace_labels(
    standardized_value_labels$immse01,
    `-2` = "na, see BMMSEVRS"
  ),
    immse02 = .replace_labels(
    standardized_value_labels$immse02,
    `-2` = "na, see BMMSEVRS"
  ),
    immse03 = .replace_labels(
    standardized_value_labels$immse03,
    `-2` = "na, see BMMSEVRS"
  ),
    immse04 = .replace_labels(
    standardized_value_labels$immse04,
    `-2` = "na, see BMMSEVRS"
  ),
    immse05 = .replace_labels(
    standardized_value_labels$immse05,
    `-2` = "na, see BMMSEVRS"
  ),
    immse06 = .replace_labels(
    standardized_value_labels$immse06,
    `-2` = "na, see BMMSEVRS"
  ),
    immse07 = .replace_labels(
    standardized_value_labels$immse07,
    `-2` = "na, see BMMSEVRS"
  ),
    immse08 = .replace_labels(
    standardized_value_labels$immse08,
    `-2` = "na, see BMMSEVRS"
  ),
    immse09 = .replace_labels(
    standardized_value_labels$immse09,
    `-2` = "na, see BMMSEVRS"
  ),
    immse10 = .replace_labels(
    standardized_value_labels$immse10,
    `-2` = "na, see BMMSEVRS"
  ),
    immse11 = .replace_labels(
    standardized_value_labels$immse11,
    `-2` = "na, see BMMSEVRS"
  ),
    immse13 = .replace_labels(
    standardized_value_labels$immse13,
    `-2` = "na, see BMMSEVRS"
  ),
    immse14 = .replace_labels(
    standardized_value_labels$immse14,
    `-2` = "na, see BMMSEVRS"
  ),
    immse15 = .replace_labels(
    standardized_value_labels$immse15,
    `-2` = "na, see BMMSEVRS"
  ),
    immse16 = .replace_labels(
    standardized_value_labels$immse16,
    `-2` = "na, see BMMSEVRS"
  ),
    immse17 = .replace_labels(
    standardized_value_labels$immse17,
    `-2` = "na, see BMMSEVRS"
  ),
    immse18 = .replace_labels(
    standardized_value_labels$immse18,
    `-2` = "na, see BMMSEVRS"
  ),
    immse19 = .replace_labels(
    standardized_value_labels$immse19,
    `-2` = "na, see BMMSEVRS"
  ),
    immse20 = .replace_labels(
    standardized_value_labels$immse20,
    `-2` = "na, see BMMSEVRS"
  ),
    immse21 = .replace_labels(
    standardized_value_labels$immse21,
    `-2` = "na, see BMMSEVRS"
  ),
    immse22 = .replace_labels(
    standardized_value_labels$immse22,
    `-2` = "na, see BMMSEVRS"
  ),
    immse23 = .replace_labels(
    standardized_value_labels$immse23,
    `-2` = "na, see BMMSEVRS"
  ),
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see BMMSESC in LASMB221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see BMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse12 = c(`-2` = "na, see BMMSEVRS", `-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see BMMSEVRS"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see BMMSEVRS"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "021", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "021", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "021", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "021", waves = .lasa_wave_rows())
)

.lasa_fc_021 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

