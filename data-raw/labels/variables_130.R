## LASA filecode 130 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_130 <- list(
  variables = data.frame(
    wave = c("C", "C", "C", "C", "C", "F", "F", "F", "F", "F"),
    variable_name = c(
      "cqsocd1",
      "cqsocd2",
      "cqsocd3",
      "cqsocd4",
      "cqsocd5",
      "fqsocd1",
      "fqsocd2",
      "fqsocd3",
      "fqsocd4",
      "fqsocd5"
    ),
    canonical_name = c(
      "qsocd1",
      "qsocd2",
      "qsocd3",
      "qsocd4",
      "qsocd5",
      "qsocd1",
      "qsocd2",
      "qsocd3",
      "qsocd4",
      "qsocd5"
    ),
    variable_label = c(
      "social des. 1: always courteous",
      "social des. 2: profited",
      "social des. 3: get even",
      "social des. 4: annoyed",
      "social des. 5: listen good",
      "social des. 1: always courteous",
      "social des. 2: profited",
      "social des. 3: get even",
      "social des. 4: annoyed",
      "social des. 5: listen good"
    ),
    harmonized_var_label = c(
      "social des. 1: always courteous",
      "social des. 2: profited",
      "social des. 3: get even",
      "social des. 4: annoyed",
      "social des. 5: listen good",
      "social des. 1: always courteous",
      "social des. 2: profited",
      "social des. 3: get even",
      "social des. 4: annoyed",
      "social des. 5: listen good"
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
    qsocd1 = list(
      C = certainly_true_true_do_not_know_not_true,
      F = certainly_true_true_do_not_know_not_true
    ),
    qsocd2 = list(
      C = certainly_true_true_do_not_know_not_true,
      F = certainly_true_true_do_not_know_not_true
    ),
    qsocd3 = list(
      C = certainly_true_true_do_not_know_not_true,
      F = certainly_true_true_do_not_know_not_true
    ),
    qsocd4 = list(
      C = certainly_true_true_do_not_know_not_true,
      F = certainly_true_true_do_not_know_not_true
    ),
    qsocd5 = list(
      C = certainly_true_true_do_not_know_not_true,
      F = certainly_true_true_do_not_know_not_true
    )
  ),

  value_labels_harmonized = list(
    qsocd1 = certainly_true_true_do_not_know_not_true_2,
    qsocd2 = certainly_true_true_do_not_know_not_true_2,
    qsocd3 = certainly_true_true_do_not_know_not_true_2,
    qsocd4 = certainly_true_true_do_not_know_not_true_2,
    qsocd5 = certainly_true_true_do_not_know_not_true_2
  )
)
