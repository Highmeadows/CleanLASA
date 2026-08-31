## LASA filecode 046 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  lspin3 = "Most intensive sport: time in minutes"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya14",
    "lphya15",
    "lphya16",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya20",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya29",
    "lphya30",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46"
  ),
  `C` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya14",
    "lphya15",
    "lphya16",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya20",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya29",
    "lphya30",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46"
  ),
  `D` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya14",
    "lphya15",
    "lphya16",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya20",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya29",
    "lphya30",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46"
  ),
  `E` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya14",
    "lphya15",
    "lphya16",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya20",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya29",
    "lphya30",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46"
  ),
  `2B` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya14",
    "lphya15",
    "lphya16",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya20",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya29",
    "lphya30",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya46"
  ),
  `F` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya14",
    "lphya15",
    "lphya16",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya20",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya29",
    "lphya30",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46",
    "lphya47",
    "lphya48",
    "lphya49",
    "lphya50"
  ),
  `G` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya14",
    "lphya15",
    "lphya16",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya20",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya29",
    "lphya30",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46",
    "lphya47",
    "lphya48",
    "lphya49",
    "lphya50"
  ),
  `H` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya14",
    "lphya15",
    "lphya16",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya20",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46",
    "lphya47",
    "lphya48",
    "lphya49",
    "lphya50",
    "lphyasp"
  ),
  `3B` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya14",
    "lphya15",
    "lphya16",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya20",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46",
    "lphya47",
    "lphya48",
    "lphya49",
    "lphya50",
    "lphyasp",
    "lspin1",
    "lspin2",
    "lspin3"
  ),
  `MB` = c(
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya37",
    "lphya38"
  ),
  `I` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya15",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46",
    "lphya47",
    "lphya48",
    "lphya49",
    "lphya50",
    "lphyasp"
  ),
  `J` = c(
    "lphya01",
    "lphya02",
    "lphya03",
    "lphya04",
    "lphya05",
    "lphya06",
    "lphya07",
    "lphya08",
    "lphya09",
    "lphya10",
    "lphya11",
    "lphya12",
    "lphya13",
    "lphya15",
    "lphya17",
    "lphya18",
    "lphya19",
    "lphya21",
    "lphya22",
    "lphya23",
    "lphya24",
    "lphya25",
    "lphya26",
    "lphya27",
    "lphya28",
    "lphya31",
    "lphya32",
    "lphya33",
    "lphya34",
    "lphya35",
    "lphya36",
    "lphya37",
    "lphya38",
    "lphya39",
    "lphya40",
    "lphya41",
    "lphya42",
    "lphya43",
    "lphya44",
    "lphya45",
    "lphya46",
    "lphya47",
    "lphya48",
    "lphya49",
    "lphya50",
    "lphyasp"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    lphya45 = "not normal: other reason",
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    lphya45 = "not normal: other reason",
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    lphya45 = "not normal: other reason",
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    lphya45 = "not normal: other reason",
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    lspin1 = "Sport: most intensive sport:"
  ),
  Wave_MB_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "no",
  `2` = "yes"
)

standardized_value_labels <- list(
  lphya01 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-1")],
    `-3` = "label varies by wave",
    `1` = "respondent bedridden",
    `2` = "respondent in elec. wheelchair",
    `3` = "respondent in mech. wheelchair",
    `4` = "not 1, 2 or 3"
  ),
  lphya02 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya03 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya04 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya05 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya07 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya08 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya09 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya10 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya11 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya12 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya13 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya14 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya15 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya16 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya17 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya18 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya19 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya20 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya21 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya22 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "label varies by wave",
    `12` = "label varies by wave",
    `13` = "label varies by wave",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "label varies by wave",
    `18` = "other sports",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
  lphya23 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya24 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya25 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya26 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "label varies by wave",
    `12` = "label varies by wave",
    `13` = "label varies by wave",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "label varies by wave",
    `18` = "other sports",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
  lphya27 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya28 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya29 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")],
    `3` = "do not know"
  ),
  lphya30 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya31 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya32 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")],
    `3` = "do not know",
    `4` = "refusal"
  ),
  lphya33 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya34 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya35 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya36 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")],
    `3` = "do not know",
    `4` = "refusal"
  ),
  lphya37 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-4", "-3", "-2", "-1")]
  ),
  lphya38 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lphya39 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lphya40 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya41 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya42 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya43 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya44 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya45 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya46 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "positive activities",
    `3` = "illness partner",
    `4` = "good weather",
    `5` = "decease partner",
    `6` = "business-trip",
    `7` = "removal",
    `8` = "spring cleaning",
    `9` = "rebuilding",
    `10` = "other"
  ),
  lphya47 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya48 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya49 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya50 = c(
    default_missing_labels[c("-2")],
    `1` = "visit from friend/family",
    `2` = "positive activities",
    `3` = "illness partner",
    `4` = "good weather",
    `5` = "death partner",
    `6` = "business-trip",
    `7` = "removal/moved",
    `8` = "spring cleaning",
    `9` = "rebuilding",
    `10` = "other"
  ),
  lphyasp = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lspin1 = c(
    `-3` = "most intensive",
    default_missing_labels[c("-2", "-1")],
    `11` = "walking / hiking: long distance hiking",
    `12` = "walking / hiking: nordic walking",
    `13` = "walking / hiking: speed walking",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
  lspin2 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lspin3 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "other sports"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA25",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "other sports"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see B/C/D/E/BLPHYA39"
  ),
    lphya46 = c(
    `-2` = "na, see B/C/D/E/BLPHYA45",
    `1` = "visit from friend/family",
    `2` = "positive activities",
    `3` = "illness partner",
    `4` = "good weather",
    `5` = "decease partner",
    `6` = "business-trip",
    `7` = "removal",
    `8` = "spring cleaning",
    `9` = "rebuilding",
    `10` = "other"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "other sports"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA25",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "other sports"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see B/C/D/E/BLPHYA39"
  ),
    lphya46 = c(
    `-2` = "na, see B/C/D/E/BLPHYA45",
    `1` = "visit from friend/family",
    `2` = "positive activities",
    `3` = "illness partner",
    `4` = "good weather",
    `5` = "decease partner",
    `6` = "business-trip",
    `7` = "removal",
    `8` = "spring cleaning",
    `9` = "rebuilding",
    `10` = "other"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "other sports"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA25",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "other sports"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see B/C/D/E/BLPHYA39"
  ),
    lphya46 = c(
    `-2` = "na, see B/C/D/E/BLPHYA45",
    `0` = "-to be coded-",
    `1` = "visit from friend/family",
    `2` = "positive activities",
    `3` = "illness partner",
    `4` = "good weather",
    `5` = "decease partner",
    `6` = "business-trip",
    `7` = "removal",
    `8` = "spring cleaning",
    `9` = "rebuilding",
    `10` = "other"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "other sports"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA25",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "other sports"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see B/C/D/E/BLPHYA39"
  ),
    lphya46 = c(
    `-2` = "na, see B/C/D/E/BLPHYA45",
    `0` = "-to be coded-",
    `1` = "visit from friend/family",
    `2` = "positive activities",
    `3` = "illness partner",
    `4` = "good weather",
    `5` = "decease partner",
    `6` = "business-trip",
    `7` = "removal",
    `8` = "spring cleaning",
    `9` = "rebuilding",
    `10` = "other"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "golf",
    `18` = "other sports"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA25",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "golf",
    `18` = "other sports"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya46 = c(
    `-2` = "na, see B/C/D/E/BLPHYA45",
    `0` = "-to be coded-",
    `1` = "visit from friend/family",
    `2` = "positive activities",
    `3` = "illness partner",
    `4` = "good weather",
    `5` = "decease partner",
    `6` = "business-trip",
    `7` = "removal",
    `8` = "spring cleaning",
    `9` = "rebuilding",
    `10` = "other"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "golf",
    `18` = "other sports"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA25",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "golf",
    `18` = "other sports"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya46 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lphya47 = .replace_labels(
    standardized_value_labels$lphya47,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "na, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "golf",
    `18` = "other sports"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA25",
    `-1` = "na, asked",
    `1` = "distance walking",
    `2` = "distance cycling",
    `3` = "gymnastics",
    `4` = "home trainer",
    `5` = "swimming",
    `6` = "(folk)dancing",
    `7` = "bowling",
    `8` = "tennis",
    `9` = "jogging/running/speed walking",
    `10` = "rowing",
    `11` = "sailing",
    `12` = "billiards",
    `13` = "fishing",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "golf",
    `18` = "other sports"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya46 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lphya47 = .replace_labels(
    standardized_value_labels$lphya47,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "not done, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYASP",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA21",
    `-1` = "na, asked",
    `11` = "walking / hiking: long distance hiking",
    `12` = "walking / hiking: nordic walking",
    `13` = "walking / hiking: speed walking",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA25",
    `-1` = "na, asked",
    `11` = "walking / hiking: long distance hiking",
    `12` = "walking / hiking: nordic walking",
    `13` = "walking / hiking: speed walking",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya46 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lphya47 = .replace_labels(
    standardized_value_labels$lphya47,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  ),
    lphyasp = .replace_labels(
    standardized_value_labels$lphyasp,
    `-2` = "na, see H/B/I/JLPHYA01"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "not done, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYASP",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA21",
    `-1` = "na, asked",
    `11` = "walking / hiking: long distance hiking",
    `12` = "walking / hiking: nordic walking",
    `13` = "walking / hiking: speed walking",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA25",
    `-1` = "na, asked",
    `11` = "walking / hiking: long distance hiking",
    `12` = "walking / hiking: nordic walking",
    `13` = "walking / hiking: speed walking",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya46 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lphya47 = .replace_labels(
    standardized_value_labels$lphya47,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  ),
    lphyasp = .replace_labels(
    standardized_value_labels$lphyasp,
    `-2` = "na, see H/B/I/JLPHYA01"
  ),
    lspin1 = .replace_labels(
    standardized_value_labels$lspin1,
    `-2` = "na, see BLPHYA22 & BLPHYA26"
  ),
    lspin2 = .replace_labels(
    standardized_value_labels$lspin2,
    `-2` = "na, see BLSPIN1"
  ),
    lspin3 = .replace_labels(
    standardized_value_labels$lspin3,
    `-2` = "na, see BLSPIN2"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    lphya07 = .replace_labels(
    standardized_value_labels$lphya07,
    `-5` = "na, interview terminated",
    `-2` = "na, see BLPHYA06"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see BLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see BLPHYA07"
  ),
    lphya11 = c(
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see BLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see BLPHYA11"
  ),
    lphya21 = c(
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(`-3` = "na, wrong skip", `-2` = "na, see BLPHYA21", `-1` = "na, asked"),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see BLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see BLPHYA23"
  ),
    lphya37 = c(
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see BLPHYA36"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "not done, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see ILPHYA01"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYASP",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA21",
    `-1` = "na, asked",
    `11` = "walking / hiking: long distance hiking",
    `12` = "walking / hiking: nordic walking",
    `13` = "walking / hiking: speed walking",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA25",
    `-1` = "na, asked",
    `11` = "walking / hiking: long distance hiking",
    `12` = "walking / hiking: nordic walking",
    `13` = "walking / hiking: speed walking",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya46 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lphya47 = .replace_labels(
    standardized_value_labels$lphya47,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  ),
    lphyasp = .replace_labels(
    standardized_value_labels$lphyasp,
    `-2` = "na, see H/B/I/JLPHYA01"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-3` = "not done, wrong skip"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA06",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya12 = .replace_labels(
    standardized_value_labels$lphya12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17"
  ),
    lphya21 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYASP",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    lphya22 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA21",
    `-1` = "na, asked",
    `11` = "walking / hiking: long distance hiking",
    `12` = "walking / hiking: nordic walking",
    `13` = "walking / hiking: speed walking",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
    lphya23 = .replace_labels(
    standardized_value_labels$lphya23,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21"
  ),
    lphya26 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA25",
    `-1` = "na, asked",
    `11` = "walking / hiking: long distance hiking",
    `12` = "walking / hiking: nordic walking",
    `13` = "walking / hiking: speed walking",
    `21` = "cycling: long distance cycling",
    `22` = "cycling: cycle racing / spinning / mountain biking",
    `23` = "cycling: treadmill at home / cycle ergometer at home",
    `31` = "gymnastics and fitness: gymnastics / exercising at home",
    `32` = "gymnastics and fitness: fitness / physiotherapy training / strength training / gyrotonics",
    `33` = "gymnastics and fitness: yoga / tai chi / qi gong / healing tao",
    `34` = "gymnastics and fitness: endurance training",
    `41` = "swimming: swimming",
    `42` = "swimming: aqua gym / aqua jogging",
    `51` = "racket sports: tennis",
    `52` = "racket sports: table tennis",
    `53` = "racket sports: squash",
    `54` = "racket sports: badminton",
    `61` = "running: running / jogging",
    `71` = "water sports: rowing",
    `72` = "water sports: sailing",
    `73` = "water sports: canoeing",
    `81` = "ball sports: soccer",
    `82` = "ball sports: futsal",
    `83` = "ball sports: hockey",
    `84` = "ball sports: volleyball",
    `85` = "ball sports: basketball",
    `86` = "ball sports: baseball / softball",
    `87` = "ball sports: golf / ball throwing game",
    `88` = "ball sports: bowling / skittles / lawn bowling / kolf / bowls",
    `91` = "winter sports: skiing",
    `92` = "winter sports: cross country skiing",
    `93` = "winter sports: ice skating",
    `101` = "animal sports: horse riding",
    `102` = "animal sports: fishing / pigeon racing",
    `103` = "animal sports: dog training / horse carriage driving",
    `111` = "other sports: climbing",
    `112` = "other sports: billiards / darts",
    `113` = "other sports: (folk) dancing",
    `114` = "other sports: other"
  ),
    lphya27 = .replace_labels(
    standardized_value_labels$lphya27,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya46 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    lphya47 = .replace_labels(
    standardized_value_labels$lphya47,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-2` = "na, see F/G/H/B/I/JLPHYA39"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  ),
    lphyasp = .replace_labels(
    standardized_value_labels$lphyasp,
    `-2` = "na, see H/B/I/JLPHYA01"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "046", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "046", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "046", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "046", waves = .lasa_wave_rows())
)

.lasa_fc_046 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

