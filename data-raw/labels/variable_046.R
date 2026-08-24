## LASA filecode 046 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
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

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    lphya45 = "not normal: other reason",
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    lphya45 = "not normal: other reason",
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    lphya45 = "not normal: other reason",
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    lphya45 = "not normal: other reason",
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    lphya46 = "not normal: other reasons coded"
  ),
  Wave_F_labels = harmonized_labels[c(
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
  )],
  Wave_G_labels = harmonized_labels[c(
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
  )],
  Wave_H_labels = harmonized_labels[c(
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
  )],
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
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
  )],
    lspin1 = "Sport: most intensive sport:"
  ),
  Wave_MB_labels = harmonized_labels[c(
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
  )],
  Wave_I_labels = harmonized_labels[c(
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
  )],
  Wave_J_labels = harmonized_labels[c(
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
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  lphya01 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-3` = "coding category -3",
    `-1` = "not available, asked",
    `1` = "respondent bedridden",
    `2` = "respondent in elec. wheelchair",
    `3` = "respondent in mech. wheelchair",
    `4` = "not 1, 2 or 3"
  ),
  lphya02 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya03 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya04 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya05 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya06 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya07 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya08 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya09 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya10 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya11 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya12 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya13 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya14 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya15 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya16 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya17 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya18 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya19 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya20 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya21 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya22 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
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
    `11` = "coding category 11",
    `12` = "coding category 12",
    `13` = "coding category 13",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "coding category 17",
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
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya24 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya25 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya26 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
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
    `11` = "coding category 11",
    `12` = "coding category 12",
    `13` = "coding category 13",
    `14` = "soccer/basketball/korfball",
    `15` = "volleybal/baseball",
    `16` = "winter sports",
    `17` = "coding category 17",
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
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya28 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya29 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "do not know"
  ),
  lphya30 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya31 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya32 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "do not know",
    `4` = "refusal"
  ),
  lphya33 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya34 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya35 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya36 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "do not know",
    `4` = "refusal"
  ),
  lphya37 = c(
    `-5` = "not available, interview terminated",
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya38 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lphya39 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lphya40 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya41 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya42 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya43 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya44 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya45 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya46 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "ordinal category 0",
    `1` = "ordinal category 1",
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
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya48 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya49 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lphya50 = c(
    `-2` = "not available, routing",
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
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lspin1 = c(
    `-3` = "most intensive",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
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
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lspin3 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/BLPHYA39",
    `-1` = "na, asked"
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
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/BLPHYA39",
    `-1` = "na, asked"
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
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/BLPHYA39",
    `-1` = "na, asked"
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
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/BLPHYA39",
    `-1` = "na, asked"
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
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
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
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya29 = .replace_labels(
    standardized_value_labels$lphya29,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA21",
    `-1` = "na, asked"
  ),
    lphya30 = .replace_labels(
    standardized_value_labels$lphya30,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/GLPHYA29",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "not done, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  ),
    lphyasp = .replace_labels(
    standardized_value_labels$lphyasp,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA01",
    `-1` = "na, asked"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "not done, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya14 = .replace_labels(
    standardized_value_labels$lphya14,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA01",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya16 = .replace_labels(
    standardized_value_labels$lphya16,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA15",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya20 = .replace_labels(
    standardized_value_labels$lphya20,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  ),
    lphyasp = .replace_labels(
    standardized_value_labels$lphyasp,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lspin1 = .replace_labels(
    standardized_value_labels$lspin1,
    `-2` = "na, see BLPHYA22 & BLPHYA26",
    `-1` = "na, asked"
  ),
    lspin2 = .replace_labels(
    standardized_value_labels$lspin2,
    `-3` = "na, wrong skip",
    `-2` = "na, see BLSPIN1",
    `-1` = "na, asked"
  ),
    lspin3 = .replace_labels(
    standardized_value_labels$lspin3,
    `-3` = "na, wrong skip",
    `-2` = "na, see BLSPIN2",
    `-1` = "na, asked"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    lphya07 = .replace_labels(
    standardized_value_labels$lphya07,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BLPHYA06",
    `-1` = "na, asked"
  ),
    lphya08 = .replace_labels(
    standardized_value_labels$lphya08,
    `-3` = "na, wrong skip",
    `-2` = "na, see BLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see BLPHYA07",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see BLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see BLPHYA11",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see BLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see BLPHYA23",
    `-1` = "na, asked"
  ),
    lphya37 = c(
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see BLPHYA36",
    `-1` = "na, asked"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "not done, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see ILPHYA01",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  ),
    lphyasp = .replace_labels(
    standardized_value_labels$lphyasp,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA01",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    lphya01 = .replace_labels(
    standardized_value_labels$lphya01,
    `-5` = "na, interview terminated",
    `-4` = "na, short interview",
    `-3` = "not done, wrong skip",
    `-1` = "na, asked"
  ),
    lphya02 = .replace_labels(
    standardized_value_labels$lphya02,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya03 = .replace_labels(
    standardized_value_labels$lphya03,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA02",
    `-1` = "na, asked"
  ),
    lphya04 = .replace_labels(
    standardized_value_labels$lphya04,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya05 = .replace_labels(
    standardized_value_labels$lphya05,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA03",
    `-1` = "na, asked"
  ),
    lphya06 = .replace_labels(
    standardized_value_labels$lphya06,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya09 = .replace_labels(
    standardized_value_labels$lphya09,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA07",
    `-1` = "na, asked"
  ),
    lphya10 = .replace_labels(
    standardized_value_labels$lphya10,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya13 = .replace_labels(
    standardized_value_labels$lphya13,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA11",
    `-1` = "na, asked"
  ),
    lphya15 = .replace_labels(
    standardized_value_labels$lphya15,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/BLPHYA14",
    `-1` = "na, asked"
  ),
    lphya17 = .replace_labels(
    standardized_value_labels$lphya17,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA15",
    `-1` = "na, asked"
  ),
    lphya18 = .replace_labels(
    standardized_value_labels$lphya18,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
  ),
    lphya19 = .replace_labels(
    standardized_value_labels$lphya19,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA17",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
  ),
    lphya24 = .replace_labels(
    standardized_value_labels$lphya24,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA23",
    `-1` = "na, asked"
  ),
    lphya25 = .replace_labels(
    standardized_value_labels$lphya25,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA21",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA25",
    `-1` = "na, asked"
  ),
    lphya28 = .replace_labels(
    standardized_value_labels$lphya28,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA27",
    `-1` = "na, asked"
  ),
    lphya31 = .replace_labels(
    standardized_value_labels$lphya31,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya32 = .replace_labels(
    standardized_value_labels$lphya32,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA31",
    `-1` = "na, asked"
  ),
    lphya33 = .replace_labels(
    standardized_value_labels$lphya33,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya34 = .replace_labels(
    standardized_value_labels$lphya34,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA32",
    `-1` = "na, asked"
  ),
    lphya35 = .replace_labels(
    standardized_value_labels$lphya35,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya36 = .replace_labels(
    standardized_value_labels$lphya36,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA35",
    `-1` = "na, asked"
  ),
    lphya37 = c(`-3` = "na, wrong skip", `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36", `-1` = "na, asked"),
    lphya38 = .replace_labels(
    standardized_value_labels$lphya38,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA36",
    `-1` = "na, asked"
  ),
    lphya39 = .replace_labels(
    standardized_value_labels$lphya39,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA01",
    `-1` = "na, asked"
  ),
    lphya40 = .replace_labels(
    standardized_value_labels$lphya40,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya41 = .replace_labels(
    standardized_value_labels$lphya41,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya42 = .replace_labels(
    standardized_value_labels$lphya42,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya43 = .replace_labels(
    standardized_value_labels$lphya43,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya44 = .replace_labels(
    standardized_value_labels$lphya44,
    `-3` = "na, wrong skip",
    `-2` = "na, see B/C/D/E/B/F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya45 = .replace_labels(
    standardized_value_labels$lphya45,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
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
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya48 = .replace_labels(
    standardized_value_labels$lphya48,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya49 = .replace_labels(
    standardized_value_labels$lphya49,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/B/I/JLPHYA39",
    `-1` = "na, asked"
  ),
    lphya50 = .replace_labels(
    standardized_value_labels$lphya50,
    `-2` = "na, see F/G/H/B/I/JLPHYA49"
  ),
    lphyasp = .replace_labels(
    standardized_value_labels$lphyasp,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JLPHYA01",
    `-1` = "na, asked"
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

.lasa_fc_046 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "046", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "046", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "046", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "046", waves = .lasa_wave_rows())
)
