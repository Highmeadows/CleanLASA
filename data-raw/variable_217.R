## LASA filecode 217 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  rinc14 = "R: income source - War pension (WUV/St 40-45)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "pamount", "ramount",
  .applies_to_waves = c("B")
)

variable_labels(
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
  rinc14 = "R: income from War pension (WUV/St 40-45)",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-5` = "na, refused", `-1` = "na, asked",
  .applies_to_vars = c("amount", "pamou01", "pamou02", "pamou03", "pamou04", "pamou05", "pamou06", "pamou07", "pamou08", "pamou09", "pamou10", "pamou11", "pamou12", "pamou14", "pamount", "pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc14", "ramou01", "ramou02", "ramou03", "ramou04", "ramou05", "ramou06", "ramou07", "ramou08", "ramou09", "ramou10", "ramou11", "ramou12", "ramou14", "ramount", "rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc14"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see PARTINC in LASA017",
  .applies_to_vars = c("pamount", "pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RESPINC in LASA017",
  .applies_to_vars = c("ramount", "rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("amount"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see PINC01",
  .applies_to_vars = c("pamou01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC02",
  .applies_to_vars = c("pamou02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC03",
  .applies_to_vars = c("pamou03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC04",
  .applies_to_vars = c("pamou04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC05",
  .applies_to_vars = c("pamou05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC06",
  .applies_to_vars = c("pamou06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC07",
  .applies_to_vars = c("pamou07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC08",
  .applies_to_vars = c("pamou08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC09",
  .applies_to_vars = c("pamou09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC10",
  .applies_to_vars = c("pamou10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC11",
  .applies_to_vars = c("pamou11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC12",
  .applies_to_vars = c("pamou12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see PINC14",
  .applies_to_vars = c("pamou14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc14", "ramount", "rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc14"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see RINC01",
  .applies_to_vars = c("ramou01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC02",
  .applies_to_vars = c("ramou02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC03",
  .applies_to_vars = c("ramou03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC04",
  .applies_to_vars = c("ramou04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC05",
  .applies_to_vars = c("ramou05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC06",
  .applies_to_vars = c("ramou06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC07",
  .applies_to_vars = c("ramou07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC08",
  .applies_to_vars = c("ramou08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC09",
  .applies_to_vars = c("ramou09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC10",
  .applies_to_vars = c("ramou10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC11",
  .applies_to_vars = c("ramou11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC12",
  .applies_to_vars = c("ramou12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RINC14",
  .applies_to_vars = c("ramou14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BPARTINC in LASAB017",
  .applies_to_vars = c("pamount", "pinc01", "pinc02", "pinc03", "pinc04", "pinc05", "pinc06", "pinc07", "pinc08", "pinc09", "pinc10", "pinc11", "pinc12", "pinc14"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRESPINC in LASAB017",
  .applies_to_vars = c("ramount", "rinc01", "rinc02", "rinc03", "rinc04", "rinc05", "rinc06", "rinc07", "rinc08", "rinc09", "rinc10", "rinc11", "rinc12", "rinc14"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC01",
  .applies_to_vars = c("pamou01"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC02",
  .applies_to_vars = c("pamou02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC03",
  .applies_to_vars = c("pamou03"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC04",
  .applies_to_vars = c("pamou04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC05",
  .applies_to_vars = c("pamou05"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC06",
  .applies_to_vars = c("pamou06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC07",
  .applies_to_vars = c("pamou07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC08",
  .applies_to_vars = c("pamou08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC09",
  .applies_to_vars = c("pamou09"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC10",
  .applies_to_vars = c("pamou10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC11",
  .applies_to_vars = c("pamou11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC12",
  .applies_to_vars = c("pamou12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BPINC14",
  .applies_to_vars = c("pamou14"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC01",
  .applies_to_vars = c("ramou01"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC02",
  .applies_to_vars = c("ramou02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC03",
  .applies_to_vars = c("ramou03"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC04",
  .applies_to_vars = c("ramou04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC05",
  .applies_to_vars = c("ramou05"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC06",
  .applies_to_vars = c("ramou06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC07",
  .applies_to_vars = c("ramou07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC08",
  .applies_to_vars = c("ramou08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC09",
  .applies_to_vars = c("ramou09"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC10",
  .applies_to_vars = c("ramou10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC11",
  .applies_to_vars = c("ramou11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC12",
  .applies_to_vars = c("ramou12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRINC14",
  .applies_to_vars = c("ramou14"),
  .applies_to_waves = c("B")
)

.lasa_fc_217 <- .lasa_finalize_fc("217")

