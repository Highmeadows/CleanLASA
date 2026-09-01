## LASA filecode 014 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  specwho = "Special adjustment: for who",
  .applies_to_waves = c("Z")
)

variable_labels(
  "fdoor", "rfdoor", "spec02", "spec03", "spec05", "spec06", "spec07", "spec08", "spec09", "spec11", "spec13", "spec14", "spec15", "spec16", "spec17",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "fdoorc",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G")
)

variable_labels(
  "hindep",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "housem", "moved",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "lrooms",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "I")
)

variable_labels(
  "satis",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "satis01", "satis02", "satis03", "satis04", "satis05", "satis06", "satis07", "satis08", "satis09",
  .applies_to_waves = c("B")
)

variable_labels(
  "specadj",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

variable_labels(
  "spec01", "spec12",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "spec04",
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

variable_labels(
  "houstyp",
  .applies_to_waves = c("2B", "3B")
)

variable_labels(
  "nrooms", "ospec1", "ospec2", "ospec3", "ospec4", "ospec5", "ospec6",
  .applies_to_waves = c("2B")
)

variable_labels(
  "hwhacc",
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

variable_labels(
  houstyp = "Type of housing: constructed",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  momonth = "Moved since last interview: month",
  moyear = "Moved since last interview: year",
  spec01 = "Specially adjusted: telephone e.g. amplified sound",
  spec12 = "spec. adjust: raised bed",
  .applies_to_waves = c("B")
)

variable_labels(
  nrooms = "# rooms in house",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "I")
)

variable_labels(
  nroomsc = "# rooms: constructed",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H")
)

variable_labels(
  spec04 = "Specially adjusted: handgrips or supports",
  .applies_to_waves = c("B", "2B")
)

variable_labels(
  spec10 = "Specially adjusted: non-skid in bathroom",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  momonth = "Moved since last int: month",
  moyear = "Moved since last int: year",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  momonth = "Moved to current residence: month",
  moyear = "Moved to current residence: year",
  .applies_to_waves = c("2B", "3B")
)

variable_labels(
  spec1 = "Spec. adjust: lowered or no doorstep",
  spec2 = "Spec. adjust: adjusted toilet, supports, handgrips",
  spec4 = "Spec. adjust: bedroom on same floor",
  spec5 = "Spec. adjust: sloping ramp to pavement",
  spec6 = "Spec. adjust: adjusted sink cupboards kitchen",
  spec7 = "Spec. adjust: fall alarm",
  spec8 = "Spec. adjust: stair elevator",
  specwho = "Spec. adjust: for who",
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

variable_labels(
  spec3 = "Spec. adjust: non-skid in bathroom, seating equip",
  .applies_to_waves = c("H", "3B")
)

variable_labels(
  spec9 = "Spec. adjust: other",
  .applies_to_waves = c("H", "3B", "I", "J")
)

variable_labels(
  spec3 = "Spec. adjust: non-skid in bathroom, seating equipment",
  specadj = "House has special adjustments / adaptation",
  .applies_to_waves = c("I", "J", "K")
)

variable_labels(
  spec10 = "Spec. adjust: other",
  spec9 = "Spec. adjust: sensors to monitor movement",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("fdoor", "housem", "houstyp", "hwhacc", "lrooms", "momonth", "moyear", "nrooms", "ospec1", "ospec2", "ospec3", "ospec4", "ospec5", "ospec6", "rfdoor", "satis", "satis01", "satis02", "satis03", "satis04", "satis05", "satis06", "satis07", "satis08", "satis09", "spec01", "spec02", "spec03", "spec04", "spec05", "spec06", "spec07", "spec08", "spec09", "spec1", "spec10", "spec11", "spec12", "spec13", "spec14", "spec15", "spec16", "spec17", "spec2", "spec3", "spec4", "spec5", "spec6", "spec7", "spec8", "spec9", "specadj", "specwho"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, routing",
  .applies_to_vars = c("fdoor", "housem", "hwhacc", "lrooms", "nrooms", "spec06", "spec07", "spec14", "spec15", "spec16", "spec4", "spec5", "spec7", "spec8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available",
  .applies_to_vars = c("fdoor"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "monastery", `-2` = "institution", `-1` = "unknown",
  .applies_to_vars = c("fdoorc"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "not available", `-1` = "na, asked", `1` = "independent", `2` = "residential home", `3` = "nursing h-somatic", `4` = "nursing h-psych", `5` = "hospital", `6` = "psychiatric hospital", `7` = "other", `8` = "monastery",
  .applies_to_vars = c("hindep"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "label varies by wave", `8` = "label varies by wave", `9` = "label varies by wave", `10` = "label varies by wave", `11` = "label varies by wave", `12` = "label varies by wave", `13` = "houseboat", `14` = "commune", `15` = "other",
  .applies_to_vars = c("housem"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not available", `-3` = "na, wrong skip", `-1` = "unknown", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "label varies by wave", `8` = "label varies by wave", `9` = "label varies by wave", `10` = "label varies by wave", `11` = "label varies by wave", `12` = "label varies by wave", `13` = "label varies by wave", `14` = "label varies by wave", `15` = "other", `16` = "institution", `17` = "monastery",
  .applies_to_vars = c("houstyp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "yes", `2` = "only with help", `3` = "no",
  .applies_to_vars = c("hwhacc"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "not available", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lrooms"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("momonth", "moyear"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "yes, temporarily living elsewhere", `4` = "lived temporarily elsewhere",
  .applies_to_vars = c("moved"),
  .applies_to_waves = c("Z", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "not available",
  .applies_to_vars = c("nrooms"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "monastery", `-2` = "institution", `-1` = "unknown",
  .applies_to_vars = c("nroomsc"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G", "H")
)

value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("ospec1", "ospec2", "ospec3", "ospec4", "ospec5", "ospec6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "not available", `1` = "only stairs", `2` = "elevator present", `3` = "other",
  .applies_to_vars = c("rfdoor"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "dissatisfied", `2` = "not satisfied/dissatisfied", `3` = "satisfied",
  .applies_to_vars = c("satis"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("satis01", "satis02", "satis03", "satis04", "satis05", "satis06", "satis07", "satis08", "satis09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "mentioned",
  .applies_to_vars = c("spec01", "spec02", "spec03", "spec04", "spec05", "spec06", "spec07", "spec08", "spec09", "spec10", "spec11", "spec12", "spec13", "spec14", "spec15", "spec16", "spec17"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec1", "spec2", "spec3", "spec6"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec4", "spec5", "spec7", "spec8"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec9"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("specadj"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "for respondent", `2` = "for (former) inmate", `3` = "for both", `4` = "for none, already present",
  .applies_to_vars = c("specwho"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-2` = "na, routing",
  .applies_to_vars = c("satis"),
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-5` = "na, see BHINDEP", `-3` = "na, wrong skip", `-2` = "na, see BMOVED", `-1` = "na",
  .applies_to_vars = c("fdoor"),
  .applies_to_waves = c("B")
)

value_labels(
  `1` = "independent", `2` = "residential home", `3` = "nursing h-somatic", `4` = "nursing h-psych", `5` = "hospital", `6` = "psychiatric hospital", `8` = "monastery (added)",
  .applies_to_vars = c("hindep"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, see BHINDEP", `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "na, see BMOVED", `-1` = "na, asked", `1` = "attached row", `2` = "semi-detached", `3` = "detached", `4` = "high rise (elevator)", `5` = "high rise (no elevator)", `6` = "low-level apt building", `7` = "ground floor apartment", `8` = "apt build elderly (elevator)", `9` = "home elderly (street level)", `10` = "service flat (home elderly)", `11` = "semi-independent", `12` = "farm", `13` = "houseboat", `14` = "commune", `15` = "other",
  .applies_to_vars = c("housem"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "unknown", `1` = "attached row", `2` = "semi-detached", `3` = "detached", `4` = "high rise (elevator)", `5` = "high rise (no elevator)", `6` = "low-level apt building", `7` = "ground floor apartment", `8` = "apt build elderly (elevator)", `9` = "home elderly (street level)", `10` = "service flat (home elderly)", `11` = "semi-independent", `12` = "farm", `13` = "houseboat", `14` = "commune", `15` = "other", `16` = "institution", `17` = "monastery",
  .applies_to_vars = c("houstyp"),
  .applies_to_waves = c("B", "C", "D")
)

value_labels(
  `-5` = "na, see BHINDEP", `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "na, see BMOVED", `-1` = "na", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lrooms"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "na, see BMOVED", `-1` = "na, asked",
  .applies_to_vars = c("momonth", "moyear"),
  .applies_to_waves = c("B")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("moved"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, see BHINDEP", `-4` = "na, short version", `-3` = "na, wrong skip", `-2` = "na, see BMOVED", `-1` = "na",
  .applies_to_vars = c("nrooms"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short version", `-2` = "na, see BFDOOR", `-1` = "na", `1` = "only stairs", `2` = "elevator present", `3` = "other",
  .applies_to_vars = c("rfdoor"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short version", `-3` = "wrong skip", `-1` = "na, asked", `1` = "dissatisfied", `2` = "no satisfied/dissatisfy", `3` = "satisfied",
  .applies_to_vars = c("satis"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BSATIS", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("satis01", "satis02", "satis03", "satis04", "satis05", "satis06", "satis07", "satis08", "satis09"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BSPECADJ", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec01", "spec02", "spec03", "spec04", "spec05", "spec08", "spec09", "spec10", "spec11", "spec12", "spec13", "spec17"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, see BHINDEP", `-3` = "na, wrong skip", `-2` = "na, see BSPECADJ", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec06", "spec07", "spec14", "spec15", "spec16"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("specadj"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see C/D/E/F/GMOVED",
  .applies_to_vars = c("fdoor", "hindep", "housem", "lrooms", "momonth", "moyear", "nrooms", "specadj"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-2` = "na, see C/D/E/F/GSPECADJ",
  .applies_to_vars = c("spec01", "spec02", "spec03", "spec04", "spec05", "spec06", "spec07", "spec08", "spec09", "spec10", "spec11", "spec12", "spec13", "spec14", "spec15", "spec16", "spec17"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-5` = "na, see C/D/E/F/GHINDEP",
  .applies_to_vars = c("fdoor", "housem", "lrooms", "nrooms", "spec06", "spec07", "spec14", "spec15", "spec16"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("fdoor", "nrooms"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "independent", `2` = "residential home", `3` = "nursing h-somatic", `4` = "nursing h-psych", `5` = "hospital", `6` = "psychiatric hospital", `8` = "monastery",
  .applies_to_vars = c("hindep"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "attached row", `2` = "semi-detached", `3` = "detached", `4` = "high rise (elevator)", `5` = "high rise (no elevator)", `6` = "low-level apt building", `7` = "ground floor apartment", `8` = "apt build elderly (elevator)", `9` = "home elderly (street level)", `10` = "service flat (home elderly)", `11` = "semi-independent", `12` = "farm", `13` = "houseboat", `14` = "commune", `15` = "other (documented)",
  .applies_to_vars = c("housem"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lrooms"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("momonth", "moyear"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("moved"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/D/E/F/GFDOOR", `-1` = "na, asked", `1` = "only stairs", `2` = "elevator present", `3` = "other",
  .applies_to_vars = c("rfdoor"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "dissatisfied", `2` = "not satisfied/dissatisfied", `3` = "satisfied",
  .applies_to_vars = c("satis"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec01", "spec02", "spec03", "spec04", "spec05", "spec06", "spec07", "spec08", "spec09", "spec10", "spec11", "spec12", "spec13", "spec14", "spec15", "spec16", "spec17"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("specadj"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "unknown", `1` = "attached row", `2` = "semi-detached", `3` = "detached", `4` = "high rise (elevator)", `5` = "high rise (no elevator)", `6` = "low-level apt building", `7` = "ground floor apartment", `8` = "apt build elderly (elevator)", `9` = "home elderly (street level)", `10` = "service flat (home elderly)", `11` = "semi-independent", `12` = "farm", `13` = "houseboat", `14` = "commune", `15` = "other", `16` = "institution", `17` = "monastery",
  .applies_to_vars = c("houstyp"),
  .applies_to_waves = c("E", "F", "G")
)

value_labels(
  `-3` = "wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked",
  .applies_to_vars = c("fdoor"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, interview terminated", `-1` = "na, asked", `1` = "independent", `2` = "residential home", `3` = "nursing h- somatic", `4` = "nursing h-psych", `5` = "hospital", `6` = "psychiatric hospital", `8` = "monastery (added)",
  .applies_to_vars = c("hindep"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BHINDEP", `-1` = "unknown", `1` = "attached row", `2` = "semi-detached", `3` = "detached", `4` = "high rise (elevator)", `5` = "high rise (no elevator)", `6` = "low-level apt building", `7` = "ground floor apartment", `8` = "apt build elderly (elevator)", `9` = "home elderly (street level)", `10` = "service flat (home elderly)", `11` = "semi-independent", `12` = "farm", `13` = "houseboat", `14` = "commune", `15` = "other", `16` = "institution", `17` = "monastery",
  .applies_to_vars = c("houstyp"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lrooms"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked",
  .applies_to_vars = c("momonth", "moyear"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked",
  .applies_to_vars = c("nrooms"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BSPEC17", `0` = "no", `1` = "yes",
  .applies_to_vars = c("ospec1", "ospec2", "ospec3", "ospec4", "ospec5", "ospec6"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BFDOOR", `-1` = "na, asked", `1` = "only stairs", `2` = "elevator present", `3` = "other",
  .applies_to_vars = c("rfdoor"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked", `1` = "dissatisfied", `2` = "not satisfied/dissatisfied", `3` = "satisfied",
  .applies_to_vars = c("satis"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BSPECADJ", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("spec01", "spec02", "spec03", "spec04", "spec05", "spec06", "spec07", "spec08", "spec09", "spec10", "spec11", "spec12", "spec13", "spec14", "spec15", "spec16", "spec17"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("specadj"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see HSPECADJ",
  .applies_to_vars = c("spec1", "spec2", "spec3", "spec4", "spec5", "spec6", "spec7", "spec8", "spec9", "specwho"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked", `1` = "independent", `2` = "residential home", `3` = "nursing h-somatic", `4` = "nursing h-psych", `5` = "hospital", `6` = "psychiatric hospital", `8` = "monastery",
  .applies_to_vars = c("hindep"),
  .applies_to_waves = c("H")
)

value_labels(
  `-5` = "na, see HHINDEP", `-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked", `1` = "attached row or semi-detached", `2` = "detached", `3` = "high rise (elevator)", `4` = "high rise (no elevator)", `5` = "ground floor apartment", `6` = "apt build elderly (elevator)", `7` = "home elderly (street level)", `8` = "semi-independent", `9` = "farm / corporate housing", `10` = "houseboat", `11` = "other (documented)",
  .applies_to_vars = c("housem"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "unknown", `1` = "attached row or semi-detached", `2` = "detached", `3` = "high rise (elevator)", `4` = "high rise (no elevator)", `5` = "ground floor apartment", `6` = "apt build elderly (elevator)", `7` = "home elderly (street level)", `8` = "semi-independent", `9` = "farm / corporate housing", `10` = "houseboat", `11` = "other", `12` = "institution", `13` = "monastery",
  .applies_to_vars = c("houstyp"),
  .applies_to_waves = c("H")
)

value_labels(
  `-5` = "na, see HHINDEP", `-2` = "na, see HMOVED", `-1` = "na, asked", `1` = "yes", `2` = "only with help", `3` = "no",
  .applies_to_vars = c("hwhacc"),
  .applies_to_waves = c("H")
)

value_labels(
  `-5` = "na, see HHINDEP", `-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lrooms"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked",
  .applies_to_vars = c("momonth", "moyear"),
  .applies_to_waves = c("H")
)

value_labels(
  `-5` = "na, see HHINDEP", `-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked",
  .applies_to_vars = c("nrooms"),
  .applies_to_waves = c("H")
)

value_labels(
  `-5` = "na, see HHINDEP", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec4", "spec5", "spec7", "spec8"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HMOVED", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("specadj"),
  .applies_to_waves = c("H")
)

value_labels(
  `-1` = "na, asked", `1` = "for respondent", `2` = "for (former) inmate", `3` = "for both", `4` = "for none, already present",
  .applies_to_vars = c("specwho"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "unknown", `1` = "attached row or semi-detached", `2` = "detached", `3` = "high rise (elevator)", `4` = "high rise (no elevator)", `5` = "ground floor apartment", `6` = "apt build elderly (elevator)", `7` = "home elderly (street level)", `8` = "semi-independent", `9` = "farm / corporate housing", `10` = "houseboat", `11` = "housing with communal facilities", `12` = "other", `13` = "institution", `14` = "monastery",
  .applies_to_vars = c("houstyp"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-5` = "na, see BHINDEP", `-3` = "na, wrong skip", `-2` = "na, see BHINDEP", `-1` = "na, asked", `1` = "yes", `2` = "only with help", `3` = "no",
  .applies_to_vars = c("hwhacc"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BSPECADJ", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec1", "spec2", "spec3", "spec6", "spec7", "spec9"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-5` = "na, see BHINDEP", `-3` = "na, wrong skip", `-2` = "na, see BSPECADJ", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec4", "spec5", "spec8"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BSPECADJ", `-1` = "na, asked", `1` = "for respondent", `2` = "for (former) inmate", `3` = "for both", `4` = "for none, already present",
  .applies_to_vars = c("specwho"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "independent", `2` = "residential home", `3` = "nursing h-somatic", `4` = "nursing h-psych", `5` = "hospital", `6` = "psychiatric hospital", `7` = "other",
  .applies_to_vars = c("hindep"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see I/J/KMOVED",
  .applies_to_vars = c("hindep", "housem", "hwhacc", "momonth", "moyear", "specadj"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "na, see I/J/KSPECADJ",
  .applies_to_vars = c("spec1", "spec2", "spec3", "spec4", "spec5", "spec6", "spec7", "spec8", "specwho"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-5` = "na, see I/J/KHINDEP",
  .applies_to_vars = c("housem", "hwhacc", "spec4", "spec5", "spec8"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "attached row or semi-detached", `2` = "detached", `3` = "high rise (elevator)", `4` = "high rise (no elevator)", `5` = "ground floor apartment", `6` = "apt build elderly (elevator)", `7` = "home elderly (street level)", `8` = "semi-independent", `9` = "farm / corporate housing", `10` = "houseboat", `11` = "housing with communal facilities", `12` = "other (documented",
  .applies_to_vars = c("housem"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-4` = "na, previous interview telephonic", `-3` = "na, wrong skip", `-1` = "unknown", `1` = "attached row or semi-detached", `2` = "detached", `3` = "high rise (elevator)", `4` = "high rise (no elevator)", `5` = "ground floor apartment", `6` = "apt build elderly (elevator)", `7` = "home elderly (street level)", `8` = "semi-independent", `9` = "farm / corporate housing", `10` = "houseboat", `11` = "housing with communal facilities", `12` = "other", `13` = "institution", `14` = "monastery",
  .applies_to_vars = c("houstyp"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-5` = "na, see IHINDEP", `-3` = "na, wrong skip", `-2` = "na, see IMOVED", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lrooms"),
  .applies_to_waves = c("I")
)

value_labels(
  `-5` = "na, see IHINDEP", `-3` = "na, wrong skip", `-2` = "na, see IMOVED", `-1` = "na, asked",
  .applies_to_vars = c("nrooms"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JSPECADJ", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec9"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KSPECADJ", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("spec10", "spec9"),
  .applies_to_waves = c("K")
)

.lasa_fc_014 <- .lasa_finalize_fc("014")

