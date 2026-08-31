## LASA filecode 165 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  Acor = "number of animals correct",
  Adub = "number of duplicate animal words",
  Anot = "animal fluency test status",
  Aoth = "number of non-animal words",
  Arm = "reason no animal fluency trial",
  SWcor = "number of supermarket words correct",
  SWdub = "number of duplicate supermarket words",
  SWnot = "supermarket-word fluency test status",
  SWoth = "number of non-supermarket words",
  SWpa_0 = "supermarket-word test particularities present",
  SWpa_1 = "supermarket-word particularity: others present",
  SWpa_2 = "supermarket-word particularity: auditory handicap",
  SWpa_3 = "supermarket-word particularity: radio or television noise",
  SWpa_4 = "supermarket-word particularity: interrupted",
  SWpa_5 = "supermarket-word particularity: other reason",
  SWpa_5sp = "supermarket-word particularity: other reason specification",
  SWrm = "reason no supermarket-word fluency trial",
  mAcor = "number of animals correct",
  mAdub = "number of duplicate animal words",
  mAnot = "animal fluency test status",
  mAoth = "number of non-animal words",
  mApa_0 = "animal test particularities present",
  mApa_1 = "animal particularity: others present",
  mApa_2 = "animal particularity: sensory handicap",
  mApa_3 = "animal particularity: radio or television noise",
  mApa_4 = "animal particularity: interrupted",
  mApa_5 = "animal particularity: other reason",
  mApa_5sp = "animal particularity: other reason specification",
  mArm = "reason no animal fluency trial",
  mDWcor = "number of D-words correct",
  mDWdub = "number of duplicate D-words",
  mDWnot = "D-word fluency test status",
  mDWoth = "number of non-D words",
  mDWpa_0 = "D-word test particularities present",
  mDWpa_1 = "D-word particularity: others present",
  mDWpa_2 = "D-word particularity: sensory handicap",
  mDWpa_3 = "D-word particularity: radio or television noise",
  mDWpa_4 = "D-word particularity: interrupted",
  mDWpa_5 = "D-word particularity: other reason",
  mDWpa_5sp = "D-word particularity: other reason specification",
  mDWrem = "reason no D-word fluency trial"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `H` = c(
    "mAcor",
    "mAdub",
    "mAnot",
    "mAoth",
    "mApa_0",
    "mApa_1",
    "mApa_2",
    "mApa_3",
    "mApa_4",
    "mApa_5",
    "mDWcor",
    "mDWdub",
    "mDWnot",
    "mDWoth",
    "mDWpa_0",
    "mDWpa_1",
    "mDWpa_2",
    "mDWpa_3",
    "mDWpa_4",
    "mDWpa_5"
  ),
  `3B` = c(
    "mAcor",
    "mAdub",
    "mAnot",
    "mAoth",
    "mApa_0",
    "mApa_1",
    "mApa_2",
    "mApa_3",
    "mApa_4",
    "mApa_5",
    "mDWcor",
    "mDWdub",
    "mDWnot",
    "mDWoth",
    "mDWpa_0",
    "mDWpa_1",
    "mDWpa_2",
    "mDWpa_3",
    "mDWpa_4",
    "mDWpa_5"
  ),
  `MB` = c(
    "Acor",
    "Adub",
    "Anot",
    "Aoth",
    "Arm",
    "SWcor",
    "SWdub",
    "SWnot",
    "SWoth",
    "SWpa_0",
    "SWpa_1",
    "SWpa_2",
    "SWpa_3",
    "SWpa_4",
    "SWpa_5",
    "SWpa_5sp",
    "SWrm"
  ),
  `I` = c(
    "mAcor",
    "mAdub",
    "mAnot",
    "mAoth",
    "mApa_0",
    "mApa_1",
    "mApa_2",
    "mApa_3",
    "mApa_4",
    "mApa_5",
    "mApa_5sp",
    "mArm",
    "mDWcor",
    "mDWdub",
    "mDWnot",
    "mDWoth",
    "mDWpa_0",
    "mDWpa_1",
    "mDWpa_2",
    "mDWpa_3",
    "mDWpa_4",
    "mDWpa_5",
    "mDWpa_5sp",
    "mDWrem"
  ),
  `J` = c(
    "mAcor",
    "mAdub",
    "mAnot",
    "mAoth",
    "mApa_0",
    "mApa_1",
    "mApa_2",
    "mApa_3",
    "mApa_4",
    "mApa_5",
    "mDWcor",
    "mDWdub",
    "mDWnot",
    "mDWoth",
    "mDWpa_0",
    "mDWpa_1",
    "mDWpa_2",
    "mDWpa_3",
    "mDWpa_4",
    "mDWpa_5"
  ),
  `K` = c(
    "mAcor",
    "mAdub",
    "mAnot",
    "mAoth",
    "mApa_0",
    "mApa_1",
    "mApa_2",
    "mApa_3",
    "mApa_4",
    "mApa_5",
    "mDWcor",
    "mDWdub",
    "mDWnot",
    "mDWoth",
    "mDWpa_0",
    "mDWpa_1",
    "mDWpa_2",
    "mDWpa_3",
    "mDWpa_4",
    "mDWpa_5"
  )
)

variable_labels_list <- list(
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    mAdub = "number of animals double",
    mAnot = "fluency animals done?",
    mAoth = "number of other Animals",
    mApa_0 = "Animals particularities",
    mApa_1 = "Animals particularities: others present",
    mApa_2 = "Animals particularities: auditory handicap",
    mApa_3 = "Animals particularities: radio or tv noise",
    mApa_4 = "Animals particularities: interrupted",
    mApa_5 = "Animals particularities: other reason",
    mDWdub = "number of D-words double",
    mDWnot = "fluency D-words done?",
    mDWoth = "number of other than D-words",
    mDWpa_0 = "D-words particularities",
    mDWpa_1 = "D-words particularities: others present",
    mDWpa_2 = "D-words particularities: auditory handicap",
    mDWpa_3 = "D-words particularities: radio or tv noise",
    mDWpa_4 = "D-words particularities: interrupted",
    mDWpa_5 = "D-words particularities: other reason"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    mAdub = "number of animals double",
    mAnot = "fluency animals done?",
    mAoth = "number of other Animals",
    mApa_0 = "Animals particularities",
    mApa_1 = "Animals particularities: others present",
    mApa_2 = "Animals particularities: visually handicapped",
    mApa_3 = "Animals particularities: radio or tv noise",
    mApa_4 = "Animals particularities: interrupted",
    mApa_5 = "Animals particularities: other reason",
    mDWdub = "number of D-words double",
    mDWnot = "fluency D-words done?",
    mDWoth = "number of other than D-words",
    mDWpa_0 = "D-words particularities",
    mDWpa_1 = "D-words particularities: others present",
    mDWpa_2 = "D-words particularities: visually handicapped",
    mDWpa_3 = "D-words particularities: radio or tv noise",
    mDWpa_4 = "D-words particularities: interrupted",
    mDWpa_5 = "D-words particularities: other reason"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    Acor = "number of Animals correct",
    Adub = "number of Animals double",
    Anot = "fluency Animals done?",
    Aoth = "number of other Animals",
    Arm = "fluency: reason no Animals trial",
    SWcor = "number of Supermarket-words correct",
    SWdub = "number of Supermarket-words double",
    SWnot = "fluency Supermarket-words done?",
    SWoth = "number of other than Supermarket-words",
    SWpa_0 = "Supermarket words particularities",
    SWpa_1 = "Supermarket words part.: others present",
    SWpa_2 = "Supermarket words part.: auditory handicap",
    SWpa_3 = "Supermarket words part.: radio or tv noise",
    SWpa_4 = "Supermarket words part.: interrupted",
    SWpa_5 = "Supermarket words part.: other reason",
    SWpa_5sp = "specification part.: other reason",
    SWrm = "fluency: reason no Supermarket-words trial"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    mAdub = "number of animals double",
    mAnot = "fluency animals done?",
    mAoth = "number of other Animals",
    mApa_0 = "Animals particularities",
    mApa_1 = "Animals particularities: others present",
    mApa_2 = "Animals particularities: auditory handicap",
    mApa_3 = "Animals particularities: radio or tv noise",
    mApa_4 = "Animals particularities: interrupted",
    mApa_5 = "Animals particularities: other reason",
    mApa_5sp = "Animals particularities: other reason specification",
    mArm = "fluency: reason no Animals trial",
    mDWdub = "number of D-words double",
    mDWnot = "fluency D-words done?",
    mDWoth = "number of other than D-words",
    mDWpa_0 = "D-words particularities",
    mDWpa_1 = "D-words particularities: others present",
    mDWpa_2 = "D-words particularities: auditory handicap",
    mDWpa_3 = "D-words particularities: radio or tv noise",
    mDWpa_4 = "D-words particularities: interrupted",
    mDWpa_5 = "D-words particularities: other reason",
    mDWpa_5sp = "D-words particularities: other reason specification",
    mDWrem = "fluency: reason no D-words trial"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    mAdub = "number of animals double",
    mAnot = "fluency animals done?",
    mAoth = "number of other Animals",
    mApa_0 = "Animals particularities",
    mApa_1 = "Animals particularities: others present",
    mApa_2 = "Animals particularities: auditory handicap",
    mApa_3 = "Animals particularities: radio or tv noise",
    mApa_4 = "Animals particularities: interrupted",
    mApa_5 = "Animals particularities: other reason",
    mDWdub = "number of D-words double",
    mDWnot = "fluency D-words done?",
    mDWoth = "number of other than D-words",
    mDWpa_0 = "D-words particularities",
    mDWpa_1 = "D-words particularities: others present",
    mDWpa_2 = "D-words particularities: auditory handicap",
    mDWpa_3 = "D-words particularities: radio or tv noise",
    mDWpa_4 = "D-words particularities: interrupted",
    mDWpa_5 = "D-words particularities: other reason"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    mAdub = "number of animals double",
    mAnot = "fluency animals done?",
    mAoth = "number of other Animals",
    mApa_0 = "Animals particularities",
    mApa_1 = "Animals particularities: others present",
    mApa_2 = "Animals particularities: auditory handicap",
    mApa_3 = "Animals particularities: radio or tv noise",
    mApa_4 = "Animals particularities: interrupted",
    mApa_5 = "Animals particularities: other reason",
    mDWdub = "number of D-words double",
    mDWnot = "fluency D-words done?",
    mDWoth = "number of other than D-words",
    mDWpa_0 = "D-words particularities",
    mDWpa_1 = "D-words particularities: others present",
    mDWpa_2 = "D-words particularities: auditory handicap",
    mDWpa_3 = "D-words particularities: radio or tv noise",
    mDWpa_4 = "D-words particularities: interrupted",
    mDWpa_5 = "D-words particularities: other reason"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "mentioned"
)

standardized_value_labels <- list(
  Acor = c(`-1` = "no trial"),
  Adub = c(`-1` = "no trial"),
  Anot = c(`-1` = "missing", `0` = "test not done", `1` = "test done", `2` = "test done, score 0"),
  Aoth = c(`-1` = "no trial"),
  Arm = stats::setNames(character(0), character(0)),
  SWcor = c(`-1` = "no trial"),
  SWdub = c(`-1` = "no trial"),
  SWnot = c(`-1` = "missing", `0` = "test not done", `1` = "test done", `2` = "test done, score 0"),
  SWoth = c(`-1` = "no trial"),
  SWpa_0 = c(`-3` = "no test", `0` = "no", `1` = "yes"),
  SWpa_1 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  SWpa_2 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  SWpa_3 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  SWpa_4 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  SWpa_5 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  SWpa_5sp = stats::setNames(character(0), character(0)),
  SWrm = stats::setNames(character(0), character(0)),
  mAcor = c(`-1` = "no trial"),
  mAdub = c(`-1` = "no trial"),
  mAnot = c(
    `-1` = "missing/interview terminated",
    `0` = "test not done",
    `1` = "test done",
    `2` = "test done, score 0"
  ),
  mAoth = c(`-1` = "no trial"),
  mApa_0 = c(`-3` = "no test", `0` = "no", `1` = "yes"),
  mApa_1 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mApa_2 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mApa_3 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mApa_4 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mApa_5 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mApa_5sp = stats::setNames(character(0), character(0)),
  mArm = stats::setNames(character(0), character(0)),
  mDWcor = c(`-1` = "no trial"),
  mDWdub = c(`-1` = "no trial"),
  mDWnot = c(
    `-1` = "missing/interview terminated",
    `0` = "test not done",
    `1` = "test done",
    `2` = "test done, score 0"
  ),
  mDWoth = c(`-1` = "no trial"),
  mDWpa_0 = c(`-3` = "no test", `0` = "no", `1` = "yes"),
  mDWpa_1 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mDWpa_2 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mDWpa_3 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mDWpa_4 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mDWpa_5 = c(
    `-3` = "no test",
    `-2` = "no",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mDWpa_5sp = stats::setNames(character(0), character(0)),
  mDWrem = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    mApa_1 = .replace_labels(
    standardized_value_labels$mApa_1,
    `-2` = "no particularities"
  ),
    mApa_2 = .replace_labels(
    standardized_value_labels$mApa_2,
    `-2` = "no particularities"
  ),
    mApa_3 = .replace_labels(
    standardized_value_labels$mApa_3,
    `-2` = "no particularities"
  ),
    mApa_4 = .replace_labels(
    standardized_value_labels$mApa_4,
    `-2` = "no particularities"
  ),
    mApa_5 = .replace_labels(
    standardized_value_labels$mApa_5,
    `-2` = "no particularities"
  ),
    mDWpa_1 = .replace_labels(
    standardized_value_labels$mDWpa_1,
    `-2` = "no particularities"
  ),
    mDWpa_2 = .replace_labels(
    standardized_value_labels$mDWpa_2,
    `-2` = "no particularities"
  ),
    mDWpa_3 = .replace_labels(
    standardized_value_labels$mDWpa_3,
    `-2` = "no particularities"
  ),
    mDWpa_4 = .replace_labels(
    standardized_value_labels$mDWpa_4,
    `-2` = "no particularities"
  ),
    mDWpa_5 = .replace_labels(
    standardized_value_labels$mDWpa_5,
    `-2` = "no particularities"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    mApa_1 = .replace_labels(
    standardized_value_labels$mApa_1,
    `-2` = "no particularities"
  ),
    mApa_2 = .replace_labels(
    standardized_value_labels$mApa_2,
    `-2` = "no particularities"
  ),
    mApa_3 = .replace_labels(
    standardized_value_labels$mApa_3,
    `-2` = "no particularities"
  ),
    mApa_4 = .replace_labels(
    standardized_value_labels$mApa_4,
    `-2` = "no particularities"
  ),
    mApa_5 = .replace_labels(
    standardized_value_labels$mApa_5,
    `-2` = "no particularities"
  ),
    mDWpa_1 = .replace_labels(
    standardized_value_labels$mDWpa_1,
    `-2` = "no particularities"
  ),
    mDWpa_2 = .replace_labels(
    standardized_value_labels$mDWpa_2,
    `-2` = "no particularities"
  ),
    mDWpa_3 = .replace_labels(
    standardized_value_labels$mDWpa_3,
    `-2` = "no particularities"
  ),
    mDWpa_4 = .replace_labels(
    standardized_value_labels$mDWpa_4,
    `-2` = "no particularities"
  ),
    mDWpa_5 = .replace_labels(
    standardized_value_labels$mDWpa_5,
    `-2` = "no particularities"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    SWpa_1 = .replace_labels(
    standardized_value_labels$SWpa_1,
    `-2` = "no particularities"
  ),
    SWpa_2 = .replace_labels(
    standardized_value_labels$SWpa_2,
    `-2` = "no particularities"
  ),
    SWpa_3 = .replace_labels(
    standardized_value_labels$SWpa_3,
    `-2` = "no particularities"
  ),
    SWpa_4 = .replace_labels(
    standardized_value_labels$SWpa_4,
    `-2` = "no particularities"
  ),
    SWpa_5 = .replace_labels(
    standardized_value_labels$SWpa_5,
    `-2` = "no particularities"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    mApa_1 = .replace_labels(
    standardized_value_labels$mApa_1,
    `-2` = "no particularities"
  ),
    mApa_2 = .replace_labels(
    standardized_value_labels$mApa_2,
    `-2` = "no particularities"
  ),
    mApa_3 = .replace_labels(
    standardized_value_labels$mApa_3,
    `-2` = "no particularities"
  ),
    mApa_4 = .replace_labels(
    standardized_value_labels$mApa_4,
    `-2` = "no particularities"
  ),
    mApa_5 = .replace_labels(
    standardized_value_labels$mApa_5,
    `-2` = "no particularities"
  ),
    mDWpa_1 = .replace_labels(
    standardized_value_labels$mDWpa_1,
    `-2` = "no particularities"
  ),
    mDWpa_2 = .replace_labels(
    standardized_value_labels$mDWpa_2,
    `-2` = "no particularities"
  ),
    mDWpa_3 = .replace_labels(
    standardized_value_labels$mDWpa_3,
    `-2` = "no particularities"
  ),
    mDWpa_4 = .replace_labels(
    standardized_value_labels$mDWpa_4,
    `-2` = "no particularities"
  ),
    mDWpa_5 = .replace_labels(
    standardized_value_labels$mDWpa_5,
    `-2` = "no particularities"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    mApa_1 = .replace_labels(
    standardized_value_labels$mApa_1,
    `-2` = "no particularities"
  ),
    mApa_2 = .replace_labels(
    standardized_value_labels$mApa_2,
    `-2` = "no particularities"
  ),
    mApa_3 = .replace_labels(
    standardized_value_labels$mApa_3,
    `-2` = "no particularities"
  ),
    mApa_4 = .replace_labels(
    standardized_value_labels$mApa_4,
    `-2` = "no particularities"
  ),
    mApa_5 = .replace_labels(
    standardized_value_labels$mApa_5,
    `-2` = "no particularities"
  ),
    mDWpa_1 = .replace_labels(
    standardized_value_labels$mDWpa_1,
    `-2` = "no particularities"
  ),
    mDWpa_2 = .replace_labels(
    standardized_value_labels$mDWpa_2,
    `-2` = "no particularities"
  ),
    mDWpa_3 = .replace_labels(
    standardized_value_labels$mDWpa_3,
    `-2` = "no particularities"
  ),
    mDWpa_4 = .replace_labels(
    standardized_value_labels$mDWpa_4,
    `-2` = "no particularities"
  ),
    mDWpa_5 = .replace_labels(
    standardized_value_labels$mDWpa_5,
    `-2` = "no particularities"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    mApa_1 = .replace_labels(
    standardized_value_labels$mApa_1,
    `-2` = "no particularities"
  ),
    mApa_2 = .replace_labels(
    standardized_value_labels$mApa_2,
    `-2` = "no particularities"
  ),
    mApa_3 = .replace_labels(
    standardized_value_labels$mApa_3,
    `-2` = "no particularities"
  ),
    mApa_4 = .replace_labels(
    standardized_value_labels$mApa_4,
    `-2` = "no particularities"
  ),
    mApa_5 = .replace_labels(
    standardized_value_labels$mApa_5,
    `-2` = "no particularities"
  ),
    mDWpa_1 = .replace_labels(
    standardized_value_labels$mDWpa_1,
    `-2` = "no particularities"
  ),
    mDWpa_2 = .replace_labels(
    standardized_value_labels$mDWpa_2,
    `-2` = "no particularities"
  ),
    mDWpa_3 = .replace_labels(
    standardized_value_labels$mDWpa_3,
    `-2` = "no particularities"
  ),
    mDWpa_4 = .replace_labels(
    standardized_value_labels$mDWpa_4,
    `-2` = "no particularities"
  ),
    mDWpa_5 = .replace_labels(
    standardized_value_labels$mDWpa_5,
    `-2` = "no particularities"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  Acor = "numeric",
  Adub = "numeric",
  Anot = "categorical",
  Aoth = "numeric",
  Arm = "text",
  SWcor = "numeric",
  SWdub = "numeric",
  SWnot = "categorical",
  SWoth = "numeric",
  SWpa_0 = "categorical",
  SWpa_1 = "categorical",
  SWpa_2 = "categorical",
  SWpa_3 = "categorical",
  SWpa_4 = "categorical",
  SWpa_5 = "categorical",
  SWpa_5sp = "text",
  SWrm = "text",
  mAcor = "numeric",
  mAdub = "numeric",
  mAnot = "categorical",
  mAoth = "numeric",
  mApa_0 = "categorical",
  mApa_1 = "categorical",
  mApa_2 = "categorical",
  mApa_3 = "categorical",
  mApa_4 = "categorical",
  mApa_5 = "categorical",
  mApa_5sp = "text",
  mArm = "text",
  mDWcor = "numeric",
  mDWdub = "numeric",
  mDWnot = "categorical",
  mDWoth = "numeric",
  mDWpa_0 = "categorical",
  mDWpa_1 = "categorical",
  mDWpa_2 = "categorical",
  mDWpa_3 = "categorical",
  mDWpa_4 = "categorical",
  mDWpa_5 = "categorical",
  mDWpa_5sp = "text",
  mDWrem = "text"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "165", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "165", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "165", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "165", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["Arm"]][fc_labels$value_labels$LASA_Wave == "MB"] <- list(NULL)
fc_labels$value_labels[["SWpa_5sp"]][fc_labels$value_labels$LASA_Wave == "MB"] <- list(NULL)
fc_labels$value_labels[["SWrm"]][fc_labels$value_labels$LASA_Wave == "MB"] <- list(NULL)
fc_labels$value_labels[["mApa_5sp"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["mArm"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["mDWpa_5sp"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["mDWrem"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)

.lasa_fc_165 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

