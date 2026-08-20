## LASA filecode 196 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_196 <- list(
  variables = data.frame(
    wave = c("K", "K", "K", "K", "K", "K", "K", "K", "K", "K", "K", "K", "K", "K", "K", "K"),
    variable_name = c(
      "kmhlq1",
      "kmhlq10",
      "kmhlq11",
      "kmhlq12",
      "kmhlq13",
      "kmhlq14",
      "kmhlq15",
      "kmhlq16",
      "kmhlq2",
      "kmhlq3",
      "kmhlq4",
      "kmhlq5",
      "kmhlq6",
      "kmhlq7",
      "kmhlq8",
      "kmhlq9"
    ),
    canonical_name = c(
      "mhlq1",
      "mhlq10",
      "mhlq11",
      "mhlq12",
      "mhlq13",
      "mhlq14",
      "mhlq15",
      "mhlq16",
      "mhlq2",
      "mhlq3",
      "mhlq4",
      "mhlq5",
      "mhlq6",
      "mhlq7",
      "mhlq8",
      "mhlq9"
    ),
    variable_label = c(
      "HLQ: find information about the treatment of illnesses that concern you",
      "HLQ: understand why you need health screenings",
      "HLQ: judge if information on health risks in media is reliable",
      "HLQ: decide how to protect yourself from illness based on information in the media",
      "HLQ: find information about activities that are good for your mental well-being",
      "HLQ: understand advice on health from family or friends",
      "HLQ: understand information in media on how to get healthier",
      "HLQ: judge which everyday behaviour is related to your health",
      "HLQ: find out where to go for professional help when sick",
      "HLQ: understand what your doctor says to you",
      "HLQ: understand doctor or pharmacist instruction on how to take a prescribed medicine",
      "HLQ: judge when you may need a second opinion from another doctor",
      "HLQ: make a decision about illness with information from doctor",
      "HLQ: follow instructions from your doctor or pharmacist",
      "HLQ: find information on how to manage mental health problems (stress or depression)",
      "HLQ: understand warnings about unhealthy behaviours (smoking, low physical activity and drinking too much)"
    ),
    harmonized_var_label = c(
      "HLQ: find information about the treatment of illnesses that concern you",
      "HLQ: understand why you need health screenings",
      "HLQ: judge if information on health risks in media is reliable",
      "HLQ: decide how to protect yourself from illness based on information in the media",
      "HLQ: find information about activities that are good for your mental well-being",
      "HLQ: understand advice on health from family or friends",
      "HLQ: understand information in media on how to get healthier",
      "HLQ: judge which everyday behaviour is related to your health",
      "HLQ: find out where to go for professional help when sick",
      "HLQ: understand what your doctor says to you",
      "HLQ: understand doctor or pharmacist instruction on how to take a prescribed medicine",
      "HLQ: judge when you may need a second opinion from another doctor",
      "HLQ: make a decision about illness with information from doctor",
      "HLQ: follow instructions from your doctor or pharmacist",
      "HLQ: find information on how to manage mental health problems (stress or depression)",
      "HLQ: understand warnings about unhealthy behaviours (smoking, low physical activity and drinking too much)"
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
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    mhlq1 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq10 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq11 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq12 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq13 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq14 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq15 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq16 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq2 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq3 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq4 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq5 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq6 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq7 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq8 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    ),
    mhlq9 = list(
      K = very_easy_fairly_easy_fairly_difficult_very_difficult
    )
  ),

  value_labels_harmonized = list(
    mhlq1 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq10 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq11 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq12 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq13 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq14 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq15 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq16 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq2 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq3 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq4 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq5 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq6 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq7 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq8 = very_easy_fairly_easy_fairly_difficult_very_difficult,
    mhlq9 = very_easy_fairly_easy_fairly_difficult_very_difficult
  )
)
