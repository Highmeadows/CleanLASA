## LASA filecode 140 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_140 <- list(
  variables = data.frame(
    wave = c("2B", "2B", "2B", "2B", "2B", "2B", "3B", "3B", "3B", "3B", "3B", "3B"),
    variable_name = c(
      "bqfa_ch",
      "bqmo_ch",
      "bqmo_emp",
      "bqmo_vol",
      "bqparsep",
      "bqparsey",
      "bqfa_ch",
      "bqmo_ch",
      "bqmo_emp",
      "bqmo_vol",
      "bqparsep",
      "bqparsey"
    ),
    canonical_name = c(
      "qfa_ch",
      "qmo_ch",
      "qmo_emp",
      "qmo_vol",
      "qparsep",
      "qparsey",
      "qfa_ch",
      "qmo_ch",
      "qmo_emp",
      "qmo_vol",
      "qparsep",
      "qparsey"
    ),
    variable_label = c(
      "Father church member during youth R?",
      "Mother church member during youth R?",
      "Mother employed during youth R?",
      "Mother volunteer work during youth R?",
      "Parents ever separated/divorced?",
      "Year parents separated/divorced",
      "Father church member during youth R?",
      "Mother church member during youth R?",
      "Mother employed during youth R?",
      "Mother volunteer work during youth R?",
      "Parents ever separated/divorced?",
      "Year parents separated/divorced"
    ),
    harmonized_var_label = c(
      "Father church member during youth R?",
      "Mother church member during youth R?",
      "Mother employed during youth R?",
      "Mother volunteer work during youth R?",
      "Parents ever separated/divorced?",
      "Year parents separated/divorced",
      "Father church member during youth R?",
      "Mother church member during youth R?",
      "Mother employed during youth R?",
      "Mother volunteer work during youth R?",
      "Parents ever separated/divorced?",
      "Year parents separated/divorced"
    ),
    var_type = c(
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "numeric"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qfa_ch = list(
      `2B` = no_church_member_reformed_dutch_reformed,
      `3B` = no_church_member_dutch_reformed
    ),
    qmo_ch = list(
      `2B` = no_church_member_reformed_dutch_reformed,
      `3B` = no_church_member_dutch_reformed
    ),
    qmo_emp = list(
      `2B` = no_yes_3,
      `3B` = no_yes_3
    ),
    qmo_vol = list(
      `2B` = no_yes_3,
      `3B` = no_yes_3
    ),
    qparsep = list(
      `2B` = no_yes_3,
      `3B` = no_yes_3
    ),
    qparsey = list(
      `2B` = no_answer_see_bqparsep_no_answer,
      `3B` = no_answer_see_bqparsep_no_answer
    )
  ),

  value_labels_harmonized = list(
    qfa_ch = no_church_member_reformed_dutch_reformed_2,
    qmo_ch = no_church_member_reformed_dutch_reformed_2,
    qmo_emp = no_yes_33,
    qmo_vol = no_yes_33,
    qparsep = no_yes_33,
    qparsey = not_available_not_available
  )
)
