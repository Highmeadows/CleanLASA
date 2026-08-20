## LASA filecode 120 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_120 <- list(
  variables = data.frame(
    wave = c(
      "2B",
      "2B",
      "2B",
      "3B",
      "3B",
      "3B",
      "B",
      "B",
      "B",
      "E",
      "E",
      "E",
      "E",
      "E",
      "F",
      "F",
      "F",
      "F"
    ),
    variable_name = c(
      "bqsex01",
      "bqsex02",
      "bqsex03",
      "bqsex01",
      "bqsex02",
      "bqsex03",
      "bqsex01",
      "bqsex02",
      "bqsex03",
      "eqsex01",
      "eqsex02",
      "eqsex03",
      "eqsex04",
      "eqsex05",
      "fqsex02",
      "fqsex03",
      "fqsex04",
      "fqsex05"
    ),
    canonical_name = c(
      "qsex01",
      "qsex02",
      "qsex03",
      "qsex01",
      "qsex02",
      "qsex03",
      "qsex01",
      "qsex02",
      "qsex03",
      "qsex01",
      "qsex02",
      "qsex03",
      "qsex04",
      "qsex05",
      "qsex02",
      "qsex03",
      "qsex04",
      "qsex05"
    ),
    variable_label = c(
      "sexual life 01: evaluation past",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 01: evaluation past",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 01: evaluation past",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 01: evaluation past",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 04: not important at this age",
      "sexual life 5: need for intimacy",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 04: not important at this age",
      "sexual life 5: need for intimacy"
    ),
    harmonized_var_label = c(
      "sexual life 01: evaluation past",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 01: evaluation past",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 01: evaluation past",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 01: evaluation past",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 04: not important at this age",
      "sexual life 5: need for intimacy",
      "sexual life 02: importance present",
      "sexual life 03: evaluation present",
      "sexual life 04: not important at this age",
      "sexual life 5: need for intimacy"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qsex01 = list(
      `2B` = very_unpleasant_unpleasant_not_unpleasant_pleasant_2,
      `3B` = very_unpleasant_unpleasant_not_unpleasant_pleasant_2,
      B = very_unpleasant_unpleasant_not_unpleasant_pleasant_2,
      E = very_unpleasant_unpleasant_not_unpleasant_pleasant_2
    ),
    qsex02 = list(
      `2B` = very_unimportant_unimportant_not_unimportant_important,
      `3B` = very_unimportant_unimportant_not_unimportant_important,
      B = very_unimportant_unimportant_not_unimportant_important,
      E = very_unimportant_unimportant_not_unimportant_important,
      F = very_unimportant_unimportant_not_unimportant_important
    ),
    qsex03 = list(
      `2B` = very_unpleasant_unpleasant_not_unpleasant_pleasant,
      `3B` = very_unpleasant_unpleasant_not_unpleasant_pleasant,
      B = very_unpleasant_unpleasant_not_unpleasant_pleasant,
      E = very_unpleasant_unpleasant_not_unpleasant_pleasant,
      F = very_unpleasant_unpleasant_not_unpleasant_pleasant
    ),
    qsex04 = list(
      E = strongly_disagree_disagree_no_agreement_agreement_agree,
      F = strongly_disagree_disagree_no_agreement_agreement_agree
    ),
    qsex05 = list(
      E = strongly_disagree_disagree_no_agreement_agreement_agree,
      F = strongly_disagree_disagree_no_agreement_agreement_agree
    )
  ),

  value_labels_harmonized = list(
    qsex01 = c(
      `-1` = "not available",
      `1` = "very unpleasant",
      `2` = "unpleasant",
      `3` = "not unpleasant/pleasant",
      `4` = "pleasant",
      `5` = "very pleasant"
    ),
    qsex02 = c(
      `-1` = "not available",
      `1` = "very unimportant",
      `2` = "unimportant",
      `3` = "not unimportant/important",
      `4` = "important",
      `5` = "very important"
    ),
    qsex03 = c(
      `-1` = "not available",
      `1` = "very unpleasant",
      `2` = "unpleasant",
      `3` = "not unpleasant/pleasant",
      `4` = "pleasant",
      `5` = "very pleasant",
      `6` = "not applicable"
    ),
    qsex04 = strongly_disagree_disagree_no_agreement_agreement_agree_2,
    qsex05 = strongly_disagree_disagree_no_agreement_agreement_agree_2
  )
)
