## LASA filecode 221 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_221 <- list(
  variables = data.frame(
    wave = c("2B", "3B", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "MB", "MB"),
    variable_name = c(
      "bmmsesc",
      "bmmsesc",
      "bmmsesc",
      "cmmsesc",
      "dmmsesc",
      "emmsesc",
      "fmmsesc",
      "gmmsesc",
      "hmmsesc",
      "immsesc",
      "jmmsesc",
      "kmmsesc",
      "bmmsesc1",
      "bmmsesc2"
    ),
    canonical_name = c(
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc",
      "mmsesc2"
    ),
    variable_label = c(
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "MMSE-score based on maximum spel/num",
      "Illiterate MMSE-score based on spelling"
    ),
    harmonized_var_label = c(
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "MMSE score based on maximum spelling/number performance",
      "Illiterate MMSE score based on spelling"
    ),
    var_type = c(
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric",
      "numeric"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mmsesc = list(
      `2B` = interview_terminated_no_scale_too_many_missing,
      `3B` = interview_terminated_no_scale_too_many_missing,
      B = c(`-2` = "no scale (too many missing)", `2` = NA_character_, `30` = NA_character_),
      C = c(`-2` = "no scale (too many missing)", `1` = NA_character_, `30` = NA_character_),
      D = interview_terminated_no_scale_too_many_missing,
      E = interview_terminated_no_scale_too_many_missing,
      F = interview_terminated_no_scale_too_many_missing,
      G = interview_terminated_no_scale_too_many_missing,
      H = interview_terminated_no_scale_too_many_missing,
      I = interview_terminated_no_scale_too_many_missing,
      J = interview_terminated_no_scale_too_many_missing,
      K = interview_terminated_no_scale_too_many_missing,
      MB = na_see_bmmsevrs_na_no_valid_data_interview_terminated
    ),
    mmsesc2 = list(
      MB = na_see_bmmsevrs_na_no_valid_data_interview_terminated
    )
  ),

  value_labels_harmonized = list(
    mmsesc = c(
      `-5` = "no valid data",
      `-4` = "na, no valid data",
      `-3` = "interview terminated",
      `-2` = "no scale (too many missing)",
      `1` = NA_character_,
      `2` = NA_character_,
      `30` = NA_character_
    ),
    mmsesc2 = c(
      `-5` = "no valid data",
      `-4` = "na, no valid data",
      `-3` = "interview terminated",
      `-2` = "no scale (too many missing)",
      `1` = NA_character_,
      `30` = NA_character_
    )
  )
)
