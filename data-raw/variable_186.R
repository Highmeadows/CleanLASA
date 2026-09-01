## LASA filecode 186 -- variable names, variable labels, value labels,
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
  mbot1 = "categorical",
  `mbot1#` = "numeric",
  mbot101 = "numeric",
  mbot102 = "numeric",
  mbot103 = "numeric",
  mbot104 = "numeric",
  mbot105 = "numeric",
  mbot111 = "categorical",
  mbot112 = "categorical",
  mbot113 = "categorical",
  mbot114 = "categorical",
  mbot115 = "categorical",
  mbot121 = "categorical",
  mbot122 = "categorical",
  mbot123 = "categorical",
  mbot131 = "categorical",
  mbot132 = "categorical",
  mbot133 = "categorical",
  mbot2 = "categorical",
  mbot2_1 = "categorical",
  mbot2_2 = "categorical",
  mbot2_3 = "categorical",
  mbot2_4 = "categorical",
  mbot2_5 = "categorical",
  mbot3 = "categorical",
  mbot31 = "categorical",
  mbot32 = "categorical",
  mbot33 = "categorical",
  mbot34 = "categorical",
  mbot35 = "categorical",
  mbot41 = "numeric",
  mbot41d = "numeric",
  mbot41m = "categorical",
  mbot41y = "numeric",
  mbot42 = "numeric",
  mbot42d = "numeric",
  mbot42m = "categorical",
  mbot42y = "numeric",
  mbot43 = "numeric",
  mbot43d = "numeric",
  mbot43m = "categorical",
  mbot43y = "numeric",
  mbot44 = "numeric",
  mbot44d = "numeric",
  mbot44m = "categorical",
  mbot44y = "numeric",
  mbot45 = "numeric",
  mbot45d = "numeric",
  mbot45m = "categorical",
  mbot45y = "numeric",
  mbot51 = "categorical",
  mbot52 = "categorical",
  mbot53 = "categorical",
  mbot54 = "categorical",
  mbot55 = "categorical",
  mbot6 = "categorical",
  mbot62 = "categorical",
  mbot63 = "categorical",
  mbot64 = "categorical",
  mbot65 = "categorical",
  mbot8 = "categorical",
  `mbot8#` = "numeric",
  mbot91 = "categorical",
  mbot92 = "categorical",
  mbot93 = "categorical",
  mbot94 = "categorical",
  mbot95 = "categorical",
  mconsx1 = "categorical",
  mconsx2 = "categorical",
  mconsx3 = "categorical",
  mfallfrac = "categorical",
  mfallfracd = "numeric",
  mfallfracm = "categorical",
  mfallfracy = "numeric",
  mhippl = "categorical",
  mhipplm = "categorical",
  mhipply = "numeric",
  mhippr = "categorical",
  mhipprm = "categorical",
  mhippro = "categorical",
  mhippry = "numeric",
  mkneply = "numeric",
  mknepro = "categorical",
  mknepry = "numeric"
)

# define variable labels ----
variable_labels(
  mbot1 = "Fracture occurrence",
  `mbot1#` = "Number of fractures",
  mbot101 = "Fracture before 1: age",
  mbot102 = "Fracture before 2: age",
  mbot103 = "Fracture before 3: age",
  mbot104 = "Fracture before 4: age",
  mbot105 = "Fracture before 5: age",
  mbot111 = "Fracture 1: side",
  mbot112 = "Fracture 2: side",
  mbot113 = "Fracture 3: side",
  mbot114 = "fracture 4: side",
  mbot115 = "fracture 5: side",
  mbot121 = "Fracture 1: x-ray",
  mbot122 = "Fracture 2: x-ray",
  mbot123 = "Fracture 3: x-ray",
  mbot131 = "Fracture 1: consent",
  mbot132 = "Fracture 2: consent",
  mbot133 = "Fracture 3: consent",
  mbot2 = "second fracture",
  mbot2_1 = "Fracture 1: type",
  mbot2_2 = "Fracture 2: type",
  mbot2_3 = "Fracture 3: type",
  mbot2_4 = "Fracture 4: type",
  mbot2_5 = "Fracture 5: type",
  mbot3 = "Third fracture",
  mbot31 = "Fracture 1: month",
  mbot32 = "Fracture 2: month",
  mbot33 = "Fracture 3: month",
  mbot34 = "Fracture 4: month",
  mbot35 = "Fracture 5: month",
  mbot41 = "Fracture 1: year",
  mbot41d = "Fracture 1: day",
  mbot41m = "Fracture 1: month",
  mbot41y = "Fracture 1: year",
  mbot42 = "Fracture 2: year",
  mbot42d = "Fracture 2: day",
  mbot42m = "Fracture 2: month",
  mbot42y = "Fracture 2: year",
  mbot43 = "Fracture 3: year",
  mbot43d = "Fracture 3: day",
  mbot43m = "Fracture 3: month",
  mbot43y = "Fracture 3: year",
  mbot44 = "Fracture 4: year",
  mbot44d = "fracture 4: day",
  mbot44m = "fracture 4: month",
  mbot44y = "fracture 4: year",
  mbot45 = "Fracture 5: year",
  mbot45d = "fracture 5: day",
  mbot45m = "fracture 5: month",
  mbot45y = "fracture 5: year",
  mbot51 = "Fracture 1: cause",
  mbot52 = "Fracture 2: cause",
  mbot53 = "Fracture 3: cause",
  mbot54 = "Fracture 4 hip: cause",
  mbot55 = "Fracture 5 hip: cause",
  mbot6 = "Fractures Family",
  mbot62 = "Fractures Family History: mother",
  mbot63 = "Fractures Family History: father",
  mbot64 = "Fractures Family History: brother",
  mbot65 = "Fractures Family History: sister",
  mbot8 = "Fractures before last interview (max 5)",
  `mbot8#` = "# of fractures before (max 5)",
  mbot91 = "Fracture before 1: type",
  mbot92 = "Fracture before 2: type",
  mbot93 = "Fracture before 3: type",
  mbot94 = "Fracture before 4: type",
  mbot95 = "Fracture before 5: type",
  mconsx1 = "fracture 1: consent for x-ray and report",
  mconsx2 = "fracture 2: consent for x-ray and report",
  mconsx3 = "fracture 3: consent for x-ray and report",
  mfallfrac = "fracture due to",
  mfallfracd = "fracture due to fall: day",
  mfallfracm = "fracture due to fall: month",
  mfallfracy = "fracture due to fall: year",
  mhippl = "Left hipprosthesis",
  mhipplm = "Month left hip prosthesis",
  mhipply = "Year left hipprosthesis",
  mhippr = "Right hipprosthesis",
  mhipprm = "Month right hip prosthesis",
  mhippro = "Hipprosthesis",
  mhippry = "Year right hipprosthesis",
  mkneply = "knee prosthesis left: year",
  mknepro = "knee prosthesis",
  mknepry = "knee prosthesis right: year",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mbot101", "mbot102", "mbot103", "mbot104", "mbot105", "mbot2_4", "mbot2_5", "mbot31", "mbot32", "mbot33", "mbot34", "mbot35", "mbot41", "mbot42", "mbot43", "mbot44", "mbot45", "mbot54", "mbot55", "mbot6", "mbot62", "mbot63", "mbot64", "mbot65", "mbot8", "mbot8#", "mbot91", "mbot92", "mbot93", "mbot94", "mbot95",
  .applies_to_waves = c("C")
)

variable_labels(
  "mbot2_1", "mbot2_2", "mbot2_3",
  .applies_to_waves = c("C", "D", "E", "2B", "F")
)

variable_labels(
  "mbot51", "mbot52", "mbot53",
  .applies_to_waves = c("D", "E", "F")
)

variable_labels(
  "mhipplm", "mhipprm",
  .applies_to_waves = c("D")
)

variable_labels(
  "mhippl", "mhipply", "mhippr", "mhippro", "mhippry",
  .applies_to_waves = c("2B")
)

variable_labels(
  "mbot111", "mbot112", "mbot113", "mbot121", "mbot122", "mbot123", "mbot131", "mbot132", "mbot133", "mbot41d", "mbot41m", "mbot41y", "mbot42d", "mbot42m", "mbot42y", "mbot43d", "mbot43m", "mbot43y",
  .applies_to_waves = c("F")
)

variable_labels(
  "mkneply", "mknepro", "mknepry",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  "mbot114", "mbot115", "mbot44d", "mbot44m", "mbot44y", "mbot45d", "mbot45m", "mbot45y",
  .applies_to_waves = c("3B")
)

variable_labels(
  "mconsx1", "mconsx2", "mconsx3",
  .applies_to_waves = c("J")
)

variable_labels(
  "mfallfrac", "mfallfracd", "mfallfracm", "mfallfracy",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  "mbot2", "mbot3",
  .applies_to_waves = c("K")
)

variable_labels(
  mbot1 = "Fracture: since last interview",
  .applies_to_waves = c("C", "D", "E", "F")
)

variable_labels(
  `mbot1#` = "# of fractures since (max 5)",
  mbot52 = "Fracture 2 hip; cause",
  .applies_to_waves = c("C")
)

variable_labels(
  mbot51 = "Fracture 1 hip: cause",
  mbot53 = "Fracture 3 hip: cause",
  .applies_to_waves = c("C", "2B")
)

variable_labels(
  `mbot1#` = "# of fractures since (max 3)",
  mhipply = "Year left hip prosthesis",
  mhippro = "Hip prosthesis",
  mhippry = "Year right hip prosthesis",
  .applies_to_waves = c("D", "E", "F")
)

variable_labels(
  mbot6 = "Hip fractures family members",
  mbot62 = "Hip fractures history: mother",
  mbot63 = "Hip fractures history: father",
  mbot64 = "Hip fractures history: brother",
  mbot65 = "Hip fractures history: sister",
  .applies_to_waves = c("D")
)

variable_labels(
  mbot1 = "Fracture: ever",
  `mbot1#` = "# of fractures (max 3)",
  mbot41 = "Fracture 1: Year",
  mbot42 = "Fracture 2: Year",
  mbot43 = "Fracture 3: Year",
  mbot52 = "Fracture 2 hip: cause",
  mbot6 = "Fractures family",
  mbot62 = "Fractures family history: mother",
  mbot63 = "Fractures family history: father",
  mbot64 = "Fractures family history: brother",
  mbot65 = "Fractures family history: sister",
  mhipplm = "not processed",
  mhipprm = "not processed",
  .applies_to_waves = c("2B")
)

variable_labels(
  mbot1 = "fracture: since last interview",
  .applies_to_waves = c("G", "H", "3B", "I", "J")
)

variable_labels(
  `mbot1#` = "number of fractures since (max 3)",
  .applies_to_waves = c("G", "H", "3B", "I")
)

variable_labels(
  mbot111 = "fracture 1: side",
  mbot112 = "fracture 2: side",
  mbot113 = "fracture 3: side",
  mbot51 = "fracture 1: cause",
  mbot52 = "fracture 2: cause",
  mbot53 = "fracture 3: cause",
  mhipply = "hip prosthesis left: year",
  mhippro = "hip prosthesis",
  mhippry = "hip prosthesis right: year",
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

variable_labels(
  mbot121 = "fracture 1: x-ray",
  mbot122 = "fracture 2: x-ray",
  mbot123 = "fracture 3: x-ray",
  .applies_to_waves = c("G", "H", "I", "J")
)

variable_labels(
  mbot131 = "fracture 1: consent",
  .applies_to_waves = c("G", "H")
)

variable_labels(
  mbot132 = "fracture 2: consent",
  mbot133 = "fracture 3: consent",
  .applies_to_waves = c("G", "H", "I")
)

variable_labels(
  mbot2_1 = "fracture 1: type",
  mbot2_2 = "fracture 2: type",
  mbot2_3 = "fracture 3: type",
  mbot41d = "fracture 1: day",
  mbot41m = "fracture 1: month",
  mbot41y = "fracture 1: year",
  mbot42d = "fracture 2: day",
  mbot42m = "fracture 2: month",
  mbot42y = "fracture 2: year",
  mbot43d = "fracture 3: day",
  mbot43m = "fracture 3: month",
  mbot43y = "fracture 3: year",
  .applies_to_waves = c("G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  mbot2_4 = "fracture 4: type",
  mbot2_5 = "fracture 5: type",
  mbot54 = "fracture 4: cause",
  mbot55 = "fracture 5: cause",
  mbot6 = "hip fractures family history",
  mbot62 = "hip fractures family history: mother",
  mbot63 = "hip fractures family history: father",
  mbot64 = "hip fractures family history: brother",
  mbot65 = "hip fractures family history: sister",
  mhipplm = "hip prosthesis left: month",
  mhipprm = "hip prosthesis right: month",
  .applies_to_waves = c("3B")
)

variable_labels(
  mbot1 = "fracture: ever",
  `mbot1#` = "number of fractures (max 3)",
  .applies_to_waves = c("MB")
)

variable_labels(
  `mbot1#` = "number of fractures since last interview (max 3)",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  mbot131 = "fracture 1: consent for report",
  mbot132 = "fracture 2: consent for report",
  mbot133 = "fracture 3: consent for report",
  .applies_to_waves = c("J")
)

variable_labels(
  mbot1 = "other fracture since last interview",
  mbot121 = "fracture 1: photo",
  mbot122 = "fracture 2: photo",
  mbot123 = "fracture 3: photo",
  mconsx1 = "fracture 1: consent for photo and report",
  mconsx2 = "fracture 2: consent for photo and report",
  mconsx3 = "toestemming verslag botbreuk 1",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-2` = "na, see CMBOT8#",
  .applies_to_vars = c("mbot101", "mbot102", "mbot103", "mbot104", "mbot105", "mbot91", "mbot92", "mbot93", "mbot94", "mbot95"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-5` = "na, interview terminated", `-2` = "na, see JMFALLFRAC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT1", `-1` = "na, asked",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip",
  .applies_to_vars = c("mbot101", "mbot102", "mbot103", "mbot104", "mbot105"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "na, see JMBOT#", `-1` = "na, asked", `1` = "right side", `2` = "left side", `3` = "not applicable",
  .applies_to_vars = c("mbot111", "mbot112", "mbot113"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-2` = "na, see BMBOT1#", `-1` = "na, asked", `1` = "right side", `2` = "left side", `3` = "not applicable",
  .applies_to_vars = c("mbot114", "mbot115"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-2` = "na, see JMBOT#", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot121", "mbot123", "mbot131", "mbot132", "mbot133", "mconsx1", "mconsx2", "mconsx3"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-2` = "na, see KMBOT#", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot122"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "na, see KMFALLFRAC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot2", "mbot3"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JMBOT#", `-1` = "na, asked", `1` = "wrist, colles", `2` = "humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra", `13` = "unknown",
  .applies_to_vars = c("mbot2_1", "mbot2_3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KMBOT#", `-1` = "na, asked", `1` = "wrist, colles", `2` = "humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra", `13` = "unknown",
  .applies_to_vars = c("mbot2_2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT1#", `-1` = "na, asked", `1` = "wrist, colles", `2` = "humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra", `13` = "unknown",
  .applies_to_vars = c("mbot2_4", "mbot2_5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT1#", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot31", "mbot32", "mbot33", "mbot34", "mbot35"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT1#", `-1` = "na, asked",
  .applies_to_vars = c("mbot41", "mbot42", "mbot43", "mbot44", "mbot45"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, see KMFALLFRACD", `-2` = "na, see FMBOT1", `-1` = "na, asked",
  .applies_to_vars = c("mbot41d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "missing / source-specific", `-2` = "na, see FMBOT1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot41m"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, see KMFALLFRACY", `-2` = "na, see FMBOT1", `-1` = "na, asked",
  .applies_to_vars = c("mbot41y"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see FMBOT1", `-1` = "na, asked",
  .applies_to_vars = c("mbot42d", "mbot42y", "mbot43d", "mbot43y"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see FMBOT1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot42m", "mbot43m"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BMBOT1#", `-1` = "na, asked",
  .applies_to_vars = c("mbot44d", "mbot44y", "mbot45d", "mbot45y"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-2` = "na, see BMBOT1#", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot44m", "mbot45m"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GMBOT1", `-1` = "na, asked", `1` = "fall>standing height", `2` = "fall<standing height", `3` = "fall from bike", `4` = "other", `5` = "other",
  .applies_to_vars = c("mbot51", "mbot53"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JMBOT#", `-1` = "na, asked", `1` = "fall>standing height", `2` = "fall<standing height", `3` = "fall from bike", `4` = "other", `5` = "other",
  .applies_to_vars = c("mbot52"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT1#", `-1` = "na, asked", `1` = "fall>standing height", `2` = "fall<standing height", `3` = "fall from bike", `4` = "other", `5` = "other",
  .applies_to_vars = c("mbot54", "mbot55"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "no",
  .applies_to_vars = c("mbot6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT6", `-1` = "na, asked", `0` = "not mentioned", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot62", "mbot63", "mbot64", "mbot65"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot8"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT8",
  .applies_to_vars = c("mbot8#"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `1` = "pulse/wrist, colles", `2` = "forearm, humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "cymbal/pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra", `13` = "unknown",
  .applies_to_vars = c("mbot91", "mbot92", "mbot93", "mbot94", "mbot95"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `1` = "fall no", `2` = "yes",
  .applies_to_vars = c("mfallfrac"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-2` = "na, see JMFALLFRAC", `-1` = "na, asked",
  .applies_to_vars = c("mfallfracd", "mfallfracy"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-2` = "na, see JMFALLFRAC", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mfallfracm"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-2` = "na, see BMHIPPRO", `-1` = "na, asked", `1` = "no", `2` = "yes, left",
  .applies_to_vars = c("mhippl"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-2` = "na, see DMHIPPRO", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mhipplm", "mhipprm"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see BMHIPPL", `-1` = "na, asked",
  .applies_to_vars = c("mhipply"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-2` = "na, see BMHIPPRO", `-1` = "na, asked", `1` = "no", `2` = "yes, right",
  .applies_to_vars = c("mhippr"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "no", `3` = "right", `4` = "left and right",
  .applies_to_vars = c("mhippro"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BMHIPPR", `-1` = "na, asked",
  .applies_to_vars = c("mhippry"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-2` = "na, see JMKNEPRO", `-1` = "na, asked",
  .applies_to_vars = c("mkneply", "mknepry"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "left", `3` = "right", `4` = "left and right",
  .applies_to_vars = c("mknepro"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot1"),
  .applies_to_waves = c("C", "D", "E", "2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT1",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT1#", `1` = "pulse/wrist, colles", `2` = "forearm, humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "cymbal/pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra", `13` = "unknown",
  .applies_to_vars = c("mbot2_1", "mbot2_2", "mbot2_3", "mbot2_4", "mbot2_5"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT1#", `-1` = "na, asked", `1` = "fall>standing height", `2` = "fall<standing height", `3` = "traffic accident", `4` = "other", `5` = "spontaan",
  .applies_to_vars = c("mbot51", "mbot52", "mbot53", "mbot54", "mbot55"),
  .applies_to_waves = c("C")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot6"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMBOT6", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mbot62", "mbot63", "mbot64", "mbot65"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see D/EMBOT1#",
  .applies_to_vars = c("mbot2_1", "mbot2_2", "mbot2_3", "mbot51", "mbot52", "mbot53"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-2` = "na, see D/EMBOT1",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `1` = "pulse/wrist, colles", `2` = "forearm, humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "cymbal/pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra", `13` = "unknown",
  .applies_to_vars = c("mbot2_1", "mbot2_2", "mbot2_3"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "fall > standing height", `2` = "fall < standing height", `3` = "traffic accident", `4` = "other -> to be coded",
  .applies_to_vars = c("mbot51", "mbot52", "mbot53"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot6"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DMBOT6", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mbot62", "mbot63", "mbot64", "mbot65"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see D/EMHIPPRO", `-1` = "na, asked",
  .applies_to_vars = c("mhipply", "mhippry"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "left", `3` = "right", `4` = "left and right",
  .applies_to_vars = c("mhippro"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BMBOT1", `-1` = "na, asked",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMBOT1#", `-1` = "na, asked", `1` = "pulse/wrist, colles", `2` = "forearm, humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "cymbal/pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head, neck", `12` = "vertebra", `13` = "unknown",
  .applies_to_vars = c("mbot2_1", "mbot2_2", "mbot2_3"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMBOT1#", `-1` = "na, asked",
  .applies_to_vars = c("mbot41", "mbot42", "mbot43"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMBOT1#", `-1` = "na, asked", `1` = "fall > standing height", `2` = "fall < standing height", `3` = "traffic accident", `4` = "other -> to be coded",
  .applies_to_vars = c("mbot51", "mbot52", "mbot53"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mbot6"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot62", "mbot63", "mbot64", "mbot65"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mhippro"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see FMBOT1#",
  .applies_to_vars = c("mbot111", "mbot112", "mbot113", "mbot121", "mbot122", "mbot123", "mbot131", "mbot132", "mbot133", "mbot2_1", "mbot2_2", "mbot2_3", "mbot51", "mbot52", "mbot53"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot1"),
  .applies_to_waves = c("F", "G", "H", "3B", "MB", "I")
)

value_labels(
  `-2` = "na, see FMBOT1",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "right side", `2` = "left side", `3` = "not applicable",
  .applies_to_vars = c("mbot111", "mbot112", "mbot113"),
  .applies_to_waves = c("F", "G", "H", "3B", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot121", "mbot122", "mbot123", "mbot131", "mbot132", "mbot133"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "wrist, colles", `2` = "humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head (skull, nose, jaw)", `12` = "vertebra (back, neck)", `13` = "unknown",
  .applies_to_vars = c("mbot2_1", "mbot2_2", "mbot2_3"),
  .applies_to_waves = c("F", "G", "H", "3B", "I")
)

value_labels(
  `-2` = "na, see FMBOT1", `-1` = "na, asked",
  .applies_to_vars = c("mbot41d", "mbot41y"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FMBOT1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot41m", "mbot42m", "mbot43m"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "fall > standing height", `2` = "fall < =standing height", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("mbot51", "mbot53"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "fall > standing height", `2` = "fall < =standing height", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("mbot52"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see FMHIPPRO", `-1` = "na, asked",
  .applies_to_vars = c("mhipply", "mhippry"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see GMBOT1#",
  .applies_to_vars = c("mbot111", "mbot112", "mbot113", "mbot121", "mbot122", "mbot123", "mbot131", "mbot132", "mbot133", "mbot2_1", "mbot2_2", "mbot2_3", "mbot52"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMBOT1",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMBOT#", `-1` = "na, asked",
  .applies_to_vars = c("mbot41d", "mbot41y", "mbot42d", "mbot42y", "mbot43d", "mbot43y"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMBOT#", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot41m", "mbot42m", "mbot43m"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMBOT1", `-1` = "na, asked", `1` = "fall > standing height", `2` = "fall < =standing height", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("mbot51", "mbot53"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMHIPPRO", `-1` = "na, asked",
  .applies_to_vars = c("mhipply", "mhippry"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see H/B/IMBOT1#",
  .applies_to_vars = c("mbot111", "mbot112", "mbot113", "mbot2_1", "mbot2_2", "mbot2_3", "mbot41m", "mbot41y", "mbot42d", "mbot42m", "mbot42y", "mbot43d", "mbot43m", "mbot43y", "mbot51", "mbot52", "mbot53"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/B/IMBOT1",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/IMBOT1#", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot121", "mbot122", "mbot123", "mbot132", "mbot133"),
  .applies_to_waves = c("H", "I")
)

value_labels(
  `-2` = "na, see H/IMBOT1#", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot131"),
  .applies_to_waves = c("H")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mbot41d"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot41m"),
  .applies_to_waves = c("H", "I")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mbot41y", "mbot42d", "mbot42y", "mbot43d", "mbot43y"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot42m", "mbot43m"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "fall from > standing height", `2` = "fall from standing height or <", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("mbot51", "mbot52", "mbot53"),
  .applies_to_waves = c("H", "I")
)

value_labels(
  `-2` = "na, see H/B/IMHIPPRO", `-1` = "na, asked",
  .applies_to_vars = c("mhipply", "mhippry"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/IMKNEPRO", `-1` = "na, asked",
  .applies_to_vars = c("mkneply", "mknepry"),
  .applies_to_waves = c("H", "I")
)

value_labels(
  `-2` = "na, see BMBOT1#", `-1` = "na, asked", `1` = "wrist, colles", `2` = "humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head (skull, nose, jaw)", `12` = "vertebra (back, neck)", `13` = "unknown",
  .applies_to_vars = c("mbot2_4", "mbot2_5"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot41m"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-1` = "na, asked", `1` = "fall from standing height or <", `2` = "fall from > standing height", `3` = "fall from bike", `4` = "traffic accident", `5` = "other",
  .applies_to_vars = c("mbot51", "mbot52", "mbot53"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BMBOT1#", `-1` = "na, asked", `1` = "fall from standing height or <", `2` = "fall from > standing height", `3` = "fall from bike", `4` = "traffic accident", `5` = "other",
  .applies_to_vars = c("mbot54", "mbot55"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BMBOT6", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot62", "mbot63", "mbot64", "mbot65"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BMHIPPRO", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mhipplm", "mhipprm"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BMBOT1",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMBOT1#", `-1` = "na, asked", `1` = "wrist, colles", `2` = "humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head (skull, nose, jaw)", `12` = "vertebra (back, neck)", `13` = "unknown",
  .applies_to_vars = c("mbot2_1", "mbot2_2", "mbot2_3"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMBOT#", `-1` = "na, asked",
  .applies_to_vars = c("mbot41d", "mbot41y", "mbot42d", "mbot42y", "mbot43d", "mbot43y"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see BMBOT#", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot41m", "mbot42m", "mbot43m"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see JMFALLFRAC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot1"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMBOT1",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see H/IMBOT#", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot122"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMBOT#", `-1` = "na, asked", `1` = "wrist, colles", `2` = "humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head (skull, nose, jaw)", `12` = "vertebra (back, neck)", `13` = "unknown",
  .applies_to_vars = c("mbot2_1", "mbot2_3"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMBOT1#", `-1` = "na, asked", `1` = "wrist, colles", `2` = "humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head (skull, nose, jaw)", `12` = "vertebra (back, neck)", `13` = "unknown",
  .applies_to_vars = c("mbot2_2"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMBOT#", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot41m", "mbot42m"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMBOT#", `-1` = "na, asked",
  .applies_to_vars = c("mbot41y", "mbot42d", "mbot43d", "mbot43y"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMBOT1#", `-1` = "na, asked",
  .applies_to_vars = c("mbot42y"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMBOT1#", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot43m"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMBOT#", `-1` = "na, asked", `1` = "fall from > standing height", `2` = "fall from standing height or <", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("mbot51", "mbot52", "mbot53"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMHIPPRO", `-1` = "na, asked",
  .applies_to_vars = c("mhipply", "mhippry"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KMFALLFRAC", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot1"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMBOT1",
  .applies_to_vars = c("mbot1#"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMBOT#", `-1` = "na, asked", `1` = "right side", `2` = "left side", `3` = "not applicable",
  .applies_to_vars = c("mbot111", "mbot112", "mbot113"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMBOT#", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbot121", "mbot123", "mconsx1", "mconsx2", "mconsx3"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMBOT#", `-1` = "na, asked", `1` = "wrist, colles", `2` = "humerus", `3` = "hand, fingers", `4` = "other upper extremities", `5` = "rib", `6` = "pelvis", `7` = "ankle", `8` = "feet, toes", `9` = "hip", `10` = "other lower extremities", `11` = "head (skull, nose, jaw)", `12` = "vertebra (back, neck)", `13` = "unknown",
  .applies_to_vars = c("mbot2_1", "mbot2_2", "mbot2_3"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, see KMFALLFRACD", `-2` = "na, see KMBOT#", `-1` = "na, asked",
  .applies_to_vars = c("mbot41d"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, see KMFALLFRACM", `-2` = "na, see KMBOT#", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot41m"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, see KMFALLFRACY", `-2` = "na, see KMBOT#", `-1` = "na, asked",
  .applies_to_vars = c("mbot41y"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMBOT#", `-1` = "na, asked",
  .applies_to_vars = c("mbot42d", "mbot42y", "mbot43d", "mbot43y"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMBOT#", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mbot42m", "mbot43m"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMBOT#", `-1` = "na, asked", `1` = "fall from > standing height", `2` = "fall from standing height or <", `3` = "traffic accident", `4` = "other",
  .applies_to_vars = c("mbot51", "mbot52", "mbot53"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMFALLFRAC", `-1` = "na, asked",
  .applies_to_vars = c("mfallfracd", "mfallfracy"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMFALLFRAC", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mfallfracm"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMHIPPRO", `-1` = "na, asked",
  .applies_to_vars = c("mhipply", "mhippry"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMKNEPRO", `-1` = "na, asked",
  .applies_to_vars = c("mkneply", "mknepry"),
  .applies_to_waves = c("K")
)

.lasa_fc_186 <- .lasa_finalize_fc("186")

