## LASA filecode 021 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
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

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
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
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    mmse03 = "MMSE item03: Date",
    mmse06 = "MMSE item06: Province",
    mmse07 = "MMSE item07: Municipality",
    mmse08 = "MMSE item08: Two main streets",
    mmse12 = "MMSE item12: subtraction of 7",
    mmse13 = "MMSE item13: Spelling backwards"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  immse01 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse02 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse03 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse04 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse05 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse06 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse07 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse08 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse09 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse10 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse11 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right"
  ),
  immse13 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
  immse14 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right"
  ),
  immse15 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse16 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse17 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse18 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse19 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse20 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse21 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse22 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  immse23 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  memory1 = c(`-2` = "not available, routing", `-1` = "not available, asked", `1` = "no", `2` = "yes"),
  memory2 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mmse01 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse02 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse03 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse04 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse05 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse06 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse07 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse08 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse09 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse10 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse11 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right"
  ),
  mmse12 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "0 right",
    `1` = "MMSE item12 response category 1",
    `2` = "MMSE item12 response category 2",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
  mmse13 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right",
    `4` = "4 right",
    `5` = "5 right"
  ),
  mmse14 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "0 right",
    `1` = "1 right",
    `2` = "2 right",
    `3` = "3 right"
  ),
  mmse15 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse16 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse17 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse18 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse19 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse20 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse21 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse22 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmse23 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "wrong",
    `2` = "correct"
  ),
  mmsevrs = c(`-2` = "MMSE version", `1` = "regular version MMSE", `2` = "regular version MMSE")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/CMEMORY1",
    `-1` = "na, asked"
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
    standardized_value_labels[c(
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
  )],
    memory1 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/CMEMORY1",
    `-1` = "na, asked"
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
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    immse01 = .replace_labels(
    standardized_value_labels$immse01,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse02 = .replace_labels(
    standardized_value_labels$immse02,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse03 = .replace_labels(
    standardized_value_labels$immse03,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse04 = .replace_labels(
    standardized_value_labels$immse04,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse05 = .replace_labels(
    standardized_value_labels$immse05,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse06 = .replace_labels(
    standardized_value_labels$immse06,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse07 = .replace_labels(
    standardized_value_labels$immse07,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse08 = .replace_labels(
    standardized_value_labels$immse08,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse09 = .replace_labels(
    standardized_value_labels$immse09,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse10 = .replace_labels(
    standardized_value_labels$immse10,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse11 = .replace_labels(
    standardized_value_labels$immse11,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse13 = .replace_labels(
    standardized_value_labels$immse13,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse14 = .replace_labels(
    standardized_value_labels$immse14,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse15 = .replace_labels(
    standardized_value_labels$immse15,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse16 = .replace_labels(
    standardized_value_labels$immse16,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse17 = .replace_labels(
    standardized_value_labels$immse17,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse18 = .replace_labels(
    standardized_value_labels$immse18,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse19 = .replace_labels(
    standardized_value_labels$immse19,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse20 = .replace_labels(
    standardized_value_labels$immse20,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse21 = .replace_labels(
    standardized_value_labels$immse21,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse22 = .replace_labels(
    standardized_value_labels$immse22,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    immse23 = .replace_labels(
    standardized_value_labels$immse23,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see BMMSESC in LASMB221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see BMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse12 = c(`-2` = "na, see BMMSEVRS", `-1` = "na, asked", `1` = "wrong", `2` = "correct"),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see BMMSEVRS",
    `-1` = "na, asked"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    memory1 = .replace_labels(
    standardized_value_labels$memory1,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    memory2 = .replace_labels(
    standardized_value_labels$memory2,
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMEMORY1",
    `-1` = "na, asked"
  ),
    mmse01 = .replace_labels(
    standardized_value_labels$mmse01,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse02 = .replace_labels(
    standardized_value_labels$mmse02,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse03 = .replace_labels(
    standardized_value_labels$mmse03,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse04 = .replace_labels(
    standardized_value_labels$mmse04,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse05 = .replace_labels(
    standardized_value_labels$mmse05,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse06 = .replace_labels(
    standardized_value_labels$mmse06,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse07 = .replace_labels(
    standardized_value_labels$mmse07,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse08 = .replace_labels(
    standardized_value_labels$mmse08,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse09 = .replace_labels(
    standardized_value_labels$mmse09,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse10 = .replace_labels(
    standardized_value_labels$mmse10,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse11 = .replace_labels(
    standardized_value_labels$mmse11,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse12 = .replace_labels(
    standardized_value_labels$mmse12,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked",
    `1` = "1 right",
    `2` = "2 right"
  ),
    mmse13 = .replace_labels(
    standardized_value_labels$mmse13,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse14 = .replace_labels(
    standardized_value_labels$mmse14,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse15 = .replace_labels(
    standardized_value_labels$mmse15,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse16 = .replace_labels(
    standardized_value_labels$mmse16,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse17 = .replace_labels(
    standardized_value_labels$mmse17,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse18 = .replace_labels(
    standardized_value_labels$mmse18,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse19 = .replace_labels(
    standardized_value_labels$mmse19,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse20 = .replace_labels(
    standardized_value_labels$mmse20,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse21 = .replace_labels(
    standardized_value_labels$mmse21,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse22 = .replace_labels(
    standardized_value_labels$mmse22,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
  ),
    mmse23 = .replace_labels(
    standardized_value_labels$mmse23,
    `-2` = "na, see D/E/B/F/G/H/B/I/J/KMMSESC in LAS(A)*221",
    `-1` = "na, asked"
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

.lasa_fc_021 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "021", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "021", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "021", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "021", waves = .lasa_wave_rows())
)
