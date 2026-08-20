## LASA filecode 146 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_146 <- list(
  variables = data.frame(
    wave = c("F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F"),
    variable_name = c(
      "fqdecf01",
      "fqdecf02",
      "fqdecf03",
      "fqdecf04",
      "fqdecf05",
      "fqdecf06",
      "fqdecf07",
      "fqdecf08",
      "fqdecf09",
      "fqdecf10",
      "fqdecf11"
    ),
    canonical_name = c(
      "qdecf01",
      "qdecf02",
      "qdecf03",
      "qdecf04",
      "qdecf05",
      "qdecf06",
      "qdecf07",
      "qdecf08",
      "qdecf09",
      "qdecf10",
      "qdecf11"
    ),
    variable_label = c(
      "if I die, I hope: not to be dependent upon others",
      "if I die, I hope: to self decide about treatment",
      "if I die, I hope: to receive help from family",
      "if I die, I hope: to receive help from volunteers or caretakers",
      "if I die, I hope: not to be alone",
      "if I die, I hope: to self decide about moment of dying",
      "if I die, I hope: to be at home",
      "if I die, I hope: to be in a hospice",
      "if I die, I hope: to be in a nursing home",
      "if I die, I hope: to be in a hospital",
      "if I die, I hope: something else"
    ),
    harmonized_var_label = c(
      "if I die, I hope: not to be dependent upon others",
      "if I die, I hope: to self decide about treatment",
      "if I die, I hope: to receive help from family",
      "if I die, I hope: to receive help from volunteers or caretakers",
      "if I die, I hope: not to be alone",
      "if I die, I hope: to self decide about moment of dying",
      "if I die, I hope: to be at home",
      "if I die, I hope: to be in a hospice",
      "if I die, I hope: to be in a nursing home",
      "if I die, I hope: to be in a hospital",
      "if I die, I hope: something else"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qdecf01 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf02 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf03 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf04 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf05 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf06 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf07 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf08 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf09 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf10 = list(
      F = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qdecf11 = list(
      F = not_mentioned_mentioned_31
    )
  ),

  value_labels_harmonized = list(
    qdecf01 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf02 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf03 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf04 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf05 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf06 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf07 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf08 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf09 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf10 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qdecf11 = c(`-1` = "not available", `0` = "not mentioned", `1` = "mentioned")
  )
)
