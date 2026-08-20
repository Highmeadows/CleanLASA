## LASA filecode 119 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_119 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B"),
    variable_name = c(
      "bqmeno01",
      "bqmeno02",
      "bqmeno03",
      "bqmeno04",
      "bqmeno05",
      "bqmeno06",
      "bqmeno07",
      "bqmeno08",
      "bqmeno09",
      "bqmeno10",
      "bqmeno11",
      "bqmeno12",
      "bqmeno13"
    ),
    canonical_name = c(
      "qmeno01",
      "qmeno02",
      "qmeno03",
      "qmeno04",
      "qmeno05",
      "qmeno06",
      "qmeno07",
      "qmeno08",
      "qmeno09",
      "qmeno10",
      "qmeno11",
      "qmeno12",
      "qmeno13"
    ),
    variable_label = c(
      "menopause 01: age start period",
      "menopause 02: number of children",
      "menopause 03: age first child born",
      "menopause 04: pregnant no children",
      "menopause 05: age last period",
      "menopause 06: menopause natural",
      "menopause 07: used contraceptive pill",
      "menopause 08: # years contraceptive pill",
      "menopause 09: hot flushes",
      "menopause 10: excessive transpiration",
      "menopause 11: pain in muscles",
      "menopause 12: dry vagina",
      "menopause 13: pain during intercourse"
    ),
    harmonized_var_label = c(
      "menopause 01: age start period",
      "menopause 02: number of children",
      "menopause 03: age first child born",
      "menopause 04: pregnant no children",
      "menopause 05: age last period",
      "menopause 06: menopause natural",
      "menopause 07: used contraceptive pill",
      "menopause 08: # years contraceptive pill",
      "menopause 09: hot flushes",
      "menopause 10: excessive transpiration",
      "menopause 11: pain in muscles",
      "menopause 12: dry vagina",
      "menopause 13: pain during intercourse"
    ),
    var_type = c(
      "numeric",
      "numeric",
      "numeric",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    qmeno01 = list(
      B = no_answer_skipped_male_respondent_no_answer
    ),
    qmeno02 = list(
      B = no_answer_skipped_male_respondent_no_answer
    ),
    qmeno03 = list(
      B = no_answer_skipped_male_respondent_no_answer
    ),
    qmeno04 = list(
      B = no_yes_80
    ),
    qmeno05 = list(
      B = no_answer_skipped_male_respondent_no_answer
    ),
    qmeno06 = list(
      B = c(
        `-3` = "no answer, skipped",
        `-2` = "male respondent",
        `-1` = "no answer",
        `1` = "normal",
        `2` = "operation",
        `3` = "no menopause yet"
      )
    ),
    qmeno07 = list(
      B = no_yes_80
    ),
    qmeno08 = list(
      B = no_answer_skipped_male_respondent_no_answer
    ),
    qmeno09 = list(
      B = no_yes_80
    ),
    qmeno10 = list(
      B = no_yes_80
    ),
    qmeno11 = list(
      B = no_yes_80
    ),
    qmeno12 = list(
      B = no_yes_80
    ),
    qmeno13 = list(
      B = no_yes_80
    )
  ),

  value_labels_harmonized = list(
    qmeno01 = no_answer_skipped_male_respondent_not_available,
    qmeno02 = no_answer_skipped_male_respondent_not_available,
    qmeno03 = no_answer_skipped_male_respondent_not_available,
    qmeno04 = no_yes_81,
    qmeno05 = no_answer_skipped_male_respondent_not_available,
    qmeno06 = c(
      `-3` = "no answer, skipped",
      `-2` = "male respondent",
      `-1` = "not available",
      `1` = "normal",
      `2` = "operation",
      `3` = "no menopause yet"
    ),
    qmeno07 = no_yes_81,
    qmeno08 = no_answer_skipped_male_respondent_not_available,
    qmeno09 = no_yes_81,
    qmeno10 = no_yes_81,
    qmeno11 = no_yes_81,
    qmeno12 = no_yes_81,
    qmeno13 = no_yes_81
  )
)
