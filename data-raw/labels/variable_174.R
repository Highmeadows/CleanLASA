## LASA filecode 174 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  `m#sup` = "number of supplements",
  mDnsup = "number of vitamin D supplements",
  mDsup = "vitamin D supplement use",
  mDsupbrand1 = "vitamin D supplement 1: brand",
  mDsupdesc1 = "vitamin D supplement 1: package description (in Dutch)",
  mDsupmeas1 = "vitamin D supplement 1: measurement unit",
  mDsupname1 = "vitamin D supplement 1: name",
  mDsupperiod1 = "vitamin D supplement 1: period",
  mDsupquant1 = "vitamin D supplement 1: quantity",
  mDsupseas1 = "vitamin D supplement 1: seasonal use",
  mDsupseasoth1 = "vitamin D supplement 1: other seasonal use (in Dutch)",
  mDsuptp1 = "vitamin D supplement 1: number of times per period",
  mMVnsup = "number of multivitamin supplements",
  mMVsup = "multivitamin supplement use",
  mMVsupbrand1 = "multivitamin supplement 1: brand",
  mMVsupdesc1 = "multivitamin supplement 1: package description (in Dutch)",
  mMVsupmeas1 = "multivitamin supplement 1: measurement unit",
  mMVsupname1 = "multivitamin supplement 1: name",
  mMVsupperiod1 = "multivitamin supplement 1: period",
  mMVsupquant1 = "multivitamin supplement 1: quantity",
  mMVsupseas1 = "multivitamin supplement 1: seasonal use",
  mMVsupseasoth1 = "multivitamin supplement 1: other seasonal use (in Dutch)",
  mMVsuptp1 = "multivitamin supplement 1: number of times per period",
  msup = "supplement use",
  `msup#tp1` = "supplement 1: number of times per period",
  msup1 = "supplement 1: type",
  msupdesc1 = "supplement 1: package description (in Dutch)",
  msupform1 = "supplement 1: dosage form",
  msupformoth1 = "supplement 1: other dosage form (in Dutch)",
  msupmeas1 = "supplement 1: measurement unit",
  msupname1 = "supplement 1: name",
  msupperiod1 = "supplement 1: period",
  msupquant1 = "supplement 1: quantity",
  msupseas1 = "supplement 1: seasonal use",
  msupseasoth1 = "supplement 1: other seasonal use (in Dutch)"
)

variable_labels_list <- list(
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "m#sup",
    "msup",
    "msup#tp1",
    "msup1",
    "msupdesc1",
    "msupform1",
    "msupformoth1",
    "msupmeas1",
    "msupname1",
    "msupperiod1",
    "msupquant1",
    "msupseas1",
    "msupseasoth1"
  )],
    `msup#tp1` = "sup. 1: # times a period",
    msup1 = "sup. 1: type",
    msupdesc1 = "sup. 1: description package (in Dutch)",
    msupform1 = "sup. 1: dosage form",
    msupformoth1 = "sup. 1: dosage form other (in Dutch)",
    msupmeas1 = "sup. 1: measurement",
    msupname1 = "sup. 1: name",
    msupperiod1 = "sup. 1: period",
    msupquant1 = "sup. 1: quantity",
    msupseas1 = "sup. 1: use in season",
    msupseasoth1 = "sup. 1: use in season other (in Dutch)"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "mDnsup",
    "mDsup",
    "mDsupbrand1",
    "mDsupdesc1",
    "mDsupmeas1",
    "mDsupname1",
    "mDsupperiod1",
    "mDsupquant1",
    "mDsupseas1",
    "mDsupseasoth1",
    "mDsuptp1",
    "mMVnsup",
    "mMVsup",
    "mMVsupbrand1",
    "mMVsupdesc1",
    "mMVsupmeas1",
    "mMVsupname1",
    "mMVsupperiod1",
    "mMVsupquant1",
    "mMVsupseas1",
    "mMVsupseasoth1",
    "mMVsuptp1"
  )],
    mDsupbrand1 = "vit D 1: brand",
    mDsupdesc1 = "vit D 1: description package (in Dutch)",
    mDsupmeas1 = "vit D 1: measurement",
    mDsupname1 = "vit D 1: name",
    mDsupperiod1 = "vit D 1: period",
    mDsupquant1 = "vit D 1: quantity",
    mDsupseas1 = "vit D 1: use in season",
    mDsupseasoth1 = "vit D 1: use in season other (in Dutch)",
    mDsuptp1 = "vit D 1: times a period",
    mMVnsup = "number of multivitamin use",
    mMVsupbrand1 = "multiv 1: brand",
    mMVsupdesc1 = "multiv 1: description package (in Dutch)",
    mMVsupmeas1 = "multiv 1: measurement",
    mMVsupname1 = "multiv 1: name",
    mMVsupperiod1 = "multiv 1: period",
    mMVsupquant1 = "multiv 1: quantity",
    mMVsupseas1 = "multiv 1: use in season",
    mMVsupseasoth1 = "multivit 1: use in season other (in Dutch)",
    mMVsuptp1 = "multiv 1: times a period"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  `m#sup` = c(`-2` = "na, see IMSUP", `0` = "no supplements"),
  mDnsup = c(`-2` = "na, see jmDsup/jmMVsup", `0` = "no supplements"),
  mDsup = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  mDsupbrand1 = stats::setNames(character(0), character(0)),
  mDsupdesc1 = stats::setNames(character(0), character(0)),
  mDsupmeas1 = c(
    `-2` = "na, see jmDsup/jmMVsup",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "milliliter",
    `5` = "unit per milliliter",
    `6` = "percentage"
  ),
  mDsupname1 = stats::setNames(character(0), character(0)),
  mDsupperiod1 = c(`-2` = "na, see jmDsup/jmMVsup", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month"),
  mDsupquant1 = c(`-2` = "na, see jmDsup/jmMVsup", `-1` = "na, asked"),
  mDsupseas1 = c(
    `-2` = "na, see jmDsup/jmMVsup",
    `-1` = "na, asked",
    `1` = "year round",
    `2` = "only in winter",
    `3` = "only in spring",
    `4` = "only in summer",
    `5` = "only in fall",
    `6` = "irregular",
    `7` = "other, see jmDsupseasoth/jmMVsupseasoth"
  ),
  mDsupseasoth1 = stats::setNames(character(0), character(0)),
  mDsuptp1 = c(`-2` = "na, see jmDsup/jmMVsup", `-1` = "na, asked"),
  mMVnsup = c(`-2` = "na, see jmDsup/jmMVsup", `0` = "no supplements"),
  mMVsup = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  mMVsupbrand1 = stats::setNames(character(0), character(0)),
  mMVsupdesc1 = stats::setNames(character(0), character(0)),
  mMVsupmeas1 = c(
    `-2` = "na, see jmDsup/jmMVsup",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "milliliter",
    `5` = "unit per milliliter",
    `6` = "percentage"
  ),
  mMVsupname1 = stats::setNames(character(0), character(0)),
  mMVsupperiod1 = c(`-2` = "na, see jmDsup/jmMVsup", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month"),
  mMVsupquant1 = c(`-2` = "na, see jmDsup/jmMVsup", `-1` = "na, asked"),
  mMVsupseas1 = c(
    `-2` = "na, see jmDsup/jmMVsup",
    `-1` = "na, asked",
    `1` = "year round",
    `2` = "only in winter",
    `3` = "only in spring",
    `4` = "only in summer",
    `5` = "only in fall",
    `6` = "irregular",
    `7` = "other, see jmDsupseasoth/jmMVsupseasoth"
  ),
  mMVsupseasoth1 = stats::setNames(character(0), character(0)),
  mMVsuptp1 = c(`-2` = "na, see jmDsup/jmMVsup", `-1` = "na, asked"),
  msup = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  `msup#tp1` = c(`-2` = "na, see IM#SUP", `-1` = "na, asked"),
  msup1 = stats::setNames(character(0), character(0)),
  msupdesc1 = stats::setNames(character(0), character(0)),
  msupform1 = c(
    `-2` = "na, see IM#SUP",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "plaster",
    `10` = "suppository",
    `11` = "spray",
    `12` = "other form, see imsupformoth"
  ),
  msupformoth1 = stats::setNames(character(0), character(0)),
  msupmeas1 = c(
    `-2` = "na, see IM#SUP",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "milliliter",
    `5` = "unit per milliliter",
    `6` = "percentage"
  ),
  msupname1 = stats::setNames(character(0), character(0)),
  msupperiod1 = c(`-2` = "na, see IM#SUP", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month"),
  msupquant1 = c(`-2` = "na, see IM#SUP", `-1` = "na, asked"),
  msupseas1 = c(
    `-2` = "na, see IM#SUP",
    `-1` = "na, asked",
    `1` = "year round",
    `2` = "only in winter",
    `3` = "only in spring",
    `4` = "only in summer",
    `5` = "only in fall",
    `6` = "irregular",
    `7` = "other, see imsupseasoth"
  ),
  msupseasoth1 = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "m#sup",
    "msup",
    "msup#tp1",
    "msupform1",
    "msupmeas1",
    "msupperiod1",
    "msupquant1",
    "msupseas1"
  )],
    msupseas1 = .replace_labels(
    standardized_value_labels$msupseas1,
    `-1` = "na asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "mDnsup",
    "mDsup",
    "mDsupmeas1",
    "mDsupperiod1",
    "mDsupquant1",
    "mDsupseas1",
    "mDsuptp1",
    "mMVnsup",
    "mMVsup",
    "mMVsupmeas1",
    "mMVsupperiod1",
    "mMVsupquant1",
    "mMVsupseas1",
    "mMVsuptp1"
  )],
    mDsupseas1 = .replace_labels(
    standardized_value_labels$mDsupseas1,
    `-1` = "na asked"
  ),
    mMVsupseas1 = .replace_labels(
    standardized_value_labels$mMVsupseas1,
    `-1` = "na asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  `m#sup` = "numeric",
  mDnsup = "numeric",
  mDsup = "categorical",
  mDsupbrand1 = "text",
  mDsupdesc1 = "text",
  mDsupmeas1 = "categorical",
  mDsupname1 = "text",
  mDsupperiod1 = "categorical",
  mDsupquant1 = "numeric",
  mDsupseas1 = "categorical",
  mDsupseasoth1 = "text",
  mDsuptp1 = "numeric",
  mMVnsup = "numeric",
  mMVsup = "categorical",
  mMVsupbrand1 = "text",
  mMVsupdesc1 = "text",
  mMVsupmeas1 = "categorical",
  mMVsupname1 = "text",
  mMVsupperiod1 = "categorical",
  mMVsupquant1 = "numeric",
  mMVsupseas1 = "categorical",
  mMVsupseasoth1 = "text",
  mMVsuptp1 = "numeric",
  msup = "categorical",
  `msup#tp1` = "numeric",
  msup1 = "text",
  msupdesc1 = "text",
  msupform1 = "categorical",
  msupformoth1 = "text",
  msupmeas1 = "categorical",
  msupname1 = "text",
  msupperiod1 = "categorical",
  msupquant1 = "numeric",
  msupseas1 = "categorical",
  msupseasoth1 = "text"
)

.lasa_fc_174 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "174", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "174", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "174", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "174", waves = .lasa_wave_rows())
)
