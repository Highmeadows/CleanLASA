## LASA filecode 182 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_182 <- list(
  variables = data.frame(
    wave = c("3B", "C", "C", "C", "C", "C", "C", "C", "D", "D", "D", "D", "E", "E", "F", "G", "H"),
    variable_name = c(
      "bmconfbed",
      "cmbackp",
      "cmbackpd",
      "cmconfbed",
      "cmconfbeda25",
      "cmconfbedb25",
      "cmconfbedpy",
      "cmthyrover",
      "dmbackp",
      "dmbackpd",
      "dmconfbed",
      "dmthyrover",
      "embackp",
      "embackpd",
      "fmconfbed",
      "gmconfbed",
      "hmconfbed"
    ),
    canonical_name = c(
      "mconfbed",
      "mbackp",
      "mbackpd",
      "mconfbed",
      "mconfbeda25",
      "mconfbedb25",
      "mconfbedpy",
      "mthyrover",
      "mbackp",
      "mbackpd",
      "mconfbed",
      "mthyrover",
      "mbackp",
      "mbackpd",
      "mconfbed",
      "mconfbed",
      "mconfbed"
    ),
    variable_label = c(
      "Confined to bed in last 3 years for 6 weeks or more",
      "Back pain since last interview",
      "Back pain duration",
      "Confined to bed yes/no",
      "Confined to bed: after age 25",
      "Confined to bed: before age 25",
      "Confined to bed: past year",
      "Thyroid gland: overactive",
      "Back pain since last interview",
      "Back pain duration",
      "Confined to bed since last interview",
      "Thyroid gland: overactive",
      "Back pain since last interview",
      "Back pain duration",
      "Confined to bed since last interview",
      "Confined to bed since last interview",
      "Confined to bed since last interview"
    ),
    harmonized_var_label = c(
      "Confined to bed",
      "Back pain since last interview",
      "Back pain duration",
      "Confined to bed",
      "Confined to bed: after age 25",
      "Confined to bed: before age 25",
      "Confined to bed: past year",
      "Thyroid gland: overactive",
      "Back pain since last interview",
      "Back pain duration",
      "Confined to bed",
      "Thyroid gland: overactive",
      "Back pain since last interview",
      "Back pain duration",
      "Confined to bed",
      "Confined to bed",
      "Confined to bed"
    ),
    var_type = c(
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mconfbed = list(
      `3B` = no_yes_not_the_past_year_yes_the_past_year,
      C = no_yes_do_not_know_3,
      D = c(
        `-5` = "na, interview terminated",
        `-1` = "na, asked",
        `1` = "no",
        `2` = "yes, not the past year",
        `3` = "yes, the past year"
      ),
      F = no_yes_not_the_past_year_yes_the_past_year,
      G = no_yes_not_the_past_year_yes_the_past_year,
      H = no_yes_not_the_past_year_yes_the_past_year
    ),
    mbackp = list(
      C = no_yes_5,
      D = no_yes_5,
      E = no_yes
    ),
    mbackpd = list(
      C = less_than_one_week_week_one_month_one_month,
      D = less_than_one_week_week_one_month_one_month,
      E = less_than_one_week_week_one_month_one_month_2
    ),
    mconfbeda25 = list(
      C = not_mentioned_mentioned_221
    ),
    mconfbedb25 = list(
      C = not_mentioned_mentioned_221
    ),
    mconfbedpy = list(
      C = not_mentioned_mentioned_221
    ),
    mthyrover = list(
      C = no_yes_do_not_know_2,
      D = no_yes_do_not_know_2
    )
  ),

  value_labels_harmonized = list(
    mbackp = no_yes_5,
    mbackpd = less_than_one_week_week_one_month_one_month_2,
    mconfbed = no_yes_do_not_know_3,
    mconfbeda25 = not_mentioned_mentioned_221,
    mconfbedb25 = not_mentioned_mentioned_221,
    mconfbedpy = not_mentioned_mentioned_221,
    mthyrover = no_yes_do_not_know_2
  )
)
