## LASA filecode 138 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_138 <- list(
  variables = data.frame(
    wave = c("E", "E", "E", "E", "E", "E"),
    variable_name = c("eqreli02", "eqreli03", "eqreli04", "eqreli05", "eqreli06", "eqreli07"),
    canonical_name = c("qreli02", "qreli03", "qreli04", "qreli05", "qreli06", "qreli07"),
    variable_label = c("Life after death", "Heaven", "Hell", "Devil", "Adam and Eve", "Bible as word God"),
    harmonized_var_label = c("Life after death", "Heaven", "Hell", "Devil", "Adam and Eve", "Bible as word God"),
    var_type = c("categorical", "categorical", "categorical", "categorical", "categorical", "categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qreli02 = list(
      E = yes_no
    ),
    qreli03 = list(
      E = yes_no
    ),
    qreli04 = list(
      E = yes_no
    ),
    qreli05 = list(
      E = yes_no
    ),
    qreli06 = list(
      E = yes_no
    ),
    qreli07 = list(
      E = yes_no
    )
  ),

  value_labels_harmonized = list(
    qreli02 = yes_no_2,
    qreli03 = yes_no_2,
    qreli04 = yes_no_2,
    qreli05 = yes_no_2,
    qreli06 = yes_no_2,
    qreli07 = yes_no_2
  )
)
