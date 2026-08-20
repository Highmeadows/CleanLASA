## LASA filecode 136 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_136 <- list(
  variables = data.frame(
    wave = c("E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E"),
    variable_name = c(
      "eqworr01",
      "eqworr02",
      "eqworr03",
      "eqworr04",
      "eqworr05",
      "eqworr06",
      "eqworr07",
      "eqworr08",
      "eqworr09",
      "eqworr10",
      "eqworr11",
      "eqworr12",
      "eqworr13",
      "eqworr14",
      "eqworr15",
      "eqworr16"
    ),
    canonical_name = c(
      "qworr01",
      "qworr02",
      "qworr03",
      "qworr04",
      "qworr05",
      "qworr06",
      "qworr07",
      "qworr08",
      "qworr09",
      "qworr10",
      "qworr11",
      "qworr12",
      "qworr13",
      "qworr14",
      "qworr15",
      "qworr16"
    ),
    variable_label = c(
      "Worry 01: not enough time",
      "Worry 02: overpower",
      "Worry 03: no tendency to worry",
      "Worry 04: situations trigger",
      "Worry 05: cannot help it",
      "Worry 06: under pressure",
      "Worry 07: all the time",
      "Worry 08: overcome easy",
      "Worry 09: tasks ahead",
      "Worry 10: never",
      "Worry 11: no influence",
      "Worry 12: all my life",
      "Worry 13: notice it",
      "Worry 14: cannot stop",
      "Worry 15: constantly",
      "Worry 16: when finished"
    ),
    harmonized_var_label = c(
      "Worry 01: not enough time",
      "Worry 02: overpower",
      "Worry 03: no tendency to worry",
      "Worry 04: situations trigger",
      "Worry 05: cannot help it",
      "Worry 06: under pressure",
      "Worry 07: all the time",
      "Worry 08: overcome easy",
      "Worry 09: tasks ahead",
      "Worry 10: never",
      "Worry 11: no influence",
      "Worry 12: all my life",
      "Worry 13: notice it",
      "Worry 14: cannot stop",
      "Worry 15: constantly",
      "Worry 16: when finished"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qworr01 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr02 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr03 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr04 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr05 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr06 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr07 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr08 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr09 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr10 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr11 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr12 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr13 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr14 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr15 = list(
      E = not_at_all_characteristic_not_characteristic
    ),
    qworr16 = list(
      E = not_at_all_characteristic_not_characteristic
    )
  ),

  value_labels_harmonized = list(
    qworr01 = not_at_all_characteristic_not_characteristic_2,
    qworr02 = not_at_all_characteristic_not_characteristic_2,
    qworr03 = not_at_all_characteristic_not_characteristic_2,
    qworr04 = not_at_all_characteristic_not_characteristic_2,
    qworr05 = not_at_all_characteristic_not_characteristic_2,
    qworr06 = not_at_all_characteristic_not_characteristic_2,
    qworr07 = not_at_all_characteristic_not_characteristic_2,
    qworr08 = not_at_all_characteristic_not_characteristic_2,
    qworr09 = not_at_all_characteristic_not_characteristic_2,
    qworr10 = not_at_all_characteristic_not_characteristic_2,
    qworr11 = not_at_all_characteristic_not_characteristic_2,
    qworr12 = not_at_all_characteristic_not_characteristic_2,
    qworr13 = not_at_all_characteristic_not_characteristic_2,
    qworr14 = not_at_all_characteristic_not_characteristic_2,
    qworr15 = not_at_all_characteristic_not_characteristic_2,
    qworr16 = not_at_all_characteristic_not_characteristic_2
  )
)
