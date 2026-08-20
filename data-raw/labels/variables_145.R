## LASA filecode 145 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_145 <- list(
  variables = data.frame(
    wave = c("3B", "3B", "3B", "F", "F", "G", "G", "MB", "MB"),
    variable_name = c(
      "bqcshape",
      "bqishape",
      "bqshap40",
      "fqcshape",
      "fqishape",
      "gqcshape",
      "gqishape",
      "bmcshape",
      "bmshap40"
    ),
    canonical_name = c(
      "qcshape",
      "qishape",
      "qshap40",
      "qcshape",
      "qishape",
      "qcshape",
      "qishape",
      "mcshape",
      "mshap40"
    ),
    variable_label = c(
      "current body shape",
      "ideal body shape",
      "Body shape at 40",
      "current body shape",
      "ideal body shape",
      "current body shape",
      "ideal body shape",
      "current body shape",
      "Body shape at 40"
    ),
    harmonized_var_label = c(
      "current body shape",
      "ideal body shape",
      "Body shape at 40",
      "current body shape",
      "ideal body shape",
      "current body shape",
      "ideal body shape",
      "current body shape",
      "Body shape at 40"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qcshape = list(
      `3B` = silhouette_1_extremely_thin_silhouette_2_silhouette_3,
      F = silhouette_1_extremely_thin_silhouette_2_silhouette_3,
      G = silhouette_1_extremely_thin_silhouette_2_silhouette_3
    ),
    qishape = list(
      `3B` = silhouette_1_extremely_thin_silhouette_2_silhouette_3,
      F = silhouette_1_extremely_thin_silhouette_2_silhouette_3,
      G = silhouette_1_extremely_thin_silhouette_2_silhouette_3
    ),
    qshap40 = list(
      `3B` = silhouette_1_extremely_thin_silhouette_2_silhouette_3
    ),
    mcshape = list(
      MB = silhouette_1_extremely_thin_silhouette_2_silhouette_3
    ),
    mshap40 = list(
      MB = silhouette_1_extremely_thin_silhouette_2_silhouette_3
    )
  ),

  value_labels_harmonized = list(
    mcshape = silhouette_1_extremely_thin_silhouette_2_silhouette_3_2,
    mshap40 = silhouette_1_extremely_thin_silhouette_2_silhouette_3_2,
    qcshape = silhouette_1_extremely_thin_silhouette_2_silhouette_3_2,
    qishape = silhouette_1_extremely_thin_silhouette_2_silhouette_3_2,
    qshap40 = silhouette_1_extremely_thin_silhouette_2_silhouette_3_2
  )
)
