## LASA filecode 705 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: give it its own variable_labels()/value_labels() calls
## (or add it to .applies_to_waves of an existing call sharing its text).
## To add a new variable: add it to var_types_vec, then declare its
## text/codes below.

# define variable types ----
## Every canonical variable name this filecode declares, and its
## collapsed type ("numeric"/"categorical"/"text"/"date"). Free order --
## matched by name everywhere below, never by position.
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

# define variable labels ----
variable_labels(
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
  trfracn = "Number of fractures since last interview (max. 3)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trbot",
  .applies_to_waves = c("C")
)

variable_labels(
  "trbot1a", "trbot1b", "trbot2a", "trbot2b", "trbot3a", "trbot3b", "trbotph",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "trfalln",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  "trbot1", "trbot2", "trbot3", "trfracn",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  trfall = "Did you fall last year?",
  .applies_to_waves = c("C")
)

variable_labels(
  trfall = "Did you fall past year?",
  .applies_to_waves = c("D")
)

# define value labels ----
value_labels(
  `-2` = "no first fracture", `-1` = "no second fracture",
  .applies_to_vars = c("trbot2a", "trbot2b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "no third fracture",
  .applies_to_vars = c("trbot3a", "trbot3b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no first/second fracture",
  .applies_to_vars = c("trbot3a"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "nothing broken",
  .applies_to_vars = c("trbot1a", "trbot1b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trbot"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trbot1"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "pulse/wrist, colles", `2` = "forearm / humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "cymbal / pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra(e)", `13` = "unknown",
  .applies_to_vars = c("trbot1a"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "reason unknown", `1` = "fall from > standing height", `2` = "fall from standing height or <", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("trbot1b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "no first fracture / asked, no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trbot2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "pulse/wrist, colles", `2` = "forearm / humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "cymbal / pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra(e)", `13` = "unknown",
  .applies_to_vars = c("trbot2a", "trbot3a"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `0` = "reason unknown", `1` = "fall from > standing height", `2` = "fall from standing height or <", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("trbot2b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no first or second fracture", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trbot3"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no first or second fracture", `0` = "reason unknown", `1` = "fall from > standing height", `2` = "fall from standing height or <", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("trbot3b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no fracture(s)", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician / no", `2` = "yes, specialist",
  .applies_to_vars = c("trbotph"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trfall"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-2` = "not fallen", `-1` = "na, asked", `0` = "fallen, number unknown", `9` = "more than 8 falls",
  .applies_to_vars = c("trfalln"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "no known fractures",
  .applies_to_vars = c("trfracn"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no fracture", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("trbotph"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "not fallen", `-1` = "asked no answer", `0` = "fallen, number unknown", `9` = "more than 8 falls",
  .applies_to_vars = c("trfalln"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-1` = "no first fracture", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trbot2"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no fracture(s)", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("trbotph"),
  .applies_to_waves = c("D", "E", "F", "G")
)

value_labels(
  `-2` = "no fracture(s)", `-1` = "asked, no answer", `1` = "no", `2` = "yes, specialist",
  .applies_to_vars = c("trbotph"),
  .applies_to_waves = c("H", "I", "J", "K")
)

.lasa_fc_705 <- .lasa_finalize_fc("705")

