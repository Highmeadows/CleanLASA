## LASA filecode 116 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_116 <- list(
  variables = data.frame(
    wave = c("B", "B"),
    variable_name = c("bqdecu01", "bqdecu02"),
    canonical_name = c("qdecu01", "qdecu02"),
    variable_label = c(
      "Decubitus: suffering bed sores (Self adm. questionnaire)",
      "Decubitus: treatment (Self adm. questionnaire)"
    ),
    harmonized_var_label = c(
      "Decubitus: suffering bed sores (Self adm. questionnaire)",
      "Decubitus: treatment (Self adm. questionnaire)"
    ),
    var_type = c("categorical", "categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qdecu01 = list(
      B = c(
        `-1` = "no answer",
        `1` = "no",
        `2` = "yes, <two weeks",
        `3` = "yes, 2wks><3mths",
        `4` = "yes, >3months"
      )
    ),
    qdecu02 = list(
      B = no_yes_3
    )
  ),

  value_labels_harmonized = list(
    qdecu01 = c(
      `-1` = "not available",
      `1` = "no",
      `2` = "yes, <two weeks",
      `3` = "yes, 2wks><3mths",
      `4` = "yes, >3months"
    ),
    qdecu02 = no_yes_33
  )
)
