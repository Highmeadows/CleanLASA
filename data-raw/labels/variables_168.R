## LASA filecode 168 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_168 <- list(
  variables = data.frame(
    wave = c("3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B"),
    variable_name = c(
      "bmcat1",
      "bmcat2",
      "bmcat3",
      "bmcat4",
      "bmcat5",
      "bmcat6",
      "bmcat7",
      "bmcat8",
      "bmcattot",
      "bmlftd",
      "bmlftrn"
    ),
    canonical_name = c(
      "mcat1",
      "mcat2",
      "mcat3",
      "mcat4",
      "mcat5",
      "mcat6",
      "mcat7",
      "mcat8",
      "mcattot",
      "mlftd",
      "mlftrn"
    ),
    variable_label = c(
      "CAT1: cough",
      "CAT2: production of phlegm",
      "CAT3: chest tightness",
      "CAT4: breathlessness",
      "CAT5: activity limitation",
      "CAT6: confidence",
      "CAT7: sleep",
      "CAT8: energy",
      "CAT total score",
      "Long function: test done",
      "Long function: reason test not done"
    ),
    harmonized_var_label = c(
      "CAT1: cough",
      "CAT2: production of phlegm",
      "CAT3: chest tightness",
      "CAT4: breathlessness",
      "CAT5: activity limitation",
      "CAT6: confidence",
      "CAT7: sleep",
      "CAT8: energy",
      "CAT total score",
      "long-function test done",
      "reason long-function test not done"
    ),
    var_type = c(
      "text",
      "text",
      "text",
      "text",
      "text",
      "text",
      "text",
      "text",
      "numeric",
      "categorical",
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mcat1 = list(
      `3B` = no_answer_asked
    ),
    mcat2 = list(
      `3B` = no_answer_asked
    ),
    mcat3 = list(
      `3B` = no_answer_asked
    ),
    mcat4 = list(
      `3B` = no_answer_asked
    ),
    mcat5 = list(
      `3B` = no_answer_asked
    ),
    mcat6 = list(
      `3B` = no_answer_asked
    ),
    mcat7 = list(
      `3B` = no_answer_asked
    ),
    mcat8 = list(
      `3B` = no_answer_asked
    ),
    mcattot = list(
      `3B` = no_valid_data
    ),
    mlftd = list(
      `3B` = c(`-1` = "no answer, asked", `2` = "yes")
    ),
    mlftrn = list(
      `3B` = device_not_working_or_parts_missing_physical_reasons
    )
  ),

  value_labels_harmonized = list(
    mcat1 = na_asked,
    mcat2 = na_asked,
    mcat3 = na_asked,
    mcat4 = na_asked,
    mcat5 = na_asked,
    mcat6 = na_asked,
    mcat7 = na_asked,
    mcat8 = na_asked,
    mcattot = no_valid_data,
    mlftd = c(`-1` = "test not completed / no response", `2` = "yes"),
    mlftrn = device_not_working_or_parts_missing_physical_reasons
  )
)
