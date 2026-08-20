## LASA filecode 131 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_131 <- list(
  variables = data.frame(
    wave = c(
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E",
      "E"
    ),
    variable_name = c(
      "dqsoid01",
      "dqsoid02",
      "dqsoid03",
      "dqsoid04",
      "dqsoid05",
      "dqsoid06",
      "dqsoid07",
      "dqsoid08",
      "dqsoid09",
      "dqsoid10",
      "eqsoid01",
      "eqsoid02",
      "eqsoid03",
      "eqsoid04",
      "eqsoid05",
      "eqsoid06",
      "eqsoid07",
      "eqsoid08",
      "eqsoid09",
      "eqsoid10"
    ),
    canonical_name = c(
      "qsoid01",
      "qsoid02",
      "qsoid03",
      "qsoid04",
      "qsoid05",
      "qsoid06",
      "qsoid07",
      "qsoid08",
      "qsoid09",
      "qsoid10",
      "qsoid01",
      "qsoid02",
      "qsoid03",
      "qsoid04",
      "qsoid05",
      "qsoid06",
      "qsoid07",
      "qsoid08",
      "qsoid09",
      "qsoid10"
    ),
    variable_label = c(
      "Soc Iden 01: involved",
      "Soc Iden 02: emotional link",
      "Soc Iden 03: proud",
      "Soc Iden 04: pleasant",
      "Soc Iden 05: identification",
      "Soc Iden 06: loyalty",
      "Soc Iden 07: honoured",
      "Soc Iden 08: joined",
      "Soc Iden 09: avarage",
      "Soc Iden 10: myself",
      "Soc Iden 01: involved",
      "Soc Iden 02: emotional link",
      "Soc Iden 03: proud",
      "Soc Iden 04: pleasant",
      "Soc Iden 05: identification",
      "Soc Iden 06: loyalty",
      "Soc Iden 07: honoured",
      "Soc Iden 08: joined",
      "Soc Iden 09: avarage",
      "Soc Iden 10: myself"
    ),
    harmonized_var_label = c(
      "Soc Iden 01: involved",
      "Soc Iden 02: emotional link",
      "Soc Iden 03: proud",
      "Soc Iden 04: pleasant",
      "Soc Iden 05: identification",
      "Soc Iden 06: loyalty",
      "Soc Iden 07: honoured",
      "Soc Iden 08: joined",
      "Soc Iden 09: avarage",
      "Soc Iden 10: myself",
      "Soc Iden 01: involved",
      "Soc Iden 02: emotional link",
      "Soc Iden 03: proud",
      "Soc Iden 04: pleasant",
      "Soc Iden 05: identification",
      "Soc Iden 06: loyalty",
      "Soc Iden 07: honoured",
      "Soc Iden 08: joined",
      "Soc Iden 09: avarage",
      "Soc Iden 10: myself"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qsoid01 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qsoid02 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qsoid03 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qsoid04 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qsoid05 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qsoid06 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qsoid07 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qsoid08 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qsoid09 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    ),
    qsoid10 = list(
      D = strongly_disagree_disagree_no_agreement_disagreement,
      E = strongly_disagree_disagree_no_agreement_disagreement
    )
  ),

  value_labels_harmonized = list(
    qsoid01 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qsoid02 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qsoid03 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qsoid04 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qsoid05 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qsoid06 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qsoid07 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qsoid08 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qsoid09 = strongly_disagree_disagree_no_agreement_disagreement_2,
    qsoid10 = strongly_disagree_disagree_no_agreement_disagreement_2
  )
)
