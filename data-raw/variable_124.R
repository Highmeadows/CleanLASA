## LASA filecode 124 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qmemo01 = "memory 01: important dates",
  qmemo02 = "memory 02: beginning of the day",
  qmemo03 = "memory 03: suitcase",
  qmemo04 = "memory 04: names and faces",
  qmemo05 = "memory 05: difficulties",
  qmemo06 = "memory 06: conscious",
  qmemo07 = "memory 07: other relation",
  qmemo08 = "memory 08: mental images",
  qmemo09 = "memory 09: mentally repeat",
  qmemo10 = "memory 10: reminders",
  qmemo11 = "memory 11: nervous",
  qmemo12 = "memory 12: remember names",
  qmemo13 = "memory 13: difficult if nervous",
  qmemo14 = "memory 14: 10 years",
  qmemo15 = "memory 15: problems",
  qmemo16 = "memory 16: introduce",
  qmemo17 = "memory 17: improve",
  qmemo18 = "memory 18: memory test",
  qmemo19 = "memory 19: practice",
  qmemo20 = "memory 20: questions",
  qmemo21 = "memory 21: use",
  qmemo22 = "memory 22: accurate",
  qmemo23 = "memory 23: tense",
  qmemo24 = "memory 24: declines",
  qmemo25 = "memory 25: did not do",
  qmemo26 = "memory 26: appointment",
  qmemo27 = "memory 27: exercise",
  qmemo28 = "memory 28: not as good",
  qmemo29 = "memory 29: decline when elder",
  qmemo30 = "memory 30: improve when practice",
  qmemo31 = "memory 31: always declines",
  qmemo32 = "memory 32: no improvement",
  qmemo33 = "memory 33: upset",
  qmemo34 = "memory 34: difficult when upset",
  qmemo35 = "memory 35: nervous new place",
  qmemo36 = "memory 36: proud",
  qmemo37 = "memory 37: admire others",
  qmemo38 = "memory 38: important to be precise",
  qmemo39 = "memory 39: self without help",
  qmemo40 = "memory 40: pleasant",
  qmemo41 = "memory 41: well"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels[c(
    "qmemo01",
    "qmemo02",
    "qmemo03",
    "qmemo04",
    "qmemo05",
    "qmemo06",
    "qmemo07",
    "qmemo08",
    "qmemo09",
    "qmemo10",
    "qmemo11",
    "qmemo12",
    "qmemo13",
    "qmemo14",
    "qmemo15",
    "qmemo16",
    "qmemo17",
    "qmemo18",
    "qmemo19",
    "qmemo20",
    "qmemo21",
    "qmemo22",
    "qmemo23",
    "qmemo24",
    "qmemo25",
    "qmemo26",
    "qmemo27",
    "qmemo28",
    "qmemo29",
    "qmemo30"
  )],
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qmemo01 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo02 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo03 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo04 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo05 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo06 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo07 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo08 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo09 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo10 = c(
    `-1` = "not available",
    `1` = "never",
    `2` = "seldom",
    `3` = "some of the time",
    `4` = "often",
    `5` = "always"
  ),
  qmemo11 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo12 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo13 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo14 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo15 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo16 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo17 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo18 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo19 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo20 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo21 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo22 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo23 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo24 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo25 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo26 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo27 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo28 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo29 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo30 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo31 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo32 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo33 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo34 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo35 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo36 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo37 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo38 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo39 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo40 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  ),
  qmemo41 = c(
    `-1` = "not available",
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "no agreement/agreement",
    `4` = "agree",
    `5` = "strongly agree"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "qmemo01",
    "qmemo02",
    "qmemo03",
    "qmemo04",
    "qmemo05",
    "qmemo06",
    "qmemo07",
    "qmemo08",
    "qmemo09",
    "qmemo10",
    "qmemo11",
    "qmemo12",
    "qmemo13",
    "qmemo14",
    "qmemo15",
    "qmemo16",
    "qmemo17",
    "qmemo18",
    "qmemo19",
    "qmemo20",
    "qmemo21",
    "qmemo22",
    "qmemo23",
    "qmemo24",
    "qmemo25",
    "qmemo26",
    "qmemo27",
    "qmemo28",
    "qmemo29",
    "qmemo30"
  )],
    qmemo01 = .replace_labels(
    standardized_value_labels$qmemo01,
    `-1` = "no answer"
  ),
    qmemo02 = .replace_labels(
    standardized_value_labels$qmemo02,
    `-1` = "no answer"
  ),
    qmemo03 = .replace_labels(
    standardized_value_labels$qmemo03,
    `-1` = "no answer"
  ),
    qmemo04 = .replace_labels(
    standardized_value_labels$qmemo04,
    `-1` = "no answer"
  ),
    qmemo05 = .replace_labels(
    standardized_value_labels$qmemo05,
    `-1` = "no answer"
  ),
    qmemo06 = .replace_labels(
    standardized_value_labels$qmemo06,
    `-1` = "no answer"
  ),
    qmemo07 = .replace_labels(
    standardized_value_labels$qmemo07,
    `-1` = "no answer"
  ),
    qmemo08 = .replace_labels(
    standardized_value_labels$qmemo08,
    `-1` = "no answer"
  ),
    qmemo09 = .replace_labels(
    standardized_value_labels$qmemo09,
    `-1` = "no answer"
  ),
    qmemo10 = .replace_labels(
    standardized_value_labels$qmemo10,
    `-1` = "no answer"
  ),
    qmemo11 = .replace_labels(
    standardized_value_labels$qmemo11,
    `-1` = "no answer"
  ),
    qmemo12 = .replace_labels(
    standardized_value_labels$qmemo12,
    `-1` = "no answer"
  ),
    qmemo13 = .replace_labels(
    standardized_value_labels$qmemo13,
    `-1` = "no answer"
  ),
    qmemo14 = .replace_labels(
    standardized_value_labels$qmemo14,
    `-1` = "no answer"
  ),
    qmemo15 = .replace_labels(
    standardized_value_labels$qmemo15,
    `-1` = "no answer"
  ),
    qmemo16 = .replace_labels(
    standardized_value_labels$qmemo16,
    `-1` = "no answer"
  ),
    qmemo17 = .replace_labels(
    standardized_value_labels$qmemo17,
    `-1` = "no answer"
  ),
    qmemo18 = .replace_labels(
    standardized_value_labels$qmemo18,
    `-1` = "no answer"
  ),
    qmemo19 = .replace_labels(
    standardized_value_labels$qmemo19,
    `-1` = "no answer"
  ),
    qmemo20 = .replace_labels(
    standardized_value_labels$qmemo20,
    `-1` = "no answer"
  ),
    qmemo21 = .replace_labels(
    standardized_value_labels$qmemo21,
    `-1` = "no answer"
  ),
    qmemo22 = .replace_labels(
    standardized_value_labels$qmemo22,
    `-1` = "no answer"
  ),
    qmemo23 = .replace_labels(
    standardized_value_labels$qmemo23,
    `-1` = "no answer"
  ),
    qmemo24 = .replace_labels(
    standardized_value_labels$qmemo24,
    `-1` = "no answer"
  ),
    qmemo25 = .replace_labels(
    standardized_value_labels$qmemo25,
    `-1` = "no answer"
  ),
    qmemo26 = .replace_labels(
    standardized_value_labels$qmemo26,
    `-1` = "no answer"
  ),
    qmemo27 = .replace_labels(
    standardized_value_labels$qmemo27,
    `-1` = "no answer"
  ),
    qmemo28 = .replace_labels(
    standardized_value_labels$qmemo28,
    `-1` = "no answer"
  ),
    qmemo29 = .replace_labels(
    standardized_value_labels$qmemo29,
    `-1` = "no answer"
  ),
    qmemo30 = .replace_labels(
    standardized_value_labels$qmemo30,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qmemo01 = .replace_labels(
    standardized_value_labels$qmemo01,
    `-1` = "no answer"
  ),
    qmemo02 = .replace_labels(
    standardized_value_labels$qmemo02,
    `-1` = "no answer"
  ),
    qmemo03 = .replace_labels(
    standardized_value_labels$qmemo03,
    `-1` = "no answer"
  ),
    qmemo04 = .replace_labels(
    standardized_value_labels$qmemo04,
    `-1` = "no answer"
  ),
    qmemo05 = .replace_labels(
    standardized_value_labels$qmemo05,
    `-1` = "no answer"
  ),
    qmemo06 = .replace_labels(
    standardized_value_labels$qmemo06,
    `-1` = "no answer"
  ),
    qmemo07 = .replace_labels(
    standardized_value_labels$qmemo07,
    `-1` = "no answer"
  ),
    qmemo08 = .replace_labels(
    standardized_value_labels$qmemo08,
    `-1` = "no answer"
  ),
    qmemo09 = .replace_labels(
    standardized_value_labels$qmemo09,
    `-1` = "no answer"
  ),
    qmemo10 = .replace_labels(
    standardized_value_labels$qmemo10,
    `-1` = "no answer"
  ),
    qmemo11 = .replace_labels(
    standardized_value_labels$qmemo11,
    `-1` = "no answer"
  ),
    qmemo12 = .replace_labels(
    standardized_value_labels$qmemo12,
    `-1` = "no answer"
  ),
    qmemo13 = .replace_labels(
    standardized_value_labels$qmemo13,
    `-1` = "no answer"
  ),
    qmemo14 = .replace_labels(
    standardized_value_labels$qmemo14,
    `-1` = "no answer"
  ),
    qmemo15 = .replace_labels(
    standardized_value_labels$qmemo15,
    `-1` = "no answer"
  ),
    qmemo16 = .replace_labels(
    standardized_value_labels$qmemo16,
    `-1` = "no answer"
  ),
    qmemo17 = .replace_labels(
    standardized_value_labels$qmemo17,
    `-1` = "no answer"
  ),
    qmemo18 = .replace_labels(
    standardized_value_labels$qmemo18,
    `-1` = "no answer"
  ),
    qmemo19 = .replace_labels(
    standardized_value_labels$qmemo19,
    `-1` = "no answer"
  ),
    qmemo20 = .replace_labels(
    standardized_value_labels$qmemo20,
    `-1` = "no answer"
  ),
    qmemo21 = .replace_labels(
    standardized_value_labels$qmemo21,
    `-1` = "no answer"
  ),
    qmemo22 = .replace_labels(
    standardized_value_labels$qmemo22,
    `-1` = "no answer"
  ),
    qmemo23 = .replace_labels(
    standardized_value_labels$qmemo23,
    `-1` = "no answer"
  ),
    qmemo24 = .replace_labels(
    standardized_value_labels$qmemo24,
    `-1` = "no answer"
  ),
    qmemo25 = .replace_labels(
    standardized_value_labels$qmemo25,
    `-1` = "no answer"
  ),
    qmemo26 = .replace_labels(
    standardized_value_labels$qmemo26,
    `-1` = "no answer"
  ),
    qmemo27 = .replace_labels(
    standardized_value_labels$qmemo27,
    `-1` = "no answer"
  ),
    qmemo28 = .replace_labels(
    standardized_value_labels$qmemo28,
    `-1` = "no answer"
  ),
    qmemo29 = .replace_labels(
    standardized_value_labels$qmemo29,
    `-1` = "no answer"
  ),
    qmemo30 = .replace_labels(
    standardized_value_labels$qmemo30,
    `-1` = "no answer"
  ),
    qmemo31 = .replace_labels(
    standardized_value_labels$qmemo31,
    `-1` = "no answer"
  ),
    qmemo32 = .replace_labels(
    standardized_value_labels$qmemo32,
    `-1` = "no answer"
  ),
    qmemo33 = .replace_labels(
    standardized_value_labels$qmemo33,
    `-1` = "no answer"
  ),
    qmemo34 = .replace_labels(
    standardized_value_labels$qmemo34,
    `-1` = "no answer"
  ),
    qmemo35 = .replace_labels(
    standardized_value_labels$qmemo35,
    `-1` = "no answer"
  ),
    qmemo36 = .replace_labels(
    standardized_value_labels$qmemo36,
    `-1` = "no answer"
  ),
    qmemo37 = .replace_labels(
    standardized_value_labels$qmemo37,
    `-1` = "no answer"
  ),
    qmemo38 = .replace_labels(
    standardized_value_labels$qmemo38,
    `-1` = "no answer"
  ),
    qmemo39 = .replace_labels(
    standardized_value_labels$qmemo39,
    `-1` = "no answer"
  ),
    qmemo40 = .replace_labels(
    standardized_value_labels$qmemo40,
    `-1` = "no answer"
  ),
    qmemo41 = .replace_labels(
    standardized_value_labels$qmemo41,
    `-1` = "no answer"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qmemo01 = .replace_labels(
    standardized_value_labels$qmemo01,
    `-1` = "no answer"
  ),
    qmemo02 = .replace_labels(
    standardized_value_labels$qmemo02,
    `-1` = "no answer"
  ),
    qmemo03 = .replace_labels(
    standardized_value_labels$qmemo03,
    `-1` = "no answer"
  ),
    qmemo04 = .replace_labels(
    standardized_value_labels$qmemo04,
    `-1` = "no answer"
  ),
    qmemo05 = .replace_labels(
    standardized_value_labels$qmemo05,
    `-1` = "no answer"
  ),
    qmemo06 = .replace_labels(
    standardized_value_labels$qmemo06,
    `-1` = "no answer"
  ),
    qmemo07 = .replace_labels(
    standardized_value_labels$qmemo07,
    `-1` = "no answer"
  ),
    qmemo08 = .replace_labels(
    standardized_value_labels$qmemo08,
    `-1` = "no answer"
  ),
    qmemo09 = .replace_labels(
    standardized_value_labels$qmemo09,
    `-1` = "no answer"
  ),
    qmemo10 = .replace_labels(
    standardized_value_labels$qmemo10,
    `-1` = "no answer"
  ),
    qmemo11 = .replace_labels(
    standardized_value_labels$qmemo11,
    `-1` = "no answer"
  ),
    qmemo12 = .replace_labels(
    standardized_value_labels$qmemo12,
    `-1` = "no answer"
  ),
    qmemo13 = .replace_labels(
    standardized_value_labels$qmemo13,
    `-1` = "no answer"
  ),
    qmemo14 = .replace_labels(
    standardized_value_labels$qmemo14,
    `-1` = "no answer"
  ),
    qmemo15 = .replace_labels(
    standardized_value_labels$qmemo15,
    `-1` = "no answer"
  ),
    qmemo16 = .replace_labels(
    standardized_value_labels$qmemo16,
    `-1` = "no answer"
  ),
    qmemo17 = .replace_labels(
    standardized_value_labels$qmemo17,
    `-1` = "no answer"
  ),
    qmemo18 = .replace_labels(
    standardized_value_labels$qmemo18,
    `-1` = "no answer"
  ),
    qmemo19 = .replace_labels(
    standardized_value_labels$qmemo19,
    `-1` = "no answer"
  ),
    qmemo20 = .replace_labels(
    standardized_value_labels$qmemo20,
    `-1` = "no answer"
  ),
    qmemo21 = .replace_labels(
    standardized_value_labels$qmemo21,
    `-1` = "no answer"
  ),
    qmemo22 = .replace_labels(
    standardized_value_labels$qmemo22,
    `-1` = "no answer"
  ),
    qmemo23 = .replace_labels(
    standardized_value_labels$qmemo23,
    `-1` = "no answer"
  ),
    qmemo24 = .replace_labels(
    standardized_value_labels$qmemo24,
    `-1` = "no answer"
  ),
    qmemo25 = .replace_labels(
    standardized_value_labels$qmemo25,
    `-1` = "no answer"
  ),
    qmemo26 = .replace_labels(
    standardized_value_labels$qmemo26,
    `-1` = "no answer"
  ),
    qmemo27 = .replace_labels(
    standardized_value_labels$qmemo27,
    `-1` = "no answer"
  ),
    qmemo28 = .replace_labels(
    standardized_value_labels$qmemo28,
    `-1` = "no answer"
  ),
    qmemo29 = .replace_labels(
    standardized_value_labels$qmemo29,
    `-1` = "no answer"
  ),
    qmemo30 = .replace_labels(
    standardized_value_labels$qmemo30,
    `-1` = "no answer"
  ),
    qmemo31 = .replace_labels(
    standardized_value_labels$qmemo31,
    `-1` = "no answer"
  ),
    qmemo32 = .replace_labels(
    standardized_value_labels$qmemo32,
    `-1` = "no answer"
  ),
    qmemo33 = .replace_labels(
    standardized_value_labels$qmemo33,
    `-1` = "no answer"
  ),
    qmemo34 = .replace_labels(
    standardized_value_labels$qmemo34,
    `-1` = "no answer"
  ),
    qmemo35 = .replace_labels(
    standardized_value_labels$qmemo35,
    `-1` = "no answer"
  ),
    qmemo36 = .replace_labels(
    standardized_value_labels$qmemo36,
    `-1` = "no answer"
  ),
    qmemo37 = .replace_labels(
    standardized_value_labels$qmemo37,
    `-1` = "no answer"
  ),
    qmemo38 = .replace_labels(
    standardized_value_labels$qmemo38,
    `-1` = "no answer"
  ),
    qmemo39 = .replace_labels(
    standardized_value_labels$qmemo39,
    `-1` = "no answer"
  ),
    qmemo40 = .replace_labels(
    standardized_value_labels$qmemo40,
    `-1` = "no answer"
  ),
    qmemo41 = .replace_labels(
    standardized_value_labels$qmemo41,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qmemo01 = "categorical",
  qmemo02 = "categorical",
  qmemo03 = "categorical",
  qmemo04 = "categorical",
  qmemo05 = "categorical",
  qmemo06 = "categorical",
  qmemo07 = "categorical",
  qmemo08 = "categorical",
  qmemo09 = "categorical",
  qmemo10 = "categorical",
  qmemo11 = "categorical",
  qmemo12 = "categorical",
  qmemo13 = "categorical",
  qmemo14 = "categorical",
  qmemo15 = "categorical",
  qmemo16 = "categorical",
  qmemo17 = "categorical",
  qmemo18 = "categorical",
  qmemo19 = "categorical",
  qmemo20 = "categorical",
  qmemo21 = "categorical",
  qmemo22 = "categorical",
  qmemo23 = "categorical",
  qmemo24 = "categorical",
  qmemo25 = "categorical",
  qmemo26 = "categorical",
  qmemo27 = "categorical",
  qmemo28 = "categorical",
  qmemo29 = "categorical",
  qmemo30 = "categorical",
  qmemo31 = "categorical",
  qmemo32 = "categorical",
  qmemo33 = "categorical",
  qmemo34 = "categorical",
  qmemo35 = "categorical",
  qmemo36 = "categorical",
  qmemo37 = "categorical",
  qmemo38 = "categorical",
  qmemo39 = "categorical",
  qmemo40 = "categorical",
  qmemo41 = "categorical"
)

.lasa_fc_124 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "124", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "124", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "124", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "124", waves = .lasa_wave_rows())
)
