## LASA filecode 217 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  amount = "Monthly total household income",
  pamou01 = "Partner: income amount - employment",
  pamou02 = "Partner: income amount - savings, dividend, property",
  pamou03 = "Partner: income amount - profit from ventures",
  pamou04 = "Partner: income amount - pension, early retirement, annuity",
  pamou05 = "Partner: income amount - Old age pension or AWW",
  pamou06 = "Partner: income amount - social security (ABW), RWW, IOAW, IOAZ",
  pamou07 = "Partner: income amount - Bonuslaw",
  pamou08 = "Partner: income amount - Disability benefit: ABP, AAW, WAO",
  pamou09 = "Partner: income amount - Reduced pay, Unemployment benefit",
  pamou10 = "Partner: income amount - other social security",
  pamou11 = "Partner: income amount - maintenance allowance",
  pamou12 = "Partner: income amount - board and lodging",
  pamou14 = "Partner: income amount - War pension (WUV/St 40-45)",
  pamount = "Partner: monthly total income",
  pinc01 = "Partner: income source - employment",
  pinc02 = "Partner: income source - savings, dividend, property",
  pinc03 = "Partner: income source - profit from ventures",
  pinc04 = "Partner: income source - pension, early retirement, annuity",
  pinc05 = "Partner: income source - Old age pension or AWW",
  pinc06 = "Partner: income source - social security (ABW), RWW, IOAW, IOAZ",
  pinc07 = "Partner: income source - Bonuslaw",
  pinc08 = "Partner: income source - Disability benefit: ABP, AAW, WAO",
  pinc09 = "Partner: income source - unemployment benefit (WW)",
  pinc10 = "Partner: income source - other social security",
  pinc11 = "Partner: income source - maintenance allowance",
  pinc12 = "Partner: income source - board and lodging",
  pinc14 = "Partner: income source - War pension (WUV/St 40-45)",
  ramou01 = "R: income amount - employment",
  ramou02 = "R: income amount - savings, dividend, property",
  ramou03 = "R: income amount - profit from ventures",
  ramou04 = "R: income amount - pension, early retirement, annuity",
  ramou05 = "R: income amount - Old age pension or AWW",
  ramou06 = "R: income amount - social security (ABW), RWW, IOAW, IOAZ",
  ramou07 = "R: income amount - Bonuslaw",
  ramou08 = "R: income amount - Disability benefit: ABP, AAW, WAO",
  ramou09 = "R: income amount - Reduced pay, Unemployment benefit",
  ramou10 = "R: income amount - other social security",
  ramou11 = "R: income amount - maintenance allowance",
  ramou12 = "R: income amount - board and lodging",
  ramou14 = "R: income amount - War pension (WUV/St 40-45)",
  ramount = "R: monthly total income",
  rinc01 = "R: income source - employment",
  rinc02 = "R: income source - savings, dividend, property",
  rinc03 = "R: income source - profit from ventures",
  rinc04 = "R: income source - pension, early retirement, annuity",
  rinc05 = "R: income source - Old age pension or AWW",
  rinc06 = "R: income source - social security (ABW), RWW, IOAW, IOAZ",
  rinc07 = "R: income source - Bonuslaw",
  rinc08 = "R: income source - Disability benefit: ABP, AAW, WAO",
  rinc09 = "R: income source - unemployment benefit (WW)",
  rinc10 = "R: income source - other social security",
  rinc11 = "R: income source - maintenance allowance",
  rinc12 = "R: income source - board and lodging",
  rinc14 = "R: income source - War pension (WUV/St 40-45)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "amount",
    "pamou01",
    "pamou02",
    "pamou03",
    "pamou04",
    "pamou05",
    "pamou06",
    "pamou07",
    "pamou08",
    "pamou09",
    "pamou10",
    "pamou11",
    "pamou12",
    "pamou14",
    "pamount",
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
    "pinc14",
    "ramou01",
    "ramou02",
    "ramou03",
    "ramou04",
    "ramou05",
    "ramou06",
    "ramou07",
    "ramou08",
    "ramou09",
    "ramou10",
    "ramou11",
    "ramou12",
    "ramou14",
    "ramount",
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
    "rinc14"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    amount = "Monthly total income household",
    pamou01 = "Partner: amount employment",
    pamou02 = "Partner: amount savings, dividend, property",
    pamou03 = "Partner: amount profit from ventures",
    pamou04 = "Partner: amount pension, early retirement, annuity",
    pamou05 = "Partner: amount Old age pension or AWW",
    pamou06 = "Partner: amount social security (ABW), RWW, IOAW, IOAZ",
    pamou07 = "Partner: amount Bonuslaw",
    pamou08 = "Partner: amount Disability benefit: ABP, AAW, WAO",
    pamou09 = "Partner: amount Reduced pay, Unemployment benefit",
    pamou10 = "Partner: amount other social security",
    pamou11 = "Partner: amount maintenance allowance",
    pamou12 = "Partner: amount board and lodging",
    pamou14 = "Partner: amount War pension (WUV/St 40-45)",
    pinc01 = "Partner: income from employment",
    pinc02 = "Partner: income from savings, dividend, property",
    pinc03 = "Partner: income from profit from ventures",
    pinc04 = "Partner: income from pension, early retirement, annuity",
    pinc05 = "Partner: income from Old age pension or AWW",
    pinc06 = "Partner: income from social security (ABW), RWW, IOAW, IOAZ",
    pinc07 = "Partner: income from Bonuslaw",
    pinc08 = "Partner: income from Disability benefit: ABP, AAW, WAO",
    pinc09 = "Partner: income from unemployment benefit (WW)",
    pinc10 = "Partner: income from other social security",
    pinc11 = "Partner: income from maintenance allowance",
    pinc12 = "Partner: income from board and lodging",
    pinc14 = "Partner: income from War pension (WUV/St 40-45)",
    ramou01 = "R: amount employment",
    ramou02 = "R: amount savings, dividend, property",
    ramou03 = "R: amount profit from ventures",
    ramou04 = "R: amount pension, early retirement, annuity",
    ramou05 = "R: amount Old age pension or AWW",
    ramou06 = "R: amount social security (ABW), RWW, IOAW, IOAZ",
    ramou07 = "R: amount Bonuslaw",
    ramou08 = "R: amount Disability benefit: ABP, AAW, WAO",
    ramou09 = "R: amount Reduced pay, Unemployment benefit",
    ramou10 = "R: amount other social security",
    ramou11 = "R: amount maintenance allowance",
    ramou12 = "R: amount board and lodging",
    ramou14 = "R: amount War pension (WUV/St 40-45)",
    rinc01 = "R: income from employment",
    rinc02 = "R: income from savings, dividend, property",
    rinc03 = "R: income from profit from ventures",
    rinc04 = "R: income from pension, early retirement, annuity",
    rinc05 = "R: income from Old age pension or AWW",
    rinc06 = "R: income from social security (ABW), RWW, IOAW, IOAZ",
    rinc07 = "R: income from Bonuslaw",
    rinc08 = "R: income from Disability benefit: ABP, AAW, WAO",
    rinc09 = "R: income from unemployment benefit (WW)",
    rinc10 = "R: income from other social security",
    rinc11 = "R: income from maintenance allowance",
    rinc12 = "R: income from board and lodging",
    rinc14 = "R: income from War pension (WUV/St 40-45)"
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
  amount = c(
    `-5` = "na, refused",
    default_missing_labels[c("-2", "-1")]
  ),
  pamou01 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC01",
    default_missing_labels[c("-1")]
  ),
  pamou02 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC02",
    default_missing_labels[c("-1")]
  ),
  pamou03 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC03",
    default_missing_labels[c("-1")]
  ),
  pamou04 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC04",
    default_missing_labels[c("-1")]
  ),
  pamou05 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC05",
    default_missing_labels[c("-1")]
  ),
  pamou06 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC06",
    default_missing_labels[c("-1")]
  ),
  pamou07 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC07",
    default_missing_labels[c("-1")]
  ),
  pamou08 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC08",
    default_missing_labels[c("-1")]
  ),
  pamou09 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC09",
    default_missing_labels[c("-1")]
  ),
  pamou10 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC10",
    default_missing_labels[c("-1")]
  ),
  pamou11 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC11",
    default_missing_labels[c("-1")]
  ),
  pamou12 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC12",
    default_missing_labels[c("-1")]
  ),
  pamou14 = c(
    `-5` = "na, refused",
    `-2` = "na, see PINC14",
    default_missing_labels[c("-1")]
  ),
  pamount = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")]
  ),
  pinc01 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc02 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc03 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc04 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc05 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc06 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc07 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc08 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc09 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc10 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc11 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc12 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  pinc14 = c(
    `-5` = "na, refused",
    `-2` = "na, see PARTINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  ramou01 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC01",
    default_missing_labels[c("-1")]
  ),
  ramou02 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC02",
    default_missing_labels[c("-1")]
  ),
  ramou03 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC03",
    default_missing_labels[c("-1")]
  ),
  ramou04 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC04",
    default_missing_labels[c("-1")]
  ),
  ramou05 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC05",
    default_missing_labels[c("-1")]
  ),
  ramou06 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC06",
    default_missing_labels[c("-1")]
  ),
  ramou07 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC07",
    default_missing_labels[c("-1")]
  ),
  ramou08 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC08",
    default_missing_labels[c("-1")]
  ),
  ramou09 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC09",
    default_missing_labels[c("-1")]
  ),
  ramou10 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC10",
    default_missing_labels[c("-1")]
  ),
  ramou11 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC11",
    default_missing_labels[c("-1")]
  ),
  ramou12 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC12",
    default_missing_labels[c("-1")]
  ),
  ramou14 = c(
    `-5` = "na, refused",
    `-2` = "na, see RINC14",
    default_missing_labels[c("-1")]
  ),
  ramount = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc01 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc02 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc03 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc04 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc05 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc06 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc07 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc08 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc09 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc10 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc11 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc12 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  rinc14 = c(
    `-5` = "na, refused",
    `-2` = "na, see RESPINC in LASA017",
    default_missing_labels[c("-1")],
    `0` = "no",
    default_answer_labels[c("1")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    pamou01 = .replace_labels(
    standardized_value_labels$pamou01,
    `-2` = "na, see BPINC01"
  ),
    pamou02 = .replace_labels(
    standardized_value_labels$pamou02,
    `-2` = "na, see BPINC02"
  ),
    pamou03 = .replace_labels(
    standardized_value_labels$pamou03,
    `-2` = "na, see BPINC03"
  ),
    pamou04 = .replace_labels(
    standardized_value_labels$pamou04,
    `-2` = "na, see BPINC04"
  ),
    pamou05 = .replace_labels(
    standardized_value_labels$pamou05,
    `-2` = "na, see BPINC05"
  ),
    pamou06 = .replace_labels(
    standardized_value_labels$pamou06,
    `-2` = "na, see BPINC06"
  ),
    pamou07 = .replace_labels(
    standardized_value_labels$pamou07,
    `-2` = "na, see BPINC07"
  ),
    pamou08 = .replace_labels(
    standardized_value_labels$pamou08,
    `-2` = "na, see BPINC08"
  ),
    pamou09 = .replace_labels(
    standardized_value_labels$pamou09,
    `-2` = "na, see BPINC09"
  ),
    pamou10 = .replace_labels(
    standardized_value_labels$pamou10,
    `-2` = "na, see BPINC10"
  ),
    pamou11 = .replace_labels(
    standardized_value_labels$pamou11,
    `-2` = "na, see BPINC11"
  ),
    pamou12 = .replace_labels(
    standardized_value_labels$pamou12,
    `-2` = "na, see BPINC12"
  ),
    pamou14 = .replace_labels(
    standardized_value_labels$pamou14,
    `-2` = "na, see BPINC14"
  ),
    pamount = .replace_labels(
    standardized_value_labels$pamount,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc01 = .replace_labels(
    standardized_value_labels$pinc01,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc02 = .replace_labels(
    standardized_value_labels$pinc02,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc03 = .replace_labels(
    standardized_value_labels$pinc03,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc04 = .replace_labels(
    standardized_value_labels$pinc04,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc05 = .replace_labels(
    standardized_value_labels$pinc05,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc06 = .replace_labels(
    standardized_value_labels$pinc06,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc07 = .replace_labels(
    standardized_value_labels$pinc07,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc08 = .replace_labels(
    standardized_value_labels$pinc08,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc09 = .replace_labels(
    standardized_value_labels$pinc09,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc10 = .replace_labels(
    standardized_value_labels$pinc10,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc11 = .replace_labels(
    standardized_value_labels$pinc11,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc12 = .replace_labels(
    standardized_value_labels$pinc12,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    pinc14 = .replace_labels(
    standardized_value_labels$pinc14,
    `-2` = "na, see BPARTINC in LASAB017"
  ),
    ramou01 = .replace_labels(
    standardized_value_labels$ramou01,
    `-2` = "na, see BRINC01"
  ),
    ramou02 = .replace_labels(
    standardized_value_labels$ramou02,
    `-2` = "na, see BRINC02"
  ),
    ramou03 = .replace_labels(
    standardized_value_labels$ramou03,
    `-2` = "na, see BRINC03"
  ),
    ramou04 = .replace_labels(
    standardized_value_labels$ramou04,
    `-2` = "na, see BRINC04"
  ),
    ramou05 = .replace_labels(
    standardized_value_labels$ramou05,
    `-2` = "na, see BRINC05"
  ),
    ramou06 = .replace_labels(
    standardized_value_labels$ramou06,
    `-2` = "na, see BRINC06"
  ),
    ramou07 = .replace_labels(
    standardized_value_labels$ramou07,
    `-2` = "na, see BRINC07"
  ),
    ramou08 = .replace_labels(
    standardized_value_labels$ramou08,
    `-2` = "na, see BRINC08"
  ),
    ramou09 = .replace_labels(
    standardized_value_labels$ramou09,
    `-2` = "na, see BRINC09"
  ),
    ramou10 = .replace_labels(
    standardized_value_labels$ramou10,
    `-2` = "na, see BRINC10"
  ),
    ramou11 = .replace_labels(
    standardized_value_labels$ramou11,
    `-2` = "na, see BRINC11"
  ),
    ramou12 = .replace_labels(
    standardized_value_labels$ramou12,
    `-2` = "na, see BRINC12"
  ),
    ramou14 = .replace_labels(
    standardized_value_labels$ramou14,
    `-2` = "na, see BRINC14"
  ),
    ramount = .replace_labels(
    standardized_value_labels$ramount,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc01 = .replace_labels(
    standardized_value_labels$rinc01,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc02 = .replace_labels(
    standardized_value_labels$rinc02,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc03 = .replace_labels(
    standardized_value_labels$rinc03,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc04 = .replace_labels(
    standardized_value_labels$rinc04,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc05 = .replace_labels(
    standardized_value_labels$rinc05,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc06 = .replace_labels(
    standardized_value_labels$rinc06,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc07 = .replace_labels(
    standardized_value_labels$rinc07,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc08 = .replace_labels(
    standardized_value_labels$rinc08,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc09 = .replace_labels(
    standardized_value_labels$rinc09,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc10 = .replace_labels(
    standardized_value_labels$rinc10,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc11 = .replace_labels(
    standardized_value_labels$rinc11,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc12 = .replace_labels(
    standardized_value_labels$rinc12,
    `-2` = "na, see BRESPINC in LASAB017"
  ),
    rinc14 = .replace_labels(
    standardized_value_labels$rinc14,
    `-2` = "na, see BRESPINC in LASAB017"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  amount = "numeric",
  pamou01 = "numeric",
  pamou02 = "numeric",
  pamou03 = "numeric",
  pamou04 = "numeric",
  pamou05 = "numeric",
  pamou06 = "numeric",
  pamou07 = "numeric",
  pamou08 = "numeric",
  pamou09 = "numeric",
  pamou10 = "numeric",
  pamou11 = "numeric",
  pamou12 = "numeric",
  pamou14 = "numeric",
  pamount = "numeric",
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
  pinc14 = "categorical",
  ramou01 = "numeric",
  ramou02 = "numeric",
  ramou03 = "numeric",
  ramou04 = "numeric",
  ramou05 = "numeric",
  ramou06 = "numeric",
  ramou07 = "numeric",
  ramou08 = "numeric",
  ramou09 = "numeric",
  ramou10 = "numeric",
  ramou11 = "numeric",
  ramou12 = "numeric",
  ramou14 = "numeric",
  ramount = "categorical",
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
  rinc14 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "217", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "217", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "217", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "217", waves = .lasa_wave_rows())
)

.lasa_fc_217 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

