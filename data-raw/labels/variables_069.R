## LASA filecode 069 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_069 <- list(
  variables = data.frame(
    wave = c(
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB",
      "MB"
    ),
    variable_name = c(
      "bNLlang1",
      "bNLlang2",
      "bNLlang3",
      "bcultdis1",
      "bcultdis2",
      "bcultdis3",
      "bcultid1",
      "bcultid2",
      "bcultid3",
      "bcultid4",
      "bcultid5",
      "bcultid6",
      "bcultid7",
      "bloss1",
      "bloss2",
      "bloss3",
      "bloss4",
      "bloss5",
      "bloss6",
      "bloss7"
    ),
    canonical_name = c(
      "nllang1",
      "nllang2",
      "nllang3",
      "cultdis1",
      "cultdis2",
      "cultdis3",
      "cultid1",
      "cultid2",
      "cultid3",
      "cultid4",
      "cultid5",
      "cultid6",
      "cultid7",
      "loss1",
      "loss2",
      "loss3",
      "loss4",
      "loss5",
      "loss6",
      "loss7"
    ),
    variable_label = c(
      "I can understand spoken Dutch well / Ik kan gesproken NLs goed begrijpen",
      "I can speak Dutch well / Ik kan NLs goed spreken",
      "I can read Dutch well / Ik kan NLs goed lezen",
      "I sometimes get visits from Dutch acquaintances / Ik krijg thuis soms bezoek van Nederlandse kennissen",
      "I would like to speak to Dutch acquaintances about what worries me / Ik zou met Nederlandse kennissen ook over mijn zorgen willen praten",
      "It is all right for a Dutch acquaintance to babysit my children / Een Nederlandse kennis zou op mijn kind(eren) mogen passen",
      "Follow political and other current events / Het volgen van recente gebeurtenissen van mijn groep",
      "Active in an association or organization within my own group / Het actief zijn in een vereniging of een organisatie binnen mijn groep",
      "Spend time studying the history or culture / De geschiedenis of cultuur van mijn groep bestuderen",
      "Learn the dances and music of the group / De dansen of muziek van mijn groep leren of beoefenen",
      "Talking to or discuss what's new with others from my group / Praten of nieuwtjes bespreken met anderen uit mijn groep",
      "Interact with close friends from my group / Samen zijn met goede vrienden uit mijn groep",
      "Celebrate holidays with family and good friends from my group / Met familie of goede vrienden de feestdagen van mijn groep vieren",
      "I belong here less than in Turkey/Morocco / Ik behoor hier minder dan in Turkije/Marokko",
      "Although I live here, it does not feel as my country / Hoewel ik hier leef, voelt het niet als mijn land",
      "Most friends have a cultural background similar to mine / De meeste vrienden hebben dezelfde culturele achtergrond",
      "For a day or night out, I prefer to visit places where I meet people from Turkey/Morocco / Wanneer ik uitga, ga ik het liefst naar plaatsen waar ik mensen uit Turkije/Marokko kan ontmoeten",
      "Turkey/Morocco is always in my mind and in my memories / Turkije/Marokko is altijd in gedachten/herinneringen",
      "I miss the people I left behind in Turkey/Morocco / Ik mis mensen die ik achterliet in Turkije/Marokko",
      "I am homesick / Ik heb heimwee"
    ),
    harmonized_var_label = c(
      "I can understand spoken Dutch well / Ik kan gesproken NLs goed begrijpen",
      "I can speak Dutch well / Ik kan NLs goed spreken",
      "I can read Dutch well / Ik kan NLs goed lezen",
      "I sometimes get visits from Dutch acquaintances / Ik krijg thuis soms bezoek van Nederlandse kennissen",
      "I would like to speak to Dutch acquaintances about what worries me / Ik zou met Nederlandse kennissen ook over mijn zorgen willen praten",
      "It is all right for a Dutch acquaintance to babysit my children / Een Nederlandse kennis zou op mijn kind(eren) mogen passen",
      "Follow political and other current events / Het volgen van recente gebeurtenissen van mijn groep",
      "Active in an association or organization within my own group / Het actief zijn in een vereniging of een organisatie binnen mijn groep",
      "Spend time studying the history or culture / De geschiedenis of cultuur van mijn groep bestuderen",
      "Learn the dances and music of the group / De dansen of muziek van mijn groep leren of beoefenen",
      "Talking to or discuss what's new with others from my group / Praten of nieuwtjes bespreken met anderen uit mijn groep",
      "Interact with close friends from my group / Samen zijn met goede vrienden uit mijn groep",
      "Celebrate holidays with family and good friends from my group / Met familie of goede vrienden de feestdagen van mijn groep vieren",
      "I belong here less than in Turkey/Morocco / Ik behoor hier minder dan in Turkije/Marokko",
      "Although I live here, it does not feel as my country / Hoewel ik hier leef, voelt het niet als mijn land",
      "Most friends have a cultural background similar to mine / De meeste vrienden hebben dezelfde culturele achtergrond",
      "For a day or night out, I prefer to visit places where I meet people from Turkey/Morocco / Wanneer ik uitga, ga ik het liefst naar plaatsen waar ik mensen uit Turkije/Marokko kan ontmoeten",
      "Turkey/Morocco is always in my mind and in my memories / Turkije/Marokko is altijd in gedachten/herinneringen",
      "I miss the people I left behind in Turkey/Morocco / Ik mis mensen die ik achterliet in Turkije/Marokko",
      "I am homesick / Ik heb heimwee"
    ),
    var_type = c(
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    cultdis1 = list(
      MB = strongly_disagree_disagree_agree_strongly_agree
    ),
    cultdis2 = list(
      MB = strongly_disagree_disagree_agree_strongly_agree
    ),
    cultdis3 = list(
      MB = strongly_disagree_disagree_agree_strongly_agree
    ),
    cultid1 = list(
      MB = never_sometimes_regularly_often
    ),
    cultid2 = list(
      MB = never_sometimes_regularly_often
    ),
    cultid3 = list(
      MB = never_sometimes_regularly_often
    ),
    cultid4 = list(
      MB = never_sometimes_regularly_often
    ),
    cultid5 = list(
      MB = never_sometimes_regularly_often
    ),
    cultid6 = list(
      MB = never_sometimes_regularly_often
    ),
    cultid7 = list(
      MB = never_sometimes_regularly_often
    ),
    loss1 = list(
      MB = no_yes_3
    ),
    loss2 = list(
      MB = no_yes_3
    ),
    loss3 = list(
      MB = no_yes_3
    ),
    loss4 = list(
      MB = no_yes_3
    ),
    loss5 = list(
      MB = no_yes_3
    ),
    loss6 = list(
      MB = no_yes_3
    ),
    loss7 = list(
      MB = no_yes_3
    ),
    nllang1 = list(
      MB = strongly_disagree_disagree_agree_strongly_agree
    ),
    nllang2 = list(
      MB = strongly_disagree_disagree_agree_strongly_agree
    ),
    nllang3 = list(
      MB = strongly_disagree_disagree_agree_strongly_agree
    )
  ),

  value_labels_harmonized = list(
    cultdis1 = strongly_disagree_disagree_agree_strongly_agree,
    cultdis2 = strongly_disagree_disagree_agree_strongly_agree,
    cultdis3 = strongly_disagree_disagree_agree_strongly_agree,
    cultid1 = never_sometimes_regularly_often,
    cultid2 = never_sometimes_regularly_often,
    cultid3 = never_sometimes_regularly_often,
    cultid4 = never_sometimes_regularly_often,
    cultid5 = never_sometimes_regularly_often,
    cultid6 = never_sometimes_regularly_often,
    cultid7 = never_sometimes_regularly_often,
    loss1 = no_yes_3,
    loss2 = no_yes_3,
    loss3 = no_yes_3,
    loss4 = no_yes_3,
    loss5 = no_yes_3,
    loss6 = no_yes_3,
    loss7 = no_yes_3,
    nllang1 = strongly_disagree_disagree_agree_strongly_agree,
    nllang2 = strongly_disagree_disagree_agree_strongly_agree,
    nllang3 = strongly_disagree_disagree_agree_strongly_agree
  )
)
