## LASA filecode 034 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  button1 = "Button: phase 1 grasping",
  button2 = "Button: phase 2 through",
  button3 = "Button: time in seconds",
  cardig1 = "Cardigan: put in 1st arm",
  cardig2 = "Cardigan: pull over shoulder",
  cardig3 = "Cardigan: put in 2nd arm",
  cardig4 = "Cardigan: time 1 in seconds",
  cardig5 = "Cardigan: free 1st arm",
  cardig6 = "Cardigan: free 2nd arm",
  cardig7 = "Cardigan: out",
  cardig8 = "Cardigan: time 2 in seconds",
  cardig9 = "Cardigan: sitting/standing",
  chair1 = "Chair: R in wheelchair",
  chair10 = "Chair: pain during test",
  chair2 = "Chair: R without help from wheelchair",
  chair3 = "Chair: sliding",
  chair4 = "Chair: rising",
  chair5 = "Chair: use of arms",
  chair6 = "Chair: number of times",
  chair7 = "Chair: time in seconds",
  chair8 = "Chair: height in cm",
  chair9 = "Observation: unstable during rise",
  rmpf = "Reason missing: Performance tests",
  tandem1 = "Tandem: able to",
  tandem2 = "Tandem: time in seconds",
  tandem3 = "Tandem: able to with eyes closed",
  tandem4 = "Tandem: time in seconds with eyes closed",
  walk01 = "Physical check",
  walk02 = "Check walking ability",
  walk03 = "R walked alone",
  walk04 = "Walking: time in seconds",
  walk04a = "Walking oneway: time in seconds",
  walk05 = "Walking: number of steps",
  walk06 = "Walking aids during tests",
  walk07 = "Walking: pain during test",
  walk08 = "Walking: type of floor",
  walk09 = "Walking observ.: particularities",
  walk10 = "Walking observ.: starting problems",
  walk11 = "Walking observ.: unstable",
  walk12 = "Walking observ.: walk with a limp",
  walk13 = "Walking observ.: stiff legs",
  walk14 = "Walking observ.: slides",
  walk15 = "Walking observ.: one leg trains",
  walk16 = "Walking observ.: unstable turn",
  walk17 = "Walking observ.: walk irregular",
  walk17a = "Walking observ.: walk small steps",
  walk18 = "Walking observ.: other",
  walk19 = "Test terminated: reason"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
    "button1",
    "button2",
    "button3",
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig7",
    "cardig8",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
    cardig1 = "Cardigan: phase 1 elbow",
    cardig2 = "Cardigan: phase 2 shoulder",
    cardig3 = "Cardigan: phase 3 other arm",
    cardig7 = "Cardigan: phase 4 out",
    rmpf = "Reason missing: performance test",
    walk09 = "Observation: particularities",
    walk10 = "Observation: starting problems",
    walk11 = "Observation: unstable",
    walk12 = "Observation: walk with a limp",
    walk13 = "Observation: stiff legs",
    walk14 = "Observation: slides",
    walk15 = "Observation: one leg trains",
    walk16 = "Observation: unstable turn",
    walk17 = "Observation: walk irregular",
    walk18 = "Observation: other"
  ),
  Wave_C_labels = harmonized_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
  Wave_D_labels = harmonized_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
  Wave_E_labels = harmonized_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
  Wave_2B_labels = harmonized_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
  Wave_F_labels = harmonized_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
  Wave_G_labels = harmonized_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
  Wave_H_labels = harmonized_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
  Wave_3B_labels = harmonized_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair10",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
  Wave_MB_labels = harmonized_labels[c(
    "chair1",
    "chair10",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "cardig1",
    "cardig4",
    "cardig5",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
    cardig1 = "put on cardigan",
    cardig5 = "take off cardigan"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "cardig1",
    "cardig4",
    "cardig5",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "tandem3",
    "tandem4",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
    cardig1 = "put on cardigan",
    cardig5 = "take off cardigan"
  ),
  Wave_K_labels = harmonized_labels[c(
    "cardig1",
    "cardig4",
    "cardig5",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "tandem3",
    "tandem4",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  button1 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
  button2 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done",
    `5` = "wrong buttonhole"
  ),
  button3 = c(
    `-6` = "not available, no measurement",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  cardig1 = c(
    `-7` = "not available, technical reason",
    `-6` = "not available, test not done",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
  cardig2 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
  cardig3 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
  cardig4 = c(
    `-6` = "not available, no measurement",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available"
  ),
  cardig5 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
  cardig6 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
  cardig7 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
  cardig8 = c(
    `-6` = "not available, no measurement",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available"
  ),
  cardig9 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "standing",
    `2` = "sitting",
    `3` = "coding category 3",
    `4` = "other way"
  ),
  chair1 = c(
    `-6` = "not available, test not done",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  chair10 = c(
    `-6` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "no hurt",
    `2` = "hurts a little bit",
    `4` = "hurts a little more",
    `6` = "hurts even more",
    `8` = "hurts a whole lot",
    `10` = "hurts worst"
  ),
  chair2 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  chair3 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "slides forward without using arms",
    `2` = "slides forward using arms",
    `3` = "cannot slide forward",
    `4` = "not done/terminated"
  ),
  chair4 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "succeeded without using arms",
    `2` = "succeeded using arms",
    `3` = "cannot",
    `4` = "not done/terminated"
  ),
  chair5 = c(
    `-6` = "not available, test not done",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no: five times completed",
    `2` = "no: less than five times",
    `3` = "yes: less than five times"
  ),
  chair6 = c(
    `-6` = "not available, no measurement",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  chair7 = c(
    `-6` = "not available, no measurement",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  chair8 = c(
    `-6` = "not available, no measurement",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  chair9 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  rmpf = c(
    `-2` = "valid data",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "PF not done, not able"
  ),
  tandem1 = c(
    `-6` = "not available, test not done",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "normal test",
    `2` = "not capable",
    `3` = "coding category 3",
    `4` = "stops within 3 sec.",
    `5` = "refusal",
    `6` = "physical impossible"
  ),
  tandem2 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  tandem3 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "normal test",
    `2` = "not capable",
    `3` = "immediately steps out of position (in less than 1 second)",
    `5` = "refusal",
    `6` = "physical impossible"
  ),
  tandem4 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  walk01 = c(
    `-6` = "not available, test not done",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no restrictions",
    `2` = "in wheelchair",
    `3` = "recent surgery",
    `4` = "recent accident",
    `5` = "other"
  ),
  walk02 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "respondent already walked",
    `2` = "can walk (with aid)",
    `3` = "can walk with aid not available",
    `4` = "cannot walk"
  ),
  walk03 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "terminated"
  ),
  walk04 = c(
    `-6` = "not available, no measurement",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available"
  ),
  walk04a = c(
    `-6` = "not available, no measurement",
    `-3` = "not available, born after 1940",
    `-2` = "not available, routing",
    `-1` = "not available, no valid answer"
  ),
  walk05 = c(
    `-6` = "not available, no measurement",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available"
  ),
  walk06 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "coding category 3",
    `4` = "coding category 4",
    `5` = "coding category 5",
    `6` = "none"
  ),
  walk07 = c(
    `-6` = "not available, wrong skip",
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "no hurt",
    `1` = "no",
    `2` = "performance category 2",
    `4` = "hurts a little more",
    `6` = "hurts even more",
    `8` = "hurts a whole lot",
    `10` = "hurts worst"
  ),
  walk08 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "parquet/tiles",
    `2` = "low carpet",
    `3` = "high carpet",
    `4` = "not done/terminated"
  ),
  walk09 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "no",
    `1` = "coding category 1",
    `2` = "yes"
  ),
  walk10 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk11 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk12 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk13 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk14 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk15 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk16 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk17 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk17a = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk18 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  walk19 = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not enough room/time",
    `2` = "respondent refused",
    `3` = "exercise not safe",
    `4` = "physically not capable",
    `5` = "respondent did not understand",
    `6` = "other"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "button1",
    "button2",
    "button3",
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig7",
    "cardig8",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
    button1 = .replace_labels(
    standardized_value_labels$button1,
    `-2` = "na, see BRMPF",
    `-1` = "na, asked"
  ),
    button2 = .replace_labels(
    standardized_value_labels$button2,
    `-3` = "na, wrong skip",
    `-2` = "na, see BBUTTON1",
    `-1` = "na, asked"
  ),
    button3 = .replace_labels(
    standardized_value_labels$button3,
    `-6` = "na, no measuring",
    `-3` = "na, wrong skip",
    `-2` = "na, see BBUTTON2",
    `-1` = "na, asked"
  ),
    cardig1 = c(
    `-6` = "na, test not done",
    `-2` = "na, see BRMPF",
    `-1` = "na, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
    cardig2 = .replace_labels(
    standardized_value_labels$cardig2,
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig3 = .replace_labels(
    standardized_value_labels$cardig3,
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARDIG2",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measuring",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARDIG3",
    `-1` = "na, asked"
  ),
    cardig7 = .replace_labels(
    standardized_value_labels$cardig7,
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig8 = c(`-3` = "na, wrong skip", `-2` = "na, see BCARDIG7", `-1` = "na, asked"),
    chair1 = c(`-2` = "na, see BRMPF", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see BCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see BCHAIR2",
    `-1` = "na, asked"
  ),
    chair4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCHAIR2",
    `-1` = "na, asked",
    `1` = "succeeded without using arms",
    `2` = "succeeded using arms",
    `3` = "cannot"
  ),
    chair5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCHAIR4",
    `-1` = "na, asked",
    `1` = "no: five times completed",
    `2` = "no: less than five times",
    `3` = "yes: less than five times"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measuring",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCHAIR4",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measuring",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCHAIR4",
    `-1` = "na, asked"
  ),
    chair8 = c(`-3` = "na, wrong skip", `-2` = "na, see BCHAIR4", `-1` = "na, asked"),
    chair9 = .replace_labels(
    standardized_value_labels$chair9,
    `-3` = "na, wrong skip",
    `-2` = "na, see BCHAIR4",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid score", `1` = "short version", `2` = "interview terminated"),
    walk01 = c(
    `-2` = "na, see BRMPF",
    `-1` = "na, asked",
    `1` = "no restrictions",
    `2` = "in wheelchair",
    `3` = "recent surgery",
    `4` = "recent accident",
    `5` = "other"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK01 & 02",
    `-1` = "na, asked"
  ),
    walk04 = .replace_labels(
    standardized_value_labels$walk04,
    `-6` = "na, no measuring",
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK03",
    `-1` = "na, asked"
  ),
    walk05 = .replace_labels(
    standardized_value_labels$walk05,
    `-6` = "na, no measuring",
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK03",
    `-1` = "na, asked"
  ),
    walk06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK02",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "other",
    `4` = "none"
  ),
    walk07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk08 = .replace_labels(
    standardized_value_labels$walk08,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK02",
    `-1` = "na, asked"
  ),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK03",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see BWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig2 = .replace_labels(
    standardized_value_labels$cardig2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig3 = .replace_labels(
    standardized_value_labels$cardig3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig6 = .replace_labels(
    standardized_value_labels$cardig6,
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5",
    `-1` = "na, asked"
  ),
    cardig7 = c(
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6",
    `-1` = "na, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARDIG1",
    `-1` = "na, asked",
    `1` = "standing",
    `2` = "sitting"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked",
    `1` = "succeeded without using arms",
    `2` = "succeeded using arms",
    `3` = "cannot"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair8 = .replace_labels(
    standardized_value_labels$chair8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    chair9 = .replace_labels(
    standardized_value_labels$chair9,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid score", `1` = "short version", `2` = "interview terminated"),
    tandem1 = .replace_labels(
    standardized_value_labels$tandem1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `3` = "falls almost direct"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk05 = c(`-6` = "na, no measurement", `-2` = "na, see C/D/E/B/F/GWALK03", `-1` = "no (valid) answer"),
    walk06 = c(
    `-2` = "na, see CWALK03",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "other",
    `4` = "none"
  ),
    walk07 = c(
    `-6` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk08 = .replace_labels(
    standardized_value_labels$walk08,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked"
  ),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GWALK03",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig2 = .replace_labels(
    standardized_value_labels$cardig2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig3 = .replace_labels(
    standardized_value_labels$cardig3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig6 = .replace_labels(
    standardized_value_labels$cardig6,
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5",
    `-1` = "na, asked"
  ),
    cardig7 = c(
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6",
    `-1` = "na, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/BCARDIG1",
    `-1` = "na, asked",
    `1` = "standing",
    `2` = "sitting",
    `3` = "otherway"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked",
    `1` = "succeeded without using arms",
    `2` = "succeeded using arms",
    `3` = "cannot"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair8 = .replace_labels(
    standardized_value_labels$chair8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    chair9 = .replace_labels(
    standardized_value_labels$chair9,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated"),
    tandem1 = .replace_labels(
    standardized_value_labels$tandem1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `3` = "falls almost direct"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk05 = c(`-6` = "na, no measurement", `-2` = "na, see C/D/E/B/F/GWALK03", `-1` = "no (valid) answer"),
    walk06 = c(
    `-2` = "na, see DWALK03",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "rollator",
    `4` = "other",
    `5` = "none"
  ),
    walk07 = c(
    `-6` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk08 = .replace_labels(
    standardized_value_labels$walk08,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked"
  ),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GWALK03",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig2 = .replace_labels(
    standardized_value_labels$cardig2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig3 = .replace_labels(
    standardized_value_labels$cardig3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig6 = .replace_labels(
    standardized_value_labels$cardig6,
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5",
    `-1` = "na, asked"
  ),
    cardig7 = c(
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6",
    `-1` = "na, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/BCARDIG1",
    `-1` = "na, asked",
    `1` = "standing",
    `2` = "sitting",
    `3` = "otherway"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked",
    `1` = "succeeded without using arms",
    `2` = "succeeded using arms",
    `3` = "cannot"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair8 = .replace_labels(
    standardized_value_labels$chair8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    chair9 = .replace_labels(
    standardized_value_labels$chair9,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated"),
    tandem1 = .replace_labels(
    standardized_value_labels$tandem1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `3` = "falls almost direct"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk05 = c(`-6` = "na, no measurement", `-2` = "na, see C/D/E/B/F/GWALK03", `-1` = "no (valid) answer"),
    walk06 = c(
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other",
    `6` = "none"
  ),
    walk07 = c(
    `-6` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk08 = .replace_labels(
    standardized_value_labels$walk08,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked"
  ),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GWALK03",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig2 = .replace_labels(
    standardized_value_labels$cardig2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig3 = .replace_labels(
    standardized_value_labels$cardig3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig6 = .replace_labels(
    standardized_value_labels$cardig6,
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5",
    `-1` = "na, asked"
  ),
    cardig7 = c(
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6",
    `-1` = "na, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/BCARDIG1",
    `-1` = "na, asked",
    `1` = "standing",
    `2` = "sitting",
    `3` = "otherway"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked",
    `1` = "succeeded without using arms",
    `2` = "succeeded using arms",
    `3` = "cannot"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair8 = .replace_labels(
    standardized_value_labels$chair8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    chair9 = .replace_labels(
    standardized_value_labels$chair9,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated"),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk05 = c(`-6` = "na, no measurement", `-2` = "na, see C/D/E/B/F/GWALK03", `-1` = "no (valid) answer"),
    walk06 = c(
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other",
    `6` = "none"
  ),
    walk07 = c(
    `-6` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk08 = .replace_labels(
    standardized_value_labels$walk08,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked"
  ),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GWALK03",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig2 = .replace_labels(
    standardized_value_labels$cardig2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig3 = .replace_labels(
    standardized_value_labels$cardig3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig6 = .replace_labels(
    standardized_value_labels$cardig6,
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5",
    `-1` = "na, asked"
  ),
    cardig7 = c(
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6",
    `-1` = "na, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = .replace_labels(
    standardized_value_labels$cardig9,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/3B/I/J/KCARDIG1",
    `-1` = "na, asked",
    `3` = "test not done"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = .replace_labels(
    standardized_value_labels$chair4,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair8 = .replace_labels(
    standardized_value_labels$chair8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    chair9 = .replace_labels(
    standardized_value_labels$chair9,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated"),
    tandem1 = .replace_labels(
    standardized_value_labels$tandem1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `3` = "falls almost direct"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk05 = c(`-6` = "na, no measurement", `-2` = "na, see C/D/E/B/F/GWALK03", `-1` = "no (valid) answer"),
    walk06 = c(
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other",
    `6` = "none"
  ),
    walk07 = c(
    `-6` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk08 = .replace_labels(
    standardized_value_labels$walk08,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked"
  ),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GWALK03",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk05",
    "walk06",
    "walk07",
    "walk08",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig2 = .replace_labels(
    standardized_value_labels$cardig2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig3 = .replace_labels(
    standardized_value_labels$cardig3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig6 = .replace_labels(
    standardized_value_labels$cardig6,
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5",
    `-1` = "na, asked"
  ),
    cardig7 = c(
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6",
    `-1` = "na, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = .replace_labels(
    standardized_value_labels$cardig9,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/3B/I/J/KCARDIG1",
    `-1` = "na, asked",
    `3` = "test not done"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = .replace_labels(
    standardized_value_labels$chair4,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair8 = .replace_labels(
    standardized_value_labels$chair8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    chair9 = .replace_labels(
    standardized_value_labels$chair9,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated"),
    tandem1 = .replace_labels(
    standardized_value_labels$tandem1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `3` = "falls almost direct"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk05 = c(`-6` = "na, no measurement", `-2` = "na, see C/D/E/B/F/GWALK03", `-1` = "no (valid) answer"),
    walk06 = c(
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other",
    `6` = "none"
  ),
    walk07 = c(
    `-6` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk08 = .replace_labels(
    standardized_value_labels$walk08,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked"
  ),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/GWALK03",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "chair8",
    "chair9",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk08",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig2 = .replace_labels(
    standardized_value_labels$cardig2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig3 = .replace_labels(
    standardized_value_labels$cardig3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig6 = .replace_labels(
    standardized_value_labels$cardig6,
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5",
    `-1` = "na, asked"
  ),
    cardig7 = c(
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6",
    `-1` = "na, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = .replace_labels(
    standardized_value_labels$cardig9,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/3B/I/J/KCARDIG1",
    `-1` = "na, asked",
    `3` = "test not done"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = .replace_labels(
    standardized_value_labels$chair4,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair8 = .replace_labels(
    standardized_value_labels$chair8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    chair9 = .replace_labels(
    standardized_value_labels$chair9,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated"),
    tandem1 = .replace_labels(
    standardized_value_labels$tandem1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `3` = "falls almost direct"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk04a = c(`-6` = "na, no measurement", `-2` = "na, see H/B/B/I/JWALK03", `-1` = "no (valid) answer"),
    walk06 = c(
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other",
    `6` = "none"
  ),
    walk07 = c(
    `-6` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk08 = .replace_labels(
    standardized_value_labels$walk08,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/HWALK03",
    `-1` = "na, asked"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17a = .replace_labels(
    standardized_value_labels$walk17a,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig2",
    "cardig3",
    "cardig4",
    "cardig5",
    "cardig6",
    "cardig7",
    "cardig8",
    "cardig9",
    "chair1",
    "chair10",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig2 = .replace_labels(
    standardized_value_labels$cardig2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1",
    `-1` = "na, asked"
  ),
    cardig3 = .replace_labels(
    standardized_value_labels$cardig3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig6 = .replace_labels(
    standardized_value_labels$cardig6,
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5",
    `-1` = "na, asked"
  ),
    cardig7 = c(
    `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6",
    `-1` = "na, asked",
    `1` = "completed without help",
    `2` = "completed with help",
    `3` = "terminated",
    `4` = "not done"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = .replace_labels(
    standardized_value_labels$cardig9,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/3B/I/J/KCARDIG1",
    `-1` = "na, asked",
    `3` = "test not done"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair10 = .replace_labels(
    standardized_value_labels$chair10,
    `-6` = "na, wrong skip",
    `-2` = "na, see B/BCHAIR5",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = .replace_labels(
    standardized_value_labels$chair4,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated"),
    tandem1 = .replace_labels(
    standardized_value_labels$tandem1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `3` = "falls almost direct"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk04a = c(`-6` = "na, no measurement", `-2` = "na, see H/B/B/I/JWALK03", `-1` = "no (valid) answer"),
    walk06 = c(
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other",
    `6` = "none"
  ),
    walk07 = c(
    `-6` = "na, wrong skip",
    `-2` = "na, see B/BWALK03",
    `-1` = "na, asked",
    `0` = "no hurt",
    `2` = "hurts a little bit",
    `4` = "hurts a little more",
    `6` = "hurts even more",
    `8` = "hurts a whole lot",
    `10` = "hurts worst"
  ),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17a = .replace_labels(
    standardized_value_labels$walk17a,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c(
    "chair1",
    "chair10",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair10 = .replace_labels(
    standardized_value_labels$chair10,
    `-6` = "na, wrong skip",
    `-2` = "na, see B/BCHAIR5",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = .replace_labels(
    standardized_value_labels$chair4,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    rmpf = c(`-2` = "valid data", `1` = "short interview", `2` = "interview terminated"),
    tandem1 = .replace_labels(
    standardized_value_labels$tandem1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `3` = "falls almost direct"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk04a = c(`-6` = "na, no measurement", `-2` = "na, see H/B/B/I/JWALK03", `-1` = "no (valid) answer"),
    walk06 = c(
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `1` = "walkingbar",
    `2` = "stick",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other",
    `6` = "none"
  ),
    walk07 = c(
    `-6` = "na, wrong skip",
    `-2` = "na, see B/BWALK03",
    `-1` = "na, asked",
    `0` = "no hurt",
    `2` = "hurts a little bit",
    `4` = "hurts a little more",
    `6` = "hurts even more",
    `8` = "hurts a whole lot",
    `10` = "hurts worst"
  ),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17a = .replace_labels(
    standardized_value_labels$walk17a,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig4",
    "cardig5",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = .replace_labels(
    standardized_value_labels$cardig9,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/3B/I/J/KCARDIG1",
    `-1` = "na, asked",
    `3` = "test not done"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = .replace_labels(
    standardized_value_labels$chair4,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    tandem1 = .replace_labels(
    standardized_value_labels$tandem1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `3` = "falls almost direct"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk04a = c(`-6` = "na, no measurement", `-2` = "na, see H/B/B/I/JWALK03", `-1` = "no (valid) answer"),
    walk06 = .replace_labels(
    standardized_value_labels$walk06,
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other"
  ),
    walk07 = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KWALK03", `-1` = "na, asked", `1` = "no"),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17a = .replace_labels(
    standardized_value_labels$walk17a,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig4",
    "cardig5",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "tandem3",
    "tandem4",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk04a",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = .replace_labels(
    standardized_value_labels$cardig9,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/3B/I/J/KCARDIG1",
    `-1` = "na, asked",
    `3` = "test not done"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = .replace_labels(
    standardized_value_labels$chair4,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    tandem1 = c(
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `1` = "normal test",
    `2` = "not capable",
    `3` = "immediately steps out of position (in less than 1 second)"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    tandem3 = .replace_labels(
    standardized_value_labels$tandem3,
    `-3` = "na, wrong skip",
    `-2` = "na, see J/KTANDEM1",
    `-1` = "na, asked"
  ),
    tandem4 = .replace_labels(
    standardized_value_labels$tandem4,
    `-3` = "na, wrong skip",
    `-2` = "na, see J/KTANDEM3",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk04a = .replace_labels(
    standardized_value_labels$walk04a,
    `-6` = "na, no measurement",
    `-3` = "na, born after 1940",
    `-2` = "na, see H/B/B/I/JWALK03",
    `-1` = "no (valid) answer"
  ),
    walk06 = .replace_labels(
    standardized_value_labels$walk06,
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other"
  ),
    walk07 = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KWALK03", `-1` = "na, asked", `1` = "no"),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17a = .replace_labels(
    standardized_value_labels$walk17a,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "cardig1",
    "cardig4",
    "cardig5",
    "cardig8",
    "cardig9",
    "chair1",
    "chair2",
    "chair3",
    "chair4",
    "chair5",
    "chair6",
    "chair7",
    "rmpf",
    "tandem1",
    "tandem2",
    "tandem3",
    "tandem4",
    "walk01",
    "walk02",
    "walk03",
    "walk04",
    "walk06",
    "walk07",
    "walk09",
    "walk10",
    "walk11",
    "walk12",
    "walk13",
    "walk14",
    "walk15",
    "walk16",
    "walk17",
    "walk17a",
    "walk18",
    "walk19"
  )],
    cardig1 = .replace_labels(
    standardized_value_labels$cardig1,
    `-7` = "na, technical missing",
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    cardig4 = .replace_labels(
    standardized_value_labels$cardig4,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "no (valid) answer"
  ),
    cardig5 = .replace_labels(
    standardized_value_labels$cardig5,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
    `-1` = "na, asked"
  ),
    cardig8 = .replace_labels(
    standardized_value_labels$cardig8,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
    `-1` = "no (valid) answer"
  ),
    cardig9 = .replace_labels(
    standardized_value_labels$cardig9,
    `-3` = "na, wrong skip",
    `-2` = "na, see F/G/H/3B/I/J/KCARDIG1",
    `-1` = "na, asked",
    `3` = "test not done"
  ),
    chair1 = .replace_labels(
    standardized_value_labels$chair1,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    chair2 = .replace_labels(
    standardized_value_labels$chair2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
    `-1` = "na, asked"
  ),
    chair3 = .replace_labels(
    standardized_value_labels$chair3,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair4 = .replace_labels(
    standardized_value_labels$chair4,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
    `-1` = "na, asked"
  ),
    chair5 = .replace_labels(
    standardized_value_labels$chair5,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
    `-1` = "na, asked"
  ),
    chair6 = .replace_labels(
    standardized_value_labels$chair6,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    chair7 = .replace_labels(
    standardized_value_labels$chair7,
    `-6` = "na, no measurement",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
    `-1` = "na, asked"
  ),
    tandem1 = c(
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked",
    `1` = "normal test",
    `2` = "not capable",
    `3` = "immediately steps out of position (in less than 1 second)"
  ),
    tandem2 = .replace_labels(
    standardized_value_labels$tandem2,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
    `-1` = "na, asked"
  ),
    tandem3 = .replace_labels(
    standardized_value_labels$tandem3,
    `-3` = "na, wrong skip",
    `-2` = "na, see J/KTANDEM1",
    `-1` = "na, asked"
  ),
    tandem4 = .replace_labels(
    standardized_value_labels$tandem4,
    `-3` = "na, wrong skip",
    `-2` = "na, see J/KTANDEM3",
    `-1` = "na, asked"
  ),
    walk01 = .replace_labels(
    standardized_value_labels$walk01,
    `-6` = "na, test not done",
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
    `-1` = "na, asked"
  ),
    walk02 = .replace_labels(
    standardized_value_labels$walk02,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
    `-1` = "na, asked"
  ),
    walk03 = .replace_labels(
    standardized_value_labels$walk03,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
    `-1` = "na, asked"
  ),
    walk04 = c(
    `-6` = "na, no measurement",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "no (valid) answer"
  ),
    walk06 = .replace_labels(
    standardized_value_labels$walk06,
    `-3` = "na, wrong skip",
    `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
    `-1` = "na, asked",
    `3` = "rollator",
    `4` = "leaning on objects/interviewer",
    `5` = "other"
  ),
    walk07 = c(`-3` = "na, wrong skip", `-2` = "na, see I/J/KWALK03", `-1` = "na, asked", `1` = "no"),
    walk09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    walk10 = .replace_labels(
    standardized_value_labels$walk10,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk11 = .replace_labels(
    standardized_value_labels$walk11,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk12 = .replace_labels(
    standardized_value_labels$walk12,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk13 = .replace_labels(
    standardized_value_labels$walk13,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk14 = .replace_labels(
    standardized_value_labels$walk14,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk15 = .replace_labels(
    standardized_value_labels$walk15,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk16 = .replace_labels(
    standardized_value_labels$walk16,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17 = .replace_labels(
    standardized_value_labels$walk17,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk17a = .replace_labels(
    standardized_value_labels$walk17a,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk18 = .replace_labels(
    standardized_value_labels$walk18,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
    `-1` = "na, asked"
  ),
    walk19 = .replace_labels(
    standardized_value_labels$walk19,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
    `-1` = "na, asked",
    `2` = "R refused",
    `5` = "R did not understand"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  button1 = "categorical",
  button2 = "categorical",
  button3 = "numeric",
  cardig1 = "categorical",
  cardig2 = "categorical",
  cardig3 = "categorical",
  cardig4 = "numeric",
  cardig5 = "categorical",
  cardig6 = "categorical",
  cardig7 = "categorical",
  cardig8 = "numeric",
  cardig9 = "categorical",
  chair1 = "categorical",
  chair10 = "categorical",
  chair2 = "categorical",
  chair3 = "categorical",
  chair4 = "categorical",
  chair5 = "categorical",
  chair6 = "numeric",
  chair7 = "numeric",
  chair8 = "numeric",
  chair9 = "categorical",
  rmpf = "categorical",
  tandem1 = "categorical",
  tandem2 = "numeric",
  tandem3 = "categorical",
  tandem4 = "numeric",
  walk01 = "categorical",
  walk02 = "categorical",
  walk03 = "categorical",
  walk04 = "numeric",
  walk04a = "numeric",
  walk05 = "numeric",
  walk06 = "categorical",
  walk07 = "categorical",
  walk08 = "categorical",
  walk09 = "categorical",
  walk10 = "categorical",
  walk11 = "categorical",
  walk12 = "categorical",
  walk13 = "categorical",
  walk14 = "categorical",
  walk15 = "categorical",
  walk16 = "categorical",
  walk17 = "categorical",
  walk17a = "categorical",
  walk18 = "categorical",
  walk19 = "categorical"
)

.lasa_fc_034 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "034", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "034", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "034", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "034", waves = .lasa_wave_rows())
)
