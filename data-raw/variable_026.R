## LASA filecode 026 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
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

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7", "anxmv")],
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
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c("manxiet1", "manxiet2", "manxiet3", "manxiet4", "manxiet5", "manxiet6", "manxiet7")],
    manxiet1 = "1. Lately: feel tense or wound up",
    manxiet2 = "2. Lately: frightened feeling",
    manxiet3 = "3. Lately: worrying thoughts",
    manxiet4 = "4. Lately: I feel relaxed: positive",
    manxiet5 = "5. Lately: frightened in stomach",
    manxiet6 = "6. Lately: feel restless",
    manxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = "1. Lately: feel tense or wound up",
    anxiet2 = "2. Lately: frightened feeling",
    anxiet3 = "3. Lately: worrying thoughts",
    anxiet4 = "4. Lately: I feel relaxed: positive",
    anxiet5 = "5. Lately: frightened in stomach",
    anxiet6 = "6. Lately: feel restless",
    anxiet7 = "7. Lately: sudden feelings of panic"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
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

standardized_value_labels <- list(
  anxiet1 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  anxiet2 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  anxiet3 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  anxiet4 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  anxiet5 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  anxiet6 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  anxiet7 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  anxmv = c(
    `-6` = "not available, no valid data",
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview"
  ),
  manxiet1 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  manxiet2 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  manxiet3 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  manxiet4 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  manxiet5 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  manxiet6 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  manxiet7 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7", "anxmv")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxmv = .replace_labels(
    standardized_value_labels$anxmv,
    `-6` = "no valid data",
    `-5` = "interview broken off",
    `-4` = "no answer, short version"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("manxiet1", "manxiet2", "manxiet3", "manxiet4", "manxiet5", "manxiet6", "manxiet7")],
    manxiet1 = .replace_labels(
    standardized_value_labels$manxiet1,
    `-2` = "na, see bmrmanx in LASMB226",
    `-1` = "na, asked"
  ),
    manxiet2 = .replace_labels(
    standardized_value_labels$manxiet2,
    `-2` = "na, see bmrmanx in LASMB226",
    `-1` = "na, asked"
  ),
    manxiet3 = .replace_labels(
    standardized_value_labels$manxiet3,
    `-2` = "na, see bmrmanx in LASMB226",
    `-1` = "na, asked"
  ),
    manxiet4 = .replace_labels(
    standardized_value_labels$manxiet4,
    `-2` = "na, see bmrmanx in LASMB226",
    `-1` = "na, asked"
  ),
    manxiet5 = .replace_labels(
    standardized_value_labels$manxiet5,
    `-2` = "na, see bmrmanx in LASMB226",
    `-1` = "na, asked"
  ),
    manxiet6 = .replace_labels(
    standardized_value_labels$manxiet6,
    `-2` = "na, see bmrmanx in LASMB226",
    `-1` = "na, asked"
  ),
    manxiet7 = .replace_labels(
    standardized_value_labels$manxiet7,
    `-2` = "na, see bmrmanx in LASMB226",
    `-1` = "na, asked"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("anxiet1", "anxiet2", "anxiet3", "anxiet4", "anxiet5", "anxiet6", "anxiet7")],
    anxiet1 = .replace_labels(
    standardized_value_labels$anxiet1,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet2 = .replace_labels(
    standardized_value_labels$anxiet2,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet3 = .replace_labels(
    standardized_value_labels$anxiet3,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet4 = .replace_labels(
    standardized_value_labels$anxiet4,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet5 = .replace_labels(
    standardized_value_labels$anxiet5,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet6 = .replace_labels(
    standardized_value_labels$anxiet6,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
  ),
    anxiet7 = .replace_labels(
    standardized_value_labels$anxiet7,
    `-2` = "na, see B/C/D/E/F/G/H/B/I/JRMANX in LAS(A)*226",
    `-1` = "na, asked"
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

.lasa_fc_026 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "026", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "026", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "026", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "026", waves = .lasa_wave_rows())
)
