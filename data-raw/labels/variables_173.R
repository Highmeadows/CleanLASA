## LASA filecode 173 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_173 <- list(
  variables = data.frame(
    wave = c("J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J"),
    variable_name = c(
      "jmexlo1",
      "jmexlo12",
      "jmexlo16",
      "jmexlo18",
      "jmexlo21",
      "jmexlo23",
      "jmexlo24",
      "jmexlo25",
      "jmexlo26",
      "jmexlo27",
      "jmexlo29",
      "jmexlo3",
      "jmexlo30",
      "jmexlo31",
      "jmexlo6",
      "jmexlo8"
    ),
    canonical_name = c(
      "mexlo1",
      "mexlo12",
      "mexlo16",
      "mexlo18",
      "mexlo21",
      "mexlo23",
      "mexlo24",
      "mexlo25",
      "mexlo26",
      "mexlo27",
      "mexlo29",
      "mexlo3",
      "mexlo30",
      "mexlo31",
      "mexlo6",
      "mexlo8"
    ),
    variable_label = c(
      "I am happy with the way I have lived my life / Ik ben gelukkig over hoe ik mijn leven heb geleid",
      "I feel I have people I can trust and rely on if I need them / Ik heb mensen waarop ik kan vertrouwen en rekenen wanneer ik daar behoefte aan heb",
      "I stay in bad relationships too long in order not to be alone / Ik blijf te lang in een slechte relatie omdat ik niet alleen wil zijn",
      "I feel helpless / Ik voel me hulpeloos",
      "I feel alone / Ik voel me alleen",
      "I mean something to others / Ik beteken iets voor andere mensen",
      "Important relationships have ended or become weaker / Belangrijke contacten zijn weggevallen of verwaterd",
      "I feel at the mercy of the world / Ik voel mij machteloos tegenover de wereld",
      "I feel dead / Het voelt alsof ik dood ben",
      "The universe is full of meaning / Deze wereld biedt vele mogelijkheden",
      "I feel that there is little point to life / Het leven heeft weinig zin",
      "There is a purpose to my life / Mijn leven heeft een bepaalde bedoeling",
      "No one else in the world can understand my feelings / Niemand kan mijn gevoelens begrijpen",
      "My world seems so different from everybody else's / Mijn wereld is totaal anders dan die van andere mensen",
      "I am surrounded by strangers I cannot connect with / Ik ben omringd door vreemden met wie ik geen contact kan leggen",
      "I feel lonely / Ik voel mij eenzaam"
    ),
    harmonized_var_label = c(
      "I am happy with the way I have lived my life",
      "I feel I have people I can trust and rely on if I need them",
      "I stay in bad relationships too long in order not to be alone",
      "I feel helpless",
      "I feel alone",
      "I mean something to others",
      "Important relationships have ended or become weaker",
      "I feel at the mercy of the world",
      "I feel dead",
      "The universe is full of meaning",
      "I feel that there is little point to life",
      "There is a purpose to my life",
      "No one else in the world can understand my feelings",
      "My world seems so different from everybody else's",
      "I am surrounded by strangers I cannot connect with",
      "I feel lonely"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mexlo1 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo12 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo16 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo18 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo21 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo23 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo24 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo25 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo26 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo27 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo29 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo3 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo30 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo31 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo6 = list(
      J = no_no_more_or_less_yes_yes
    ),
    mexlo8 = list(
      J = no_no_more_or_less_yes_yes
    )
  ),

  value_labels_harmonized = list(
    mexlo1 = no_no_more_or_less_yes_yes,
    mexlo12 = no_no_more_or_less_yes_yes,
    mexlo16 = no_no_more_or_less_yes_yes,
    mexlo18 = no_no_more_or_less_yes_yes,
    mexlo21 = no_no_more_or_less_yes_yes,
    mexlo23 = no_no_more_or_less_yes_yes,
    mexlo24 = no_no_more_or_less_yes_yes,
    mexlo25 = no_no_more_or_less_yes_yes,
    mexlo26 = no_no_more_or_less_yes_yes,
    mexlo27 = no_no_more_or_less_yes_yes,
    mexlo29 = no_no_more_or_less_yes_yes,
    mexlo3 = no_no_more_or_less_yes_yes,
    mexlo30 = no_no_more_or_less_yes_yes,
    mexlo31 = no_no_more_or_less_yes_yes,
    mexlo6 = no_no_more_or_less_yes_yes,
    mexlo8 = no_no_more_or_less_yes_yes
  )
)
