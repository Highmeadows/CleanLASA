## LASA filecode 274 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_274 <- list(
  variables = data.frame(
    wave = c("D"),
    variable_name = c("dvignet"),
    canonical_name = c("vignet"),
    variable_label = c("total score vignettes FRE"),
    harmonized_var_label = c("Total vignettes FRE score"),
    var_type = c("numeric"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    vignet = list(
      D = vs_3_missings
    )
  ),

  value_labels_harmonized = list(
    vignet = vs_3_missings
  )
)
