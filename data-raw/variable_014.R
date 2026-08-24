## LASA filecode 014 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  fdoor = "Floor of front door",
  fdoorc = "Floor of front door: constructed",
  hindep = "OBSERVATION: type of housing",
  housem = "Type of housing: moved since last interview",
  houstyp = "Type of housing",
  hwhacc = "House accessible by wheelchair",
  lrooms = "All rooms on the same floor",
  momonth = "Month moved to current residence",
  moved = "Moved since last interview",
  moyear = "Year moved to current residence",
  nrooms = "Number of rooms in house",
  nroomsc = "Number of rooms: constructed",
  ospec1 = "Other special adjustments: for wheel chair users",
  ospec2 = "Other special adjustments: for deaf people",
  ospec3 = "Other special adjustments: faucets",
  ospec4 = "Other special adjustments: chair lift",
  ospec5 = "Other special adjustments:chairs",
  ospec6 = "Other special adjustments: other, documented",
  rfdoor = "How to reach front door",
  satis = "How (dis)satisfied with housing condition",
  satis01 = "Dissatisfied: House is too big",
  satis02 = "Dissatisfied: House is too small",
  satis03 = "Dissatisfied: House is in bad condition",
  satis04 = "Dissatisfied: Rooms in house not on the same floor",
  satis05 = "Dissatisfied: House can only be reached by stairs",
  satis06 = "Dissatisfied: Doorsteps in house too high",
  satis07 = "Dissatisfied: House is too expensive",
  satis08 = "Dissatisfied: House is vulnerable to burglar",
  satis09 = "Dissatisfied: other reason",
  spec01 = "Specially adjusted: telephone eg. amplified sound",
  spec02 = "Specially adjusted: lowered doorstep",
  spec03 = "Specially adjusted: alarm system",
  spec04 = "Specially adjusted: handgrips/handrails or supports",
  spec05 = "Specially adjusted: lowered/raised draining board",
  spec06 = "Specially adjusted: stair elevator",
  spec07 = "Specially adjusted: bedrooms same floor level",
  spec08 = "Specially adjusted: adjusted or raised toilet",
  spec09 = "Specially adjusted: lowered/raised washbasin",
  spec1 = "Special adjustment: lowered or no doorstep",
  spec10 = "Special housing adjustment",
  spec11 = "Specially adjusted: seating equipment in bathroom",
  spec12 = "Specially adjusted: raised bed",
  spec13 = "Specially adjusted: handgrip above bed",
  spec14 = "Specially adjusted: extra handrails inside the house",
  spec15 = "Specially adjusted: extra handrails outside the house",
  spec16 = "Specially adjusted: sloping ramp to pavement",
  spec17 = "Specially adjusted: other",
  spec2 = "Special adjustment: adjusted toilet, supports, handgrips",
  spec3 = "Special adjustment: non-skid in bathroom, seating equipment",
  spec4 = "Special adjustment: bedroom on same floor",
  spec5 = "Special adjustment: sloping ramp to pavement",
  spec6 = "Special adjustment: adjusted sink cupboards kitchen",
  spec7 = "Special adjustment: fall alarm",
  spec8 = "Special adjustment: stair elevator",
  spec9 = "Special housing adjustment",
  specadj = "House has special adjustments/adaptation",
  specwho = "Special adjustment: for who"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "satis01",
    "satis02",
    "satis03",
    "satis04",
    "satis05",
    "satis06",
    "satis07",
    "satis08",
    "satis09",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last interview: month",
    moyear = "Moved since last interview: year",
    nrooms = "# rooms in house",
    nroomsc = "# rooms: constructed",
    spec01 = "Specially adjusted: telephone e.g. amplified sound",
    spec04 = "Specially adjusted: handgrips or supports",
    spec10 = "Specially adjusted: non-skid in bathroom",
    spec12 = "spec. adjust: raised bed"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last int: month",
    moyear = "Moved since last int: year",
    nrooms = "# rooms in house",
    nroomsc = "# rooms: constructed",
    spec10 = "Specially adjusted: non-skid in bathroom"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last int: month",
    moyear = "Moved since last int: year",
    nrooms = "# rooms in house",
    nroomsc = "# rooms: constructed",
    spec10 = "Specially adjusted: non-skid in bathroom"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last int: month",
    moyear = "Moved since last int: year",
    nrooms = "# rooms in house",
    nroomsc = "# rooms: constructed",
    spec10 = "Specially adjusted: non-skid in bathroom"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
    "fdoor",
    "hindep",
    "houstyp",
    "lrooms",
    "momonth",
    "moyear",
    "nrooms",
    "ospec1",
    "ospec2",
    "ospec3",
    "ospec4",
    "ospec5",
    "ospec6",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    momonth = "Moved to current residence: month",
    moyear = "Moved to current residence: year",
    spec04 = "Specially adjusted: handgrips or supports",
    spec10 = "Specially adjusted: non-skid in bathroom"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last int: month",
    moyear = "Moved since last int: year",
    nrooms = "# rooms in house",
    nroomsc = "# rooms: constructed",
    spec10 = "Specially adjusted: non-skid in bathroom"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last int: month",
    moyear = "Moved since last int: year",
    nrooms = "# rooms in house",
    nroomsc = "# rooms: constructed",
    spec10 = "Specially adjusted: non-skid in bathroom"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c(
    "hindep",
    "housem",
    "houstyp",
    "hwhacc",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "satis",
    "spec1",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last int: month",
    moyear = "Moved since last int: year",
    nrooms = "# rooms in house",
    nroomsc = "# rooms: constructed",
    spec1 = "Spec. adjust: lowered or no doorstep",
    spec2 = "Spec. adjust: adjusted toilet, supports, handgrips",
    spec3 = "Spec. adjust: non-skid in bathroom, seating equip",
    spec4 = "Spec. adjust: bedroom on same floor",
    spec5 = "Spec. adjust: sloping ramp to pavement",
    spec6 = "Spec. adjust: adjusted sink cupboards kitchen",
    spec7 = "Spec. adjust: fall alarm",
    spec8 = "Spec. adjust: stair elevator",
    spec9 = "Spec. adjust: other",
    specwho = "Spec. adjust: for who"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
    "hindep",
    "houstyp",
    "hwhacc",
    "momonth",
    "moyear",
    "satis",
    "spec1",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    momonth = "Moved to current residence: month",
    moyear = "Moved to current residence: year",
    spec1 = "Spec. adjust: lowered or no doorstep",
    spec2 = "Spec. adjust: adjusted toilet, supports, handgrips",
    spec3 = "Spec. adjust: non-skid in bathroom, seating equip",
    spec4 = "Spec. adjust: bedroom on same floor",
    spec5 = "Spec. adjust: sloping ramp to pavement",
    spec6 = "Spec. adjust: adjusted sink cupboards kitchen",
    spec7 = "Spec. adjust: fall alarm",
    spec8 = "Spec. adjust: stair elevator",
    spec9 = "Spec. adjust: other",
    specwho = "Spec. adjust: for who"
  ),
  Wave_MB_labels = harmonized_labels[c("hindep")],
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "hindep",
    "housem",
    "houstyp",
    "hwhacc",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "satis",
    "spec1",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last int: month",
    moyear = "Moved since last int: year",
    nrooms = "# rooms in house",
    spec1 = "Spec. adjust: lowered or no doorstep",
    spec2 = "Spec. adjust: adjusted toilet, supports, handgrips",
    spec3 = "Spec. adjust: non-skid in bathroom, seating equipment",
    spec4 = "Spec. adjust: bedroom on same floor",
    spec5 = "Spec. adjust: sloping ramp to pavement",
    spec6 = "Spec. adjust: adjusted sink cupboards kitchen",
    spec7 = "Spec. adjust: fall alarm",
    spec8 = "Spec. adjust: stair elevator",
    spec9 = "Spec. adjust: other",
    specadj = "House has special adjustments / adaptation",
    specwho = "Spec. adjust: for who"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "hindep",
    "housem",
    "houstyp",
    "hwhacc",
    "momonth",
    "moved",
    "moyear",
    "satis",
    "spec1",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last int: month",
    moyear = "Moved since last int: year",
    spec1 = "Spec. adjust: lowered or no doorstep",
    spec2 = "Spec. adjust: adjusted toilet, supports, handgrips",
    spec3 = "Spec. adjust: non-skid in bathroom, seating equipment",
    spec4 = "Spec. adjust: bedroom on same floor",
    spec5 = "Spec. adjust: sloping ramp to pavement",
    spec6 = "Spec. adjust: adjusted sink cupboards kitchen",
    spec7 = "Spec. adjust: fall alarm",
    spec8 = "Spec. adjust: stair elevator",
    spec9 = "Spec. adjust: other",
    specadj = "House has special adjustments / adaptation",
    specwho = "Spec. adjust: for who"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c(
    "hindep",
    "housem",
    "houstyp",
    "hwhacc",
    "momonth",
    "moved",
    "moyear",
    "satis",
    "spec1",
    "spec10",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    houstyp = "Type of housing: constructed",
    momonth = "Moved since last int: month",
    moyear = "Moved since last int: year",
    spec1 = "Spec. adjust: lowered or no doorstep",
    spec10 = "Spec. adjust: other",
    spec2 = "Spec. adjust: adjusted toilet, supports, handgrips",
    spec3 = "Spec. adjust: non-skid in bathroom, seating equipment",
    spec4 = "Spec. adjust: bedroom on same floor",
    spec5 = "Spec. adjust: sloping ramp to pavement",
    spec6 = "Spec. adjust: adjusted sink cupboards kitchen",
    spec7 = "Spec. adjust: fall alarm",
    spec8 = "Spec. adjust: stair elevator",
    spec9 = "Spec. adjust: sensors to monitor movement",
    specadj = "House has special adjustments / adaptation",
    specwho = "Spec. adjust: for who"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  fdoor = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available"
  ),
  fdoorc = c(`-3` = "monastery", `-2` = "institution", `-1` = "unknown"),
  hindep = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available",
    `-1` = "not available, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `7` = "other",
    `8` = "monastery"
  ),
  housem = c(
    `-5` = "not available, routing",
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "housing type category 1",
    `2` = "housing type category 2",
    `3` = "housing type category 3",
    `4` = "housing type category 4",
    `5` = "housing type category 5",
    `6` = "housing type category 6",
    `7` = "housing type category 7",
    `8` = "housing type category 8",
    `9` = "housing type category 9",
    `10` = "housing type category 10",
    `11` = "housing type category 11",
    `12` = "housing type category 12",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other"
  ),
  houstyp = c(
    `-4` = "not available",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "unknown",
    `1` = "housing type category 1",
    `2` = "housing type category 2",
    `3` = "housing type category 3",
    `4` = "housing type category 4",
    `5` = "housing type category 5",
    `6` = "housing type category 6",
    `7` = "housing type category 7",
    `8` = "housing type category 8",
    `9` = "housing type category 9",
    `10` = "housing type category 10",
    `11` = "housing type category 11",
    `12` = "housing type category 12",
    `13` = "housing type category 13",
    `14` = "housing type category 14",
    `15` = "other",
    `16` = "institution",
    `17` = "monastery"
  ),
  hwhacc = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "yes",
    `2` = "only with help",
    `3` = "no"
  ),
  lrooms = c(
    `-5` = "not available, routing",
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  momonth = c(
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  moved = c(
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "yes, temporarily living elsewhere",
    `4` = "lived temporarily elsewhere"
  ),
  moyear = c(
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  nrooms = c(
    `-5` = "not available, routing",
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available"
  ),
  nroomsc = c(`-3` = "monastery", `-2` = "institution", `-1` = "unknown"),
  ospec1 = c(`-2` = "not available, routing", `0` = "no", `1` = "yes"),
  ospec2 = c(`-2` = "not available, routing", `0` = "no", `1` = "yes"),
  ospec3 = c(`-2` = "not available, routing", `0` = "no", `1` = "yes"),
  ospec4 = c(`-2` = "not available, routing", `0` = "no", `1` = "yes"),
  ospec5 = c(`-2` = "not available, routing", `0` = "no", `1` = "yes"),
  ospec6 = c(`-2` = "not available, routing", `0` = "no", `1` = "yes"),
  rfdoor = c(
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available",
    `1` = "only stairs",
    `2` = "elevator present",
    `3` = "other"
  ),
  satis = c(
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
  satis01 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  satis02 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  satis03 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  satis04 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  satis05 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  satis06 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  satis07 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  satis08 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  satis09 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  spec01 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec02 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec03 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec04 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec05 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec06 = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec07 = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec08 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec09 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec1 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  spec10 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "special housing adjustment category 1",
    `2` = "mentioned"
  ),
  spec11 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec12 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec13 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec14 = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec15 = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec16 = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec17 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "binary category 1",
    `2` = "mentioned"
  ),
  spec2 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  spec3 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  spec4 = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  spec5 = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  spec6 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  spec7 = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  spec8 = c(
    `-5` = "not available, routing",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  spec9 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  specadj = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "binary category 1",
    `2` = "yes"
  ),
  specwho = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "for respondent",
    `2` = "for (former) inmate",
    `3` = "for both",
    `4` = "for none, already present"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "satis01",
    "satis02",
    "satis03",
    "satis04",
    "satis05",
    "satis06",
    "satis07",
    "satis08",
    "satis09",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    fdoor = .replace_labels(
    standardized_value_labels$fdoor,
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVED",
    `-1` = "na"
  ),
    hindep = c(
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery (added)"
  ),
    housem = .replace_labels(
    standardized_value_labels$housem,
    `-5` = "na, see BHINDEP",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVED",
    `-1` = "na, asked",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm"
  ),
    houstyp = c(
    `-1` = "unknown",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other",
    `16` = "institution",
    `17` = "monastery"
  ),
    lrooms = .replace_labels(
    standardized_value_labels$lrooms,
    `-5` = "na, see BHINDEP",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVED",
    `-1` = "na"
  ),
    momonth = .replace_labels(
    standardized_value_labels$momonth,
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVED",
    `-1` = "na, asked"
  ),
    moved = c(`1` = "no", `2` = "yes"),
    moyear = .replace_labels(
    standardized_value_labels$moyear,
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVED",
    `-1` = "na, asked"
  ),
    nrooms = .replace_labels(
    standardized_value_labels$nrooms,
    `-5` = "na, see BHINDEP",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVED",
    `-1` = "na"
  ),
    rfdoor = c(
    `-4` = "na, short version",
    `-2` = "na, see BFDOOR",
    `-1` = "na",
    `1` = "only stairs",
    `2` = "elevator present",
    `3` = "other"
  ),
    satis = .replace_labels(
    standardized_value_labels$satis,
    `-4` = "na, short version",
    `-3` = "wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `2` = "no satisfied/dissatisfy"
  ),
    satis01 = .replace_labels(
    standardized_value_labels$satis01,
    `-2` = "na, see BSATIS",
    `-1` = "na, asked"
  ),
    satis02 = .replace_labels(
    standardized_value_labels$satis02,
    `-2` = "na, see BSATIS",
    `-1` = "na, asked"
  ),
    satis03 = .replace_labels(
    standardized_value_labels$satis03,
    `-2` = "na, see BSATIS",
    `-1` = "na, asked"
  ),
    satis04 = .replace_labels(
    standardized_value_labels$satis04,
    `-2` = "na, see BSATIS",
    `-1` = "na, asked"
  ),
    satis05 = .replace_labels(
    standardized_value_labels$satis05,
    `-2` = "na, see BSATIS",
    `-1` = "na, asked"
  ),
    satis06 = .replace_labels(
    standardized_value_labels$satis06,
    `-2` = "na, see BSATIS",
    `-1` = "na, asked"
  ),
    satis07 = .replace_labels(
    standardized_value_labels$satis07,
    `-2` = "na, see BSATIS",
    `-1` = "na, asked"
  ),
    satis08 = .replace_labels(
    standardized_value_labels$satis08,
    `-2` = "na, see BSATIS",
    `-1` = "na, asked"
  ),
    satis09 = .replace_labels(
    standardized_value_labels$satis09,
    `-2` = "na, see BSATIS",
    `-1` = "na, asked"
  ),
    spec01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec06 = c(
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec07 = c(
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec14 = c(
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec15 = c(
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec16 = c(
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    specadj = c(`-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    fdoor = .replace_labels(
    standardized_value_labels$fdoor,
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    hindep = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    housem = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other (documented)"
  ),
    houstyp = c(
    `-1` = "unknown",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other",
    `16` = "institution",
    `17` = "monastery"
  ),
    lrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    moved = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    nrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    rfdoor = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GFDOOR",
    `-1` = "na, asked",
    `1` = "only stairs",
    `2` = "elevator present",
    `3` = "other"
  ),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec06 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec07 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec14 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec15 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec16 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    fdoor = .replace_labels(
    standardized_value_labels$fdoor,
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    hindep = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    housem = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other (documented)"
  ),
    houstyp = c(
    `-1` = "unknown",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other",
    `16` = "institution",
    `17` = "monastery"
  ),
    lrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    moved = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    nrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    rfdoor = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GFDOOR",
    `-1` = "na, asked",
    `1` = "only stairs",
    `2` = "elevator present",
    `3` = "other"
  ),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec06 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec07 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec14 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec15 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec16 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    fdoor = .replace_labels(
    standardized_value_labels$fdoor,
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    hindep = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    housem = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other (documented)"
  ),
    houstyp = c(
    `-3` = "na, wrong skip",
    `-1` = "unknown",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other",
    `16` = "institution",
    `17` = "monastery"
  ),
    lrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    moved = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    nrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    rfdoor = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GFDOOR",
    `-1` = "na, asked",
    `1` = "only stairs",
    `2` = "elevator present",
    `3` = "other"
  ),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec06 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec07 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec14 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec15 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec16 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "fdoor",
    "hindep",
    "houstyp",
    "lrooms",
    "momonth",
    "moyear",
    "nrooms",
    "ospec1",
    "ospec2",
    "ospec3",
    "ospec4",
    "ospec5",
    "ospec6",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    fdoor = c(`-3` = "wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked"),
    hindep = c(
    `-2` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h- somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery (added)"
  ),
    houstyp = c(
    `-2` = "na, see BHINDEP",
    `-1` = "unknown",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other",
    `16` = "institution",
    `17` = "monastery"
  ),
    lrooms = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHINDEP",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked"),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked"),
    nrooms = c(`-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked"),
    ospec1 = .replace_labels(
    standardized_value_labels$ospec1,
    `-2` = "na, see BSPEC17"
  ),
    ospec2 = .replace_labels(
    standardized_value_labels$ospec2,
    `-2` = "na, see BSPEC17"
  ),
    ospec3 = .replace_labels(
    standardized_value_labels$ospec3,
    `-2` = "na, see BSPEC17"
  ),
    ospec4 = .replace_labels(
    standardized_value_labels$ospec4,
    `-2` = "na, see BSPEC17"
  ),
    ospec5 = .replace_labels(
    standardized_value_labels$ospec5,
    `-2` = "na, see BSPEC17"
  ),
    ospec6 = .replace_labels(
    standardized_value_labels$ospec6,
    `-2` = "na, see BSPEC17"
  ),
    rfdoor = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BFDOOR",
    `-1` = "na, asked",
    `1` = "only stairs",
    `2` = "elevator present",
    `3` = "other"
  ),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHINDEP",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec16 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    spec17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHINDEP",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    fdoor = .replace_labels(
    standardized_value_labels$fdoor,
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    hindep = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    housem = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other (documented)"
  ),
    houstyp = c(
    `-3` = "na, wrong skip",
    `-1` = "unknown",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other",
    `16` = "institution",
    `17` = "monastery"
  ),
    lrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    moved = .replace_labels(
    standardized_value_labels$moved,
    `-1` = "na, asked"
  ),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    nrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    rfdoor = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GFDOOR",
    `-1` = "na, asked",
    `1` = "only stairs",
    `2` = "elevator present",
    `3` = "other"
  ),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec06 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec07 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec14 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec15 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec16 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "fdoor",
    "fdoorc",
    "hindep",
    "housem",
    "houstyp",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "rfdoor",
    "satis",
    "spec01",
    "spec02",
    "spec03",
    "spec04",
    "spec05",
    "spec06",
    "spec07",
    "spec08",
    "spec09",
    "spec10",
    "spec11",
    "spec12",
    "spec13",
    "spec14",
    "spec15",
    "spec16",
    "spec17",
    "specadj"
  )],
    fdoor = .replace_labels(
    standardized_value_labels$fdoor,
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    hindep = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    housem = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other (documented)"
  ),
    houstyp = c(
    `-3` = "na, wrong skip",
    `-1` = "unknown",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "low-level apt building",
    `7` = "ground floor apartment",
    `8` = "apt build elderly (elevator)",
    `9` = "home elderly (street level)",
    `10` = "service flat (home elderly)",
    `11` = "semi-independent",
    `12` = "farm",
    `13` = "houseboat",
    `14` = "commune",
    `15` = "other",
    `16` = "institution",
    `17` = "monastery"
  ),
    lrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    moved = .replace_labels(
    standardized_value_labels$moved,
    `-1` = "na, asked"
  ),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GMOVED", `-1` = "na, asked"),
    nrooms = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked"
  ),
    rfdoor = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GFDOOR",
    `-1` = "na, asked",
    `1` = "only stairs",
    `2` = "elevator present",
    `3` = "other"
  ),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec01 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec06 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec07 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec14 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec15 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec16 = c(
    `-5` = "na, see C/D/E/F/GHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec17 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/GMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "hindep",
    "housem",
    "houstyp",
    "hwhacc",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "nroomsc",
    "satis",
    "spec1",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    hindep = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see HMOVED",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    housem = c(
    `-5` = "na, see HHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see HMOVED",
    `-1` = "na, asked",
    `1` = "attached row or semi-detached",
    `2` = "detached",
    `3` = "high rise (elevator)",
    `4` = "high rise (no elevator)",
    `5` = "ground floor apartment",
    `6` = "apt build elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "semi-independent",
    `9` = "farm / corporate housing",
    `10` = "houseboat",
    `11` = "other (documented)"
  ),
    houstyp = c(
    `-3` = "na, wrong skip",
    `-1` = "unknown",
    `1` = "attached row or semi-detached",
    `2` = "detached",
    `3` = "high rise (elevator)",
    `4` = "high rise (no elevator)",
    `5` = "ground floor apartment",
    `6` = "apt build elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "semi-independent",
    `9` = "farm / corporate housing",
    `10` = "houseboat",
    `11` = "other",
    `12` = "institution",
    `13` = "monastery"
  ),
    hwhacc = c(
    `-5` = "na, see HHINDEP",
    `-2` = "na, see HMOVED",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "only with help",
    `3` = "no"
  ),
    lrooms = c(
    `-5` = "na, see HHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see HMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked"),
    moved = .replace_labels(
    standardized_value_labels$moved,
    `-1` = "na, asked"
  ),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked"),
    nrooms = c(
    `-5` = "na, see HHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see HMOVED",
    `-1` = "na, asked"
  ),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec1 = .replace_labels(
    standardized_value_labels$spec1,
    `-3` = "na, wrong skip",
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked"
  ),
    spec2 = .replace_labels(
    standardized_value_labels$spec2,
    `-3` = "na, wrong skip",
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked"
  ),
    spec3 = .replace_labels(
    standardized_value_labels$spec3,
    `-3` = "na, wrong skip",
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked"
  ),
    spec4 = .replace_labels(
    standardized_value_labels$spec4,
    `-5` = "na, see HHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked"
  ),
    spec5 = .replace_labels(
    standardized_value_labels$spec5,
    `-5` = "na, see HHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked"
  ),
    spec6 = .replace_labels(
    standardized_value_labels$spec6,
    `-3` = "na, wrong skip",
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked"
  ),
    spec7 = .replace_labels(
    standardized_value_labels$spec7,
    `-5` = "na, see HHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked"
  ),
    spec8 = .replace_labels(
    standardized_value_labels$spec8,
    `-5` = "na, see HHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked"
  ),
    spec9 = .replace_labels(
    standardized_value_labels$spec9,
    `-3` = "na, wrong skip",
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked"
  ),
    specadj = c(`-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    specwho = c(
    `-2` = "na, see HSPECADJ",
    `-1` = "na, asked",
    `1` = "for respondent",
    `2` = "for (former) inmate",
    `3` = "for both",
    `4` = "for none, already present"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "hindep",
    "houstyp",
    "hwhacc",
    "momonth",
    "moyear",
    "satis",
    "spec1",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    hindep = c(
    `-3` = "na, wrong skip",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    houstyp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHINDEP",
    `-1` = "unknown",
    `1` = "attached row or semi-detached",
    `2` = "detached",
    `3` = "high rise (elevator)",
    `4` = "high rise (no elevator)",
    `5` = "ground floor apartment",
    `6` = "apt build elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "semi-independent",
    `9` = "farm / corporate housing",
    `10` = "houseboat",
    `11` = "housing with communal facilities",
    `12` = "other",
    `13` = "institution",
    `14` = "monastery"
  ),
    hwhacc = .replace_labels(
    standardized_value_labels$hwhacc,
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHINDEP",
    `-1` = "na, asked"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked"),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked"),
    satis = c(
    `-3` = "na, wrong skip",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec1 = .replace_labels(
    standardized_value_labels$spec1,
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked"
  ),
    spec2 = .replace_labels(
    standardized_value_labels$spec2,
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked"
  ),
    spec3 = .replace_labels(
    standardized_value_labels$spec3,
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked"
  ),
    spec4 = .replace_labels(
    standardized_value_labels$spec4,
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked"
  ),
    spec5 = .replace_labels(
    standardized_value_labels$spec5,
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked"
  ),
    spec6 = .replace_labels(
    standardized_value_labels$spec6,
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked"
  ),
    spec7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec8 = .replace_labels(
    standardized_value_labels$spec8,
    `-5` = "na, see BHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked"
  ),
    spec9 = .replace_labels(
    standardized_value_labels$spec9,
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHINDEP",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    specwho = .replace_labels(
    standardized_value_labels$specwho,
    `-3` = "na, wrong skip",
    `-2` = "na, see BSPECADJ",
    `-1` = "na, asked"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("hindep")],
    hindep = c(
    `-3` = "na, wrong skip",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `7` = "other"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "hindep",
    "housem",
    "houstyp",
    "hwhacc",
    "lrooms",
    "momonth",
    "moved",
    "moyear",
    "nrooms",
    "satis",
    "spec1",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    hindep = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    housem = c(
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked",
    `1` = "attached row or semi-detached",
    `2` = "detached",
    `3` = "high rise (elevator)",
    `4` = "high rise (no elevator)",
    `5` = "ground floor apartment",
    `6` = "apt build elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "semi-independent",
    `9` = "farm / corporate housing",
    `10` = "houseboat",
    `11` = "housing with communal facilities",
    `12` = "other (documented"
  ),
    houstyp = c(
    `-4` = "na, previous interview telephonic",
    `-3` = "na, wrong skip",
    `-1` = "unknown",
    `1` = "attached row or semi-detached",
    `2` = "detached",
    `3` = "high rise (elevator)",
    `4` = "high rise (no elevator)",
    `5` = "ground floor apartment",
    `6` = "apt build elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "semi-independent",
    `9` = "farm / corporate housing",
    `10` = "houseboat",
    `11` = "housing with communal facilities",
    `12` = "other",
    `13` = "institution",
    `14` = "monastery"
  ),
    hwhacc = .replace_labels(
    standardized_value_labels$hwhacc,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked"
  ),
    lrooms = c(
    `-5` = "na, see IHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see IMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMOVED", `-1` = "na, asked"),
    moved = .replace_labels(
    standardized_value_labels$moved,
    `-1` = "na, asked"
  ),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMOVED", `-1` = "na, asked"),
    nrooms = c(
    `-5` = "na, see IHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see IMOVED",
    `-1` = "na, asked"
  ),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec1 = .replace_labels(
    standardized_value_labels$spec1,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec2 = .replace_labels(
    standardized_value_labels$spec2,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec3 = .replace_labels(
    standardized_value_labels$spec3,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec4 = .replace_labels(
    standardized_value_labels$spec4,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec5 = .replace_labels(
    standardized_value_labels$spec5,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec6 = .replace_labels(
    standardized_value_labels$spec6,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec8 = .replace_labels(
    standardized_value_labels$spec8,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec9 = .replace_labels(
    standardized_value_labels$spec9,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JSPECADJ",
    `-1` = "na, asked"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    specwho = .replace_labels(
    standardized_value_labels$specwho,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "hindep",
    "housem",
    "houstyp",
    "hwhacc",
    "momonth",
    "moved",
    "moyear",
    "satis",
    "spec1",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    hindep = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    housem = c(
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked",
    `1` = "attached row or semi-detached",
    `2` = "detached",
    `3` = "high rise (elevator)",
    `4` = "high rise (no elevator)",
    `5` = "ground floor apartment",
    `6` = "apt build elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "semi-independent",
    `9` = "farm / corporate housing",
    `10` = "houseboat",
    `11` = "housing with communal facilities",
    `12` = "other (documented"
  ),
    houstyp = c(
    `-4` = "na, previous interview telephonic",
    `-3` = "na, wrong skip",
    `-1` = "unknown",
    `1` = "attached row or semi-detached",
    `2` = "detached",
    `3` = "high rise (elevator)",
    `4` = "high rise (no elevator)",
    `5` = "ground floor apartment",
    `6` = "apt build elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "semi-independent",
    `9` = "farm / corporate housing",
    `10` = "houseboat",
    `11` = "housing with communal facilities",
    `12` = "other",
    `13` = "institution",
    `14` = "monastery"
  ),
    hwhacc = .replace_labels(
    standardized_value_labels$hwhacc,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMOVED", `-1` = "na, asked"),
    moved = .replace_labels(
    standardized_value_labels$moved,
    `-1` = "na, asked"
  ),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMOVED", `-1` = "na, asked"),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec1 = .replace_labels(
    standardized_value_labels$spec1,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec2 = .replace_labels(
    standardized_value_labels$spec2,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec3 = .replace_labels(
    standardized_value_labels$spec3,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec4 = .replace_labels(
    standardized_value_labels$spec4,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec5 = .replace_labels(
    standardized_value_labels$spec5,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec6 = .replace_labels(
    standardized_value_labels$spec6,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec8 = .replace_labels(
    standardized_value_labels$spec8,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec9 = .replace_labels(
    standardized_value_labels$spec9,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JSPECADJ",
    `-1` = "na, asked"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    specwho = .replace_labels(
    standardized_value_labels$specwho,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "hindep",
    "housem",
    "houstyp",
    "hwhacc",
    "momonth",
    "moved",
    "moyear",
    "satis",
    "spec1",
    "spec10",
    "spec2",
    "spec3",
    "spec4",
    "spec5",
    "spec6",
    "spec7",
    "spec8",
    "spec9",
    "specadj",
    "specwho"
  )],
    hindep = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing h-somatic",
    `4` = "nursing h-psych",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
    housem = c(
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked",
    `1` = "attached row or semi-detached",
    `2` = "detached",
    `3` = "high rise (elevator)",
    `4` = "high rise (no elevator)",
    `5` = "ground floor apartment",
    `6` = "apt build elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "semi-independent",
    `9` = "farm / corporate housing",
    `10` = "houseboat",
    `11` = "housing with communal facilities",
    `12` = "other (documented"
  ),
    houstyp = c(
    `-4` = "na, previous interview telephonic",
    `-3` = "na, wrong skip",
    `-1` = "unknown",
    `1` = "attached row or semi-detached",
    `2` = "detached",
    `3` = "high rise (elevator)",
    `4` = "high rise (no elevator)",
    `5` = "ground floor apartment",
    `6` = "apt build elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "semi-independent",
    `9` = "farm / corporate housing",
    `10` = "houseboat",
    `11` = "housing with communal facilities",
    `12` = "other",
    `13` = "institution",
    `14` = "monastery"
  ),
    hwhacc = .replace_labels(
    standardized_value_labels$hwhacc,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked"
  ),
    momonth = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMOVED", `-1` = "na, asked"),
    moved = .replace_labels(
    standardized_value_labels$moved,
    `-1` = "na, asked"
  ),
    moyear = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KMOVED", `-1` = "na, asked"),
    satis = c(
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "not satisfied/dissatisfied",
    `3` = "satisfied"
  ),
    spec1 = .replace_labels(
    standardized_value_labels$spec1,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec2 = .replace_labels(
    standardized_value_labels$spec2,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec3 = .replace_labels(
    standardized_value_labels$spec3,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec4 = .replace_labels(
    standardized_value_labels$spec4,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec5 = .replace_labels(
    standardized_value_labels$spec5,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec6 = .replace_labels(
    standardized_value_labels$spec6,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    spec8 = .replace_labels(
    standardized_value_labels$spec8,
    `-5` = "na, see I/J/KHINDEP",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  ),
    spec9 = .replace_labels(
    standardized_value_labels$spec9,
    `-3` = "na, wrong skip",
    `-2` = "na, see KSPECADJ",
    `-1` = "na, asked"
  ),
    specadj = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KMOVED",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    specwho = .replace_labels(
    standardized_value_labels$specwho,
    `-3` = "na, wrong skip",
    `-2` = "na, see I/J/KSPECADJ",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  fdoor = "numeric",
  fdoorc = "numeric",
  hindep = "categorical",
  housem = "categorical",
  houstyp = "categorical",
  hwhacc = "categorical",
  lrooms = "categorical",
  momonth = "date",
  moved = "categorical",
  moyear = "date",
  nrooms = "numeric",
  nroomsc = "numeric",
  ospec1 = "categorical",
  ospec2 = "categorical",
  ospec3 = "categorical",
  ospec4 = "categorical",
  ospec5 = "categorical",
  ospec6 = "categorical",
  rfdoor = "categorical",
  satis = "categorical",
  satis01 = "categorical",
  satis02 = "categorical",
  satis03 = "categorical",
  satis04 = "categorical",
  satis05 = "categorical",
  satis06 = "categorical",
  satis07 = "categorical",
  satis08 = "categorical",
  satis09 = "categorical",
  spec01 = "categorical",
  spec02 = "categorical",
  spec03 = "categorical",
  spec04 = "categorical",
  spec05 = "categorical",
  spec06 = "categorical",
  spec07 = "categorical",
  spec08 = "categorical",
  spec09 = "categorical",
  spec1 = "categorical",
  spec10 = "categorical",
  spec11 = "categorical",
  spec12 = "categorical",
  spec13 = "categorical",
  spec14 = "categorical",
  spec15 = "categorical",
  spec16 = "categorical",
  spec17 = "categorical",
  spec2 = "categorical",
  spec3 = "categorical",
  spec4 = "categorical",
  spec5 = "categorical",
  spec6 = "categorical",
  spec7 = "categorical",
  spec8 = "categorical",
  spec9 = "categorical",
  specadj = "categorical",
  specwho = "categorical"
)

.lasa_fc_014 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "014", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "014", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "014", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "014", waves = .lasa_wave_rows())
)
