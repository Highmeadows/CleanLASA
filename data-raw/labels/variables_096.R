## LASA filecode 096 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_096 <- list(
  variables = data.frame(
    wave = c(
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
      "3B",
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
      "bbowmf",
      "bpd01",
      "bpd02",
      "bpd03",
      "bpd04",
      "bpd05",
      "bpd06",
      "bpd07",
      "bpd08",
      "bpd09",
      "bremdis",
      "bbowmf",
      "bpd01",
      "bpd02",
      "bpd03",
      "bpd04",
      "bpd05",
      "bpd06",
      "bpd07",
      "bpd08",
      "bpd09",
      "bremdis"
    ),
    canonical_name = c(
      "bowmf",
      "pd01",
      "pd02",
      "pd03",
      "pd04",
      "pd05",
      "pd06",
      "pd07",
      "pd08",
      "pd09",
      "remdis",
      "bowmf",
      "pd01",
      "pd02",
      "pd03",
      "pd04",
      "pd05",
      "pd06",
      "pd07",
      "pd08",
      "pd09",
      "remdis"
    ),
    variable_label = c(
      "bowel movement frequency",
      "PD01: difficulty getting up from a chair",
      "PD02: handwriting smaller",
      "PD03: someone noticed your voice softer",
      "PD04: insecure while walking",
      "PD05: feel feet sticking to floor",
      "PD06: someone noticed your face less expression",
      "PD07: trembling arms or legs",
      "PD08: difficulty sealing buttons",
      "PD09: small shuffling steps walking",
      "REM sleep behaviour disorder",
      "bowel movement frequency",
      "PD01: difficulty getting up from a chair",
      "PD02: handwriting smaller",
      "PD03: someone noticed your voice softer",
      "PD04: insecure while walking",
      "PD05: feel feet sticking to floor",
      "PD06: someone noticed your face less expression",
      "PD07: trembling arms or legs",
      "PD08: difficulty sealing buttons",
      "PD09: small shuffling steps walking",
      "REM sleep behaviour disorder"
    ),
    harmonized_var_label = c(
      "bowel movement frequency",
      "PD01: difficulty getting up from a chair",
      "PD02: handwriting smaller",
      "PD03: someone noticed your voice softer",
      "PD04: insecure while walking",
      "PD05: feel feet sticking to floor",
      "PD06: someone noticed your face less expression",
      "PD07: trembling arms or legs",
      "PD08: difficulty sealing buttons",
      "PD09: small shuffling steps walking",
      "REM sleep behaviour disorder",
      "bowel movement frequency",
      "PD01: difficulty getting up from a chair",
      "PD02: handwriting smaller",
      "PD03: someone noticed your voice softer",
      "PD04: insecure while walking",
      "PD05: feel feet sticking to floor",
      "PD06: someone noticed your face less expression",
      "PD07: trembling arms or legs",
      "PD08: difficulty sealing buttons",
      "PD09: small shuffling steps walking",
      "REM sleep behaviour disorder"
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
    bowmf = list(
      `3B` = less_than_once_a_day_once_a_day_twice_a_day,
      MB = less_than_once_a_day_once_a_day_twice_a_day
    ),
    pd01 = list(
      `3B` = no_yes_5,
      MB = no_yes_5
    ),
    pd02 = list(
      `3B` = no_yes_5,
      MB = c(
        `-5` = "na, interview terminated",
        `-2` = "R cannot write",
        `-1` = "na, asked",
        `1` = "no",
        `2` = "yes"
      )
    ),
    pd03 = list(
      `3B` = no_yes_5,
      MB = no_yes_5
    ),
    pd04 = list(
      `3B` = no_yes_5,
      MB = no_yes_5
    ),
    pd05 = list(
      `3B` = no_yes_5,
      MB = no_yes_5
    ),
    pd06 = list(
      `3B` = no_yes_5,
      MB = no_yes_5
    ),
    pd07 = list(
      `3B` = no_yes_5,
      MB = no_yes_5
    ),
    pd08 = list(
      `3B` = no_yes_5,
      MB = no_yes_5
    ),
    pd09 = list(
      `3B` = no_yes_5,
      MB = no_yes_5
    ),
    remdis = list(
      `3B` = no_yes_5,
      MB = no_yes_5
    )
  ),

  value_labels_harmonized = list(
    bowmf = c(
      `-5` = "interview terminated",
      `-1` = "not available, asked",
      `1` = "less than once a day",
      `2` = "once a day",
      `3` = "twice a day",
      `4` = "more than twice a day"
    ),
    pd01 = no_yes_67,
    pd02 = c(
      `-5` = "interview terminated",
      `-2` = "R cannot write",
      `-1` = "not available, asked",
      `1` = "no",
      `2` = "yes"
    ),
    pd03 = no_yes_67,
    pd04 = no_yes_67,
    pd05 = no_yes_67,
    pd06 = no_yes_67,
    pd07 = no_yes_67,
    pd08 = no_yes_67,
    pd09 = no_yes_67,
    remdis = no_yes_67
  )
)
