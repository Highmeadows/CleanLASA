## LASA filecode 191 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  macl = "number of lines read correctly (left eye)",
  maclst = "number of lines read correctly (left eye pinhole)",
  macr = "number of lines read correctly (right eye)",
  macrst = "number of lines read correctly (right eye pinhole)",
  mrm191 = "reason missing (partial) data",
  mrm191_1 = "reason missing: blind rightside",
  mrm191_10 = "reason missing: equipment failure",
  mrm191_2 = "reason missing: blind leftside",
  mrm191_3 = "reason missing: mentally unable",
  mrm191_4 = "reason missing: physically unable",
  mrm191_5 = "reason missing: aphasia",
  mrm191_6 = "reason missing: illiterate",
  mrm191_7 = "reason missing: refused",
  mrm191_8 = "reason missing: short interview",
  mrm191_9 = "reason missing: insufficient light",
  mrm191_rem = "remarks reason missing (partial) data",
  mrm191s1 = "specification reason missing: blind rightside",
  mrm191s2 = "specification reason missing: blind leftside",
  mvasl = "Visual Acuity Score, number of letters read correctly (left eye)",
  mvaslst = "Visual Acuity Score, number of letters read correctly (left eye pinhole)",
  mvasr = "Visual Acuity Score, number of letters read correctly (right eye)",
  mvasrst = "Visual Acuity Score, number of letters read correctly (right eye pinhole)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `E` = c(
    "macl",
    "maclst",
    "macr",
    "macrst",
    "mrm191",
    "mrm191_rem",
    "mvasl",
    "mvaslst",
    "mvasr",
    "mvasrst"
  ),
  `F` = c(
    "mrm191",
    "mrm191_1",
    "mrm191_10",
    "mrm191_2",
    "mrm191_3",
    "mrm191_4",
    "mrm191_5",
    "mrm191_6",
    "mrm191_7",
    "mrm191_8",
    "mrm191_9",
    "mrm191s1",
    "mrm191s2",
    "mvasl",
    "mvaslst",
    "mvasr",
    "mvasrst"
  ),
  `G` = c(
    "mrm191",
    "mrm191_1",
    "mrm191_10",
    "mrm191_2",
    "mrm191_3",
    "mrm191_4",
    "mrm191_5",
    "mrm191_6",
    "mrm191_7",
    "mrm191_8",
    "mrm191_9",
    "mrm191s1",
    "mrm191s2",
    "mvasl",
    "mvaslst",
    "mvasr",
    "mvasrst"
  ),
  `H` = c(
    "macl",
    "maclst",
    "macr",
    "macrst",
    "mrm191_1",
    "mrm191_10",
    "mrm191_2",
    "mrm191_3",
    "mrm191_4",
    "mrm191_5",
    "mrm191_6",
    "mrm191_7",
    "mrm191_8",
    "mrm191_9",
    "mrm191s1",
    "mrm191s2",
    "mvasl",
    "mvaslst",
    "mvasr",
    "mvasrst"
  ),
  `3B` = c(
    "macl",
    "maclst",
    "macr",
    "macrst",
    "mrm191_1",
    "mrm191_10",
    "mrm191_2",
    "mrm191_3",
    "mrm191_4",
    "mrm191_5",
    "mrm191_6",
    "mrm191_7",
    "mrm191_8",
    "mrm191_9",
    "mrm191s1",
    "mrm191s2",
    "mvasl",
    "mvaslst",
    "mvasr",
    "mvasrst"
  )
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "mentioned"
)

standardized_value_labels <- list(
  macl = c(`-3` = "no valid data", `1` = NA_character_, `18` = NA_character_),
  maclst = c(`-3` = "no valid data", `1` = NA_character_, `18` = NA_character_),
  macr = c(`-3` = "no valid data", `1` = NA_character_, `18` = NA_character_),
  macrst = c(`-3` = "no valid data", `1` = NA_character_, `18` = NA_character_),
  mrm191 = c(
    `-3` = "no valid data",
    `-2` = "(partial) valid data",
    `1` = "short interview",
    `2` = "insufficient light",
    `3` = "visually impaired/(partially) blind",
    `4` = "physically unable",
    `5` = "aphasia/illiterate",
    `6` = "equipment failure",
    `7` = "refused"
  ),
  mrm191_1 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_10 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_2 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_3 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_4 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_5 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_6 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_7 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_8 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_9 = c(
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mrm191_rem = stats::setNames(character(0), character(0)),
  mrm191s1 = c(
    `-2` = "no valid data",
    `1` = "still perception of light",
    `2` = "no perception of light",
    `3` = "prosthesis"
  ),
  mrm191s2 = c(
    `-2` = "no valid data",
    `1` = "still perception of light",
    `2` = "no perception of light",
    `3` = "prosthesis"
  ),
  mvasl = c(`-3` = "no valid data", `10` = NA_character_, `100` = NA_character_),
  mvaslst = c(`-3` = "no valid data", `10` = NA_character_, `100` = NA_character_),
  mvasr = c(`-3` = "no valid data", `10` = NA_character_, `100` = NA_character_),
  mvasrst = c(`-3` = "no valid data", `10` = NA_character_, `100` = NA_character_)
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    macl = .replace_labels(
    standardized_value_labels$macl,
    `-3` = "no data"
  ),
    maclst = .replace_labels(
    standardized_value_labels$maclst,
    `-3` = "no data"
  ),
    macr = .replace_labels(
    standardized_value_labels$macr,
    `-3` = "no data"
  ),
    macrst = .replace_labels(
    standardized_value_labels$macrst,
    `-3` = "no data"
  ),
    mrm191 = .replace_labels(
    standardized_value_labels$mrm191,
    `-3` = "no data"
  ),
    mvasl = .replace_labels(
    standardized_value_labels$mvasl,
    `-3` = "no data"
  ),
    mvaslst = .replace_labels(
    standardized_value_labels$mvaslst,
    `-3` = "no data"
  ),
    mvasr = .replace_labels(
    standardized_value_labels$mvasr,
    `-3` = "no data"
  ),
    mvasrst = .replace_labels(
    standardized_value_labels$mvasrst,
    `-3` = "no data"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    mrm191 = .replace_labels(
    standardized_value_labels$mrm191,
    `-3` = "no data"
  ),
    mrm191s1 = .replace_labels(
    standardized_value_labels$mrm191s1,
    `-2` = "na, see FMRM191_1"
  ),
    mrm191s2 = .replace_labels(
    standardized_value_labels$mrm191s2,
    `-2` = "na, see FMRM191_2"
  ),
    mvasl = .replace_labels(
    standardized_value_labels$mvasl,
    `-3` = "no data"
  ),
    mvaslst = .replace_labels(
    standardized_value_labels$mvaslst,
    `-3` = "no data"
  ),
    mvasr = .replace_labels(
    standardized_value_labels$mvasr,
    `-3` = "no data"
  ),
    mvasrst = .replace_labels(
    standardized_value_labels$mvasrst,
    `-3` = "no data"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    mrm191 = .replace_labels(
    standardized_value_labels$mrm191,
    `-3` = "no data"
  ),
    mrm191s1 = .replace_labels(
    standardized_value_labels$mrm191s1,
    `-2` = "na, see GMRM191_1"
  ),
    mrm191s2 = .replace_labels(
    standardized_value_labels$mrm191s2,
    `-2` = "na, see GMRM191_2"
  ),
    mvasl = .replace_labels(
    standardized_value_labels$mvasl,
    `-3` = "no data"
  ),
    mvaslst = .replace_labels(
    standardized_value_labels$mvaslst,
    `-3` = "no data"
  ),
    mvasr = .replace_labels(
    standardized_value_labels$mvasr,
    `-3` = "no data"
  ),
    mvasrst = .replace_labels(
    standardized_value_labels$mvasrst,
    `-3` = "no data"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    macl = .replace_labels(
    standardized_value_labels$macl,
    `-3` = "no data"
  ),
    maclst = .replace_labels(
    standardized_value_labels$maclst,
    `-3` = "no data"
  ),
    macr = .replace_labels(
    standardized_value_labels$macr,
    `-3` = "no data"
  ),
    macrst = .replace_labels(
    standardized_value_labels$macrst,
    `-3` = "no data"
  ),
    mrm191s1 = .replace_labels(
    standardized_value_labels$mrm191s1,
    `-2` = "na, see HMRM191_1"
  ),
    mrm191s2 = .replace_labels(
    standardized_value_labels$mrm191s2,
    `-2` = "na, see HMRM191_2"
  ),
    mvasl = .replace_labels(
    standardized_value_labels$mvasl,
    `-3` = "no data"
  ),
    mvaslst = .replace_labels(
    standardized_value_labels$mvaslst,
    `-3` = "no data"
  ),
    mvasr = .replace_labels(
    standardized_value_labels$mvasr,
    `-3` = "no data"
  ),
    mvasrst = .replace_labels(
    standardized_value_labels$mvasrst,
    `-3` = "no data"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    macl = .replace_labels(
    standardized_value_labels$macl,
    `-3` = "no data"
  ),
    maclst = .replace_labels(
    standardized_value_labels$maclst,
    `-3` = "no data"
  ),
    macr = .replace_labels(
    standardized_value_labels$macr,
    `-3` = "no data"
  ),
    macrst = .replace_labels(
    standardized_value_labels$macrst,
    `-3` = "no data"
  ),
    mrm191s1 = .replace_labels(
    standardized_value_labels$mrm191s1,
    `-2` = "na, see BMRM191_1"
  ),
    mrm191s2 = .replace_labels(
    standardized_value_labels$mrm191s2,
    `-2` = "na, see BMRM191_2"
  ),
    mvasl = .replace_labels(
    standardized_value_labels$mvasl,
    `-3` = "no data"
  ),
    mvaslst = .replace_labels(
    standardized_value_labels$mvaslst,
    `-3` = "no data"
  ),
    mvasr = .replace_labels(
    standardized_value_labels$mvasr,
    `-3` = "no data"
  ),
    mvasrst = .replace_labels(
    standardized_value_labels$mvasrst,
    `-3` = "no data"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  macl = "numeric",
  maclst = "numeric",
  macr = "numeric",
  macrst = "numeric",
  mrm191 = "categorical",
  mrm191_1 = "categorical",
  mrm191_10 = "categorical",
  mrm191_2 = "categorical",
  mrm191_3 = "categorical",
  mrm191_4 = "categorical",
  mrm191_5 = "categorical",
  mrm191_6 = "categorical",
  mrm191_7 = "categorical",
  mrm191_8 = "categorical",
  mrm191_9 = "categorical",
  mrm191_rem = "text",
  mrm191s1 = "categorical",
  mrm191s2 = "categorical",
  mvasl = "numeric",
  mvaslst = "numeric",
  mvasr = "numeric",
  mvasrst = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "191", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "191", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "191", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "191", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["mrm191_rem"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)

.lasa_fc_191 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

