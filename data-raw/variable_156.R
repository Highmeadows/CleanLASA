## LASA filecode 156 -- variable names, variable labels, value labels,
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
  m15wdrm = "categorical",
  m15wrp0 = "categorical",
  m15wrp1 = "categorical",
  m15wrp2 = "categorical",
  m15wrp3 = "categorical",
  m15wrp4 = "categorical",
  m15wrp5 = "categorical",
  m15wrpx = "text",
  m15wrt = "numeric",
  m15wrth = "numeric",
  m15wrtm = "numeric",
  m15wt = "categorical",
  m15wt101 = "categorical",
  m15wt102 = "categorical",
  m15wt103 = "categorical",
  m15wt104 = "categorical",
  m15wt105 = "categorical",
  m15wt106 = "categorical",
  m15wt107 = "categorical",
  m15wt108 = "categorical",
  m15wt109 = "categorical",
  m15wt110 = "categorical",
  m15wt111 = "categorical",
  m15wt112 = "categorical",
  m15wt113 = "categorical",
  m15wt114 = "categorical",
  m15wt115 = "categorical",
  m15wt1nd = "numeric",
  m15wt1no = "numeric",
  m15wt201 = "categorical",
  m15wt202 = "categorical",
  m15wt203 = "categorical",
  m15wt204 = "categorical",
  m15wt205 = "categorical",
  m15wt206 = "categorical",
  m15wt207 = "categorical",
  m15wt208 = "categorical",
  m15wt209 = "categorical",
  m15wt210 = "categorical",
  m15wt211 = "categorical",
  m15wt212 = "categorical",
  m15wt213 = "categorical",
  m15wt214 = "categorical",
  m15wt215 = "categorical",
  m15wt2nd = "numeric",
  m15wt2no = "numeric",
  m15wt301 = "categorical",
  m15wt302 = "categorical",
  m15wt303 = "categorical",
  m15wt304 = "categorical",
  m15wt305 = "categorical",
  m15wt306 = "categorical",
  m15wt307 = "categorical",
  m15wt308 = "categorical",
  m15wt309 = "categorical",
  m15wt310 = "categorical",
  m15wt311 = "categorical",
  m15wt312 = "categorical",
  m15wt313 = "categorical",
  m15wt314 = "categorical",
  m15wt315 = "categorical",
  m15wt3nd = "numeric",
  m15wt3no = "numeric",
  m15wtdr = "numeric",
  m15wth = "numeric",
  m15wtm = "numeric",
  m15wtp0 = "categorical",
  m15wtp1 = "categorical",
  m15wtp2 = "categorical",
  m15wtp3 = "categorical",
  m15wtp4 = "categorical",
  m15wtp5 = "categorical",
  m15wtpx = "text",
  m15wtr = "categorical",
  m15wtr01 = "categorical",
  m15wtr02 = "categorical",
  m15wtr03 = "categorical",
  m15wtr04 = "categorical",
  m15wtr05 = "categorical",
  m15wtr06 = "categorical",
  m15wtr07 = "categorical",
  m15wtr08 = "categorical",
  m15wtr09 = "categorical",
  m15wtr10 = "categorical",
  m15wtr11 = "categorical",
  m15wtr12 = "categorical",
  m15wtr13 = "categorical",
  m15wtr14 = "categorical",
  m15wtr15 = "categorical",
  m15wtrm = "categorical",
  m15wtrnd = "numeric",
  m15wtrno = "numeric",
  mrecal = "categorical",
  mrecalc = "numeric",
  mrecali = "numeric",
  mrm15wt = "categorical",
  mwtdr = "numeric",
  mwtt1 = "numeric",
  mwtt2 = "numeric",
  mwtt3 = "numeric"
)

# define variable labels ----
variable_labels(
  m15wdrm = "reason no recall test",
  m15wrp0 = "recall particul: no particularities",
  m15wrp1 = "recall particul: others present",
  m15wrp2 = "recall particul: auditory handicap",
  m15wrp3 = "recall particul: radio or tv noise",
  m15wrp4 = "recall particul: interrupted",
  m15wrp5 = "recall particul: other reason",
  m15wrpx = "recall particul: other: specification",
  m15wrt = "Time: by interviewer (before recall)",
  m15wrth = "recall time: hours by interviewer",
  m15wrtm = "recall time: minutes by interviewer",
  m15wt = "15 words test done",
  m15wt101 = "15 words (1): word 1",
  m15wt102 = "15 words (1): word 2",
  m15wt103 = "15 words (1): word 3",
  m15wt104 = "15 words (1): word 4",
  m15wt105 = "15 words (1): word 5",
  m15wt106 = "15 words (1): word 6",
  m15wt107 = "15 words (1): word 7",
  m15wt108 = "15 words (1): word 8",
  m15wt109 = "15 words (1): word 9",
  m15wt110 = "15 words (1): word 10",
  m15wt111 = "15 words (1): word 11",
  m15wt112 = "15 words (1): word 12",
  m15wt113 = "15 words (1): word 13",
  m15wt114 = "15 words (1): word 14",
  m15wt115 = "15 words (1): word 15",
  m15wt1nd = "15 words (1): number of doubles",
  m15wt1no = "15 words (1): number of others",
  m15wt201 = "15 words (2): word 1",
  m15wt202 = "15 words (2): word 2",
  m15wt203 = "15 words (2): word 3",
  m15wt204 = "15 words (2): word 4",
  m15wt205 = "15 words (2): word 5",
  m15wt206 = "15 words (2): word 6",
  m15wt207 = "15 words (2): word 7",
  m15wt208 = "15 words (2): word 8",
  m15wt209 = "15 words (2): word 9",
  m15wt210 = "15 words (2): word 10",
  m15wt211 = "15 words (2): word 11",
  m15wt212 = "15 words (2): word 12",
  m15wt213 = "15 words (2): word 13",
  m15wt214 = "15 words (2): word 14",
  m15wt215 = "15 words (2): word 15",
  m15wt2nd = "15 words (2): number of doubles",
  m15wt2no = "15 words (2): number of others",
  m15wt301 = "15 words (3): word 1",
  m15wt302 = "15 words (3): word 2",
  m15wt303 = "15 words (3): word 3",
  m15wt304 = "15 words (3): word 4",
  m15wt305 = "15 words (3): word 5",
  m15wt306 = "15 words (3): word 6",
  m15wt307 = "15 words (3): word 7",
  m15wt308 = "15 words (3): word 8",
  m15wt309 = "15 words (3): word 9",
  m15wt310 = "15 words (3): word 10",
  m15wt311 = "15 words (3): word 11",
  m15wt312 = "15 words (3): word 12",
  m15wt313 = "15 words (3): word 13",
  m15wt314 = "15 words (3): word 14",
  m15wt315 = "15 words (3): word 15",
  m15wt3nd = "15 words (3): number of doubles",
  m15wt3no = "15 words (3): number of others",
  m15wtdr = "number of words correct: recall",
  m15wth = "Time: hours by interviewer",
  m15wtm = "Time: minutes by interviewer",
  m15wtp0 = "particularities: no particularities",
  m15wtp1 = "particularities: others present",
  m15wtp2 = "particularities: auditory handicap",
  m15wtp3 = "particularities: radio or tv noise",
  m15wtp4 = "particularities: interrupted",
  m15wtp5 = "particularities: other reason",
  m15wtpx = "particularities other: specification",
  m15wtr = "15wt recall done",
  m15wtr01 = "15 words (recall): word 1",
  m15wtr02 = "15 words (recall): word 2",
  m15wtr03 = "15 words (recall): word 3",
  m15wtr04 = "15 words (recall): word 4",
  m15wtr05 = "15 words (recall): word 5",
  m15wtr06 = "15 words (recall): word 6",
  m15wtr07 = "15 words (recall): word 7",
  m15wtr08 = "15 words (recall): word 8",
  m15wtr09 = "15 words (recall): word 9",
  m15wtr10 = "15 words (recall): word 10",
  m15wtr11 = "15 words (recall): word 11",
  m15wtr12 = "15 words (recall): word 12",
  m15wtr13 = "15 words (recall): word 13",
  m15wtr14 = "15 words (recall): word 14",
  m15wtr15 = "15 words (recall): word 15",
  m15wtrm = "15 wt: reason no test(s)",
  m15wtrnd = "15 words (recall): number of doubles",
  m15wtrno = "15 words (recall): number of others",
  mrecal = "15 word test time interval in minutes",
  mrecalc = "15 wt: interval in min. by computer",
  mrecali = "15 wt: interval in min. by interviewer",
  mrm15wt = "Reason missing (part of) 15 words test",
  mwtdr = "number of words correct: recall",
  mwtt1 = "numbers of words correct: trial 1",
  mwtt2 = "Number of words correct: trial 2",
  mwtt3 = "Number of words correct: trial 3",
  .applies_to_waves = c("Z")
)

variable_labels(
  "m15wt101", "m15wt102", "m15wt103", "m15wt104", "m15wt105", "m15wt106", "m15wt107", "m15wt108", "m15wt109", "m15wt110", "m15wt111", "m15wt112", "m15wt113", "m15wt114", "m15wt115", "m15wt201", "m15wt202", "m15wt203", "m15wt204", "m15wt205", "m15wt206", "m15wt207", "m15wt208", "m15wt209", "m15wt210", "m15wt211", "m15wt212", "m15wt213", "m15wt214", "m15wt215", "m15wt301", "m15wt302", "m15wt303", "m15wt304", "m15wt305", "m15wt306", "m15wt307", "m15wt308", "m15wt309", "m15wt310", "m15wt311", "m15wt312", "m15wt313", "m15wt314", "m15wt315", "m15wtr01", "m15wtr02", "m15wtr03", "m15wtr04", "m15wtr05", "m15wtr06", "m15wtr07", "m15wtr08", "m15wtr09", "m15wtr10", "m15wtr11", "m15wtr12", "m15wtr13", "m15wtr14", "m15wtr15", "mrecal",
  .applies_to_waves = c("B")
)

variable_labels(
  "m15wt1nd", "m15wt1no", "m15wt2nd", "m15wt2no", "m15wt3nd", "m15wt3no", "m15wtrnd", "m15wtrno",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "m15wdrm", "m15wtrm", "mrecalc",
  .applies_to_waves = c("C")
)

variable_labels(
  "m15wrp0", "m15wrp3", "m15wrp4", "m15wrp5", "m15wtp0", "m15wtp1", "m15wtp3", "m15wtp4", "m15wtp5", "m15wtpx",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "m15wrp2", "m15wth", "m15wtm", "m15wtp2",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "mrecali",
  .applies_to_waves = c("C", "H", "3B", "I", "J", "K")
)

variable_labels(
  "m15wrp1", "m15wrtm", "m15wt", "m15wtr",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "m15wrth", "m15wtdr", "mwtt2", "mwtt3",
  .applies_to_waves = c("D", "E", "2B", "F", "G")
)

variable_labels(
  "mrm15wt",
  .applies_to_waves = c("F", "G")
)

variable_labels(
  "m15wrpx", "m15wrt", "mwtdr", "mwtt1",
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

variable_labels(
  m15wrth = "Time: hours",
  m15wth = "Time interview: hours",
  m15wtm = "Time interview: minutes",
  m15wtrm = "Time: minutes",
  .applies_to_waves = c("B")
)

variable_labels(
  m15wrp1 = "recall particul: other present",
  m15wrpx = "recall particul other: specification",
  m15wrth = "Recall time: hours by interviewer",
  m15wrtm = "Recall time: minutes by interviewer",
  m15wt = "15 word test done?",
  m15wtr = "15wt Recall done",
  mwtdr = "Number of words correct: recall",
  .applies_to_waves = c("C")
)

variable_labels(
  m15wrpx = "recall particul: other specification",
  mrecali = "15 words recall: interval in minutes",
  mwtt1 = "Number of words correct: trial 1",
  .applies_to_waves = c("D", "E", "2B", "F", "G")
)

variable_labels(
  m15wrp2 = "recall particul: visually handicapped",
  m15wth = "Time by interviewer (after 3 trials)",
  m15wtp2 = "particularities: visually handicapped",
  mwtt2 = "number of words correct: trial 2",
  mwtt3 = "number of words correct: trial 3",
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "recall test not done",
  .applies_to_vars = c("mrecali"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "no recall test",
  .applies_to_vars = c("m15wrp0", "m15wrp1", "m15wrp2", "m15wrp3", "m15wrp4", "m15wrp5"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-4` = "interview terminated",
  .applies_to_vars = c("m15wdrm", "m15wrp0", "m15wrp1", "m15wrp2", "m15wrp3", "m15wrp4", "m15wrp5", "m15wrpx", "m15wt", "m15wt1no", "m15wtp0", "m15wtpx", "m15wtr", "m15wtrm", "mwtdr"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `0` = "recall done", `1` = "see cm15wtrm", `2` = "refused",
  .applies_to_vars = c("m15wdrm"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "no particularities / no recall test", `-1` = "no other reason", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wrp0", "m15wrp2", "m15wrp3", "m15wrp4", "m15wrp5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no particularities / na, see d/e/b/f/gm15wrp0", `-1` = "no other reason", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wrp1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities / na, see d/e/b/f/gm15wrp0", `-1` = "no other reason", `0` = "to be coded", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit", `4` = "stopped/technical", `5` = "not specified",
  .applies_to_vars = c("m15wrpx"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no test", `-1` = "no valid time data",
  .applies_to_vars = c("m15wrt"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no test", `-1` = "no valid time data",
  .applies_to_vars = c("m15wrth"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "no recall test", `-1` = "na, asked",
  .applies_to_vars = c("m15wrtm"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J", "K")
)

value_labels(
  `1` = "15 wt not done", `2` = "15 wt done",
  .applies_to_vars = c("m15wt"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wt101", "m15wt102", "m15wt103", "m15wt104", "m15wt105", "m15wt106", "m15wt107", "m15wt108", "m15wt109", "m15wt110", "m15wt111", "m15wt112", "m15wt113", "m15wt114", "m15wt115", "m15wt201", "m15wt202", "m15wt203", "m15wt204", "m15wt205", "m15wt206", "m15wt207", "m15wt208", "m15wt209", "m15wt210", "m15wt211", "m15wt212", "m15wt213", "m15wt214", "m15wt215", "m15wt301", "m15wt302", "m15wt303", "m15wt304", "m15wt305", "m15wt306", "m15wt307", "m15wt308", "m15wt309", "m15wt310", "m15wt311", "m15wt312", "m15wt313", "m15wt314", "m15wt315", "m15wtr01", "m15wtr02", "m15wtr03", "m15wtr04", "m15wtr05", "m15wtr06", "m15wtr07", "m15wtr08", "m15wtr09", "m15wtr10", "m15wtr11", "m15wtr12", "m15wtr13", "m15wtr14", "m15wtr15"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "no test",
  .applies_to_vars = c("m15wt1nd"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("m15wt1no"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("m15wtdr", "m15wtm"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "no test", `-1` = "no valid data / no valid time data",
  .applies_to_vars = c("m15wth"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities / no test", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wtp0"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see d/e/b/f/gm15wtp0", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wtp1"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "no test", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wtp2", "m15wtp3", "m15wtp4", "m15wtp5"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities / na, see d/e/b/f/gm15wtp5", `-1` = "no other reason", `0` = "to be coded", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit", `4` = "stopped/technical", `5` = "not specified",
  .applies_to_vars = c("m15wtpx"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes / recall test not done", `2` = "no / recall test done",
  .applies_to_vars = c("m15wtr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "test [partially] done", `1` = "skipped", `2` = "refused", `3` = "cognitive", `4` = "physical", `5` = "technical", `6` = "unknown",
  .applies_to_vars = c("m15wtrm"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "no recall test h/b/ -1: no answer, asked i/j/km15wtrnd 15 words (recall): number of doubles", `-1` = "no valid data / no recall test",
  .applies_to_vars = c("m15wtrno"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no valid time data",
  .applies_to_vars = c("mrecal"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "no valid time data",
  .applies_to_vars = c("mrecalc"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "no valid time data",
  .applies_to_vars = c("mrecali"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "valid score", `0` = "to be coded", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to (cognitive)", `6` = "not able to (physical)", `7` = "technical problems", `8` = "unknown",
  .applies_to_vars = c("mrm15wt"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `-2` = "no recall test",
  .applies_to_vars = c("mwtdr"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no test",
  .applies_to_vars = c("mwtt1", "mwtt2", "mwtt3"),
  .applies_to_waves = c("Z", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("m15wth", "m15wtrno"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no particularities", `-1` = "no other reason", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wrp0", "m15wrp1", "m15wrp2", "m15wrp3", "m15wrp4", "m15wrp5"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities", `-1` = "no other reason", `0` = "to be coded", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit",
  .applies_to_vars = c("m15wrpx"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wtp0"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no test", `-2` = "no particularities", `-1` = "no other reason", `0` = "to be coded", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit", `4` = "stopped/technical", `5` = "not specified",
  .applies_to_vars = c("m15wtpx"),
  .applies_to_waves = c("C")
)

value_labels(
  `1` = "yes", `2` = "no",
  .applies_to_vars = c("m15wtr"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "no recall test",
  .applies_to_vars = c("m15wtrno"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see d/e/b/f/gm15wrp0",
  .applies_to_vars = c("m15wrp1", "m15wrpx"),
  .applies_to_waves = c("D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "no recall test", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wrp0", "m15wrp2", "m15wrp3", "m15wrp4", "m15wrp5"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wrp1"),
  .applies_to_waves = c("D", "E", "2B", "F", "G")
)

value_labels(
  `0` = "to be coded", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit",
  .applies_to_vars = c("m15wrpx"),
  .applies_to_waves = c("D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "no recall test",
  .applies_to_vars = c("m15wrtm"),
  .applies_to_waves = c("D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "no test",
  .applies_to_vars = c("m15wth"),
  .applies_to_waves = c("D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = "no test", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wtp0"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see d/e/b/f/gm15wtp5", `-1` = "no other reason", `0` = "to be coded", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit", `4` = "stopped/technical", `5` = "not specified",
  .applies_to_vars = c("m15wtpx"),
  .applies_to_waves = c("D", "E", "2B", "F", "G")
)

value_labels(
  `1` = "recall test not done", `2` = "recall test done",
  .applies_to_vars = c("m15wtr"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see h/b/i/j/km15wrp0", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wrp1"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see h/b/i/j/km15wrp5", `0` = "to be coded", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit", `4` = "stopped/technical", `5` = "not specified",
  .applies_to_vars = c("m15wrpx"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no answer, asked",
  .applies_to_vars = c("m15wt1no"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no test", `-1` = "no valid time data",
  .applies_to_vars = c("m15wth"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see H/B/I/J/KM15WTP0", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("m15wtp1"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see h/b/i/j/km15wtp5", `-1` = "no other reason", `0` = "to be coded", `1` = "extra instructions", `2` = "other disturbing factors", `3` = "R confused/not fit", `4` = "stopped/technical", `5` = "not specified",
  .applies_to_vars = c("m15wtpx"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no recall test h/b/ -1: no answer, asked i/j/km15wtrnd 15 words (recall): number of doubles",
  .applies_to_vars = c("m15wtrno"),
  .applies_to_waves = c("H", "3B", "I", "J", "K")
)

.lasa_fc_156 <- .lasa_finalize_fc("156")
.lasa_fc_156$variables <- .lasa_fc_156$variables |>
  .override_label(wave = "B", variable = "m15wrth", override_value = "bm15twtrh") |>
  .override_label(wave = "C", variable = "m15wrth", override_value = "c15wtrth") |>
  .override_label(wave = "C", variable = "m15wrtm", override_value = "c15wtrtm") |>
  .override_label(wave = "C", variable = "m15wtp1", override_value = "cm15wpt1") |>
  .override_label(wave = "C", variable = "m15wtp2", override_value = "cm15wpt2") |>
  .override_label(wave = "C", variable = "m15wtp3", override_value = "cm15wpt3") |>
  .override_label(wave = "C", variable = "m15wtp4", override_value = "cm15wpt4") |>
  .override_label(wave = "C", variable = "m15wtp5", override_value = "cm15wpt5")

