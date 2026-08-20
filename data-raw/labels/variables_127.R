## LASA filecode 127 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_127 <- list(
  variables = data.frame(
    wave = c("I", "I", "I", "I", "I", "J", "J", "J", "J", "J", "K", "K", "K", "K", "K"),
    variable_name = c(
      "iqeol07",
      "iqeol08",
      "iqeol09",
      "iqeol10",
      "iqeol11",
      "jqeol07",
      "jqeol08",
      "jqeol09",
      "jqeol10",
      "jqeol11",
      "kqeol07",
      "kqeol08",
      "kqeol09",
      "kqeol10",
      "kqeol11"
    ),
    canonical_name = c(
      "qeol07",
      "qeol08",
      "qeol09",
      "qeol10",
      "qeol11",
      "qeol07",
      "qeol08",
      "qeol09",
      "qeol10",
      "qeol11",
      "qeol07",
      "qeol08",
      "qeol09",
      "qeol10",
      "qeol11"
    ),
    variable_label = c(
      "ever death thoughts",
      "ever death wishes",
      "feelings towards living past week",
      "feelings towards dying past week",
      "feelings towards reasons for living/dying",
      "ever death thoughts",
      "ever death wishes",
      "feelings towards living past week",
      "feelings towards dying past week",
      "feelings towards reasons for living/dying",
      "ever death thoughts",
      "ever death wishes",
      "feelings towards living past week",
      "feelings towards dying past week",
      "feelings towards reasons for living/dying"
    ),
    harmonized_var_label = c(
      "ever death thoughts",
      "ever death wishes",
      "feelings towards living past week",
      "feelings towards dying past week",
      "feelings towards reasons for living/dying",
      "ever death thoughts",
      "ever death wishes",
      "feelings towards living past week",
      "feelings towards dying past week",
      "feelings towards reasons for living/dying",
      "ever death thoughts",
      "ever death wishes",
      "feelings towards living past week",
      "feelings towards dying past week",
      "feelings towards reasons for living/dying"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qeol07 = list(
      I = yes_no_r_does_not_know,
      J = yes_no_r_does_not_know,
      K = yes_no_r_does_not_know
    ),
    qeol08 = list(
      I = yes_no_r_does_not_know,
      J = yes_no_r_does_not_know,
      K = yes_no_r_does_not_know
    ),
    qeol09 = list(
      I = a_moderate_to_strong_wish_to_live_a_weak_wish_to_live,
      J = a_moderate_to_strong_wish_to_live_a_weak_wish_to_live,
      K = a_moderate_to_strong_wish_to_live_a_weak_wish_to_live
    ),
    qeol10 = list(
      I = no_wish_to_die_a_weak_wish_to_die,
      J = no_wish_to_die_a_weak_wish_to_die,
      K = no_wish_to_die_a_weak_wish_to_die
    ),
    qeol11 = list(
      I = for_living_outweigh_those_for_dying_about_equal,
      J = for_living_outweigh_those_for_dying_about_equal,
      K = for_living_outweigh_those_for_dying_about_equal
    )
  ),

  value_labels_harmonized = list(
    qeol07 = yes_no_r_does_not_know_6,
    qeol08 = yes_no_r_does_not_know_6,
    qeol09 = c(
      `-1` = "not available",
      `1` = "a moderate to strong wish to live",
      `2` = "a weak wish to live",
      `3` = "no wish to live"
    ),
    qeol10 = c(
      `-1` = "not available",
      `1` = "no wish to die",
      `2` = "a weak wish to die",
      `3` = "a moderate to strong wish to die"
    ),
    qeol11 = c(
      `-1` = "not available",
      `1` = "for living outweigh those for dying",
      `2` = "about equal",
      `3` = "for dying outweigh those for living"
    )
  )
)
