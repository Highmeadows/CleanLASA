## LASA filecode 111 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_111 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "B", "B", "D", "D", "D", "D", "D"),
    variable_name = c(
      "bqhumor1",
      "bqhumor2",
      "bqhumor3",
      "bqhumor4",
      "bqhumor5",
      "dqhumor1",
      "dqhumor2",
      "dqhumor3",
      "dqhumor4",
      "dqhumor5"
    ),
    canonical_name = c(
      "qhumor1",
      "qhumor2",
      "qhumor3",
      "qhumor4",
      "qhumor5",
      "qhumor1",
      "qhumor2",
      "qhumor3",
      "qhumor4",
      "qhumor5"
    ),
    variable_label = c(
      "Humor 1: less problems (+)",
      "Humor 2: tense situation (+)",
      "Humor 3: cry/laugh (+)",
      "Humor 4: joke (+)",
      "Humor 5: efficient (+)",
      "Humor 1: less problems (+)",
      "Humor 2: tense situation (+)",
      "Humor 3: cry/laugh (+)",
      "Humor 4: joke (+)",
      "Humor 5: efficient (+)"
    ),
    harmonized_var_label = c(
      "Humor 1: less problems (+)",
      "Humor 2: tense situation (+)",
      "Humor 3: cry/laugh (+)",
      "Humor 4: joke (+)",
      "Humor 5: efficient (+)",
      "Humor 1: less problems (+)",
      "Humor 2: tense situation (+)",
      "Humor 3: cry/laugh (+)",
      "Humor 4: joke (+)",
      "Humor 5: efficient (+)"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qhumor1 = list(
      B = strongly_disagree_disagree_no_agreement_disagreement,
      D = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qhumor2 = list(
      B = strongly_disagree_disagree_no_agreement_disagreement,
      D = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qhumor3 = list(
      B = strongly_disagree_disagree_no_agreement_disagreement,
      D = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qhumor4 = list(
      B = strongly_disagree_disagree_no_agreement_disagreement,
      D = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qhumor5 = list(
      B = strongly_disagree_disagree_no_agreement_disagreement,
      D = strongly_disagree_disagree_no_agreement_disagreement
    )
  ),

  value_labels_harmonized = list(
    qhumor1 = strongly_disagree_disagree_neither_agree_nor_disagree,
    qhumor2 = strongly_disagree_disagree_neither_agree_nor_disagree,
    qhumor3 = strongly_disagree_disagree_neither_agree_nor_disagree,
    qhumor4 = strongly_disagree_disagree_neither_agree_nor_disagree,
    qhumor5 = strongly_disagree_disagree_neither_agree_nor_disagree
  )
)
