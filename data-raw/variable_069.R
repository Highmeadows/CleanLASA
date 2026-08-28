## LASA filecode 069 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  cultdis1 = "I sometimes get visits from Dutch acquaintances / Ik krijg thuis soms bezoek van Nederlandse kennissen",
  cultdis2 = "I would like to speak to Dutch acquaintances about what worries me / Ik zou met Nederlandse kennissen ook over mijn zorgen willen praten",
  cultdis3 = "It is all right for a Dutch acquaintance to babysit my children / Een Nederlandse kennis zou op mijn kind(eren) mogen passen",
  cultid1 = "Follow political and other current events / Het volgen van recente gebeurtenissen van mijn groep",
  cultid2 = "Active in an association or organization within my own group / Het actief zijn in een vereniging of een organisatie binnen mijn groep",
  cultid3 = "Spend time studying the history or culture / De geschiedenis of cultuur van mijn groep bestuderen",
  cultid4 = "Learn the dances and music of the group / De dansen of muziek van mijn groep leren of beoefenen",
  cultid5 = "Talking to or discuss what's new with others from my group / Praten of nieuwtjes bespreken met anderen uit mijn groep",
  cultid6 = "Interact with close friends from my group / Samen zijn met goede vrienden uit mijn groep",
  cultid7 = "Celebrate holidays with family and good friends from my group / Met familie of goede vrienden de feestdagen van mijn groep vieren",
  loss1 = "I belong here less than in Turkey/Morocco / Ik behoor hier minder dan in Turkije/Marokko",
  loss2 = "Although I live here, it does not feel as my country / Hoewel ik hier leef, voelt het niet als mijn land",
  loss3 = "Most friends have a cultural background similar to mine / De meeste vrienden hebben dezelfde culturele achtergrond",
  loss4 = "For a day or night out, I prefer to visit places where I meet people from Turkey/Morocco / Wanneer ik uitga, ga ik het liefst naar plaatsen waar ik mensen uit Turkije/Marokko kan ontmoeten",
  loss5 = "Turkey/Morocco is always in my mind and in my memories / Turkije/Marokko is altijd in gedachten/herinneringen",
  loss6 = "I miss the people I left behind in Turkey/Morocco / Ik mis mensen die ik achterliet in Turkije/Marokko",
  loss7 = "I am homesick / Ik heb heimwee",
  nllang1 = "I can understand spoken Dutch well / Ik kan gesproken NLs goed begrijpen",
  nllang2 = "I can speak Dutch well / Ik kan NLs goed spreken",
  nllang3 = "I can read Dutch well / Ik kan NLs goed lezen"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `MB` = c(
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
    "loss7",
    "nllang1",
    "nllang2",
    "nllang3"
  )
)

variable_labels_list <- list(
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  cultdis1 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "agree",
    `4` = "strongly agree"
  ),
  cultdis2 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "agree",
    `4` = "strongly agree"
  ),
  cultdis3 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "agree",
    `4` = "strongly agree"
  ),
  cultid1 = c(
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "often"
  ),
  cultid2 = c(
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "often"
  ),
  cultid3 = c(
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "often"
  ),
  cultid4 = c(
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "often"
  ),
  cultid5 = c(
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "often"
  ),
  cultid6 = c(
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "often"
  ),
  cultid7 = c(
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "often"
  ),
  loss1 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  loss2 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  loss3 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  loss4 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  loss5 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  loss6 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  loss7 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  nllang1 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "agree",
    `4` = "strongly agree"
  ),
  nllang2 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "agree",
    `4` = "strongly agree"
  ),
  nllang3 = c(
    default_missing_labels[c("-1")],
    `1` = "strongly disagree",
    `2` = "disagree",
    `3` = "agree",
    `4` = "strongly agree"
  )
)

value_labels_list <- list(
  Wave_MB_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  cultdis1 = "categorical",
  cultdis2 = "categorical",
  cultdis3 = "categorical",
  cultid1 = "categorical",
  cultid2 = "categorical",
  cultid3 = "categorical",
  cultid4 = "categorical",
  cultid5 = "categorical",
  cultid6 = "categorical",
  cultid7 = "categorical",
  loss1 = "categorical",
  loss2 = "categorical",
  loss3 = "categorical",
  loss4 = "categorical",
  loss5 = "categorical",
  loss6 = "categorical",
  loss7 = "categorical",
  nllang1 = "categorical",
  nllang2 = "categorical",
  nllang3 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "069", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "069", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "069", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "069", waves = .lasa_wave_rows())
)

.lasa_fc_069 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

