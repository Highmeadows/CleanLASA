## LASA filecode 272 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  sondied = "Son(s) died"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels,
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
    sondied = "sons died"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
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
    sondied = "sons died"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
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
    sondied = "sons died"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
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
    sondied = "sons died"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
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
    sondied = "sons died"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
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
    sondied = "sons died"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
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
    sondied = "sons died"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
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
    sondied = "sons died"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    brodied = "Did any of your brothers die after previous interview / Is één van uw broers na Maand Jaar overleden",
    conflic = "After Month Year, have you had a serious argument or conflict with someone important to you / Heeft u na Maand Jaar een ernstige ruzie of een conflict gehad met iemand die voor u belangrijk is",
    crime = "Have you been a victim of a serious crime after previous interview / Bent u na Maand Jaar slachtoffer geworden van een ernstig misdrijf",
    daudied = "Did any of your daughters die after previous interview / Is één van uw dochters na Maand Jaar overleden",
    fadied = "Did your father pass away after previous interview / Is uw vader na Maand Jaar overleden",
    financ = "Have you had any serious financial problems after previous interview / Heeft u na Maand Jaar ernstige financiële problemen gehad",
    gcdied = "Did any of your grandchildren pass away after previous interview / Is een van uw kleinkinderen na Maand Jaar overleden",
    illoth = "After Month Year, has any of your family members been seriously ill or had a serious accident / Is één van uw familieleden na Maand Jaar ernstig ziek geweest of heeft een familielid een ernstig ongeluk gehad",
    illpart = "Has your partner been seriously ill or had a serious accident after previous interview / Is uw partner na Maand Jaar ernstig ziek geweest of heeft hij/zij een ernstig ongeluk gehad",
    modied = "Did your mother pass away after previous interview / Is uw moeder na Maand Jaar overleden",
    sisdied = "Did any of your sisters die after previous interview / Is één van uw zussen na Maand Jaar overleden",
    sondied = "Did any of your sons die after previous interview / Is één van uw zonen na Maand Jaar overleden"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  brodied = c(
    `-11` = "not asked: routing error",
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "response unavailable",
    `-3` = "no living relative of this type",
    `-2` = "answer: no relative of this type",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
  conflic = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
  crime = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
  daudied = c(
    `-11` = "not asked: routing error",
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "response unavailable",
    `-3` = "no living relative of this type",
    `-2` = "answer: no relative of this type",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
  fadied = c(
    `-11` = "not asked: routing error",
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "response unavailable",
    `-3` = "died earlier",
    `-2` = "prior-death/routing status",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
  financ = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
  gcdied = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
  illoth = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
  illpart = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "short version",
    `-3` = "partner not identified in demographic part",
    `-2` = "not asked / no partner",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
  modied = c(
    `-11` = "not asked: routing error",
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "response unavailable",
    `-3` = "died earlier",
    `-2` = "prior-death/routing status",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
  sisdied = c(
    `-11` = "not asked: routing error",
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "response unavailable",
    `-3` = "no living relative of this type",
    `-2` = "answer: no relative of this type",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
  sondied = c(
    `-11` = "not asked: routing error",
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "interview nonresponse",
    `-5` = "interview nonresponse",
    `-4` = "response unavailable",
    `-3` = "no living relative of this type",
    `-2` = "answer: no relative of this type",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  )
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    brodied = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-3` = "na: no brothers",
    `-2` = "answer: no brothers",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    conflic = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    crime = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    daudied = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-3` = "na: no daughters",
    `-2` = "answer: no daughters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    fadied = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-2` = "not asked",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    financ = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    gcdied = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illoth = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illpart = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-2` = "not asked",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    modied = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-2` = "not asked",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sisdied = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-3` = "na: no sisters",
    `-2` = "answer: no sisters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    sondied = c(
    `-6` = "refusal/skip by interviewer",
    `-5` = "terminated interview",
    `-4` = "short version",
    `-3` = "na: no sons",
    `-2` = "answer: no sons",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    brodied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no brothers",
    `-2` = "answer: no brothers",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    conflic = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    crime = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    daudied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no daughters",
    `-2` = "answer: no daughters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    fadied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "not asked",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    financ = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    gcdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illoth = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illpart = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-2` = "not asked",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    modied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "not asked",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sisdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sisters",
    `-2` = "answer: no sisters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    sondied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sons",
    `-2` = "answer: no sons",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    brodied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no brothers",
    `-2` = "answer: no brothers",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    conflic = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    crime = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    daudied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no daughters",
    `-2` = "answer: no daughters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    fadied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "na: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    financ = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    gcdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illoth = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illpart = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-2` = "na: no partner",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    modied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "na: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sisdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sisters",
    `-2` = "answer: no sisters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    sondied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sons",
    `-2` = "answer: no sons",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    brodied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no brothers",
    `-2` = "answer: no brothers",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    conflic = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    crime = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    daudied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no daughters",
    `-2` = "answer: no daughters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    fadied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "na: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    financ = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    gcdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illoth = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illpart = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-2` = "na: no partner",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    modied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "na: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sisdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sisters",
    `-2` = "answer: no sisters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    sondied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sons",
    `-2` = "answer: no sons",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    brodied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no brothers",
    `-2` = "answer: no brothers",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    conflic = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    crime = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    daudied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no daughters",
    `-2` = "answer: no daughters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    fadied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "na: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    financ = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    gcdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illoth = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illpart = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-2` = "na: no partner",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    modied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "na: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sisdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sisters",
    `-2` = "answer: no sisters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    sondied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sons",
    `-2` = "answer: no sons",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    brodied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no brothers",
    `-2` = "answer: no brothers",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    conflic = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    crime = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    daudied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no daughters",
    `-2` = "answer: no daughters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    fadied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "na: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    financ = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    gcdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illoth = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illpart = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-2` = "na: no partner",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    modied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-4` = "do not know",
    `-3` = "died earlier",
    `-2` = "na: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sisdied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sisters",
    `-2` = "answer: no sisters",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    sondied = c(
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version",
    `-3` = "na: no sons",
    `-2` = "answer: no sons",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    brodied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no brothers alive",
    `-2` = "answer: no brothers",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    conflic = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    crime = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    daudied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no daughters alive",
    `-2` = "answer: no daughters",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    fadied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: died earlier",
    `-2` = "answer: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    financ = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    gcdied = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illoth = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illpart = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-3` = "not asked: partner not identified in demographic part",
    `-2` = "not asked: no partner",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    modied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: died earlier",
    `-2` = "answer: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sisdied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no sisters alive",
    `-2` = "answer: no sisters",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sondied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no sons alive",
    `-2` = "answer: no sons",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    brodied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no brothers alive",
    `-2` = "answer: no brothers",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    conflic = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    crime = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    daudied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no daughters alive",
    `-2` = "answer: no daughters",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    fadied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: died earlier",
    `-2` = "answer: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    financ = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    gcdied = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illoth = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illpart = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-3` = "not asked: partner not identified in demographic part",
    `-2` = "not asked: no partner",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    modied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: died earlier",
    `-2` = "answer: died earlier",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sisdied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no sisters alive",
    `-2` = "answer: no sisters",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  ),
    sondied = c(
    `-10` = "not asked: no data available",
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no sons alive",
    `-2` = "answer: no sons",
    `-1` = "no answer",
    `1` = "not died",
    `2` = "died"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    brodied = .replace_labels(
    standardized_value_labels$brodied,
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no brothers alive",
    `-2` = "answer: no brothers"
  ),
    conflic = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    crime = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    daudied = .replace_labels(
    standardized_value_labels$daudied,
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no daughters alive",
    `-2` = "answer: no daughters"
  ),
    fadied = .replace_labels(
    standardized_value_labels$fadied,
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: died earlier",
    `-2` = "answer: died earlier"
  ),
    financ = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    gcdied = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illoth = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    illpart = c(
    `-8` = "technical problems",
    `-7` = "refusal/skip by interviewer",
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-3` = "not asked: partner not identified in demographic part",
    `-2` = "not asked: no partner",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes"
  ),
    modied = .replace_labels(
    standardized_value_labels$modied,
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: died earlier",
    `-2` = "answer: died earlier"
  ),
    sisdied = .replace_labels(
    standardized_value_labels$sisdied,
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no sisters alive",
    `-2` = "answer: no sisters"
  ),
    sondied = .replace_labels(
    standardized_value_labels$sondied,
    `-6` = "terminated interview",
    `-5` = "short version interview",
    `-4` = "do not know",
    `-3` = "not asked: no sons alive",
    `-2` = "answer: no sons"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

.lasa_fc_272 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "272", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "272", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "272", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "272", waves = .lasa_wave_rows())
)
