## LASA filecode 020 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_020 <- list(
  variables = data.frame(
    wave = c("3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B", "3B"),
    variable_name = c(
      "bDSb01",
      "bDSb02",
      "bDSb03",
      "bDSb04",
      "bDSb05",
      "bDSb06",
      "bDSb07",
      "bDSf01",
      "bDSf02",
      "bDSf03",
      "bDSf04",
      "bDSf05",
      "bDSf06",
      "bDSf07",
      "bDSf08"
    ),
    canonical_name = c(
      "dsb01",
      "dsb02",
      "dsb03",
      "dsb04",
      "dsb05",
      "dsb06",
      "dsb07",
      "dsf01",
      "dsf02",
      "dsf03",
      "dsf04",
      "dsf05",
      "dsf06",
      "dsf07",
      "dsf08"
    ),
    variable_label = c(
      "Digit Span backwards: 2 numbers, attempt 1+2",
      "Digit Span backwards: 3 numbers, attempt 1+2",
      "Digit Span backwards: 4 numbers, attempt 1+2",
      "Digit Span backwards: 5 numbers, attempt 1+2",
      "Digit Span backwards: 6 numbers, attempt 1+2",
      "Digit Span backwards: 7 numbers, attempt 1+2",
      "Digit Span backwards: 8 numbers, attempt 1+2",
      "Digit Span forwards: 2 numbers, attempt 1+2",
      "Digit Span forwards: 3 numbers, attempt 1+2",
      "Digit Span forwards: 4 numbers, attempt 1+2",
      "Digit Span forwards: 5 numbers, attempt 1+2",
      "Digit Span forwards: 6 numbers, attempt 1+2",
      "Digit Span forwards: 7 numbers, attempt 1+2",
      "Digit Span forwards: 8 numbers, attempt 1+2",
      "Digit Span forwards: 9 numbers, attempt 1+2"
    ),
    harmonized_var_label = c(
      "Digit Span backwards: 2 numbers, attempt 1+2",
      "Digit Span backwards: 3 numbers, attempt 1+2",
      "Digit Span backwards: 4 numbers, attempt 1+2",
      "Digit Span backwards: 5 numbers, attempt 1+2",
      "Digit Span backwards: 6 numbers, attempt 1+2",
      "Digit Span backwards: 7 numbers, attempt 1+2",
      "Digit Span backwards: 8 numbers, attempt 1+2",
      "Digit Span forwards: 2 numbers, attempt 1+2",
      "Digit Span forwards: 3 numbers, attempt 1+2",
      "Digit Span forwards: 4 numbers, attempt 1+2",
      "Digit Span forwards: 5 numbers, attempt 1+2",
      "Digit Span forwards: 6 numbers, attempt 1+2",
      "Digit Span forwards: 7 numbers, attempt 1+2",
      "Digit Span forwards: 8 numbers, attempt 1+2",
      "Digit Span forwards: 9 numbers, attempt 1+2"
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
      "numeric",
      "numeric"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    dsb01 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsb02 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsb03 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsb04 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsb05 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsb06 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsb07 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsf01 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsf02 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsf03 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsf04 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsf05 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsf06 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsf07 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    ),
    dsf08 = list(
      `3B` = vs_0_correct_1_correct_2_correct_2
    )
  ),

  value_labels_harmonized = list(
    dsb01 = vs_0_correct_1_correct_2_correct_3,
    dsb02 = vs_0_correct_1_correct_2_correct_3,
    dsb03 = vs_0_correct_1_correct_2_correct_3,
    dsb04 = vs_0_correct_1_correct_2_correct_3,
    dsb05 = vs_0_correct_1_correct_2_correct_3,
    dsb06 = vs_0_correct_1_correct_2_correct_3,
    dsb07 = vs_0_correct_1_correct_2_correct_3,
    dsf01 = vs_0_correct_1_correct_2_correct_3,
    dsf02 = vs_0_correct_1_correct_2_correct_3,
    dsf03 = vs_0_correct_1_correct_2_correct_3,
    dsf04 = vs_0_correct_1_correct_2_correct_3,
    dsf05 = vs_0_correct_1_correct_2_correct_3,
    dsf06 = vs_0_correct_1_correct_2_correct_3,
    dsf07 = vs_0_correct_1_correct_2_correct_3,
    dsf08 = vs_0_correct_1_correct_2_correct_3
  )
)
