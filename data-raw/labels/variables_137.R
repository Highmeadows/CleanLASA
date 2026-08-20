## LASA filecode 137 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_137 <- list(
  variables = data.frame(
    wave = c(
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "F",
      "F",
      "F",
      "F",
      "F",
      "F",
      "F",
      "F",
      "F",
      "F",
      "F",
      "F"
    ),
    variable_name = c(
      "eqvall01",
      "eqvall02",
      "eqvall03",
      "eqvall04",
      "eqvall05",
      "eqvall06",
      "eqvall07",
      "eqvall08",
      "eqvall09",
      "eqvall10",
      "eqvall11",
      "eqvall12",
      "eqvall13",
      "eqvall14",
      "eqvall15",
      "eqvall16",
      "eqvall17",
      "eqvall18",
      "eqvall19",
      "fqvall01",
      "fqvall04",
      "fqvall06",
      "fqvall07",
      "fqvall10",
      "fqvall11",
      "fqvall13",
      "fqvall14",
      "fqvall15",
      "fqvall16",
      "fqvall18",
      "fqvall19"
    ),
    canonical_name = c(
      "qvall01",
      "qvall02",
      "qvall03",
      "qvall04",
      "qvall05",
      "qvall06",
      "qvall07",
      "qvall08",
      "qvall09",
      "qvall10",
      "qvall11",
      "qvall12",
      "qvall13",
      "qvall14",
      "qvall15",
      "qvall16",
      "qvall17",
      "qvall18",
      "qvall19",
      "qvall01",
      "qvall04",
      "qvall06",
      "qvall07",
      "qvall10",
      "qvall11",
      "qvall13",
      "qvall14",
      "qvall15",
      "qvall16",
      "qvall18",
      "qvall19"
    ),
    variable_label = c(
      "Value of late life 01: difficult",
      "Value of late life 02: much",
      "Value of late life 03: daily basis",
      "Value of late life 04: lifeaims",
      "Value of late life 05: useful",
      "Value of late life 06: important",
      "Value of late life 07: attain",
      "Value of late life 08: plans",
      "Value of late life 09: many ways",
      "Value of late life 10: problems",
      "Value of late life 11: positive",
      "Value of late life 12: hopeful",
      "Value of late life 13: give up",
      "Value of late life 14: strong will",
      "Value of late life 15: enjoy",
      "Value of late life 16: best",
      "Value of late life 17: ethical",
      "Value of late life 18: make sense",
      "Value of late life 19: few aims",
      "Value of late life 01: difficult",
      "Value of late life 04: lifeaims",
      "Value of late life 06: important",
      "Value of late life 07: attain",
      "Value of late life 10: problems",
      "Value of late life 11: positive",
      "Value of late life 13: give up",
      "Value of late life 14: strong will",
      "Value of late life 15: enjoy",
      "Value of late life 16: best",
      "Value of late life 18: make sense",
      "Value of late life 19: few aims"
    ),
    harmonized_var_label = c(
      "Value of late life 01: difficult",
      "Value of late life 02: much",
      "Value of late life 03: daily basis",
      "Value of late life 04: lifeaims",
      "Value of late life 05: useful",
      "Value of late life 06: important",
      "Value of late life 07: attain",
      "Value of late life 08: plans",
      "Value of late life 09: many ways",
      "Value of late life 10: problems",
      "Value of late life 11: positive",
      "Value of late life 12: hopeful",
      "Value of late life 13: give up",
      "Value of late life 14: strong will",
      "Value of late life 15: enjoy",
      "Value of late life 16: best",
      "Value of late life 17: ethical",
      "Value of late life 18: make sense",
      "Value of late life 19: few aims",
      "Value of late life 01: difficult",
      "Value of late life 04: lifeaims",
      "Value of late life 06: important",
      "Value of late life 07: attain",
      "Value of late life 10: problems",
      "Value of late life 11: positive",
      "Value of late life 13: give up",
      "Value of late life 14: strong will",
      "Value of late life 15: enjoy",
      "Value of late life 16: best",
      "Value of late life 18: make sense",
      "Value of late life 19: few aims"
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
    qvall01 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall02 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall03 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall04 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall05 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall06 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall07 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall08 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall09 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall10 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall11 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall12 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall13 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall14 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall15 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall16 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall17 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall18 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    ),
    qvall19 = list(
      E = strongly_agree_agree_no_agreement_disagreement_disagree,
      F = strongly_agree_agree_no_agreement_disagreement_disagree
    )
  ),

  value_labels_harmonized = list(
    qvall01 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall02 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall03 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall04 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall05 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall06 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall07 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall08 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall09 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall10 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall11 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall12 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall13 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall14 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall15 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall16 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall17 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall18 = strongly_agree_agree_no_agreement_disagreement_disagree_2,
    qvall19 = strongly_agree_agree_no_agreement_disagreement_disagree_2
  )
)
