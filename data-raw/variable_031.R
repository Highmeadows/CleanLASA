## LASA filecode 031 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  msens01 = "R usually wears glasses or contact lenses",
  msens02 = "Subjective: see well enough",
  msens03 = "Small print in paper without glasses etc",
  msens04 = "Small print in paper with glasses etc",
  msens05 = "Recognize face 4 meter without glasses etc",
  msens06 = "Recognize face 4 meter with glasses etc",
  msens07 = "R usually wears hearing aid (HA)",
  msens08 = "Subjective: hear well enough",
  msens08a = "1 HA: hear well enough (subjective)",
  msens08b = "2HA: hear well enough (subjective)",
  msens09 = "Follow conversation 4 persons: without HA",
  msens09a = "1 HA: follow conversation 3/4 persons without HA",
  msens09b = "2 HA: follow conversation 3/4 persons without HA",
  msens10 = "Follow conversation 4 persons: with HA",
  msens10a = "1 HA: follow conversation 3/4 persons with HA",
  msens10b = "2 HA: follow conversation 3/4 persons with HA",
  msens11 = "Have conversation 1 person: without HA",
  msens11a = "1 HA: have conversation 1 person without HA",
  msens11b = "2 HA: have conversation 1 person without HA",
  msens12 = "Have conversation 1 person: with HA",
  msens12a = "1 HA: have conversation 1 person with HA",
  msens12b = "2 HA: have conversation 1 person with HA",
  msens13 = "Can use normal telephone",
  msens14 = "R has speech defect: observation",
  msens15 = "R has problems understanding written text (dyslexic)",
  msens16 = "Can understand 1 person at party without HA",
  msens16a = "1 HA: can understand 1 person at party without HA",
  msens16b = "2 HA: can understand 1 person at party without HA",
  msens17 = "Can understand 1 person at party with HA",
  msens17a = "1 HA: can understand 1 person at party with HA",
  msens17b = "2 HA: can understand 1 person at party with HA",
  msens18 = "R hears noises, beeping, etc: nowadays",
  msens19 = "R hears noises, beeping, etc: frequency",
  msens20 = "R hears noises, beeping, etc: how annoying",
  msens21 = "No HA/not using HA: subjective rating hearing (scale 0-9)",
  msens22a = "1 or 2 HA: subjective rating hearing without HA (scale 0-9)",
  msens22b = "1 or 2 HA: subjective rating hearing with HA (scale 0-9)",
  msens7a = "R possesses hearing aid (HA)",
  msens7b = "R wears hearing aid(s) (HA) how many hours",
  msens7c = "1 or 2 HA: R is wearing HA right now",
  sense01 = "Respondent wears glasses: observation",
  sense02 = "Subjective: see well enough",
  sense03 = "Small print in paper: visual difficulty",
  sense04 = "Small print in paper with glasses etc",
  sense05 = "Recognize face at 4 meters: visual difficulty",
  sense06 = "Recognize face 4 meter with glasses etc",
  sense07 = "Respondent wears hearing aid (HA): observation",
  sense08 = "Subjective: hear well enough",
  sense09 = "Follow conversation with 3/4 persons: hearing difficulty",
  sense10 = "Follow conversation 4 persons: with HA",
  sense11 = "Have conversation with 1 person: hearing difficulty",
  sense12 = "Have conversation 1 person: with HA",
  sense13 = "Can use normal telephone",
  sense14 = "Respondent has speech defect: observation",
  sense18 = "R hears noises, beeping, etc: nowadays",
  sense19 = "R hears noises, beeping, etc: frequency",
  sense20 = "R hears noises, beeping, etc: how annoying",
  sense7a = "R possesses hearing aid (HA)",
  sense7b = "R wears hearing aid(s) (HA) how many hours"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "sense01",
    "sense02",
    "sense03",
    "sense04",
    "sense05",
    "sense06",
    "sense07",
    "sense08",
    "sense09",
    "sense10",
    "sense11",
    "sense12",
    "sense13",
    "sense14"
  ),
  `C` = c(
    "sense01",
    "sense02",
    "sense03",
    "sense04",
    "sense05",
    "sense06",
    "sense07",
    "sense08",
    "sense09",
    "sense10",
    "sense11",
    "sense12",
    "sense13",
    "sense14"
  ),
  `D` = c(
    "sense01",
    "sense02",
    "sense03",
    "sense04",
    "sense05",
    "sense06",
    "sense07",
    "sense08",
    "sense09",
    "sense10",
    "sense11",
    "sense12",
    "sense13",
    "sense14"
  ),
  `E` = c(
    "sense01",
    "sense02",
    "sense03",
    "sense04",
    "sense05",
    "sense06",
    "sense07",
    "sense08",
    "sense09",
    "sense10",
    "sense11",
    "sense12",
    "sense13",
    "sense14"
  ),
  `2B` = c(
    "sense03",
    "sense04",
    "sense05",
    "sense06",
    "sense09",
    "sense10",
    "sense11",
    "sense12",
    "sense13"
  ),
  `F` = c(
    "msens01",
    "msens02",
    "msens03",
    "msens04",
    "msens05",
    "msens06",
    "msens07",
    "msens08",
    "msens09",
    "msens10",
    "msens11",
    "msens12",
    "msens13",
    "msens14",
    "msens15"
  ),
  `G` = c(
    "msens01",
    "msens02",
    "msens03",
    "msens04",
    "msens05",
    "msens06",
    "msens07",
    "msens08",
    "msens09",
    "msens10",
    "msens11",
    "msens12",
    "msens13",
    "msens14",
    "msens15"
  ),
  `H` = c(
    "msens01",
    "msens02",
    "msens03",
    "msens04",
    "msens05",
    "msens06",
    "msens08",
    "msens09",
    "msens10",
    "msens11",
    "msens12",
    "msens13",
    "msens16",
    "msens17",
    "msens18",
    "msens19",
    "msens20",
    "msens7a",
    "msens7b"
  ),
  `3B` = c(
    "sense01",
    "sense02",
    "sense03",
    "sense04",
    "sense05",
    "sense06",
    "sense08",
    "sense09",
    "sense10",
    "sense11",
    "sense12",
    "sense13",
    "sense18",
    "sense19",
    "sense20",
    "sense7a",
    "sense7b"
  ),
  `MB` = c(
    "sense03",
    "sense05",
    "sense09",
    "sense11",
    "sense13",
    "sense18",
    "sense19",
    "sense20",
    "sense7a",
    "sense7b"
  ),
  `I` = c(
    "msens01",
    "msens03",
    "msens04",
    "msens05",
    "msens06",
    "msens08",
    "msens09",
    "msens10",
    "msens11",
    "msens12",
    "msens13",
    "msens16",
    "msens17",
    "msens18",
    "msens19",
    "msens20",
    "msens7a",
    "msens7b"
  ),
  `J` = c(
    "msens01",
    "msens03",
    "msens04",
    "msens05",
    "msens06",
    "msens08",
    "msens08a",
    "msens08b",
    "msens09",
    "msens09a",
    "msens09b",
    "msens10a",
    "msens10b",
    "msens11",
    "msens11a",
    "msens11b",
    "msens12a",
    "msens12b",
    "msens16",
    "msens16a",
    "msens16b",
    "msens17a",
    "msens17b",
    "msens21",
    "msens22a",
    "msens22b",
    "msens7a",
    "msens7b",
    "msens7c"
  ),
  `K` = c(
    "msens01",
    "msens03",
    "msens04",
    "msens05",
    "msens06",
    "msens08",
    "msens08a",
    "msens08b",
    "msens09",
    "msens09a",
    "msens09b",
    "msens10a",
    "msens10b",
    "msens11",
    "msens11a",
    "msens11b",
    "msens12a",
    "msens12b",
    "msens16",
    "msens16a",
    "msens16b",
    "msens17a",
    "msens17b",
    "msens21",
    "msens22a",
    "msens22b",
    "msens7a",
    "msens7b",
    "msens7c"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    sense03 = "Small print in paper without glasses etc",
    sense05 = "Recognize face 4 meter without glasses etc",
    sense09 = "Follow conversation 4 persons: without HA",
    sense11 = "Have conversation 1 person: without HA"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    sense03 = "Small print in paper without glasses etc",
    sense05 = "Recognize face 4 meter without glasses etc",
    sense09 = "Follow conversation 4 persons: without HA",
    sense11 = "Have conversation 1 person: without HA"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    sense01 = "R usually wears glasses or contact lenses (in D: observation)",
    sense03 = "Small print in paper without glasses etc",
    sense05 = "Recognize face 4 meter without glasses etc",
    sense07 = "R usually wears hearing aid (HA)",
    sense09 = "Follow conversation 4 persons: without HA",
    sense11 = "Have conversation 1 person: without HA"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    sense01 = "R usually wears glasses or contact lenses (in D: observation)",
    sense03 = "Small print in paper without glasses etc",
    sense05 = "Recognize face 4 meter without glasses etc",
    sense07 = "R usually wears hearing aid (HA)",
    sense09 = "Follow conversation 4 persons: without HA",
    sense11 = "Have conversation 1 person: without HA"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    sense03 = "Small print in paper without glasses etc",
    sense05 = "Recognize face 4 meter without glasses etc",
    sense09 = "Follow conversation 4 persons: without HA",
    sense11 = "Have conversation 1 person: without HA"
  ),
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    sense01 = "R usually wears glasses or contact lenses",
    sense03 = "Small print in paper without glasses etc",
    sense05 = "Recognize face 4 meter without glasses etc",
    sense09 = "Follow conversation 4 persons: without HA",
    sense11 = "Have conversation 1 person: without HA"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    sense03 = "Small print in paper with or without glasses etc",
    sense05 = "Recognize face 4 meter with or without glasses etc",
    sense09 = "Follow conversation 3/4 persons: with or without HA",
    sense11 = "Have conversation 1 person: with or without HA"
  ),
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    msens08 = "No HA/not using HA: hear well enough (subjective)",
    msens09 = "No HA/not using HA: follow conversation 3/4 persons",
    msens11 = "No HA/not using HA: have conversation 1 person",
    msens16 = "No HA/not using HA: can understand 1 person at party",
    msens7a = "R possesses hearing aid(s) (HA)",
    msens7b = "1 or 2 HA: R wears HA how many hours"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    msens08 = "No HA/not using HA: hear well enough (subjective)",
    msens09 = "No HA/not using HA: follow conversation 3/4 persons",
    msens11 = "No HA/not using HA: have conversation 1 person",
    msens16 = "No HA/not using HA: can understand 1 person at party",
    msens7a = "R possesses hearing aid(s) (HA)",
    msens7b = "1 or 2 HA: R wears HA how many hours"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "yes, without difficulty",
  `2` = "yes, with some difficulty",
  `3` = "yes, with much difficulty",
  `4` = "no, I cannot"
)

standardized_value_labels <- list(
  msens01 = c(`-5` = "not available, section not done", `-1` = "not available", `1` = "no", `2` = "yes"),
  msens02 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  msens03 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  msens04 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "label varies by wave"
  ),
  msens05 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  msens06 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "R does not have glasses or contact lenses"
  ),
  msens07 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  msens08 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  msens08a = stats::setNames(character(0), character(0)),
  msens08b = stats::setNames(character(0), character(0)),
  msens09 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3")],
    `4` = "no I cannot"
  ),
  msens09a = stats::setNames(character(0), character(0)),
  msens09b = stats::setNames(character(0), character(0)),
  msens10 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "R does not have a hearing aid"
  ),
  msens10a = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "R does not wear a HA in this situation"
  ),
  msens10b = stats::setNames(character(0), character(0)),
  msens11 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  msens11a = stats::setNames(character(0), character(0)),
  msens11b = stats::setNames(character(0), character(0)),
  msens12 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "R does not have a hearing aid"
  ),
  msens12a = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "R does not wear a HA in this situation"
  ),
  msens12b = stats::setNames(character(0), character(0)),
  msens13 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  msens14 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  msens15 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  msens16 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "hardly ever",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always",
    `5` = "R does not have a hearing aid"
  ),
  msens16a = stats::setNames(character(0), character(0)),
  msens16b = stats::setNames(character(0), character(0)),
  msens17 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "hardly ever",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always",
    `5` = "R does not have a hearing aid"
  ),
  msens17a = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "hardly ever",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always",
    `5` = "R does not wear a HA in this situation"
  ),
  msens17b = stats::setNames(character(0), character(0)),
  msens18 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  msens19 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "some of the time",
    `2` = "most of the time",
    `3` = "all of the time"
  ),
  msens20 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "not annoying at all",
    `2` = "a bit annoying",
    `3` = "rather annoying",
    `4` = "most annoying"
  ),
  msens21 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available"
  ),
  msens22a = stats::setNames(character(0), character(0)),
  msens22b = stats::setNames(character(0), character(0)),
  msens7a = c(
    `-5` = "not available, section not done",
    `-1` = "not available",
    `1` = "no, never had before",
    `2` = "yes, possess one without use",
    `3` = "yes, possess two without use",
    `4` = "yes, possess one with use",
    `5` = "yes, possess two with use of one",
    `6` = "yes, possess two with use"
  ),
  msens7b = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "< 1 hr a day",
    `2` = "1-4 hrs a day",
    `3` = "4-8 hrs a day",
    `4` = "all day"
  ),
  msens7c = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "no, R is not wearing HA",
    `2` = "yes, R is wearing 1 HA, left",
    `3` = "yes, R is wearing 1 HA, right",
    `4` = "yes, R is wearing 2 HA"
  ),
  sense01 = c(`-5` = "not available, interview terminated", `-1` = "not available", `1` = "no", `2` = "yes"),
  sense02 = c(
    `-4` = "not available",
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  sense03 = c(
    `-5` = "not available, interview terminated",
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  sense04 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "label varies by wave"
  ),
  sense05 = c(
    `-4` = "not available",
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  sense06 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "R does not have glasses or contact lenses"
  ),
  sense07 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  sense08 = c(
    `-4` = "not available",
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  sense09 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3")],
    `4` = "no I cannot"
  ),
  sense10 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "R does not have a hearing aid"
  ),
  sense11 = c(
    `-4` = "not available",
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  sense12 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")],
    `5` = "R does not have a hearing aid"
  ),
  sense13 = c(
    `-4` = "not available",
    default_missing_labels[c("-2")],
    `-1` = "not available",
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  sense14 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  sense18 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "no",
    `2` = "yes"
  ),
  sense19 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "some of the time",
    `2` = "most of the time",
    `3` = "all of the time"
  ),
  sense20 = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "not annoying at all",
    `2` = "a bit annoying",
    `3` = "rather annoying",
    `4` = "most annoying"
  ),
  sense7a = c(
    `-5` = "not available, section not done",
    `-1` = "not available",
    `1` = "no, never had before",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "yes, possess one with use",
    `5` = "yes, possess two with use of one",
    `6` = "yes, possess two with use"
  ),
  sense7b = c(
    default_missing_labels[c("-2")],
    `-1` = "not available",
    `1` = "< 1 hr a day",
    `2` = "1-4 hrs a day",
    `3` = "4-8 hrs a day",
    `4` = "all day"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    sense01 = .replace_labels(
    standardized_value_labels$sense01,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    sense02 = .replace_labels(
    standardized_value_labels$sense02,
    `-4` = "na, short version",
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked"
  ),
    sense03 = c(
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSENSE03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense05 = .replace_labels(
    standardized_value_labels$sense05,
    `-4` = "na, short version",
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked"
  ),
    sense06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSENSE05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense07 = .replace_labels(
    standardized_value_labels$sense07,
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked"
  ),
    sense08 = .replace_labels(
    standardized_value_labels$sense08,
    `-4` = "na, short version",
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked"
  ),
    sense09 = .replace_labels(
    standardized_value_labels$sense09,
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked",
    `4` = "no, I cannot"
  ),
    sense10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSENSE09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense11 = .replace_labels(
    standardized_value_labels$sense11,
    `-4` = "na, short version",
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked"
  ),
    sense12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BSENSE11",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense13 = .replace_labels(
    standardized_value_labels$sense13,
    `-4` = "na, short version",
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked"
  ),
    sense14 = .replace_labels(
    standardized_value_labels$sense14,
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    sense01 = .replace_labels(
    standardized_value_labels$sense01,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    sense02 = c(
    `-2` = "na, see CSENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense03 = c(
    `-2` = "na, see CSENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense04 = c(
    `-2` = "na, see CSENSE03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense05 = c(
    `-2` = "na, see CSENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense06 = c(
    `-2` = "na, see CSENSE05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense07 = .replace_labels(
    standardized_value_labels$sense07,
    `-2` = "na, see CSENSE01",
    `-1` = "na, asked"
  ),
    sense08 = c(
    `-2` = "na, see CSENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense09 = .replace_labels(
    standardized_value_labels$sense09,
    `-2` = "na, see CSENSE01",
    `-1` = "na, asked"
  ),
    sense10 = c(
    `-2` = "na, see CSENSE09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense11 = c(
    `-2` = "na, see CSENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense12 = c(
    `-2` = "na, see CSENSE11",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense13 = c(
    `-2` = "na, see CSENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense14 = .replace_labels(
    standardized_value_labels$sense14,
    `-2` = "na, see CSENSE01",
    `-1` = "na, asked"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    sense01 = .replace_labels(
    standardized_value_labels$sense01,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    sense02 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense03 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense04 = c(
    `-2` = "na, see D/ESENSE03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not use aid"
  ),
    sense05 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense06 = c(
    `-2` = "na, see D/ESENSE05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    sense07 = .replace_labels(
    standardized_value_labels$sense07,
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked"
  ),
    sense08 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense09 = .replace_labels(
    standardized_value_labels$sense09,
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked"
  ),
    sense10 = c(
    `-2` = "na, see D/ESENSE09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have a hearing aid"
  ),
    sense11 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense12 = c(
    `-2` = "na, see D/ESENSE11",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have a hearing aid"
  ),
    sense13 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense14 = .replace_labels(
    standardized_value_labels$sense14,
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    sense01 = .replace_labels(
    standardized_value_labels$sense01,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    sense02 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense03 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense04 = c(
    `-2` = "na, see D/ESENSE03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not use aid"
  ),
    sense05 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense06 = c(
    `-2` = "na, see D/ESENSE05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    sense07 = .replace_labels(
    standardized_value_labels$sense07,
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked"
  ),
    sense08 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense09 = .replace_labels(
    standardized_value_labels$sense09,
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked"
  ),
    sense10 = c(
    `-2` = "na, see D/ESENSE09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have a hearing aid"
  ),
    sense11 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense12 = c(
    `-2` = "na, see D/ESENSE11",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have a hearing aid"
  ),
    sense13 = c(
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense14 = .replace_labels(
    standardized_value_labels$sense14,
    `-2` = "na, see D/ESENSE01",
    `-1` = "na, asked"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    sense03 = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense04 = c(
    `-2` = "na, see BSENSE03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not use aid"
  ),
    sense05 = c(
    `-2` = "na, see BSENSE03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense06 = c(
    `-2` = "na, see BSENSE05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    sense09 = .replace_labels(
    standardized_value_labels$sense09,
    `-2` = "na, see BSENSE03",
    `-1` = "na, asked"
  ),
    sense10 = c(
    `-2` = "na, see BSENSE09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have a hearing aid"
  ),
    sense11 = c(
    `-2` = "na, see BSENSE03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense12 = c(
    `-2` = "na, see BSENSE11",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have a hearing aid"
  ),
    sense13 = c(
    `-2` = "na, see BSENSE03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    msens01 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    msens02 = .replace_labels(
    standardized_value_labels$msens02,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens03 = c(
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens04 = c(
    `-2` = "na, see F/GMSENS03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not use aid"
  ),
    msens05 = c(
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens06 = c(
    `-2` = "na, see F/GMSENS05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens07 = .replace_labels(
    standardized_value_labels$msens07,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens08 = .replace_labels(
    standardized_value_labels$msens08,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens09 = .replace_labels(
    standardized_value_labels$msens09,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens10 = .replace_labels(
    standardized_value_labels$msens10,
    `-2` = "na, see F/GMSENS09",
    `-1` = "na, asked"
  ),
    msens11 = .replace_labels(
    standardized_value_labels$msens11,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens12 = .replace_labels(
    standardized_value_labels$msens12,
    `-2` = "na, see F/GMSENS11",
    `-1` = "na, asked"
  ),
    msens13 = .replace_labels(
    standardized_value_labels$msens13,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens14 = .replace_labels(
    standardized_value_labels$msens14,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens15 = .replace_labels(
    standardized_value_labels$msens15,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    msens01 = .replace_labels(
    standardized_value_labels$msens01,
    `-5` = "na, section not done",
    `-1` = "na, asked"
  ),
    msens02 = .replace_labels(
    standardized_value_labels$msens02,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens03 = c(
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens04 = c(
    `-2` = "na, see F/GMSENS03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not use aid"
  ),
    msens05 = c(
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens06 = c(
    `-2` = "na, see F/GMSENS05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens07 = .replace_labels(
    standardized_value_labels$msens07,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens08 = .replace_labels(
    standardized_value_labels$msens08,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens09 = .replace_labels(
    standardized_value_labels$msens09,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens10 = .replace_labels(
    standardized_value_labels$msens10,
    `-2` = "na, see F/GMSENS09",
    `-1` = "na, asked"
  ),
    msens11 = .replace_labels(
    standardized_value_labels$msens11,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens12 = .replace_labels(
    standardized_value_labels$msens12,
    `-2` = "na, see F/GMSENS11",
    `-1` = "na, asked"
  ),
    msens13 = .replace_labels(
    standardized_value_labels$msens13,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens14 = .replace_labels(
    standardized_value_labels$msens14,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  ),
    msens15 = .replace_labels(
    standardized_value_labels$msens15,
    `-2` = "na, see F/GMSENS01",
    `-1` = "na, asked"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    msens01 = .replace_labels(
    standardized_value_labels$msens01,
    `-5` = "na, section not done",
    `-1` = "na, asked"
  ),
    msens02 = .replace_labels(
    standardized_value_labels$msens02,
    `-2` = "na, see HMSENS01",
    `-1` = "na, asked"
  ),
    msens03 = c(
    `-2` = "na, see HMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens04 = c(
    `-2` = "na, see HMSENS03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    msens05 = c(
    `-2` = "na, see HMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens06 = c(
    `-2` = "na, see HMSENS05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    msens08 = .replace_labels(
    standardized_value_labels$msens08,
    `-2` = "na, see HMSENS7A",
    `-1` = "na, asked"
  ),
    msens09 = .replace_labels(
    standardized_value_labels$msens09,
    `-2` = "na, see HMSENS7A",
    `-1` = "na, asked"
  ),
    msens10 = .replace_labels(
    standardized_value_labels$msens10,
    `-2` = "na, see HMSENS09",
    `-1` = "na, asked"
  ),
    msens11 = .replace_labels(
    standardized_value_labels$msens11,
    `-2` = "na, see HMSENS7A",
    `-1` = "na, asked"
  ),
    msens12 = .replace_labels(
    standardized_value_labels$msens12,
    `-2` = "na, see HMSENS11",
    `-1` = "na, asked"
  ),
    msens13 = .replace_labels(
    standardized_value_labels$msens13,
    `-2` = "na, see HMSENS7A1",
    `-1` = "na, asked"
  ),
    msens16 = .replace_labels(
    standardized_value_labels$msens16,
    `-2` = "na, see HMSENS7A",
    `-1` = "na, asked"
  ),
    msens17 = .replace_labels(
    standardized_value_labels$msens17,
    `-2` = "na, see HMSENS16",
    `-1` = "na, asked"
  ),
    msens18 = .replace_labels(
    standardized_value_labels$msens18,
    `-2` = "na, see HMSENS7A",
    `-1` = "na, asked"
  ),
    msens19 = .replace_labels(
    standardized_value_labels$msens19,
    `-2` = "na, see HMSENS18",
    `-1` = "na, asked"
  ),
    msens20 = .replace_labels(
    standardized_value_labels$msens20,
    `-2` = "na, see HMSENS18",
    `-1` = "na, asked"
  ),
    msens7a = .replace_labels(
    standardized_value_labels$msens7a,
    `-5` = "na, section not done",
    `-1` = "na, asked"
  ),
    msens7b = .replace_labels(
    standardized_value_labels$msens7b,
    `-2` = "na, see HMSENS7A",
    `-1` = "na, asked"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    sense01 = .replace_labels(
    standardized_value_labels$sense01,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    sense02 = c(
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense03 = c(
    `-2` = "na, see BSENSE01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense04 = c(
    `-2` = "na, see BSENSE03",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    sense05 = c(
    `-2` = "na, see BSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense06 = c(
    `-2` = "na, see BSENSE05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    sense08 = c(
    `-2` = "na, see BSENSE7A",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense09 = .replace_labels(
    standardized_value_labels$sense09,
    `-2` = "na, see BSENSE7A",
    `-1` = "na, asked"
  ),
    sense10 = c(
    `-2` = "na, see BSENSE09",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have a hearing aid"
  ),
    sense11 = c(
    `-2` = "na, see BSENSE7A",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense12 = c(
    `-2` = "na, see BSENSE11",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have a hearing aid"
  ),
    sense13 = c(
    `-2` = "na, see BSENSE7A",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense18 = .replace_labels(
    standardized_value_labels$sense18,
    `-2` = "na, see BSENSE7A",
    `-1` = "na, asked"
  ),
    sense19 = .replace_labels(
    standardized_value_labels$sense19,
    `-2` = "na, see BSENSE18",
    `-1` = "na, asked"
  ),
    sense20 = .replace_labels(
    standardized_value_labels$sense20,
    `-2` = "na, see BSENSE18",
    `-1` = "na, asked"
  ),
    sense7a = .replace_labels(
    standardized_value_labels$sense7a,
    `-5` = "na, section not done",
    `-1` = "na, asked",
    `2` = "yes, possess one without use",
    `3` = "yes, possess two without use"
  ),
    sense7b = .replace_labels(
    standardized_value_labels$sense7b,
    `-2` = "na, see BSENSE7A",
    `-1` = "na, asked"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    sense03 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense05 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense09 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no I cannot"
  ),
    sense11 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense13 = c(
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    sense18 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    sense19 = .replace_labels(
    standardized_value_labels$sense19,
    `-2` = "na, see BSENSE18",
    `-1` = "na, asked"
  ),
    sense20 = .replace_labels(
    standardized_value_labels$sense20,
    `-2` = "na, see BSENSE18",
    `-1` = "na, asked"
  ),
    sense7a = c(
    `-1` = "na, asked",
    `1` = "no, never had before",
    `2` = "yes, possess one or two without use",
    `3` = "yes, possess one or two with use"
  ),
    sense7b = .replace_labels(
    standardized_value_labels$sense7b,
    `-2` = "na, see BSENSE7A",
    `-1` = "na, asked"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    msens01 = .replace_labels(
    standardized_value_labels$msens01,
    `-5` = "na, section not done",
    `-1` = "na, asked"
  ),
    msens03 = .replace_labels(
    standardized_value_labels$msens03,
    `-2` = "na, see IMSENS01",
    `-1` = "na, asked"
  ),
    msens04 = .replace_labels(
    standardized_value_labels$msens04,
    `-2` = "na, see IMSENS03",
    `-1` = "na, asked",
    `5` = "R does not have glasses or contact lenses"
  ),
    msens05 = .replace_labels(
    standardized_value_labels$msens05,
    `-2` = "na, see IMSENS01",
    `-1` = "na, asked"
  ),
    msens06 = .replace_labels(
    standardized_value_labels$msens06,
    `-2` = "na, see IMSENS05",
    `-1` = "na, asked"
  ),
    msens08 = .replace_labels(
    standardized_value_labels$msens08,
    `-2` = "na, see IMSENS7A",
    `-1` = "na, asked"
  ),
    msens09 = .replace_labels(
    standardized_value_labels$msens09,
    `-2` = "na, see IMSENS7A",
    `-1` = "na, asked"
  ),
    msens10 = .replace_labels(
    standardized_value_labels$msens10,
    `-2` = "na, see IMSENS09",
    `-1` = "na, asked"
  ),
    msens11 = .replace_labels(
    standardized_value_labels$msens11,
    `-2` = "na, see IMSENS7A",
    `-1` = "na, asked"
  ),
    msens12 = .replace_labels(
    standardized_value_labels$msens12,
    `-2` = "na, see IMSENS11",
    `-1` = "na, asked"
  ),
    msens13 = .replace_labels(
    standardized_value_labels$msens13,
    `-2` = "na, see IMSENS7A",
    `-1` = "na, asked"
  ),
    msens16 = .replace_labels(
    standardized_value_labels$msens16,
    `-2` = "na, see IMSENS7A",
    `-1` = "na, asked"
  ),
    msens17 = .replace_labels(
    standardized_value_labels$msens17,
    `-2` = "na, see IMSENS16",
    `-1` = "na, asked"
  ),
    msens18 = .replace_labels(
    standardized_value_labels$msens18,
    `-2` = "na, see IMSENS7A",
    `-1` = "na, asked"
  ),
    msens19 = .replace_labels(
    standardized_value_labels$msens19,
    `-2` = "na, see IMSENS18",
    `-1` = "na, asked"
  ),
    msens20 = .replace_labels(
    standardized_value_labels$msens20,
    `-2` = "na, see IMSENS18",
    `-1` = "na, asked"
  ),
    msens7a = .replace_labels(
    standardized_value_labels$msens7a,
    `-5` = "na, section not done",
    `-1` = "na, asked"
  ),
    msens7b = .replace_labels(
    standardized_value_labels$msens7b,
    `-2` = "na, see IMSENS7A",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    msens01 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    msens03 = c(
    `-2` = "na, see J/KMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens04 = c(
    `-2` = "na, see J/KMSENS01OF 03????",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    msens05 = c(
    `-2` = "na, see J/KMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens06 = c(
    `-2` = "na, see J/KMSENS05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    msens08 = .replace_labels(
    standardized_value_labels$msens08,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens10a = .replace_labels(
    standardized_value_labels$msens10a,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens11 = .replace_labels(
    standardized_value_labels$msens11,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens12a = .replace_labels(
    standardized_value_labels$msens12a,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens16 = c(
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked",
    `1` = "hardly ever",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    msens17a = .replace_labels(
    standardized_value_labels$msens17a,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens21 = .replace_labels(
    standardized_value_labels$msens21,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens7a = c(
    `-1` = "na, asked",
    `1` = "no, never had before",
    `2` = "yes, possess one without use",
    `3` = "yes, possess two without use",
    `4` = "yes, possess one with use",
    `5` = "yes, possess two with use of one",
    `6` = "yes, possess two with use"
  ),
    msens7b = .replace_labels(
    standardized_value_labels$msens7b,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens7c = .replace_labels(
    standardized_value_labels$msens7c,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    msens01 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    msens03 = c(
    `-2` = "na, see J/KMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens04 = c(
    `-2` = "na, see J/KMSENS01OF 03????",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    msens05 = c(
    `-2` = "na, see J/KMSENS01",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot"
  ),
    msens06 = c(
    `-2` = "na, see J/KMSENS05",
    `-1` = "na, asked",
    `1` = "yes, without difficulty",
    `2` = "yes, with some difficulty",
    `3` = "yes, with much difficulty",
    `4` = "no, I cannot",
    `5` = "R does not have glasses or contact lenses"
  ),
    msens08 = .replace_labels(
    standardized_value_labels$msens08,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens10a = .replace_labels(
    standardized_value_labels$msens10a,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens11 = .replace_labels(
    standardized_value_labels$msens11,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens12a = .replace_labels(
    standardized_value_labels$msens12a,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens16 = c(
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked",
    `1` = "hardly ever",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    msens17a = .replace_labels(
    standardized_value_labels$msens17a,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens21 = .replace_labels(
    standardized_value_labels$msens21,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens7a = c(
    `-1` = "na, asked",
    `1` = "no, never had before",
    `2` = "yes, possess one without use",
    `3` = "yes, possess two without use",
    `4` = "yes, possess one with use",
    `5` = "yes, possess two with use of one",
    `6` = "yes, possess two with use"
  ),
    msens7b = .replace_labels(
    standardized_value_labels$msens7b,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  ),
    msens7c = .replace_labels(
    standardized_value_labels$msens7c,
    `-2` = "na, see J/KMSENS7A",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  msens01 = "categorical",
  msens02 = "categorical",
  msens03 = "categorical",
  msens04 = "categorical",
  msens05 = "categorical",
  msens06 = "categorical",
  msens07 = "categorical",
  msens08 = "categorical",
  msens08a = "text",
  msens08b = "text",
  msens09 = "categorical",
  msens09a = "text",
  msens09b = "text",
  msens10 = "categorical",
  msens10a = "categorical",
  msens10b = "text",
  msens11 = "categorical",
  msens11a = "text",
  msens11b = "text",
  msens12 = "categorical",
  msens12a = "categorical",
  msens12b = "text",
  msens13 = "categorical",
  msens14 = "categorical",
  msens15 = "categorical",
  msens16 = "categorical",
  msens16a = "text",
  msens16b = "text",
  msens17 = "categorical",
  msens17a = "categorical",
  msens17b = "text",
  msens18 = "categorical",
  msens19 = "categorical",
  msens20 = "categorical",
  msens21 = "numeric",
  msens22a = "numeric",
  msens22b = "numeric",
  msens7a = "categorical",
  msens7b = "categorical",
  msens7c = "categorical",
  sense01 = "categorical",
  sense02 = "categorical",
  sense03 = "categorical",
  sense04 = "categorical",
  sense05 = "categorical",
  sense06 = "categorical",
  sense07 = "categorical",
  sense08 = "categorical",
  sense09 = "categorical",
  sense10 = "categorical",
  sense11 = "categorical",
  sense12 = "categorical",
  sense13 = "categorical",
  sense14 = "categorical",
  sense18 = "categorical",
  sense19 = "categorical",
  sense20 = "categorical",
  sense7a = "categorical",
  sense7b = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "031", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "031", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "031", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "031", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["msens08a"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens08b"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens09"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens09a"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens09b"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens10b"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens11a"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens11b"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens12b"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens16a"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens16b"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens17b"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens22a"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens22b"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["msens08a"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens08b"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens09"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens09a"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens09b"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens10b"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens11a"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens11b"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens12b"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens16a"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens16b"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens17b"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens22a"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["msens22b"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)

.lasa_fc_031 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

