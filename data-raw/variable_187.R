## LASA filecode 187 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  mwalkaid6 = "Walking aid: other specification"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("mdizzgup", "mdizzlup", "mdizzoth", "mdizzothsp", "mdizzr", "mdizztrnhd", "mfallf", "mfallly")],
    mdizzgup = "Dizzy: Yes, getting up",
    mfallf = "Fall: how often (past year)",
    mfallly = "Did you fall last year"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzothsp",
    "mdizzr",
    "mdizztrnhd",
    "mfalladj",
    "mfalladj01",
    "mfalladj02",
    "mfalladj03",
    "mfalladj04",
    "mfalladj05",
    "mfalladj06",
    "mfalladj07",
    "mfalladj08",
    "mfalladj09",
    "mfalladj10",
    "mfalladj11",
    "mfalladj12",
    "mfalldo1",
    "mfalldo2",
    "mfalldoos1",
    "mfalldoos2",
    "mfallf",
    "mfallfc",
    "mfallhow1",
    "mfallhow2",
    "mfallhowos1",
    "mfallhowos2",
    "mfallly",
    "mfallmhlp1",
    "mfallmhlp10",
    "mfallmhlp2",
    "mfallmhlp3",
    "mfallmhlp4",
    "mfallmhlp5",
    "mfallmhlp6",
    "mfallmhlp7",
    "mfallmhlp8",
    "mfallmhlp9",
    "mfallmhlpyn1",
    "mfallmhlpyn2",
    "mfallphc1",
    "mfallphc10",
    "mfallphc11",
    "mfallphc12",
    "mfallphc13",
    "mfallphc14",
    "mfallphc15",
    "mfallphc16",
    "mfallphc2",
    "mfallphc3",
    "mfallphc4",
    "mfallphc5",
    "mfallphc6",
    "mfallphc7",
    "mfallphc8",
    "mfallphc9",
    "mfallphcyn1",
    "mfallphcyn2",
    "mfallwh1",
    "mfallwh2",
    "mfallwhos1",
    "mfallwhos2",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid1m",
    "mwalkaid1y",
    "mwalkaid2",
    "mwalkaid2m",
    "mwalkaid2y",
    "mwalkaid3",
    "mwalkaid3m",
    "mwalkaid3y",
    "mwalkaid4",
    "mwalkaid4m",
    "mwalkaid4y",
    "mwalkaid5",
    "mwalkaid5m",
    "mwalkaid5y",
    "mwalkaid6"
  )],
    mdizzgup = "Dizzy: Yes, getting up",
    mfallf = "Fall: how often (past year)",
    mfallfc = "Fall: (constructed) how often past year",
    mfallly = "Did you fall last year",
    mfallphc4 = "Fall 1 cons.: sprain",
    mfallphc6 = "Fall 1 cons.: injury nervous system"
  ),
  Wave_E_labels = harmonized_labels[c("mwalkaid", "mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5", "mwalkaid6")],
  Wave_2B_labels = harmonized_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzothsp",
    "mdizzr",
    "mdizztrnhd",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid1m",
    "mwalkaid1y",
    "mwalkaid2",
    "mwalkaid2m",
    "mwalkaid2y",
    "mwalkaid3",
    "mwalkaid3m",
    "mwalkaid3y",
    "mwalkaid4",
    "mwalkaid4m",
    "mwalkaid4y",
    "mwalkaid5",
    "mwalkaid5m",
    "mwalkaid5y",
    "mwalkaid6"
  )],
  Wave_F_labels = harmonized_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzothsp",
    "mdizzr",
    "mdizztrnhd",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid2",
    "mwalkaid3",
    "mwalkaid4",
    "mwalkaid5",
    "mwalkaid6"
  )],
  Wave_G_labels = harmonized_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzothsp",
    "mdizzr",
    "mdizztrnhd",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid2",
    "mwalkaid3",
    "mwalkaid4",
    "mwalkaid5",
    "mwalkaid6"
  )],
  Wave_H_labels = harmonized_labels[c("mdizzr", "mwalkaid", "mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5")],
  Wave_3B_labels = harmonized_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzothsp",
    "mdizzr",
    "mdizztrnhd",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid1m",
    "mwalkaid1y",
    "mwalkaid2",
    "mwalkaid2m",
    "mwalkaid2y",
    "mwalkaid3",
    "mwalkaid3m",
    "mwalkaid3y",
    "mwalkaid4",
    "mwalkaid4m",
    "mwalkaid4y",
    "mwalkaid5",
    "mwalkaid5m",
    "mwalkaid5y",
    "mwalkaid6"
  )],
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c("mfallf", "mfallly")],
    mfallf = "Fall: how often in the past year",
    mfallly = "Did you fall in the past year?"
  ),
  Wave_I_labels = harmonized_labels[c("mdizzr")],
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "mdizzr",
    "mfallf",
    "mfallfc",
    "mfallly",
    "mfallmhlp",
    "mfallphc1",
    "mfallphc2",
    "mfallphc3",
    "mfallphc4",
    "mfallphc6",
    "mfallphc7",
    "mfallphcyn1"
  )],
    mfallf = "Fall: how often since last interview",
    mfallly = "Did you fall since last interview",
    mfallphc1 = "Fall 1 consequence: fracture",
    mfallphc2 = "Fall 1 consequence: open wound",
    mfallphc3 = "Fall 1 consequence: bruise",
    mfallphc7 = "Fall 1 consequence: other",
    mfallphcyn1 = "Fall 1: physical consequencies of last fall"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c(
    "mdizzr",
    "mfallf",
    "mfallfc",
    "mfallly",
    "mfallmhlp1",
    "mfallmhlp21",
    "mfallmhlp22",
    "mfallmhlp31",
    "mfallmhlp32",
    "mfallphc1",
    "mfallphc2",
    "mfallphc211",
    "mfallphc212",
    "mfallphc213",
    "mfallphc214",
    "mfallphc216",
    "mfallphc217",
    "mfallphc221",
    "mfallphc222",
    "mfallphc223",
    "mfallphc224",
    "mfallphc226",
    "mfallphc227",
    "mfallphc3",
    "mfallphc311",
    "mfallphc312",
    "mfallphc313",
    "mfallphc314",
    "mfallphc316",
    "mfallphc317",
    "mfallphc321",
    "mfallphc322",
    "mfallphc323",
    "mfallphc324",
    "mfallphc326",
    "mfallphc327",
    "mfallphc4",
    "mfallphc6",
    "mfallphc7",
    "mfallphcn",
    "mfallphcnm",
    "mfallphcyn1",
    "mfallphcyn211",
    "mfallphcyn221",
    "mfallphcyn311",
    "mfallphcyn321"
  )],
    mfallf = "Fall: how often since last interview",
    mfallly = "Did you fall since last interview",
    mfallmhlp1 = "Fall 1: medical help fall",
    mfallphc1 = "Fall 1 consequence: fracture",
    mfallphc2 = "Fall 1 consequence: open wound",
    mfallphc3 = "Fall 1 consequence: bruise",
    mfallphc7 = "Fall 1 consequence: other",
    mfallphcyn1 = "Fall 1: physical consequences last fall"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mdizzgup = c(`-3` = "na, wrong skip", `-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
  mdizzlup = c(`-3` = "na, wrong skip", `-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
  mdizzoth = c(`-3` = "na, wrong skip", `-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
  mdizzothsp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BMDIZZOTH",
    `0` = "to be coded",
    `1` = "no specific reason",
    `2` = "bending down",
    `3` = "tension/ tiredness",
    `4` = "sickness, medication"
  ),
  mdizzr = c(
    `-5` = "na, interview terminated",
    `-2` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mdizztrnhd = c(`-3` = "na, wrong skip", `-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj = c(`-2` = "na, see DMFALLF", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mfalladj01 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj02 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj03 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj04 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj05 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj06 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj07 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj08 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj09 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj10 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj11 = c(`-2` = "na, see DMFALLADJ", `0` = "not mentioned", `1` = "mentioned"),
  mfalladj12 = c(`-2` = "na, see DMFALLADJ11", `0` = "to be coded"),
  mfalldo1 = c(`-2` = "na, see DMFALLLY", `-1` = "na, asked"),
  mfalldo2 = c(`-2` = "na, see DMFALLC", `-1` = "na, asked"),
  mfalldoos1 = c(`-2` = "na, see DMFALLDO1", `-1` = "na, asked", `0` = "to be coded"),
  mfalldoos2 = c(`-2` = "na, see DMFALLDO2", `-1` = "na, asked", `0` = "to be coded"),
  mfallf = c(`-3` = "na, wrong skip", `-2` = "na, see BMFALLLY", `-1` = "na, asked"),
  mfallfc = c(`-2` = "na, see DMFALLLY", `-1` = "na, asked", `1` = "1 fall", `2` = "2 falls or more"),
  mfallhow1 = c(`-2` = "na, see DMFALLLY", `-1` = "na, asked"),
  mfallhow2 = c(`-2` = "na, see DMFALLC", `-1` = "na, asked"),
  mfallhowos1 = c(`-2` = "na, see DMFALLHOW1", `-1` = "na, asked", `0` = "to be coded"),
  mfallhowos2 = c(`-2` = "na, see DMFALLHOW2", `-1` = "na, asked", `0` = "to be coded"),
  mfallly = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mfallmhlp = c(
    `-2` = "na, see JMFALLLY",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family doctor",
    `3` = "yes, hospital",
    `4` = "yes, family doctor and hospital"
  ),
  mfallmhlp1 = c(
    `-2` = "na, see KMFALLPHCN",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "no",
    `2` = "yes, family doctor",
    `3` = "yes, hospital",
    `4` = "yes, family doctor and hospital"
  ),
  mfallmhlp10 = c(`-2` = "na, see DMFALLMHLP9", `0` = "to be coded"),
  mfallmhlp2 = c(`-2` = "na, see DMFALLMHLPYN1", `0` = "not mentioned", `1` = "mentioned"),
  mfallmhlp21 = c(
    `-2` = "na, see KMFALLPHCN",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family doctor",
    `3` = "yes, hospital",
    `4` = "yes, family doctor and hospital"
  ),
  mfallmhlp22 = c(
    `-2` = "na, see KMFALLPHCN",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family doctor",
    `3` = "yes, hospital",
    `4` = "yes, family doctor and hospital"
  ),
  mfallmhlp3 = c(`-2` = "na, see DMFALLMHLPYN1", `0` = "not mentioned", `1` = "mentioned"),
  mfallmhlp31 = c(
    `-2` = "na, see KMFALLPHCN",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family doctor",
    `3` = "yes, hospital",
    `4` = "yes, family doctor and hospital"
  ),
  mfallmhlp32 = c(
    `-2` = "na, see KMFALLPHCN",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family doctor",
    `3` = "yes, hospital",
    `4` = "yes, family doctor and hospital"
  ),
  mfallmhlp4 = c(`-2` = "na, see DMFALLMHLPYN1", `0` = "not mentioned", `1` = "mentioned"),
  mfallmhlp5 = c(`-2` = "na ,see DMFALLMHLP4", `0` = "to be coded"),
  mfallmhlp6 = c(`-2` = "na, see DMFALLMHLPYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallmhlp7 = c(`-2` = "na, see DMFALLMHLPYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallmhlp8 = c(`-2` = "na, see DMFALLMHLPYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallmhlp9 = c(`-2` = "na, see DMFALLMHLPYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallmhlpyn1 = c(`-2` = "na, see DMFALLLY", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mfallmhlpyn2 = c(`-2` = "na, see DMFALLC", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mfallphc1 = c(`-2` = "na, see JMFALLLY", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc10 = c(`-2` = "na, see DMFALLPHCYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc11 = c(`-2` = "na, see DMFALLPHCYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc12 = c(`-2` = "na, see DMFALLPHCYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc13 = c(`-2` = "na, see DMFALLPHCYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc14 = c(`-2` = "na, see DMFALLPHCYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc15 = c(`-2` = "na, see DMFALLPHCYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc16 = c(`-2` = "na, see DMFALLPHC15", `0` = "to be coded"),
  mfallphc2 = c(`-2` = "na, see JMFALLLY", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc211 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc212 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc213 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc214 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc216 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc217 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc221 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc222 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc223 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc224 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc226 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc227 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc3 = c(`-2` = "na, see JMFALLLY", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc311 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc312 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc313 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc314 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc316 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc317 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc321 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc322 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc323 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc324 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc326 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc327 = c(`-2` = "na, see KMFALLPHCN", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc4 = c(`-2` = "na, see JMFALLLY", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc5 = c(`-2` = "na, see DMFALLPHCYN1", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc6 = c(`-2` = "na, see JMFALLLY", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc7 = c(`-2` = "na, see JMFALLLY", `0` = "not mentioned", `1` = "mentioned"),
  mfallphc8 = c(`-2` = "na, see DMFALLPHC7", `0` = "to be coded"),
  mfallphc9 = c(`-2` = "na, see DMFALLPHCYN2", `0` = "not mentioned", `1` = "mentioned"),
  mfallphcn = c(`-2` = "na, see KMFALLLY", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mfallphcnm = c(`-2` = "na, see KMFALLPHCN"),
  mfallphcyn1 = c(
    `-2` = "na, see DMFALLLY",
    `-1` = "na, asked",
    `0` = "na, see KMFALLPHCN",
    `1` = "no",
    `2` = "yes"
  ),
  mfallphcyn2 = c(`-2` = "na, see DMFALLC", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mfallphcyn211 = c(`-1` = "na, asked", `0` = "na, see KMFALLPHCN", `1` = "no", `2` = "yes"),
  mfallphcyn221 = c(`-1` = "na, asked", `0` = "na, see KMFALLPHCN", `1` = "no", `2` = "yes"),
  mfallphcyn311 = c(`-1` = "na, asked", `0` = "na, see KMFALLPHCN", `1` = "no", `2` = "yes"),
  mfallphcyn321 = c(`-1` = "na, asked", `0` = "na, see KMFALLPHCN", `1` = "no", `2` = "yes"),
  mfallwh1 = c(`-2` = "na, see DMFALLLY", `-1` = "na, asked"),
  mfallwh2 = c(`-2` = "na, see DMFALLC", `-1` = "na, asked"),
  mfallwhos1 = c(`-2` = "na, see DMFALLWH1", `-1` = "na, asked", `0` = "to be coded"),
  mfallwhos2 = c(`-2` = "na, see DMFALLWH2", `-1` = "na, asked", `0` = "to be coded"),
  mwalkaid = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  mwalkaid1 = c(`-2` = "na, see DMWALKAID", `0` = "not mentioned", `1` = "mentioned"),
  mwalkaid1m = c(
    `-2` = "na, see DMWALKAID1",
    `-1` = "na, asked",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  mwalkaid1y = c(`-2` = "na, see DMWALKAID1", `-1` = "na, asked"),
  mwalkaid2 = c(`-2` = "na, see DMWALKAID", `0` = "not mentioned", `1` = "mentioned"),
  mwalkaid2m = c(
    `-2` = "na, see DMWALKAID2",
    `-1` = "na, asked",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  mwalkaid2y = c(`-2` = "na, see DMWALKAID2", `-1` = "na, asked"),
  mwalkaid3 = c(`-2` = "na, see DMWALKAID", `0` = "not mentioned", `1` = "mentioned"),
  mwalkaid3m = c(
    `-2` = "na, see DMWALKAID3",
    `-1` = "na, asked",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  mwalkaid3y = c(`-2` = "na, see DMWALKAID3", `-1` = "na, asked"),
  mwalkaid4 = c(`-2` = "na, see DMWALKAID", `0` = "not mentioned", `1` = "mentioned"),
  mwalkaid4m = c(
    `-2` = "na, see DMWALKAID4",
    `-1` = "na, asked",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  mwalkaid4y = c(`-2` = "na, see DMWALKAID4", `-1` = "na, asked"),
  mwalkaid5 = c(`-2` = "na, see DMWALKAID", `0` = "not mentioned", `1` = "mentioned"),
  mwalkaid5m = c(
    `-2` = "na, see DMWALKAID5",
    `-1` = "na, asked",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  mwalkaid5y = c(`-2` = "na, see DMWALKAID5", `-1` = "na, asked"),
  mwalkaid6 = c(`-2` = "na, see DMWALKAID5", `0` = "to be coded")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("mdizzgup", "mdizzlup", "mdizzoth", "mdizzothsp", "mdizzr", "mdizztrnhd", "mfallf", "mfallly")],
    mdizzgup = .replace_labels(
    standardized_value_labels$mdizzgup,
    `-2` = "na, see C/DMDIZZR"
  ),
    mdizzlup = .replace_labels(
    standardized_value_labels$mdizzlup,
    `-2` = "na, see C/DMDIZZR"
  ),
    mdizzoth = .replace_labels(
    standardized_value_labels$mdizzoth,
    `-2` = "na, see C/DMDIZZR"
  ),
    mdizzothsp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMDIZZOTH",
    `1` = "no specific reason",
    `2` = "bending down",
    `3` = "tension/ tiredness",
    `4` = "sickness, medication"
  ),
    mdizzr = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mdizztrnhd = .replace_labels(
    standardized_value_labels$mdizztrnhd,
    `-2` = "na, see C/DMDIZZR"
  ),
    mfallf = c(`-3` = "na, wrong skip", `-2` = "na, see C/DFALLLY")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzothsp",
    "mdizzr",
    "mdizztrnhd",
    "mfalladj",
    "mfalladj01",
    "mfalladj02",
    "mfalladj03",
    "mfalladj04",
    "mfalladj05",
    "mfalladj06",
    "mfalladj07",
    "mfalladj08",
    "mfalladj09",
    "mfalladj10",
    "mfalladj11",
    "mfalladj12",
    "mfalldo1",
    "mfalldo2",
    "mfalldoos1",
    "mfalldoos2",
    "mfallf",
    "mfallfc",
    "mfallhow1",
    "mfallhow2",
    "mfallhowos1",
    "mfallhowos2",
    "mfallly",
    "mfallmhlp1",
    "mfallmhlp10",
    "mfallmhlp2",
    "mfallmhlp3",
    "mfallmhlp4",
    "mfallmhlp5",
    "mfallmhlp6",
    "mfallmhlp7",
    "mfallmhlp8",
    "mfallmhlp9",
    "mfallmhlpyn1",
    "mfallmhlpyn2",
    "mfallphc1",
    "mfallphc10",
    "mfallphc11",
    "mfallphc12",
    "mfallphc13",
    "mfallphc14",
    "mfallphc15",
    "mfallphc16",
    "mfallphc2",
    "mfallphc3",
    "mfallphc4",
    "mfallphc5",
    "mfallphc6",
    "mfallphc7",
    "mfallphc8",
    "mfallphc9",
    "mfallphcyn1",
    "mfallphcyn2",
    "mfallwh1",
    "mfallwh2",
    "mfallwhos1",
    "mfallwhos2",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid1m",
    "mwalkaid1y",
    "mwalkaid2",
    "mwalkaid2m",
    "mwalkaid2y",
    "mwalkaid3",
    "mwalkaid3m",
    "mwalkaid3y",
    "mwalkaid4",
    "mwalkaid4m",
    "mwalkaid4y",
    "mwalkaid5",
    "mwalkaid5m",
    "mwalkaid5y",
    "mwalkaid6"
  )],
    mdizzgup = .replace_labels(
    standardized_value_labels$mdizzgup,
    `-2` = "na, see C/DMDIZZR"
  ),
    mdizzlup = .replace_labels(
    standardized_value_labels$mdizzlup,
    `-2` = "na, see C/DMDIZZR"
  ),
    mdizzoth = .replace_labels(
    standardized_value_labels$mdizzoth,
    `-2` = "na, see C/DMDIZZR"
  ),
    mdizzothsp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMDIZZOTH",
    `1` = "no specific reason",
    `2` = "bending down",
    `3` = "tension/ tiredness",
    `4` = "sickness, medication"
  ),
    mdizzr = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mdizztrnhd = .replace_labels(
    standardized_value_labels$mdizztrnhd,
    `-2` = "na, see C/DMDIZZR"
  ),
    mfallf = c(`-3` = "na, wrong skip", `-2` = "na, see C/DFALLLY"),
    mfallmhlp1 = c(`-2` = "na, see DMFALLMHLPYN1", `0` = "not mentioned", `1` = "mentioned"),
    mfallphc1 = .replace_labels(
    standardized_value_labels$mfallphc1,
    `-2` = "na, see DMFALLPHCYN1"
  ),
    mfallphc2 = .replace_labels(
    standardized_value_labels$mfallphc2,
    `-2` = "na, see DMFALLPHCYN1"
  ),
    mfallphc3 = .replace_labels(
    standardized_value_labels$mfallphc3,
    `-2` = "na, see DMFALLPHCYN1"
  ),
    mfallphc4 = .replace_labels(
    standardized_value_labels$mfallphc4,
    `-2` = "na, see DMFALLPHCYN1"
  ),
    mfallphc6 = .replace_labels(
    standardized_value_labels$mfallphc6,
    `-2` = "na, see DMFALLPHCYN1"
  ),
    mfallphc7 = .replace_labels(
    standardized_value_labels$mfallphc7,
    `-2` = "na, see DMFALLPHCYN1"
  ),
    mfallphcyn1 = c(`-2` = "na, see DMFALLLY", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("mwalkaid", "mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5", "mwalkaid6")],
    mwalkaid1 = .replace_labels(
    standardized_value_labels$mwalkaid1,
    `-2` = "na, see EMWALKAID"
  ),
    mwalkaid2 = .replace_labels(
    standardized_value_labels$mwalkaid2,
    `-2` = "na, see EMWALKAID"
  ),
    mwalkaid3 = .replace_labels(
    standardized_value_labels$mwalkaid3,
    `-2` = "na, see EMWALKAID"
  ),
    mwalkaid4 = .replace_labels(
    standardized_value_labels$mwalkaid4,
    `-2` = "na, see EMWALKAID"
  ),
    mwalkaid5 = .replace_labels(
    standardized_value_labels$mwalkaid5,
    `-2` = "na, see EMWALKAID"
  ),
    mwalkaid6 = .replace_labels(
    standardized_value_labels$mwalkaid6,
    `-2` = "na, see EMWALKAID5"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzothsp",
    "mdizzr",
    "mdizztrnhd",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid1m",
    "mwalkaid1y",
    "mwalkaid2",
    "mwalkaid2m",
    "mwalkaid2y",
    "mwalkaid3",
    "mwalkaid3m",
    "mwalkaid3y",
    "mwalkaid4",
    "mwalkaid4m",
    "mwalkaid4y",
    "mwalkaid5",
    "mwalkaid5m",
    "mwalkaid5y",
    "mwalkaid6"
  )],
    mdizzgup = c(`-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzlup = c(`-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzoth = c(`-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzothsp = c(
    `-2` = "na, see BMDIZZOTH",
    `0` = "to be coded",
    `1` = "no specific reason",
    `2` = "bending down",
    `3` = "tension/ tiredness",
    `4` = "sickness, medication"
  ),
    mdizzr = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mdizztrnhd = c(`-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mwalkaid1 = .replace_labels(
    standardized_value_labels$mwalkaid1,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid1m = .replace_labels(
    standardized_value_labels$mwalkaid1m,
    `-2` = "na, see BMWALKAID1"
  ),
    mwalkaid1y = .replace_labels(
    standardized_value_labels$mwalkaid1y,
    `-2` = "na, see BMWALKAID1"
  ),
    mwalkaid2 = .replace_labels(
    standardized_value_labels$mwalkaid2,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid2m = .replace_labels(
    standardized_value_labels$mwalkaid2m,
    `-2` = "na, see BMWALKAID2"
  ),
    mwalkaid2y = .replace_labels(
    standardized_value_labels$mwalkaid2y,
    `-2` = "na, see BMWALKAID2"
  ),
    mwalkaid3 = .replace_labels(
    standardized_value_labels$mwalkaid3,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid3m = .replace_labels(
    standardized_value_labels$mwalkaid3m,
    `-2` = "na, see BMWALKAID3"
  ),
    mwalkaid3y = .replace_labels(
    standardized_value_labels$mwalkaid3y,
    `-2` = "na, see BMWALKAID3"
  ),
    mwalkaid4 = .replace_labels(
    standardized_value_labels$mwalkaid4,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid4m = .replace_labels(
    standardized_value_labels$mwalkaid4m,
    `-2` = "na, see BMWALKAID4"
  ),
    mwalkaid4y = .replace_labels(
    standardized_value_labels$mwalkaid4y,
    `-2` = "na, see BMWALKAID4"
  ),
    mwalkaid5 = .replace_labels(
    standardized_value_labels$mwalkaid5,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid5m = .replace_labels(
    standardized_value_labels$mwalkaid5m,
    `-2` = "na, see BMWALKAID5"
  ),
    mwalkaid5y = .replace_labels(
    standardized_value_labels$mwalkaid5y,
    `-2` = "na, see BMWALKAID5"
  ),
    mwalkaid6 = .replace_labels(
    standardized_value_labels$mwalkaid6,
    `-2` = "na, see BMWALKAID5"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzothsp",
    "mdizzr",
    "mdizztrnhd",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid2",
    "mwalkaid3",
    "mwalkaid4",
    "mwalkaid5",
    "mwalkaid6"
  )],
    mdizzgup = c(`-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzlup = c(`-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzoth = c(`-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzothsp = c(
    `-2` = "na, see F/GMDIZZOTH",
    `0` = "to be coded",
    `1` = "no specific reason",
    `2` = "bending down",
    `3` = "tension/ tiredness",
    `4` = "sickness, medication"
  ),
    mdizzr = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mdizztrnhd = c(`-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mwalkaid1 = .replace_labels(
    standardized_value_labels$mwalkaid1,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid2 = .replace_labels(
    standardized_value_labels$mwalkaid2,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid3 = .replace_labels(
    standardized_value_labels$mwalkaid3,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid4 = .replace_labels(
    standardized_value_labels$mwalkaid4,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid5 = .replace_labels(
    standardized_value_labels$mwalkaid5,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid6 = .replace_labels(
    standardized_value_labels$mwalkaid6,
    `-2` = "na, see F/GMWALKAID5"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzothsp",
    "mdizzr",
    "mdizztrnhd",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid2",
    "mwalkaid3",
    "mwalkaid4",
    "mwalkaid5",
    "mwalkaid6"
  )],
    mdizzgup = c(`-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzlup = c(`-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzoth = c(`-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzothsp = c(
    `-2` = "na, see F/GMDIZZOTH",
    `0` = "to be coded",
    `1` = "no specific reason",
    `2` = "bending down",
    `3` = "tension/ tiredness",
    `4` = "sickness, medication"
  ),
    mdizzr = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mdizztrnhd = c(`-2` = "na, see F/GMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mwalkaid1 = .replace_labels(
    standardized_value_labels$mwalkaid1,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid2 = .replace_labels(
    standardized_value_labels$mwalkaid2,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid3 = .replace_labels(
    standardized_value_labels$mwalkaid3,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid4 = .replace_labels(
    standardized_value_labels$mwalkaid4,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid5 = .replace_labels(
    standardized_value_labels$mwalkaid5,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid6 = .replace_labels(
    standardized_value_labels$mwalkaid6,
    `-2` = "na, see F/GMWALKAID5"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("mdizzr", "mwalkaid", "mwalkaid1", "mwalkaid2", "mwalkaid3", "mwalkaid4", "mwalkaid5")],
    mdizzr = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwalkaid1 = .replace_labels(
    standardized_value_labels$mwalkaid1,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid2 = .replace_labels(
    standardized_value_labels$mwalkaid2,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid3 = .replace_labels(
    standardized_value_labels$mwalkaid3,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid4 = .replace_labels(
    standardized_value_labels$mwalkaid4,
    `-2` = "na, see F/G/HMWALKAID"
  ),
    mwalkaid5 = .replace_labels(
    standardized_value_labels$mwalkaid5,
    `-2` = "na, see F/G/HMWALKAID"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mdizzgup",
    "mdizzlup",
    "mdizzoth",
    "mdizzr",
    "mdizztrnhd",
    "mwalkaid",
    "mwalkaid1",
    "mwalkaid1m",
    "mwalkaid1y",
    "mwalkaid2",
    "mwalkaid2m",
    "mwalkaid2y",
    "mwalkaid3",
    "mwalkaid3m",
    "mwalkaid3y",
    "mwalkaid4",
    "mwalkaid4m",
    "mwalkaid4y",
    "mwalkaid5",
    "mwalkaid5m",
    "mwalkaid5y",
    "mwalkaid6"
  )],
    mdizzgup = c(`-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzlup = c(`-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzoth = c(`-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mdizzr = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mdizztrnhd = c(`-2` = "na, see BMDIZZR", `0` = "not mentioned", `1` = "mentioned"),
    mwalkaid1 = .replace_labels(
    standardized_value_labels$mwalkaid1,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid1m = .replace_labels(
    standardized_value_labels$mwalkaid1m,
    `-2` = "na, see BMWALKAID1"
  ),
    mwalkaid1y = .replace_labels(
    standardized_value_labels$mwalkaid1y,
    `-2` = "na, see BMWALKAID1"
  ),
    mwalkaid2 = .replace_labels(
    standardized_value_labels$mwalkaid2,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid2m = .replace_labels(
    standardized_value_labels$mwalkaid2m,
    `-2` = "na, see BMWALKAID2"
  ),
    mwalkaid2y = .replace_labels(
    standardized_value_labels$mwalkaid2y,
    `-2` = "na, see BMWALKAID2"
  ),
    mwalkaid3 = .replace_labels(
    standardized_value_labels$mwalkaid3,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid3m = .replace_labels(
    standardized_value_labels$mwalkaid3m,
    `-2` = "na, see BMWALKAID3"
  ),
    mwalkaid3y = .replace_labels(
    standardized_value_labels$mwalkaid3y,
    `-2` = "na, see BMWALKAID3"
  ),
    mwalkaid4 = .replace_labels(
    standardized_value_labels$mwalkaid4,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid4m = .replace_labels(
    standardized_value_labels$mwalkaid4m,
    `-2` = "na, see BMWALKAID4"
  ),
    mwalkaid4y = .replace_labels(
    standardized_value_labels$mwalkaid4y,
    `-2` = "na, see BMWALKAID4"
  ),
    mwalkaid5 = .replace_labels(
    standardized_value_labels$mwalkaid5,
    `-2` = "na, see BMWALKAID"
  ),
    mwalkaid5m = .replace_labels(
    standardized_value_labels$mwalkaid5m,
    `-2` = "na, see BMWALKAID5"
  ),
    mwalkaid5y = .replace_labels(
    standardized_value_labels$mwalkaid5y,
    `-2` = "na, see BMWALKAID5"
  ),
    mwalkaid6 = .replace_labels(
    standardized_value_labels$mwalkaid6,
    `-2` = "na, see BMWALKAID5"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("mfallf", "mfallly")],
    mfallf = c(`-2` = "na, see BMFALLLY"),
    mfallly = c(`-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("mdizzr")],
    mdizzr = c(`-2` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "mdizzr",
    "mfallf",
    "mfallfc",
    "mfallly",
    "mfallmhlp",
    "mfallphc1",
    "mfallphc2",
    "mfallphc3",
    "mfallphc4",
    "mfallphc6",
    "mfallphc7",
    "mfallphcyn1"
  )],
    mdizzr = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mfallf = c(`-2` = "na, see JMFALLLY", `-1` = "na, asked"),
    mfallfc = .replace_labels(
    standardized_value_labels$mfallfc,
    `-2` = "na, see JMFALLLY"
  ),
    mfallly = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mfallphcyn1 = c(`-2` = "na, see JMFALLLY", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "mdizzr",
    "mfallf",
    "mfallfc",
    "mfallly",
    "mfallmhlp1",
    "mfallmhlp21",
    "mfallmhlp22",
    "mfallmhlp31",
    "mfallmhlp32",
    "mfallphc1",
    "mfallphc2",
    "mfallphc211",
    "mfallphc212",
    "mfallphc213",
    "mfallphc214",
    "mfallphc216",
    "mfallphc217",
    "mfallphc221",
    "mfallphc222",
    "mfallphc223",
    "mfallphc224",
    "mfallphc226",
    "mfallphc227",
    "mfallphc3",
    "mfallphc311",
    "mfallphc312",
    "mfallphc313",
    "mfallphc314",
    "mfallphc316",
    "mfallphc317",
    "mfallphc321",
    "mfallphc322",
    "mfallphc323",
    "mfallphc324",
    "mfallphc326",
    "mfallphc327",
    "mfallphc4",
    "mfallphc6",
    "mfallphc7",
    "mfallphcn",
    "mfallphcnm",
    "mfallphcyn1",
    "mfallphcyn211",
    "mfallphcyn221",
    "mfallphcyn311",
    "mfallphcyn321"
  )],
    mdizzr = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mfallf = c(`-2` = "na, see KMFALLLY", `-1` = "na, asked"),
    mfallfc = .replace_labels(
    standardized_value_labels$mfallfc,
    `-2` = "na, see KMFALLLY"
  ),
    mfallly = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mfallmhlp1 = c(
    `-2` = "na, see KMFALLPHCN",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family doctor",
    `3` = "yes, hospital",
    `4` = "yes, family doctor and hospital"
  ),
    mfallphc1 = .replace_labels(
    standardized_value_labels$mfallphc1,
    `-2` = "na, see KMFALLPHCN"
  ),
    mfallphc2 = .replace_labels(
    standardized_value_labels$mfallphc2,
    `-2` = "na, see KMFALLPHCN"
  ),
    mfallphc3 = .replace_labels(
    standardized_value_labels$mfallphc3,
    `-2` = "na, see KMFALLPHCN"
  ),
    mfallphc4 = .replace_labels(
    standardized_value_labels$mfallphc4,
    `-2` = "na, see KMFALLPHCN"
  ),
    mfallphc6 = .replace_labels(
    standardized_value_labels$mfallphc6,
    `-2` = "na, see KMFALLPHCN"
  ),
    mfallphc7 = .replace_labels(
    standardized_value_labels$mfallphc7,
    `-2` = "na, see KMFALLPHCN"
  ),
    mfallphcyn1 = c(`-1` = "na, asked", `0` = "na, see KMFALLPHCN", `1` = "no", `2` = "yes")
  ),
  Harmonized_labels = standardized_value_labels
)

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

.lasa_fc_187 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "187", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "187", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "187", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "187", waves = .lasa_wave_rows())
)
