## LASA filecode 151 -- variable names, variable labels, value labels,
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
  marmds0 = "numeric",
  marmds01 = "numeric",
  marmds02 = "numeric",
  marmds1 = "numeric",
  marmds2 = "numeric",
  marmds3 = "numeric",
  marmds4 = "numeric",
  marmlds1 = "numeric",
  marmlps1 = "numeric",
  marmlss1 = "numeric",
  marmpa0 = "categorical",
  marmpa1 = "categorical",
  marmpa2 = "categorical",
  marmpa3 = "categorical",
  marmpa4 = "categorical",
  marmpa4o = "categorical",
  marmpar = "categorical",
  marmps0 = "numeric",
  marmps01 = "numeric",
  marmps02 = "numeric",
  marmps1 = "numeric",
  marmps2 = "numeric",
  marmps3 = "numeric",
  marmps4 = "numeric",
  marmsds1 = "numeric",
  marmsps1 = "numeric",
  marmss0 = "numeric",
  marmss01 = "numeric",
  marmss02 = "numeric",
  marmss1 = "numeric",
  marmss2 = "numeric",
  marmss3 = "numeric",
  marmss4 = "numeric",
  marmsss1 = "numeric",
  mfinds1 = "numeric",
  mfinpo1 = "categorical",
  mfinpos1 = "categorical",
  mfinps1 = "numeric",
  mfinps2 = "numeric",
  mfinps3 = "numeric",
  mfinss1 = "numeric",
  rm151 = "categorical"
)

# define variable labels ----
variable_labels(
  marmds0 = "Pretest blood pressure 0 sitting (arm) mmHg: diastolic",
  marmds01 = "Pretest 1: bloodpr sit (arm) mmHg: diastolic",
  marmds02 = "Pretest 2: bloodpr sit (arm) mmHg: diastolic",
  marmds1 = "Blood pressure 1 sitting (arm) mmHg: diastolic",
  marmds2 = "Blood pressure 2 sitting (arm) mmHg: diastolic",
  marmds3 = "Blood pressure 3 sitting (arm) mmHg: diastolic",
  marmds4 = "Retest Bloodpr 4 sitting (arm) mmHg: diastolic",
  marmlds1 = "Bloodpr lying (arm) mmHg: diastolic",
  marmlps1 = "Pulse rate lying (arm)",
  marmlss1 = "Bloodpr lying (arm) mmHg: systolic",
  marmpa0 = "Pretest blood pressure particularities",
  marmpa1 = "Blood pressure particularities item 1",
  marmpa2 = "Blood pressure particularities item 2",
  marmpa3 = "Partic. bloodpressure: cannot lie down",
  marmpa4 = "Partic. bloodpressure: other",
  marmpa4o = "Partic other: specification",
  marmpar = "Particularities bloodpressure",
  marmps0 = "Pretest pulse rate 0 sitting (arm)",
  marmps01 = "Pretest 1: pulse rate sit (arm)",
  marmps02 = "Pretest 2: pulse rate sit (arm)",
  marmps1 = "Pulse rate 1 sitting (arm)",
  marmps2 = "Pulse rate 2 sitting (arm)",
  marmps3 = "Pulse rate 3 sitting (arm)",
  marmps4 = "Retest Pulse rate 4 sitting (arm)",
  marmsds1 = "Bloodpr standing (arm) mmHg: diastolic",
  marmsps1 = "Pulse rate standing (arm)",
  marmss0 = "Pretest blood pressure 0 sitting (arm) mmHg: systolic",
  marmss01 = "Pretest 1: bloodpr sit (arm) mmHg: systolic",
  marmss02 = "Pretest 2: bloodpr sit (arm) mmHg: systolic",
  marmss1 = "Blood pressure 1 sitting (arm) mmHg: systolic",
  marmss2 = "Blood pressure 2 sitting (arm) mmHg: systolic",
  marmss3 = "Blood pressure 3 sitting (arm) mmHg: systolic",
  marmss4 = "Retest Bloodpr 4 sitting (arm) mmHg: systolic",
  marmsss1 = "Bloodpr standing (arm) mmHg: systolic",
  mfinds1 = "Bloodpressure (finger) mmHg: diastolic",
  mfinpo1 = "Blood pressure (finger): position",
  mfinpos1 = "Blood pressure (finger): position",
  mfinps1 = "Pulse rate measurement 1",
  mfinps2 = "Pulse rate (2)",
  mfinps3 = "Pulse rate (3)",
  mfinss1 = "Bloodpressure (finger) mmHg: systolic",
  rm151 = "Reason missing: LASAC151",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mfinps2", "mfinps3",
  .applies_to_waves = c("B")
)

variable_labels(
  "marmlds1", "marmlps1", "marmlss1", "marmpa3", "marmpa4", "marmsds1", "marmsps1", "marmsss1", "mfinds1", "mfinss1",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  "marmpa4o", "mfinpos1", "rm151",
  .applies_to_waves = c("C")
)

variable_labels(
  "marmpar",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "mfinpo1",
  .applies_to_waves = c("D")
)

variable_labels(
  "marmps1", "marmps2",
  .applies_to_waves = c("E", "F", "G", "3B", "MB")
)

variable_labels(
  "marmps3",
  .applies_to_waves = c("E", "F", "G")
)

variable_labels(
  "marmds4", "marmps4", "marmss4",
  .applies_to_waves = c("2B")
)

variable_labels(
  "marmds01", "marmds02", "marmps01", "marmps02", "marmss01", "marmss02",
  .applies_to_waves = c("3B")
)

variable_labels(
  mfinps1 = "Pulse rate (1)",
  .applies_to_waves = c("B")
)

variable_labels(
  marmds1 = "Bloodpr sitting (arm) mmHg: diastolic",
  marmpa1 = "Partic. bloodpressure: cannot stand",
  marmpa2 = "Partic. bloodpressure: cannot sit",
  marmps1 = "Pulse rate sitting (arm)",
  marmss1 = "Bloodpr sitting (arm) mmHg: systolic",
  mfinps1 = "Pulse rate (finger)",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  marmds1 = "Bloodpr 1 sitting (arm) mmHg: diastolic",
  marmds2 = "Bloodpr 2 sitting (arm) mmHg: diastolic",
  marmss1 = "Bloodpr 1 sitting (arm) mmHg: systolic",
  marmss2 = "Bloodpr 2 sitting (arm) mmHg: systolic",
  .applies_to_waves = c("E", "2B", "F", "G", "3B", "MB")
)

variable_labels(
  marmds3 = "Bloodpr 3 sitting (arm) mmHg: diastolic",
  marmss3 = "Bloodpr 3 sitting (arm) mmHg: systolic",
  .applies_to_waves = c("E", "F", "G")
)

variable_labels(
  marmds3 = "Retest Bloodpr 3 sitting (arm) mmHg: diastolic",
  marmpa1 = "Particularities bloodpressure",
  marmpa2 = "Retest Particularities bloodpressure",
  marmps1 = "Pulse rate sitting (arm) 1",
  marmps2 = "Pulse rate sitting (arm) 2",
  marmps3 = "Retest Pulse rate 3 sitting (arm)",
  marmss3 = "Retest Bloodpr 3 sitting (arm) mmHg: systolic",
  .applies_to_waves = c("2B")
)

variable_labels(
  marmds0 = "Pretest: bloodpr 0 sit (arm) mmHg: diastolic",
  marmps0 = "Pretest: pulse rate 0 sit (arm)",
  marmss0 = "Pretest: bloodpr 0 sit (arm) mmHg: systolic",
  .applies_to_waves = c("G")
)

variable_labels(
  marmpa0 = "Particularities bloodpressure Pretest",
  .applies_to_waves = c("G", "H", "3B")
)

variable_labels(
  marmds0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: diastolic",
  marmds1 = "Bloodpressure (1) sitting (arm) mmHg: diastolic",
  marmps0 = "Pretest: pulse rate (0) sitting (arm)",
  marmps1 = "Pulse rate (1) sitting (arm)",
  marmss0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: systolic",
  marmss1 = "Bloodpressure (1) sitting (arm) mmHg: systolic",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  marmpa0 = "Particularities bloodpressure pretest",
  .applies_to_waves = c("I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("marmds1", "marmds3", "marmpa0", "marmpa1", "marmpa2", "marmpar", "marmps0", "marmps02", "marmps2", "marmss0", "marmss01", "marmss1", "marmss3", "mfinds1", "mfinpos1", "mfinps1", "mfinss1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available",
  .applies_to_vars = c("marmpa0", "marmpa1", "marmpa2", "marmpa3", "marmpa4", "marmpa4o", "marmpar", "marmss1", "marmss3", "mfinpos1", "mfinss1", "rm151"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not available", `1` = "R cannot sit", `2` = "measurement error", `3` = "painful arm, no measurement", `4` = "measurement on right arm", `5` = "(part of) test refused", `6` = "part of test wrongfully not done", `8` = "- to be coded -",
  .applies_to_vars = c("marmpa0", "marmpar"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned", `2` = "other to be coded",
  .applies_to_vars = c("marmpa1", "marmpa2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("marmpa3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned --> CMARMPA4O",
  .applies_to_vars = c("marmpa4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "measurement error", `2` = "refused", `3` = "problem with finger", `4` = "measurement on right arm", `5` = "miscellaneous", `6` = "no normal score", `7` = "no specification",
  .applies_to_vars = c("marmpa4o"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "standing", `2` = "sitting", `3` = "lying down",
  .applies_to_vars = c("mfinpos1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `2` = "interview terminated",
  .applies_to_vars = c("rm151"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = NA_character_,
  .applies_to_vars = c("mfinps1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no valid measurement",
  .applies_to_vars = c("marmds1"),
  .applies_to_waves = c("C", "2B")
)

value_labels(
  `-2` = "na, see CMARMPAR", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("marmpa1", "marmpa2", "marmpa3"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CMARMPAR", `0` = "not mentioned", `1` = "mentioned --> CMARMPA4O",
  .applies_to_vars = c("marmpa4"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CMARMPA4", `1` = "measurement error", `2` = "refused", `3` = "problem with finger", `4` = "measurement on right arm", `5` = "miscellaneous", `6` = "no normal score", `7` = "no specification",
  .applies_to_vars = c("marmpa4o"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CRM151", `1` = "no", `2` = "yes",
  .applies_to_vars = c("marmpar"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CRM151",
  .applies_to_vars = c("marmss1", "mfinss1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "no valid measurement",
  .applies_to_vars = c("mfinds1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CRM151", `-1` = "no valid measurement", `1` = "standing", `2` = "sitting", `3` = "lying down",
  .applies_to_vars = c("mfinpos1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "valid data", `2` = "interview terminated",
  .applies_to_vars = c("rm151"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see DMARMPAR", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("marmpa1", "marmpa2", "marmpa3", "marmpa4"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("marmpar"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "no valid measurement",
  .applies_to_vars = c("mfinss1"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "test not done", `-1` = "normal test", `1` = "R cannot sit", `2` = "measurement error", `3` = "painful arm, no measurement", `4` = "measurement on right arm", `5` = "(part of) test refused", `6` = "part of test wrongfully not done",
  .applies_to_vars = c("marmpar"),
  .applies_to_waves = c("E")
)

value_labels(
  `-1` = "no valid measurement",
  .applies_to_vars = c("marmss1"),
  .applies_to_waves = c("E", "F", "G", "MB")
)

value_labels(
  `-1` = "no valid measurement",
  .applies_to_vars = c("marmds3"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-1` = "no valid measurement", `0` = "normal measurement", `1` = "cannot sit", `2` = "other to be coded",
  .applies_to_vars = c("marmpa1", "marmpa2"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMARMPA1", `-1` = "no valid measurement",
  .applies_to_vars = c("marmss1"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMARMPA2", `-1` = "no valid measurement",
  .applies_to_vars = c("marmss3"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "section not done", `-2` = "normal test", `-1` = "partially no valid measurement", `1` = "R cannot sit", `2` = "measurement error", `3` = "painful arm, no measurement", `4` = "measurement on right arm", `5` = "(part of) test refused", `6` = "part of test wrongfully not done", `8` = "- to be coded -",
  .applies_to_vars = c("marmpar"),
  .applies_to_waves = c("F", "G", "MB")
)

value_labels(
  `-3` = "section not done", `-2` = "normal test", `-1` = "partially no valid measurement", `1` = "R cannot sit", `2` = "measurement error", `3` = "painful arm, no measurement", `4` = "measurement on right arm", `5` = "(part of) test refused", `6` = "part of test wrongfully not done", `8` = "- to be coded -",
  .applies_to_vars = c("marmpa0"),
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-1` = "no valid measurement",
  .applies_to_vars = c("marmps2"),
  .applies_to_waves = c("G")
)

value_labels(
  `-1` = "no valid measurement",
  .applies_to_vars = c("marmss0"),
  .applies_to_waves = c("G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "no valid measurement",
  .applies_to_vars = c("marmps02", "marmss01"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-1` = "no valid measurement",
  .applies_to_vars = c("marmps0"),
  .applies_to_waves = c("I", "J", "K")
)

.lasa_fc_151 <- .lasa_finalize_fc("151")

