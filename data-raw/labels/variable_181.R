## LASA filecode 181 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  menno18 = "Menopause 10: number of months",
  mmenno61 = "Menopause: hysterectomy",
  mmeno01 = "Menopause: age start period",
  mmeno02 = "Menopause: number of children",
  mmeno03 = "Menopause: age first child born",
  mmeno04 = "Menopause: ever pregnant",
  mmeno05 = "Menopause: age last period",
  mmeno07 = "Menopause: used contraceptive pill",
  mmeno08 = "Menopause: # years contraceptive pill",
  mmeno09 = "Menopause: hot flushes",
  mmeno10 = "Menopause: excessive transpiration",
  mmeno11 = "Menopause: pain in muscles",
  mmeno12 = "Menopause: dry vagina",
  mmeno13 = "Menopause: pain during intercourse",
  mmeno14 = "Menopause: hot flushes in the past",
  mmeno15 = "Menopause: age first hot flushes",
  mmeno16 = "Menopause: age last hot flushes",
  mmeno17 = "Menopause 07: age first time",
  mmeno61 = "Menopause 02: had a hysterectomy",
  mmeno62 = "Menopause: age hysterectomy",
  mmeno63 = "Menopause: ovary removed",
  mmeno64 = "Menopause: age first ovary removed",
  mmeno65 = "Menopause: age second ovary removed",
  mmeno66 = "Menopause: age one ovary removed",
  mmeno81 = "Menopause: age start use contraceptive pill",
  mmeno82 = "Menopause: females sex hormones",
  mmeno83 = "Menopause: hormones type",
  mmeno84 = "Menopause: hormones start age",
  mmeno85 = "Menopause: hormones # months"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "menno18",
    "mmeno05",
    "mmeno09",
    "mmeno17",
    "mmeno61",
    "mmeno62",
    "mmeno63",
    "mmeno66",
    "mmeno82",
    "mmeno83"
  )],
    mmeno05 = "Menopause 01: age period stopped",
    mmeno09 = "Menopause 06: hot flushes",
    mmeno62 = "Menopause 03: hysterectomy age",
    mmeno63 = "Menopause 04: ovary removed",
    mmeno66 = "Menopause 05: ovary age (last operation)",
    mmeno82 = "Menopause 08: female sex hormones",
    mmeno83 = "Menopause 09: hormones type"
  ),
  Wave_2B_labels = harmonized_labels[c(
    "mmenno61",
    "mmeno01",
    "mmeno02",
    "mmeno03",
    "mmeno04",
    "mmeno05",
    "mmeno07",
    "mmeno08",
    "mmeno09",
    "mmeno10",
    "mmeno11",
    "mmeno12",
    "mmeno13",
    "mmeno14",
    "mmeno15",
    "mmeno16",
    "mmeno62",
    "mmeno63",
    "mmeno64",
    "mmeno81",
    "mmeno82",
    "mmeno83",
    "mmeno84",
    "mmeno85"
  )],
  Wave_3B_labels = harmonized_labels[c(
    "mmenno61",
    "mmeno01",
    "mmeno02",
    "mmeno03",
    "mmeno04",
    "mmeno05",
    "mmeno07",
    "mmeno08",
    "mmeno09",
    "mmeno10",
    "mmeno11",
    "mmeno12",
    "mmeno13",
    "mmeno14",
    "mmeno15",
    "mmeno16",
    "mmeno62",
    "mmeno63",
    "mmeno64",
    "mmeno65",
    "mmeno66",
    "mmeno81",
    "mmeno82",
    "mmeno83",
    "mmeno84",
    "mmeno85"
  )],
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c(
    "mmeno01",
    "mmeno05",
    "mmeno09",
    "mmeno10",
    "mmeno14",
    "mmeno61",
    "mmeno62",
    "mmeno63",
    "mmeno64",
    "mmeno65",
    "mmeno66",
    "mmeno82",
    "mmeno84",
    "mmeno85"
  )],
    mmeno61 = "Menopause: hysterectomy"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  menno18 = c(`-3` = "na, wrong skip", `-2` = "na, see CMMENO82", `-1` = "R does not know age"),
  mmenno61 = c(`-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mmeno01 = c(`-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked"),
  mmeno02 = c(`-2` = "see BMMENO03", `-1` = "na, asked"),
  mmeno03 = c(`-3` = "did not bear children", `-2` = "see BMMENO04", `-1` = "na, asked"),
  mmeno04 = c(`-2` = "male respondent", `-1` = "na, asked", `1` = "yes", `2` = "no"),
  mmeno05 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "male respondent",
    `-1` = "missing / source-specific"
  ),
  mmeno07 = c(`-2` = "male respondent", `-1` = "na, asked", `1` = "yes", `2` = "no"),
  mmeno08 = c(`-1` = "na, asked"),
  mmeno09 = c(
    `-5` = "na, interview terminated",
    `-3` = "missing / source-specific",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "no",
    `3` = "R refused to answer",
    `4` = "R does not know"
  ),
  mmeno10 = c(
    `-3` = "missing / source-specific",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "no",
    `3` = "R refused to answer",
    `4` = "R does not know"
  ),
  mmeno11 = c(
    `-3` = "R does not know",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
  mmeno12 = c(
    `-3` = "R does not know",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
  mmeno13 = c(
    `-3` = "R does not know",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
  mmeno14 = c(
    `-3` = "missing / source-specific",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R refused to answer",
    `4` = "R does not know"
  ),
  mmeno15 = c(`-2` = "see BMMENO14"),
  mmeno16 = c(`-1` = "na, asked"),
  mmeno17 = c(`-3` = "na, wrong skip", `-2` = "na, see CMMENO09", `-1` = "R does not know age"),
  mmeno61 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mmeno62 = c(`-3` = "na, wrong skip", `-2` = "see BMMENO61", `-1` = "missing / source-specific"),
  mmeno63 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "male respondent",
    `-1` = "missing / source-specific",
    `1` = "no",
    `2` = "yes, one taken",
    `3` = "yes, both taken"
  ),
  mmeno64 = c(`-2` = "see BMMENO63", `-1` = "na, asked"),
  mmeno65 = c(`-2` = "na, see BMMENO63", `-1` = "na, asked"),
  mmeno66 = c(`-3` = "na, wrong skip", `-2` = "na, see CMMENO63", `-1` = "missing / source-specific"),
  mmeno81 = c(`-2` = "see BMMENO07"),
  mmeno82 = c(
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "yes, after menopause",
    `4` = "yes, during and after menopause"
  ),
  mmeno83 = c(`-3` = "na, wrong skip", `-2` = "see BMMENO82", `-1` = "na, asked", `0` = "to be coded"),
  mmeno84 = c(`-2` = "see BMMENO82"),
  mmeno85 = c(`-1` = "na, asked")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "menno18",
    "mmeno05",
    "mmeno09",
    "mmeno17",
    "mmeno61",
    "mmeno62",
    "mmeno63",
    "mmeno66",
    "mmeno82",
    "mmeno83"
  )],
    mmeno05 = c(`-5` = "na, interview terminated", `-2` = "male respondent", `-1` = "R does not know age"),
    mmeno09 = c(
    `-5` = "na, interview terminated",
    `-2` = "male respondent",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mmeno61 = c(
    `-5` = "na, interview terminated",
    `-2` = "male respondent",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mmeno62 = .replace_labels(
    standardized_value_labels$mmeno62,
    `-2` = "na, see CMMENO61",
    `-1` = "R does not know age"
  ),
    mmeno63 = c(
    `-5` = "na, interview terminated",
    `-2` = "male respondent",
    `-1` = "R does not know age",
    `1` = "no",
    `2` = "yes, one taken",
    `3` = "yes, both taken"
  ),
    mmeno66 = .replace_labels(
    standardized_value_labels$mmeno66,
    `-1` = "R does not know age"
  ),
    mmeno82 = c(
    `-5` = "na, interview terminated",
    `-2` = "male respondent",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mmeno83 = c(`-3` = "na, wrong skip", `-2` = "na, see CMMENO82", `0` = "to be coded")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mmenno61",
    "mmeno01",
    "mmeno02",
    "mmeno03",
    "mmeno04",
    "mmeno05",
    "mmeno07",
    "mmeno08",
    "mmeno09",
    "mmeno10",
    "mmeno11",
    "mmeno12",
    "mmeno13",
    "mmeno14",
    "mmeno15",
    "mmeno16",
    "mmeno62",
    "mmeno63",
    "mmeno64",
    "mmeno81",
    "mmeno82",
    "mmeno83",
    "mmeno84",
    "mmeno85"
  )],
    mmeno01 = c(`-2` = "male respondent", `-1` = "na, asked"),
    mmeno05 = c(`-2` = "male respondent", `-1` = "na, asked"),
    mmeno09 = c(
    `-3` = "R does not know",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    mmeno10 = c(
    `-3` = "R does not know",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    mmeno14 = c(
    `-3` = "R does not know",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mmeno62 = c(`-2` = "see BMMENO61", `-1` = "na, asked"),
    mmeno63 = c(
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, one removed",
    `3` = "yes, both removed"
  ),
    mmeno82 = c(`-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmeno83 = c(`-2` = "see BMMENO82", `-1` = "na, asked", `0` = "to be coded")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mmenno61",
    "mmeno01",
    "mmeno02",
    "mmeno03",
    "mmeno04",
    "mmeno05",
    "mmeno07",
    "mmeno08",
    "mmeno09",
    "mmeno10",
    "mmeno11",
    "mmeno12",
    "mmeno13",
    "mmeno14",
    "mmeno15",
    "mmeno16",
    "mmeno62",
    "mmeno63",
    "mmeno64",
    "mmeno65",
    "mmeno66",
    "mmeno81",
    "mmeno82",
    "mmeno83",
    "mmeno84",
    "mmeno85"
  )],
    mmeno01 = c(`-2` = "male respondent", `-1` = "na, asked"),
    mmeno05 = c(`-2` = "male respondent", `-1` = "na, asked"),
    mmeno09 = c(
    `-3` = "R does not know",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    mmeno10 = c(
    `-3` = "R does not know",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "no"
  ),
    mmeno14 = c(
    `-3` = "R does not know",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mmeno62 = c(`-2` = "see BMMENO61", `-1` = "na, asked"),
    mmeno63 = c(
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, one removed",
    `3` = "yes, both removed"
  ),
    mmeno66 = c(`-2` = "na, see BMMENO63", `-1` = "na, asked"),
    mmeno82 = c(`-2` = "male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmeno83 = c(`-2` = "see BMMENO82", `-1` = "na, asked", `0` = "to be coded")
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c(
    "mmeno01",
    "mmeno05",
    "mmeno09",
    "mmeno10",
    "mmeno14",
    "mmeno61",
    "mmeno62",
    "mmeno63",
    "mmeno64",
    "mmeno65",
    "mmeno66",
    "mmeno82",
    "mmeno84",
    "mmeno85"
  )],
    mmeno05 = c(`-3` = "na, wrong skip", `-2` = "male respondent", `-1` = "na, asked"),
    mmeno09 = c(
    `-3` = "na, wrong skip",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "R refused to answer",
    `4` = "R does not know"
  ),
    mmeno10 = .replace_labels(
    standardized_value_labels$mmeno10,
    `-3` = "na, wrong skip",
    `2` = "yes"
  ),
    mmeno14 = .replace_labels(
    standardized_value_labels$mmeno14,
    `-3` = "na, wrong skip"
  ),
    mmeno61 = c(
    `-3` = "na, wrong skip",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mmeno62 = c(`-2` = "na, see BMMENO61", `-1` = "na, asked"),
    mmeno63 = c(
    `-3` = "na, wrong skip",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, one removed",
    `3` = "yes, both removed"
  ),
    mmeno64 = c(`-2` = "na, see BMMENO63"),
    mmeno65 = c(`-1` = "na, asked"),
    mmeno66 = c(`-1` = "na, asked"),
    mmeno82 = c(
    `-3` = "na, wrong skip",
    `-2` = "male respondent",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, during menopause",
    `3` = "yes, after menopause",
    `4` = "yes, during and after menopause"
  ),
    mmeno84 = .replace_labels(
    standardized_value_labels$mmeno84,
    `-2` = "na, see BMMENO82"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  menno18 = "numeric",
  mmenno61 = "categorical",
  mmeno01 = "numeric",
  mmeno02 = "numeric",
  mmeno03 = "numeric",
  mmeno04 = "categorical",
  mmeno05 = "numeric",
  mmeno07 = "categorical",
  mmeno08 = "numeric",
  mmeno09 = "categorical",
  mmeno10 = "categorical",
  mmeno11 = "categorical",
  mmeno12 = "categorical",
  mmeno13 = "categorical",
  mmeno14 = "categorical",
  mmeno15 = "numeric",
  mmeno16 = "numeric",
  mmeno17 = "numeric",
  mmeno61 = "categorical",
  mmeno62 = "numeric",
  mmeno63 = "categorical",
  mmeno64 = "numeric",
  mmeno65 = "numeric",
  mmeno66 = "numeric",
  mmeno81 = "numeric",
  mmeno82 = "categorical",
  mmeno83 = "categorical",
  mmeno84 = "numeric",
  mmeno85 = "numeric"
)

.lasa_fc_181 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "181", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "181", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "181", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "181", waves = .lasa_wave_rows())
)
