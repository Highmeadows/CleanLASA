## LASA filecode 105 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_105 <- list(
  variables = data.frame(
    wave = c("3B", "3B", "3B", "MB", "MB", "MB"),
    variable_name = c("bqrco03", "bqrco05", "bqrco07", "brco03", "brco05", "brco07"),
    canonical_name = c("qrco03", "qrco05", "qrco07", "rco03", "rco05", "rco07"),
    variable_label = c(
      "Religious coping 03: in crisis turn to God",
      "Religious coping 05: confess sins and ask forgiveness",
      "Religious coping 07: God abandoned me",
      "Religious coping 03: in crisis turn to God",
      "Religious coping 05: confess sins and ask forgiveness",
      "Religious coping 07: God abandoned me"
    ),
    harmonized_var_label = c(
      "Religious coping 03: in crisis turn to God",
      "Religious coping 05: confess sins and ask forgiveness",
      "Religious coping 07: God abandoned me",
      "Religious coping 03: in crisis turn to God",
      "Religious coping 05: confess sins and ask forgiveness",
      "Religious coping 07: God abandoned me"
    ),
    var_type = c("categorical", "categorical", "categorical", "categorical", "categorical", "categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qrco03 = list(
      `3B` = never_sometimes_regularly_very_often
    ),
    qrco05 = list(
      `3B` = never_sometimes_regularly_very_often
    ),
    qrco07 = list(
      `3B` = never_sometimes_regularly_very_often
    ),
    rco03 = list(
      MB = never_sometimes_regularly_very_often
    ),
    rco05 = list(
      MB = never_sometimes_regularly_very_often
    ),
    rco07 = list(
      MB = never_sometimes_regularly_very_often
    )
  ),

  value_labels_harmonized = list(
    qrco03 = never_sometimes_regularly_very_often_2,
    qrco05 = never_sometimes_regularly_very_often_2,
    qrco07 = never_sometimes_regularly_very_often_2,
    rco03 = never_sometimes_regularly_very_often_2,
    rco05 = never_sometimes_regularly_very_often_2,
    rco07 = never_sometimes_regularly_very_often_2
  )
)
