## LASA filecode 272 -- variable names, variable labels, value labels,
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
  brodied = "categorical",
  conflic = "categorical",
  crime = "categorical",
  daudied = "categorical",
  fadied = "categorical",
  financ = "categorical",
  gcdied = "categorical",
  illoth = "categorical",
  illpart = "categorical",
  modied = "categorical",
  sisdied = "categorical",
  sondied = "categorical"
)

# define variable labels ----
variable_labels(
  brodied = "Brother(s) died",
  conflic = "Serious conflict with an important person",
  crime = "Victim of serious crime",
  daudied = "Daughter(s) died",
  fadied = "Father died",
  financ = "Serious financial problems",
  gcdied = "Grandchild(ren) died",
  illoth = "Serious illness or accident of relative(s)",
  illpart = "Serious illness or accident of partner/spouse",
  modied = "Mother died",
  sisdied = "Sister(s) died",
  sondied = "Son(s) died",
  .applies_to_waves = c("Z")
)

variable_labels(
  brodied = "brothers died",
  conflic = "conflict /w other persons",
  crime = "victim of crime",
  daudied = "daughters died",
  fadied = "father died",
  financ = "financial problems",
  gcdied = "grandchildren died",
  illoth = "illness relative(s)",
  illpart = "illness partner/spouse",
  modied = "mother died",
  sisdied = "sisters died",
  sondied = "sons died",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J")
)

variable_labels(
  brodied = "Did any of your brothers die after previous interview / Is \303\251\303\251n van uw broers na Maand Jaar overleden",
  conflic = "After Month Year, have you had a serious argument or conflict with someone important to you / Heeft u na Maand Jaar een ernstige ruzie of een conflict gehad met iemand die voor u belangrijk is",
  crime = "Have you been a victim of a serious crime after previous interview / Bent u na Maand Jaar slachtoffer geworden van een ernstig misdrijf",
  daudied = "Did any of your daughters die after previous interview / Is \303\251\303\251n van uw dochters na Maand Jaar overleden",
  fadied = "Did your father pass away after previous interview / Is uw vader na Maand Jaar overleden",
  financ = "Have you had any serious financial problems after previous interview / Heeft u na Maand Jaar ernstige financi\303\253le problemen gehad",
  gcdied = "Did any of your grandchildren pass away after previous interview / Is een van uw kleinkinderen na Maand Jaar overleden",
  illoth = "After Month Year, has any of your family members been seriously ill or had a serious accident / Is \303\251\303\251n van uw familieleden na Maand Jaar ernstig ziek geweest of heeft een familielid een ernstig ongeluk gehad",
  illpart = "Has your partner been seriously ill or had a serious accident after previous interview / Is uw partner na Maand Jaar ernstig ziek geweest of heeft hij/zij een ernstig ongeluk gehad",
  modied = "Did your mother pass away after previous interview / Is uw moeder na Maand Jaar overleden",
  sisdied = "Did any of your sisters die after previous interview / Is \303\251\303\251n van uw zussen na Maand Jaar overleden",
  sondied = "Did any of your sons die after previous interview / Is \303\251\303\251n van uw zonen na Maand Jaar overleden",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-10` = "not asked: no data available",
  .applies_to_vars = c("brodied", "daudied", "fadied", "modied", "sisdied", "sondied"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-11` = "not asked: routing error",
  .applies_to_vars = c("brodied", "daudied", "fadied", "modied", "sisdied", "sondied"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-3` = "died earlier",
  .applies_to_vars = c("fadied", "modied"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `-6` = "interview nonresponse", `-5` = "interview nonresponse",
  .applies_to_vars = c("brodied", "conflic", "crime", "daudied", "fadied", "financ", "gcdied", "illoth", "illpart", "modied", "sisdied", "sondied"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-7` = "refusal/skip by interviewer",
  .applies_to_vars = c("brodied", "conflic", "crime", "daudied", "fadied", "financ", "gcdied", "illoth", "illpart", "modied", "sisdied", "sondied"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-8` = "technical problems",
  .applies_to_vars = c("brodied", "conflic", "crime", "daudied", "fadied", "financ", "gcdied", "illoth", "illpart", "modied", "sisdied", "sondied"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-4` = "response unavailable", `-3` = "no living relative of this type", `-2` = "answer: no relative of this type", `-1` = "na, asked", `1` = "not died", `2` = "died",
  .applies_to_vars = c("brodied", "daudied", "sisdied", "sondied"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("conflic", "crime", "financ", "gcdied", "illoth"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "response unavailable", `-2` = "prior-death/routing status", `-1` = "na, asked", `1` = "not died", `2` = "died",
  .applies_to_vars = c("fadied", "modied"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "partner not identified in demographic part", `-2` = "not asked / no partner", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("illpart"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "refusal/skip by interviewer", `-5` = "terminated interview", `-4` = "short version",
  .applies_to_vars = c("brodied", "conflic", "crime", "daudied", "fadied", "financ", "gcdied", "illoth", "illpart", "modied", "sisdied", "sondied"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na: no brothers", `-2` = "answer: no brothers", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("brodied"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("conflic", "crime", "financ", "gcdied", "illoth"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-3` = "na: no daughters", `-2` = "answer: no daughters", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("daudied"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "not asked", `-1` = "no answer", `1` = "not died", `2` = "died",
  .applies_to_vars = c("fadied", "modied"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "not asked", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("illpart"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na: no sisters", `-2` = "answer: no sisters", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("sisdied"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na: no sons", `-2` = "answer: no sons", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("sondied"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-5` = "short version",
  .applies_to_vars = c("brodied", "conflic", "crime", "daudied", "fadied", "financ", "gcdied", "illoth", "illpart", "modied", "sisdied", "sondied"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-6` = "terminated interview",
  .applies_to_vars = c("brodied", "conflic", "crime", "daudied", "fadied", "financ", "gcdied", "illoth", "illpart", "modied", "sisdied", "sondied"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-4` = "do not know", `-2` = "not asked", `-1` = "no answer", `1` = "not died", `2` = "died",
  .applies_to_vars = c("fadied", "modied"),
  .applies_to_waves = c("D")
)

value_labels(
  `-4` = "do not know", `-2` = "na: died earlier", `-1` = "no answer", `1` = "not died", `2` = "died",
  .applies_to_vars = c("fadied", "modied"),
  .applies_to_waves = c("E", "F", "G", "H")
)

value_labels(
  `-2` = "na: no partner", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("illpart"),
  .applies_to_waves = c("E", "F", "G", "H")
)

value_labels(
  `-5` = "short version interview",
  .applies_to_vars = c("brodied", "conflic", "crime", "daudied", "fadied", "financ", "gcdied", "illoth", "illpart", "modied", "sisdied", "sondied"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: no brothers alive", `-2` = "answer: no brothers", `-1` = "no answer", `1` = "not died", `2` = "died",
  .applies_to_vars = c("brodied"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: no daughters alive", `-2` = "answer: no daughters", `-1` = "no answer", `1` = "not died", `2` = "died",
  .applies_to_vars = c("daudied"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: died earlier", `-2` = "answer: died earlier", `-1` = "no answer", `1` = "not died", `2` = "died",
  .applies_to_vars = c("fadied", "modied"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "not asked: partner not identified in demographic part", `-2` = "not asked: no partner", `-1` = "no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("illpart"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: no sisters alive", `-2` = "answer: no sisters", `-1` = "no answer", `1` = "not died", `2` = "died",
  .applies_to_vars = c("sisdied"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: no sons alive", `-2` = "answer: no sons", `-1` = "no answer", `1` = "not died", `2` = "died",
  .applies_to_vars = c("sondied"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: no brothers alive", `-2` = "answer: no brothers", `-1` = "na, asked", `1` = "not died", `2` = "died",
  .applies_to_vars = c("brodied"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: no daughters alive", `-2` = "answer: no daughters", `-1` = "na, asked", `1` = "not died", `2` = "died",
  .applies_to_vars = c("daudied"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: died earlier", `-2` = "answer: died earlier", `-1` = "na, asked", `1` = "not died", `2` = "died",
  .applies_to_vars = c("fadied", "modied"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: no sisters alive", `-2` = "answer: no sisters", `-1` = "na, asked", `1` = "not died", `2` = "died",
  .applies_to_vars = c("sisdied"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "do not know", `-3` = "not asked: no sons alive", `-2` = "answer: no sons", `-1` = "na, asked", `1` = "not died", `2` = "died",
  .applies_to_vars = c("sondied"),
  .applies_to_waves = c("K")
)

.lasa_fc_272 <- .lasa_finalize_fc("272")

