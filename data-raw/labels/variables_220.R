## LASA filecode 220 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_220 <- list(
  variables = data.frame(
    wave = c("3B", "3B", "3B", "3B", "3B", "3B"),
    variable_name = c("BDSBSP", "BDSBW", "BDSFSP", "BDSFW", "BDSTOT", "BRMDS"),
    canonical_name = c("dsbsp", "dsbw", "dsfsp", "dsfw", "dstot", "rmds"),
    variable_label = c(
      "WAIS Digit Span: Span backwards",
      "WAIS Digit Span: number of correct backward items",
      "WAIS Digit Span: Span forwards",
      "WAIS Digit Span: number of correct forward items",
      "WAIS Digit Span: total number of correct items",
      "reason missing Digit Span"
    ),
    harmonized_var_label = c(
      "WAIS Digit Span backward span",
      "WAIS Digit Span number of correct backward items",
      "WAIS Digit Span forward span",
      "WAIS Digit Span number of correct forward items",
      "WAIS Digit Span total number of correct items",
      "Reason for missing Digit Span score"
    ),
    var_type = c("numeric", "numeric", "numeric", "numeric", "numeric", "categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    dsbsp = list(
      `3B` = no_score_see_brmds_no_score_too_many_missings
    ),
    dsbw = list(
      `3B` = no_score_see_brmds_no_score_too_many_missings
    ),
    dsfsp = list(
      `3B` = no_score_see_brmds_no_score_too_many_missings
    ),
    dsfw = list(
      `3B` = no_score_see_brmds_no_score_too_many_missings
    ),
    dstot = list(
      `3B` = no_score_see_brmds_no_score_too_many_missings
    ),
    rmds = list(
      `3B` = short_interview_interview_terminated_too_many_missings_4
    )
  ),

  value_labels_harmonized = list(
    dsbsp = no_score_see_brmds_no_score_too_many_missings,
    dsbw = no_score_see_brmds_no_score_too_many_missings,
    dsfsp = no_score_see_brmds_no_score_too_many_missings,
    dsfw = no_score_see_brmds_no_score_too_many_missings,
    dstot = no_score_see_brmds_no_score_too_many_missings,
    rmds = short_interview_interview_terminated_too_many_missings_4
  )
)
