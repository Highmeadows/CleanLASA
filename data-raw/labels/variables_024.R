## LASA filecode 024 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_024 <- list(
  variables = data.frame(
    wave = c("B", "B", "B"),
    variable_name = c("bmecog1", "bmecog2", "bmecog3"),
    canonical_name = c("mecog1", "mecog2", "mecog3"),
    variable_label = c(
      "Evaluation Raven test: relaxation",
      "Present capability raven test",
      "Future capability raven test: better"
    ),
    harmonized_var_label = c(
      "Evaluation Raven test: relaxation",
      "Present capability raven test",
      "Future capability raven test: better"
    ),
    var_type = c("categorical", "categorical", "categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mecog1 = list(
      B = c(
        `-5` = "interview broken off",
        `-4` = "no answer, short version",
        `-1` = "asked, no answer",
        `0` = "no answer",
        `1` = "very tense",
        `2` = "tensed",
        `3` = "not tense, not relaxed",
        `4` = "relaxed",
        `5` = "very relaxed"
      )
    ),
    mecog2 = list(
      B = c(
        `-5` = "interview broken off",
        `-4` = "no answer, short version",
        `-1` = "asked, no answer",
        `0` = "no answer",
        `1` = "very bad",
        `2` = "bad",
        `3` = "fair",
        `4` = "good",
        `5` = "very good"
      )
    ),
    mecog3 = list(
      B = c(
        `-5` = "interview broken off",
        `-4` = "no answer, short version",
        `-1` = "asked, no answer",
        `0` = "no answer",
        `1` = "no, certain",
        `2` = "no probably",
        `3` = "maybe yes/no",
        `4` = "yes, probably",
        `5` = "yes, certain"
      )
    )
  ),

  value_labels_harmonized = list(
    mecog1 = c(
      `-5` = "not available, interview terminated",
      `-4` = "not available, short interview",
      `-1` = "not available, asked",
      `0` = "no answer",
      `1` = "very tense",
      `2` = "tensed",
      `3` = "not tense, not relaxed",
      `4` = "relaxed",
      `5` = "very relaxed"
    ),
    mecog2 = c(
      `-5` = "not available, interview terminated",
      `-4` = "not available, short interview",
      `-1` = "not available, asked",
      `0` = "no answer",
      `1` = "very bad",
      `2` = "bad",
      `3` = "fair",
      `4` = "good",
      `5` = "very good"
    ),
    mecog3 = c(
      `-5` = "not available, interview terminated",
      `-4` = "not available, short interview",
      `-1` = "not available, asked",
      `0` = "no answer",
      `1` = "no, certain",
      `2` = "no probably",
      `3` = "maybe yes/no",
      `4` = "yes, probably",
      `5` = "yes, certain"
    )
  )
)
