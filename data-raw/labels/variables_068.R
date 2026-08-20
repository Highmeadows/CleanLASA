## LASA filecode 068 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_068 <- list(
  variables = data.frame(
    wave = c(
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB"
    ),
    variable_name = c(
      "bmcarc1",
      "bmcarc2",
      "bmcarc3",
      "bmcarc4",
      "bmcarc5",
      "bmcarc6",
      "bmcarr01",
      "bmcarr02",
      "bmcarr03",
      "bmcarr04",
      "bmcarr05",
      "bmcarr06",
      "bmcarr07",
      "bmcarr08",
      "bmcarr09",
      "bmcarr10"
    ),
    canonical_name = c(
      "mcarc1",
      "mcarc2",
      "mcarc3",
      "mcarc4",
      "mcarc5",
      "mcarc6",
      "mcarr01",
      "mcarr02",
      "mcarr03",
      "mcarr04",
      "mcarr05",
      "mcarr06",
      "mcarr07",
      "mcarr08",
      "mcarr09",
      "mcarr10"
    ),
    variable_label = c(
      "Medical care: contact with pharmacy",
      "Medical care: contact with physician or specialist",
      "Medical care: contact with hospital or health centre",
      "Medical care: contact with dentist",
      "Medical care: contact with alternative or traditional healer",
      "Medical care: contact with other",
      "Medical care reason: new complaint / sickness during stay",
      "Medical care reason: dissatisfaction about care in the Netherlands",
      "Medical care reason: severity of the complaint during stay",
      "Medical care reason: no language barriers with physician or specialist",
      "Medical care reason: periodic consultation / health check",
      "Medical care reason: to buy medicines not prescribed in the Netherlands",
      "Medical care reason: to buy medicines not available in the Netherlands",
      "Medical care reason: cheaper in country of origin",
      "Medical care reason: because of the waiting lists in the Netherlands",
      "Medical care reason: other"
    ),
    harmonized_var_label = c(
      "Medical care: contact with pharmacy",
      "Medical care: contact with physician or specialist",
      "Medical care: contact with hospital or health centre",
      "Medical care: contact with dentist",
      "Medical care: contact with alternative or traditional healer",
      "Medical care: contact with other",
      "Medical care reason: new complaint / sickness during stay",
      "Medical care reason: dissatisfaction about care in the Netherlands",
      "Medical care reason: severity of the complaint during stay",
      "Medical care reason: no language barriers with physician or specialist",
      "Medical care reason: periodic consultation / health check",
      "Medical care reason: to buy medicines not prescribed in the Netherlands",
      "Medical care reason: to buy medicines not available in the Netherlands",
      "Medical care reason: cheaper in country of origin",
      "Medical care reason: because of the waiting lists in the Netherlands",
      "Medical care reason: other"
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
    mcarc1 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarc2 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarc3 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarc4 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarc5 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarc6 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr01 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr02 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr03 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr04 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr05 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr06 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr07 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr08 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr09 = list(
      MB = not_mentioned_mentioned_94
    ),
    mcarr10 = list(
      MB = not_mentioned_mentioned_94
    )
  ),

  value_labels_harmonized = list(
    mcarc1 = not_mentioned_mentioned_6,
    mcarc2 = not_mentioned_mentioned_6,
    mcarc3 = not_mentioned_mentioned_6,
    mcarc4 = not_mentioned_mentioned_6,
    mcarc5 = not_mentioned_mentioned_6,
    mcarc6 = not_mentioned_mentioned_6,
    mcarr01 = not_mentioned_mentioned_6,
    mcarr02 = not_mentioned_mentioned_6,
    mcarr03 = not_mentioned_mentioned_6,
    mcarr04 = not_mentioned_mentioned_6,
    mcarr05 = not_mentioned_mentioned_6,
    mcarr06 = not_mentioned_mentioned_6,
    mcarr07 = not_mentioned_mentioned_6,
    mcarr08 = not_mentioned_mentioned_6,
    mcarr09 = not_mentioned_mentioned_6,
    mcarr10 = not_mentioned_mentioned_6
  )
)
