## LASA filecode 029 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_029 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "B", "B"),
    variable_name = c("bmetaem1", "bmetaem2", "bmetaem3", "bmetaem4", "brmmeemo"),
    canonical_name = c("metaem1", "metaem2", "metaem3", "metaem4", "rmmeemo"),
    variable_label = c(
      "Meta emotion item 01: emotional",
      "Meta emotion item 02: feelings",
      "Meta emotion item 03: satisfied",
      "Meta emotion item 04: change",
      "Reason missing: Meta emotion"
    ),
    harmonized_var_label = c(
      "Meta emotion item 01: emotional",
      "Meta emotion item 02: feelings",
      "Meta emotion item 03: satisfied",
      "Meta emotion item 04: change",
      "Reason missing: Meta emotion"
    ),
    var_type = c("categorical", "categorical", "categorical", "categorical", "categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    metaem1 = list(
      B = c(
        `-2` = "na, see BRMMEEMO",
        `-1` = "na, asked",
        `1` = "absolutely not emotional",
        `2` = "a little emotional",
        `3` = "fairly emotional",
        `4` = "very emotional"
      )
    ),
    metaem2 = list(
      B = c(
        `-2` = "na, see BRMMEEMO",
        `-1` = "na, asked",
        `1` = "very little",
        `2` = "little",
        `3` = "much",
        `4` = "very much"
      )
    ),
    metaem3 = list(
      B = c(
        `-2` = "na, see BRMMEEMO",
        `-1` = "na, asked",
        `1` = "not satisfied at all",
        `2` = "a bit satisfied",
        `3` = "rather satisfied",
        `4` = "very satisfied"
      )
    ),
    metaem4 = list(
      B = c(
        `-2` = "na, see BRMMEEMO",
        `-1` = "na, asked",
        `1` = "rarely or never",
        `2` = "sometimes",
        `3` = "often",
        `4` = "very often"
      )
    ),
    rmmeemo = list(
      B = short_interview_interview_terminated_no_valid_data
    )
  ),

  value_labels_harmonized = list(
    metaem1 = c(
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "absolutely not emotional",
      `2` = "a little emotional",
      `3` = "fairly emotional",
      `4` = "very emotional"
    ),
    metaem2 = c(
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "very little",
      `2` = "little",
      `3` = "much",
      `4` = "very much"
    ),
    metaem3 = c(
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "not satisfied at all",
      `2` = "a bit satisfied",
      `3` = "rather satisfied",
      `4` = "very satisfied"
    ),
    metaem4 = c(
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "rarely or never",
      `2` = "sometimes",
      `3` = "often",
      `4` = "very often"
    ),
    rmmeemo = short_interview_interview_terminated_no_valid_data
  )
)
