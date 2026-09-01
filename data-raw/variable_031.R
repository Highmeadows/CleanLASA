## LASA filecode 031 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  sense7b = "R wears hearing aid(s) (HA) how many hours",
  .applies_to_waves = c("Z")
)

variable_labels(
  "sense01", "sense07",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  "sense02", "sense08",
  .applies_to_waves = c("B", "C", "D", "E", "3B")
)

variable_labels(
  "sense04", "sense06", "sense10", "sense12",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B")
)

variable_labels(
  "sense13",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B", "MB")
)

variable_labels(
  "sense14",
  .applies_to_waves = c("B", "C", "D", "E")
)

variable_labels(
  "msens01", "msens03", "msens04", "msens05", "msens06",
  .applies_to_waves = c("F", "G", "H", "I", "J", "K")
)

variable_labels(
  "msens02",
  .applies_to_waves = c("F", "G", "H")
)

variable_labels(
  "msens07", "msens14", "msens15",
  .applies_to_waves = c("F", "G")
)

variable_labels(
  "msens08", "msens09", "msens10", "msens11", "msens12", "msens13",
  .applies_to_waves = c("F", "G", "H", "I")
)

variable_labels(
  "msens16", "msens17", "msens18", "msens19", "msens20", "msens7a", "msens7b",
  .applies_to_waves = c("H", "I")
)

variable_labels(
  "sense18", "sense19", "sense20", "sense7a", "sense7b",
  .applies_to_waves = c("3B", "MB")
)

variable_labels(
  "msens08a", "msens08b", "msens09a", "msens09b", "msens10a", "msens10b", "msens11a", "msens11b", "msens12a", "msens12b", "msens16a", "msens16b", "msens17a", "msens17b", "msens21", "msens22a", "msens22b", "msens7c",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  sense03 = "Small print in paper without glasses etc",
  sense05 = "Recognize face 4 meter without glasses etc",
  sense09 = "Follow conversation 4 persons: without HA",
  sense11 = "Have conversation 1 person: without HA",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "3B")
)

variable_labels(
  sense01 = "R usually wears glasses or contact lenses (in D: observation)",
  sense07 = "R usually wears hearing aid (HA)",
  .applies_to_waves = c("D", "E")
)

variable_labels(
  sense01 = "R usually wears glasses or contact lenses",
  .applies_to_waves = c("3B")
)

variable_labels(
  sense03 = "Small print in paper with or without glasses etc",
  sense05 = "Recognize face 4 meter with or without glasses etc",
  sense09 = "Follow conversation 3/4 persons: with or without HA",
  sense11 = "Have conversation 1 person: with or without HA",
  .applies_to_waves = c("MB")
)

variable_labels(
  msens08 = "No HA/not using HA: hear well enough (subjective)",
  msens09 = "No HA/not using HA: follow conversation 3/4 persons",
  msens11 = "No HA/not using HA: have conversation 1 person",
  msens16 = "No HA/not using HA: can understand 1 person at party",
  msens7a = "R possesses hearing aid(s) (HA)",
  msens7b = "1 or 2 HA: R wears HA how many hours",
  .applies_to_waves = c("J", "K")
)

# define value labels ----
value_labels(
  `-1` = "not available",
  .applies_to_vars = c("msens01", "msens02", "msens03", "msens04", "msens05", "msens06", "msens07", "msens08", "msens09", "msens10", "msens10a", "msens11", "msens12", "msens12a", "msens13", "msens14", "msens15", "msens16", "msens17", "msens17a", "msens18", "msens19", "msens20", "msens21", "msens7a", "msens7b", "msens7c", "sense01", "sense02", "sense03", "sense04", "sense05", "sense06", "sense07", "sense08", "sense09", "sense10", "sense11", "sense12", "sense13", "sense14", "sense18", "sense19", "sense20", "sense7a", "sense7b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("msens02", "msens03", "msens04", "msens05", "msens06", "msens07", "msens08", "msens09", "msens10", "msens10a", "msens11", "msens12", "msens12a", "msens13", "msens14", "msens15", "msens16", "msens17", "msens17a", "msens18", "msens19", "msens20", "msens21", "msens7b", "msens7c", "sense02", "sense03", "sense04", "sense05", "sense06", "sense07", "sense08", "sense09", "sense10", "sense11", "sense12", "sense13", "sense14", "sense18", "sense19", "sense20", "sense7b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, section not done", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msens01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens02", "msens08", "msens11", "msens13"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens03", "msens05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "label varies by wave",
  .applies_to_vars = c("msens04", "sense04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("msens06", "sense06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("msens07", "msens14", "msens15", "msens18", "sense07", "sense14", "sense18"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no I cannot",
  .applies_to_vars = c("msens09", "sense09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens10", "msens12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not wear a HA in this situation",
  .applies_to_vars = c("msens10a", "msens12a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "hardly ever", `2` = "sometimes", `3` = "often", `4` = "almost always", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens16", "msens17"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "hardly ever", `2` = "sometimes", `3` = "often", `4` = "almost always", `5` = "R does not wear a HA in this situation",
  .applies_to_vars = c("msens17a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "some of the time", `2` = "most of the time", `3` = "all of the time",
  .applies_to_vars = c("msens19", "sense19"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "not annoying at all", `2` = "a bit annoying", `3` = "rather annoying", `4` = "most annoying",
  .applies_to_vars = c("msens20", "sense20"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, section not done", `1` = "no, never had before", `2` = "yes, possess one without use", `3` = "yes, possess two without use", `4` = "yes, possess one with use", `5` = "yes, possess two with use of one", `6` = "yes, possess two with use",
  .applies_to_vars = c("msens7a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "< 1 hr a day", `2` = "1-4 hrs a day", `3` = "4-8 hrs a day", `4` = "all day",
  .applies_to_vars = c("msens7b", "sense7b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "no, R is not wearing HA", `2` = "yes, R is wearing 1 HA, left", `3` = "yes, R is wearing 1 HA, right", `4` = "yes, R is wearing 2 HA",
  .applies_to_vars = c("msens7c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `1` = "no", `2` = "yes",
  .applies_to_vars = c("sense01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not available", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense02", "sense05", "sense08", "sense11", "sense13"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("sense10", "sense12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, section not done", `1` = "no, never had before", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "yes, possess one with use", `5` = "yes, possess two with use of one", `6` = "yes, possess two with use",
  .applies_to_vars = c("sense7a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("sense01"),
  .applies_to_waves = c("B", "C", "D", "E", "3B")
)

value_labels(
  `-4` = "na, short version", `-2` = "na, see BSENSE01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense02", "sense05", "sense08", "sense11", "sense13"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BSENSE01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense03"),
  .applies_to_waves = c("B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BSENSE03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BSENSE05", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BSENSE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("sense07", "sense14"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BSENSE01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense09"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BSENSE09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BSENSE11", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see CSENSE01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense02", "sense03", "sense05", "sense08", "sense11", "sense13"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CSENSE03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense04"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CSENSE05", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense06"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CSENSE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("sense07", "sense14"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CSENSE01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no I cannot",
  .applies_to_vars = c("sense09"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CSENSE09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense10"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CSENSE11", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see D/ESENSE01",
  .applies_to_vars = c("sense02", "sense03", "sense05", "sense07", "sense08", "sense09", "sense11", "sense13", "sense14"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense02", "sense08"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense03", "sense05", "sense11", "sense13"),
  .applies_to_waves = c("D", "E", "MB")
)

value_labels(
  `-2` = "na, see D/ESENSE03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not use aid",
  .applies_to_vars = c("sense04"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-2` = "na, see D/ESENSE05", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("sense06"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("sense07", "sense14"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no I cannot",
  .applies_to_vars = c("sense09"),
  .applies_to_waves = c("D", "E", "MB")
)

value_labels(
  `-2` = "na, see D/ESENSE09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("sense10"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-2` = "na, see D/ESENSE11", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("sense12"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense03"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BSENSE03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not use aid",
  .applies_to_vars = c("sense04"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BSENSE03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense05", "sense11", "sense13"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BSENSE05", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("sense06"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BSENSE03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no I cannot",
  .applies_to_vars = c("sense09"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BSENSE09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("sense10"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see BSENSE11", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("sense12"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see F/GMSENS01",
  .applies_to_vars = c("msens02", "msens03", "msens05", "msens07", "msens08", "msens09", "msens11", "msens13", "msens14", "msens15"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msens01"),
  .applies_to_waves = c("F", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens02", "msens03", "msens05", "msens13"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see F/GMSENS03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not use aid",
  .applies_to_vars = c("msens04"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see F/GMSENS05", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens06"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msens07", "msens14", "msens15"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens08", "msens11"),
  .applies_to_waves = c("F", "G", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no I cannot",
  .applies_to_vars = c("msens09"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see F/GMSENS09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens10"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see F/GMSENS11", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens12"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-5` = "na, section not done", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msens01"),
  .applies_to_waves = c("G", "H", "I")
)

value_labels(
  `-2` = "na, see HMSENS01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens02", "msens03", "msens05"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("msens04"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS05", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("msens06"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens08", "msens11"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no I cannot",
  .applies_to_vars = c("msens09"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens10"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS11", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens12"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS7A1", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens13"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS7A", `-1` = "na, asked", `1` = "hardly ever", `2` = "sometimes", `3` = "often", `4` = "almost always", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens16"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS16", `-1` = "na, asked", `1` = "hardly ever", `2` = "sometimes", `3` = "often", `4` = "almost always", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens17"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS7A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msens18"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS18", `-1` = "na, asked", `1` = "some of the time", `2` = "most of the time", `3` = "all of the time",
  .applies_to_vars = c("msens19"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMSENS18", `-1` = "na, asked", `1` = "not annoying at all", `2` = "a bit annoying", `3` = "rather annoying", `4` = "most annoying",
  .applies_to_vars = c("msens20"),
  .applies_to_waves = c("H")
)

value_labels(
  `-5` = "na, section not done", `-1` = "na, asked", `1` = "no, never had before", `2` = "yes, possess one without use", `3` = "yes, possess two without use", `4` = "yes, possess one with use", `5` = "yes, possess two with use of one", `6` = "yes, possess two with use",
  .applies_to_vars = c("msens7a"),
  .applies_to_waves = c("H", "I")
)

value_labels(
  `-2` = "na, see HMSENS7A", `-1` = "na, asked", `1` = "< 1 hr a day", `2` = "1-4 hrs a day", `3` = "4-8 hrs a day", `4` = "all day",
  .applies_to_vars = c("msens7b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see BSENSE01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense02"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BSENSE03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("sense04"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BSENS01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense05"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BSENSE7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("sense08", "sense11", "sense13"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BSENSE7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no I cannot",
  .applies_to_vars = c("sense09"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BSENSE7A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("sense18"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BSENSE18", `-1` = "na, asked", `1` = "some of the time", `2` = "most of the time", `3` = "all of the time",
  .applies_to_vars = c("sense19"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-2` = "na, see BSENSE18", `-1` = "na, asked", `1` = "not annoying at all", `2` = "a bit annoying", `3` = "rather annoying", `4` = "most annoying",
  .applies_to_vars = c("sense20"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-5` = "na, section not done", `-1` = "na, asked", `1` = "no, never had before", `2` = "yes, possess one without use", `3` = "yes, possess two without use", `4` = "yes, possess one with use", `5` = "yes, possess two with use of one", `6` = "yes, possess two with use",
  .applies_to_vars = c("sense7a"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BSENSE7A", `-1` = "na, asked", `1` = "< 1 hr a day", `2` = "1-4 hrs a day", `3` = "4-8 hrs a day", `4` = "all day",
  .applies_to_vars = c("sense7b"),
  .applies_to_waves = c("3B", "MB")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("sense18"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-1` = "na, asked", `1` = "no, never had before", `2` = "yes, possess one or two without use", `3` = "yes, possess one or two with use",
  .applies_to_vars = c("sense7a"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IMSENS01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens03", "msens05"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IMSENS03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("msens04"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IMSENS05", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("msens06"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens08", "msens11", "msens13"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no I cannot",
  .applies_to_vars = c("msens09"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens10"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS11", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens12"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS7A", `-1` = "na, asked", `1` = "hardly ever", `2` = "sometimes", `3` = "often", `4` = "almost always", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens16"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS16", `-1` = "na, asked", `1` = "hardly ever", `2` = "sometimes", `3` = "often", `4` = "almost always", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("msens17"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS7A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msens18"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS18", `-1` = "na, asked", `1` = "some of the time", `2` = "most of the time", `3` = "all of the time",
  .applies_to_vars = c("msens19"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS18", `-1` = "na, asked", `1` = "not annoying at all", `2` = "a bit annoying", `3` = "rather annoying", `4` = "most annoying",
  .applies_to_vars = c("msens20"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMSENS7A", `-1` = "na, asked", `1` = "< 1 hr a day", `2` = "1-4 hrs a day", `3` = "4-8 hrs a day", `4` = "all day",
  .applies_to_vars = c("msens7b"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see J/KMSENS7A",
  .applies_to_vars = c("msens08", "msens10a", "msens11", "msens12a", "msens16", "msens17a", "msens21", "msens7b", "msens7c"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-2` = "na, see J/KMSENS01", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot",
  .applies_to_vars = c("msens03", "msens05"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-2` = "na, see J/KMSENS01OF 03????", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("msens04"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-2` = "na, see J/KMSENS05", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not have glasses or contact lenses",
  .applies_to_vars = c("msens06"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, I cannot", `5` = "R does not wear a HA in this situation",
  .applies_to_vars = c("msens10a", "msens12a"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "hardly ever", `2` = "sometimes", `3` = "often", `4` = "almost always",
  .applies_to_vars = c("msens16"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "hardly ever", `2` = "sometimes", `3` = "often", `4` = "almost always", `5` = "R does not wear a HA in this situation",
  .applies_to_vars = c("msens17a"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("msens21"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no, never had before", `2` = "yes, possess one without use", `3` = "yes, possess two without use", `4` = "yes, possess one with use", `5` = "yes, possess two with use of one", `6` = "yes, possess two with use",
  .applies_to_vars = c("msens7a"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "< 1 hr a day", `2` = "1-4 hrs a day", `3` = "4-8 hrs a day", `4` = "all day",
  .applies_to_vars = c("msens7b"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no, R is not wearing HA", `2` = "yes, R is wearing 1 HA, left", `3` = "yes, R is wearing 1 HA, right", `4` = "yes, R is wearing 2 HA",
  .applies_to_vars = c("msens7c"),
  .applies_to_waves = c("J", "K")
)

.lasa_fc_031 <- .lasa_finalize_fc("031")

