## LASA filecode 166 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mDSb01 = "Digit Span backwards: 2 numbers, attempt 1+2",
  mDSb02 = "Digit Span backwards: 3 numbers, attempt 1+2",
  mDSb03 = "Digit Span backwards: 4 numbers, attempt 1+2",
  mDSb04 = "Digit Span backwards: 5 numbers, attempt 1+2",
  mDSb05 = "Digit Span backwards: 6 numbers, attempt 1+2",
  mDSb06 = "Digit Span backwards: 7 numbers, attempt 1+2",
  mDSb07 = "Digit Span backwards: 8 numbers, attempt 1+2",
  mDSbsp = "WAIS Digit Span: span backwards",
  mDSbw = "WAIS Digit Span: number of correct backward items",
  mDSf01 = "Digit Span forwards: 2 numbers, attempt 1+2",
  mDSf02 = "Digit Span forwards: 3 numbers, attempt 1+2",
  mDSf03 = "Digit Span forwards: 4 numbers, attempt 1+2",
  mDSf04 = "Digit Span forwards: 5 numbers, attempt 1+2",
  mDSf05 = "Digit Span forwards: 6 numbers, attempt 1+2",
  mDSf06 = "Digit Span forwards: 7 numbers, attempt 1+2",
  mDSf07 = "Digit Span forwards: 8 numbers, attempt 1+2",
  mDSf08 = "Digit Span forwards: 9 numbers, attempt 1+2",
  mDSfsp = "WAIS Digit Span: span forwards",
  mDSfw = "WAIS Digit Span: number of correct forward items",
  mDStot = "WAIS Digit Span: total number of correct items",
  mdsbwp_1 = "Digit Span backwards particularity: company others",
  mdsbwp_2 = "Digit Span backwards particularity: hearing-impaired",
  mdsbwp_3 = "Digit Span backwards particularity: radio or television",
  mdsbwp_4 = "Digit Span backwards particularity: test interrupted",
  mdsbwp_5 = "Digit Span backwards particularity: other",
  mdsfwp_1 = "Digit Span forwards particularity: company others",
  mdsfwp_2 = "Digit Span forwards particularity: hearing-impaired",
  mdsfwp_3 = "Digit Span forwards particularity: radio or television",
  mdsfwp_4 = "Digit Span forwards particularity: test interrupted",
  mdsfwp_5 = "Digit Span forwards particularity: other"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `H` = c(
    "mDSb01",
    "mDSb02",
    "mDSb03",
    "mDSb04",
    "mDSb05",
    "mDSb06",
    "mDSb07",
    "mDSbsp",
    "mDSbw",
    "mDSf01",
    "mDSf02",
    "mDSf03",
    "mDSf04",
    "mDSf05",
    "mDSf06",
    "mDSf07",
    "mDSf08",
    "mDSfsp",
    "mDSfw",
    "mDStot"
  ),
  `I` = c(
    "mDSb01",
    "mDSb02",
    "mDSb03",
    "mDSb04",
    "mDSb05",
    "mDSb06",
    "mDSb07",
    "mDSbsp",
    "mDSbw",
    "mDSf01",
    "mDSf02",
    "mDSf03",
    "mDSf04",
    "mDSf05",
    "mDSf06",
    "mDSf07",
    "mDSf08",
    "mDSfsp",
    "mDSfw",
    "mDStot"
  ),
  `J` = c(
    "mDSb01",
    "mDSb02",
    "mDSb03",
    "mDSb04",
    "mDSb05",
    "mDSb06",
    "mDSb07",
    "mDSbsp",
    "mDSbw",
    "mDSf01",
    "mDSf02",
    "mDSf03",
    "mDSf04",
    "mDSf05",
    "mDSf06",
    "mDSf07",
    "mDSf08",
    "mDSfsp",
    "mDSfw",
    "mDStot"
  ),
  `K` = c(
    "mDSb01",
    "mDSb02",
    "mDSb03",
    "mDSb04",
    "mDSb05",
    "mDSb06",
    "mDSb07",
    "mDSbsp",
    "mDSbw",
    "mDSf01",
    "mDSf02",
    "mDSf03",
    "mDSf04",
    "mDSf05",
    "mDSf06",
    "mDSf07",
    "mDSf08",
    "mDSfsp",
    "mDSfw",
    "mDStot",
    "mdsbwp_1",
    "mdsbwp_2",
    "mdsbwp_3",
    "mdsbwp_4",
    "mdsbwp_5",
    "mdsfwp_1",
    "mdsfwp_2",
    "mdsfwp_3",
    "mdsfwp_4",
    "mdsfwp_5"
  )
)

variable_labels_list <- list(
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    mDSbsp = "WAIS Digit Span: Span backwards",
    mDSfsp = "WAIS Digit Span: Span forwards"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    mDSbsp = "WAIS Digit Span: Span backwards",
    mDSfsp = "WAIS Digit Span: Span forwards"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    mDSbsp = "WAIS Digit Span: Span backwards",
    mDSfsp = "WAIS Digit Span: Span forwards"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    mDSbw = "WAIS Digit Span: number of correct items backward",
    mDSfw = "WAIS Digit Span: number of correct items forward",
    mdsbwp_1 = "Digit Span backwards: particularities: company others",
    mdsbwp_2 = "Digit Span backwards: particularities: hearing-impaired",
    mdsbwp_3 = "Digit Span backwards: particularities: radio or television",
    mdsbwp_4 = "Digit Span backwards: particularities: test interrupted",
    mdsbwp_5 = "Digit Span backwards: particularities: other",
    mdsfwp_1 = "Digit Span forwards: particularities: company others",
    mdsfwp_2 = "Digit Span forwards: particularities: hearing-impaired",
    mdsfwp_3 = "Digit Span forwards: particularities: radio or television",
    mdsfwp_4 = "Digit Span forwards: particularities: test interrupted",
    mdsfwp_5 = "Digit Span forwards: particularities: other"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "1 correct",
  `2` = "2 correct"
)

standardized_value_labels <- list(
  mDSb01 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSb02 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSb03 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSb04 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSb05 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSb06 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSb07 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSbsp = c(`-9` = "test not done", `-3` = "test not done", `-1` = "no score, too many missings"),
  mDSbw = c(`-9` = "test not done", `-3` = "test not done", `-1` = "no score, too many missings"),
  mDSf01 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSf02 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSf03 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSf04 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSf05 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSf06 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSf07 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSf08 = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "no item response",
    `0` = "0 correct",
    default_answer_labels[c("1", "2")]
  ),
  mDSfsp = c(`-9` = "test not done", `-3` = "test not done", `-1` = "no score, too many missings"),
  mDSfw = c(`-9` = "test not done", `-3` = "test not done", `-1` = "no score, too many missings"),
  mDStot = c(
    `-9` = "test not done",
    `-3` = "test not done",
    `-2` = "DS backwards not done",
    `-1` = "no score, too many missings"
  ),
  mdsbwp_1 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned"),
  mdsbwp_2 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned"),
  mdsbwp_3 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned"),
  mdsbwp_4 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned"),
  mdsbwp_5 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned"),
  mdsfwp_1 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned"),
  mdsfwp_2 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned"),
  mdsfwp_3 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned"),
  mdsfwp_4 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned"),
  mdsfwp_5 = c(`-2` = "no", `0` = "not mentioned", `1` = "mentioned")
)

value_labels_list <- list(
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    mDSb01 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb02 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb03 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb04 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb05 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb06 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb07 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSbsp = c(`-3` = "test not done", `-1` = "no score, too many missings"),
    mDSbw = c(`-3` = "test not done", `-1` = "no score, too many missings"),
    mDSf01 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf02 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf03 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf04 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf05 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf06 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf07 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf08 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "asked, no answer",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSfsp = c(`-3` = "test not done", `-1` = "no score, too many missings"),
    mDSfw = c(`-3` = "test not done", `-1` = "no score, too many missings"),
    mDStot = c(`-3` = "test not done", `-2` = "DS backwards not done", `-1` = "no score, too many missings")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    mDSb01 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb02 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb03 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb04 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb05 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb06 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb07 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSbsp = c(`-3` = "test not done"),
    mDSbw = c(`-3` = "test not done"),
    mDSf01 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf02 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf03 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf04 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf05 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf06 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf07 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf08 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSfsp = c(`-3` = "test not done"),
    mDSfw = c(`-3` = "test not done"),
    mDStot = c(`-3` = "test not done")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    mDSb01 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb02 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb03 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb04 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb05 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb06 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb07 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSbsp = c(`-3` = "test not done"),
    mDSbw = c(`-3` = "test not done"),
    mDSf01 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf02 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf03 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf04 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf05 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf06 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf07 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf08 = c(
    `-3` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSfsp = c(`-3` = "test not done"),
    mDSfw = c(`-3` = "test not done"),
    mDStot = c(`-3` = "test not done")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    mDSb01 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb02 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb03 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb04 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb05 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb06 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSb07 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSbsp = c(`-9` = "test not done"),
    mDSbw = c(`-9` = "test not done"),
    mDSf01 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf02 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf03 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf04 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf05 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf06 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf07 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSf08 = c(
    `-9` = "test not done",
    `-2` = "not asked, previous answers incorrect",
    `-1` = "not asked",
    `0` = "0 correct",
    `1` = "1 correct",
    `2` = "2 correct"
  ),
    mDSfsp = c(`-9` = "test not done"),
    mDSfw = c(`-9` = "test not done"),
    mDStot = c(`-9` = "test not done"),
    mdsbwp_1 = .replace_labels(
    standardized_value_labels$mdsbwp_1,
    `-2` = "no particularities"
  ),
    mdsbwp_2 = .replace_labels(
    standardized_value_labels$mdsbwp_2,
    `-2` = "no particularities"
  ),
    mdsbwp_3 = .replace_labels(
    standardized_value_labels$mdsbwp_3,
    `-2` = "no particularities"
  ),
    mdsbwp_4 = .replace_labels(
    standardized_value_labels$mdsbwp_4,
    `-2` = "no particularities"
  ),
    mdsbwp_5 = .replace_labels(
    standardized_value_labels$mdsbwp_5,
    `-2` = "no particularities"
  ),
    mdsfwp_1 = .replace_labels(
    standardized_value_labels$mdsfwp_1,
    `-2` = "no particularities"
  ),
    mdsfwp_2 = .replace_labels(
    standardized_value_labels$mdsfwp_2,
    `-2` = "no particularities"
  ),
    mdsfwp_3 = .replace_labels(
    standardized_value_labels$mdsfwp_3,
    `-2` = "no particularities"
  ),
    mdsfwp_4 = .replace_labels(
    standardized_value_labels$mdsfwp_4,
    `-2` = "no particularities"
  ),
    mdsfwp_5 = .replace_labels(
    standardized_value_labels$mdsfwp_5,
    `-2` = "no particularities"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mDSb01 = "numeric",
  mDSb02 = "numeric",
  mDSb03 = "numeric",
  mDSb04 = "numeric",
  mDSb05 = "numeric",
  mDSb06 = "numeric",
  mDSb07 = "numeric",
  mDSbsp = "numeric",
  mDSbw = "numeric",
  mDSf01 = "numeric",
  mDSf02 = "numeric",
  mDSf03 = "numeric",
  mDSf04 = "numeric",
  mDSf05 = "numeric",
  mDSf06 = "numeric",
  mDSf07 = "numeric",
  mDSf08 = "numeric",
  mDSfsp = "numeric",
  mDSfw = "numeric",
  mDStot = "numeric",
  mdsbwp_1 = "categorical",
  mdsbwp_2 = "categorical",
  mdsbwp_3 = "categorical",
  mdsbwp_4 = "categorical",
  mdsbwp_5 = "categorical",
  mdsfwp_1 = "categorical",
  mdsfwp_2 = "categorical",
  mdsfwp_3 = "categorical",
  mdsfwp_4 = "categorical",
  mdsfwp_5 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "166", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "166", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "166", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "166", waves = .lasa_wave_rows())
)

.lasa_fc_166 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

