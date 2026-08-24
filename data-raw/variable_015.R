## LASA filecode 015 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  h21own = "Ownership second home, apartment",
  h21owns = "Ownership second home, apartment: other specified",
  h22own = "Ownership caravan, tent (fixed)",
  h22owns = "Ownership caravan, tent (fixed): other specified",
  h2dura = "Duration of stay in second home (total per year)",
  h2loc = "Location of second home, place of stay",
  h2locsp = "Location of second home, place of stay, specified",
  house2 = "Stay in second home more than a month a year",
  howner = "Ownership of house: owner/rented/free",
  hs21 = "Second home type: second house, apartment",
  hs22 = "Second home type: caravan, tent on a fixed place",
  hs23 = "Second home type: mobile home, camper (not fixed)",
  hs24 = "Second home type: boat",
  hs25 = "Second home type: home of family or friends",
  hs26 = "Second home type: something else",
  hs26s = "Second home type: something else, specified",
  mortga = "House is mortgage free",
  movefut = "Want to move the next years",
  movrea = "Most important reason for moving",
  movreas = "Other reason for moving",
  movtyph = "Kind of home R wants to move to",
  movtypi = "Type of independent home R wants to move to",
  movtyps = "Other kind of home R wants to move to",
  pleas = "Pleasant living in neighbourhood",
  safe = "Feeling safe in evening in neighbourhood",
  yneigh = "How many years in neighbourhood"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels[c("howner", "mortga", "movefut", "pleas", "safe", "yneigh")],
  Wave_C_labels = harmonized_labels[c("howner", "mortga", "movefut", "pleas", "safe", "yneigh")],
  Wave_D_labels = harmonized_labels[c("howner", "mortga", "movefut", "pleas", "safe", "yneigh")],
  Wave_E_labels = harmonized_labels[c("howner", "mortga", "movefut", "pleas", "safe", "yneigh")],
  Wave_2B_labels = harmonized_labels[c(
    "howner",
    "mortga",
    "movefut",
    "movrea",
    "movreas",
    "movtyph",
    "movtypi",
    "movtyps",
    "pleas",
    "safe",
    "yneigh"
  )],
  Wave_F_labels = harmonized_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
  Wave_G_labels = harmonized_labels[c(
    "h21own",
    "h21owns",
    "h22own",
    "h22owns",
    "h2dura",
    "h2loc",
    "h2locsp",
    "house2",
    "howner",
    "hs21",
    "hs22",
    "hs23",
    "hs24",
    "hs25",
    "hs26",
    "hs26s",
    "mortga",
    "pleas",
    "safe",
    "yneigh"
  )],
  Wave_H_labels = harmonized_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
  Wave_3B_labels = harmonized_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
  Wave_I_labels = harmonized_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
  Wave_J_labels = harmonized_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
  Wave_K_labels = harmonized_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  h21own = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "owner without mortgage",
    `2` = "owner, with mortgage",
    `3` = "rented or paid residence",
    `4` = "other"
  ),
  h21owns = c(`-2` = "not available, routing", `0` = "-to be coded-"),
  h22own = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "owner, without mortgage",
    `2` = "owner, with mortgage",
    `3` = "rented or paid residence",
    `4` = "other"
  ),
  h22owns = c(`-2` = "not available, routing", `0` = "-to be coded-"),
  h2dura = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "1 or 2 months",
    `2` = "3 or 4 months",
    `3` = "about half a year",
    `4` = "the larger part of the year"
  ),
  h2loc = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "own region, province",
    `2` = "somewhere else in the netherlands",
    `3` = "in europe",
    `4` = "outside europe"
  ),
  h2locsp = c(`-2` = "not available, routing", `0` = "-to be coded-"),
  house2 = c(`-1` = "not available, asked", `1` = "no", `2` = "yes"),
  howner = c(
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
  hs21 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  hs22 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  hs23 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  hs24 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  hs25 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  hs26 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  hs26s = c(`-2` = "not available, routing", `0` = "-to be coded-"),
  mortga = c(
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
  movefut = c(
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "binary category 1",
    `2` = "yes"
  ),
  movrea = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "poor health r",
    `2` = "poor health partner",
    `3` = "marriage/cohabitation",
    `4` = "divorce",
    `5` = "more privacy",
    `6` = "more companionship",
    `7` = "no burden to others",
    `8` = "closer to (non)kin",
    `9` = "job",
    `10` = "house now too big",
    `11` = "house now too small",
    `12` = "house now too expensive",
    `13` = "house now inadequate",
    `14` = "dislike neighbourhood",
    `15` = "closer to facilities",
    `16` = "demolition house",
    `17` = "other"
  ),
  movreas = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "<to be coded>"
  ),
  movtyph = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "co-residence with children",
    `2` = "share home with family",
    `3` = "share home with friends",
    `4` = "commune",
    `5` = "service-flat",
    `6` = "apartment building elderly (elevator)",
    `7` = "home elderly (street level)",
    `8` = "home elderly (service provision)",
    `9` = "semi-independent",
    `10` = "old peoples home",
    `11` = "nursing home",
    `12` = "independent",
    `13` = "other"
  ),
  movtypi = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "attached row",
    `2` = "semi-detached",
    `3` = "detached",
    `4` = "high rise (elevator)",
    `5` = "high rise (no elevator)",
    `6` = "farm",
    `7` = "low-level apt building"
  ),
  movtyps = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "<to be coded>"
  ),
  pleas = c(
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "binary category 1",
    `2` = "yes"
  ),
  safe = c(
    `-4` = "not available, short version",
    `-3` = "not available, wrong skip",
    `-2` = "not available",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "binary category 1",
    `2` = "yes"
  ),
  yneigh = c(
    `-4` = "not available, short version",
    `-2` = "not available, interview terminated",
    `-1` = "not available, asked"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "movefut", "pleas", "safe", "yneigh")],
    howner = .replace_labels(
    standardized_value_labels$howner,
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "no answer, asked"
  ),
    mortga = .replace_labels(
    standardized_value_labels$mortga,
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "no answer, asked"
  ),
    movefut = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    pleas = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    safe = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    yneigh = c(`-4` = "na, short version")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "movefut", "pleas", "safe", "yneigh")],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    movefut = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    pleas = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "movefut", "pleas", "safe", "yneigh")],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    movefut = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    pleas = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "movefut", "pleas", "safe", "yneigh")],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    movefut = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    pleas = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "howner",
    "mortga",
    "movefut",
    "movrea",
    "movreas",
    "movtyph",
    "movtypi",
    "movtyps",
    "pleas",
    "safe",
    "yneigh"
  )],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHINDEP in LAS2B014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    movefut = c(
    `-3` = "na, wrong skip",
    `-2` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    movrea = .replace_labels(
    standardized_value_labels$movrea,
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVTYPH",
    `-1` = "na, asked",
    `1` = "poor health R"
  ),
    movreas = .replace_labels(
    standardized_value_labels$movreas,
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVREA",
    `-1` = "na, asked"
  ),
    movtyph = .replace_labels(
    standardized_value_labels$movtyph,
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVEFUT",
    `-1` = "na, asked"
  ),
    movtypi = .replace_labels(
    standardized_value_labels$movtypi,
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVTYPH",
    `-1` = "na, asked"
  ),
    movtyps = .replace_labels(
    standardized_value_labels$movtyps,
    `-3` = "na, wrong skip",
    `-2` = "na, see BMOVTYPH",
    `-1` = "na, asked"
  ),
    pleas = c(
    `-3` = "na, wrong skip",
    `-2` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    safe = c(
    `-3` = "na, wrong skip",
    `-2` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    yneigh = c(`-2` = "na, interview terminated", `-1` = "na, asked")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    pleas = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "h21own",
    "h21owns",
    "h22own",
    "h22owns",
    "h2dura",
    "h2loc",
    "h2locsp",
    "house2",
    "howner",
    "hs21",
    "hs22",
    "hs23",
    "hs24",
    "hs25",
    "hs26",
    "hs26s",
    "mortga",
    "pleas",
    "safe",
    "yneigh"
  )],
    h21own = .replace_labels(
    standardized_value_labels$h21own,
    `-2` = "na, see GHS21",
    `-1` = "na, asked"
  ),
    h21owns = .replace_labels(
    standardized_value_labels$h21owns,
    `-2` = "na, see GH21OWN"
  ),
    h22own = .replace_labels(
    standardized_value_labels$h22own,
    `-2` = "na, see GHS22",
    `-1` = "na, asked"
  ),
    h22owns = .replace_labels(
    standardized_value_labels$h22owns,
    `-2` = "na, see GH21OWN"
  ),
    h2dura = .replace_labels(
    standardized_value_labels$h2dura,
    `-2` = "na, see GHOUSE2",
    `-1` = "na, asked"
  ),
    h2loc = .replace_labels(
    standardized_value_labels$h2loc,
    `-2` = "na, see GHOUSE2",
    `-1` = "na, asked",
    `2` = "somewhere else in the Netherlands",
    `3` = "in Europe",
    `4` = "outside Europe"
  ),
    h2locsp = .replace_labels(
    standardized_value_labels$h2locsp,
    `-2` = "na, see GH2LOC",
    `0` = "- to be coded-"
  ),
    house2 = .replace_labels(
    standardized_value_labels$house2,
    `-1` = "na, asked"
  ),
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GHINDEP in LASAG014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    hs21 = .replace_labels(
    standardized_value_labels$hs21,
    `-2` = "na, see GHOUSE2"
  ),
    hs22 = .replace_labels(
    standardized_value_labels$hs22,
    `-2` = "na, see GHOUSE2"
  ),
    hs23 = .replace_labels(
    standardized_value_labels$hs23,
    `-2` = "na, see GHOUSE2"
  ),
    hs24 = .replace_labels(
    standardized_value_labels$hs24,
    `-2` = "na, see GHOUSE2"
  ),
    hs25 = .replace_labels(
    standardized_value_labels$hs25,
    `-2` = "na, see GHOUSE2"
  ),
    hs26 = .replace_labels(
    standardized_value_labels$hs26,
    `-2` = "na, see GHOUSE2"
  ),
    hs26s = .replace_labels(
    standardized_value_labels$hs26s,
    `-2` = "na, see GHS26"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    pleas = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    pleas = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHINDEP in LAS3B014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    pleas = c(`-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    pleas = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    pleas = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("howner", "mortga", "pleas", "safe", "yneigh")],
    howner = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014",
    `-1` = "na, asked",
    `1` = "owner",
    `2` = "tenant",
    `3` = "subtenant",
    `4` = "resident",
    `5` = "free"
  ),
    mortga = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/H/I/J/KHOWNER",
    `-1` = "na, asked",
    `1` = "no mortgage",
    `2` = "mortgage"
  ),
    pleas = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    safe = c(`-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    yneigh = c(`-1` = "na, asked")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  h21own = "categorical",
  h21owns = "categorical",
  h22own = "categorical",
  h22owns = "categorical",
  h2dura = "categorical",
  h2loc = "categorical",
  h2locsp = "categorical",
  house2 = "categorical",
  howner = "categorical",
  hs21 = "categorical",
  hs22 = "categorical",
  hs23 = "categorical",
  hs24 = "categorical",
  hs25 = "categorical",
  hs26 = "categorical",
  hs26s = "categorical",
  mortga = "categorical",
  movefut = "categorical",
  movrea = "categorical",
  movreas = "categorical",
  movtyph = "categorical",
  movtypi = "categorical",
  movtyps = "categorical",
  pleas = "categorical",
  safe = "categorical",
  yneigh = "numeric"
)

.lasa_fc_015 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "015", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "015", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "015", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "015", waves = .lasa_wave_rows())
)
