## LASA filecode 174 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_174 <- list(
  variables = data.frame(
    wave = c(
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "I",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J",
      "J"
    ),
    variable_name = c(
      "im#sup",
      "imsup",
      "imsup#tp1",
      "imsup1",
      "imsupdesc1",
      "imsupform1",
      "imsupformoth1",
      "imsupmeas1",
      "imsupname1",
      "imsupperiod1",
      "imsupquant1",
      "imsupseas1",
      "imsupseasoth1",
      "jmDnsup",
      "jmDsup",
      "jmDsupbrand1",
      "jmDsupdesc1",
      "jmDsupmeas1",
      "jmDsupname1",
      "jmDsupperiod1",
      "jmDsupquant1",
      "jmDsupseas1",
      "jmDsupseasoth1",
      "jmDsuptp1",
      "jmMVnsup",
      "jmMVsup",
      "jmMVsupbrand1",
      "jmMVsupdesc1",
      "jmMVsupmeas1",
      "jmMVsupname1",
      "jmMVsupperiod1",
      "jmMVsupquant1",
      "jmMVsupseas1",
      "jmMVsupseasoth1",
      "jmMVsuptp1"
    ),
    canonical_name = c(
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
      "msupseasoth1",
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
    ),
    variable_label = c(
      "number of supplements",
      "supplement use",
      "sup. 1: # times a period",
      "sup. 1: type",
      "sup. 1: description package (in Dutch)",
      "sup. 1: dosage form",
      "sup. 1: dosage form other (in Dutch)",
      "sup. 1: measurement",
      "sup. 1: name",
      "sup. 1: period",
      "sup. 1: quantity",
      "sup. 1: use in season",
      "sup. 1: use in season other (in Dutch)",
      "number of vitamin D supplements",
      "vitamin D supplement use",
      "vit D 1: brand",
      "vit D 1: description package (in Dutch)",
      "vit D 1: measurement",
      "vit D 1: name",
      "vit D 1: period",
      "vit D 1: quantity",
      "vit D 1: use in season",
      "vit D 1: use in season other (in Dutch)",
      "vit D 1: times a period",
      "number of multivitamin use",
      "multivitamin supplement use",
      "multiv 1: brand",
      "multiv 1: description package (in Dutch)",
      "multiv 1: measurement",
      "multiv 1: name",
      "multiv 1: period",
      "multiv 1: quantity",
      "multiv 1: use in season",
      "multivit 1: use in season other (in Dutch)",
      "multiv 1: times a period"
    ),
    harmonized_var_label = c(
      "number of supplements",
      "supplement use",
      "supplement 1: number of times per period",
      "supplement 1: type",
      "supplement 1: package description (in Dutch)",
      "supplement 1: dosage form",
      "supplement 1: other dosage form (in Dutch)",
      "supplement 1: measurement unit",
      "supplement 1: name",
      "supplement 1: period",
      "supplement 1: quantity",
      "supplement 1: seasonal use",
      "supplement 1: other seasonal use (in Dutch)",
      "number of vitamin D supplements",
      "vitamin D supplement use",
      "vitamin D supplement 1: brand",
      "vitamin D supplement 1: package description (in Dutch)",
      "vitamin D supplement 1: measurement unit",
      "vitamin D supplement 1: name",
      "vitamin D supplement 1: period",
      "vitamin D supplement 1: quantity",
      "vitamin D supplement 1: seasonal use",
      "vitamin D supplement 1: other seasonal use (in Dutch)",
      "vitamin D supplement 1: number of times per period",
      "number of multivitamin supplements",
      "multivitamin supplement use",
      "multivitamin supplement 1: brand",
      "multivitamin supplement 1: package description (in Dutch)",
      "multivitamin supplement 1: measurement unit",
      "multivitamin supplement 1: name",
      "multivitamin supplement 1: period",
      "multivitamin supplement 1: quantity",
      "multivitamin supplement 1: seasonal use",
      "multivitamin supplement 1: other seasonal use (in Dutch)",
      "multivitamin supplement 1: number of times per period"
    ),
    var_type = c(
      "numeric",
      "categorical",
      "numeric",
      "text",
      "text",
      "categorical",
      "text",
      "categorical",
      "text",
      "categorical",
      "numeric",
      "categorical",
      "text",
      "numeric",
      "categorical",
      "text",
      "text",
      "categorical",
      "text",
      "categorical",
      "numeric",
      "categorical",
      "text",
      "numeric",
      "numeric",
      "categorical",
      "text",
      "text",
      "categorical",
      "text",
      "categorical",
      "numeric",
      "categorical",
      "text",
      "numeric"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    `m#sup` = list(
      I = no_supplements_2
    ),
    msup = list(
      I = no_yes
    ),
    `msup#tp1` = list(
      I = na_see_im_sup_na_asked
    ),
    msupform1 = list(
      I = tablet_capsule_drops_effervescent_tablet_injection_4
    ),
    msupmeas1 = list(
      I = microgramme_milligramme_gramme_milliliter_2
    ),
    msupperiod1 = list(
      I = day_week_month_2
    ),
    msupquant1 = list(
      I = na_see_im_sup_na_asked
    ),
    msupseas1 = list(
      I = c(
        `-2` = "na, see IM#SUP",
        `-1` = "na asked",
        `1` = "year round",
        `2` = "only in winter",
        `3` = "only in spring",
        `4` = "only in summer",
        `5` = "only in fall",
        `6` = "irregular",
        `7` = "other, see imsupseasoth"
      )
    ),
    mDnsup = list(
      J = no_supplements
    ),
    mDsup = list(
      J = no_yes
    ),
    mDsupmeas1 = list(
      J = microgramme_milligramme_gramme_milliliter
    ),
    mDsupperiod1 = list(
      J = day_week_month
    ),
    mDsupquant1 = list(
      J = na_see_jmdsup_jmmvsup_na_asked
    ),
    mDsupseas1 = list(
      J = year_round_only_in_winter_only_in_spring_only_in_summer
    ),
    mDsuptp1 = list(
      J = na_see_jmdsup_jmmvsup_na_asked
    ),
    mMVnsup = list(
      J = no_supplements
    ),
    mMVsup = list(
      J = no_yes
    ),
    mMVsupmeas1 = list(
      J = microgramme_milligramme_gramme_milliliter
    ),
    mMVsupperiod1 = list(
      J = day_week_month
    ),
    mMVsupquant1 = list(
      J = na_see_jmdsup_jmmvsup_na_asked
    ),
    mMVsupseas1 = list(
      J = year_round_only_in_winter_only_in_spring_only_in_summer
    ),
    mMVsuptp1 = list(
      J = na_see_jmdsup_jmmvsup_na_asked
    )
  ),

  value_labels_harmonized = list(
    `m#sup` = no_supplements_2,
    mDnsup = no_supplements,
    mDsup = no_yes,
    mDsupmeas1 = microgramme_milligramme_gramme_milliliter,
    mDsupperiod1 = day_week_month,
    mDsupquant1 = na_see_jmdsup_jmmvsup_na_asked,
    mDsupseas1 = year_round_only_in_winter_only_in_spring_only_in_summer_2,
    mDsuptp1 = na_see_jmdsup_jmmvsup_na_asked,
    mMVnsup = no_supplements,
    mMVsup = no_yes,
    mMVsupmeas1 = microgramme_milligramme_gramme_milliliter,
    mMVsupperiod1 = day_week_month,
    mMVsupquant1 = na_see_jmdsup_jmmvsup_na_asked,
    mMVsupseas1 = year_round_only_in_winter_only_in_spring_only_in_summer_2,
    mMVsuptp1 = na_see_jmdsup_jmmvsup_na_asked,
    msup = no_yes,
    `msup#tp1` = na_see_im_sup_na_asked,
    msupform1 = tablet_capsule_drops_effervescent_tablet_injection_4,
    msupmeas1 = microgramme_milligramme_gramme_milliliter_2,
    msupperiod1 = day_week_month_2,
    msupquant1 = na_see_im_sup_na_asked,
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
    )
  )
)
