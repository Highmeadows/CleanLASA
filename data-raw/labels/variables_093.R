## LASA filecode 093 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_093 <- list(
  variables = data.frame(
    wave = c(
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D"
    ),
    variable_name = c(
      "deol01",
      "deol02",
      "deol03",
      "deol04",
      "deol05",
      "deol07",
      "deol11",
      "deol12",
      "deol13",
      "deol14",
      "deol15",
      "deol16",
      "deol21",
      "deol22",
      "deol23",
      "deol24",
      "deol25",
      "deol26",
      "deol261",
      "deol262",
      "deol263",
      "deol264",
      "deol265",
      "deol266",
      "deol267",
      "deol268",
      "deol601",
      "deol602",
      "deol603",
      "deol604",
      "deol605",
      "deol606",
      "deol607",
      "deol608",
      "deol609",
      "deol610",
      "deol611",
      "deol612",
      "deol612s"
    ),
    canonical_name = c(
      "eol01",
      "eol02",
      "eol03",
      "eol04",
      "eol05",
      "eol07",
      "eol11",
      "eol12",
      "eol13",
      "eol14",
      "eol15",
      "eol16",
      "eol21",
      "eol22",
      "eol23",
      "eol24",
      "eol25",
      "eol26",
      "eol261",
      "eol262",
      "eol263",
      "eol264",
      "eol265",
      "eol266",
      "eol267",
      "eol268",
      "eol601",
      "eol602",
      "eol603",
      "eol604",
      "eol605",
      "eol606",
      "eol607",
      "eol608",
      "eol609",
      "eol610",
      "eol611",
      "eol612",
      "eol612s"
    ),
    variable_label = c(
      "# end-of-life declarations",
      "# persons informed about EOL-declaration",
      "Indication (verbal/written)",
      "Discussed EOL-choices with family physician",
      "Imagine: request for euthanasia",
      "Trust in doctors/nurses",
      "No treatment declaration",
      "No reanimation declaration",
      "Euthanasia declaration",
      "Care declaration",
      "Credo declaration",
      "Declaration, not specified",
      "Informed: partner",
      "Informed: children",
      "Informed: caretaker",
      "Informed: family physician",
      "Informed: district nurse",
      "Informed: other",
      "Informed: other family member",
      "Informed: nobody",
      "Informed: friend",
      "Informed: household member",
      "Informed: free euthanasia association",
      "Informed: spiritual adviser",
      "Informed: notary",
      "Informed: not specified",
      "# reasons EOL-requests",
      "Reason: unbearable suffering (not pain)",
      "Reason: loss of dignity",
      "Reason: meaningless suffering",
      "Reason: weariness of life",
      "Reason: nuisance for family/daily environment",
      "Reason: prevent pain",
      "Reason: prevent further suffering",
      "Reason: prevent humiliation/decay",
      "Reason: hopeless suffering",
      "Reason: mental retardation or dementia",
      "Reason: other",
      "Reason: other specified"
    ),
    harmonized_var_label = c(
      "# end-of-life declarations",
      "# persons informed about EOL-declaration",
      "Indication (verbal/written)",
      "Discussed EOL-choices with family physician",
      "Imagine: request for euthanasia",
      "Trust in doctors/nurses",
      "No treatment declaration",
      "No reanimation declaration",
      "Euthanasia declaration",
      "Care declaration",
      "Credo declaration",
      "Declaration, not specified",
      "Informed: partner",
      "Informed: children",
      "Informed: caretaker",
      "Informed: family physician",
      "Informed: district nurse",
      "Informed: other",
      "Informed: other family member",
      "Informed: nobody",
      "Informed: friend",
      "Informed: household member",
      "Informed: free euthanasia association",
      "Informed: spiritual adviser",
      "Informed: notary",
      "Informed: not specified",
      "# reasons EOL-requests",
      "Reason: unbearable suffering (not pain)",
      "Reason: loss of dignity",
      "Reason: meaningless suffering",
      "Reason: weariness of life",
      "Reason: nuisance for family/daily environment",
      "Reason: prevent pain",
      "Reason: prevent further suffering",
      "Reason: prevent humiliation/decay",
      "Reason: hopeless suffering",
      "Reason: mental retardation or dementia",
      "Reason: other",
      "Reason: other specified"
    ),
    var_type = c(
      "numeric",
      "numeric",
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
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "numeric",
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
    eol01 = list(
      D = c(`-2` = "na, terminated interview", `-1` = "na, asked")
    ),
    eol02 = list(
      D = c(`-2` = "na, see DEOL01", `-1` = "na, asked")
    ),
    eol03 = list(
      D = c(
        `-2` = "na, terminated interview",
        `-1` = "na, asked",
        `1` = "yes, written",
        `2` = "yes, verbal",
        `3` = "yes, written and verbal",
        `4` = "yes, not specified",
        `5` = "no",
        `6` = "R does not know"
      )
    ),
    eol04 = list(
      D = yes_no_r_does_not_know_4
    ),
    eol05 = list(
      D = yes_no_r_does_not_know_4
    ),
    eol07 = list(
      D = c(
        `-2` = "na, terminated interview",
        `-1` = "na, asked",
        `1` = "trust: very strong",
        `2` = "trust: quite strong",
        `3` = "trust not much",
        `4` = "rust: not at all",
        `5` = "trust: no opinion"
      )
    ),
    eol11 = list(
      D = not_mentioned_mentioned_215
    ),
    eol12 = list(
      D = not_mentioned_mentioned_215
    ),
    eol13 = list(
      D = not_mentioned_mentioned_215
    ),
    eol14 = list(
      D = not_mentioned_mentioned_215
    ),
    eol15 = list(
      D = not_mentioned_mentioned_215
    ),
    eol16 = list(
      D = not_mentioned_mentioned_215
    ),
    eol21 = list(
      D = not_mentioned_mentioned_216
    ),
    eol22 = list(
      D = not_mentioned_mentioned_216
    ),
    eol23 = list(
      D = not_mentioned_mentioned_216
    ),
    eol24 = list(
      D = not_mentioned_mentioned_216
    ),
    eol25 = list(
      D = not_mentioned_mentioned_216
    ),
    eol26 = list(
      D = not_mentioned_mentioned_216
    ),
    eol261 = list(
      D = not_mentioned_mentioned_196
    ),
    eol262 = list(
      D = not_mentioned_mentioned_196
    ),
    eol263 = list(
      D = not_mentioned_mentioned_196
    ),
    eol264 = list(
      D = not_mentioned_mentioned_196
    ),
    eol265 = list(
      D = not_mentioned_mentioned_196
    ),
    eol266 = list(
      D = not_mentioned_mentioned_196
    ),
    eol267 = list(
      D = not_mentioned_mentioned_196
    ),
    eol268 = list(
      D = not_mentioned_mentioned_196
    ),
    eol601 = list(
      D = c(`-2` = "na, see DEOL05", `-1` = "na, asked")
    ),
    eol602 = list(
      D = not_mentioned_mentioned_157
    ),
    eol603 = list(
      D = not_mentioned_mentioned_157
    ),
    eol604 = list(
      D = not_mentioned_mentioned_157
    ),
    eol605 = list(
      D = not_mentioned_mentioned_157
    ),
    eol606 = list(
      D = not_mentioned_mentioned_157
    ),
    eol607 = list(
      D = not_mentioned_mentioned_157
    ),
    eol608 = list(
      D = not_mentioned_mentioned_157
    ),
    eol609 = list(
      D = not_mentioned_mentioned_157
    ),
    eol610 = list(
      D = not_mentioned_mentioned_157
    ),
    eol611 = list(
      D = not_mentioned_mentioned_157
    ),
    eol612 = list(
      D = not_mentioned_mentioned_157
    ),
    eol612s = list(
      D = c(`-2` = "na, see DEOL612", `1` = "-to be coded-")
    )
  ),

  value_labels_harmonized = list(
    eol01 = c(`-2` = "interview terminated", `-1` = "not available, asked"),
    eol02 = not_available_routing_not_available_asked,
    eol03 = c(
      `-2` = "interview terminated",
      `-1` = "not available, asked",
      `1` = "yes, written",
      `2` = "yes, verbal",
      `3` = "yes, written and verbal",
      `4` = "yes, not specified",
      `5` = "no",
      `6` = "R does not know"
    ),
    eol04 = yes_no_r_does_not_know_5,
    eol05 = yes_no_r_does_not_know_5,
    eol07 = c(
      `-2` = "interview terminated",
      `-1` = "not available, asked",
      `1` = "trust: very strong",
      `2` = "trust: quite strong",
      `3` = "trust not much",
      `4` = "rust: not at all",
      `5` = "trust: no opinion"
    ),
    eol11 = not_mentioned_mentioned_6,
    eol12 = not_mentioned_mentioned_6,
    eol13 = not_mentioned_mentioned_6,
    eol14 = not_mentioned_mentioned_6,
    eol15 = not_mentioned_mentioned_6,
    eol16 = not_mentioned_mentioned_6,
    eol21 = not_mentioned_mentioned_6,
    eol22 = not_mentioned_mentioned_6,
    eol23 = not_mentioned_mentioned_6,
    eol24 = not_mentioned_mentioned_6,
    eol25 = not_mentioned_mentioned_6,
    eol26 = not_mentioned_mentioned_6,
    eol261 = not_mentioned_mentioned_6,
    eol262 = not_mentioned_mentioned_6,
    eol263 = not_mentioned_mentioned_6,
    eol264 = not_mentioned_mentioned_6,
    eol265 = not_mentioned_mentioned_6,
    eol266 = not_mentioned_mentioned_6,
    eol267 = not_mentioned_mentioned_6,
    eol268 = not_mentioned_mentioned_6,
    eol601 = not_available_routing_not_available_asked,
    eol602 = not_mentioned_mentioned_6,
    eol603 = not_mentioned_mentioned_6,
    eol604 = not_mentioned_mentioned_6,
    eol605 = not_mentioned_mentioned_6,
    eol606 = not_mentioned_mentioned_6,
    eol607 = not_mentioned_mentioned_6,
    eol608 = not_mentioned_mentioned_6,
    eol609 = not_mentioned_mentioned_6,
    eol610 = not_mentioned_mentioned_6,
    eol611 = not_mentioned_mentioned_6,
    eol612 = not_mentioned_mentioned_6,
    eol612s = c(`-2` = "not available, routing", `1` = "-to be coded-")
  )
)
