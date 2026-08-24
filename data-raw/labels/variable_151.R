## LASA filecode 151 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  rm151 = "Reason missing: LASAC151"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("mfinps1", "mfinps2", "mfinps3")],
    mfinps1 = "Pulse rate (1)"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "marmds1",
    "marmlds1",
    "marmlps1",
    "marmlss1",
    "marmpa1",
    "marmpa2",
    "marmpa3",
    "marmpa4",
    "marmpa4o",
    "marmpar",
    "marmps1",
    "marmsds1",
    "marmsps1",
    "marmss1",
    "marmsss1",
    "mfinds1",
    "mfinpos1",
    "mfinps1",
    "mfinss1",
    "rm151"
  )],
    marmds1 = "Bloodpr sitting (arm) mmHg: diastolic",
    marmpa1 = "Partic. bloodpressure: cannot stand",
    marmpa2 = "Partic. bloodpressure: cannot sit",
    marmps1 = "Pulse rate sitting (arm)",
    marmss1 = "Bloodpr sitting (arm) mmHg: systolic",
    mfinps1 = "Pulse rate (finger)"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "marmds1",
    "marmlds1",
    "marmlps1",
    "marmlss1",
    "marmpa1",
    "marmpa2",
    "marmpa3",
    "marmpa4",
    "marmpar",
    "marmps1",
    "marmsds1",
    "marmsps1",
    "marmss1",
    "marmsss1",
    "mfinds1",
    "mfinpo1",
    "mfinps1",
    "mfinss1"
  )],
    marmds1 = "Bloodpr sitting (arm) mmHg: diastolic",
    marmpa1 = "Partic. bloodpressure: cannot stand",
    marmpa2 = "Partic. bloodpressure: cannot sit",
    marmps1 = "Pulse rate sitting (arm)",
    marmss1 = "Bloodpr sitting (arm) mmHg: systolic",
    mfinps1 = "Pulse rate (finger)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
    "marmds1",
    "marmds2",
    "marmds3",
    "marmpar",
    "marmps1",
    "marmps2",
    "marmps3",
    "marmss1",
    "marmss2",
    "marmss3"
  )],
    marmds1 = "Bloodpr 1 sitting (arm) mmHg: diastolic",
    marmds2 = "Bloodpr 2 sitting (arm) mmHg: diastolic",
    marmds3 = "Bloodpr 3 sitting (arm) mmHg: diastolic",
    marmss1 = "Bloodpr 1 sitting (arm) mmHg: systolic",
    marmss2 = "Bloodpr 2 sitting (arm) mmHg: systolic",
    marmss3 = "Bloodpr 3 sitting (arm) mmHg: systolic"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
    "marmds1",
    "marmds2",
    "marmds3",
    "marmds4",
    "marmpa1",
    "marmpa2",
    "marmps1",
    "marmps2",
    "marmps3",
    "marmps4",
    "marmss1",
    "marmss2",
    "marmss3",
    "marmss4"
  )],
    marmds1 = "Bloodpr 1 sitting (arm) mmHg: diastolic",
    marmds2 = "Bloodpr 2 sitting (arm) mmHg: diastolic",
    marmds3 = "Retest Bloodpr 3 sitting (arm) mmHg: diastolic",
    marmpa1 = "Particularities bloodpressure",
    marmpa2 = "Retest Particularities bloodpressure",
    marmps1 = "Pulse rate sitting (arm) 1",
    marmps2 = "Pulse rate sitting (arm) 2",
    marmps3 = "Retest Pulse rate 3 sitting (arm)",
    marmss1 = "Bloodpr 1 sitting (arm) mmHg: systolic",
    marmss2 = "Bloodpr 2 sitting (arm) mmHg: systolic",
    marmss3 = "Retest Bloodpr 3 sitting (arm) mmHg: systolic"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "marmds1",
    "marmds2",
    "marmds3",
    "marmpar",
    "marmps1",
    "marmps2",
    "marmps3",
    "marmss1",
    "marmss2",
    "marmss3"
  )],
    marmds1 = "Bloodpr 1 sitting (arm) mmHg: diastolic",
    marmds2 = "Bloodpr 2 sitting (arm) mmHg: diastolic",
    marmds3 = "Bloodpr 3 sitting (arm) mmHg: diastolic",
    marmss1 = "Bloodpr 1 sitting (arm) mmHg: systolic",
    marmss2 = "Bloodpr 2 sitting (arm) mmHg: systolic",
    marmss3 = "Bloodpr 3 sitting (arm) mmHg: systolic"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "marmds0",
    "marmds1",
    "marmds2",
    "marmds3",
    "marmpa0",
    "marmpar",
    "marmps0",
    "marmps1",
    "marmps2",
    "marmps3",
    "marmss0",
    "marmss1",
    "marmss2",
    "marmss3"
  )],
    marmds0 = "Pretest: bloodpr 0 sit (arm) mmHg: diastolic",
    marmds1 = "Bloodpr 1 sitting (arm) mmHg: diastolic",
    marmds2 = "Bloodpr 2 sitting (arm) mmHg: diastolic",
    marmds3 = "Bloodpr 3 sitting (arm) mmHg: diastolic",
    marmpa0 = "Particularities bloodpressure Pretest",
    marmps0 = "Pretest: pulse rate 0 sit (arm)",
    marmss0 = "Pretest: bloodpr 0 sit (arm) mmHg: systolic",
    marmss1 = "Bloodpr 1 sitting (arm) mmHg: systolic",
    marmss2 = "Bloodpr 2 sitting (arm) mmHg: systolic",
    marmss3 = "Bloodpr 3 sitting (arm) mmHg: systolic"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("marmds0", "marmds1", "marmpa0", "marmpar", "marmps0", "marmps1", "marmss0", "marmss1")],
    marmds0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: diastolic",
    marmds1 = "Bloodpressure (1) sitting (arm) mmHg: diastolic",
    marmpa0 = "Particularities bloodpressure Pretest",
    marmps0 = "Pretest: pulse rate (0) sitting (arm)",
    marmps1 = "Pulse rate (1) sitting (arm)",
    marmss0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: systolic",
    marmss1 = "Bloodpressure (1) sitting (arm) mmHg: systolic"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
    "marmds01",
    "marmds02",
    "marmds1",
    "marmds2",
    "marmpa0",
    "marmpar",
    "marmps01",
    "marmps02",
    "marmps1",
    "marmps2",
    "marmss01",
    "marmss02",
    "marmss1",
    "marmss2"
  )],
    marmds1 = "Bloodpr 1 sitting (arm) mmHg: diastolic",
    marmds2 = "Bloodpr 2 sitting (arm) mmHg: diastolic",
    marmpa0 = "Particularities bloodpressure Pretest",
    marmss1 = "Bloodpr 1 sitting (arm) mmHg: systolic",
    marmss2 = "Bloodpr 2 sitting (arm) mmHg: systolic"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c("marmds1", "marmds2", "marmpar", "marmps1", "marmps2", "marmss1", "marmss2")],
    marmds1 = "Bloodpr 1 sitting (arm) mmHg: diastolic",
    marmds2 = "Bloodpr 2 sitting (arm) mmHg: diastolic",
    marmss1 = "Bloodpr 1 sitting (arm) mmHg: systolic",
    marmss2 = "Bloodpr 2 sitting (arm) mmHg: systolic"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c("marmds0", "marmds1", "marmpa0", "marmpar", "marmps0", "marmps1", "marmss0", "marmss1")],
    marmds0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: diastolic",
    marmds1 = "Bloodpressure (1) sitting (arm) mmHg: diastolic",
    marmpa0 = "Particularities bloodpressure pretest",
    marmps0 = "Pretest: pulse rate (0) sitting (arm)",
    marmps1 = "Pulse rate (1) sitting (arm)",
    marmss0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: systolic",
    marmss1 = "Bloodpressure (1) sitting (arm) mmHg: systolic"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c("marmds0", "marmds1", "marmpa0", "marmpar", "marmps0", "marmps1", "marmss0", "marmss1")],
    marmds0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: diastolic",
    marmds1 = "Bloodpressure (1) sitting (arm) mmHg: diastolic",
    marmpa0 = "Particularities bloodpressure pretest",
    marmps0 = "Pretest: pulse rate (0) sitting (arm)",
    marmps1 = "Pulse rate (1) sitting (arm)",
    marmss0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: systolic",
    marmss1 = "Bloodpressure (1) sitting (arm) mmHg: systolic"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c("marmds0", "marmds1", "marmpa0", "marmpar", "marmps0", "marmps1", "marmss0", "marmss1")],
    marmds0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: diastolic",
    marmds1 = "Bloodpressure (1) sitting (arm) mmHg: diastolic",
    marmpa0 = "Particularities bloodpressure pretest",
    marmps0 = "Pretest: pulse rate (0) sitting (arm)",
    marmps1 = "Pulse rate (1) sitting (arm)",
    marmss0 = "Pretest: bloodpressure (0) sitting (arm) mmHg: systolic",
    marmss1 = "Bloodpressure (1) sitting (arm) mmHg: systolic"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  marmds0 = stats::setNames(character(0), character(0)),
  marmds01 = stats::setNames(character(0), character(0)),
  marmds02 = stats::setNames(character(0), character(0)),
  marmds1 = c(`-1` = "not available"),
  marmds2 = stats::setNames(character(0), character(0)),
  marmds3 = c(`-1` = "not available"),
  marmds4 = stats::setNames(character(0), character(0)),
  marmlds1 = stats::setNames(character(0), character(0)),
  marmlps1 = stats::setNames(character(0), character(0)),
  marmlss1 = stats::setNames(character(0), character(0)),
  marmpa0 = c(
    `-3` = "not available",
    `-2` = "not available",
    `-1` = "not available",
    `1` = "R cannot sit",
    `2` = "measurement error",
    `3` = "painful arm, no measurement",
    `4` = "measurement on right arm",
    `5` = "(part of) test refused",
    `6` = "part of test wrongfully not done",
    `8` = "- to be coded -"
  ),
  marmpa1 = c(
    `-2` = "not available",
    `-1` = "not available",
    `0` = "not mentioned",
    `1` = "mentioned",
    `2` = "other to be coded"
  ),
  marmpa2 = c(
    `-2` = "not available",
    `-1` = "not available",
    `0` = "not mentioned",
    `1` = "mentioned",
    `2` = "other to be coded"
  ),
  marmpa3 = c(`-2` = "not available", `0` = "not mentioned", `1` = "mentioned"),
  marmpa4 = c(`-2` = "not available", `0` = "not mentioned", `1` = "mentioned --> CMARMPA4O"),
  marmpa4o = c(
    `-2` = "not available",
    `1` = "measurement error",
    `2` = "refused",
    `3` = "problem with finger",
    `4` = "measurement on right arm",
    `5` = "miscellaneous",
    `6` = "no normal score",
    `7` = "no specification"
  ),
  marmpar = c(
    `-3` = "not available",
    `-2` = "not available",
    `-1` = "not available",
    `1` = "R cannot sit",
    `2` = "measurement error",
    `3` = "painful arm, no measurement",
    `4` = "measurement on right arm",
    `5` = "(part of) test refused",
    `6` = "part of test wrongfully not done",
    `8` = "- to be coded -"
  ),
  marmps0 = c(`-1` = "not available"),
  marmps01 = stats::setNames(character(0), character(0)),
  marmps02 = c(`-1` = "not available"),
  marmps1 = stats::setNames(character(0), character(0)),
  marmps2 = c(`-1` = "not available"),
  marmps3 = stats::setNames(character(0), character(0)),
  marmps4 = stats::setNames(character(0), character(0)),
  marmsds1 = stats::setNames(character(0), character(0)),
  marmsps1 = stats::setNames(character(0), character(0)),
  marmss0 = c(`-1` = "not available"),
  marmss01 = c(`-1` = "not available"),
  marmss02 = stats::setNames(character(0), character(0)),
  marmss1 = c(`-2` = "not available", `-1` = "not available"),
  marmss2 = stats::setNames(character(0), character(0)),
  marmss3 = c(`-2` = "not available", `-1` = "not available"),
  marmss4 = stats::setNames(character(0), character(0)),
  marmsss1 = stats::setNames(character(0), character(0)),
  mfinds1 = c(`-1` = "not available"),
  mfinpo1 = stats::setNames(character(0), character(0)),
  mfinpos1 = c(
    `-2` = "not available",
    `-1` = "not available",
    `1` = "standing",
    `2` = "sitting",
    `3` = "lying down"
  ),
  mfinps1 = c(`-1` = "not available"),
  mfinps2 = stats::setNames(character(0), character(0)),
  mfinps3 = stats::setNames(character(0), character(0)),
  mfinss1 = c(`-2` = "not available", `-1` = "not available"),
  rm151 = c(`-2` = "not available", `2` = "interview terminated")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("mfinps1")],
    mfinps1 = .replace_labels(
    standardized_value_labels$mfinps1,
    `-1` = NA_character_
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "marmds1",
    "marmpa1",
    "marmpa2",
    "marmpa3",
    "marmpa4",
    "marmpa4o",
    "marmpar",
    "marmss1",
    "mfinds1",
    "mfinpos1",
    "mfinss1",
    "rm151"
  )],
    marmds1 = .replace_labels(
    standardized_value_labels$marmds1,
    `-1` = "no valid measurement"
  ),
    marmpa1 = c(`-2` = "na, see CMARMPAR", `0` = "not mentioned", `1` = "mentioned"),
    marmpa2 = c(`-2` = "na, see CMARMPAR", `0` = "not mentioned", `1` = "mentioned"),
    marmpa3 = .replace_labels(
    standardized_value_labels$marmpa3,
    `-2` = "na, see CMARMPAR"
  ),
    marmpa4 = .replace_labels(
    standardized_value_labels$marmpa4,
    `-2` = "na, see CMARMPAR"
  ),
    marmpa4o = .replace_labels(
    standardized_value_labels$marmpa4o,
    `-2` = "na, see CMARMPA4"
  ),
    marmpar = c(`-2` = "na, see CRM151", `1` = "no", `2` = "yes"),
    marmss1 = c(`-2` = "na, see CRM151"),
    mfinds1 = .replace_labels(
    standardized_value_labels$mfinds1,
    `-1` = "no valid measurement"
  ),
    mfinpos1 = .replace_labels(
    standardized_value_labels$mfinpos1,
    `-2` = "na, see CRM151",
    `-1` = "no valid measurement"
  ),
    mfinss1 = c(`-2` = "na, see CRM151"),
    rm151 = .replace_labels(
    standardized_value_labels$rm151,
    `-2` = "valid data"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("marmpa1", "marmpa2", "marmpa3", "marmpa4", "marmpar", "mfinss1")],
    marmpa1 = c(`-2` = "na, see DMARMPAR", `0` = "not mentioned", `1` = "mentioned"),
    marmpa2 = c(`-2` = "na, see DMARMPAR", `0` = "not mentioned", `1` = "mentioned"),
    marmpa3 = .replace_labels(
    standardized_value_labels$marmpa3,
    `-2` = "na, see DMARMPAR"
  ),
    marmpa4 = .replace_labels(
    standardized_value_labels$marmpa4,
    `-2` = "na, see DMARMPAR",
    `1` = "mentioned"
  ),
    marmpar = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mfinss1 = c(`-1` = "no valid measurement")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("marmpar", "marmss1")],
    marmpar = c(
    `-3` = "test not done",
    `-1` = "normal test",
    `1` = "R cannot sit",
    `2` = "measurement error",
    `3` = "painful arm, no measurement",
    `4` = "measurement on right arm",
    `5` = "(part of) test refused",
    `6` = "part of test wrongfully not done"
  ),
    marmss1 = c(`-1` = "no valid measurement")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("marmds1", "marmds3", "marmpa1", "marmpa2", "marmss1", "marmss3")],
    marmds1 = .replace_labels(
    standardized_value_labels$marmds1,
    `-1` = "no valid measurement"
  ),
    marmds3 = .replace_labels(
    standardized_value_labels$marmds3,
    `-1` = "no valid measurement"
  ),
    marmpa1 = c(
    `-1` = "no valid measurement",
    `0` = "normal measurement",
    `1` = "cannot sit",
    `2` = "other to be coded"
  ),
    marmpa2 = c(
    `-1` = "no valid measurement",
    `0` = "normal measurement",
    `1` = "cannot sit",
    `2` = "other to be coded"
  ),
    marmss1 = .replace_labels(
    standardized_value_labels$marmss1,
    `-2` = "na, see BMARMPA1",
    `-1` = "no valid measurement"
  ),
    marmss3 = .replace_labels(
    standardized_value_labels$marmss3,
    `-2` = "na, see BMARMPA2",
    `-1` = "no valid measurement"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("marmpar", "marmss1")],
    marmpar = .replace_labels(
    standardized_value_labels$marmpar,
    `-3` = "section not done",
    `-2` = "normal test",
    `-1` = "partially no valid measurement"
  ),
    marmss1 = c(`-1` = "no valid measurement")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("marmpa0", "marmpar", "marmps2", "marmss0", "marmss1")],
    marmpa0 = .replace_labels(
    standardized_value_labels$marmpa0,
    `-3` = "section not done",
    `-2` = "normal test",
    `-1` = "partially no valid measurement"
  ),
    marmpar = .replace_labels(
    standardized_value_labels$marmpar,
    `-3` = "section not done",
    `-2` = "normal test",
    `-1` = "partially no valid measurement"
  ),
    marmps2 = .replace_labels(
    standardized_value_labels$marmps2,
    `-1` = "no valid measurement"
  ),
    marmss0 = .replace_labels(
    standardized_value_labels$marmss0,
    `-1` = "no valid measurement"
  ),
    marmss1 = c(`-1` = "no valid measurement")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("marmpa0", "marmss0")],
    marmpa0 = .replace_labels(
    standardized_value_labels$marmpa0,
    `-3` = "section not done",
    `-2` = "normal test",
    `-1` = "partially no valid measurement"
  ),
    marmss0 = .replace_labels(
    standardized_value_labels$marmss0,
    `-1` = "no valid measurement"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("marmpa0", "marmps02", "marmss01")],
    marmpa0 = .replace_labels(
    standardized_value_labels$marmpa0,
    `-3` = "section not done",
    `-2` = "normal test",
    `-1` = "partially no valid measurement"
  ),
    marmps02 = .replace_labels(
    standardized_value_labels$marmps02,
    `-1` = "no valid measurement"
  ),
    marmss01 = .replace_labels(
    standardized_value_labels$marmss01,
    `-1` = "no valid measurement"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("marmpar", "marmss1")],
    marmpar = .replace_labels(
    standardized_value_labels$marmpar,
    `-3` = "section not done",
    `-2` = "normal test",
    `-1` = "partially no valid measurement"
  ),
    marmss1 = c(`-1` = "no valid measurement")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("marmpa0", "marmps0", "marmss0")],
    marmpa0 = .replace_labels(
    standardized_value_labels$marmpa0,
    `-3` = "section not done",
    `-2` = "normal test",
    `-1` = "partially no valid measurement"
  ),
    marmps0 = .replace_labels(
    standardized_value_labels$marmps0,
    `-1` = "no valid measurement"
  ),
    marmss0 = .replace_labels(
    standardized_value_labels$marmss0,
    `-1` = "no valid measurement"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("marmpa0", "marmps0", "marmss0")],
    marmpa0 = .replace_labels(
    standardized_value_labels$marmpa0,
    `-3` = "section not done",
    `-2` = "normal test",
    `-1` = "partially no valid measurement"
  ),
    marmps0 = .replace_labels(
    standardized_value_labels$marmps0,
    `-1` = "no valid measurement"
  ),
    marmss0 = .replace_labels(
    standardized_value_labels$marmss0,
    `-1` = "no valid measurement"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("marmpa0", "marmps0", "marmss0")],
    marmpa0 = .replace_labels(
    standardized_value_labels$marmpa0,
    `-3` = "section not done",
    `-2` = "normal test",
    `-1` = "partially no valid measurement"
  ),
    marmps0 = .replace_labels(
    standardized_value_labels$marmps0,
    `-1` = "no valid measurement"
  ),
    marmss0 = .replace_labels(
    standardized_value_labels$marmss0,
    `-1` = "no valid measurement"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

.lasa_fc_151 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "151", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "151", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "151", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "151", waves = .lasa_wave_rows())
)
