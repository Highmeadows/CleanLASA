## LASA filecode 134 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_134 <- list(
  variables = data.frame(
    wave = c("2B", "2B", "3B", "3B", "3B", "E", "E"),
    variable_name = c("bqbwght", "bqbwghts", "bqbwght", "bqbwghts", "bqbwghtw", "eqbwght", "eqbwghts"),
    canonical_name = c("qbwght", "qbwghts", "qbwght", "qbwghts", "qbwghtw", "qbwght", "qbwghts"),
    variable_label = c(
      "weight at birth in grams",
      "weight at birth in grams: source",
      "weight at birth in grams",
      "weight at birth in grams: source",
      "weight at birth in grams: which source",
      "weight at birth in grams",
      "weight at birth in grams: source"
    ),
    harmonized_var_label = c(
      "weight at birth in grams",
      "weight at birth in grams: source",
      "weight at birth in grams",
      "weight at birth in grams: source",
      "weight at birth in grams: which source",
      "weight at birth in grams",
      "weight at birth in grams: source"
    ),
    var_type = c(
      "numeric",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qbwght = list(
      `2B` = no_answer,
      `3B` = no_answer,
      E = no_answer
    ),
    qbwghts = list(
      `2B` = checked_in_documentation_known_without_check_estimation,
      `3B` = checked_in_documentation_known_without_check_estimation,
      E = checked_in_documentation_known_without_check_estimation
    ),
    qbwghtw = list(
      `3B` = c(
        `-1` = "no answer",
        `1` = "birth certificate",
        `2` = "birth announcement card",
        `3` = "baby book",
        `4` = "other"
      )
    )
  ),

  value_labels_harmonized = list(
    qbwght = not_available,
    qbwghts = c(
      `-1` = "not available",
      `1` = "checked in documentation",
      `2` = "known without check",
      `3` = "estimation"
    ),
    qbwghtw = c(
      `-1` = "not available",
      `1` = "birth certificate",
      `2` = "birth announcement card",
      `3` = "baby book",
      `4` = "other"
    )
  )
)
