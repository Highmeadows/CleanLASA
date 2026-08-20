## LASA filecode 169 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_169 <- list(
  variables = data.frame(
    wave = c("J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J", "J"),
    variable_name = c(
      "jmdexp1",
      "jmdexp2",
      "jmdexp3",
      "jmdexp4",
      "jmdexp5",
      "jmdexp61",
      "jmdexp62",
      "jmdexp63",
      "jmdexp64",
      "jmdexp65",
      "jmdexp66",
      "jmdexp67",
      "jmdexp68",
      "jmdexp69"
    ),
    canonical_name = c(
      "mdexp1",
      "mdexp2",
      "mdexp3",
      "mdexp4",
      "mdexp5",
      "mdexp61",
      "mdexp62",
      "mdexp63",
      "mdexp64",
      "mdexp65",
      "mdexp66",
      "mdexp67",
      "mdexp68",
      "mdexp69"
    ),
    variable_label = c(
      "daily experiences: treated with less respect",
      "daily experiences: lower service level in restaurants/shops",
      "daily experiences: people assuming I am not smart",
      "daily experiences: being harassed",
      "daily experiences: less good treatment from doctors or in hospitals",
      "perceived reason experience: your gender",
      "perceived reason experience: your ethnicity",
      "perceived reason experience: your age",
      "perceived reason experience: your weight",
      "perceived reason experience: a physical disability",
      "perceived reason experience: an aspect of your physical appearance",
      "perceived reason experience: your sexual orientation",
      "perceived reason experience: your financial situation",
      "perceived reason experience: other"
    ),
    harmonized_var_label = c(
      "daily experiences: treated with less respect",
      "daily experiences: lower service level in restaurants/shops",
      "daily experiences: people assuming I am not smart",
      "daily experiences: being harassed",
      "daily experiences: less good treatment from doctors or in hospitals",
      "perceived reason for experience: your gender",
      "perceived reason for experience: your ethnicity",
      "perceived reason for experience: your age",
      "perceived reason for experience: your weight",
      "perceived reason for experience: a physical disability",
      "perceived reason for experience: an aspect of your physical appearance",
      "perceived reason for experience: your sexual orientation",
      "perceived reason for experience: your financial situation",
      "perceived reason for experience: other"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mdexp1 = list(
      J = almost_daily_at_least_once_a_week_few_times_a_month
    ),
    mdexp2 = list(
      J = almost_daily_at_least_once_a_week_few_times_a_month
    ),
    mdexp3 = list(
      J = almost_daily_at_least_once_a_week_few_times_a_month
    ),
    mdexp4 = list(
      J = almost_daily_at_least_once_a_week_few_times_a_month
    ),
    mdexp5 = list(
      J = almost_daily_at_least_once_a_week_few_times_a_month
    ),
    mdexp61 = list(
      J = not_mentioned_mentioned_90
    ),
    mdexp62 = list(
      J = not_mentioned_mentioned_90
    ),
    mdexp63 = list(
      J = not_mentioned_mentioned_90
    ),
    mdexp64 = list(
      J = not_mentioned_mentioned_90
    ),
    mdexp65 = list(
      J = not_mentioned_mentioned_90
    ),
    mdexp66 = list(
      J = not_mentioned_mentioned_90
    ),
    mdexp67 = list(
      J = not_mentioned_mentioned_90
    ),
    mdexp68 = list(
      J = not_mentioned_mentioned_90
    ),
    mdexp69 = list(
      J = not_mentioned_mentioned_90
    )
  ),

  value_labels_harmonized = list(
    mdexp1 = almost_daily_at_least_once_a_week_few_times_a_month,
    mdexp2 = almost_daily_at_least_once_a_week_few_times_a_month,
    mdexp3 = almost_daily_at_least_once_a_week_few_times_a_month,
    mdexp4 = almost_daily_at_least_once_a_week_few_times_a_month,
    mdexp5 = almost_daily_at_least_once_a_week_few_times_a_month,
    mdexp61 = not_mentioned_mentioned_90,
    mdexp62 = not_mentioned_mentioned_90,
    mdexp63 = not_mentioned_mentioned_90,
    mdexp64 = not_mentioned_mentioned_90,
    mdexp65 = not_mentioned_mentioned_90,
    mdexp66 = not_mentioned_mentioned_90,
    mdexp67 = not_mentioned_mentioned_90,
    mdexp68 = not_mentioned_mentioned_90,
    mdexp69 = not_mentioned_mentioned_90
  )
)
