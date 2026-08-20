## LASA filecode 121 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_121 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "C", "C", "C", "D", "D", "D"),
    variable_name = c(
      "bqsocp01",
      "bqsocp02",
      "bqsocp03",
      "cqsocp01",
      "cqsocp02",
      "cqsocp03",
      "dqsocp01",
      "dqsocp02",
      "dqsocp03"
    ),
    canonical_name = c(
      "qsocp01",
      "qsocp02",
      "qsocp03",
      "qsocp01",
      "qsocp02",
      "qsocp03",
      "qsocp01",
      "qsocp02",
      "qsocp03"
    ),
    variable_label = c(
      "conversation about magazine/paper",
      "conversation about life",
      "make calculations",
      "conversation about magazine/paper",
      "conversation about life",
      "make calculations",
      "conversation about magazine/paper",
      "conversation about life",
      "make calculations"
    ),
    harmonized_var_label = c(
      "conversation about magazine/paper",
      "conversation about life",
      "make calculations",
      "conversation about magazine/paper",
      "conversation about life",
      "make calculations",
      "conversation about magazine/paper",
      "conversation about life",
      "make calculations"
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
    qsocp01 = list(
      B = rarely_or_never_monthly_weekly_or_more_often,
      C = rarely_or_never_monthly_weekly_or_more_often,
      D = rarely_or_never_monthly_weekly_or_more_often
    ),
    qsocp02 = list(
      B = rarely_or_never_monthly_weekly_or_more_often,
      C = rarely_or_never_monthly_weekly_or_more_often,
      D = rarely_or_never_monthly_weekly_or_more_often
    ),
    qsocp03 = list(
      B = rarely_or_never_monthly_weekly_or_more_often,
      C = rarely_or_never_monthly_weekly_or_more_often,
      D = rarely_or_never_monthly_weekly_or_more_often
    )
  ),

  value_labels_harmonized = list(
    qsocp01 = rarely_or_never_monthly_weekly_or_more_often_2,
    qsocp02 = rarely_or_never_monthly_weekly_or_more_often_2,
    qsocp03 = rarely_or_never_monthly_weekly_or_more_often_2
  )
)
