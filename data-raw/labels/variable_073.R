## LASA filecode 073 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  lo1 = "There is always someone I can talk to about my day-to-day problems / Er is altijd wel iemand in mijn omgeving bij wie ik met mijn dagelijkse probleempjes terecht kan",
  lo10 = "I often feel rejected / Vaak voel ik me in de steek gelaten",
  lo11 = "I can call on my friends whenever I need them / Wanneer ik daar behoefte aan heb kan ik altijd bij mijn vrienden terecht",
  lo2 = "I miss having a really close friend / Ik mis een echt goede vriend of vriendin",
  lo3 = "I experience a general sense of emptiness / Ik ervaar een leegte om me heen",
  lo4 = "There are plenty of people I can lean on when I have problems / Er zijn genoeg mensen op wie ik in geval van narigheid kan terugvallen",
  lo5 = "I miss the pleasure of the company of others / Ik mis gezelligheid om me heen",
  lo6 = "I find my circle of friends and acquaintances too limited / Ik vind mijn kring van kennissen te beperkt",
  lo7 = "There are many people I can trust completely / Ik heb veel mensen op wie ik volledig kan vertrouwen",
  lo8 = "There are enough people I feel close to / Er zijn voldoende mensen met wie ik me nauw verbonden voel",
  lo9 = "I miss having people around me / Ik mis mensen om me heen",
  lo_mode = NA_character_,
  lorat = "I am among the not-moderate-severe-extreme lonely people / Als we de mensen zouden indelen in: niet eenzaam, matig eenzaam, sterk eenzaam, zeer sterk eenzaam, waar zou u zich dan nu toe rekenen?",
  losom = "I sometimes feel lonely / Ik voel me soms wel eens eenzaam"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels[c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9", "lo_mode")],
  Wave_C_labels = harmonized_labels[c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9")],
  Wave_D_labels = harmonized_labels[c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9")],
  Wave_E_labels = harmonized_labels[c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9")],
  Wave_F_labels = harmonized_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
  Wave_G_labels = harmonized_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
  Wave_H_labels = harmonized_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
  Wave_3B_labels = harmonized_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
  Wave_MB_labels = harmonized_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
  Wave_I_labels = harmonized_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  lo1 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo10 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo11 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo2 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo3 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo4 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo5 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo6 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo7 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo8 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo9 = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  lo_mode = c(
    `-5` = "computer or paper-and-pencil short interview",
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "interview terminated",
    `1` = "computer",
    `2` = "paper-and-pencil"
  ),
  lorat = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated)",
    `-1` = "no answer",
    `1` = "not lonely/niet eenzaam",
    `2` = "moderately lonely/sterk eenzaam",
    `3` = "severely lonely/sterk eenzaam",
    `4` = "extremely lonely/zeer sterk eenzaam"
  ),
  losom = c(
    `-4` = "refusal/skip by interviewernterviewer",
    `-3` = "not asked (interview terminated/skip)",
    `-1` = "no answer",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9", "lo_mode")],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo_mode = .replace_labels(
    standardized_value_labels$lo_mode,
    `-5` = "computer or paper-and-pencil short version",
    `-4` = "refusal/skip by Interviewer",
    `-3` = "terminated interview"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9")],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9")],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9")],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lorat = .replace_labels(
    standardized_value_labels$lorat,
    `-4` = "refusal/skip by interviewer"
  ),
    losom = .replace_labels(
    standardized_value_labels$losom,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lorat = .replace_labels(
    standardized_value_labels$lorat,
    `-4` = "refusal/skip by interviewer"
  ),
    losom = .replace_labels(
    standardized_value_labels$losom,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lorat = .replace_labels(
    standardized_value_labels$lorat,
    `-4` = "refusal/skip by interviewer"
  ),
    losom = .replace_labels(
    standardized_value_labels$losom,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lorat = .replace_labels(
    standardized_value_labels$lorat,
    `-4` = "refusal/skip by interviewer"
  ),
    losom = .replace_labels(
    standardized_value_labels$losom,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lorat = .replace_labels(
    standardized_value_labels$lorat,
    `-4` = "refusal/skip by interviewer"
  ),
    losom = .replace_labels(
    standardized_value_labels$losom,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "lo1",
    "lo10",
    "lo11",
    "lo2",
    "lo3",
    "lo4",
    "lo5",
    "lo6",
    "lo7",
    "lo8",
    "lo9",
    "lorat",
    "losom"
  )],
    lo1 = .replace_labels(
    standardized_value_labels$lo1,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo10 = .replace_labels(
    standardized_value_labels$lo10,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo11 = .replace_labels(
    standardized_value_labels$lo11,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo2 = .replace_labels(
    standardized_value_labels$lo2,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo3 = .replace_labels(
    standardized_value_labels$lo3,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo4 = .replace_labels(
    standardized_value_labels$lo4,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo5 = .replace_labels(
    standardized_value_labels$lo5,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo6 = .replace_labels(
    standardized_value_labels$lo6,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo7 = .replace_labels(
    standardized_value_labels$lo7,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo8 = .replace_labels(
    standardized_value_labels$lo8,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lo9 = .replace_labels(
    standardized_value_labels$lo9,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  ),
    lorat = .replace_labels(
    standardized_value_labels$lorat,
    `-4` = "refusal/skip by interviewer"
  ),
    losom = .replace_labels(
    standardized_value_labels$losom,
    `-4` = "refusal/skip by interviewer",
    `2` = "more-or-less"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  lo1 = "categorical",
  lo10 = "categorical",
  lo11 = "categorical",
  lo2 = "categorical",
  lo3 = "categorical",
  lo4 = "categorical",
  lo5 = "categorical",
  lo6 = "categorical",
  lo7 = "categorical",
  lo8 = "categorical",
  lo9 = "categorical",
  lo_mode = "categorical",
  lorat = "categorical",
  losom = "categorical"
)

.lasa_fc_073 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "073", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "073", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "073", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "073", waves = .lasa_wave_rows())
)
