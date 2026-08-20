## LASA filecode 092 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_092 <- list(
  variables = data.frame(
    wave = c("D", "D", "D", "D", "D"),
    variable_name = c("dfademen", "dfatreat", "dmodemen", "dmotreat", "drmpar"),
    canonical_name = c("fademen", "fatreat", "modemen", "motreat", "rmpar"),
    variable_label = c(
      "dementia father",
      "treatment dementia father",
      "dementia mother",
      "treatment dementia mother",
      "reason no valid data on parents"
    ),
    harmonized_var_label = c(
      "dementia father",
      "treatment dementia father",
      "dementia mother",
      "treatment dementia mother",
      "reason no valid data on parents"
    ),
    var_type = c("categorical", "categorical", "categorical", "categorical", "categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    fademen = list(
      D = yes_no_12
    ),
    fatreat = list(
      D = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see DFADEMEN",
        `-1` = "na, asked",
        `1` = "yes",
        `2` = "no"
      )
    ),
    modemen = list(
      D = yes_no_12
    ),
    motreat = list(
      D = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see DMODEMEN",
        `-1` = "na, asked",
        `1` = "yes",
        `2` = "no"
      )
    ),
    rmpar = list(
      D = short_version_interview_terminated
    )
  ),

  value_labels_harmonized = list(
    fademen = yes_no_9,
    fatreat = yes_no_9,
    modemen = yes_no_9,
    motreat = yes_no_9,
    rmpar = short_version_interview_terminated
  )
)
