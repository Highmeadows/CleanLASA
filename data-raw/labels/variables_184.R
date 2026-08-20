## LASA filecode 184 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_184 <- list(
  variables = data.frame(
    wave = c(
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D"
    ),
    variable_name = c(
      "cmdiet",
      "cmdiethcal",
      "cmdietlcal",
      "cmdietlchol",
      "cmdietlsalt",
      "cmdietoth",
      "cmdietsugf",
      "cmdietveg",
      "cmmilka50y",
      "cmmilkb25y",
      "cmmilkb50y",
      "cmmilkhchs",
      "cmmilkmlk",
      "cmmilkschs",
      "cmmilkvar",
      "cmmilkyght",
      "dmdiet",
      "dmdietlcal",
      "dmdietlchol",
      "dmdietlsalt",
      "dmdietsugf",
      "dmdietveg"
    ),
    canonical_name = c(
      "mdiet",
      "mdiethcal",
      "mdietlcal",
      "mdietlchol",
      "mdietlsalt",
      "mdietoth",
      "mdietsugf",
      "mdietveg",
      "mmilka50y",
      "mmilkb25y",
      "mmilkb50y",
      "mmilkhchs",
      "mmilkmlk",
      "mmilkschs",
      "mmilkvar",
      "mmilkyght",
      "mdiet",
      "mdietlcal",
      "mdietlchol",
      "mdietlsalt",
      "mdietsugf",
      "mdietveg"
    ),
    variable_label = c(
      "Diet: yes/no",
      "Diet: high-calorie",
      "Diet: low-calorie",
      "Diet: low-cholesterol",
      "Diet: low-salt",
      "Diet: other",
      "Diet: sugar free",
      "Diet: vegetarian",
      "Milk consumption: from age 50 on",
      "Milk consumption: up to 25 years",
      "Milk consumption: between 25 and 50 yr",
      "Milk products: number of days hard cheese",
      "Milk products: number of days milk",
      "Milk products: number of days soft cheese",
      "Milk products: number of days various",
      "Milk products: number of days yoghurt",
      "Diet: yes/no",
      "Diet: low-calorie",
      "Diet: low-cholesterol",
      "Diet: low-salt",
      "Diet: sugar free",
      "Diet: vegetarian"
    ),
    harmonized_var_label = c(
      "Diet: yes/no",
      "Diet: high-calorie",
      "Diet: low-calorie",
      "Diet: low-cholesterol",
      "Diet: low-salt",
      "Diet: other",
      "Diet: sugar free",
      "Diet: vegetarian",
      "Milk consumption: from age 50 on",
      "Milk consumption: up to 25 years",
      "Milk consumption: between 25 and 50 yr",
      "Milk products: number of days hard cheese",
      "Milk products: number of days milk",
      "Milk products: number of days soft cheese",
      "Milk products: number of days various",
      "Milk products: number of days yoghurt",
      "Diet: yes/no",
      "Diet: low-calorie",
      "Diet: low-cholesterol",
      "Diet: low-salt",
      "Diet: sugar free",
      "Diet: vegetarian"
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
      "numeric",
      "numeric",
      "categorical",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
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
    mdiet = list(
      C = no_yes_241,
      D = no_yes_241
    ),
    mdiethcal = list(
      C = not_mentioned_mentioned_259
    ),
    mdietlcal = list(
      C = not_mentioned_mentioned_104,
      D = not_mentioned_mentioned_104
    ),
    mdietlchol = list(
      C = not_mentioned_mentioned_104,
      D = not_mentioned_mentioned_104
    ),
    mdietlsalt = list(
      C = not_mentioned_mentioned_104,
      D = not_mentioned_mentioned_104
    ),
    mdietoth = list(
      C = not_mentioned_mentioned_259
    ),
    mdietsugf = list(
      C = not_mentioned_mentioned_104,
      D = not_mentioned_mentioned_104
    ),
    mdietveg = list(
      C = not_mentioned_mentioned_104,
      D = not_mentioned_mentioned_104
    ),
    mmilka50y = list(
      C = about_every_meal_every_day_but_not_every_meal
    ),
    mmilkb25y = list(
      C = about_every_meal_every_day_but_not_every_meal
    ),
    mmilkb50y = list(
      C = about_every_meal_every_day_but_not_every_meal
    ),
    mmilkhchs = list(
      C = none
    ),
    mmilkmlk = list(
      C = none
    ),
    mmilkschs = list(
      C = none
    ),
    mmilkvar = list(
      C = none
    ),
    mmilkyght = list(
      C = none
    )
  ),

  value_labels_harmonized = list(
    mdiet = no_yes_241,
    mdiethcal = not_mentioned_mentioned_259,
    mdietlcal = not_mentioned_mentioned_104,
    mdietlchol = not_mentioned_mentioned_104,
    mdietlsalt = not_mentioned_mentioned_104,
    mdietoth = not_mentioned_mentioned_259,
    mdietsugf = not_mentioned_mentioned_104,
    mdietveg = not_mentioned_mentioned_104,
    mmilka50y = about_every_meal_every_day_but_not_every_meal,
    mmilkb25y = about_every_meal_every_day_but_not_every_meal,
    mmilkb50y = about_every_meal_every_day_but_not_every_meal,
    mmilkhchs = none,
    mmilkmlk = none,
    mmilkschs = none,
    mmilkvar = none,
    mmilkyght = none
  )
)
