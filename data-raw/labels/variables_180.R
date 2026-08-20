## LASA filecode 180 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_180 <- list(
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
      "C",
      "C",
      "C",
      "D",
      "D",
      "D"
    ),
    variable_name = c(
      "cmbathhand",
      "cmbathshand",
      "cmbathslp",
      "cmbedswtch",
      "cmkitcup",
      "cmkitstpl",
      "cmkitstplbr",
      "cmkitucup",
      "cmkituwin",
      "cmkitwin",
      "cmlivcarp",
      "cmlivwksp",
      "cmstairhand",
      "cmstairlmat",
      "cmstairrgh",
      "cmstairslmat",
      "cmstairturn",
      "cmwalkfootb",
      "cmwalklightsw",
      "dmbathshand",
      "dmkitcup",
      "dmwalkrill"
    ),
    canonical_name = c(
      "mbathhand",
      "mbathshand",
      "mbathslp",
      "mbedswtch",
      "mkitcup",
      "mkitstpl",
      "mkitstplbr",
      "mkitucup",
      "mkituwin",
      "mkitwin",
      "mlivcarp",
      "mlivwksp",
      "mstairhand",
      "mstairlmat",
      "mstairrgh",
      "mstairslmat",
      "mstairturn",
      "mwalkfootb",
      "mwalklightsw",
      "mbathshand",
      "mkitcup",
      "mwalkrill"
    ),
    variable_label = c(
      "Bathroom/toilet: handrail",
      "Bathroom/toilet: shower handrail",
      "Bathroom/toil: antislip",
      "Bedroom: light switch",
      "Kitchen: cupboard",
      "Kitchen: stepladder",
      "Kitchen: stepladder brace",
      "Kitchen: use of cupboard",
      "Kitchen: use of upper window",
      "Kitchen: upper window",
      "Living room: loose carpets",
      "Living room: enough walking space",
      "Stairs: double handrails",
      "Stairs: loose material",
      "Stairs: rough",
      "Stairs: sometimes loose material",
      "Stairs: turned (home)",
      "Walking route: footboard",
      "Walking route: light switch",
      "Bathroom/toilet: shower handrail",
      "Kitchen: cupboard",
      "Walkingroute: illumination"
    ),
    harmonized_var_label = c(
      "Bathroom/toilet: handrail",
      "Bathroom/toilet: shower handrail",
      "Bathroom/toil: antislip",
      "Bedroom: light switch",
      "Kitchen: cupboard",
      "Kitchen: stepladder",
      "Kitchen: stepladder brace",
      "Kitchen: use of cupboard",
      "Kitchen: use of upper window",
      "Kitchen: upper window",
      "Living room: loose carpets",
      "Living room: enough walking space",
      "Stairs: double handrails",
      "Stairs: loose material",
      "Stairs: rough",
      "Stairs: sometimes loose material",
      "Stairs: turned (home)",
      "Walking route: footboard",
      "Walking route: light switch",
      "Bathroom/toilet: shower handrail",
      "Kitchen: cupboard",
      "Walkingroute: illumination"
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
    mbathhand = list(
      C = no_yes_not_applicable
    ),
    mbathshand = list(
      C = no_yes_not_applicable,
      D = no_yes_not_applicable_2
    ),
    mbathslp = list(
      C = no_yes_not_applicable
    ),
    mbedswtch = list(
      C = no_yes_not_applicable
    ),
    mkitcup = list(
      C = no_yes_not_applicable,
      D = no_yes_not_applicable_2
    ),
    mkitstpl = list(
      C = no_yes_not_applicable
    ),
    mkitstplbr = list(
      C = no_yes_not_applicable
    ),
    mkitucup = list(
      C = no_yes_not_applicable
    ),
    mkituwin = list(
      C = no_yes_not_applicable
    ),
    mkitwin = list(
      C = no_yes_not_applicable
    ),
    mlivcarp = list(
      C = no_yes_not_applicable
    ),
    mlivwksp = list(
      C = no_yes_not_applicable
    ),
    mstairhand = list(
      C = no_yes_not_applicable
    ),
    mstairlmat = list(
      C = no_yes_not_applicable
    ),
    mstairrgh = list(
      C = no_yes_not_applicable
    ),
    mstairslmat = list(
      C = no_yes_not_applicable
    ),
    mstairturn = list(
      C = no_yes_not_applicable
    ),
    mwalkfootb = list(
      C = no_yes_not_applicable
    ),
    mwalklightsw = list(
      C = no_yes_not_applicable
    ),
    mwalkrill = list(
      D = no_yes_not_applicable_2
    )
  ),

  value_labels_harmonized = list(
    mbathhand = no_yes_not_applicable,
    mbathshand = no_yes_not_applicable_2,
    mbathslp = no_yes_not_applicable,
    mbedswtch = no_yes_not_applicable,
    mkitcup = no_yes_not_applicable_2,
    mkitstpl = no_yes_not_applicable,
    mkitstplbr = no_yes_not_applicable,
    mkitucup = no_yes_not_applicable,
    mkituwin = no_yes_not_applicable,
    mkitwin = no_yes_not_applicable,
    mlivcarp = no_yes_not_applicable,
    mlivwksp = no_yes_not_applicable,
    mstairhand = no_yes_not_applicable,
    mstairlmat = no_yes_not_applicable,
    mstairrgh = no_yes_not_applicable,
    mstairslmat = no_yes_not_applicable,
    mstairturn = no_yes_not_applicable,
    mwalkfootb = no_yes_not_applicable,
    mwalklightsw = no_yes_not_applicable,
    mwalkrill = no_yes_not_applicable_2
  )
)
