## LASA filecode 117 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qsleep1 = "Sleep 1: hours sleep in 24 hours",
  qsleep2 = "Sleep 2: falling a sleep",
  qsleep3 = "Sleep 3: continue sleeping",
  qsleep4 = "Sleep 4: awake too early",
  qsleep5 = "Sleep 5: sleep quality past month",
  qsleeph = "going to sleep: hour of the day",
  qsleepm = "going to sleep: minute"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4"
  ),
  `C` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4"
  ),
  `D` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4"
  ),
  `E` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4"
  ),
  `2B` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4"
  ),
  `F` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4"
  ),
  `G` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4",
    "qsleep5",
    "qsleeph",
    "qsleepm"
  ),
  `H` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4",
    "qsleep5",
    "qsleeph",
    "qsleepm"
  ),
  `3B` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4",
    "qsleep5",
    "qsleeph",
    "qsleepm"
  ),
  `I` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4",
    "qsleep5",
    "qsleeph",
    "qsleepm"
  ),
  `J` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4",
    "qsleep5",
    "qsleeph",
    "qsleepm"
  ),
  `K` = c(
    "qsleep1",
    "qsleep2",
    "qsleep3",
    "qsleep4",
    "qsleep5",
    "qsleeph",
    "qsleepm"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    qsleep4 = "Sleep 4: awake to early"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    qsleep4 = "Sleep 4: awake to early"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    qsleep4 = "Sleep 4: awake to early"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    qsleep4 = "Sleep 4: awake to early"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    qsleep4 = "Sleep 4: awake to early"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    qsleep4 = "Sleep 4: awake to early"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    qsleep5 = "sleep 5: sleep quality past month"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    qsleep5 = "sleep 5: sleep quality past month"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    qsleep5 = "sleep 5: sleep quality past month"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    qsleep5 = "sleep 5: sleep quality past month"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    qsleep5 = "sleep 5: sleep quality past month"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    qsleep5 = "sleep 5: sleep quality past month"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qsleep1 = c(`-1` = "not available"),
  qsleep2 = c(
    `-1` = "not available",
    `1` = "almost never",
    `2` = "some of the time",
    `3` = "often",
    `4` = "most of the time"
  ),
  qsleep3 = c(
    `-1` = "not available",
    `1` = "almost never",
    `2` = "some of the time",
    `3` = "often",
    `4` = "most of the time"
  ),
  qsleep4 = c(
    `-1` = "not available",
    `1` = "almost never",
    `2` = "some of the time",
    `3` = "often",
    `4` = "most of the time"
  ),
  qsleep5 = c(
    `-1` = "not available",
    `1` = "very good",
    `2` = "somewhat good",
    `3` = "somewhat bad",
    `4` = "very bad"
  ),
  qsleeph = c(`-1` = "not available"),
  qsleepm = c(`-1` = "not available")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  ),
    qsleep5 = .replace_labels(
    standardized_value_labels$qsleep5,
    `-1` = "no answer"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  ),
    qsleep5 = .replace_labels(
    standardized_value_labels$qsleep5,
    `-1` = "no answer"
  ),
    qsleeph = .replace_labels(
    standardized_value_labels$qsleeph,
    `-1` = "no answer"
  ),
    qsleepm = .replace_labels(
    standardized_value_labels$qsleepm,
    `-1` = "no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  ),
    qsleep5 = .replace_labels(
    standardized_value_labels$qsleep5,
    `-1` = "no answer"
  ),
    qsleeph = .replace_labels(
    standardized_value_labels$qsleeph,
    `-1` = "no answer"
  ),
    qsleepm = .replace_labels(
    standardized_value_labels$qsleepm,
    `-1` = "no answer"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  ),
    qsleep5 = .replace_labels(
    standardized_value_labels$qsleep5,
    `-1` = "no answer"
  ),
    qsleeph = .replace_labels(
    standardized_value_labels$qsleeph,
    `-1` = "no answer"
  ),
    qsleepm = .replace_labels(
    standardized_value_labels$qsleepm,
    `-1` = "no answer"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  ),
    qsleep5 = .replace_labels(
    standardized_value_labels$qsleep5,
    `-1` = "no answer"
  ),
    qsleeph = .replace_labels(
    standardized_value_labels$qsleeph,
    `-1` = "no answer"
  ),
    qsleepm = .replace_labels(
    standardized_value_labels$qsleepm,
    `-1` = "no answer"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    qsleep1 = .replace_labels(
    standardized_value_labels$qsleep1,
    `-1` = "no answer"
  ),
    qsleep2 = .replace_labels(
    standardized_value_labels$qsleep2,
    `-1` = "no answer"
  ),
    qsleep3 = .replace_labels(
    standardized_value_labels$qsleep3,
    `-1` = "no answer"
  ),
    qsleep4 = .replace_labels(
    standardized_value_labels$qsleep4,
    `-1` = "no answer"
  ),
    qsleep5 = .replace_labels(
    standardized_value_labels$qsleep5,
    `-1` = "no answer"
  ),
    qsleeph = .replace_labels(
    standardized_value_labels$qsleeph,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qsleep1 = "numeric",
  qsleep2 = "categorical",
  qsleep3 = "categorical",
  qsleep4 = "categorical",
  qsleep5 = "categorical",
  qsleeph = "numeric",
  qsleepm = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "117", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "117", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "117", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "117", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["qsleeph"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["qsleepm"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["qsleepm"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)

.lasa_fc_117 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

