## LASA filecode 187 -- variable names, variable labels, value labels,
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
  mdizzgup = "categorical",
  mdizzlup = "categorical",
  mdizzoth = "categorical",
  mdizzothsp = "categorical",
  mdizzr = "categorical",
  mdizztrnhd = "categorical",
  mfalladj = "categorical",
  mfalladj01 = "categorical",
  mfalladj02 = "categorical",
  mfalladj03 = "categorical",
  mfalladj04 = "categorical",
  mfalladj05 = "categorical",
  mfalladj06 = "categorical",
  mfalladj07 = "categorical",
  mfalladj08 = "categorical",
  mfalladj09 = "categorical",
  mfalladj10 = "categorical",
  mfalladj11 = "categorical",
  mfalladj12 = "categorical",
  mfalldo1 = "text",
  mfalldo2 = "text",
  mfalldoos1 = "categorical",
  mfalldoos2 = "categorical",
  mfallf = "numeric",
  mfallfc = "categorical",
  mfallhow1 = "text",
  mfallhow2 = "text",
  mfallhowos1 = "categorical",
  mfallhowos2 = "categorical",
  mfallly = "categorical",
  mfallmhlp = "categorical",
  mfallmhlp1 = "categorical",
  mfallmhlp10 = "categorical",
  mfallmhlp2 = "categorical",
  mfallmhlp21 = "categorical",
  mfallmhlp22 = "categorical",
  mfallmhlp3 = "categorical",
  mfallmhlp31 = "categorical",
  mfallmhlp32 = "categorical",
  mfallmhlp4 = "categorical",
  mfallmhlp5 = "categorical",
  mfallmhlp6 = "categorical",
  mfallmhlp7 = "categorical",
  mfallmhlp8 = "categorical",
  mfallmhlp9 = "categorical",
  mfallmhlpyn1 = "categorical",
  mfallmhlpyn2 = "categorical",
  mfallphc1 = "categorical",
  mfallphc10 = "categorical",
  mfallphc11 = "categorical",
  mfallphc12 = "categorical",
  mfallphc13 = "categorical",
  mfallphc14 = "categorical",
  mfallphc15 = "categorical",
  mfallphc16 = "categorical",
  mfallphc2 = "categorical",
  mfallphc211 = "categorical",
  mfallphc212 = "categorical",
  mfallphc213 = "categorical",
  mfallphc214 = "categorical",
  mfallphc216 = "categorical",
  mfallphc217 = "categorical",
  mfallphc221 = "categorical",
  mfallphc222 = "categorical",
  mfallphc223 = "categorical",
  mfallphc224 = "categorical",
  mfallphc226 = "categorical",
  mfallphc227 = "categorical",
  mfallphc3 = "categorical",
  mfallphc311 = "categorical",
  mfallphc312 = "categorical",
  mfallphc313 = "categorical",
  mfallphc314 = "categorical",
  mfallphc316 = "categorical",
  mfallphc317 = "categorical",
  mfallphc321 = "categorical",
  mfallphc322 = "categorical",
  mfallphc323 = "categorical",
  mfallphc324 = "categorical",
  mfallphc326 = "categorical",
  mfallphc327 = "categorical",
  mfallphc4 = "categorical",
  mfallphc5 = "categorical",
  mfallphc6 = "categorical",
  mfallphc7 = "categorical",
  mfallphc8 = "categorical",
  mfallphc9 = "categorical",
  mfallphcn = "categorical",
  mfallphcnm = "numeric",
  mfallphcyn1 = "categorical",
  mfallphcyn2 = "categorical",
  mfallphcyn211 = "categorical",
  mfallphcyn221 = "categorical",
  mfallphcyn311 = "categorical",
  mfallphcyn321 = "categorical",
  mfallwh1 = "text",
  mfallwh2 = "text",
  mfallwhos1 = "categorical",
  mfallwhos2 = "categorical",
  mwalkaid = "categorical",
  mwalkaid1 = "categorical",
  mwalkaid1m = "categorical",
  mwalkaid1y = "numeric",
  mwalkaid2 = "categorical",
  mwalkaid2m = "categorical",
  mwalkaid2y = "numeric",
  mwalkaid3 = "categorical",
  mwalkaid3m = "categorical",
  mwalkaid3y = "numeric",
  mwalkaid4 = "categorical",
  mwalkaid4m = "categorical",
  mwalkaid4y = "numeric",
  mwalkaid5 = "categorical",
  mwalkaid5m = "categorical",
  mwalkaid5y = "numeric",
  mwalkaid6 = "categorical"
)

# define variable labels ----
variable_labels(
  mdizzgup = "Dizzy: getting up?",
  mdizzlup = "Dizzy: Yes, looking up",
  mdizzoth = "Dizzy: Yes, other",
  mdizzothsp = "Dizzy: other specification",
  mdizzr = "Dizzy: regular?",
  mdizztrnhd = "Dizzy: Yes, turning head",
  mfalladj = "Adjustments in house because of fall",
  mfalladj01 = "Adjust: non-skid in bathroom/toilet",
  mfalladj02 = "Adjust: Handgrips in bathroom/toilet",
  mfalladj03 = "Adjust: seating equipment in bathroom",
  mfalladj04 = "Adjust: adjusted or raised toilet",
  mfalladj05 = "Adjust: steps roughened",
  mfalladj06 = "Adjust: extra handrails",
  mfalladj07 = "Adjust: extra illumination",
  mfalladj08 = "Adjust: handgrip above bed",
  mfalladj09 = "Adjust: lowered doorstep",
  mfalladj10 = "Adjust: alarm system",
  mfalladj11 = "Adjust: other",
  mfalladj12 = "Adjust: other specification",
  mfalldo1 = "Fall 1: what did you do",
  mfalldo2 = "Fall 2: what did you do",
  mfalldoos1 = "Fall 1: what -> other specification",
  mfalldoos2 = "Fall 2: what -> other specification",
  mfallf = "Number/frequency of falls in reference period",
  mfallfc = "Fall: how often (constructed)",
  mfallhow1 = "Fall 1: how",
  mfallhow2 = "Fall 2: how",
  mfallhowos1 = "Fall 1: how -> other specification",
  mfallhowos2 = "Fall 2: how -> other specification",
  mfallly = "Fall occurrence in reference period",
  mfallmhlp = "Fall 1: medical help last fall",
  mfallmhlp1 = "Fall 1 help: family doctor",
  mfallmhlp10 = "Fall 2 help: other specification",
  mfallmhlp2 = "Fall 1 help: first aid hospital",
  mfallmhlp21 = "2 falls, fall 1: medical help first fall",
  mfallmhlp22 = "2 falls, fall 2: medical help second fall",
  mfallmhlp3 = "Fall 1 help: nursing staff",
  mfallmhlp31 = "> 2 falls,1st fall with most physical consequences: medical help fall",
  mfallmhlp32 = "> 2 falls,2nd fall with most physical consequences: medical help fall",
  mfallmhlp4 = "Fall 1 help: other",
  mfallmhlp5 = "Fall 1 help: other specification",
  mfallmhlp6 = "Fall 2 help: family doctor",
  mfallmhlp7 = "Fall 2 help: first aid hospital",
  mfallmhlp8 = "Fall 2 help: nursing staff",
  mfallmhlp9 = "Fall 2 help: other",
  mfallmhlpyn1 = "Fall 1: medical help",
  mfallmhlpyn2 = "Fall 2: medical help",
  mfallphc1 = "Fall 1 cons.: fracture",
  mfallphc10 = "Fall 2 cons.: open wound",
  mfallphc11 = "Fall 2 cons.: bruise",
  mfallphc12 = "Fall 2 cons.: sprain",
  mfallphc13 = "Fall 2 cons.: dislocation",
  mfallphc14 = "Fall 2 cons.: injury nervous system",
  mfallphc15 = "Fall 2 cons.: other",
  mfallphc16 = "Fall 2 cons.: other specification",
  mfallphc2 = "Fall 1 cons.: open wound",
  mfallphc211 = "2 falls, fall 1 consequence: fracture",
  mfallphc212 = "2 falls, fall 1 consequence: open wound",
  mfallphc213 = "2 falls, fall 1 consequence: bruise",
  mfallphc214 = "2 falls, fall 1 consequence: sprain/dislocation",
  mfallphc216 = "2 falls, fall 1 consequence: concussion",
  mfallphc217 = "2 falls, fall 1 consequence: other",
  mfallphc221 = "2 falls, fall 2: consequence: fracture",
  mfallphc222 = "2 falls, fall 2: consequence: open wound",
  mfallphc223 = "2 falls, fall 2: consequence: bruise",
  mfallphc224 = "2 falls, fall 2: consequence: sprain/dislocation",
  mfallphc226 = "2 falls, fall 2: consequence: concussion",
  mfallphc227 = "2 falls, fall 2: consequence: other",
  mfallphc3 = "Fall 1 cons.: bruise",
  mfallphc311 = "> 2 falls, 1st fall with most physical consequences: consequence: fracture",
  mfallphc312 = "> 2 falls, 1st fall with most physical consequences: consequence: open wound",
  mfallphc313 = "> 2 falls, 1st fall with most physical consequences: consequence: bruise",
  mfallphc314 = "> 2 falls, 1st fall with most physical consequences: consequence: sprain/dislocation",
  mfallphc316 = "> 2 falls, 1st fall with most physical consequences: consequence: concussion",
  mfallphc317 = "> 2 falls, 1st fall with most physical consequences: consequence: other",
  mfallphc321 = "> 2 falls, 2nd fall with most physical consequences: consequence: fracture",
  mfallphc322 = "> 2 falls, 2nd fall with most physical consequences: consequence: open wound",
  mfallphc323 = "> 2 falls, 2nd fall with most physical consequences: consequence: bruise",
  mfallphc324 = "> 2 falls, 2nd fall with most physical consequences: consequence: sprain/dislocation",
  mfallphc326 = "> 2 falls, 2nd fall with most physical consequences: consequence: concussion",
  mfallphc327 = "> 2 falls, 2nd fall with most physical consequences: consequence: other",
  mfallphc4 = "Fall 1 consequence: sprain/dislocation",
  mfallphc5 = "Fall 1 cons.: dislocation",
  mfallphc6 = "Fall 1 consequence: concussion",
  mfallphc7 = "Fall 1 cons.: other",
  mfallphc8 = "Fall 1 cons.: other specification",
  mfallphc9 = "Fall 2 cons.: fracture",
  mfallphcn = "Fall: how often physical consequences",
  mfallphcnm = "Number falls physical consequencies (>= 3)",
  mfallphcyn1 = "Fall 1: physical consequences",
  mfallphcyn2 = "Fall 2: physical consequences",
  mfallphcyn211 = "2 falls, fall 1: physical consequences last fall",
  mfallphcyn221 = "2 falls, fall 2: physical consequences last fall",
  mfallphcyn311 = "> 2 falls,1st fall with most physical consequences: physical consequences last fall",
  mfallphcyn321 = "> 2 falls,2nd fall with most physical consequences: physical consequences last fall",
  mfallwh1 = "Fall 1: where",
  mfallwh2 = "Fall 2: where",
  mfallwhos1 = "Fall1 : where -> other specification",
  mfallwhos2 = "Fall 2: where -> other specification",
  mwalkaid = "Walking aid or wheelchair",
  mwalkaid1 = "Walking aid: cane",
  mwalkaid1m = "Month walking aid: cane",
  mwalkaid1y = "Year walking aid: cane",
  mwalkaid2 = "Walking aid: walker",
  mwalkaid2m = "Month walking aid: walker",
  mwalkaid2y = "Year walking aid: walker",
  mwalkaid3 = "Walking aid: rollator",
  mwalkaid3m = "Month walking aid: rollator",
  mwalkaid3y = "Year walking aid: rollator",
  mwalkaid4 = "Walking aid: wheelchair",
  mwalkaid4m = "Month walking aid: wheelchair",
  mwalkaid4y = "Year walking aid: wheelchair",
  mwalkaid5 = "Walking aid: other",
  mwalkaid5m = "Month walking aid: other",
  mwalkaid5y = "Year walking aid: other",
  mwalkaid6 = "Walking aid: other specification",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mdizzlup", "mdizzoth", "mdizzothsp", "mdizztrnhd",
  .applies_to_waves = c("C", "D", "2B", "F", "G", "3B")
)

variable_labels(
  "mdizzr",
  .applies_to_waves = c("C", "D", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "mfalladj", "mfalladj01", "mfalladj02", "mfalladj03", "mfalladj04", "mfalladj05", "mfalladj06", "mfalladj07", "mfalladj08", "mfalladj09", "mfalladj10", "mfalladj11", "mfalladj12", "mfalldo1", "mfalldo2", "mfalldoos1", "mfalldoos2", "mfallhow1", "mfallhow2", "mfallhowos1", "mfallhowos2", "mfallmhlp1", "mfallmhlp10", "mfallmhlp2", "mfallmhlp3", "mfallmhlp4", "mfallmhlp5", "mfallmhlp6", "mfallmhlp7", "mfallmhlp8", "mfallmhlp9", "mfallmhlpyn1", "mfallmhlpyn2", "mfallphc1", "mfallphc10", "mfallphc11", "mfallphc12", "mfallphc13", "mfallphc14", "mfallphc15", "mfallphc16", "mfallphc2", "mfallphc3", "mfallphc5", "mfallphc7", "mfallphc8", "mfallphc9", "mfallphcyn1", "mfallphcyn2", "mfallwh1", "mfallwh2", "mfallwhos1", "mfallwhos2",
  .applies_to_waves = c("D")
)

variable_labels(
  "mwalkaid", "mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B")
)

variable_labels(
  "mwalkaid1m", "mwalkaid1y", "mwalkaid2m", "mwalkaid2y", "mwalkaid3m", "mwalkaid3y", "mwalkaid4m", "mwalkaid4y", "mwalkaid5m", "mwalkaid5y",
  .applies_to_waves = c("D", "2B", "3B")
)

variable_labels(
  "mwalkaid6",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "3B")
)

variable_labels(
  "mdizzgup",
  .applies_to_waves = c("2B", "F", "G", "3B")
)

variable_labels(
  "mfallfc", "mfallphc4", "mfallphc6",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  "mfallmhlp",
  .applies_to_waves = c("J")
)

variable_labels(
  "mfallmhlp21", "mfallmhlp22", "mfallmhlp31", "mfallmhlp32", "mfallphc211", "mfallphc212", "mfallphc213", "mfallphc214", "mfallphc216", "mfallphc217", "mfallphc221", "mfallphc222", "mfallphc223", "mfallphc224", "mfallphc226", "mfallphc227", "mfallphc311", "mfallphc312", "mfallphc313", "mfallphc314", "mfallphc316", "mfallphc317", "mfallphc321", "mfallphc322", "mfallphc323", "mfallphc324", "mfallphc326", "mfallphc327", "mfallphcn", "mfallphcnm", "mfallphcyn211", "mfallphcyn221", "mfallphcyn311", "mfallphcyn321",
  .applies_to_waves = c("K")
)

variable_labels(
  mdizzgup = "Dizzy: Yes, getting up",
  mfallf = "Fall: how often (past year)",
  mfallly = "Did you fall last year",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  mfallfc = "Fall: (constructed) how often past year",
  mfallphc4 = "Fall 1 cons.: sprain",
  mfallphc6 = "Fall 1 cons.: injury nervous system",
  .applies_to_waves = c("D")
)

variable_labels(
  mfallf = "Fall: how often in the past year",
  mfallly = "Did you fall in the past year?",
  .applies_to_waves = c("MB")
)

variable_labels(
  mfallf = "Fall: how often since last interview",
  mfallly = "Did you fall since last interview",
  mfallphc1 = "Fall 1 consequence: fracture",
  mfallphc2 = "Fall 1 consequence: open wound",
  mfallphc3 = "Fall 1 consequence: bruise",
  mfallphc7 = "Fall 1 consequence: other",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  mfallphcyn1 = "Fall 1: physical consequencies of last fall",
  .applies_to_waves = c("J")
)

variable_labels(
  mfallmhlp1 = "Fall 1: medical help fall",
  mfallphcyn1 = "Fall 1: physical consequences last fall",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-2` = "na, see BMDIZZR",
  .applies_to_vars = c("mdizzgup", "mdizzlup", "mdizzoth", "mdizztrnhd"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-2` = "na, see DMFALLADJ",
  .applies_to_vars = c("mfalladj01", "mfalladj02", "mfalladj03", "mfalladj04", "mfalladj05", "mfalladj06", "mfalladj07", "mfalladj08", "mfalladj09", "mfalladj10", "mfalladj11"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLC",
  .applies_to_vars = c("mfalldo2", "mfallhow2", "mfallmhlpyn2", "mfallphcyn2", "mfallwh2"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLLY",
  .applies_to_vars = c("mfalldo1", "mfallfc", "mfallhow1", "mfallmhlpyn1", "mfallphcyn1", "mfallwh1"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLPHCYN2",
  .applies_to_vars = c("mfallphc10", "mfallphc11", "mfallphc12", "mfallphc13", "mfallphc14", "mfallphc15", "mfallphc9"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID",
  .applies_to_vars = c("mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-3` = "na, wrong skip",
  .applies_to_vars = c("mdizzgup", "mdizzlup", "mdizzoth", "mdizzothsp", "mdizztrnhd", "mfallf"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mdizzgup", "mdizzlup", "mdizzoth", "mdizztrnhd"),
  .applies_to_waves = c("Z", "2B", "3B")
)

value_labels(
  `-2` = "na, see BMDIZZOTH", `0` = "to be coded", `1` = "no specific reason", `2` = "bending down", `3` = "tension/ tiredness", `4` = "sickness, medication",
  .applies_to_vars = c("mdizzothsp"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-5` = "na, interview terminated", `-2` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mdizzr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see DMFALLF", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mfalladj"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfalladj01", "mfalladj02", "mfalladj03", "mfalladj04", "mfalladj05", "mfalladj06", "mfalladj07", "mfalladj08", "mfalladj09", "mfalladj10", "mfalladj11", "mfallphc10", "mfallphc11", "mfallphc12", "mfallphc13", "mfallphc14", "mfallphc15", "mfallphc9"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLADJ11", `0` = "to be coded",
  .applies_to_vars = c("mfalladj12"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mfalldo1", "mfalldo2", "mfallhow1", "mfallhow2", "mfallwh1", "mfallwh2"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLDO1", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("mfalldoos1"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLDO2", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("mfalldoos2"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see BMFALLLY", `-1` = "na, asked",
  .applies_to_vars = c("mfallf"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "1 fall", `2` = "2 falls or more",
  .applies_to_vars = c("mfallfc"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLHOW1", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("mfallhowos1"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLHOW2", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("mfallhowos2"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mfallly"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-2` = "na, see JMFALLLY", `-1` = "na, asked", `1` = "no", `2` = "yes, family doctor", `3` = "yes, hospital", `4` = "yes, family doctor and hospital",
  .applies_to_vars = c("mfallmhlp"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-2` = "na, see KMFALLPHCN", `-1` = "na, asked", `0` = "not mentioned", `1` = "no", `2` = "yes, family doctor", `3` = "yes, hospital", `4` = "yes, family doctor and hospital",
  .applies_to_vars = c("mfallmhlp1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see DMFALLMHLP9", `0` = "to be coded",
  .applies_to_vars = c("mfallmhlp10"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLMHLPYN1", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfallmhlp2", "mfallmhlp3", "mfallmhlp4"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see KMFALLPHCN", `-1` = "na, asked", `1` = "no", `2` = "yes, family doctor", `3` = "yes, hospital", `4` = "yes, family doctor and hospital",
  .applies_to_vars = c("mfallmhlp21", "mfallmhlp22", "mfallmhlp31", "mfallmhlp32"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "na ,see DMFALLMHLP4", `0` = "to be coded",
  .applies_to_vars = c("mfallmhlp5"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLMHLPYN2", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfallmhlp6", "mfallmhlp7", "mfallmhlp8", "mfallmhlp9"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mfallmhlpyn1", "mfallmhlpyn2", "mfallphcyn2"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see JMFALLLY", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfallphc1", "mfallphc2", "mfallphc3", "mfallphc4", "mfallphc6", "mfallphc7"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-2` = "na, see DMFALLPHC15", `0` = "to be coded",
  .applies_to_vars = c("mfallphc16"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfallphc211", "mfallphc212", "mfallphc213", "mfallphc214", "mfallphc216", "mfallphc217", "mfallphc221", "mfallphc222", "mfallphc223", "mfallphc224", "mfallphc226", "mfallphc227", "mfallphc311", "mfallphc312", "mfallphc313", "mfallphc314", "mfallphc316", "mfallphc317", "mfallphc321", "mfallphc322", "mfallphc323", "mfallphc324", "mfallphc326", "mfallphc327"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "na, see DMFALLPHCYN1", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfallphc5"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLPHC7", `0` = "to be coded",
  .applies_to_vars = c("mfallphc8"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see KMFALLLY", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mfallphcn"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "na, see KMFALLPHCN",
  .applies_to_vars = c("mfallphcnm"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "na, see KMFALLPHCN", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mfallphcyn1", "mfallphcyn211", "mfallphcyn221", "mfallphcyn311", "mfallphcyn321"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "na, see DMFALLWH1", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("mfallwhos1"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMFALLWH2", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("mfallwhos2"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mwalkaid"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5"),
  .applies_to_waves = c("Z", "D", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-2` = "na, see DMWALKAID1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid1m"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID1", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid1y"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID2", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid2m"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID2", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid2y"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID3", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid3m"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID3", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid3y"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID4", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid4m"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID4", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid4y"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID5", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid5m"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID5", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid5y"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMWALKAID5", `0` = "to be coded",
  .applies_to_vars = c("mwalkaid6"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see C/DMDIZZR", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mdizzgup", "mdizzlup", "mdizzoth", "mdizztrnhd"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-2` = "na, see C/DMDIZZOTH", `1` = "no specific reason", `2` = "bending down", `3` = "tension/ tiredness", `4` = "sickness, medication",
  .applies_to_vars = c("mdizzothsp"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mdizzr"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-2` = "na, see C/DFALLLY",
  .applies_to_vars = c("mfallf"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-2` = "na, see DMFALLMHLPYN1", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfallmhlp1"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DMFALLPHCYN1", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfallphc1", "mfallphc2", "mfallphc3", "mfallphc4", "mfallphc6", "mfallphc7"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mfallphcyn1"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see EMWALKAID", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see EMWALKAID5", `0` = "to be coded",
  .applies_to_vars = c("mwalkaid6"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see BMWALKAID",
  .applies_to_vars = c("mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mdizzr"),
  .applies_to_waves = c("2B", "F", "G", "H", "3B", "J", "K")
)

value_labels(
  `-2` = "na, see BMWALKAID1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid1m"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID1", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid1y"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID2", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid2m"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID2", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid2y"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID3", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid3m"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID3", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid3y"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID4", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid4m"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID4", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid4y"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID5", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mwalkaid5m"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID5", `-1` = "na, asked",
  .applies_to_vars = c("mwalkaid5y"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BMWALKAID5", `0` = "to be coded",
  .applies_to_vars = c("mwalkaid6"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see F/G/HMWALKAID",
  .applies_to_vars = c("mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5"),
  .applies_to_waves = c("F", "G", "H")
)

value_labels(
  `-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mdizzgup", "mdizzlup", "mdizzoth", "mdizztrnhd"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see F/GMDIZZOTH", `0` = "to be coded", `1` = "no specific reason", `2` = "bending down", `3` = "tension/ tiredness", `4` = "sickness, medication",
  .applies_to_vars = c("mdizzothsp"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see F/GMWALKAID5", `0` = "to be coded",
  .applies_to_vars = c("mwalkaid6"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see BMFALLLY",
  .applies_to_vars = c("mfallf"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mfallly"),
  .applies_to_waves = c("MB", "J", "K")
)

value_labels(
  `-2` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mdizzr"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see JMFALLLY", `-1` = "na, asked",
  .applies_to_vars = c("mfallf"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMFALLLY", `-1` = "na, asked", `1` = "1 fall", `2` = "2 falls or more",
  .applies_to_vars = c("mfallfc"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMFALLLY", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mfallphcyn1"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KMFALLLY", `-1` = "na, asked",
  .applies_to_vars = c("mfallf"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMFALLLY", `-1` = "na, asked", `1` = "1 fall", `2` = "2 falls or more",
  .applies_to_vars = c("mfallfc"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMFALLPHCN", `-1` = "na, asked", `1` = "no", `2` = "yes, family doctor", `3` = "yes, hospital", `4` = "yes, family doctor and hospital",
  .applies_to_vars = c("mfallmhlp1"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mfallphc1", "mfallphc2", "mfallphc3", "mfallphc4", "mfallphc6", "mfallphc7"),
  .applies_to_waves = c("K")
)

.lasa_fc_187 <- .lasa_finalize_fc("187")

