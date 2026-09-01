## LASA filecode 605 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  tpfracn = "Number of fractures since last interview (max. 3)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tpbot1a", "tpbot1b", "tpbot2a", "tpbot2b", "tpbot3a", "tpbot3b", "tpbotph",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "tpbot1", "tpbot2", "tpbot3", "tpfracn",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  tpbot = "Fractures: since last interview",
  tpfall = "Did R fall last year?",
  .applies_to_waves = c("C")
)

variable_labels(
  tpfalln = "Fall: how often past year",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  tpfall = "Did R fall past year?",
  .applies_to_waves = c("D")
)

# define value labels ----
value_labels(
  `-1` = "no second fracture",
  .applies_to_vars = c("tpbot2a", "tpbot2b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "no third fracture",
  .applies_to_vars = c("tpbot3a", "tpbot3b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no first/second fracture",
  .applies_to_vars = c("tpbot3a"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "nothing broken",
  .applies_to_vars = c("tpbot1a", "tpbot1b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpbot"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpbot1"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "pulse / wrist, colles", `2` = "forearm / humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "cymbal / pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra(e)", `13` = "unknown",
  .applies_to_vars = c("tpbot1a"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "reason unknown", `1` = "fall from > standing height", `2` = "fall from standing height or <", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("tpbot1b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no first fracture", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpbot2"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no first fracture", `1` = "pulse / wrist, colles", `2` = "forearm / humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "cymbal / pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra(e)", `13` = "unknown",
  .applies_to_vars = c("tpbot2a"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no first fracture", `0` = "reason unknown", `1` = "fall from > standing height", `2` = "fall from standing height or <", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("tpbot2b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no first or second fracture", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpbot3"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = "pulse / wrist, colles", `2` = "forearm / humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "cymbal / pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra(e)", `13` = "unknown",
  .applies_to_vars = c("tpbot3a"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no first or second fracture", `0` = "reason unknown", `1` = "fall from > standing height", `2` = "fall from standing height or <", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("tpbot3b"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no fracture", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("tpbotph"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpfall"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-2` = "not fallen", `-1` = "na, asked", `0` = "fallen, number unknown", `9` = "more than 8 falls",
  .applies_to_vars = c("tpfalln"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `0` = "no known fractures",
  .applies_to_vars = c("tpfracn"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no fracture(s)", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("tpbotph"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

.lasa_fc_605 <- .lasa_finalize_fc("605")

