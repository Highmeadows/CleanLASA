## LASA filecode 017 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  rinc13 = "R: other income source",
  .applies_to_waves = c("Z")
)

variable_labels(
  "inccat",
  .applies_to_waves = c("C", "D", "E")
)

variable_labels(
  "pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc13", "rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc13",
  .applies_to_waves = c("2B")
)

variable_labels(
  inccat = "Income categories : constructed",
  incf = "Answers in BINCCAT & BAMOUNT for:",
  partinc = "Own income partner: yes/no?",
  .applies_to_waves = c("B")
)

variable_labels(
  respinc = "R: Own income respondent: yes/no",
  .applies_to_waves = c("B", "C", "D", "E")
)

variable_labels(
  incf = "Answers in C/D/EINCCAT for:",
  partinc = "Own income partner: yes/no",
  .applies_to_waves = c("C", "D", "E")
)

variable_labels(
  inccat = "income categories",
  .applies_to_waves = c("2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  incf = "answers in BINCCAT for:",
  partinc = "own income partner: yes/no",
  respinc = "R: own income respondent: yes/no",
  .applies_to_waves = c("2B")
)

variable_labels(
  incc5s = "subdivision income category 5",
  incc7s = "subdivision income category 7",
  partinc = "r: own income respondent: yes/no",
  respinc = "r: own income respondent: yes/no",
  .applies_to_waves = c("F", "G")
)

variable_labels(
  incf = "answers in FINCCAT for:",
  .applies_to_waves = c("F")
)

variable_labels(
  incf = "answers in GINCCAT for:",
  .applies_to_waves = c("G")
)

variable_labels(
  incc6s = "subdivision income category 6",
  partinc = "own income (hh)partner: yes/no",
  .applies_to_waves = c("H", "3B", "MB", "I")
)

variable_labels(
  incc8s = "subdivision income category 8",
  .applies_to_waves = c("H", "3B", "MB", "I", "K")
)

variable_labels(
  incf = "answers in H/B/BINCCAT for:",
  .applies_to_waves = c("H", "3B", "MB")
)

variable_labels(
  respinc = "own income respondent: yes/no",
  .applies_to_waves = c("H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  incf = "answers in IINCCAT for:",
  .applies_to_waves = c("I")
)

variable_labels(
  incc9s = "subdivision income category 9",
  incf = "answers in JINCCAT for:",
  .applies_to_waves = c("J")
)

variable_labels(
  partinc = "own income (hh) partner: yes/no",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  incc10s = "subdivision income category 10",
  incf = "answers in KINCCAT for:",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("incc10s", "incc5s", "incc6s", "incc7s", "incc8s", "incc9s", "inccat", "pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc13", "respinc", "rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc13"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, refused",
  .applies_to_vars = c("incf", "pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc13", "respinc", "rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc13"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not available, no partner in household", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "1645 euro or lower", `2` = "more than 1645 euro",
  .applies_to_vars = c("incc10s"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not available, partner in household", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "at or below income threshold", `2` = "above income threshold",
  .applies_to_vars = c("incc5s", "incc6s"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not available, no partner in household", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "at or below income threshold", `2` = "above income threshold",
  .applies_to_vars = c("incc7s", "incc8s"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not available, no partner in household", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "1555 euro or lower", `2` = "more than 1555 euro",
  .applies_to_vars = c("incc9s"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `0` = "less than \306\222 999", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "label varies by wave", `8` = "label varies by wave", `9` = "label varies by wave", `10` = "label varies by wave", `11` = "label varies by wave", `12` = "label varies by wave", `13` = "label varies by wave", `14` = "label varies by wave", `15` = "label varies by wave", `16` = "label varies by wave", `17` = "label varies by wave", `18` = "label varies by wave", `19` = "label varies by wave", `20` = "label varies by wave", `21` = "label varies by wave", `22` = "label varies by wave", `23` = "label varies by wave", `24` = "label varies by wave", `25` = "5446 or more (12000 fl or more)",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-1` = "na, asked", `0` = "no income", `1` = "respondent only", `2` = "partner only", `3` = "respondent + partner in household", `4` = "respondent + partner out household", `5` = "r+other in household", `6` = "total income respondent + partner unknown",
  .applies_to_vars = c("incf"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "not available", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes", `3` = "partner has income but r does not report amount",
  .applies_to_vars = c("partinc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc13", "rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc13"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("respinc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short version",
  .applies_to_vars = c("incf", "partinc", "respinc"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BINCF", `0` = "less than \306\222 999", `1` = "\306\222 1.000 - 1.250", `2` = "\306\222 1.251 - 1.500", `3` = "\306\222 1.501 - 1.750", `4` = "\306\222 1.751 - 2.000", `5` = "\306\222 2.001 - 2.250", `6` = "\306\222 2.251 - 2.500", `7` = "\306\222 2.501 - 3.000", `8` = "\306\222 3.001 - 3.500", `9` = "\306\222 3.501 - 4.000", `10` = "\306\222 4.001 - 4.500", `11` = "\306\222 4.501 - 5.000", `12` = "\306\222 5.001 or more per month",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, refused", `-1` = "na, asked", `0` = "no income", `1` = "R only", `2` = "P only", `3` = "R+P in hh", `4` = "R+P out hh",
  .applies_to_vars = c("incf"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, refused", `-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("partinc", "respinc"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, no partner",
  .applies_to_vars = c("partinc"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/EINCF", `0` = "less than \306\222 999", `1` = "\306\222 1.000 - 1.250", `2` = "\306\222 1.251 - 1.500", `3` = "\306\222 1.501 - 1.750", `4` = "\306\222 1.751 - 2.000", `5` = "\306\222 2.001 - 2.250", `6` = "\306\222 2.251 - 2.500", `7` = "\306\222 2.501 - 3.000", `8` = "\306\222 3.001 - 3.500", `9` = "\306\222 3.501 - 4.000", `10` = "\306\222 4.001 - 4.500", `11` = "\306\222 4.501 - 5.000", `12` = "\306\222 5.001 or more per month",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("C")
)

value_labels(
  `-5` = "na, refused", `-1` = "na, asked", `0` = "no income", `1` = "R only", `2` = "P only", `3` = "R+P in hh", `4` = "R+P out hh", `5` = "R+other in hh",
  .applies_to_vars = c("incf"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("partinc"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("respinc"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/EINCF",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-2` = "na, see BPARTINC",
  .applies_to_vars = c("pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc13"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BRESPINC",
  .applies_to_vars = c("rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc13"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "na, refusal",
  .applies_to_vars = c("pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc13", "rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc13"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCF", `1` = "454-567 euro", `2` = "568-680 euro", `3` = "681-794 euro", `4` = "795-907 euro", `5` = "908-1021 euro", `6` = "1022-1134 euro", `7` = "1135-1361 euro", `8` = "1362-1588 euro", `9` = "1589-1815 euro", `10` = "1816-2042 euro", `11` = "2043-2269 euro", `12` = "2270 euro or more",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "na, partner out hh", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("partinc"),
  .applies_to_waves = c("2B", "F", "G", "H", "3B", "MB", "J")
)

value_labels(
  `-4` = "na, partner in hh", `-3` = "na, wrong skip", `-2` = "na, see FINCCAT", `-1` = "na, asked", `1` = "935 euro or lower", `2` = "more than 935 euro",
  .applies_to_vars = c("incc5s"),
  .applies_to_waves = c("F")
)

value_labels(
  `-4` = "na, no partner in hh", `-3` = "na, wrong skip", `-2` = "na, see FINCCAT", `-1` = "na, asked", `1` = "1335 euro or lower", `2` = "more than 1335 euro",
  .applies_to_vars = c("incc7s"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FINCF", `1` = "454-567 euro (1000-1250 fl)", `2` = "568-680 euro (1251-1500 fl)", `3` = "681-794 euro (1501-1750 fl)", `4` = "795-907 euro (1751-2000 fl)", `5` = "908-1021 euro (2001-2250 fl)", `6` = "1022-1134 euro (2251-2500 fl)", `7` = "1135-1361 euro (2501-3000 fl)", `8` = "1362-1588 euro (3001-3500 fl)", `9` = "1589-1815 euro (3501-4000 fl)", `10` = "1816-2042 euro (4001-4500 fl)", `11` = "2043-2269 euro (4501-5000 fl)", `12` = "2270 euro or more (5001 fl or more)",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("F")
)

value_labels(
  `-4` = "na, partner in hh", `-3` = "na, wrong skip", `-2` = "na, see GINCCAT", `-1` = "na, asked", `1` = "976 euro or lower", `2` = "more than 976 euro",
  .applies_to_vars = c("incc5s"),
  .applies_to_waves = c("G")
)

value_labels(
  `-4` = "na, no partner in hh", `-3` = "na, wrong skip", `-2` = "na, see GINCCAT", `-1` = "na, asked", `1` = "1340 euro or lower", `2` = "more than 1340 euro",
  .applies_to_vars = c("incc7s"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GINCF", `1` = "454-567 euro (1000-1250 fl)", `2` = "568-680 euro (1251-1500 fl)", `3` = "681-794 euro (1501-1750 fl)", `4` = "795-907 euro (1751-2000 fl)", `5` = "908-1021 euro (2001-2250 fl)", `6` = "1022-1134 euro (2251-2500 fl)", `7` = "1135-1361 euro (2501-3000 fl)", `8` = "1362-1588 euro (3001-3500 fl)", `9` = "1589-1815 euro (3501-4000 fl)", `10` = "1816-2042 euro (4001-4500 fl)", `11` = "2043-2269 euro (4501-5000 fl)", `12` = "2270-2495 euro (5001-5500 fl)", `13` = "2496-2722 euro (5501-6000 fl)", `14` = "2723-2949 euro (6001-6500 fl)", `15` = "2950-3176 euro (6501-7000 fl)", `16` = "3177-3403 euro (7001-7500 fl)", `17` = "3404-3630 euro (7501-8000 fl)", `18` = "3631-3857 euro (8001-8500 fl)", `19` = "3858-4084 euro (8501-9000 fl)", `20` = "4085-4311 euro (9001-9500 fl)", `21` = "4312-4537 euro (9501-10000 fl)", `22` = "4538-4991 euro (10001-11000 fl)", `23` = "4992-5445 euro (11001-12000 fl)", `24` = "5446 or more (12000 fl or more)",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("G")
)

value_labels(
  `-4` = "na, partner in hh", `-3` = "na, wrong skip", `-2` = "na, see H/B/BINCCAT", `-1` = "na, asked", `1` = "1040 euro or lower", `2` = "more than 1040 euro",
  .applies_to_vars = c("incc6s"),
  .applies_to_waves = c("H", "3B", "MB")
)

value_labels(
  `-4` = "na, no partner in hh", `-3` = "na, wrong skip", `-2` = "na, see H/B/BINCCAT", `-1` = "na, asked", `1` = "1425 euro or lower", `2` = "more than 1425 euro",
  .applies_to_vars = c("incc8s"),
  .applies_to_waves = c("H", "3B", "MB")
)

value_labels(
  `-2` = "na, see H/B/BINCF", `1` = "454-567 euro (1000-1250 fl)", `2` = "568-680 euro (1251-1500 fl)", `3` = "681-794 euro (1501-1750 fl)", `4` = "795-907 euro (1751-2000 fl)", `5` = "908-1021 euro (2001-2250 fl)", `6` = "1022-1134 euro (2251-2500 fl)", `7` = "1135-1361 euro (2501-3000 fl)", `8` = "1362-1588 euro (3001-3500 fl)", `9` = "1589-1815 euro (3501-4000 fl)", `10` = "1816-2042 euro (4001-4500 fl)", `11` = "2043-2269 euro (4501-5000 fl)", `12` = "2270-2495 euro (5001-5500 fl)", `13` = "2496-2722 euro (5501-6000 fl)", `14` = "2723-2949 euro (6001-6500 fl)", `15` = "2950-3176 euro (6501-7000 fl)", `16` = "3177-3403 euro (7001-7500 fl)", `17` = "3404-3630 euro (7501-8000 fl)", `18` = "3631-3857 euro (8001-8500 fl)", `19` = "3858-4084 euro (8501-9000 fl)", `20` = "4085-4311 euro (9001-9500 fl)", `21` = "4312-4537 euro (9501-10000 fl)", `22` = "4538-4991 euro (10001-11000 fl)", `23` = "4992-5445 euro (11001-12000 fl)", `24` = "5446 or more (12000 fl or more)",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("H", "3B", "MB")
)

value_labels(
  `-4` = "na, partner in hh", `-3` = "na, wrong skip", `-2` = "na, see IINCCAT", `-1` = "na, asked", `1` = "1060 euro or lower", `2` = "more than 1060 euro",
  .applies_to_vars = c("incc6s"),
  .applies_to_waves = c("I")
)

value_labels(
  `-4` = "na, no partner in hh", `-3` = "na, wrong skip", `-2` = "na, see IINCCAT", `-1` = "na, asked", `1` = "1450 euro or lower", `2` = "more than 1450 euro",
  .applies_to_vars = c("incc8s"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IINCF", `1` = "454-567 euro (1000-1250 fl)", `2` = "568-680 euro (1251-1500 fl)", `3` = "681-794 euro (1501-1750 fl)", `4` = "795-907 euro (1751-2000 fl)", `5` = "908-1021 euro (2001-2250 fl)", `6` = "1022-1134 euro (2251-2500 fl)", `7` = "1135-1361 euro (2501-3000 fl)", `8` = "1362-1588 euro (3001-3500 fl)", `9` = "1589-1815 euro (3501-4000 fl)", `10` = "1816-2042 euro (4001-4500 fl)", `11` = "2043-2269 euro (4501-5000 fl)", `12` = "2270-2495 euro (5001-5500 fl)", `13` = "2496-2722 euro (5501-6000 fl)", `14` = "2723-2949 euro (6001-6500 fl)", `15` = "2950-3176 euro (6501-7000 fl)", `16` = "3177-3403 euro (7001-7500 fl)", `17` = "3404-3630 euro (7501-8000 fl)", `18` = "3631-3857 euro (8001-8500 fl)", `19` = "3858-4084 euro (8501-9000 fl)", `20` = "4085-4311 euro (9001-9500 fl)", `21` = "4312-4537 euro (9501-10000 fl)", `22` = "4538-4991 euro (10001-11000 fl)", `23` = "4992-5445 euro (11001-12000 fl)", `24` = "5446 or more (12000 fl or more)",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("I")
)

value_labels(
  `-5` = "na, partner out hh", `-3` = "na, wrong skip", `-1` = "no answer, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("partinc"),
  .applies_to_waves = c("I")
)

value_labels(
  `-4` = "na, no partner in hh", `-3` = "na, wrong skip", `-2` = "na, see JINCCAT", `-1` = "na, asked", `1` = "1555 euro or lower", `2` = "more than 1555 euro",
  .applies_to_vars = c("incc9s"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JINCF", `1` = "0 en 453 euro (0-1000 fl)", `2` = "454-567 euro (1000-1250 fl)", `3` = "568-680 euro (1251-1500 fl)", `4` = "681-794 euro (1501-1750 fl)", `5` = "795-907 euro (1751-2000 fl)", `6` = "908-1021 euro (2001-2250 fl)", `7` = "1022-1134 euro (2251-2500 fl)", `8` = "1135-1361 euro (2501-3000 fl)", `9` = "1362-1588 euro (3001-3500 fl)", `10` = "1589-1815 euro (3501-4000 fl)", `11` = "1816-2042 euro (4001-4500 fl)", `12` = "2043-2269 euro (4501-5000 fl)", `13` = "2270-2495 euro (5001-5500 fl)", `14` = "2496-2722 euro (5501-6000 fl)", `15` = "2723-2949 euro (6001-6500 fl)", `16` = "2950-3176 euro (6501-7000 fl)", `17` = "3177-3403 euro (7001-7500 fl)", `18` = "3404-3630 euro (7501-8000 fl)", `19` = "3631-3857 euro (8001-8500 fl)", `20` = "3858-4084 euro (8501-9000 fl)", `21` = "4085-4311 euro (9001-9500 fl)", `22` = "4312-4537 euro (9501-10000 fl)", `23` = "4538-4991 euro (10001-11000 fl)", `24` = "4992-5445 euro (11001-12000 fl)", `25` = "5446 or more (12000 fl or more)",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("J")
)

value_labels(
  `-4` = "na, no partner in hh", `-3` = "na, wrong skip", `-2` = "na, see KINCCAT", `-1` = "na, asked", `1` = "1645 euro or lower", `2` = "more than 1645 euro",
  .applies_to_vars = c("incc10s"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, no partner in hh", `-3` = "na, wrong skip", `-2` = "na, see KINCCAT", `-1` = "na, asked", `1` = "1201 euro or lower", `2` = "more than 1201 euro",
  .applies_to_vars = c("incc8s"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KINCF", `1` = "0 en 453 euro (0-1000 fl)", `2` = "454-567 euro (1000-1250 fl)", `3` = "568-680 euro (1251-1500 fl)", `4` = "681-794 euro (1501-1750 fl)", `5` = "795-907 euro (1751-2000 fl)", `6` = "908-1021 euro (2001-2250 fl)", `7` = "1022-1134 euro (2251-2500 fl)", `8` = "1135-1361 euro (2501-3000 fl)", `9` = "1362-1588 euro (3001-3500 fl)", `10` = "1589-1815 euro (3501-4000 fl)", `11` = "1816-2042 euro (4001-4500 fl)", `12` = "2043-2269 euro (4501-5000 fl)", `13` = "2270-2495 euro (5001-5500 fl)", `14` = "2496-2722 euro (5501-6000 fl)", `15` = "2723-2949 euro (6001-6500 fl)", `16` = "2950-3176 euro (6501-7000 fl)", `17` = "3177-3403 euro (7001-7500 fl)", `18` = "3404-3630 euro (7501-8000 fl)", `19` = "3631-3857 euro (8001-8500 fl)", `20` = "3858-4084 euro (8501-9000 fl)", `21` = "4085-4311 euro (9001-9500 fl)", `22` = "4312-4537 euro (9501-10000 fl)", `23` = "4538-4991 euro (10001-11000 fl)", `24` = "4992-5445 euro (11001-12000 fl)", `25` = "5446 or more (12000 fl or more)",
  .applies_to_vars = c("inccat"),
  .applies_to_waves = c("K")
)

value_labels(
  `-5` = "na, refused", `-1` = "na, asked", `0` = "no income", `1` = "R only", `2` = "P only", `3` = "R+P in hh", `4` = "R+P out hh", `5` = "R+other in hh", `6` = "total income R+P unknown",
  .applies_to_vars = c("incf"),
  .applies_to_waves = c("K")
)

value_labels(
  `-5` = "na, partner out hh", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "partner has income but R does not report amount",
  .applies_to_vars = c("partinc"),
  .applies_to_waves = c("K")
)

.lasa_fc_017 <- .lasa_finalize_fc("017")

