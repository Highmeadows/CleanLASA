## LASA filecode 185 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_185 <- list(
  variables = data.frame(
    wave = c(
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
      "C",
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
      "E",
      "F"
    ),
    variable_name = c(
      "cmankle1",
      "cmankle2",
      "cmfeetinsp",
      "cmfeetinsp1",
      "cmfeetinsp2",
      "cmfeetinsp3",
      "cmfeetinsp4",
      "cmfeetinsp5",
      "cmfeetinsp6",
      "cmfeetinsp7",
      "cmfeetinsp8",
      "cmfeetinspo",
      "cmfeetpllts",
      "cmfeetsmf",
      "cmknee1",
      "cmknee2",
      "cmpulse1",
      "cmpulse2",
      "dmfeetinsp",
      "dmfeetinsp1",
      "dmfeetinsp2",
      "dmfeetinsp3",
      "dmfeetinsp4",
      "dmfeetinsp5",
      "dmfeetinsp6",
      "dmfeetinsp7",
      "dmfeetinsp8",
      "dmfeetinspo",
      "dmfeetpllts",
      "dmfeetsmf",
      "emfeetpllts",
      "fmfeetpllts"
    ),
    canonical_name = c(
      "mankle1",
      "mankle2",
      "mfeetinsp",
      "mfeetinsp1",
      "mfeetinsp2",
      "mfeetinsp3",
      "mfeetinsp4",
      "mfeetinsp5",
      "mfeetinsp6",
      "mfeetinsp7",
      "mfeetinsp8",
      "mfeetinspo",
      "mfeetpllts",
      "mfeetsmf",
      "mknee1",
      "mknee2",
      "mpulse1",
      "mpulse2",
      "mfeetinsp",
      "mfeetinsp1",
      "mfeetinsp2",
      "mfeetinsp3",
      "mfeetinsp4",
      "mfeetinsp5",
      "mfeetinsp6",
      "mfeetinsp7",
      "mfeetinsp8",
      "mfeetinspo",
      "mfeetpllts",
      "mfeetsmf",
      "mfeetpllts",
      "mfeetpllts"
    ),
    variable_label = c(
      "Ankle (1): width in mm",
      "Ankle (2): width in mm",
      "Inspection feet: whole",
      "Inspection feet: sores",
      "Inspection feet: plaster",
      "Inspection feet: corns",
      "Inspection feet: skewed toes",
      "Inspection feet: amputation toes",
      "Inspection feet: amputation part of foot",
      "Inspection feet: amputation feet",
      "Inspection feet: other",
      "Inspection feet: other specification",
      "Inspection feet: pull up toes",
      "Inspection feet: smack feet",
      NA_character_,
      NA_character_,
      NA_character_,
      NA_character_,
      "Inspection feet: whole",
      "Inspection feet: sores",
      "Inspection feet: plaster",
      "Inspection feet: corns",
      "Inspection feet: skewed toes",
      "Inspection feet: amputation toes",
      "Inspection feet: amputation part of foot",
      "Inspection feet: amputation feet",
      "Inspection feet: other",
      "Inspection feet: other specification",
      "Inspection feet: pull up toes",
      "Inspection feet: smack feet",
      "Inspection feet: pull up toes",
      "Inspection feet: pull up toes"
    ),
    harmonized_var_label = c(
      "Ankle (1): width in mm",
      "Ankle (2): width in mm",
      "Inspection feet: whole",
      "Inspection feet: sores",
      "Inspection feet: plaster",
      "Inspection feet: corns",
      "Inspection feet: skewed toes",
      "Inspection feet: amputation toes",
      "Inspection feet: amputation part of foot",
      "Inspection feet: amputation feet",
      "Inspection feet: other",
      "Inspection feet: other specification",
      "Inspection feet: pull up toes",
      "Inspection feet: smack feet",
      NA_character_,
      NA_character_,
      NA_character_,
      NA_character_,
      "Inspection feet: whole",
      "Inspection feet: sores",
      "Inspection feet: plaster",
      "Inspection feet: corns",
      "Inspection feet: skewed toes",
      "Inspection feet: amputation toes",
      "Inspection feet: amputation part of foot",
      "Inspection feet: amputation feet",
      "Inspection feet: other",
      "Inspection feet: other specification",
      "Inspection feet: pull up toes",
      "Inspection feet: smack feet",
      "Inspection feet: pull up toes",
      "Inspection feet: pull up toes"
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
    mankle1 = list(
      C = na_interview_terminated
    ),
    mankle2 = list(
      C = no_valid_data_2
    ),
    mfeetinsp = list(
      C = yes_no_14,
      D = c(`-1` = "no valid data", `1` = "yes", `2` = "no")
    ),
    mfeetinsp1 = list(
      C = not_mentioned_mentioned_73,
      D = not_mentioned_mentioned_73
    ),
    mfeetinsp2 = list(
      C = not_mentioned_mentioned_73,
      D = not_mentioned_mentioned_73
    ),
    mfeetinsp3 = list(
      C = not_mentioned_mentioned_73,
      D = not_mentioned_mentioned_73
    ),
    mfeetinsp4 = list(
      C = not_mentioned_mentioned_73,
      D = not_mentioned_mentioned_73
    ),
    mfeetinsp5 = list(
      C = not_mentioned_mentioned_73,
      D = not_mentioned_mentioned_73
    ),
    mfeetinsp6 = list(
      C = not_mentioned_mentioned_73,
      D = not_mentioned_mentioned_73
    ),
    mfeetinsp7 = list(
      C = not_mentioned_mentioned_73,
      D = not_mentioned_mentioned_73
    ),
    mfeetinsp8 = list(
      C = not_mentioned_mentioned_73,
      D = not_mentioned_mentioned_73
    ),
    mfeetinspo = list(
      C = to_be_coded_6,
      D = to_be_coded_6
    ),
    mfeetpllts = list(
      C = yes_no_11,
      D = yes_no_15,
      E = yes_no_8,
      F = yes_no_8
    ),
    mfeetsmf = list(
      C = yes_no_11,
      D = yes_no_15
    ),
    mknee1 = list(
      C = knee
    ),
    mknee2 = list(
      C = knee_2
    ),
    mpulse1 = list(
      C = pulse
    ),
    mpulse2 = list(
      C = pulse_2
    )
  ),

  value_labels_harmonized = list(
    mankle1 = na_interview_terminated,
    mankle2 = no_valid_data_2,
    mfeetinsp = yes_no_14,
    mfeetinsp1 = not_mentioned_mentioned_73,
    mfeetinsp2 = not_mentioned_mentioned_73,
    mfeetinsp3 = not_mentioned_mentioned_73,
    mfeetinsp4 = not_mentioned_mentioned_73,
    mfeetinsp5 = not_mentioned_mentioned_73,
    mfeetinsp6 = not_mentioned_mentioned_73,
    mfeetinsp7 = not_mentioned_mentioned_73,
    mfeetinsp8 = not_mentioned_mentioned_73,
    mfeetinspo = to_be_coded_6,
    mfeetpllts = c(`-5` = "interview terminated", `-1` = "na, asked", `1` = "yes", `2` = "no"),
    mfeetsmf = yes_no_11,
    mknee1 = knee,
    mknee2 = knee_2,
    mpulse1 = pulse,
    mpulse2 = pulse_2
  )
)
