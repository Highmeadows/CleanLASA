## LASA filecode 017 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  incc10s = "Subdivision income category 10",
  incc5s = "Subdivision income category 5",
  incc6s = "Subdivision income category 6",
  incc7s = "Subdivision income category 7",
  incc8s = "Subdivision income category 8",
  incc9s = "Subdivision income category 9",
  inccat = "Income categories",
  incf = "Income-category answers refer to",
  partinc = "Own income partner",
  pinc01 = "P: income from employment",
  pinc02 = "P: income from savings, dividend, property",
  pinc03 = "P: profit from ventures",
  pinc04 = "P: pension, early retirement, annuity",
  pinc05 = "P: old age pension (AOW) or AWW",
  pinc06 = "P: social security (ABW), RWW, IOAW, IOAZ",
  pinc07 = "P: bonuslaw",
  pinc08 = "P: disability benefit: ABP, AAW/WAO",
  pinc09 = "P: unemployment benefit (WW)",
  pinc10 = "P: other social security",
  pinc11 = "P: maintenance allowance",
  pinc12 = "P: board and lodging",
  pinc13 = "P: other income source",
  respinc = "Own income respondent",
  rinc01 = "R: income from employment",
  rinc02 = "R: income from savings, dividend, property",
  rinc03 = "R: profit from ventures",
  rinc04 = "R: pension, early retirement, annuity",
  rinc05 = "R: old age pension (AOW) or AWW",
  rinc06 = "R: social security (ABW), RWW, IOAW, IOAZ",
  rinc07 = "R: bonuslaw",
  rinc08 = "R: disability benefit: ABP, AAW/WAO",
  rinc09 = "R: unemployment benefit (WW)",
  rinc10 = "R: other social security",
  rinc11 = "R: maintenance allowance",
  rinc12 = "R: board and lodging",
  rinc13 = "R: other income source"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `C` = c(
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `D` = c(
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `E` = c(
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `2B` = c(
    "inccat",
    "incf",
    "partinc",
    "pinc01",
    "pinc02",
    "pinc03",
    "pinc04",
    "pinc05",
    "pinc06",
    "pinc07",
    "pinc08",
    "pinc09",
    "pinc10",
    "pinc11",
    "pinc12",
    "pinc13",
    "respinc",
    "rinc01",
    "rinc02",
    "rinc03",
    "rinc04",
    "rinc05",
    "rinc06",
    "rinc07",
    "rinc08",
    "rinc09",
    "rinc10",
    "rinc11",
    "rinc12",
    "rinc13"
  ),
  `F` = c(
    "incc5s",
    "incc7s",
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `G` = c(
    "incc5s",
    "incc7s",
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `H` = c(
    "incc6s",
    "incc8s",
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `3B` = c(
    "incc6s",
    "incc8s",
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `MB` = c(
    "incc6s",
    "incc8s",
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `I` = c(
    "incc6s",
    "incc8s",
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `J` = c(
    "incc9s",
    "inccat",
    "incf",
    "partinc",
    "respinc"
  ),
  `K` = c(
    "incc10s",
    "incc8s",
    "inccat",
    "incf",
    "partinc",
    "respinc"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    inccat = "Income categories : constructed",
    incf = "Answers in BINCCAT & BAMOUNT for:",
    partinc = "Own income partner: yes/no?",
    respinc = "R: Own income respondent: yes/no"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    incf = "Answers in C/D/EINCCAT for:",
    partinc = "Own income partner: yes/no",
    respinc = "R: Own income respondent: yes/no"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    incf = "Answers in C/D/EINCCAT for:",
    partinc = "Own income partner: yes/no",
    respinc = "R: Own income respondent: yes/no"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    incf = "Answers in C/D/EINCCAT for:",
    partinc = "Own income partner: yes/no",
    respinc = "R: Own income respondent: yes/no"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    inccat = "income categories",
    incf = "answers in BINCCAT for:",
    partinc = "own income partner: yes/no",
    respinc = "R: own income respondent: yes/no"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    incc5s = "subdivision income category 5",
    incc7s = "subdivision income category 7",
    inccat = "income categories",
    incf = "answers in FINCCAT for:",
    partinc = "r: own income respondent: yes/no",
    respinc = "r: own income respondent: yes/no"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    incc5s = "subdivision income category 5",
    incc7s = "subdivision income category 7",
    inccat = "income categories",
    incf = "answers in GINCCAT for:",
    partinc = "r: own income respondent: yes/no",
    respinc = "r: own income respondent: yes/no"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    incc6s = "subdivision income category 6",
    incc8s = "subdivision income category 8",
    inccat = "income categories",
    incf = "answers in H/B/BINCCAT for:",
    partinc = "own income (hh)partner: yes/no",
    respinc = "own income respondent: yes/no"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    incc6s = "subdivision income category 6",
    incc8s = "subdivision income category 8",
    inccat = "income categories",
    incf = "answers in H/B/BINCCAT for:",
    partinc = "own income (hh)partner: yes/no",
    respinc = "own income respondent: yes/no"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    incc6s = "subdivision income category 6",
    incc8s = "subdivision income category 8",
    inccat = "income categories",
    incf = "answers in H/B/BINCCAT for:",
    partinc = "own income (hh)partner: yes/no",
    respinc = "own income respondent: yes/no"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    incc6s = "subdivision income category 6",
    incc8s = "subdivision income category 8",
    inccat = "income categories",
    incf = "answers in IINCCAT for:",
    partinc = "own income (hh)partner: yes/no",
    respinc = "own income respondent: yes/no"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    incc9s = "subdivision income category 9",
    inccat = "income categories",
    incf = "answers in JINCCAT for:",
    partinc = "own income (hh) partner: yes/no",
    respinc = "own income respondent: yes/no"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    incc10s = "subdivision income category 10",
    incc8s = "subdivision income category 8",
    inccat = "income categories",
    incf = "answers in KINCCAT for:",
    partinc = "own income (hh) partner: yes/no",
    respinc = "own income respondent: yes/no"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "yes"
)

standardized_value_labels <- list(
  incc10s = c(
    `-4` = "not available, no partner in household",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "1645 euro or lower",
    `2` = "more than 1645 euro"
  ),
  incc5s = c(
    `-4` = "not available, partner in household",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "at or below income threshold",
    `2` = "above income threshold"
  ),
  incc6s = c(
    `-4` = "not available, partner in household",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "at or below income threshold",
    `2` = "above income threshold"
  ),
  incc7s = c(
    `-4` = "not available, no partner in household",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "at or below income threshold",
    `2` = "above income threshold"
  ),
  incc8s = c(
    `-4` = "not available, no partner in household",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "at or below income threshold",
    `2` = "above income threshold"
  ),
  incc9s = c(
    `-4` = "not available, no partner in household",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "1555 euro or lower",
    `2` = "more than 1555 euro"
  ),
  inccat = c(
    default_missing_labels[c("-3", "-2")],
    `0` = "less than \306\222 999",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "label varies by wave",
    `8` = "label varies by wave",
    `9` = "label varies by wave",
    `10` = "label varies by wave",
    `11` = "label varies by wave",
    `12` = "label varies by wave",
    `13` = "label varies by wave",
    `14` = "label varies by wave",
    `15` = "label varies by wave",
    `16` = "label varies by wave",
    `17` = "label varies by wave",
    `18` = "label varies by wave",
    `19` = "label varies by wave",
    `20` = "label varies by wave",
    `21` = "label varies by wave",
    `22` = "label varies by wave",
    `23` = "label varies by wave",
    `24` = "label varies by wave",
    `25` = "5446 or more (12000 fl or more)"
  ),
  incf = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-4", "-1")],
    `0` = "no income",
    `1` = "respondent only",
    `2` = "partner only",
    `3` = "respondent + partner in household",
    `4` = "respondent + partner out household",
    `5` = "r+other in household",
    `6` = "total income respondent + partner unknown"
  ),
  partinc = c(
    `-5` = "not available",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "not available",
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "yes",
    `3` = "partner has income but r does not report amount"
  ),
  pinc01 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc02 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc03 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc04 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc05 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc06 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc07 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc08 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc09 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc10 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc11 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc12 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc13 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  respinc = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "yes"
  ),
  rinc01 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc02 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc03 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc04 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc05 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc06 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc07 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc08 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc09 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc10 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc11 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc12 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc13 = c(
    `-5` = "not available, refused",
    default_missing_labels[c("-2", "-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    inccat = c(
    `-2` = "na, see BINCF",
    `0` = "less than ƒ 999",
    `1` = "ƒ 1.000 - 1.250",
    `2` = "ƒ 1.251 - 1.500",
    `3` = "ƒ 1.501 - 1.750",
    `4` = "ƒ 1.751 - 2.000",
    `5` = "ƒ 2.001 - 2.250",
    `6` = "ƒ 2.251 - 2.500",
    `7` = "ƒ 2.501 - 3.000",
    `8` = "ƒ 3.001 - 3.500",
    `9` = "ƒ 3.501 - 4.000",
    `10` = "ƒ 4.001 - 4.500",
    `11` = "ƒ 4.501 - 5.000",
    `12` = "ƒ 5.001 or more per month"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh"
  ),
    partinc = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    respinc = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    inccat = c(
    `-2` = "na, see C/D/EINCF",
    `0` = "less than ƒ 999",
    `1` = "ƒ 1.000 - 1.250",
    `2` = "ƒ 1.251 - 1.500",
    `3` = "ƒ 1.501 - 1.750",
    `4` = "ƒ 1.751 - 2.000",
    `5` = "ƒ 2.001 - 2.250",
    `6` = "ƒ 2.251 - 2.500",
    `7` = "ƒ 2.501 - 3.000",
    `8` = "ƒ 3.001 - 3.500",
    `9` = "ƒ 3.501 - 4.000",
    `10` = "ƒ 4.001 - 4.500",
    `11` = "ƒ 4.501 - 5.000",
    `12` = "ƒ 5.001 or more per month"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    inccat = c(`-2` = "na, see C/D/EINCF"),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    inccat = c(`-2` = "na, see C/D/EINCF"),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    inccat = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCF",
    `1` = "454-567 euro",
    `2` = "568-680 euro",
    `3` = "681-794 euro",
    `4` = "795-907 euro",
    `5` = "908-1021 euro",
    `6` = "1022-1134 euro",
    `7` = "1135-1361 euro",
    `8` = "1362-1588 euro",
    `9` = "1589-1815 euro",
    `10` = "1816-2042 euro",
    `11` = "2043-2269 euro",
    `12` = "2270 euro or more"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-5` = "na, partner out hh",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    pinc01 = .replace_labels(
    standardized_value_labels$pinc01,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc02 = .replace_labels(
    standardized_value_labels$pinc02,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc03 = .replace_labels(
    standardized_value_labels$pinc03,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc04 = .replace_labels(
    standardized_value_labels$pinc04,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc05 = .replace_labels(
    standardized_value_labels$pinc05,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc06 = .replace_labels(
    standardized_value_labels$pinc06,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc07 = .replace_labels(
    standardized_value_labels$pinc07,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc08 = .replace_labels(
    standardized_value_labels$pinc08,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc09 = .replace_labels(
    standardized_value_labels$pinc09,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc10 = .replace_labels(
    standardized_value_labels$pinc10,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc11 = .replace_labels(
    standardized_value_labels$pinc11,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc12 = .replace_labels(
    standardized_value_labels$pinc12,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    pinc13 = .replace_labels(
    standardized_value_labels$pinc13,
    `-5` = "na, refusal",
    `-2` = "na, see BPARTINC"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    rinc01 = .replace_labels(
    standardized_value_labels$rinc01,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc02 = .replace_labels(
    standardized_value_labels$rinc02,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc03 = .replace_labels(
    standardized_value_labels$rinc03,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc04 = .replace_labels(
    standardized_value_labels$rinc04,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc05 = .replace_labels(
    standardized_value_labels$rinc05,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc06 = .replace_labels(
    standardized_value_labels$rinc06,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc07 = .replace_labels(
    standardized_value_labels$rinc07,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc08 = .replace_labels(
    standardized_value_labels$rinc08,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc09 = .replace_labels(
    standardized_value_labels$rinc09,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc10 = .replace_labels(
    standardized_value_labels$rinc10,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc11 = .replace_labels(
    standardized_value_labels$rinc11,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc12 = .replace_labels(
    standardized_value_labels$rinc12,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  ),
    rinc13 = .replace_labels(
    standardized_value_labels$rinc13,
    `-5` = "na, refusal",
    `-2` = "na, see BRESPINC"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    incc5s = .replace_labels(
    standardized_value_labels$incc5s,
    `-4` = "na, partner in hh",
    `-2` = "na, see FINCCAT",
    `1` = "935 euro or lower",
    `2` = "more than 935 euro"
  ),
    incc7s = .replace_labels(
    standardized_value_labels$incc7s,
    `-4` = "na, no partner in hh",
    `-2` = "na, see FINCCAT",
    `1` = "1335 euro or lower",
    `2` = "more than 1335 euro"
  ),
    inccat = c(
    `-2` = "na, see FINCF",
    `1` = "454-567 euro (1000-1250 fl)",
    `2` = "568-680 euro (1251-1500 fl)",
    `3` = "681-794 euro (1501-1750 fl)",
    `4` = "795-907 euro (1751-2000 fl)",
    `5` = "908-1021 euro (2001-2250 fl)",
    `6` = "1022-1134 euro (2251-2500 fl)",
    `7` = "1135-1361 euro (2501-3000 fl)",
    `8` = "1362-1588 euro (3001-3500 fl)",
    `9` = "1589-1815 euro (3501-4000 fl)",
    `10` = "1816-2042 euro (4001-4500 fl)",
    `11` = "2043-2269 euro (4501-5000 fl)",
    `12` = "2270 euro or more (5001 fl or more)"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-5` = "na, partner out hh",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    incc5s = .replace_labels(
    standardized_value_labels$incc5s,
    `-4` = "na, partner in hh",
    `-2` = "na, see GINCCAT",
    `1` = "976 euro or lower",
    `2` = "more than 976 euro"
  ),
    incc7s = .replace_labels(
    standardized_value_labels$incc7s,
    `-4` = "na, no partner in hh",
    `-2` = "na, see GINCCAT",
    `1` = "1340 euro or lower",
    `2` = "more than 1340 euro"
  ),
    inccat = c(
    `-2` = "na, see GINCF",
    `1` = "454-567 euro (1000-1250 fl)",
    `2` = "568-680 euro (1251-1500 fl)",
    `3` = "681-794 euro (1501-1750 fl)",
    `4` = "795-907 euro (1751-2000 fl)",
    `5` = "908-1021 euro (2001-2250 fl)",
    `6` = "1022-1134 euro (2251-2500 fl)",
    `7` = "1135-1361 euro (2501-3000 fl)",
    `8` = "1362-1588 euro (3001-3500 fl)",
    `9` = "1589-1815 euro (3501-4000 fl)",
    `10` = "1816-2042 euro (4001-4500 fl)",
    `11` = "2043-2269 euro (4501-5000 fl)",
    `12` = "2270-2495 euro (5001-5500 fl)",
    `13` = "2496-2722 euro (5501-6000 fl)",
    `14` = "2723-2949 euro (6001-6500 fl)",
    `15` = "2950-3176 euro (6501-7000 fl)",
    `16` = "3177-3403 euro (7001-7500 fl)",
    `17` = "3404-3630 euro (7501-8000 fl)",
    `18` = "3631-3857 euro (8001-8500 fl)",
    `19` = "3858-4084 euro (8501-9000 fl)",
    `20` = "4085-4311 euro (9001-9500 fl)",
    `21` = "4312-4537 euro (9501-10000 fl)",
    `22` = "4538-4991 euro (10001-11000 fl)",
    `23` = "4992-5445 euro (11001-12000 fl)",
    `24` = "5446 or more (12000 fl or more)"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-5` = "na, partner out hh",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    incc6s = .replace_labels(
    standardized_value_labels$incc6s,
    `-4` = "na, partner in hh",
    `-2` = "na, see H/B/BINCCAT",
    `1` = "1040 euro or lower",
    `2` = "more than 1040 euro"
  ),
    incc8s = .replace_labels(
    standardized_value_labels$incc8s,
    `-4` = "na, no partner in hh",
    `-2` = "na, see H/B/BINCCAT",
    `1` = "1425 euro or lower",
    `2` = "more than 1425 euro"
  ),
    inccat = c(
    `-2` = "na, see H/B/BINCF",
    `1` = "454-567 euro (1000-1250 fl)",
    `2` = "568-680 euro (1251-1500 fl)",
    `3` = "681-794 euro (1501-1750 fl)",
    `4` = "795-907 euro (1751-2000 fl)",
    `5` = "908-1021 euro (2001-2250 fl)",
    `6` = "1022-1134 euro (2251-2500 fl)",
    `7` = "1135-1361 euro (2501-3000 fl)",
    `8` = "1362-1588 euro (3001-3500 fl)",
    `9` = "1589-1815 euro (3501-4000 fl)",
    `10` = "1816-2042 euro (4001-4500 fl)",
    `11` = "2043-2269 euro (4501-5000 fl)",
    `12` = "2270-2495 euro (5001-5500 fl)",
    `13` = "2496-2722 euro (5501-6000 fl)",
    `14` = "2723-2949 euro (6001-6500 fl)",
    `15` = "2950-3176 euro (6501-7000 fl)",
    `16` = "3177-3403 euro (7001-7500 fl)",
    `17` = "3404-3630 euro (7501-8000 fl)",
    `18` = "3631-3857 euro (8001-8500 fl)",
    `19` = "3858-4084 euro (8501-9000 fl)",
    `20` = "4085-4311 euro (9001-9500 fl)",
    `21` = "4312-4537 euro (9501-10000 fl)",
    `22` = "4538-4991 euro (10001-11000 fl)",
    `23` = "4992-5445 euro (11001-12000 fl)",
    `24` = "5446 or more (12000 fl or more)"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-5` = "na, partner out hh",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    incc6s = .replace_labels(
    standardized_value_labels$incc6s,
    `-4` = "na, partner in hh",
    `-2` = "na, see H/B/BINCCAT",
    `1` = "1040 euro or lower",
    `2` = "more than 1040 euro"
  ),
    incc8s = .replace_labels(
    standardized_value_labels$incc8s,
    `-4` = "na, no partner in hh",
    `-2` = "na, see H/B/BINCCAT",
    `1` = "1425 euro or lower",
    `2` = "more than 1425 euro"
  ),
    inccat = c(
    `-2` = "na, see H/B/BINCF",
    `1` = "454-567 euro (1000-1250 fl)",
    `2` = "568-680 euro (1251-1500 fl)",
    `3` = "681-794 euro (1501-1750 fl)",
    `4` = "795-907 euro (1751-2000 fl)",
    `5` = "908-1021 euro (2001-2250 fl)",
    `6` = "1022-1134 euro (2251-2500 fl)",
    `7` = "1135-1361 euro (2501-3000 fl)",
    `8` = "1362-1588 euro (3001-3500 fl)",
    `9` = "1589-1815 euro (3501-4000 fl)",
    `10` = "1816-2042 euro (4001-4500 fl)",
    `11` = "2043-2269 euro (4501-5000 fl)",
    `12` = "2270-2495 euro (5001-5500 fl)",
    `13` = "2496-2722 euro (5501-6000 fl)",
    `14` = "2723-2949 euro (6001-6500 fl)",
    `15` = "2950-3176 euro (6501-7000 fl)",
    `16` = "3177-3403 euro (7001-7500 fl)",
    `17` = "3404-3630 euro (7501-8000 fl)",
    `18` = "3631-3857 euro (8001-8500 fl)",
    `19` = "3858-4084 euro (8501-9000 fl)",
    `20` = "4085-4311 euro (9001-9500 fl)",
    `21` = "4312-4537 euro (9501-10000 fl)",
    `22` = "4538-4991 euro (10001-11000 fl)",
    `23` = "4992-5445 euro (11001-12000 fl)",
    `24` = "5446 or more (12000 fl or more)"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-5` = "na, partner out hh",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    incc6s = .replace_labels(
    standardized_value_labels$incc6s,
    `-4` = "na, partner in hh",
    `-2` = "na, see H/B/BINCCAT",
    `1` = "1040 euro or lower",
    `2` = "more than 1040 euro"
  ),
    incc8s = .replace_labels(
    standardized_value_labels$incc8s,
    `-4` = "na, no partner in hh",
    `-2` = "na, see H/B/BINCCAT",
    `1` = "1425 euro or lower",
    `2` = "more than 1425 euro"
  ),
    inccat = c(
    `-2` = "na, see H/B/BINCF",
    `1` = "454-567 euro (1000-1250 fl)",
    `2` = "568-680 euro (1251-1500 fl)",
    `3` = "681-794 euro (1501-1750 fl)",
    `4` = "795-907 euro (1751-2000 fl)",
    `5` = "908-1021 euro (2001-2250 fl)",
    `6` = "1022-1134 euro (2251-2500 fl)",
    `7` = "1135-1361 euro (2501-3000 fl)",
    `8` = "1362-1588 euro (3001-3500 fl)",
    `9` = "1589-1815 euro (3501-4000 fl)",
    `10` = "1816-2042 euro (4001-4500 fl)",
    `11` = "2043-2269 euro (4501-5000 fl)",
    `12` = "2270-2495 euro (5001-5500 fl)",
    `13` = "2496-2722 euro (5501-6000 fl)",
    `14` = "2723-2949 euro (6001-6500 fl)",
    `15` = "2950-3176 euro (6501-7000 fl)",
    `16` = "3177-3403 euro (7001-7500 fl)",
    `17` = "3404-3630 euro (7501-8000 fl)",
    `18` = "3631-3857 euro (8001-8500 fl)",
    `19` = "3858-4084 euro (8501-9000 fl)",
    `20` = "4085-4311 euro (9001-9500 fl)",
    `21` = "4312-4537 euro (9501-10000 fl)",
    `22` = "4538-4991 euro (10001-11000 fl)",
    `23` = "4992-5445 euro (11001-12000 fl)",
    `24` = "5446 or more (12000 fl or more)"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-5` = "na, partner out hh",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    incc6s = .replace_labels(
    standardized_value_labels$incc6s,
    `-4` = "na, partner in hh",
    `-2` = "na, see IINCCAT",
    `1` = "1060 euro or lower",
    `2` = "more than 1060 euro"
  ),
    incc8s = .replace_labels(
    standardized_value_labels$incc8s,
    `-4` = "na, no partner in hh",
    `-2` = "na, see IINCCAT",
    `1` = "1450 euro or lower",
    `2` = "more than 1450 euro"
  ),
    inccat = c(
    `-2` = "na, see IINCF",
    `1` = "454-567 euro (1000-1250 fl)",
    `2` = "568-680 euro (1251-1500 fl)",
    `3` = "681-794 euro (1501-1750 fl)",
    `4` = "795-907 euro (1751-2000 fl)",
    `5` = "908-1021 euro (2001-2250 fl)",
    `6` = "1022-1134 euro (2251-2500 fl)",
    `7` = "1135-1361 euro (2501-3000 fl)",
    `8` = "1362-1588 euro (3001-3500 fl)",
    `9` = "1589-1815 euro (3501-4000 fl)",
    `10` = "1816-2042 euro (4001-4500 fl)",
    `11` = "2043-2269 euro (4501-5000 fl)",
    `12` = "2270-2495 euro (5001-5500 fl)",
    `13` = "2496-2722 euro (5501-6000 fl)",
    `14` = "2723-2949 euro (6001-6500 fl)",
    `15` = "2950-3176 euro (6501-7000 fl)",
    `16` = "3177-3403 euro (7001-7500 fl)",
    `17` = "3404-3630 euro (7501-8000 fl)",
    `18` = "3631-3857 euro (8001-8500 fl)",
    `19` = "3858-4084 euro (8501-9000 fl)",
    `20` = "4085-4311 euro (9001-9500 fl)",
    `21` = "4312-4537 euro (9501-10000 fl)",
    `22` = "4538-4991 euro (10001-11000 fl)",
    `23` = "4992-5445 euro (11001-12000 fl)",
    `24` = "5446 or more (12000 fl or more)"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-5` = "na, partner out hh",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    incc9s = .replace_labels(
    standardized_value_labels$incc9s,
    `-4` = "na, no partner in hh",
    `-2` = "na, see JINCCAT"
  ),
    inccat = c(
    `-2` = "na, see JINCF",
    `1` = "0 en 453 euro (0-1000 fl)",
    `2` = "454-567 euro (1000-1250 fl)",
    `3` = "568-680 euro (1251-1500 fl)",
    `4` = "681-794 euro (1501-1750 fl)",
    `5` = "795-907 euro (1751-2000 fl)",
    `6` = "908-1021 euro (2001-2250 fl)",
    `7` = "1022-1134 euro (2251-2500 fl)",
    `8` = "1135-1361 euro (2501-3000 fl)",
    `9` = "1362-1588 euro (3001-3500 fl)",
    `10` = "1589-1815 euro (3501-4000 fl)",
    `11` = "1816-2042 euro (4001-4500 fl)",
    `12` = "2043-2269 euro (4501-5000 fl)",
    `13` = "2270-2495 euro (5001-5500 fl)",
    `14` = "2496-2722 euro (5501-6000 fl)",
    `15` = "2723-2949 euro (6001-6500 fl)",
    `16` = "2950-3176 euro (6501-7000 fl)",
    `17` = "3177-3403 euro (7001-7500 fl)",
    `18` = "3404-3630 euro (7501-8000 fl)",
    `19` = "3631-3857 euro (8001-8500 fl)",
    `20` = "3858-4084 euro (8501-9000 fl)",
    `21` = "4085-4311 euro (9001-9500 fl)",
    `22` = "4312-4537 euro (9501-10000 fl)",
    `23` = "4538-4991 euro (10001-11000 fl)",
    `24` = "4992-5445 euro (11001-12000 fl)",
    `25` = "5446 or more (12000 fl or more)"
  ),
    incf = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `0` = "no income",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh"
  ),
    partinc = c(
    `-5` = "na, partner out hh",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    incc10s = .replace_labels(
    standardized_value_labels$incc10s,
    `-4` = "na, no partner in hh",
    `-2` = "na, see KINCCAT"
  ),
    incc8s = .replace_labels(
    standardized_value_labels$incc8s,
    `-4` = "na, no partner in hh",
    `-2` = "na, see KINCCAT",
    `1` = "1201 euro or lower",
    `2` = "more than 1201 euro"
  ),
    inccat = c(
    `-2` = "na, see KINCF",
    `1` = "0 en 453 euro (0-1000 fl)",
    `2` = "454-567 euro (1000-1250 fl)",
    `3` = "568-680 euro (1251-1500 fl)",
    `4` = "681-794 euro (1501-1750 fl)",
    `5` = "795-907 euro (1751-2000 fl)",
    `6` = "908-1021 euro (2001-2250 fl)",
    `7` = "1022-1134 euro (2251-2500 fl)",
    `8` = "1135-1361 euro (2501-3000 fl)",
    `9` = "1362-1588 euro (3001-3500 fl)",
    `10` = "1589-1815 euro (3501-4000 fl)",
    `11` = "1816-2042 euro (4001-4500 fl)",
    `12` = "2043-2269 euro (4501-5000 fl)",
    `13` = "2270-2495 euro (5001-5500 fl)",
    `14` = "2496-2722 euro (5501-6000 fl)",
    `15` = "2723-2949 euro (6001-6500 fl)",
    `16` = "2950-3176 euro (6501-7000 fl)",
    `17` = "3177-3403 euro (7001-7500 fl)",
    `18` = "3404-3630 euro (7501-8000 fl)",
    `19` = "3631-3857 euro (8001-8500 fl)",
    `20` = "3858-4084 euro (8501-9000 fl)",
    `21` = "4085-4311 euro (9001-9500 fl)",
    `22` = "4312-4537 euro (9501-10000 fl)",
    `23` = "4538-4991 euro (10001-11000 fl)",
    `24` = "4992-5445 euro (11001-12000 fl)",
    `25` = "5446 or more (12000 fl or more)"
  ),
    incf = .replace_labels(
    standardized_value_labels$incf,
    `-5` = "na, refused",
    `-4` = "na, short version",
    `1` = "R only",
    `2` = "P only",
    `3` = "R+P in hh",
    `4` = "R+P out hh",
    `5` = "R+other in hh",
    `6` = "total income R+P unknown"
  ),
    partinc = c(
    `-5` = "na, partner out hh",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, no partner",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "partner has income but R does not report amount"
  ),
    respinc = c(`-4` = "na, short version", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  incc10s = "categorical",
  incc5s = "categorical",
  incc6s = "categorical",
  incc7s = "categorical",
  incc8s = "categorical",
  incc9s = "categorical",
  inccat = "categorical",
  incf = "categorical",
  partinc = "categorical",
  pinc01 = "categorical",
  pinc02 = "categorical",
  pinc03 = "categorical",
  pinc04 = "categorical",
  pinc05 = "categorical",
  pinc06 = "categorical",
  pinc07 = "categorical",
  pinc08 = "categorical",
  pinc09 = "categorical",
  pinc10 = "categorical",
  pinc11 = "categorical",
  pinc12 = "categorical",
  pinc13 = "categorical",
  respinc = "categorical",
  rinc01 = "categorical",
  rinc02 = "categorical",
  rinc03 = "categorical",
  rinc04 = "categorical",
  rinc05 = "categorical",
  rinc06 = "categorical",
  rinc07 = "categorical",
  rinc08 = "categorical",
  rinc09 = "categorical",
  rinc10 = "categorical",
  rinc11 = "categorical",
  rinc12 = "categorical",
  rinc13 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "017", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "017", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "017", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "017", waves = .lasa_wave_rows())
)

.lasa_fc_017 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

