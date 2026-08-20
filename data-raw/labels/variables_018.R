## LASA filecode 018 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_018 <- list(
  variables = data.frame(
    wave = c("B"),
    variable_name = c("bhinsura"),
    canonical_name = c("hinsura"),
    variable_label = c("HEALTH INSURANCE"),
    harmonized_var_label = c("HEALTH INSURANCE"),
    var_type = c("categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    hinsura = list(
      B = c(
        `-5` = "no insurance",
        `-1` = "na, do not know",
        `1` = "sick-fund: mandatory",
        `2` = "sick-fund: voluntary",
        `3` = "private Insurance"
      )
    )
  ),

  value_labels_harmonized = list(
    hinsura = c(
      `-5` = "no insurance",
      `-1` = "not available, do not know",
      `1` = "sick-fund: mandatory",
      `2` = "sick-fund: voluntary",
      `3` = "private insurance"
    )
  )
)
