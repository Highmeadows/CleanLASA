## LASA filecode 038 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  relig01 = "Member of a church or a particular ideological group?",
  relig02 = "Life after death",
  relig03 = "Heaven",
  relig04 = "Hell",
  relig05 = "Devil",
  relig06 = "Adam and Eve",
  relig07 = "Bible as God",
  relig08 = "Praying: meaningful",
  relig09 = "Influences my daily life",
  relig10 = "Role in important decisions",
  relig11 = "Influences my political opinion",
  relig12 = "Life would look different without",
  relig13 = "Faith: very interesting",
  relig14 = "Border life/death less striking",
  relig15 = "Unimportance individual life",
  relig16 = "Mutual connection universe",
  relig17 = "Close presence persons",
  relig18 = "Distance past/present disappears",
  relig19 = "Belonging with earlier/coming generation",
  relig1a = "Which church or particular ideological group?",
  relig1b = "Church attendance frequency",
  relig8a = "Praying: frequency",
  rmgl = "Reason missing"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `C` = c(
    "relig01",
    "relig02",
    "relig03",
    "relig04",
    "relig05",
    "relig06",
    "relig07",
    "relig08",
    "relig09",
    "relig10",
    "relig11",
    "relig12",
    "relig13",
    "relig14",
    "relig15",
    "relig16",
    "relig17",
    "relig18",
    "relig19",
    "rmgl"
  ),
  `D` = c(
    "relig01",
    "relig08",
    "relig09",
    "relig10",
    "relig11",
    "relig12",
    "relig13",
    "relig14",
    "relig15",
    "relig16",
    "relig17",
    "relig18",
    "relig19",
    "relig1a",
    "relig1b",
    "relig8a",
    "rmgl"
  ),
  `E` = c(
    "relig01",
    "relig08",
    "relig09",
    "relig10",
    "relig11",
    "relig12",
    "relig13",
    "relig14",
    "relig15",
    "relig16",
    "relig17",
    "relig18",
    "relig19",
    "relig1b",
    "relig8a",
    "rmgl"
  ),
  `2B` = c(
    "relig01",
    "relig08",
    "relig09",
    "relig10",
    "relig11",
    "relig12",
    "relig13",
    "relig14",
    "relig15",
    "relig16",
    "relig17",
    "relig18",
    "relig19",
    "relig1b",
    "relig8a",
    "rmgl"
  ),
  `F` = c(
    "relig08",
    "relig14",
    "relig15",
    "relig16",
    "relig17",
    "relig18",
    "relig19",
    "relig1b",
    "relig8a",
    "rmgl"
  ),
  `G` = c(
    "relig08",
    "relig1b",
    "relig8a",
    "rmgl"
  ),
  `H` = c(
    "relig08",
    "relig1b",
    "relig8a",
    "rmgl"
  ),
  `3B` = c(
    "relig08",
    "relig8a"
  ),
  `MB` = c(
    "relig1a",
    "relig1b"
  ),
  `I` = c(
    "relig08",
    "relig1b",
    "relig8a"
  ),
  `J` = c(
    "relig08",
    "relig1b",
    "relig8a"
  ),
  `K` = c(
    "relig08",
    "relig1b",
    "relig8a"
  )
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    relig08 = "Praying:",
    relig8a = "Praying:"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    relig1a = "Member of a church or particular ideological group"
  ),
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  relig01 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  relig02 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  relig03 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  relig04 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  relig05 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  relig06 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  relig07 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  relig08 = c(
    `-5` = "meaningful interview terminated",
    default_missing_labels[c("-2", "-1")],
    `1` = "no",
    `2` = "yes"
  ),
  relig09 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/no disagree",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  relig10 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/no disagree",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  relig11 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/no disagree",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  relig12 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/no disagree",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  relig13 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "strongly agree",
    `2` = "agree",
    `3` = "no agreement/no disagree",
    `4` = "disagree",
    `5` = "strongly disagree"
  ),
  relig14 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "not recognizing content",
    `2` = "recognizing content"
  ),
  relig15 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "not recognizing content",
    `2` = "recognizing content"
  ),
  relig16 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "not recognizing content",
    `2` = "recognizing content"
  ),
  relig17 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "not recognizing content",
    `2` = "recognizing content"
  ),
  relig18 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "not recognizing content",
    `2` = "recognizing content"
  ),
  relig19 = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "not recognizing content",
    `2` = "recognizing content"
  ),
  relig1a = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "no member (not religious)",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "Roman-Catholic",
    `6` = "other protestant denomination",
    `7` = "label varies by wave",
    `8` = "label varies by wave",
    `9` = "label varies by wave",
    `10` = "Hinduism",
    `11` = "other"
  ),
  relig1b = c(
    default_missing_labels[c("-2", "-1")],
    `1` = "never",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "once a day",
    `8` = "more than once a day"
  ),
  relig8a = c(
    `-5` = "frequency interview terminated",
    default_missing_labels[c("-2", "-1")],
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  ),
  rmgl = c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    relig01 = .replace_labels(
    standardized_value_labels$relig01,
    `-2` = "na, see CRMGL"
  ),
    relig02 = .replace_labels(
    standardized_value_labels$relig02,
    `-2` = "na, see CRMGL"
  ),
    relig03 = .replace_labels(
    standardized_value_labels$relig03,
    `-2` = "na, see CRMGL"
  ),
    relig04 = .replace_labels(
    standardized_value_labels$relig04,
    `-2` = "na, see CRMGL"
  ),
    relig05 = .replace_labels(
    standardized_value_labels$relig05,
    `-2` = "na, see CRMGL"
  ),
    relig06 = .replace_labels(
    standardized_value_labels$relig06,
    `-2` = "na, see CRMGL"
  ),
    relig07 = .replace_labels(
    standardized_value_labels$relig07,
    `-2` = "na, see CRMGL"
  ),
    relig08 = c(`-2` = "na, see CRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig09 = .replace_labels(
    standardized_value_labels$relig09,
    `-2` = "na, see CRMGL"
  ),
    relig10 = .replace_labels(
    standardized_value_labels$relig10,
    `-2` = "na, see CRMGL"
  ),
    relig11 = .replace_labels(
    standardized_value_labels$relig11,
    `-2` = "na, see CRMGL"
  ),
    relig12 = .replace_labels(
    standardized_value_labels$relig12,
    `-2` = "na, see CRMGL"
  ),
    relig13 = .replace_labels(
    standardized_value_labels$relig13,
    `-2` = "na, see CRMGL"
  ),
    relig14 = .replace_labels(
    standardized_value_labels$relig14,
    `-2` = "na, see CRMGL"
  ),
    relig15 = .replace_labels(
    standardized_value_labels$relig15,
    `-2` = "na, see CRMGL"
  ),
    relig16 = .replace_labels(
    standardized_value_labels$relig16,
    `-2` = "na, see CRMGL"
  ),
    relig17 = .replace_labels(
    standardized_value_labels$relig17,
    `-2` = "na, see CRMGL"
  ),
    relig18 = .replace_labels(
    standardized_value_labels$relig18,
    `-2` = "na, see CRMGL"
  ),
    relig19 = .replace_labels(
    standardized_value_labels$relig19,
    `-2` = "na, see CRMGL"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    relig01 = .replace_labels(
    standardized_value_labels$relig01,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig08 = c(`-2` = "na, see D/E/BRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig09 = .replace_labels(
    standardized_value_labels$relig09,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig10 = .replace_labels(
    standardized_value_labels$relig10,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig11 = .replace_labels(
    standardized_value_labels$relig11,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig12 = .replace_labels(
    standardized_value_labels$relig12,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig13 = .replace_labels(
    standardized_value_labels$relig13,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig14 = .replace_labels(
    standardized_value_labels$relig14,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig15 = .replace_labels(
    standardized_value_labels$relig15,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig16 = .replace_labels(
    standardized_value_labels$relig16,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig17 = .replace_labels(
    standardized_value_labels$relig17,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig18 = .replace_labels(
    standardized_value_labels$relig18,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig19 = .replace_labels(
    standardized_value_labels$relig19,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig1a = c(
    `-2` = "na, see DRELIG01",
    `-1` = "na, asked",
    `1` = "Dutch Reformed (without Ger. Bond)",
    `2` = "Ger. Bond (Dutch Reformed)",
    `3` = "Reformed Calvinist",
    `4` = "small Reformed denomination",
    `5` = "Roman-Catholic",
    `6` = "other protestant denomination",
    `7` = "Humanistic Society",
    `8` = "Jewish",
    `9` = "Muslim",
    `10` = "Hinduism",
    `11` = "other"
  ),
    relig1b = c(
    `-2` = "na, see D/E/BRELIG01",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "once a year or less",
    `3` = "a few times a year",
    `4` = "approx. once a month",
    `5` = "2 or 3 times a month",
    `6` = "once a week or more"
  ),
    relig8a = c(
    `-2` = "na, see D/E/BRMGL",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    relig01 = .replace_labels(
    standardized_value_labels$relig01,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig08 = c(`-2` = "na, see D/E/BRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig09 = .replace_labels(
    standardized_value_labels$relig09,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig10 = .replace_labels(
    standardized_value_labels$relig10,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig11 = .replace_labels(
    standardized_value_labels$relig11,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig12 = .replace_labels(
    standardized_value_labels$relig12,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig13 = .replace_labels(
    standardized_value_labels$relig13,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig14 = .replace_labels(
    standardized_value_labels$relig14,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig15 = .replace_labels(
    standardized_value_labels$relig15,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig16 = .replace_labels(
    standardized_value_labels$relig16,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig17 = .replace_labels(
    standardized_value_labels$relig17,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig18 = .replace_labels(
    standardized_value_labels$relig18,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig19 = .replace_labels(
    standardized_value_labels$relig19,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig1b = c(
    `-2` = "na, see D/E/BRELIG01",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "once a year or less",
    `3` = "a few times a year",
    `4` = "approx. once a month",
    `5` = "2 or 3 times a month",
    `6` = "once a week or more"
  ),
    relig8a = c(
    `-2` = "na, see D/E/BRMGL",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    relig01 = .replace_labels(
    standardized_value_labels$relig01,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig08 = c(`-2` = "na, see D/E/BRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig09 = .replace_labels(
    standardized_value_labels$relig09,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig10 = .replace_labels(
    standardized_value_labels$relig10,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig11 = .replace_labels(
    standardized_value_labels$relig11,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig12 = .replace_labels(
    standardized_value_labels$relig12,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig13 = .replace_labels(
    standardized_value_labels$relig13,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig14 = .replace_labels(
    standardized_value_labels$relig14,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig15 = .replace_labels(
    standardized_value_labels$relig15,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig16 = .replace_labels(
    standardized_value_labels$relig16,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig17 = .replace_labels(
    standardized_value_labels$relig17,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig18 = .replace_labels(
    standardized_value_labels$relig18,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig19 = .replace_labels(
    standardized_value_labels$relig19,
    `-2` = "na, see D/E/BRMGL"
  ),
    relig1b = c(
    `-2` = "na, see D/E/BRELIG01",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "once a year or less",
    `3` = "a few times a year",
    `4` = "approx. once a month",
    `5` = "2 or 3 times a month",
    `6` = "once a week or more"
  ),
    relig8a = c(
    `-2` = "na, see D/E/BRMGL",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    relig08 = c(`-2` = "na, see FRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig14 = .replace_labels(
    standardized_value_labels$relig14,
    `-2` = "na, see FRMGL"
  ),
    relig15 = .replace_labels(
    standardized_value_labels$relig15,
    `-2` = "na, see FRMGL"
  ),
    relig16 = .replace_labels(
    standardized_value_labels$relig16,
    `-2` = "na, see FRMGL"
  ),
    relig17 = .replace_labels(
    standardized_value_labels$relig17,
    `-2` = "na, see FRMGL"
  ),
    relig18 = .replace_labels(
    standardized_value_labels$relig18,
    `-2` = "na, see FRMGL"
  ),
    relig19 = .replace_labels(
    standardized_value_labels$relig19,
    `-2` = "na, see FRMGL"
  ),
    relig1b = c(
    `-2` = "na, see FRMGL",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "once a year or less",
    `3` = "a few times a year",
    `4` = "approx. once a month",
    `5` = "2 or 3 times a month",
    `6` = "once a week or more"
  ),
    relig8a = c(
    `-2` = "na, see FRMGL",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    relig08 = c(`-2` = "na, see G/HRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig1b = c(
    `-2` = "na, see G/HRMGL",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "once a year or less",
    `3` = "a few times a year",
    `4` = "approx. once a month",
    `5` = "2 or 3 times a month",
    `6` = "once a week or more"
  ),
    relig8a = c(
    `-2` = "na, see G/HRMGL",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    relig08 = c(`-2` = "na, see G/HRMGL", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig1b = c(
    `-2` = "na, see G/HRMGL",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "once a year or less",
    `3` = "a few times a year",
    `4` = "approx. once a month",
    `5` = "2 or 3 times a month",
    `6` = "once a week or more"
  ),
    relig8a = c(
    `-2` = "na, see G/HRMGL",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    relig08 = c(`-5` = "meaningful interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig8a = c(
    `-5` = "frequency interview terminated",
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    relig1a = c(
    `-1` = "na, asked",
    `0` = "no member (not religious)",
    `1` = "Islam",
    `2` = "Roman-Catholic",
    `3` = "Protestant",
    `4` = "Jewish",
    `7` = "Orthodox",
    `8` = "Alevism",
    `9` = "Bahai"
  ),
    relig1b = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    relig08 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig1b = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "once a year or less",
    `3` = "a few times a year",
    `4` = "approx. once a month",
    `5` = "2 or 3 times a month",
    `6` = "once a week or more"
  ),
    relig8a = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    relig08 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig1b = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "once a year or less",
    `3` = "a few times a year",
    `4` = "approx. once a month",
    `5` = "2 or 3 times a month",
    `6` = "once a week or more"
  ),
    relig8a = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    relig08 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    relig1b = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "once a year or less",
    `3` = "a few times a year",
    `4` = "approx. once a month",
    `5` = "2 or 3 times a month",
    `6` = "once a week or more"
  ),
    relig8a = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "less than once a month",
    `3` = "once a month",
    `4` = "a few times a month",
    `5` = "once a week",
    `6` = "a few times a week",
    `7` = "once a day",
    `8` = "more than once a day"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  relig01 = "categorical",
  relig02 = "categorical",
  relig03 = "categorical",
  relig04 = "categorical",
  relig05 = "categorical",
  relig06 = "categorical",
  relig07 = "categorical",
  relig08 = "categorical",
  relig09 = "categorical",
  relig10 = "categorical",
  relig11 = "categorical",
  relig12 = "categorical",
  relig13 = "categorical",
  relig14 = "categorical",
  relig15 = "categorical",
  relig16 = "categorical",
  relig17 = "categorical",
  relig18 = "categorical",
  relig19 = "categorical",
  relig1a = "categorical",
  relig1b = "categorical",
  relig8a = "categorical",
  rmgl = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "038", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "038", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "038", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "038", waves = .lasa_wave_rows())
)

.lasa_fc_038 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

