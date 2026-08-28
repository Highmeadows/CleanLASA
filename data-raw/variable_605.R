## LASA filecode 605 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  tpbot = "Fracture since last interview",
  tpbot1 = "Fracture (1): since last interview",
  tpbot1a = "Fracture (1): type",
  tpbot1b = "Fracture (1): cause",
  tpbot2 = "Fracture (2): since last interview",
  tpbot2a = "Fracture (2): type",
  tpbot2b = "Fracture (2): cause",
  tpbot3 = "Fracture (3): since last interview",
  tpbot3a = "Fracture (3): type",
  tpbot3b = "Fracture (3): cause",
  tpbotph = "Fracture: contacted doctor",
  tpfall = "Did R fall in past year?",
  tpfalln = "Number of falls in past year",
  tpfracn = "Number of fractures since last interview (max. 3)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `C` = c(
    "tpbot",
    "tpbot1a",
    "tpbot1b",
    "tpbot2a",
    "tpbot2b",
    "tpbot3a",
    "tpbot3b",
    "tpbotph",
    "tpfall",
    "tpfalln"
  ),
  `D` = c(
    "tpbot1",
    "tpbot1a",
    "tpbot1b",
    "tpbot2",
    "tpbot2a",
    "tpbot2b",
    "tpbot3",
    "tpbot3a",
    "tpbot3b",
    "tpbotph",
    "tpfall",
    "tpfalln",
    "tpfracn"
  ),
  `E` = c(
    "tpbot1",
    "tpbot1a",
    "tpbot1b",
    "tpbot2",
    "tpbot2a",
    "tpbot2b",
    "tpbot3",
    "tpbot3a",
    "tpbot3b",
    "tpbotph",
    "tpfracn"
  ),
  `F` = c(
    "tpbot1",
    "tpbot1a",
    "tpbot1b",
    "tpbot2",
    "tpbot2a",
    "tpbot2b",
    "tpbot3",
    "tpbot3a",
    "tpbot3b",
    "tpbotph",
    "tpfracn"
  ),
  `G` = c(
    "tpbot1",
    "tpbot1a",
    "tpbot1b",
    "tpbot2",
    "tpbot2a",
    "tpbot2b",
    "tpbot3",
    "tpbot3a",
    "tpbot3b",
    "tpbotph",
    "tpfracn"
  ),
  `H` = c(
    "tpbot1",
    "tpbot1a",
    "tpbot1b",
    "tpbot2",
    "tpbot2a",
    "tpbot2b",
    "tpbot3",
    "tpbot3a",
    "tpbot3b",
    "tpbotph",
    "tpfracn"
  ),
  `I` = c(
    "tpbot1",
    "tpbot1a",
    "tpbot1b",
    "tpbot2",
    "tpbot2a",
    "tpbot2b",
    "tpbot3",
    "tpbot3a",
    "tpbot3b",
    "tpbotph",
    "tpfracn"
  ),
  `J` = c(
    "tpbot1",
    "tpbot1a",
    "tpbot1b",
    "tpbot2",
    "tpbot2a",
    "tpbot2b",
    "tpbot3",
    "tpbot3a",
    "tpbot3b",
    "tpbotph",
    "tpfracn"
  ),
  `K` = c(
    "tpbot1",
    "tpbot1a",
    "tpbot1b",
    "tpbot2",
    "tpbot2a",
    "tpbot2b",
    "tpbot3",
    "tpbot3a",
    "tpbot3b",
    "tpbotph",
    "tpfracn"
  )
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    tpbot = "Fractures: since last interview",
    tpfall = "Did R fall last year?",
    tpfalln = "Fall: how often past year"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    tpfall = "Did R fall past year?",
    tpfalln = "Fall: how often past year"
  ),
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  tpbot = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  tpbot1 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  tpbot1a = c(
    `-2` = "nothing broken",
    default_missing_labels[c("-1")],
    `1` = "pulse / wrist, colles",
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
  tpbot1b = c(
    `-2` = "nothing broken",
    default_missing_labels[c("-1")],
    `0` = "reason unknown",
    `1` = "fall from > standing height",
    `2` = "fall from standing height or <",
    `3` = "traffic accident",
    `4` = "other"
  ),
  tpbot2 = c(
    `-2` = "no first fracture",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  tpbot2a = c(
    `-2` = "no first fracture",
    `-1` = "no second fracture",
    `1` = "pulse / wrist, colles",
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
  tpbot2b = c(
    `-2` = "no first fracture",
    `-1` = "no second fracture",
    `0` = "reason unknown",
    `1` = "fall from > standing height",
    `2` = "fall from standing height or <",
    `3` = "traffic accident",
    `4` = "other"
  ),
  tpbot3 = c(
    `-2` = "no first or second fracture",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  tpbot3a = c(
    `-2` = "no first/second fracture",
    `-1` = "no third fracture",
    `1` = "pulse / wrist, colles",
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
  tpbot3b = c(
    `-2` = "no first or second fracture",
    `-1` = "no third fracture",
    `0` = "reason unknown",
    `1` = "fall from > standing height",
    `2` = "fall from standing height or <",
    `3` = "traffic accident",
    `4` = "other"
  ),
  tpbotph = c(
    `-2` = "no fracture",
    default_missing_labels[c("-1")],
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
  tpfall = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  tpfalln = c(
    `-2` = "not fallen",
    default_missing_labels[c("-1")],
    `0` = "fallen, number unknown",
    `9` = "more than 8 falls"
  ),
  tpfracn = c(`0` = "no known fractures")
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    tpbotph = .replace_labels(
    standardized_value_labels$tpbotph,
    `-2` = "no fracture(s)"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    tpbotph = .replace_labels(
    standardized_value_labels$tpbotph,
    `-2` = "no fracture(s)"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    tpbotph = .replace_labels(
    standardized_value_labels$tpbotph,
    `-2` = "no fracture(s)"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    tpbotph = .replace_labels(
    standardized_value_labels$tpbotph,
    `-2` = "no fracture(s)"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    tpbotph = .replace_labels(
    standardized_value_labels$tpbotph,
    `-2` = "no fracture(s)"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    tpbotph = .replace_labels(
    standardized_value_labels$tpbotph,
    `-2` = "no fracture(s)"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    tpbotph = .replace_labels(
    standardized_value_labels$tpbotph,
    `-2` = "no fracture(s)"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    tpbotph = .replace_labels(
    standardized_value_labels$tpbotph,
    `-2` = "no fracture(s)"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  tpbot = "categorical",
  tpbot1 = "categorical",
  tpbot1a = "categorical",
  tpbot1b = "categorical",
  tpbot2 = "categorical",
  tpbot2a = "categorical",
  tpbot2b = "categorical",
  tpbot3 = "categorical",
  tpbot3a = "categorical",
  tpbot3b = "categorical",
  tpbotph = "categorical",
  tpfall = "categorical",
  tpfalln = "numeric",
  tpfracn = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "605", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "605", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "605", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "605", waves = .lasa_wave_rows())
)

.lasa_fc_605 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

