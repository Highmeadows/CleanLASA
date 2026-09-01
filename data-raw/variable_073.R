## LASA filecode 073 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  lorat = "I am among the not-moderate-severe-extreme lonely people / Als we de mensen zouden indelen in: niet eenzaam, matig eenzaam, sterk eenzaam, zeer sterk eenzaam, waar zou u zich dan nu toe rekenen?",
  losom = "I sometimes feel lonely / Ik voel me soms wel eens eenzaam",
  .applies_to_waves = c("Z")
)

variable_labels(
  "lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9",
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "3B", "MB", "I")
)

variable_labels(
  "lorat", "losom",
  .applies_to_waves = c("F", "G", "H", "3B", "MB", "I")
)

variable_labels(
  lo_mode = NA_character_,
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-4` = "refusal/skip by interviewernterviewer",
  .applies_to_vars = c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9", "lo_mode", "lorat", "losom"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not asked (interview terminated/skip)", `-1` = "na, asked", `1` = "no", `2` = "more or less", `3` = "yes",
  .applies_to_vars = c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9", "losom"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "computer or paper-and-pencil short interview", `-3` = "interview terminated", `1` = "computer", `2` = "paper-and-pencil",
  .applies_to_vars = c("lo_mode"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not asked (interview terminated)", `-1` = "na, asked", `1` = "not lonely/niet eenzaam", `2` = "moderately lonely/sterk eenzaam", `3` = "severely lonely/sterk eenzaam", `4` = "extremely lonely/zeer sterk eenzaam",
  .applies_to_vars = c("lorat"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "refusal/skip by interviewer", `-3` = "not asked (interview terminated/skip)", `-1` = "na, asked", `1` = "no", `2` = "more-or-less", `3` = "yes",
  .applies_to_vars = c("lo1", "lo10", "lo11", "lo2", "lo3", "lo4", "lo5", "lo6", "lo7", "lo8", "lo9"),
  .applies_to_waves = c("B", "C", "D", "E", "F", "G", "H", "3B", "MB", "I")
)

value_labels(
  `-5` = "computer or paper-and-pencil short version", `-4` = "refusal/skip by Interviewer", `-3` = "terminated interview", `1` = "computer", `2` = "paper-and-pencil",
  .applies_to_vars = c("lo_mode"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "refusal/skip by interviewer", `-3` = "not asked (interview terminated)", `-1` = "na, asked", `1` = "not lonely/niet eenzaam", `2` = "moderately lonely/sterk eenzaam", `3` = "severely lonely/sterk eenzaam", `4` = "extremely lonely/zeer sterk eenzaam",
  .applies_to_vars = c("lorat"),
  .applies_to_waves = c("F", "G", "H", "3B", "MB", "I")
)

value_labels(
  `-4` = "refusal/skip by interviewer", `-3` = "not asked (interview terminated/skip)", `-1` = "na, asked", `1` = "no", `2` = "more-or-less", `3` = "yes",
  .applies_to_vars = c("losom"),
  .applies_to_waves = c("F", "G", "H", "3B", "MB", "I")
)

.lasa_fc_073 <- .lasa_finalize_fc("073")

