## LASA filecode 126 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qorh1 = "Oral health 1: general self evaluation",
  qorh2a = "Oral health 2A: number of own teeth and molars upper jaw",
  qorh2b = "Oral health 2B: number of own teeth and molars lower jaw",
  qorh3 = "Oral health 3: wearing dentures",
  qorh3a = "Oral health 3A: wearing dentures upper jaw",
  qorh3b = "Oral health 3B: wearing dentures lower jaw",
  qorh3c = "Oral health 3C: when wearing dentures",
  qorh3d = "Oral health 3D: past half year: dentures did not fit properly",
  qorh4 = "Oral health 4: how often brushing teeth",
  qorh5a = "Oral health 5A: use of dental floss",
  qorh5b = "Oral health 5B: use of dental sticks",
  qorh5c = "Oral health 5C: use of interdental brushes",
  qorh6a = "Oral health 6A: past 2 years dental check",
  qorh6b = "Oral health 6B: past 2 years dental cleaning",
  qorh7 = "Oral health 7: past 2 years gum inflammation (gingivitis)",
  qorh8a = "Oral health 8A: past half year: cavities",
  qorh8b = "Oral health 8B: past half year: bleeding gums",
  qorh8c = "Oral health 8C: past half year: red or swollen gums",
  qorh8d = "Oral health 8D: past half year: blisters or sores in the mouth",
  qorh8e = "Oral health 8E: past half year: toothache caused by hot/cold drinks",
  qorh8f = "Oral health 8F: past half year: toothache when chewing",
  qorh8g = "Oral health 8G: past half year: loose, broken teeth",
  qorh8h = "Oral health 8H: past half year: bad breath (halitosis)",
  qorh8i = "Oral health 8I: past half year: dry mouth"
)

variable_labels_list <- list(
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "qorh1",
    "qorh2a",
    "qorh2b",
    "qorh3a",
    "qorh3b",
    "qorh3c",
    "qorh4",
    "qorh5a",
    "qorh5b",
    "qorh5c",
    "qorh6a",
    "qorh6b",
    "qorh7",
    "qorh8a",
    "qorh8b",
    "qorh8c",
    "qorh8d",
    "qorh8e",
    "qorh8f",
    "qorh8g",
    "qorh8h",
    "qorh8i"
  )],
    qorh1 = "Oral health 1: general self-evaluation"
  ),
  Wave_J_labels = harmonized_labels[c("qorh1", "qorh2a", "qorh2b", "qorh3", "qorh3d", "qorh7", "qorh8f", "qorh8i")],
  Wave_K_labels = harmonized_labels[c("qorh1", "qorh2a", "qorh2b", "qorh3", "qorh3d", "qorh7", "qorh8f", "qorh8i")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qorh1 = c(
    `-1` = "not available",
    `1` = "very unhealthy",
    `2` = "unhealthy",
    `3` = "not unhealthy/healthy",
    `4` = "healthy",
    `5` = "very healthy"
  ),
  qorh2a = c(`-1` = "not available", `1` = "none", `2` = "1-7", `3` = "more than 7"),
  qorh2b = c(`-1` = "not available", `1` = "none", `2` = "1-7", `3` = "more than 7"),
  qorh3 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qorh3a = c(
    `-1` = "not available",
    `1` = "yes, complete dentures",
    `2` = "yes, partial dentures",
    `3` = "no"
  ),
  qorh3b = c(
    `-1` = "not available",
    `1` = "yes, complete dentures",
    `2` = "yes, partial dentures",
    `3` = "no"
  ),
  qorh3c = c(
    `-2` = "not available, routing",
    `-1` = "not available",
    `1` = "day and night",
    `2` = "always during the day",
    `3` = "occasionally"
  ),
  qorh3d = c(
    `-2` = "not available, routing",
    `-1` = "not available",
    `1` = "never",
    `2` = "rarely",
    `3` = "occasionally",
    `4` = "rather often",
    `5` = "very often"
  ),
  qorh4 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "sometimes, not every day",
    `3` = "once a day",
    `4` = "twice a day",
    `5` = "more than twice a day"
  ),
  qorh5a = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "1-3 times a month",
    `3` = "1-3 times a week",
    `4` = "more than 3 times a week"
  ),
  qorh5b = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "1-3 times a month",
    `3` = "1-3 times a week",
    `4` = "more than 3 times a week"
  ),
  qorh5c = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "1-3 times a month",
    `3` = "1-3 times a week",
    `4` = "more than 3 times a week"
  ),
  qorh6a = c(`-1` = "not available", `1` = "never", `2` = "1-2 times", `3` = "3 times or more"),
  qorh6b = c(`-1` = "not available", `1` = "never", `2` = "1-2 times", `3` = "3 times or more"),
  qorh7 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qorh8a = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qorh8b = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qorh8c = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qorh8d = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qorh8e = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qorh8f = c(
    `-1` = "not available",
    `1` = "coding category 1",
    `2` = "coding category 2",
    `3` = "occasionally",
    `4` = "rather often",
    `5` = "very often"
  ),
  qorh8g = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qorh8h = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qorh8i = c(
    `-1` = "not available",
    `1` = "coding category 1",
    `2` = "coding category 2",
    `3` = "occasionally",
    `4` = "rather often",
    `5` = "very often"
  )
)

value_labels_list <- list(
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "qorh1",
    "qorh2a",
    "qorh2b",
    "qorh3a",
    "qorh3b",
    "qorh3c",
    "qorh4",
    "qorh5a",
    "qorh5b",
    "qorh5c",
    "qorh6a",
    "qorh6b",
    "qorh7",
    "qorh8a",
    "qorh8b",
    "qorh8c",
    "qorh8d",
    "qorh8e",
    "qorh8f",
    "qorh8g",
    "qorh8h",
    "qorh8i"
  )],
    qorh1 = .replace_labels(
    standardized_value_labels$qorh1,
    `-1` = "no answer"
  ),
    qorh2a = .replace_labels(
    standardized_value_labels$qorh2a,
    `-1` = "no answer"
  ),
    qorh2b = .replace_labels(
    standardized_value_labels$qorh2b,
    `-1` = "no answer"
  ),
    qorh3a = .replace_labels(
    standardized_value_labels$qorh3a,
    `-1` = "no answer"
  ),
    qorh3b = .replace_labels(
    standardized_value_labels$qorh3b,
    `-1` = "no answer"
  ),
    qorh3c = .replace_labels(
    standardized_value_labels$qorh3c,
    `-2` = "na, see IQORH3A & IQORH3B",
    `-1` = "no answer"
  ),
    qorh4 = .replace_labels(
    standardized_value_labels$qorh4,
    `-1` = "no answer"
  ),
    qorh5a = .replace_labels(
    standardized_value_labels$qorh5a,
    `-1` = "no answer"
  ),
    qorh5b = .replace_labels(
    standardized_value_labels$qorh5b,
    `-1` = "no answer"
  ),
    qorh5c = .replace_labels(
    standardized_value_labels$qorh5c,
    `-1` = "no answer"
  ),
    qorh6a = .replace_labels(
    standardized_value_labels$qorh6a,
    `-1` = "no answer"
  ),
    qorh6b = .replace_labels(
    standardized_value_labels$qorh6b,
    `-1` = "no answer"
  ),
    qorh7 = .replace_labels(
    standardized_value_labels$qorh7,
    `-1` = "no answer"
  ),
    qorh8a = .replace_labels(
    standardized_value_labels$qorh8a,
    `-1` = "no answer"
  ),
    qorh8b = .replace_labels(
    standardized_value_labels$qorh8b,
    `-1` = "no answer"
  ),
    qorh8c = .replace_labels(
    standardized_value_labels$qorh8c,
    `-1` = "no answer"
  ),
    qorh8d = .replace_labels(
    standardized_value_labels$qorh8d,
    `-1` = "no answer"
  ),
    qorh8e = .replace_labels(
    standardized_value_labels$qorh8e,
    `-1` = "no answer"
  ),
    qorh8f = c(`-1` = "no answer", `1` = "yes", `2` = "no"),
    qorh8g = .replace_labels(
    standardized_value_labels$qorh8g,
    `-1` = "no answer"
  ),
    qorh8h = .replace_labels(
    standardized_value_labels$qorh8h,
    `-1` = "no answer"
  ),
    qorh8i = c(`-1` = "no answer", `1` = "yes", `2` = "no")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("qorh1", "qorh2a", "qorh2b", "qorh3", "qorh3d", "qorh7", "qorh8f", "qorh8i")],
    qorh1 = .replace_labels(
    standardized_value_labels$qorh1,
    `-1` = "no answer"
  ),
    qorh2a = .replace_labels(
    standardized_value_labels$qorh2a,
    `-1` = "no answer"
  ),
    qorh2b = .replace_labels(
    standardized_value_labels$qorh2b,
    `-1` = "no answer"
  ),
    qorh3 = .replace_labels(
    standardized_value_labels$qorh3,
    `-1` = "no answer"
  ),
    qorh3d = .replace_labels(
    standardized_value_labels$qorh3d,
    `-2` = "na, see J/KQORH3",
    `-1` = "no answer"
  ),
    qorh7 = .replace_labels(
    standardized_value_labels$qorh7,
    `-1` = "no answer"
  ),
    qorh8f = .replace_labels(
    standardized_value_labels$qorh8f,
    `-1` = "no answer",
    `1` = "never",
    `2` = "rarely"
  ),
    qorh8i = .replace_labels(
    standardized_value_labels$qorh8i,
    `-1` = "no answer",
    `1` = "never",
    `2` = "rarely"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("qorh1", "qorh2a", "qorh2b", "qorh3", "qorh3d", "qorh7", "qorh8f", "qorh8i")],
    qorh1 = .replace_labels(
    standardized_value_labels$qorh1,
    `-1` = "no answer"
  ),
    qorh2a = .replace_labels(
    standardized_value_labels$qorh2a,
    `-1` = "no answer"
  ),
    qorh2b = .replace_labels(
    standardized_value_labels$qorh2b,
    `-1` = "no answer"
  ),
    qorh3 = .replace_labels(
    standardized_value_labels$qorh3,
    `-1` = "no answer"
  ),
    qorh3d = .replace_labels(
    standardized_value_labels$qorh3d,
    `-2` = "na, see J/KQORH3",
    `-1` = "no answer"
  ),
    qorh7 = .replace_labels(
    standardized_value_labels$qorh7,
    `-1` = "no answer"
  ),
    qorh8f = .replace_labels(
    standardized_value_labels$qorh8f,
    `-1` = "no answer",
    `1` = "never",
    `2` = "rarely"
  ),
    qorh8i = .replace_labels(
    standardized_value_labels$qorh8i,
    `-1` = "no answer",
    `1` = "never",
    `2` = "rarely"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qorh1 = "categorical",
  qorh2a = "categorical",
  qorh2b = "categorical",
  qorh3 = "categorical",
  qorh3a = "categorical",
  qorh3b = "categorical",
  qorh3c = "categorical",
  qorh3d = "categorical",
  qorh4 = "categorical",
  qorh5a = "categorical",
  qorh5b = "categorical",
  qorh5c = "categorical",
  qorh6a = "categorical",
  qorh6b = "categorical",
  qorh7 = "categorical",
  qorh8a = "categorical",
  qorh8b = "categorical",
  qorh8c = "categorical",
  qorh8d = "categorical",
  qorh8e = "categorical",
  qorh8f = "categorical",
  qorh8g = "categorical",
  qorh8h = "categorical",
  qorh8i = "categorical"
)

.lasa_fc_126 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "126", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "126", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "126", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "126", waves = .lasa_wave_rows())
)
