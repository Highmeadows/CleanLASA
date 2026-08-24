## LASA filecode 110 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qimpor1 = "good income",
  qimpor2 = "nice family",
  qimpor3 = "good physical health",
  qimpor4 = "sensible spending of time / meaningful pastime",
  qimpor5 = "good marital life",
  qimpor6 = "strong faith",
  qimpor7 = "good mental health",
  qimpor8 = "many friends and acquaintances",
  qimpor9 = "good housing",
  qnansw = "number of answers given on 9 items",
  qsatis1 = "satisfied with life: lately",
  qsatis2 = "satisfied with life: until now",
  qsatis3 = "satisfied with life: now score from 0 to 10",
  qsatis4 = "satisfied with life: now compared to year ago"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor4 = "sensible spending of time"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor4 = "sensible spending of time"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor4 = "sensible spending of time"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor4 = "sensible spending of time"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor4 = "sensible spending of time"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor4 = "sensible spending of time"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor4 = "sensible spending of time"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    qimpor4 = "sensible spending of time"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor4 = "meaningful pastime"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    qimpor4 = "meaningful pastime"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    qimpor4 = "meaningful pastime"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor4 = "meaningful pastime"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qimpor1 = c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned"),
  qimpor2 = c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned"),
  qimpor3 = c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned"),
  qimpor4 = c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned"),
  qimpor5 = c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned"),
  qimpor6 = c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned"),
  qimpor7 = c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned"),
  qimpor8 = c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned"),
  qimpor9 = c(`-1` = "missing", `1` = "mentioned", `2` = "not mentioned"),
  qnansw = c(`0` = "none mentioned", `1` = "1 mentioned", `9` = "9 mentioned"),
  qsatis1 = c(
    `-1` = "not available",
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "satisfied",
    `5` = "very satisfied"
  ),
  qsatis2 = c(
    `-1` = "not available",
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "satisfied",
    `5` = "very satisfied"
  ),
  qsatis3 = c(`-1` = "not available", `0` = NA_character_, `10` = NA_character_),
  qsatis4 = c(
    `-1` = "not available",
    `1` = "much more satisfied",
    `2` = "more satisfied",
    `3` = "equally satisfied",
    `4` = "less dissatisfied",
    `5` = "much less satisfied"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  ),
    qsatis3 = .replace_labels(
    standardized_value_labels$qsatis3,
    `-1` = "no answer"
  ),
    qsatis4 = .replace_labels(
    standardized_value_labels$qsatis4,
    `-1` = "no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  ),
    qsatis3 = .replace_labels(
    standardized_value_labels$qsatis3,
    `-1` = "no answer"
  ),
    qsatis4 = .replace_labels(
    standardized_value_labels$qsatis4,
    `-1` = "no answer"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  ),
    qsatis3 = .replace_labels(
    standardized_value_labels$qsatis3,
    `-1` = "no answer"
  ),
    qsatis4 = .replace_labels(
    standardized_value_labels$qsatis4,
    `-1` = "no answer"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "qimpor1",
    "qimpor2",
    "qimpor3",
    "qimpor4",
    "qimpor5",
    "qimpor6",
    "qimpor7",
    "qimpor8",
    "qimpor9",
    "qnansw",
    "qsatis1",
    "qsatis2"
  )],
    qimpor1 = .replace_labels(
    standardized_value_labels$qimpor1,
    `-1` = "all 3 missing"
  ),
    qimpor2 = .replace_labels(
    standardized_value_labels$qimpor2,
    `-1` = "all 3 missing"
  ),
    qimpor3 = .replace_labels(
    standardized_value_labels$qimpor3,
    `-1` = "all 3 missing"
  ),
    qimpor4 = .replace_labels(
    standardized_value_labels$qimpor4,
    `-1` = "all 3 missing"
  ),
    qimpor5 = .replace_labels(
    standardized_value_labels$qimpor5,
    `-1` = "all 3 missing"
  ),
    qimpor6 = .replace_labels(
    standardized_value_labels$qimpor6,
    `-1` = "all 3 missing"
  ),
    qimpor7 = .replace_labels(
    standardized_value_labels$qimpor7,
    `-1` = "all 3 missing"
  ),
    qimpor8 = .replace_labels(
    standardized_value_labels$qimpor8,
    `-1` = "all 3 missing"
  ),
    qimpor9 = .replace_labels(
    standardized_value_labels$qimpor9,
    `-1` = "all 3 missing"
  ),
    qsatis1 = .replace_labels(
    standardized_value_labels$qsatis1,
    `-1` = "no answer"
  ),
    qsatis2 = .replace_labels(
    standardized_value_labels$qsatis2,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qimpor1 = "categorical",
  qimpor2 = "categorical",
  qimpor3 = "categorical",
  qimpor4 = "categorical",
  qimpor5 = "categorical",
  qimpor6 = "categorical",
  qimpor7 = "categorical",
  qimpor8 = "categorical",
  qimpor9 = "categorical",
  qnansw = "numeric",
  qsatis1 = "categorical",
  qsatis2 = "categorical",
  qsatis3 = "numeric",
  qsatis4 = "categorical"
)

.lasa_fc_110 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "110", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "110", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "110", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "110", waves = .lasa_wave_rows())
)
