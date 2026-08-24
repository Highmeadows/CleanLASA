## LASA filecode 356 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mdelta = "Learning effect: highest-lowest trial score",
  mrecal = "15-word test time interval in minutes",
  mret1pc = "Retention 1",
  mret2pc = "Retention 2",
  mtmax = "Maximum score across trials 1-3",
  mtotal = "Learning/memory total across trials 1-3",
  mwtdr = "Number of words correct: delayed recall",
  mwtt1 = "Number of words correct: trial 1",
  mwtt2 = "Number of words correct: trial 2",
  mwtt3 = "Number of words correct: trial 3"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mrecal", "mret1pc", "mtmax", "mtotal", "mwtdr", "mwtt1", "mwtt2", "mwtt3")],
    mdelta = "learning effect highest-lowest",
    mrecal = "15 word test time interval in minutes",
    mret1pc = "retention 1: bmwtdr/bmwtt3",
    mtmax = "maximum score: Highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3",
    mwtdr = "number of words delayed recall",
    mwtt1 = "number of words correct: trial 1",
    mwtt2 = "number of words correct: trial 2",
    mwtt3 = "number of words correct: trial 3"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mtmax", "mtotal", "mwtdr", "mwtt1", "mwtt2", "mwtt3")],
    mdelta = "learning effect highest-lowest",
    mret1pc = "retention 1: cmwtdr/cmwtt3",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3",
    mwtdr = "number of words delayed recall",
    mwtt1 = "number of words correct: trial 1",
    mwtt2 = "number of words correct: trial 2",
    mwtt3 = "number of words correct: trial 3"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: dmwtdr - dmwtt3",
    mret2pc = "retention 2: dmwtdr - dmtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: emwtdr - emwtt3",
    mret2pc = "retention 2: emwtdr - emtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: bmwtdr - bmwtt3",
    mret2pc = "retention 2: bmwtdr - bmtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: fmwtdr - fmwtt3",
    mret2pc = "retention 2: fmwtdr - fmtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: gmwtdr - gmwtt3",
    mret2pc = "retention 2: gmwtdr - gmtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: hmwtdr - hmwtt3",
    mret2pc = "retention 2: hmwtdr - hmtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: bmwtdr - bmwtt3",
    mret2pc = "retention 2: bmwtdr - bmtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: imwtdr - imwtt3",
    mret2pc = "retention 2: imwtdr - imtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: jmwtdr - jmwtt3",
    mret2pc = "retention 2: jmwtdr - jmtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c("mdelta", "mret1pc", "mret2pc", "mtmax", "mtotal")],
    mdelta = "learning highest-lowest",
    mret1pc = "retention 1: kmwtdr - kmwtt3",
    mret2pc = "retention 2: kmwtdr - kmtmax",
    mtmax = "maximum score: highest on 1, 2, 3",
    mtotal = "learning/memory: total of 1, 2 and 3"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mdelta = stats::setNames(character(0), character(0)),
  mrecal = c(`-2` = "no valid time data", `-1` = "test not done"),
  mret1pc = c(`-2` = "recall test not done", `-1` = "no valid data"),
  mret2pc = stats::setNames(character(0), character(0)),
  mtmax = c(`-1` = "no valid data", `1` = "no valid data"),
  mtotal = c(`-4` = "interview terminated", `-2` = "test not done"),
  mwtdr = stats::setNames(character(0), character(0)),
  mwtt1 = c(`-4` = "interview terminated", `-2` = "zero on trial"),
  mwtt2 = c(`-1` = "test not done"),
  mwtt3 = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("mrecal", "mwtt1", "mwtt2")],
    mwtt1 = c(`-2` = "zero on trial")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("mtmax", "mtotal", "mwtt1", "mwtt2")],
    mtmax = c(`1` = "no valid data"),
    mtotal = c(`-4` = "interview terminated"),
    mwtt1 = c(`-4` = "interview terminated")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("mret1pc", "mtmax", "mtotal")],
    mtmax = c(`-1` = "no valid data"),
    mtotal = c(`-2` = "test not done")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mdelta = "numeric",
  mrecal = "numeric",
  mret1pc = "numeric",
  mret2pc = "numeric",
  mtmax = "numeric",
  mtotal = "numeric",
  mwtdr = "numeric",
  mwtt1 = "numeric",
  mwtt2 = "numeric",
  mwtt3 = "numeric"
)

.lasa_fc_356 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "356", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "356", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "356", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "356", waves = .lasa_wave_rows())
)
