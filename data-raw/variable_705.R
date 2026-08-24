## LASA filecode 705 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  trbot = "Fractures: since last interview",
  trbot1 = "Fracture (1): since last interview",
  trbot1a = "Fracture (1): type",
  trbot1b = "Fracture (1): cause",
  trbot2 = "Fracture (2): since last interview",
  trbot2a = "Fracture (2): type",
  trbot2b = "Fracture (2): cause",
  trbot3 = "Fracture (3): since last interview",
  trbot3a = "Fracture (3): type",
  trbot3b = "Fracture (3): cause",
  trbotph = "Fracture: contacted doctor",
  trfall = "Did you fall in past year?",
  trfalln = "Fall: how often past year",
  trfracn = "Number of fractures since last interview (max. 3)"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "trbot",
    "trbot1a",
    "trbot1b",
    "trbot2a",
    "trbot2b",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfall",
    "trfalln"
  )],
    trfall = "Did you fall last year?"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfall",
    "trfalln",
    "trfracn"
  )],
    trfall = "Did you fall past year?"
  ),
  Wave_E_labels = harmonized_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
  Wave_F_labels = harmonized_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
  Wave_G_labels = harmonized_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
  Wave_H_labels = harmonized_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
  Wave_I_labels = harmonized_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
  Wave_J_labels = harmonized_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
  Wave_K_labels = harmonized_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trbot = c(`-1` = "asked no answer", `1` = "no", `2` = "yes"),
  trbot1 = c(`-1` = "asked, no answer", `1` = "no", `2` = "yes"),
  trbot1a = c(
    `-2` = "nothing broken",
    `-1` = "asked, no answer",
    `1` = "pulse/wrist, colles",
    `2` = "forearm / humerus",
    `3` = "hand, fingers",
    `4` = "other upper extremities",
    `5` = "rib",
    `6` = "cymbal / pelvis",
    `7` = "ankle",
    `8` = "feet, toes",
    `9` = "hip",
    `10` = "other lower extremities",
    `11` = "head, neck",
    `12` = "vertebra(e)",
    `13` = "unknown"
  ),
  trbot1b = c(
    `-2` = "nothing broken",
    `-1` = "asked, no answer",
    `0` = "reason unknown",
    `1` = "fall from > standing height",
    `2` = "fall from standing height or <",
    `3` = "traffic accident",
    `4` = "other"
  ),
  trbot2 = c(`-1` = "no first fracture / asked, no answer", `1` = "no", `2` = "yes"),
  trbot2a = c(
    `-2` = "no first fracture",
    `-1` = "no second fracture",
    `1` = "pulse/wrist, colles",
    `2` = "forearm / humerus",
    `3` = "hand, fingers",
    `4` = "other upper extremities",
    `5` = "rib",
    `6` = "cymbal / pelvis",
    `7` = "ankle",
    `8` = "feet, toes",
    `9` = "hip",
    `10` = "other lower extremities",
    `11` = "head, neck",
    `12` = "vertebra(e)",
    `13` = "unknown"
  ),
  trbot2b = c(
    `-2` = "no first fracture",
    `-1` = "no second fracture",
    `0` = "reason unknown",
    `1` = "fall from > standing height",
    `2` = "fall from standing height or <",
    `3` = "traffic accident",
    `4` = "other"
  ),
  trbot3 = c(`-2` = "no first or second fracture", `-1` = "asked, no answer", `1` = "no", `2` = "yes"),
  trbot3a = c(
    `-2` = "no first/second fracture",
    `-1` = "no third fracture",
    `1` = "pulse/wrist, colles",
    `2` = "forearm / humerus",
    `3` = "hand, fingers",
    `4` = "other upper extremities",
    `5` = "rib",
    `6` = "cymbal / pelvis",
    `7` = "ankle",
    `8` = "feet, toes",
    `9` = "hip",
    `10` = "other lower extremities",
    `11` = "head, neck",
    `12` = "vertebra(e)",
    `13` = "unknown"
  ),
  trbot3b = c(
    `-2` = "no first or second fracture",
    `-1` = "no third fracture",
    `0` = "reason unknown",
    `1` = "fall from > standing height",
    `2` = "fall from standing height or <",
    `3` = "traffic accident",
    `4` = "other"
  ),
  trbotph = c(
    `-2` = "no fracture(s)",
    `-1` = "asked, no answer",
    `0` = "no",
    `1` = "yes, family physician / no",
    `2` = "yes, specialist"
  ),
  trfall = c(`-1` = "asked, no answer", `1` = "no", `2` = "yes"),
  trfalln = c(
    `-2` = "not fallen",
    `-1` = "asked, no answer",
    `0` = "fallen, number unknown",
    `9` = "more than 8 falls"
  ),
  trfracn = c(`0` = "no known fractures")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "trbot",
    "trbot1a",
    "trbot1b",
    "trbot2a",
    "trbot2b",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfall",
    "trfalln"
  )],
    trbotph = .replace_labels(
    standardized_value_labels$trbotph,
    `-2` = "no fracture",
    `1` = "yes, family physician"
  ),
    trfalln = .replace_labels(
    standardized_value_labels$trfalln,
    `-1` = "asked no answer"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfall",
    "trfalln",
    "trfracn"
  )],
    trbot2 = .replace_labels(
    standardized_value_labels$trbot2,
    `-1` = "no first fracture"
  ),
    trbotph = .replace_labels(
    standardized_value_labels$trbotph,
    `1` = "yes, family physician"
  ),
    trfalln = .replace_labels(
    standardized_value_labels$trfalln,
    `-1` = "asked no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
    trbot2 = .replace_labels(
    standardized_value_labels$trbot2,
    `-1` = "no first fracture"
  ),
    trbotph = .replace_labels(
    standardized_value_labels$trbotph,
    `1` = "yes, family physician"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
    trbot2 = .replace_labels(
    standardized_value_labels$trbot2,
    `-1` = "no first fracture"
  ),
    trbotph = .replace_labels(
    standardized_value_labels$trbotph,
    `1` = "yes, family physician"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
    trbot2 = .replace_labels(
    standardized_value_labels$trbot2,
    `-1` = "no first fracture"
  ),
    trbotph = .replace_labels(
    standardized_value_labels$trbotph,
    `1` = "yes, family physician"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
    trbot2 = .replace_labels(
    standardized_value_labels$trbot2,
    `-1` = "no first fracture"
  ),
    trbotph = c(`-2` = "no fracture(s)", `-1` = "asked, no answer", `1` = "no", `2` = "yes, specialist")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
    trbot2 = .replace_labels(
    standardized_value_labels$trbot2,
    `-1` = "no first fracture"
  ),
    trbotph = c(`-2` = "no fracture(s)", `-1` = "asked, no answer", `1` = "no", `2` = "yes, specialist")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
    trbot2 = .replace_labels(
    standardized_value_labels$trbot2,
    `-1` = "no first fracture"
  ),
    trbotph = c(`-2` = "no fracture(s)", `-1` = "asked, no answer", `1` = "no", `2` = "yes, specialist")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "trbot1",
    "trbot1a",
    "trbot1b",
    "trbot2",
    "trbot2a",
    "trbot2b",
    "trbot3",
    "trbot3a",
    "trbot3b",
    "trbotph",
    "trfracn"
  )],
    trbot2 = .replace_labels(
    standardized_value_labels$trbot2,
    `-1` = "no first fracture"
  ),
    trbotph = c(`-2` = "no fracture(s)", `-1` = "asked, no answer", `1` = "no", `2` = "yes, specialist")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  trbot = "categorical",
  trbot1 = "categorical",
  trbot1a = "categorical",
  trbot1b = "categorical",
  trbot2 = "categorical",
  trbot2a = "categorical",
  trbot2b = "categorical",
  trbot3 = "categorical",
  trbot3a = "categorical",
  trbot3b = "categorical",
  trbotph = "categorical",
  trfall = "categorical",
  trfalln = "numeric",
  trfracn = "numeric"
)

.lasa_fc_705 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "705", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "705", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "705", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "705", waves = .lasa_wave_rows())
)
