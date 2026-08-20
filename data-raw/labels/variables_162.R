## LASA filecode 162 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_162 <- list(
  variables = data.frame(
    wave = c("J"),
    variable_name = c("jmlphyand"),
    canonical_name = c("mlphyand"),
    variable_label = c("number of days a week >30 min physically active"),
    harmonized_var_label = c("number of days per week >30 minutes physically active"),
    var_type = c("numeric"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mlphyand = list(
      J = vs_0_days_1_day_2_days_3_days_4_days_5_days_6_days_7_days
    )
  ),

  value_labels_harmonized = list(
    mlphyand = vs_0_days_1_day_2_days_3_days_4_days_5_days_6_days_7_days
  )
)
