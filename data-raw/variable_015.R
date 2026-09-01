## LASA filecode 015 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  yneigh = "How many years in neighbourhood",
  .applies_to_waves = c("Z")
)

variable_labels(
  "howner", "mortga", "pleas", "safe", "yneigh",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "movefut",
  .applies_to_waves = c("B", "C", "D", "E", "2B")
)

variable_labels(
  "movrea", "movreas", "movtyph", "movtypi", "movtyps",
  .applies_to_waves = c("2B")
)

variable_labels(
  "h21own", "h21owns", "h22own", "h22owns", "h2dura", "h2loc", "h2locsp", "house2", "hs21", "hs22", "hs23", "hs24", "hs25", "hs26", "hs26s",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("h21own", "h21owns", "h22own", "h22owns", "h2dura", "h2loc", "h2locsp", "howner", "hs21", "hs22", "hs23", "hs24", "hs25", "hs26", "hs26s", "mortga", "movrea", "movreas", "movtyph", "movtypi", "movtyps"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "owner without mortgage", `2` = "owner, with mortgage", `3` = "rented or paid residence", `4` = "other",
  .applies_to_vars = c("h21own"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "-to be coded-",
  .applies_to_vars = c("h21owns", "h22owns", "h2locsp", "hs26s"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "owner, without mortgage", `2` = "owner, with mortgage", `3` = "rented or paid residence", `4` = "other",
  .applies_to_vars = c("h22own"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "1 or 2 months", `2` = "3 or 4 months", `3` = "about half a year", `4` = "the larger part of the year",
  .applies_to_vars = c("h2dura"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "own region, province", `2` = "somewhere else in the netherlands", `3` = "in europe", `4` = "outside europe",
  .applies_to_vars = c("h2loc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("house2"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "owner", `2` = "tenant", `3` = "subtenant", `4` = "resident", `5` = "free",
  .applies_to_vars = c("howner"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("hs21", "hs22", "hs23", "hs24", "hs25", "hs26"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no mortgage", `2` = "mortgage",
  .applies_to_vars = c("mortga"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "not available", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("movefut", "pleas", "safe"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "poor health r", `2` = "poor health partner", `3` = "marriage/cohabitation", `4` = "divorce", `5` = "more privacy", `6` = "more companionship", `7` = "no burden to others", `8` = "closer to (non)kin", `9` = "job", `10` = "house now too big", `11` = "house now too small", `12` = "house now too expensive", `13` = "house now inadequate", `14` = "dislike neighbourhood", `15` = "closer to facilities", `16` = "demolition house", `17` = "other",
  .applies_to_vars = c("movrea"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "<to be coded>",
  .applies_to_vars = c("movreas", "movtyps"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "co-residence with children", `2` = "share home with family", `3` = "share home with friends", `4` = "commune", `5` = "service-flat", `6` = "apartment building elderly (elevator)", `7` = "home elderly (street level)", `8` = "home elderly (service provision)", `9` = "semi-independent", `10` = "old peoples home", `11` = "nursing home", `12` = "independent", `13` = "other",
  .applies_to_vars = c("movtyph"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "attached row", `2` = "semi-detached", `3` = "detached", `4` = "high rise (elevator)", `5` = "high rise (no elevator)", `6` = "farm", `7` = "low-level apt building",
  .applies_to_vars = c("movtypi"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-2` = "not available, interview terminated", `-1` = "na, asked",
  .applies_to_vars = c("yneigh"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "no answer, asked", `1` = "owner", `2` = "tenant", `3` = "subtenant", `4` = "resident", `5` = "free",
  .applies_to_vars = c("howner"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "no answer, asked", `1` = "no mortgage", `2` = "mortgage",
  .applies_to_vars = c("mortga"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("movefut", "pleas", "safe"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short version",
  .applies_to_vars = c("yneigh"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/H/I/J/KHINDEP in LASAC/D/E/F/H/I/J/K014", `-1` = "na, asked", `1` = "owner", `2` = "tenant", `3` = "subtenant", `4` = "resident", `5` = "free",
  .applies_to_vars = c("howner"),
  .applies_to_waves = c("C", "D", "E", "F", "H", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/H/I/J/KHOWNER", `-1` = "na, asked", `1` = "no mortgage", `2` = "mortgage",
  .applies_to_vars = c("mortga"),
  .applies_to_waves = c("C", "D", "E", "F", "H", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("movefut"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, routing", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pleas", "safe"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("yneigh"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHINDEP in LAS2B014", `-1` = "na, asked", `1` = "owner", `2` = "tenant", `3` = "subtenant", `4` = "resident", `5` = "free",
  .applies_to_vars = c("howner"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHOWNER", `-1` = "na, asked", `1` = "no mortgage", `2` = "mortgage",
  .applies_to_vars = c("mortga"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("movefut", "pleas", "safe"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMOVTYPH", `-1` = "na, asked", `1` = "poor health R", `2` = "poor health partner", `3` = "marriage/cohabitation", `4` = "divorce", `5` = "more privacy", `6` = "more companionship", `7` = "no burden to others", `8` = "closer to (non)kin", `9` = "job", `10` = "house now too big", `11` = "house now too small", `12` = "house now too expensive", `13` = "house now inadequate", `14` = "dislike neighbourhood", `15` = "closer to facilities", `16` = "demolition house", `17` = "other",
  .applies_to_vars = c("movrea"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMOVREA", `-1` = "na, asked", `0` = "<to be coded>",
  .applies_to_vars = c("movreas"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMOVEFUT", `-1` = "na, asked", `1` = "co-residence with children", `2` = "share home with family", `3` = "share home with friends", `4` = "commune", `5` = "service-flat", `6` = "apartment building elderly (elevator)", `7` = "home elderly (street level)", `8` = "home elderly (service provision)", `9` = "semi-independent", `10` = "old peoples home", `11` = "nursing home", `12` = "independent", `13` = "other",
  .applies_to_vars = c("movtyph"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMOVTYPH", `-1` = "na, asked", `1` = "attached row", `2` = "semi-detached", `3` = "detached", `4` = "high rise (elevator)", `5` = "high rise (no elevator)", `6` = "farm", `7` = "low-level apt building",
  .applies_to_vars = c("movtypi"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMOVTYPH", `-1` = "na, asked", `0` = "<to be coded>",
  .applies_to_vars = c("movtyps"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, interview terminated", `-1` = "na, asked",
  .applies_to_vars = c("yneigh"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see GHS21", `-1` = "na, asked", `1` = "owner without mortgage", `2` = "owner, with mortgage", `3` = "rented or paid residence", `4` = "other",
  .applies_to_vars = c("h21own"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GH21OWN", `0` = "-to be coded-",
  .applies_to_vars = c("h21owns", "h22owns"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GHS22", `-1` = "na, asked", `1` = "owner, without mortgage", `2` = "owner, with mortgage", `3` = "rented or paid residence", `4` = "other",
  .applies_to_vars = c("h22own"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GHOUSE2", `-1` = "na, asked", `1` = "1 or 2 months", `2` = "3 or 4 months", `3` = "about half a year", `4` = "the larger part of the year",
  .applies_to_vars = c("h2dura"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GHOUSE2", `-1` = "na, asked", `1` = "own region, province", `2` = "somewhere else in the Netherlands", `3` = "in Europe", `4` = "outside Europe",
  .applies_to_vars = c("h2loc"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GH2LOC", `0` = "- to be coded-",
  .applies_to_vars = c("h2locsp"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GHINDEP in LASAG014", `-1` = "na, asked", `1` = "owner", `2` = "tenant", `3` = "subtenant", `4` = "resident", `5` = "free",
  .applies_to_vars = c("howner"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GHOUSE2", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("hs21", "hs22", "hs23", "hs24", "hs25", "hs26"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GHS26", `0` = "-to be coded-",
  .applies_to_vars = c("hs26s"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GHOWNER", `-1` = "na, asked", `1` = "no mortgage", `2` = "mortgage",
  .applies_to_vars = c("mortga"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHINDEP in LAS3B014", `-1` = "na, asked", `1` = "owner", `2` = "tenant", `3` = "subtenant", `4` = "resident", `5` = "free",
  .applies_to_vars = c("howner"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("pleas", "safe"),
  .applies_to_waves = c("3B")
)

.lasa_fc_015 <- .lasa_finalize_fc("015")

