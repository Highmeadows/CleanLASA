## LASA filecode 195 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  meol01 = "Trust in doctors for good care in end-of-life",
  meol02 = "Trust in doctors for end-of-life-wishes",
  meol03 = "Discussed end-of-life-wishes with doctor",
  meol04 = "Number of persons talked to about end-of-life wishes",
  meol05 = "End-of-life decision arrangement",
  meol06 = "End-of-life declaration information",
  meol07 = "ever death thoughts",
  meol08 = "ever death wishes",
  meol09 = "feelings towards living past week",
  meol10 = "feelings towards dying past week",
  meol11 = "feelings towards reasons for living/dying",
  meol12 = "suicide medication must be available",
  meol13 = "imagine suicide medication in possession",
  meol14 = "Number of circumstances taking suicide medication",
  meol141 = "circumstance: higher age",
  meol142 = "circumstance: severe illness",
  meol143 = "circumstance: dementia",
  meol144 = "circumstance: dependence",
  meol145 = "circumstance: other",
  meol15 = "usage suicide medication within few months",
  meol41 = "Talked to partner",
  meol42 = "Talked to children",
  meol43 = "Talked to other family members",
  meol44 = "Talked to friends",
  meol45 = "Talked to other persons",
  meol601 = "standard: NVVE advance euthanasia directive",
  meol602 = "standard: NVVE durable power of attorney",
  meol603 = "standard: NVVE do not treat",
  meol604 = "standard: NVVE do not resuscitate",
  meol605 = "standard: NPV wish to live",
  meol606 = "End-of-life declaration item 6",
  meol607 = "End-of-life declaration item 7",
  meol608 = "standard: other standard living will",
  meol609 = "personal: advance euthanasia directive",
  meol610 = "personal: other personal living will -coded",
  meol611 = "other end-of-life-declaration: not specified",
  meol612 = "living will",
  mrmeol = "Reason for missing end-of-life answers"
)

variable_labels_list <- list(
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol07",
    "meol08",
    "meol09",
    "meol10",
    "meol11",
    "meol12",
    "meol13",
    "meol14",
    "meol141",
    "meol142",
    "meol143",
    "meol144",
    "meol145",
    "meol15",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "mrmeol"
  )],
    meol01 = "Trust in doctors for good care in EOL",
    meol02 = "Trust in doctors for EOL-wishes",
    meol03 = "Discussed EOL-wishes with doctor",
    meol04 = "# persons talked to about EOL-wishes",
    meol05 = "Indication (verbal/written)",
    meol06 = "(standard) End-of-life declaration",
    meol14 = "# circumstances taking suicide medication",
    mrmeol = "reason missing eol-answers"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "mrmeol"
  )],
    meol01 = "Trust in doctors for good care in EOL",
    meol02 = "Trust in doctors for EOL-wishes",
    meol03 = "Discussed EOL-wishes with doctor",
    meol04 = "# persons talked to about EOL-wishes",
    meol05 = "Indication (verbal/written)",
    meol06 = "(standard) End-of-life declaration",
    mrmeol = "reason missing eol-answers"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "meol601",
    "meol602",
    "meol603",
    "meol604",
    "meol605",
    "meol606",
    "meol607",
    "meol608",
    "meol609",
    "meol610",
    "meol611",
    "mrmeol"
  )],
    meol01 = "Trust in doctors for good care in EOL",
    meol02 = "Trust in doctors for EOL-wishes",
    meol03 = "Discussed EOL-wishes with doctor",
    meol04 = "number of persons talked to about EOL-wishes",
    meol05 = "Indication (verbal/written)",
    meol06 = "number of End-of-life declarations",
    meol606 = "standard: notary: advance euthanasia directive",
    meol607 = "standard: MAIA advance care directive",
    meol611 = "other EOL-declaration: not specified",
    mrmeol = "reason missing EOL-answers"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "meol601",
    "meol602",
    "meol603",
    "meol604",
    "meol605",
    "meol606",
    "meol607",
    "meol608",
    "meol609",
    "meol610",
    "meol611",
    "meol612",
    "mrmeol"
  )],
    meol01 = "Trust in doctors for good care in EOL",
    meol02 = "Trust in doctors for EOL-wishes",
    meol03 = "Discussed EOL-wishes with doctor",
    meol04 = "number of persons talked to about EOL-wishes",
    meol05 = "Indication (verbal/written)",
    meol06 = "number of End-of-life declarations",
    meol606 = "standard: notary: advance euthanasia directive",
    meol607 = "standard: MAIA advance care directive",
    meol611 = "other EOL-declaration: not specified",
    mrmeol = "reason missing EOL-answers"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "meol601",
    "meol602",
    "meol603",
    "meol604",
    "meol605",
    "meol606",
    "meol607",
    "meol608",
    "meol609",
    "meol610",
    "meol611",
    "meol612",
    "mrmeol"
  )],
    meol01 = "Trust in doctors for good care in EOL",
    meol02 = "Trust in doctors for EOL-wishes",
    meol03 = "Discussed EOL-wishes with doctor",
    meol04 = "number of persons talked to about EOL-wishes",
    meol05 = "Indication (verbal/written)",
    meol06 = "number of End-of-life declarations",
    meol606 = "standard: notary: advance euthanasia directive",
    meol607 = "standard: MAIA advance care directive",
    meol611 = "other EOL-declaration: not specified",
    mrmeol = "reason missing EOL-answers"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "meol601",
    "meol602",
    "meol603",
    "meol604",
    "meol605",
    "meol606",
    "meol607",
    "mrmeol"
  )],
    meol01 = "trust in doctors for good care in EOL",
    meol02 = "trust in doctors for EOL-wishes",
    meol03 = "discussed EOL-wishes with doctor",
    meol04 = "number of persons talked to about EOL-wishes",
    meol05 = "someone appointed to make medical treatment decisions",
    meol06 = "number of End-of-life declarations",
    meol41 = "talked with partner",
    meol42 = "talked to children",
    meol43 = "talked to other family members",
    meol44 = "talked to friends",
    meol45 = "talked to other persons",
    meol601 = "advance directive: euthanasia",
    meol602 = "advance directive: durable power of attorney",
    meol603 = "advance directive: do not treat",
    meol604 = "advance directive: do not resuscitate",
    meol605 = "wish to live statement",
    meol606 = "living will",
    meol607 = "other EOL-declaration: not specified",
    mrmeol = "reason missing EOL-answers"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  meol01 = c(
    `-2` = "no valid data",
    `-1` = "na, asked",
    `1` = "trust: very strong",
    `2` = "quite strong",
    `3` = "not much",
    `4` = "not at all",
    `5` = "no opinion"
  ),
  meol02 = c(
    `-2` = "no valid data",
    `-1` = "na, asked",
    `1` = "trust: very strong",
    `2` = "quite strong",
    `3` = "not much",
    `4` = "not at all",
    `5` = "no opinion"
  ),
  meol03 = c(`-2` = "no valid data", `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know"),
  meol04 = c(
    `-2` = "no valid data",
    `-1` = "does not know / no valid count",
    `0` = "R did not talk to anyone"
  ),
  meol05 = c(
    `-2` = "no valid data",
    `-1` = "na, asked",
    `1` = "yes, exclusively written",
    `2` = "yes, excl. verbal",
    `3` = "yes, written and verbal",
    `4` = "yes, not specified",
    `5` = "no",
    `6` = "R does not know"
  ),
  meol06 = c(
    `-2` = "no valid data",
    `-1` = "does not know / no valid response",
    `0` = "R does not have anything on paper",
    `1` = "recorded value 1",
    `2` = "recorded value 2",
    `3` = "recorded value 3",
    `4` = "recorded value 4",
    `5` = "recorded value 5",
    `6` = "recorded value 6",
    `7` = "recorded value 7",
    `8` = "recorded value 8",
    `9` = "recorded value 9",
    `10` = "recorded value 10",
    `11` = "recorded value 11",
    `12` = "recorded value 12",
    `13` = "recorded value 13"
  ),
  meol07 = c(`-2` = "no valid data", `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know"),
  meol08 = c(`-2` = "no valid data", `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know"),
  meol09 = c(
    `-2` = "no valid data",
    `-1` = "na, asked",
    `1` = "a moderate to strong wish to live",
    `2` = "a weak wish to live",
    `3` = "no wish to live"
  ),
  meol10 = c(
    `-2` = "no valid data",
    `-1` = "na, asked",
    `1` = "no wish to die",
    `2` = "a weak wish to die",
    `3` = "a moderate to strong wish to die"
  ),
  meol11 = c(
    `-2` = "no valid data",
    `-1` = "na, asked",
    `1` = "for living outweigh those for dying",
    `2` = "about equal",
    `3` = "for dying outweigh those for living"
  ),
  meol12 = c(
    `-2` = "no valid data",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "maybe",
    `3` = "no",
    `4` = "R does not know"
  ),
  meol13 = c(
    `-2` = "no valid data",
    `-1` = "na, asked",
    `1` = "yes",
    `2` = "maybe",
    `3` = "no",
    `4` = "R does not know"
  ),
  meol14 = c(`-2` = "no valid data", `-1` = "na, asked"),
  meol141 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol142 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol143 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol144 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol145 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol15 = c(`-2` = "no valid data", `-1` = "na, asked", `1` = "yes, because…", `2` = "no"),
  meol41 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol42 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol43 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol44 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol45 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol601 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol602 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol603 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol604 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol605 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol606 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol607 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol608 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol609 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol610 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol611 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  meol612 = c(`-2` = "no valid data", `0` = "not mentioned", `1` = "mentioned"),
  mrmeol = c(
    `-2` = "valid score",
    `1` = "short version",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to [cognitive]",
    `6` = "not able to (physical)",
    `7` = "emotional reasons",
    `8` = "unknown"
  )
)

value_labels_list <- list(
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol07",
    "meol08",
    "meol09",
    "meol10",
    "meol11",
    "meol12",
    "meol13",
    "meol14",
    "meol141",
    "meol142",
    "meol143",
    "meol144",
    "meol145",
    "meol15",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "mrmeol"
  )],
    meol01 = .replace_labels(
    standardized_value_labels$meol01,
    `-2` = "na, see FMRMEOL"
  ),
    meol02 = .replace_labels(
    standardized_value_labels$meol02,
    `-2` = "na, see FMRMEOL"
  ),
    meol03 = .replace_labels(
    standardized_value_labels$meol03,
    `-2` = "na, see FMRMEOL"
  ),
    meol04 = c(`-2` = "na, see FMRMEOL", `-1` = "na, asked/R does not know"),
    meol05 = .replace_labels(
    standardized_value_labels$meol05,
    `-2` = "na, see FMRMEOL"
  ),
    meol06 = c(
    `-2` = "na, see FMRMEOL",
    `-1` = "na, asked",
    `1` = "standard: NVVE advance euthanasia directive",
    `2` = "standard: NVVE durable power of attorney",
    `3` = "standard: NVVE do not treat",
    `4` = "standard: NVVE do not resuscitate",
    `5` = "standard: NPV wish to live",
    `6` = "standard: notary: advance euthanasia directive",
    `7` = "standard: MAIA advance care directive",
    `8` = "standard: other standard living will",
    `9` = "personal: advance euthanasia directive",
    `10` = "personal: other personal living will",
    `11` = "other not specified",
    `12` = "no",
    `13` = "R does not know"
  ),
    meol07 = .replace_labels(
    standardized_value_labels$meol07,
    `-2` = "na, see FMRMEOL"
  ),
    meol08 = .replace_labels(
    standardized_value_labels$meol08,
    `-2` = "na, see FMRMEOL"
  ),
    meol09 = .replace_labels(
    standardized_value_labels$meol09,
    `-2` = "na, see FMRMEOL"
  ),
    meol10 = .replace_labels(
    standardized_value_labels$meol10,
    `-2` = "na, see FMRMEOL"
  ),
    meol11 = .replace_labels(
    standardized_value_labels$meol11,
    `-2` = "na, see FMRMEOL"
  ),
    meol12 = .replace_labels(
    standardized_value_labels$meol12,
    `-2` = "na, see FMRMEOL"
  ),
    meol13 = .replace_labels(
    standardized_value_labels$meol13,
    `-2` = "na, see FMRMEOL"
  ),
    meol14 = .replace_labels(
    standardized_value_labels$meol14,
    `-2` = "na, see FMEOL13"
  ),
    meol141 = .replace_labels(
    standardized_value_labels$meol141,
    `-2` = "na, see FMEOL14"
  ),
    meol142 = .replace_labels(
    standardized_value_labels$meol142,
    `-2` = "na, see FMEOL14"
  ),
    meol143 = .replace_labels(
    standardized_value_labels$meol143,
    `-2` = "na, see FMEOL14"
  ),
    meol144 = .replace_labels(
    standardized_value_labels$meol144,
    `-2` = "na, see FMEOL14"
  ),
    meol145 = .replace_labels(
    standardized_value_labels$meol145,
    `-2` = "na, see FMEOL14"
  ),
    meol15 = .replace_labels(
    standardized_value_labels$meol15,
    `-2` = "na, see FMEOL13"
  ),
    meol41 = .replace_labels(
    standardized_value_labels$meol41,
    `-2` = "na, see FMEOL04"
  ),
    meol42 = .replace_labels(
    standardized_value_labels$meol42,
    `-2` = "na, see FMEOL04"
  ),
    meol43 = .replace_labels(
    standardized_value_labels$meol43,
    `-2` = "na, see FMEOL04"
  ),
    meol44 = .replace_labels(
    standardized_value_labels$meol44,
    `-2` = "na, see FMEOL04"
  ),
    meol45 = .replace_labels(
    standardized_value_labels$meol45,
    `-2` = "na, see FMEOL04"
  ),
    mrmeol = .replace_labels(
    standardized_value_labels$mrmeol,
    `6` = "not able to [physical]"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "mrmeol"
  )],
    meol01 = .replace_labels(
    standardized_value_labels$meol01,
    `-2` = "na, see GMRMEOL"
  ),
    meol02 = .replace_labels(
    standardized_value_labels$meol02,
    `-2` = "na, see GMRMEOL"
  ),
    meol03 = .replace_labels(
    standardized_value_labels$meol03,
    `-2` = "na, see GMRMEOL"
  ),
    meol04 = c(`-2` = "na, see GMRMEOL", `-1` = "na, asked/R does not know"),
    meol05 = .replace_labels(
    standardized_value_labels$meol05,
    `-2` = "na, see GMRMEOL"
  ),
    meol06 = c(
    `-2` = "na, see GMRMEOL",
    `-1` = "na, asked",
    `1` = "standard: NVVE advance euthanasia directive",
    `2` = "standard: NVVE durable power of attorney",
    `3` = "standard: NVVE do not treat",
    `4` = "standard: NVVE do not resuscitate",
    `5` = "standard: NPV wish to live",
    `6` = "standard: notary: advance euthanasia directive",
    `7` = "standard: MAIA advance care directive",
    `8` = "standard: other standard living will",
    `9` = "personal: advance euthanasia directive",
    `10` = "personal: other personal living will",
    `11` = "other not specified",
    `12` = "no",
    `13` = "R does not know"
  ),
    meol41 = .replace_labels(
    standardized_value_labels$meol41,
    `-2` = "na, see GMEOL04"
  ),
    meol42 = .replace_labels(
    standardized_value_labels$meol42,
    `-2` = "na, see GMEOL04"
  ),
    meol43 = .replace_labels(
    standardized_value_labels$meol43,
    `-2` = "na, see GMEOL04"
  ),
    meol44 = .replace_labels(
    standardized_value_labels$meol44,
    `-2` = "na, see GMEOL04"
  ),
    meol45 = .replace_labels(
    standardized_value_labels$meol45,
    `-2` = "na, see GMEOL04"
  ),
    mrmeol = .replace_labels(
    standardized_value_labels$mrmeol,
    `6` = "not able to [physical]"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "meol601",
    "meol602",
    "meol603",
    "meol604",
    "meol605",
    "meol606",
    "meol607",
    "meol608",
    "meol609",
    "meol610",
    "meol611",
    "mrmeol"
  )],
    meol01 = .replace_labels(
    standardized_value_labels$meol01,
    `-2` = "na, see HMRMEOL"
  ),
    meol02 = .replace_labels(
    standardized_value_labels$meol02,
    `-2` = "na, see HMRMEOL"
  ),
    meol03 = .replace_labels(
    standardized_value_labels$meol03,
    `-2` = "na, see HMRMEOL"
  ),
    meol04 = c(`-2` = "na, see HMRMEOL", `-1` = "na, asked/R does not know"),
    meol05 = .replace_labels(
    standardized_value_labels$meol05,
    `-2` = "na, see HMRMEOL",
    `2` = "yes, exclusively verbal"
  ),
    meol06 = c(`-2` = "na, see HMRMEOL", `-1` = "na, asked/ R does not know"),
    meol41 = .replace_labels(
    standardized_value_labels$meol41,
    `-2` = "na, see HMEOL04"
  ),
    meol42 = .replace_labels(
    standardized_value_labels$meol42,
    `-2` = "na, see HMEOL04"
  ),
    meol43 = .replace_labels(
    standardized_value_labels$meol43,
    `-2` = "na, see HMEOL04"
  ),
    meol44 = .replace_labels(
    standardized_value_labels$meol44,
    `-2` = "na, see HMEOL04"
  ),
    meol45 = .replace_labels(
    standardized_value_labels$meol45,
    `-2` = "na, see HMEOL04"
  ),
    meol601 = .replace_labels(
    standardized_value_labels$meol601,
    `-2` = "na, see HMEOL06"
  ),
    meol602 = .replace_labels(
    standardized_value_labels$meol602,
    `-2` = "na, see HMEOL06"
  ),
    meol603 = .replace_labels(
    standardized_value_labels$meol603,
    `-2` = "na, see HMEOL06"
  ),
    meol604 = .replace_labels(
    standardized_value_labels$meol604,
    `-2` = "na, see HMEOL06"
  ),
    meol605 = .replace_labels(
    standardized_value_labels$meol605,
    `-2` = "na, see HMEOL06"
  ),
    meol606 = .replace_labels(
    standardized_value_labels$meol606,
    `-2` = "na, see HMEOL06"
  ),
    meol607 = .replace_labels(
    standardized_value_labels$meol607,
    `-2` = "na, see HMEOL06"
  ),
    meol608 = .replace_labels(
    standardized_value_labels$meol608,
    `-2` = "na, see HMEOL06"
  ),
    meol609 = .replace_labels(
    standardized_value_labels$meol609,
    `-2` = "na, see HMEOL06"
  ),
    meol610 = .replace_labels(
    standardized_value_labels$meol610,
    `-2` = "na, see HMEOL06"
  ),
    meol611 = .replace_labels(
    standardized_value_labels$meol611,
    `-2` = "na, see HMEOL06"
  ),
    mrmeol = .replace_labels(
    standardized_value_labels$mrmeol,
    `6` = "not able to [physical]",
    `8` = "unknown / to be coded"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "meol601",
    "meol602",
    "meol603",
    "meol604",
    "meol605",
    "meol606",
    "meol607",
    "meol608",
    "meol609",
    "meol610",
    "meol611",
    "meol612",
    "mrmeol"
  )],
    meol01 = .replace_labels(
    standardized_value_labels$meol01,
    `-2` = "na, see IMRMEOL"
  ),
    meol02 = .replace_labels(
    standardized_value_labels$meol02,
    `-2` = "na, see IMRMEOL"
  ),
    meol03 = .replace_labels(
    standardized_value_labels$meol03,
    `-2` = "na, see IMRMEOL"
  ),
    meol04 = .replace_labels(
    standardized_value_labels$meol04,
    `-2` = "na, see IMRMEOL",
    `-1` = "R does not know"
  ),
    meol05 = .replace_labels(
    standardized_value_labels$meol05,
    `-2` = "na, see IMRMEOL",
    `2` = "yes, exclusively verbal"
  ),
    meol06 = c(`-2` = "na, see IMRMEOL", `-1` = "R does not know", `0` = "R does not have anything on paper"),
    meol41 = .replace_labels(
    standardized_value_labels$meol41,
    `-2` = "na, see IMEOL04"
  ),
    meol42 = .replace_labels(
    standardized_value_labels$meol42,
    `-2` = "na, see IMEOL04"
  ),
    meol43 = .replace_labels(
    standardized_value_labels$meol43,
    `-2` = "na, see IMEOL04"
  ),
    meol44 = .replace_labels(
    standardized_value_labels$meol44,
    `-2` = "na, see IMEOL04"
  ),
    meol45 = .replace_labels(
    standardized_value_labels$meol45,
    `-2` = "na, see IMEOL04"
  ),
    meol601 = .replace_labels(
    standardized_value_labels$meol601,
    `-2` = "na, see IMEOL06"
  ),
    meol602 = .replace_labels(
    standardized_value_labels$meol602,
    `-2` = "na, see IMEOL06"
  ),
    meol603 = .replace_labels(
    standardized_value_labels$meol603,
    `-2` = "na, see IMEOL06"
  ),
    meol604 = .replace_labels(
    standardized_value_labels$meol604,
    `-2` = "na, see IMEOL06"
  ),
    meol605 = .replace_labels(
    standardized_value_labels$meol605,
    `-2` = "na, see IMEOL06"
  ),
    meol606 = .replace_labels(
    standardized_value_labels$meol606,
    `-2` = "na, see IMEOL06"
  ),
    meol607 = .replace_labels(
    standardized_value_labels$meol607,
    `-2` = "na, see IMEOL06"
  ),
    meol608 = .replace_labels(
    standardized_value_labels$meol608,
    `-2` = "na, see IMEOL06"
  ),
    meol609 = .replace_labels(
    standardized_value_labels$meol609,
    `-2` = "na, see IMEOL06"
  ),
    meol610 = .replace_labels(
    standardized_value_labels$meol610,
    `-2` = "na, see IMEOL06"
  ),
    meol611 = .replace_labels(
    standardized_value_labels$meol611,
    `-2` = "na, see IMEOL06"
  ),
    meol612 = .replace_labels(
    standardized_value_labels$meol612,
    `-2` = "na, see IMEOL06"
  ),
    mrmeol = .replace_labels(
    standardized_value_labels$mrmeol,
    `6` = "not able to [physical]",
    `8` = "unknown / to be coded"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "meol601",
    "meol602",
    "meol603",
    "meol604",
    "meol605",
    "meol606",
    "meol607",
    "meol608",
    "meol609",
    "meol610",
    "meol611",
    "meol612",
    "mrmeol"
  )],
    meol01 = .replace_labels(
    standardized_value_labels$meol01,
    `-2` = "na, see JMRMEOL"
  ),
    meol02 = .replace_labels(
    standardized_value_labels$meol02,
    `-2` = "na, see JMRMEOL"
  ),
    meol03 = .replace_labels(
    standardized_value_labels$meol03,
    `-2` = "na, see JMRMEOL"
  ),
    meol04 = .replace_labels(
    standardized_value_labels$meol04,
    `-2` = "na, see JMRMEOL",
    `-1` = "R does not know"
  ),
    meol05 = .replace_labels(
    standardized_value_labels$meol05,
    `-2` = "na, see JMRMEOL",
    `2` = "yes, exclusively verbal"
  ),
    meol06 = c(`-2` = "na, see JMRMEOL", `-1` = "R does not know", `0` = "R does not have anything on paper"),
    meol41 = .replace_labels(
    standardized_value_labels$meol41,
    `-2` = "na, see JMEOL04"
  ),
    meol42 = .replace_labels(
    standardized_value_labels$meol42,
    `-2` = "na, see JMEOL04"
  ),
    meol43 = .replace_labels(
    standardized_value_labels$meol43,
    `-2` = "na, see JMEOL04"
  ),
    meol44 = .replace_labels(
    standardized_value_labels$meol44,
    `-2` = "na, see JMEOL04"
  ),
    meol45 = .replace_labels(
    standardized_value_labels$meol45,
    `-2` = "na, see JMEOL04"
  ),
    meol601 = .replace_labels(
    standardized_value_labels$meol601,
    `-2` = "na, see JMEOL06"
  ),
    meol602 = .replace_labels(
    standardized_value_labels$meol602,
    `-2` = "na, see JMEOL06"
  ),
    meol603 = .replace_labels(
    standardized_value_labels$meol603,
    `-2` = "na, see JMEOL06"
  ),
    meol604 = .replace_labels(
    standardized_value_labels$meol604,
    `-2` = "na, see JMEOL06"
  ),
    meol605 = .replace_labels(
    standardized_value_labels$meol605,
    `-2` = "na, see JMEOL06"
  ),
    meol606 = .replace_labels(
    standardized_value_labels$meol606,
    `-2` = "na, see JMEOL06"
  ),
    meol607 = .replace_labels(
    standardized_value_labels$meol607,
    `-2` = "na, see JMEOL06"
  ),
    meol608 = .replace_labels(
    standardized_value_labels$meol608,
    `-2` = "na, see JMEOL06"
  ),
    meol609 = .replace_labels(
    standardized_value_labels$meol609,
    `-2` = "na, see JMEOL06"
  ),
    meol610 = .replace_labels(
    standardized_value_labels$meol610,
    `-2` = "na, see JMEOL06"
  ),
    meol611 = .replace_labels(
    standardized_value_labels$meol611,
    `-2` = "na, see JMEOL06"
  ),
    meol612 = .replace_labels(
    standardized_value_labels$meol612,
    `-2` = "na, see IMEOL06"
  ),
    mrmeol = .replace_labels(
    standardized_value_labels$mrmeol,
    `6` = "not able to [physical]",
    `8` = "unknown / to be coded"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "meol01",
    "meol02",
    "meol03",
    "meol04",
    "meol05",
    "meol06",
    "meol41",
    "meol42",
    "meol43",
    "meol44",
    "meol45",
    "meol601",
    "meol602",
    "meol603",
    "meol604",
    "meol605",
    "meol606",
    "meol607",
    "mrmeol"
  )],
    meol01 = .replace_labels(
    standardized_value_labels$meol01,
    `-2` = "na, see KMRMEOL",
    `2` = "trust: quite strong",
    `3` = "trust: not much",
    `4` = "trust: not at all",
    `5` = "trust: no opinion"
  ),
    meol02 = .replace_labels(
    standardized_value_labels$meol02,
    `-2` = "na, see KMRMEOL",
    `2` = "trust: quite strong",
    `3` = "trust: not much",
    `4` = "trust: not at all",
    `5` = "trust: no opinion"
  ),
    meol03 = .replace_labels(
    standardized_value_labels$meol03,
    `-2` = "na, see KMRMEOL"
  ),
    meol04 = .replace_labels(
    standardized_value_labels$meol04,
    `-2` = "na, see KMRMEOL",
    `-1` = "R does not know"
  ),
    meol05 = .replace_labels(
    standardized_value_labels$meol05,
    `-2` = "na, see KMRMEOL",
    `2` = "yes, exclusively verbal"
  ),
    meol06 = c(`-2` = "na, see KMRMEOL", `-1` = "R does not know", `0` = "R does not have anything on paper"),
    meol41 = .replace_labels(
    standardized_value_labels$meol41,
    `-2` = "na, see KMEOL04"
  ),
    meol42 = .replace_labels(
    standardized_value_labels$meol42,
    `-2` = "na, see KMEOL04"
  ),
    meol43 = .replace_labels(
    standardized_value_labels$meol43,
    `-2` = "na, see KMEOL04"
  ),
    meol44 = .replace_labels(
    standardized_value_labels$meol44,
    `-2` = "na, see KMEOL04"
  ),
    meol45 = .replace_labels(
    standardized_value_labels$meol45,
    `-2` = "na, see KMEOL04"
  ),
    meol601 = .replace_labels(
    standardized_value_labels$meol601,
    `-2` = "na, see KMEOL06"
  ),
    meol602 = .replace_labels(
    standardized_value_labels$meol602,
    `-2` = "na, see KMEOL06"
  ),
    meol603 = .replace_labels(
    standardized_value_labels$meol603,
    `-2` = "na, see KMEOL06"
  ),
    meol604 = .replace_labels(
    standardized_value_labels$meol604,
    `-2` = "na, see KMEOL06"
  ),
    meol605 = .replace_labels(
    standardized_value_labels$meol605,
    `-2` = "na, see KMEOL06"
  ),
    meol606 = .replace_labels(
    standardized_value_labels$meol606,
    `-2` = "na, see KMEOL06"
  ),
    meol607 = .replace_labels(
    standardized_value_labels$meol607,
    `-2` = "na, see KMEOL06"
  ),
    mrmeol = .replace_labels(
    standardized_value_labels$mrmeol,
    `6` = "not able to [physical]",
    `8` = "unknown / to be coded"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  meol01 = "categorical",
  meol02 = "categorical",
  meol03 = "categorical",
  meol04 = "numeric",
  meol05 = "categorical",
  meol06 = "categorical",
  meol07 = "categorical",
  meol08 = "categorical",
  meol09 = "categorical",
  meol10 = "categorical",
  meol11 = "categorical",
  meol12 = "categorical",
  meol13 = "categorical",
  meol14 = "numeric",
  meol141 = "categorical",
  meol142 = "categorical",
  meol143 = "categorical",
  meol144 = "categorical",
  meol145 = "categorical",
  meol15 = "categorical",
  meol41 = "categorical",
  meol42 = "categorical",
  meol43 = "categorical",
  meol44 = "categorical",
  meol45 = "categorical",
  meol601 = "categorical",
  meol602 = "categorical",
  meol603 = "categorical",
  meol604 = "categorical",
  meol605 = "categorical",
  meol606 = "categorical",
  meol607 = "categorical",
  meol608 = "categorical",
  meol609 = "categorical",
  meol610 = "categorical",
  meol611 = "categorical",
  meol612 = "categorical",
  mrmeol = "categorical"
)

.lasa_fc_195 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "195", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "195", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "195", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "195", waves = .lasa_wave_rows())
)
