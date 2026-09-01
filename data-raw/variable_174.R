## LASA filecode 174 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  msupseasoth1 = "supplement 1: other seasonal use (in Dutch)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "m#sup", "msup",
  .applies_to_waves = c("I")
)

variable_labels(
  "mDnsup", "mDsup", "mMVsup",
  .applies_to_waves = c("J")
)

variable_labels(
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
  msupseasoth1 = "sup. 1: use in season other (in Dutch)",
  .applies_to_waves = c("I")
)

variable_labels(
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
  mMVsuptp1 = "multiv 1: times a period",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-2` = "na, see IM#SUP",
  .applies_to_vars = c("msup#tp1", "msupform1", "msupmeas1", "msupperiod1", "msupquant1", "msupseas1"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-2` = "na, see jmDsup/jmMVsup",
  .applies_to_vars = c("mDnsup", "mDsupmeas1", "mDsupperiod1", "mDsupquant1", "mDsupseas1", "mDsuptp1", "mMVnsup", "mMVsupmeas1", "mMVsupperiod1", "mMVsupquant1", "mMVsupseas1", "mMVsuptp1"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-2` = "na, see IMSUP", `0` = "no supplements",
  .applies_to_vars = c("m#sup"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `0` = "no supplements",
  .applies_to_vars = c("mDnsup", "mMVnsup"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mDsup", "mMVsup"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "microgramme", `2` = "milligramme", `3` = "gramme", `4` = "milliliter", `5` = "unit per milliliter", `6` = "percentage",
  .applies_to_vars = c("mDsupmeas1", "mMVsupmeas1"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month",
  .applies_to_vars = c("mDsupperiod1", "mMVsupperiod1"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mDsupquant1", "mDsuptp1", "mMVsupquant1", "mMVsuptp1"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "year round", `2` = "only in winter", `3` = "only in spring", `4` = "only in summer", `5` = "only in fall", `6` = "irregular", `7` = "other, see jmDsupseasoth/jmMVsupseasoth",
  .applies_to_vars = c("mDsupseas1", "mMVsupseas1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msup"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("msup#tp1", "msupquant1"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "tablet", `2` = "capsule", `3` = "drops", `4` = "effervescent tablet", `5` = "injection", `6` = "inhaler", `7` = "powder", `8` = "ointment", `9` = "plaster", `10` = "suppository", `11` = "spray", `12` = "other form, see imsupformoth",
  .applies_to_vars = c("msupform1"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "microgramme", `2` = "milligramme", `3` = "gramme", `4` = "milliliter", `5` = "unit per milliliter", `6` = "percentage",
  .applies_to_vars = c("msupmeas1"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month",
  .applies_to_vars = c("msupperiod1"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "year round", `2` = "only in winter", `3` = "only in spring", `4` = "only in summer", `5` = "only in fall", `6` = "irregular", `7` = "other, see imsupseasoth",
  .applies_to_vars = c("msupseas1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na asked", `1` = "year round", `2` = "only in winter", `3` = "only in spring", `4` = "only in summer", `5` = "only in fall", `6` = "irregular", `7` = "other, see imsupseasoth",
  .applies_to_vars = c("msupseas1"),
  .applies_to_waves = c("I")
)

value_labels(
  `-1` = "na asked", `1` = "year round", `2` = "only in winter", `3` = "only in spring", `4` = "only in summer", `5` = "only in fall", `6` = "irregular", `7` = "other, see jmDsupseasoth/jmMVsupseasoth",
  .applies_to_vars = c("mDsupseas1", "mMVsupseas1"),
  .applies_to_waves = c("J")
)

.lasa_fc_174 <- .lasa_finalize_fc("174")

