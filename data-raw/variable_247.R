## LASA filecode 247 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  confinf = "Information on confidant identification",
  confnum = "Number of confidants identified",
  eg = "total emotional support given",
  er = "total emotional support received",
  ig = "total instrumental support given",
  ir = "total instrumental support received",
  meg = "mean emotional support given",
  mer = "mean emotional support received",
  mig = "mean instrumental support given",
  mir = "mean instrumental support received",
  mis247 = "missing delineation/contact frequency/characteristics/supportive exchanges",
  nwconftype = "Confidant relationship type",
  nwdaily = "Aggregate contact frequency",
  nwdiversity = "Network diversity: number of roles",
  nwpctnonkin = "Percentage of network members who are non-kin",
  nwsize = "network size",
  sq = "sequence questions on support"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `C` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `D` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `E` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `2B` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `F` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `G` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `H` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `3B` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `I` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwsize",
    "sq"
  ),
  `J` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwconftype",
    "nwdaily",
    "nwdiversity",
    "nwpctnonkin",
    "nwsize",
    "sq"
  ),
  `K` = c(
    "confinf",
    "confnum",
    "eg",
    "er",
    "ig",
    "ir",
    "meg",
    "mer",
    "mig",
    "mir",
    "mis247",
    "nwconftype",
    "nwdaily",
    "nwdiversity",
    "nwpctnonkin",
    "nwsize",
    "sq"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified",
    nwconftype = "confidant relationship type",
    nwdaily = "frequency contact aggregate",
    nwdiversity = "network diversity number roles 0-13",
    nwpctnonkin = "percentage nonkin 0-100"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    confinf = "information on identification confidant",
    confnum = "# confidants identified",
    nwconftype = "confidant relationship type",
    nwdaily = "frequency contact aggregate",
    nwdiversity = "network diversity number roles 0-13",
    nwpctnonkin = "percentage nonkin 0-100"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  confinf = c(
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-2` = "no network members",
    default_missing_labels[c("-1")],
    `1` = "no confidant available",
    `2` = "confidant not necessary",
    `3` = "confidant(s) identified",
    `4` = "all are confidant, 0 identified",
    `5` = "all are confidant + identified",
    `6` = "other(s) not in network, 0 identified",
    `7` = "other(s) not in network + identified"
  ),
  confnum = c(
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-2` = "no network members",
    default_missing_labels[c("-1")],
    `0` = NA_character_,
    `1` = NA_character_,
    `2` = NA_character_,
    `3` = NA_character_,
    `4` = NA_character_,
    `5` = NA_character_,
    `6` = NA_character_,
    `7` = NA_character_,
    `8` = NA_character_,
    `9` = NA_character_
  ),
  eg = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-1` = "no oth members",
    `0` = NA_character_,
    `36` = NA_character_
  ),
  er = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-1` = "no oth members",
    `0` = NA_character_,
    `36` = NA_character_
  ),
  ig = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-1` = "no oth members",
    `0` = NA_character_,
    `36` = NA_character_
  ),
  ir = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-1` = "no oth members",
    `0` = NA_character_,
    `36` = NA_character_
  ),
  meg = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-1` = "no oth members",
    `0` = NA_character_,
    `1` = NA_character_,
    `2` = NA_character_,
    `3` = NA_character_
  ),
  mer = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-1` = "no oth members",
    `0` = NA_character_,
    `1` = NA_character_,
    `2` = NA_character_,
    `3` = NA_character_
  ),
  mig = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-1` = "no oth members",
    `0` = NA_character_,
    `1` = NA_character_,
    `2` = NA_character_,
    `3` = NA_character_
  ),
  mir = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-1` = "no oth members",
    `0` = NA_character_,
    `1` = NA_character_,
    `2` = NA_character_,
    `3` = NA_character_
  ),
  mis247 = c(
    `0` = "no missings",
    `4` = "support skip",
    `5` = "support terminated",
    `40` = "characteristics skipped",
    `44` = ">characteristics skipped",
    `55` = ">characteristics skipped",
    `111` = "size=0",
    `444` = "contactfrequency skipped",
    `555` = ">contactfrequency terminated",
    `3333` = "short version",
    `4444` = "refusal R/skip by Interviewer",
    `5555` = "terminated",
    `6666` = "damaged information"
  ),
  nwconftype = c(
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-2` = "not asked (observation LSNa; LASAb)",
    default_missing_labels[c("-1")],
    `0` = "no network members; no confidant available; confidant not necessary",
    `1` = "partner is #1 among confidants",
    `2` = "partner among confidants",
    `3` = "biological child among confidants",
    `4` = "non-biological child/child-in-law",
    `5` = "other kin",
    `6` = "friend",
    `7` = "other non-kin/all network members/person not in network"
  ),
  nwdaily = c(
    `-8` = "telephone interview",
    `-7` = "proxy interview",
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `0` = "no network members",
    `1` = "weekly contact",
    `2` = "several times/week",
    `3` = "daily contact w/ other than partner",
    `4` = "partner: living w/ | daily contact"
  ),
  nwdiversity = c(
    `-8` = "telephone interview",
    `-7` = "proxy interview",
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version"
  ),
  nwpctnonkin = c(
    `-8` = "telephone interview",
    `-7` = "proxy interview",
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `0` = NA_character_,
    `100` = NA_character_
  ),
  nwsize = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `0` = NA_character_,
    `1` = NA_character_,
    `10` = NA_character_,
    `20` = NA_character_,
    `30` = NA_character_,
    `40` = NA_character_,
    `50` = NA_character_,
    `60` = NA_character_,
    `70` = NA_character_,
    `80` = NA_character_
  ),
  sq = c(
    `-6` = "damaged information",
    `-5` = "terminated",
    `-4` = "refusal R/skip by Interviewer",
    `-3` = "short version",
    `-2` = "no members",
    `-1` = "no oth members"
  )
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_2B_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  confinf = "categorical",
  confnum = "numeric",
  eg = "numeric",
  er = "numeric",
  ig = "numeric",
  ir = "numeric",
  meg = "numeric",
  mer = "numeric",
  mig = "numeric",
  mir = "numeric",
  mis247 = "categorical",
  nwconftype = "categorical",
  nwdaily = "categorical",
  nwdiversity = "numeric",
  nwpctnonkin = "numeric",
  nwsize = "numeric",
  sq = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "247", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "247", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "247", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "247", waves = .lasa_wave_rows())
)

.lasa_fc_247 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

