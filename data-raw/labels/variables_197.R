## LASA filecode 197 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_197 <- list(
  variables = data.frame(
    wave = c("K", "K", "K", "K", "K", "K", "K", "K", "K", "K"),
    variable_name = c(
      "kmaarc1",
      "kmaarc10",
      "kmaarc2",
      "kmaarc3",
      "kmaarc4",
      "kmaarc5",
      "kmaarc6",
      "kmaarc7",
      "kmaarc8",
      "kmaarc9"
    ),
    canonical_name = c(
      "maarc1",
      "maarc10",
      "maarc2",
      "maarc3",
      "maarc4",
      "maarc5",
      "maarc6",
      "maarc7",
      "maarc8",
      "maarc9"
    ),
    variable_label = c(
      "AARC: I appreciate relationships and people much more",
      "AARC: I find it harder to motivate myself",
      "AARC: my mental capacity is declining",
      "AARC: I pay more attention to my health",
      "AARC: I have to limit my activities",
      "AARC: I have more experience and knowledge to evaluate things and people",
      "AARC: I have less energy",
      "AARC: I have a better sense of what is important to me",
      "AARC: I feel more dependent on the help of others",
      "AARC: I have more freedom to live my days the way I want"
    ),
    harmonized_var_label = c(
      "AARC: I appreciate relationships and people much more",
      "AARC: I find it harder to motivate myself",
      "AARC: my mental capacity is declining",
      "AARC: I pay more attention to my health",
      "AARC: I have to limit my activities",
      "AARC: I have more experience and knowledge to evaluate things and people",
      "AARC: I have less energy",
      "AARC: I have a better sense of what is important to me",
      "AARC: I feel more dependent on the help of others",
      "AARC: I have more freedom to live my days the way I want"
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
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    maarc1 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    ),
    maarc10 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    ),
    maarc2 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    ),
    maarc3 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    ),
    maarc4 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    ),
    maarc5 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    ),
    maarc6 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    ),
    maarc7 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    ),
    maarc8 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    ),
    maarc9 = list(
      K = not_at_all_a_little_moderately_quite_a_bit_very_much
    )
  ),

  value_labels_harmonized = list(
    maarc1 = not_at_all_a_little_moderately_quite_a_bit_very_much,
    maarc10 = not_at_all_a_little_moderately_quite_a_bit_very_much,
    maarc2 = not_at_all_a_little_moderately_quite_a_bit_very_much,
    maarc3 = not_at_all_a_little_moderately_quite_a_bit_very_much,
    maarc4 = not_at_all_a_little_moderately_quite_a_bit_very_much,
    maarc5 = not_at_all_a_little_moderately_quite_a_bit_very_much,
    maarc6 = not_at_all_a_little_moderately_quite_a_bit_very_much,
    maarc7 = not_at_all_a_little_moderately_quite_a_bit_very_much,
    maarc8 = not_at_all_a_little_moderately_quite_a_bit_very_much,
    maarc9 = not_at_all_a_little_moderately_quite_a_bit_very_much
  )
)
