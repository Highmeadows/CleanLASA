## LASA filecode 026 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  anxiet1 = "Main interview: 1. Lately: feel tense or wound up",
  anxiet2 = "Main interview: 2. Lately: frightened feeling",
  anxiet3 = "Main interview: 3. Lately: worrying thoughts",
  anxiet4 = "Main interview: 4. Lately: I feel relaxed: positive",
  anxiet5 = "Main interview: 5. Lately: frightened in stomach",
  anxiet6 = "Main interview: 6. Lately: feel restless",
  anxiet7 = "Main interview: 7. Lately: sudden feelings of panic",
  anxmv = "Main interview: number of missing anxiety-item values (max 7)",
  manxiet1 = "Medical interview: 1. Lately: feel tense or wound up",
  manxiet2 = "Medical interview: 2. Lately: frightened feeling",
  manxiet3 = "Medical interview: 3. Lately: worrying thoughts",
  manxiet4 = "Medical interview: 4. Lately: I feel relaxed: positive",
  manxiet5 = "Medical interview: 5. Lately: frightened in stomach",
  manxiet6 = "Medical interview: 6. Lately: feel restless",
  manxiet7 = "Medical interview: 7. Lately: sudden feelings of panic"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7",
    "anxmv"
  ),
  `C` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7"
  ),
  `D` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7"
  ),
  `E` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7"
  ),
  `F` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7"
  ),
  `G` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7"
  ),
  `H` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7"
  ),
  `3B` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7"
  ),
  `MB` = c(
    "manxiet1",
    "manxiet2",
    "manxiet3",
    "manxiet4",
    "manxiet5",
    "manxiet6",
    "manxiet7"
  ),
  `I` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7"
  ),
  `J` = c(
    "anxiet1",
    "anxiet2",
    "anxiet3",
    "anxiet4",
    "anxiet5",
    "anxiet6",
    "anxiet7"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic",
    anxmv = "number of missing values (max 7)"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    manxiet1 = "1. Lately: feel tense or wound up",
    manxiet2 = "2. Lately: frightened feeling",
    manxiet3 = "3. Lately: worrying thoughts",
    manxiet4 = "4. Lately: I feel relaxed: positive",
    manxiet5 = "5. Lately: frightened in stomach",
    manxiet6 = "6. Lately: feel restless",
    manxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "some of the time",
  `2` = "occasionally",
  `3` = "mostly or always"
)

standardized_value_labels <- list(
  anxiet1 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  anxiet2 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  anxiet3 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  anxiet4 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  anxiet5 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  anxiet6 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  anxiet7 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  anxmv = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4")]
  ),
  manxiet1 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  manxiet2 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  manxiet3 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  manxiet4 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  manxiet5 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  manxiet6 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  ),
  manxiet7 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "rarely or never",
    default_answer_labels[c("1", "2", "3")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxmv = .replace_labels(
    standardized_value_labels$anxmv,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    manxiet1 = .replace_labels(
    standardized_value_labels$manxiet1,
    `-2` = "na, see bmrmanx in LASMB226"
  ),
    manxiet2 = .replace_labels(
    standardized_value_labels$manxiet2,
    `-2` = "na, see bmrmanx in LASMB226"
  ),
    manxiet3 = .replace_labels(
    standardized_value_labels$manxiet3,
    `-2` = "na, see bmrmanx in LASMB226"
  ),
    manxiet4 = .replace_labels(
    standardized_value_labels$manxiet4,
    `-2` = "na, see bmrmanx in LASMB226"
  ),
    manxiet5 = .replace_labels(
    standardized_value_labels$manxiet5,
    `-2` = "na, see bmrmanx in LASMB226"
  ),
    manxiet6 = .replace_labels(
    standardized_value_labels$manxiet6,
    `-2` = "na, see bmrmanx in LASMB226"
  ),
    manxiet7 = .replace_labels(
    standardized_value_labels$manxiet7,
    `-2` = "na, see bmrmanx in LASMB226"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  anxiet1 = "categorical",
  anxiet2 = "categorical",
  anxiet3 = "categorical",
  anxiet4 = "categorical",
  anxiet5 = "categorical",
  anxiet6 = "categorical",
  anxiet7 = "categorical",
  anxmv = "numeric",
  manxiet1 = "categorical",
  manxiet2 = "categorical",
  manxiet3 = "categorical",
  manxiet4 = "categorical",
  manxiet5 = "categorical",
  manxiet6 = "categorical",
  manxiet7 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "026", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "026", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "026", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "026", waves = .lasa_wave_rows())
)

.lasa_fc_026 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

