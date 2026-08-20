## LASA filecode 143 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_143 <- list(
  variables = data.frame(
    wave = c("2B", "2B", "2B", "2B"),
    variable_name = c("bqmetem1", "bqmetem2", "bqmetem3", "bqmetem4"),
    canonical_name = c("qmetem1", "qmetem2", "qmetem3", "qmetem4"),
    variable_label = c(
      "meta emotion item 01: emotional",
      "meta emotion item 02: feelings",
      "meta emotion item 03: satisfied",
      "meta emotion item 04: change"
    ),
    harmonized_var_label = c(
      "meta emotion item 01: emotional",
      "meta emotion item 02: feelings",
      "meta emotion item 03: satisfied",
      "meta emotion item 04: change"
    ),
    var_type = c("categorical", "categorical", "categorical", "categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qmetem1 = list(
      `2B` = c(
        `-1` = "no answer",
        `1` = "absolutely not emotional",
        `2` = "a little emotional",
        `3` = "fairly emotional",
        `4` = "very emotional"
      )
    ),
    qmetem2 = list(
      `2B` = c(`-1` = "no answer", `1` = "very little", `2` = "little", `3` = "much", `4` = "very much")
    ),
    qmetem3 = list(
      `2B` = c(
        `-1` = "no answer",
        `1` = "absolutely not satisfied",
        `2` = "a bit satisfied",
        `3` = "rather satisfied",
        `4` = "very satisfied"
      )
    ),
    qmetem4 = list(
      `2B` = c(
        `-1` = "no answer",
        `1` = "rarely or never",
        `2` = "sometimes",
        `3` = "often",
        `4` = "very often"
      )
    )
  ),

  value_labels_harmonized = list(
    qmetem1 = c(
      `-1` = "not available",
      `1` = "absolutely not emotional",
      `2` = "a little emotional",
      `3` = "fairly emotional",
      `4` = "very emotional"
    ),
    qmetem2 = c(`-1` = "not available", `1` = "very little", `2` = "little", `3` = "much", `4` = "very much"),
    qmetem3 = c(
      `-1` = "not available",
      `1` = "absolutely not satisfied",
      `2` = "a bit satisfied",
      `3` = "rather satisfied",
      `4` = "very satisfied"
    ),
    qmetem4 = c(
      `-1` = "not available",
      `1` = "rarely or never",
      `2` = "sometimes",
      `3` = "often",
      `4` = "very often"
    )
  )
)
