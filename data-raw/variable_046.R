## LASA filecode 046 -- variable names, variable labels, value labels,
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
  lphya01 = "categorical",
  lphya02 = "categorical",
  lphya03 = "categorical",
  lphya04 = "numeric",
  lphya05 = "numeric",
  lphya06 = "categorical",
  lphya07 = "categorical",
  lphya08 = "numeric",
  lphya09 = "numeric",
  lphya10 = "categorical",
  lphya11 = "categorical",
  lphya12 = "numeric",
  lphya13 = "numeric",
  lphya14 = "categorical",
  lphya15 = "categorical",
  lphya16 = "numeric",
  lphya17 = "categorical",
  lphya18 = "numeric",
  lphya19 = "numeric",
  lphya20 = "categorical",
  lphya21 = "categorical",
  lphya22 = "categorical",
  lphya23 = "numeric",
  lphya24 = "numeric",
  lphya25 = "categorical",
  lphya26 = "categorical",
  lphya27 = "numeric",
  lphya28 = "numeric",
  lphya29 = "categorical",
  lphya30 = "numeric",
  lphya31 = "categorical",
  lphya32 = "categorical",
  lphya33 = "numeric",
  lphya34 = "numeric",
  lphya35 = "categorical",
  lphya36 = "categorical",
  lphya37 = "numeric",
  lphya38 = "numeric",
  lphya39 = "categorical",
  lphya40 = "categorical",
  lphya41 = "categorical",
  lphya42 = "categorical",
  lphya43 = "categorical",
  lphya44 = "categorical",
  lphya45 = "categorical",
  lphya46 = "categorical",
  lphya47 = "categorical",
  lphya48 = "categorical",
  lphya49 = "categorical",
  lphya50 = "categorical",
  lphyasp = "categorical",
  lspin1 = "categorical",
  lspin2 = "numeric",
  lspin3 = "numeric"
)

# define variable labels ----
variable_labels(
  lphya01 = "Physical condition respondent: observation",
  lphya02 = "Wheelchair go outside",
  lphya03 = "Wheelchair go outside: last two weeks",
  lphya04 = "Wheelchair go outside: #times last two weeks",
  lphya05 = "Wheelchair: time in minutes",
  lphya06 = "Walking outside",
  lphya07 = "Walking outside:last two weeks",
  lphya08 = "Walking outside: #times last two weeks",
  lphya09 = "Walking: time in minutes",
  lphya10 = "Bicycling",
  lphya11 = "Bicycling: last two weeks",
  lphya12 = "Bicycling: # times last two weeks",
  lphya13 = "Bicycling: time in minutes",
  lphya14 = "Have garden: yes/no",
  lphya15 = "Gardening: yes/no",
  lphya16 = "Gardening: # months a year",
  lphya17 = "Gardening: last two weeks",
  lphya18 = "Gardening: # last two weeks",
  lphya19 = "Gardening: time in minutes",
  lphya20 = "Gardening: digging last two weeks",
  lphya21 = "Sport 1: past two weeks yes/no",
  lphya22 = "Sport 1: past two weeks",
  lphya23 = "Sport 1: # times past two weeks",
  lphya24 = "Sport 1: time in minutes",
  lphya25 = "Sport 2: yes/no",
  lphya26 = "Sport 2: past two weeks",
  lphya27 = "Sport 2: # times past two weeks",
  lphya28 = "Sport 2 : time in minutes",
  lphya29 = "Sport: sweating past two weeks yes/no",
  lphya30 = "Sport: #times sweating past two weeks",
  lphya31 = "Light household: yes/no",
  lphya32 = "Light household: past two weeks yes/no",
  lphya33 = "Light household: # days past two weeks",
  lphya34 = "Light household: time in minutes",
  lphya35 = "Heavy household: yes/no",
  lphya36 = "Heavy household: past two weeks yes/no",
  lphya37 = "Heavy household: # days past two weeks",
  lphya38 = "Heavy household: time in minutes",
  lphya39 = "Past two weeks normal: yes/no",
  lphya40 = "not normal: sick",
  lphya41 = "not normal: depressed",
  lphya42 = "not normal: bad weather",
  lphya43 = "not normal: family affairs",
  lphya44 = "not normal: vacation",
  lphya45 = "not normal: cleaning/repairs",
  lphya46 = "not normal: good weather",
  lphya47 = "not normal: season break",
  lphya48 = "not normal: sickness partner/others",
  lphya49 = "not normal: other reason",
  lphya50 = "not normal: other reasons coded",
  lphyasp = "Sport: yes/no",
  lspin1 = "Sport: most intensive sport",
  lspin2 = "Most intensive sport: # times past two weeks",
  lspin3 = "Most intensive sport: time in minutes",
  .applies_to_waves = c("Z")
)

variable_labels(
  "lphya01", "lphya02", "lphya03", "lphya04", "lphya05", "lphya06", "lphya10", "lphya15", "lphya17", "lphya18", "lphya19", "lphya25", "lphya26", "lphya27", "lphya28", "lphya31", "lphya32", "lphya33", "lphya34", "lphya35", "lphya36", "lphya39", "lphya40", "lphya41", "lphya42", "lphya43", "lphya44",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "lphya07", "lphya08", "lphya09", "lphya11", "lphya12", "lphya13", "lphya21", "lphya22", "lphya23", "lphya24", "lphya37", "lphya38",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

variable_labels(
  "lphya14", "lphya16", "lphya20",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

variable_labels(
  "lphya29", "lphya30",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "lphya45", "lphya46", "lphya47", "lphya48", "lphya49", "lphya50",
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "lphyasp",
  .applies_to_waves = c("H", "3B", "I", "J")
)

variable_labels(
  "lspin2", "lspin3",
  .applies_to_waves = c("3B")
)

variable_labels(
  lphya45 = "not normal: other reason",
  .applies_to_waves = c("B", "C", "D", "E")
)

variable_labels(
  lphya46 = "not normal: other reasons coded",
  .applies_to_waves = c("B", "C", "D", "E", "2B")
)

variable_labels(
  lspin1 = "Sport: most intensive sport:",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("lphya02", "lphya03", "lphya04", "lphya05", "lphya06", "lphya07", "lphya08", "lphya09", "lphya10", "lphya11", "lphya12", "lphya13", "lphya14", "lphya15", "lphya16", "lphya17", "lphya18", "lphya19", "lphya20", "lphya21", "lphya22", "lphya23", "lphya24", "lphya25", "lphya26", "lphya27", "lphya28", "lphya29", "lphya30", "lphya31", "lphya32", "lphya33", "lphya34", "lphya35", "lphya36", "lphya37", "lphya38", "lphya39", "lphya40", "lphya41", "lphya42", "lphya43", "lphya44", "lphya45", "lphya46", "lphya47", "lphya48", "lphya49", "lphya50", "lphyasp", "lspin1", "lspin2", "lspin3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "respondent bedridden", `2` = "respondent in elec. wheelchair", `3` = "respondent in mech. wheelchair", `4` = "not 1, 2 or 3",
  .applies_to_vars = c("lphya01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya02", "lphya03", "lphya06", "lphya10", "lphya17", "lphya25", "lphya31", "lphya35", "lphya39"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("lphya04", "lphya05", "lphya08", "lphya09", "lphya12", "lphya13", "lphya18", "lphya19", "lphya23", "lphya24", "lphya27", "lphya28", "lphya33", "lphya34", "lphya38"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-5` = "not available, interview terminated", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya07", "lphya11", "lphya21"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya14", "lphya20", "lphyasp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya15"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("lphya16", "lphya30", "lspin2", "lspin3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "distance walking", `2` = "distance cycling", `3` = "gymnastics", `4` = "home trainer", `5` = "swimming", `6` = "(folk)dancing", `7` = "bowling", `8` = "tennis", `9` = "jogging/running/speed walking", `10` = "rowing", `11` = "label varies by wave", `12` = "label varies by wave", `13` = "label varies by wave", `14` = "soccer/basketball/korfball", `15` = "volleybal/baseball", `16` = "winter sports", `17` = "label varies by wave", `18` = "other sports", `21` = "cycling: long distance cycling", `22` = "cycling: cycle racing / spinning / mountain biking", `23` = "cycling: treadmill at home / cycle ergometer at home", `31` = "gymnastics and fitness: gymnastics / exercising at home", `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics", `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao", `34` = "gymnastics and fitness: endurance training", `41` = "swimming: swimming", `42` = "swimming: aqua gym / aqua jogging", `51` = "racket sports: tennis", `52` = "racket sports: table tennis", `53` = "racket sports: squash", `54` = "racket sports: badminton", `61` = "running: running / jogging", `71` = "water sports: rowing", `72` = "water sports: sailing", `73` = "water sports: canoeing", `81` = "ball sports: soccer", `82` = "ball sports: futsal", `83` = "ball sports: hockey", `84` = "ball sports: volleyball", `85` = "ball sports: basketball", `86` = "ball sports: baseball / softball", `87` = "ball sports: golf / ball throwing game", `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls", `91` = "winter sports: skiing", `92` = "winter sports: cross country skiing", `93` = "winter sports: ice skating", `101` = "animal sports: horse riding", `102` = "animal sports: fishing / pigeon racing", `103` = "animal sports: dog training / horse carriage driving", `111` = "other sports: climbing", `112` = "other sports: billiards / darts", `113` = "other sports: (folk) dancing", `114` = "other sports: other",
  .applies_to_vars = c("lphya22", "lphya26"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "do not know",
  .applies_to_vars = c("lphya29"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "do not know", `4` = "refusal",
  .applies_to_vars = c("lphya32", "lphya36"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-5` = "not available, interview terminated", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("lphya37"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("lphya40", "lphya41", "lphya42", "lphya43", "lphya44"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("lphya45", "lphya47", "lphya48", "lphya49"),
  .applies_to_waves = c("Z", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "label varies by wave", `1` = "label varies by wave", `2` = "positive activities", `3` = "illness partner", `4` = "good weather", `5` = "decease partner", `6` = "business-trip", `7` = "removal", `8` = "spring cleaning", `9` = "rebuilding", `10` = "other",
  .applies_to_vars = c("lphya46"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "visit from friend/family", `2` = "positive activities", `3` = "illness partner", `4` = "good weather", `5` = "death partner", `6` = "business-trip", `7` = "removal/moved", `8` = "spring cleaning", `9` = "rebuilding", `10` = "other",
  .applies_to_vars = c("lphya50"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "most intensive", `-1` = "na, asked", `11` = "walking / hiking: long distance hiking", `12` = "walking / hiking: nordic walking", `13` = "walking / hiking: speed walking", `21` = "cycling: long distance cycling", `22` = "cycling: cycle racing / spinning / mountain biking", `23` = "cycling: treadmill at home / cycle ergometer at home", `31` = "gymnastics and fitness: gymnastics / exercising at home", `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics", `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao", `34` = "gymnastics and fitness: endurance training", `41` = "swimming: swimming", `42` = "swimming: aqua gym / aqua jogging", `51` = "racket sports: tennis", `52` = "racket sports: table tennis", `53` = "racket sports: squash", `54` = "racket sports: badminton", `61` = "running: running / jogging", `71` = "water sports: rowing", `72` = "water sports: sailing", `73` = "water sports: canoeing", `81` = "ball sports: soccer", `82` = "ball sports: futsal", `83` = "ball sports: hockey", `84` = "ball sports: volleyball", `85` = "ball sports: basketball", `86` = "ball sports: baseball / softball", `87` = "ball sports: golf / ball throwing game", `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls", `91` = "winter sports: skiing", `92` = "winter sports: cross country skiing", `93` = "winter sports: ice skating", `101` = "animal sports: horse riding", `102` = "animal sports: fishing / pigeon racing", `103` = "animal sports: dog training / horse carriage driving", `111` = "other sports: climbing", `112` = "other sports: billiards / darts", `113` = "other sports: (folk) dancing", `114` = "other sports: other",
  .applies_to_vars = c("lspin1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
  .applies_to_vars = c("lphya02", "lphya06", "lphya10", "lphya31", "lphya35", "lphya39"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
  .applies_to_vars = c("lphya03"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
  .applies_to_vars = c("lphya04", "lphya05"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
  .applies_to_vars = c("lphya07"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
  .applies_to_vars = c("lphya08", "lphya09"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
  .applies_to_vars = c("lphya11"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
  .applies_to_vars = c("lphya12", "lphya13"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
  .applies_to_vars = c("lphya17"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
  .applies_to_vars = c("lphya18", "lphya19"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
  .applies_to_vars = c("lphya23", "lphya25"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
  .applies_to_vars = c("lphya24"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
  .applies_to_vars = c("lphya27"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
  .applies_to_vars = c("lphya28"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
  .applies_to_vars = c("lphya32"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
  .applies_to_vars = c("lphya33", "lphya34"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
  .applies_to_vars = c("lphya36"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
  .applies_to_vars = c("lphya37", "lphya38"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
  .applies_to_vars = c("lphya40", "lphya41", "lphya42", "lphya43", "lphya44"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
  .applies_to_vars = c("lphya15"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "J")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
  .applies_to_vars = c("lphya22", "lphya29"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-5` = "na, interview terminated", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "respondent bedridden", `2` = "respondent in elec. wheelchair", `3` = "respondent in mech. wheelchair", `4` = "not 1, 2 or 3",
  .applies_to_vars = c("lphya01"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya07", "lphya11"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya14"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15", `-1` = "na, asked",
  .applies_to_vars = c("lphya16"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya20"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/GLPHYA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya21"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "distance walking", `2` = "distance cycling", `3` = "gymnastics", `4` = "home trainer", `5` = "swimming", `6` = "(folk)dancing", `7` = "bowling", `8` = "tennis", `9` = "jogging/running/speed walking", `10` = "rowing", `11` = "sailing", `12` = "billiards", `13` = "fishing", `14` = "soccer/basketball/korfball", `15` = "volleybal/baseball", `16` = "winter sports", `17` = "other sports",
  .applies_to_vars = c("lphya22"),
  .applies_to_waves = c("B", "C", "D", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/GLPHYA25", `-1` = "na, asked", `1` = "distance walking", `2` = "distance cycling", `3` = "gymnastics", `4` = "home trainer", `5` = "swimming", `6` = "(folk)dancing", `7` = "bowling", `8` = "tennis", `9` = "jogging/running/speed walking", `10` = "rowing", `11` = "sailing", `12` = "billiards", `13` = "fishing", `14` = "soccer/basketball/korfball", `15` = "volleybal/baseball", `16` = "winter sports", `17` = "other sports",
  .applies_to_vars = c("lphya26"),
  .applies_to_waves = c("B", "C", "D", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/GLPHYA29", `-1` = "na, asked",
  .applies_to_vars = c("lphya30"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("lphya37"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/BLPHYA39", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("lphya45"),
  .applies_to_waves = c("B", "C", "D", "E")
)

value_labels(
  `-2` = "na, see B/C/D/E/BLPHYA45", `1` = "visit from friend/family", `2` = "positive activities", `3` = "illness partner", `4` = "good weather", `5` = "decease partner", `6` = "business-trip", `7` = "removal", `8` = "spring cleaning", `9` = "rebuilding", `10` = "other",
  .applies_to_vars = c("lphya46"),
  .applies_to_waves = c("B", "C")
)

value_labels(
  `-2` = "na, see B/C/D/E/BLPHYA45", `0` = "-to be coded-", `1` = "visit from friend/family", `2` = "positive activities", `3` = "illness partner", `4` = "good weather", `5` = "decease partner", `6` = "business-trip", `7` = "removal", `8` = "spring cleaning", `9` = "rebuilding", `10` = "other",
  .applies_to_vars = c("lphya46"),
  .applies_to_waves = c("D", "E", "2B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "distance walking", `2` = "distance cycling", `3` = "gymnastics", `4` = "home trainer", `5` = "swimming", `6` = "(folk)dancing", `7` = "bowling", `8` = "tennis", `9` = "jogging/running/speed walking", `10` = "rowing", `11` = "sailing", `12` = "billiards", `13` = "fishing", `14` = "soccer/basketball/korfball", `15` = "volleybal/baseball", `16` = "winter sports", `17` = "golf", `18` = "other sports",
  .applies_to_vars = c("lphya22"),
  .applies_to_waves = c("2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/GLPHYA25", `-1` = "na, asked", `1` = "distance walking", `2` = "distance cycling", `3` = "gymnastics", `4` = "home trainer", `5` = "swimming", `6` = "(folk)dancing", `7` = "bowling", `8` = "tennis", `9` = "jogging/running/speed walking", `10` = "rowing", `11` = "sailing", `12` = "billiards", `13` = "fishing", `14` = "soccer/basketball/korfball", `15` = "volleybal/baseball", `16` = "winter sports", `17` = "golf", `18` = "other sports",
  .applies_to_vars = c("lphya26"),
  .applies_to_waves = c("2B", "F", "G")
)

value_labels(
  `-2` = "na, see F/G/H/B/I/JLPHYA39",
  .applies_to_vars = c("lphya45", "lphya46", "lphya47", "lphya48", "lphya49"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("lphya46"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see F/G/H/B/I/JLPHYA49", `1` = "visit from friend/family", `2` = "positive activities", `3` = "illness partner", `4` = "good weather", `5` = "death partner", `6` = "business-trip", `7` = "removal/moved", `8` = "spring cleaning", `9` = "rebuilding", `10` = "other",
  .applies_to_vars = c("lphya50"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-5` = "na, interview terminated", `-4` = "na, short interview", `-3` = "not done, wrong skip", `-1` = "na, asked", `1` = "respondent bedridden", `2` = "respondent in elec. wheelchair", `3` = "respondent in mech. wheelchair", `4` = "not 1, 2 or 3",
  .applies_to_vars = c("lphya01"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/I/JLPHYASP", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya21"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/I/JLPHYA21", `-1` = "na, asked", `11` = "walking / hiking: long distance hiking", `12` = "walking / hiking: nordic walking", `13` = "walking / hiking: speed walking", `21` = "cycling: long distance cycling", `22` = "cycling: cycle racing / spinning / mountain biking", `23` = "cycling: treadmill at home / cycle ergometer at home", `31` = "gymnastics and fitness: gymnastics / exercising at home", `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics", `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao", `34` = "gymnastics and fitness: endurance training", `41` = "swimming: swimming", `42` = "swimming: aqua gym / aqua jogging", `51` = "racket sports: tennis", `52` = "racket sports: table tennis", `53` = "racket sports: squash", `54` = "racket sports: badminton", `61` = "running: running / jogging", `71` = "water sports: rowing", `72` = "water sports: sailing", `73` = "water sports: canoeing", `81` = "ball sports: soccer", `82` = "ball sports: futsal", `83` = "ball sports: hockey", `84` = "ball sports: volleyball", `85` = "ball sports: basketball", `86` = "ball sports: baseball / softball", `87` = "ball sports: golf / ball throwing game", `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls", `91` = "winter sports: skiing", `92` = "winter sports: cross country skiing", `93` = "winter sports: ice skating", `101` = "animal sports: horse riding", `102` = "animal sports: fishing / pigeon racing", `103` = "animal sports: dog training / horse carriage driving", `111` = "other sports: climbing", `112` = "other sports: billiards / darts", `113` = "other sports: (folk) dancing", `114` = "other sports: other",
  .applies_to_vars = c("lphya22"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/I/JLPHYA25", `-1` = "na, asked", `11` = "walking / hiking: long distance hiking", `12` = "walking / hiking: nordic walking", `13` = "walking / hiking: speed walking", `21` = "cycling: long distance cycling", `22` = "cycling: cycle racing / spinning / mountain biking", `23` = "cycling: treadmill at home / cycle ergometer at home", `31` = "gymnastics and fitness: gymnastics / exercising at home", `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics", `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao", `34` = "gymnastics and fitness: endurance training", `41` = "swimming: swimming", `42` = "swimming: aqua gym / aqua jogging", `51` = "racket sports: tennis", `52` = "racket sports: table tennis", `53` = "racket sports: squash", `54` = "racket sports: badminton", `61` = "running: running / jogging", `71` = "water sports: rowing", `72` = "water sports: sailing", `73` = "water sports: canoeing", `81` = "ball sports: soccer", `82` = "ball sports: futsal", `83` = "ball sports: hockey", `84` = "ball sports: volleyball", `85` = "ball sports: basketball", `86` = "ball sports: baseball / softball", `87` = "ball sports: golf / ball throwing game", `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls", `91` = "winter sports: skiing", `92` = "winter sports: cross country skiing", `93` = "winter sports: ice skating", `101` = "animal sports: horse riding", `102` = "animal sports: fishing / pigeon racing", `103` = "animal sports: dog training / horse carriage driving", `111` = "other sports: climbing", `112` = "other sports: billiards / darts", `113` = "other sports: (folk) dancing", `114` = "other sports: other",
  .applies_to_vars = c("lphya26"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/I/JLPHYA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphyasp"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-3` = "most intensive", `-2` = "na, see BLPHYA22 & BLPHYA26", `-1` = "na, asked", `11` = "walking / hiking: long distance hiking", `12` = "walking / hiking: nordic walking", `13` = "walking / hiking: speed walking", `21` = "cycling: long distance cycling", `22` = "cycling: cycle racing / spinning / mountain biking", `23` = "cycling: treadmill at home / cycle ergometer at home", `31` = "gymnastics and fitness: gymnastics / exercising at home", `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics", `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao", `34` = "gymnastics and fitness: endurance training", `41` = "swimming: swimming", `42` = "swimming: aqua gym / aqua jogging", `51` = "racket sports: tennis", `52` = "racket sports: table tennis", `53` = "racket sports: squash", `54` = "racket sports: badminton", `61` = "running: running / jogging", `71` = "water sports: rowing", `72` = "water sports: sailing", `73` = "water sports: canoeing", `81` = "ball sports: soccer", `82` = "ball sports: futsal", `83` = "ball sports: hockey", `84` = "ball sports: volleyball", `85` = "ball sports: basketball", `86` = "ball sports: baseball / softball", `87` = "ball sports: golf / ball throwing game", `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls", `91` = "winter sports: skiing", `92` = "winter sports: cross country skiing", `93` = "winter sports: ice skating", `101` = "animal sports: horse riding", `102` = "animal sports: fishing / pigeon racing", `103` = "animal sports: dog training / horse carriage driving", `111` = "other sports: climbing", `112` = "other sports: billiards / darts", `113` = "other sports: (folk) dancing", `114` = "other sports: other",
  .applies_to_vars = c("lspin1"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BLSPIN1", `-1` = "na, asked",
  .applies_to_vars = c("lspin2"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BLSPIN2", `-1` = "na, asked",
  .applies_to_vars = c("lspin3"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-5` = "na, interview terminated", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BLPHYA06", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya07"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BLPHYA07", `-1` = "na, asked",
  .applies_to_vars = c("lphya08", "lphya09"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-5` = "na, interview terminated", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya11", "lphya21"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BLPHYA11", `-1` = "na, asked",
  .applies_to_vars = c("lphya12", "lphya13"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BLPHYA21", `-1` = "na, asked",
  .applies_to_vars = c("lphya22", "lphya23"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BLPHYA23", `-1` = "na, asked",
  .applies_to_vars = c("lphya24"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-5` = "na, interview terminated", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("lphya37"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BLPHYA36", `-1` = "na, asked",
  .applies_to_vars = c("lphya38"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ILPHYA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lphya15"),
  .applies_to_waves = c("I")
)

.lasa_fc_046 <- .lasa_finalize_fc("046")

