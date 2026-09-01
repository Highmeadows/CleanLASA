## LASA filecode 034 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  walk19 = "Test terminated: reason",
  .applies_to_waves = c("Z")
)

variable_labels(
  "button1", "button2", "button3",
  .applies_to_waves = c("B")
)

variable_labels(
  "cardig4", "cardig8",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "chair1", "chair2", "chair3", "chair4", "chair5", "chair6", "chair7", "walk01", "walk02", "walk03", "walk04", "walk06", "walk07", "walk19",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "chair8", "chair9", "walk08",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H")
)

variable_labels(
  "walk05",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "cardig1", "cardig5",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "K")
)

variable_labels(
  "cardig2", "cardig3", "cardig6", "cardig7",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B")
)

variable_labels(
  "cardig9",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "rmpf", "walk09", "walk10", "walk11", "walk12", "walk13", "walk14", "walk15", "walk16", "walk17", "walk18",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "tandem1", "tandem2",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "walk04a",
  .applies_to_waves = c("H", "3B", "MB", "I", "J")
)

variable_labels(
  "walk17a",
  .applies_to_waves = c("H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "chair10",
  .applies_to_waves = c("3B", "MB")
)

variable_labels(
  "tandem3", "tandem4",
  .applies_to_waves = c("J", "K")
)

variable_labels(
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
  walk18 = "Observation: other",
  .applies_to_waves = c("B")
)

variable_labels(
  cardig1 = "put on cardigan",
  cardig5 = "take off cardigan",
  .applies_to_waves = c("I", "J")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("button1", "button2", "button3", "cardig1", "cardig2", "cardig3", "cardig4", "cardig5", "cardig6", "cardig7", "cardig8", "cardig9", "chair1", "chair10", "chair2", "chair3", "chair4", "chair5", "chair6", "chair7", "chair8", "chair9", "tandem1", "tandem2", "tandem3", "tandem4", "walk01", "walk02", "walk03", "walk04", "walk04a", "walk05", "walk06", "walk07", "walk08", "walk09", "walk10", "walk11", "walk12", "walk13", "walk14", "walk15", "walk16", "walk17", "walk17a", "walk18", "walk19"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid data",
  .applies_to_vars = c("rmpf"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("button1", "cardig6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done", `5` = "wrong buttonhole",
  .applies_to_vars = c("button2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, no measurement", `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("button3", "chair6", "chair7", "chair8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-7` = "not available, technical reason", `-6` = "not available, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig2", "cardig3", "cardig7"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, no measurement", `-3` = "na, wrong skip", `-1` = "not available",
  .applies_to_vars = c("cardig4", "cardig8", "walk04", "walk05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig5"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "label varies by wave", `4` = "other way",
  .applies_to_vars = c("cardig9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("chair1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, wrong skip", `-1` = "na, asked", `0` = "no hurt", `2` = "hurts a little bit", `4` = "hurts a little more", `6` = "hurts even more", `8` = "hurts a whole lot", `10` = "hurts worst",
  .applies_to_vars = c("chair10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("chair2"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "slides forward without using arms", `2` = "slides forward using arms", `3` = "cannot slide forward", `4` = "not done/terminated",
  .applies_to_vars = c("chair3"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "succeeded without using arms", `2` = "succeeded using arms", `3` = "cannot", `4` = "not done/terminated",
  .applies_to_vars = c("chair4"),
  .applies_to_waves = c("Z", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-6` = "not available, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no: five times completed", `2` = "no: less than five times", `3` = "yes: less than five times",
  .applies_to_vars = c("chair5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("chair9"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "PF not done, not able",
  .applies_to_vars = c("rmpf"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-6` = "not available, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "normal test", `2` = "not capable", `3` = "label varies by wave", `4` = "stops within 3 sec.", `5` = "refusal", `6` = "physical impossible",
  .applies_to_vars = c("tandem1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("tandem2"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "normal test", `2` = "not capable", `3` = "immediately steps out of position (in less than 1 second)", `5` = "refusal", `6` = "physical impossible",
  .applies_to_vars = c("tandem3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("tandem4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no restrictions", `2` = "in wheelchair", `3` = "recent surgery", `4` = "recent accident", `5` = "other",
  .applies_to_vars = c("walk01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "respondent already walked", `2` = "can walk (with aid)", `3` = "can walk with aid not available", `4` = "cannot walk",
  .applies_to_vars = c("walk02"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "terminated",
  .applies_to_vars = c("walk03"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-6` = "not available, no measurement", `-3` = "not available, born after 1940", `-1` = "not available, no valid answer",
  .applies_to_vars = c("walk04a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "walkingbar", `2` = "stick", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "none",
  .applies_to_vars = c("walk06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, wrong skip", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no hurt", `1` = "no", `2` = "label varies by wave", `4` = "hurts a little more", `6` = "hurts even more", `8` = "hurts a whole lot", `10` = "hurts worst",
  .applies_to_vars = c("walk07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "parquet/tiles", `2` = "low carpet", `3` = "high carpet", `4` = "not done/terminated",
  .applies_to_vars = c("walk08"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("walk09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("walk10", "walk11", "walk12", "walk13", "walk14", "walk15", "walk16", "walk17", "walk18"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("walk17a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not enough room/time", `2` = "respondent refused", `3` = "exercise not safe", `4` = "physically not capable", `5` = "respondent did not understand", `6` = "other",
  .applies_to_vars = c("walk19"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BRMPF", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("button1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BBUTTON1", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done", `5` = "wrong buttonhole",
  .applies_to_vars = c("button2"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "na, no measuring", `-3` = "na, wrong skip", `-2` = "na, see BBUTTON2", `-1` = "na, asked",
  .applies_to_vars = c("button3"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "na, test not done", `-2` = "na, see BRMPF", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARDIG1", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig2", "cardig7"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARDIG2", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig3"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "na, no measuring", `-3` = "na, wrong skip", `-2` = "na, see BCARDIG3", `-1` = "na, asked",
  .applies_to_vars = c("cardig4"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARDIG7", `-1` = "na, asked",
  .applies_to_vars = c("cardig8"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRMPF", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("chair1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCHAIR1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("chair2"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCHAIR2", `-1` = "na, asked", `1` = "slides forward without using arms", `2` = "slides forward using arms", `3` = "cannot slide forward", `4` = "not done/terminated",
  .applies_to_vars = c("chair3"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCHAIR2", `-1` = "na, asked", `1` = "succeeded without using arms", `2` = "succeeded using arms", `3` = "cannot",
  .applies_to_vars = c("chair4"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCHAIR4", `-1` = "na, asked", `1` = "no: five times completed", `2` = "no: less than five times", `3` = "yes: less than five times",
  .applies_to_vars = c("chair5"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "na, no measuring", `-3` = "na, wrong skip", `-2` = "na, see BCHAIR4", `-1` = "na, asked",
  .applies_to_vars = c("chair6", "chair7"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCHAIR4", `-1` = "na, asked",
  .applies_to_vars = c("chair8"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCHAIR4", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("chair9"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "valid score", `1` = "short version", `2` = "interview terminated",
  .applies_to_vars = c("rmpf"),
  .applies_to_waves = c("B", "C")
)

value_labels(
  `-2` = "na, see BRMPF", `-1` = "na, asked", `1` = "no restrictions", `2` = "in wheelchair", `3` = "recent surgery", `4` = "recent accident", `5` = "other",
  .applies_to_vars = c("walk01"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BWALK01", `-1` = "na, asked", `1` = "respondent already walked", `2` = "can walk (with aid)", `3` = "can walk with aid not available", `4` = "cannot walk",
  .applies_to_vars = c("walk02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BWALK01 & 02", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "terminated",
  .applies_to_vars = c("walk03"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "na, no measuring", `-3` = "na, wrong skip", `-2` = "na, see BWALK03", `-1` = "na, asked",
  .applies_to_vars = c("walk04", "walk05"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BWALK02", `-1` = "na, asked", `1` = "walkingbar", `2` = "stick", `3` = "other", `4` = "none",
  .applies_to_vars = c("walk06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BWALK02", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("walk07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BWALK02", `-1` = "na, asked", `1` = "parquet/tiles", `2` = "low carpet", `3` = "high carpet", `4` = "not done/terminated",
  .applies_to_vars = c("walk08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BWALK03", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("walk09"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BWALK09", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("walk10", "walk11", "walk12", "walk13", "walk14", "walk15", "walk16", "walk17", "walk18"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BWALK03", `-1` = "na, asked", `1` = "not enough room/time", `2` = "R refused", `3` = "exercise not safe", `4` = "physically not capable", `5` = "R did not understand", `6` = "other",
  .applies_to_vars = c("walk19"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1",
  .applies_to_vars = c("chair2"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR1&2",
  .applies_to_vars = c("chair3", "chair4"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR4",
  .applies_to_vars = c("chair5"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KCHAIR5",
  .applies_to_vars = c("chair6", "chair7"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KRMPF",
  .applies_to_vars = c("chair1", "walk01"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01",
  .applies_to_vars = c("walk02"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK01&02",
  .applies_to_vars = c("walk03"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK03",
  .applies_to_vars = c("walk04", "walk19"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/B/I/J/KWALK09",
  .applies_to_vars = c("walk10", "walk11", "walk12", "walk13", "walk14", "walk15", "walk16", "walk17", "walk18"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG1",
  .applies_to_vars = c("cardig4", "cardig5"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KCARDIG5",
  .applies_to_vars = c("cardig8"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-7` = "na, technical missing", `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMPF",
  .applies_to_vars = c("cardig1"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/HCHAIR5",
  .applies_to_vars = c("chair8", "chair9"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/HWALK03",
  .applies_to_vars = c("walk07", "walk08"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/GWALK03",
  .applies_to_vars = c("walk05", "walk09"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KRMPF",
  .applies_to_vars = c("tandem1"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/F/G/H/B/B/I/J/KTANDEM1",
  .applies_to_vars = c("tandem2"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-6` = "na, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig1"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/D/E/B/F/G/H/BCARDIG1", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig2"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/D/E/B/F/G/H/BCARDIG2", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig3"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-6` = "na, no measurement", `-3` = "na, wrong skip", `-1` = "no (valid) answer",
  .applies_to_vars = c("cardig4", "cardig8"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/BCARDIG5", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig6"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-2` = "na, see C/D/E/B/F/G/H/BCARDIG6", `-1` = "na, asked", `1` = "completed without help", `2` = "completed with help", `3` = "terminated", `4` = "not done",
  .applies_to_vars = c("cardig7"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCARDIG1", `-1` = "na, asked", `1` = "standing", `2` = "sitting",
  .applies_to_vars = c("cardig9"),
  .applies_to_waves = c("C")
)

value_labels(
  `-6` = "na, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("chair1"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "succeeded without using arms", `2` = "succeeded using arms", `3` = "cannot",
  .applies_to_vars = c("chair4"),
  .applies_to_waves = c("C", "D", "E", "2B")
)

value_labels(
  `-6` = "na, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no: five times completed", `2` = "no: less than five times", `3` = "yes: less than five times",
  .applies_to_vars = c("chair5"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-6` = "na, no measurement", `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("chair6", "chair7"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-6` = "na, no measurement", `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("chair8"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-6` = "na, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "normal test", `2` = "not capable", `3` = "falls almost direct", `4` = "stops within 3 sec.", `5` = "refusal", `6` = "physical impossible",
  .applies_to_vars = c("tandem1"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "MB", "I")
)

value_labels(
  `-6` = "na, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no restrictions", `2` = "in wheelchair", `3` = "recent surgery", `4` = "recent accident", `5` = "other",
  .applies_to_vars = c("walk01"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-6` = "na, no measurement", `-1` = "no (valid) answer",
  .applies_to_vars = c("walk04"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-6` = "na, no measurement", `-1` = "no (valid) answer",
  .applies_to_vars = c("walk05"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "na, see CWALK03", `-1` = "na, asked", `1` = "walkingbar", `2` = "stick", `3` = "other", `4` = "none",
  .applies_to_vars = c("walk06"),
  .applies_to_waves = c("C")
)

value_labels(
  `-6` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("walk07"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("walk09"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not enough room/time", `2` = "R refused", `3` = "exercise not safe", `4` = "physically not capable", `5` = "R did not understand", `6` = "other",
  .applies_to_vars = c("walk19"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/E/BCARDIG1", `-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "otherway",
  .applies_to_vars = c("cardig9"),
  .applies_to_waves = c("D", "E", "2B")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated",
  .applies_to_vars = c("rmpf"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "MB")
)

value_labels(
  `-2` = "na, see DWALK03", `-1` = "na, asked", `1` = "walkingbar", `2` = "stick", `3` = "rollator", `4` = "other", `5` = "none",
  .applies_to_vars = c("walk06"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see E/B/F/G/H/B/B/I/JWALK03",
  .applies_to_vars = c("walk06"),
  .applies_to_waves = c("E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "walkingbar", `2` = "stick", `3` = "rollator", `4` = "leaning on objects/interviewer", `5` = "other", `6` = "none",
  .applies_to_vars = c("walk06"),
  .applies_to_waves = c("E", "2B", "F", "G", "H", "3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see F/G/H/3B/I/J/KCARDIG1", `-1` = "na, asked", `1` = "standing", `2` = "sitting", `3` = "test not done", `4` = "other way",
  .applies_to_vars = c("cardig9"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-6` = "na, no measurement", `-2` = "na, see H/B/B/I/JWALK03", `-1` = "no (valid) answer",
  .applies_to_vars = c("walk04a"),
  .applies_to_waves = c("H", "3B", "MB", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/B/I/J/KWALK09", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("walk17a"),
  .applies_to_waves = c("H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-6` = "na, wrong skip", `-2` = "na, see B/BCHAIR5", `-1` = "na, asked", `0` = "no hurt", `2` = "hurts a little bit", `4` = "hurts a little more", `6` = "hurts even more", `8` = "hurts a whole lot", `10` = "hurts worst",
  .applies_to_vars = c("chair10"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-6` = "na, wrong skip", `-2` = "na, see B/BWALK03", `-1` = "na, asked", `0` = "no hurt", `2` = "hurts a little bit", `4` = "hurts a little more", `6` = "hurts even more", `8` = "hurts a whole lot", `10` = "hurts worst",
  .applies_to_vars = c("walk07"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see B/B/I/J/KWALK03", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("walk09"),
  .applies_to_waves = c("3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "walkingbar", `2` = "stick", `3` = "rollator", `4` = "leaning on objects/interviewer", `5` = "other", `6` = "none",
  .applies_to_vars = c("walk06"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/J/KWALK03", `-1` = "na, asked", `1` = "no",
  .applies_to_vars = c("walk07"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-6` = "na, test not done", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "normal test", `2` = "not capable", `3` = "immediately steps out of position (in less than 1 second)",
  .applies_to_vars = c("tandem1"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see J/KTANDEM1", `-1` = "na, asked", `1` = "normal test", `2` = "not capable", `3` = "immediately steps out of position (in less than 1 second)", `5` = "refusal", `6` = "physical impossible",
  .applies_to_vars = c("tandem3"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see J/KTANDEM3", `-1` = "na, asked",
  .applies_to_vars = c("tandem4"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-6` = "na, no measurement", `-3` = "na, born after 1940", `-2` = "na, see H/B/B/I/JWALK03", `-1` = "no (valid) answer",
  .applies_to_vars = c("walk04a"),
  .applies_to_waves = c("J")
)

.lasa_fc_034 <- .lasa_finalize_fc("034")

