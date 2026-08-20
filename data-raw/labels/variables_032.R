## LASA filecode 032 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_032 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B"),
    variable_name = c(
      "bprefe01",
      "bprefe02",
      "bprefe03",
      "bprefe04",
      "bprefe05",
      "bprefe06",
      "bprefe07",
      "bprefe08",
      "bprefe09",
      "bprefe10",
      "bprefe11",
      "bprefe12"
    ),
    canonical_name = c(
      "prefe01",
      "prefe02",
      "prefe03",
      "prefe04",
      "prefe05",
      "prefe06",
      "prefe07",
      "prefe08",
      "prefe09",
      "prefe10",
      "prefe11",
      "prefe12"
    ),
    variable_label = c(
      "When I need help, I want to organize it",
      "When move because health I want move to",
      "When I need help, I want to organize it",
      "When move because health I want move to",
      "When I need help, I want to organize it",
      "When move because health I want move to",
      "When could choose again I would live at",
      "When could choose again I would live at",
      "When could choose again I would live at",
      "When could choose again I would live at",
      "When could choose again I would live at",
      "When could choose again I would live at"
    ),
    harmonized_var_label = c(
      "When I need help, I want to organize it",
      "When move because health I want move to",
      "When I need help, I want to organize it",
      "When move because health I want move to",
      "When I need help, I want to organize it",
      "When move because health I want move to",
      "When could choose again I would live at",
      "When could choose again I would live at",
      "When could choose again I would live at",
      "When could choose again I would live at",
      "When could choose again I would live at",
      "When could choose again I would live at"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    prefe01 = list(
      B = c(
        `-6` = "na, technical reason",
        `-5` = "na, interview terminated",
        `-4` = "na, short interview",
        `-3` = "na, wrong skip",
        `-2` = "na, BHINDEP<>1",
        `-1` = "na, asked",
        `1` = "myself",
        `2` = "by the family doctor"
      )
    ),
    prefe02 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE01",
        `-1` = "na, asked",
        `1` = "family",
        `2` = "residential home"
      )
    ),
    prefe03 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE01",
        `-1` = "na, asked",
        `1` = "by family doctor",
        `2` = "by children"
      )
    ),
    prefe04 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE01",
        `-1` = "na, asked",
        `1` = "residential home",
        `2` = "old peoples home (with service)"
      )
    ),
    prefe05 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE01",
        `-1` = "na, asked",
        `1` = "myself",
        `2` = "by children"
      )
    ),
    prefe06 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE01",
        `-1` = "na, asked",
        `1` = "family",
        `2` = "old peoples home (with service)"
      )
    ),
    prefe07 = list(
      B = c(
        `-6` = "na, technical reason",
        `-5` = "na, interview terminated",
        `-4` = "na, short interview",
        `-3` = "na, wrong skip",
        `-2` = "na, BHINDEP<>2,3,4",
        `-1` = "na, asked",
        `1` = "home",
        `2` = "residential home"
      )
    ),
    prefe08 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE07",
        `-1` = "na, asked",
        `1` = "home",
        `2` = "family"
      )
    ),
    prefe09 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE07",
        `-1` = "na, asked",
        `1` = "nursing home",
        `2` = "home"
      )
    ),
    prefe10 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE07",
        `-1` = "na, asked",
        `1` = "family",
        `2` = "nursing home"
      )
    ),
    prefe11 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE07",
        `-1` = "na, asked",
        `1` = "residential home",
        `2` = "nursing home"
      )
    ),
    prefe12 = list(
      B = c(
        `-3` = "na, wrong skip",
        `-2` = "na, see BPREFE07",
        `-1` = "na, asked",
        `1` = "residential home",
        `2` = "family"
      )
    )
  ),

  value_labels_harmonized = list(
    prefe01 = c(
      `-6` = "not available, technical reason",
      `-5` = "not available, interview terminated",
      `-4` = "not available, short interview",
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "myself",
      `2` = "by the family doctor"
    ),
    prefe02 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "family",
      `2` = "residential home"
    ),
    prefe03 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "by family doctor",
      `2` = "by children"
    ),
    prefe04 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "residential home",
      `2` = "old peoples home (with service)"
    ),
    prefe05 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "myself",
      `2` = "by children"
    ),
    prefe06 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "family",
      `2` = "old peoples home (with service)"
    ),
    prefe07 = c(
      `-6` = "not available, technical reason",
      `-5` = "not available, interview terminated",
      `-4` = "not available, short interview",
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "home",
      `2` = "residential home"
    ),
    prefe08 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "home",
      `2` = "family"
    ),
    prefe09 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "nursing home",
      `2` = "home"
    ),
    prefe10 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "family",
      `2` = "nursing home"
    ),
    prefe11 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "residential home",
      `2` = "nursing home"
    ),
    prefe12 = c(
      `-3` = "not available, wrong skip",
      `-2` = "not available, routing",
      `-1` = "not available, asked",
      `1` = "residential home",
      `2` = "family"
    )
  )
)
