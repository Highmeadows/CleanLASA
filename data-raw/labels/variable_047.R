## LASA filecode 047 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  domain = "domain in which nominated",
  domtyp = "domain type (variable is recoded in Xnwinhh en Xnwtype)",
  emo_giv = "emotional support given (\"... told you about his/her personal experiences and feelings\")",
  emo_rec = "emotional support received (\"you told ... about your personal experiences and feelings\")",
  freqran = "ranking # frequency",
  ins_giv = "instrumental support given (\"you helped ... with daily chores in and around the house\")",
  ins_rec = "instrumental support received (\"... helped you with daily chores in and around the house\")",
  nwconf = "confidant identification (Which of all the",
  nwfreq = "frequency of contact <1- 8> (\"How",
  nwinhh = "sharing the household with R",
  nwmem = "network member id = respondent id followed by 2 digits 01..99(max). Each occurrence describes a network relation with R",
  nwmsupp = "most supportive network member support Q's:",
  nwpart = "marital/partner status network member",
  nwsex = "sex network member",
  nwtrav = "travelling time to network member (minutes)",
  nwtype = "relationship type (What relationship do you have with ...? / In welke relatie staat ... tot u?)",
  random = "used in ranking ties frequency",
  sequenc = "sequence questions on support (e=emotional i=instrumental r=received g=given)"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwmsupp",
    "nwpart",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
  Wave_C_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
  Wave_D_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
  Wave_E_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
  Wave_2B_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
  Wave_F_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
  Wave_G_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
  Wave_H_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
  Wave_3B_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
  Wave_I_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
  Wave_J_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
  Wave_K_labels = harmonized_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwmem",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  domain = c(
    `1` = "household",
    `2` = "children/-in-law",
    `3` = "other kin",
    `4` = "neighborhood",
    `5` = "work/school",
    `6` = "organizations",
    `7` = "other non-kin",
    `8` = "forgotten",
    `9` = "rcf/sys addition"
  ),
  domtyp = c(
    `1` = "housekeeper (in household)",
    `2` = "acquaintance (in household)",
    `3` = "catholic sister (in household)",
    `4` = "parent (in household)",
    `5` = "parent inlaw (in household)",
    `6` = "niece/nephew (in household)",
    `7` = "son/daughter-in-law (in household)",
    `8` = "brother/sister-in-law (in household)",
    `9` = "former partner (in household)",
    `10` = "boarder/landlord (in household)",
    `11` = "partner/spouse (in household)",
    `12` = "biological son/daughter (in household)",
    `13` = "brother/sister (in household)",
    `14` = "grandson/daughter (in household)",
    `15` = "friend (in household)",
    `16` = "other, not specified (in household)",
    `17` = "other nonkin, not specified (in household)",
    `18` = "other kin, not specified (in household)",
    `19` = "son/daughter of partner, step, adoptive, foster (in household)",
    `21` = "biological son/daughter",
    `22` = "son/daughter-in-law",
    `23` = "son/daughter of partner, step, adoptive, foster (specification in xnwtype)",
    `24` = "former son/daughter-in-law, other specific cases",
    `25` = "stepchild",
    `26` = "adoptive child",
    `27` = "foster child",
    `31` = "parent",
    `32` = "brother/sister (including half or step)",
    `33` = "brother/sister-in-law",
    `34` = "grandson/daughter",
    `35` = "cousin/niece/nephew",
    `36` = "uncle/aunt",
    `37` = "other family; specification unknown",
    `38` = "father/mother-in-law",
    `39` = "partner/spouse of grandchild",
    `40` = "neighbor",
    `41` = "former neighbor",
    `42` = "living in neighborhood",
    `51` = "(former) colleague or his/her spouse",
    `52` = "known through volunteer work",
    `53` = "known through school, course, education",
    `60` = "known through voluntary organization (e.g. church, sports, political)",
    `70` = "other nonkin; specification unknown",
    `71` = "friend",
    `72` = "acquaintance",
    `73` = "(former) colleague or his/her spouse ->51",
    `74` = "known through voluntary organization (e.g. church, sports, political) ->60",
    `75` = "known through contact at street",
    `76` = "professional helper",
    `77` = "professional, e.g. pastor, reverend, general practitioner",
    `78` = "other kin or nonkin; specification unknown",
    `79` = "professional helper (frequent contact)",
    `80` = "partner/spouse outside household",
    `81` = "former spouse/partner",
    `82` = "parent of child-in-law",
    `83` = "former parent-in-law",
    `84` = "landlord",
    `85` = "catholic sister",
    `86` = "other kin or nonkin; specification unknown"
  ),
  emo_giv = c(
    `-7` = "not available,rank>10/12",
    `-6` = "not available, routing",
    `-3` = "rcf/sys addition",
    `-1` = "no answer",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often"
  ),
  emo_rec = c(
    `-7` = "not available,rank>10/12",
    `-6` = "not available, routing",
    `-3` = "rcf/sys addition",
    `-1` = "no answer",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often"
  ),
  freqran = c(`-6` = "not available, routing", `-3` = "rcf/sys addition", `-1` = "deleted by interviewer"),
  ins_giv = c(
    `-7` = "not available,rank>10/12",
    `-6` = "not available, routing",
    `-3` = "rcf/sys addition",
    `-1` = "no answer",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often"
  ),
  ins_rec = c(
    `-7` = "not available,rank>10/12",
    `-6` = "not available, routing",
    `-3` = "rcf/sys addition",
    `-1` = "no answer",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often"
  ),
  nwconf = c(
    `-6` = "identified persons is your confidant?/welke van alle hiervoor genoemde personen beschouwt u als uw vertrouwenspersoon?) see 247",
    `-3` = "rcf/sys addition",
    `0` = "not the/a confidant",
    `1` = "(1st) confidant",
    `2` = "2nd confidant",
    `3` = "3rd confidant",
    `4` = "4th confidant",
    `5` = "5th confidant",
    `6` = "6th confidant",
    `7` = "7th confidant",
    `8` = "8th confidant",
    `9` = "9th/last confidant"
  ),
  nwfreq = c(
    `-6` = "often are you in touch with ...?\"/\"hoe vaak heeft u contact met not available, routing",
    `-3` = "rcf/sys addition",
    `-1` = "no answer",
    `1` = "never",
    `2` = "...\") yearly or less often",
    `3` = "few times year",
    `4` = "monthly",
    `5` = "once every 2 weeks",
    `6` = "weekly",
    `7` = "few times week",
    `8` = "daily or household member"
  ),
  nwinhh = c(`-1` = "unknown", `0` = "not sharing", `1` = "sharing household"),
  nwmem = stats::setNames(character(0), character(0)),
  nwmsupp = c(
    `-8` = "no answer",
    `-7` = "not available,rank>10",
    `-6` = "not available, routing",
    `-4` = "not available,only 1 network member",
    `-3` = "rcf/sys addition",
    `-2` = "as -1,partner not listed",
    `-1` = "nobody/refusal/all",
    `0` = "<>partner,<>most supportive, no partner in network",
    `1` = "<>partner,<>most supportive, partner in network",
    `2` = ">partner,<>most supportive, partner not on list in q",
    `3` = "partner, but not most supportive",
    `4` = "most supportive=partner",
    `5` = "most supportive, no partner in network",
    `6` = "most supportive<>partner, partner on list in q",
    `7` = "most supportive<>partner, partner not on list in q"
  ),
  nwpart = c(
    `-7` = "not available,rank>10/12",
    `-6` = "not available, routing",
    `-4` = "not available,miss techn",
    `-3` = "rcf/sys addition",
    `-1` = "no answer",
    `1` = "w/partner",
    `5` = "no partner"
  ),
  nwsex = c(`-1` = "unknown", `1` = "male", `2` = "female"),
  nwtrav = c(
    `-7` = "not available,rank>10/12",
    `-6` = "not available, routing",
    `-4` = "not available,miss techn",
    `-3` = "rcf/sys addition",
    `-1` = "no answer",
    `0` = "no time",
    `60` = "1 hour",
    `1440` = ">24 hours"
  ),
  nwtype = c(
    `1` = "spouse or partner",
    `11` = "biological son or daughter",
    `12` = "son/daughter of partner, step, adoptive, foster (specification available)",
    `13` = "stepchild",
    `14` = "adoptive child",
    `15` = "foster child (= non-kin)",
    `21` = "child-in-law",
    `22` = "former child-in-law",
    `30` = "brother or sister (including half or step)",
    `40` = "brother/sister-in-law",
    `51` = "father or mother",
    `52` = "father/mother-in-law",
    `53` = "grandchild",
    `54` = "partner of grandchild",
    `55` = "cousin/niece/nephew",
    `56` = "uncle/aunt",
    `57` = "other kin; specification unknown",
    `60` = "friend",
    `71` = "neighbor",
    `72` = "(living in) neighborhood",
    `81` = "(former) colleague or his/her spouse",
    `82` = "known through volunteer work",
    `83` = "known through school, course, education",
    `84` = "known through voluntary organization (e.g. church, sports, political)",
    `85` = "acquaintance",
    `86` = "former neighbor",
    `87` = "known through contact at street",
    `88` = "housekeeper/nurse/home helper",
    `89` = "professional, e.g. pastor, reverend, general practitioner",
    `90` = "boarder, landlord",
    `91` = "catholic sister",
    `92` = "parent-in-law of child",
    `93` = "former parent-in-law",
    `94` = "former spouse/partner",
    `95` = "other non-kin; specification unknown",
    `96` = "other kin or non-kin; specification unknown"
  ),
  random = c(
    `-6` = "not available, routing",
    `-3` = "rcf/sys addition",
    `-1` = "missing",
    `0` = NA_character_,
    `59` = NA_character_,
    `99` = NA_character_
  ),
  sequenc = c(
    `-7` = "not available,rank>10/12",
    `-6` = "not available, routing",
    `-3` = "rcf/sys addition",
    `-1` = "only missings",
    `1234` = "er ir eg ig",
    `1243` = "er ir ig eg",
    `1324` = "er eg ir ig",
    `1342` = "er eg ig ir",
    `1423` = "er ig ir eg",
    `1432` = "er ig eg ir",
    `2134` = "ir er eg ig",
    `2143` = "ir er ig eg",
    `2314` = "ir eg er ig",
    `2341` = "ir eg ig er",
    `2413` = "ir ig er eg",
    `2431` = "ir ig eg er",
    `3124` = "eg er ir ig",
    `3142` = "eg er ig ir",
    `3214` = "eg ir er ig",
    `3241` = "eg ir ig er",
    `3412` = "eg ig er ir",
    `3421` = "eg ig ir er",
    `4123` = "ig er ir eg",
    `4132` = "ig er eg ir",
    `4213` = "ig ir er eg",
    `4231` = "ig ir eg er",
    `4312` = "ig eg er ir",
    `4321` = "ig eg ir er"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwfreq",
    "nwinhh",
    "nwmsupp",
    "nwpart",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwmsupp = .replace_labels(
    standardized_value_labels$nwmsupp,
    `-7` = "NA:rank>10",
    `-6` = "NA:see 247",
    `-4` = "NA:only 1 network member",
    `-3` = "RCF/SYS addition",
    `2` = ">partner,<>most supportive, partner not on list in Q",
    `6` = "most supportive<>partner, partner on list in Q",
    `7` = "most supportive<>partner, partner not on list in Q"
  ),
    nwpart = .replace_labels(
    standardized_value_labels$nwpart,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    random = .replace_labels(
    standardized_value_labels$random,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    random = .replace_labels(
    standardized_value_labels$random,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    random = .replace_labels(
    standardized_value_labels$random,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    random = .replace_labels(
    standardized_value_labels$random,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    random = .replace_labels(
    standardized_value_labels$random,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    random = .replace_labels(
    standardized_value_labels$random,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "random",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    random = .replace_labels(
    standardized_value_labels$random,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "domain",
    "domtyp",
    "emo_giv",
    "emo_rec",
    "freqran",
    "ins_giv",
    "ins_rec",
    "nwconf",
    "nwfreq",
    "nwinhh",
    "nwsex",
    "nwtrav",
    "nwtype",
    "sequenc"
  )],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "RCF/SYS addition"
  ),
    domtyp = .replace_labels(
    standardized_value_labels$domtyp,
    `23` = "son/daughter of partner, step, adoptive, foster (specification in Xnwtype)"
  ),
    emo_giv = .replace_labels(
    standardized_value_labels$emo_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    emo_rec = .replace_labels(
    standardized_value_labels$emo_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-6` = "NA: see 247",
    `-3` = "RCF/SYS addition",
    `-1` = "deleted by Interviewer"
  ),
    ins_giv = .replace_labels(
    standardized_value_labels$ins_giv,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    ins_rec = .replace_labels(
    standardized_value_labels$ins_rec,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwconf = .replace_labels(
    standardized_value_labels$nwconf,
    `-6` = "identified persons is your confidant? / Welke van alle hiervoor genoemde personen beschouwt U als Uw vertrouwenspersoon?) see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwfreq = .replace_labels(
    standardized_value_labels$nwfreq,
    `-6` = "often are you in touch with ...?\" / \"Hoe vaak heeft u contact met NA: see 247",
    `-3` = "RCF/SYS addition"
  ),
    nwtrav = .replace_labels(
    standardized_value_labels$nwtrav,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-4` = "NA:miss techn",
    `-3` = "RCF/SYS addition"
  ),
    sequenc = .replace_labels(
    standardized_value_labels$sequenc,
    `-7` = "NA:rank>10/12",
    `-6` = "NA:see 247",
    `-3` = "RCF/SYS addition"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  domain = "categorical",
  domtyp = "categorical",
  emo_giv = "categorical",
  emo_rec = "categorical",
  freqran = "numeric",
  ins_giv = "categorical",
  ins_rec = "categorical",
  nwconf = "categorical",
  nwfreq = "categorical",
  nwinhh = "categorical",
  nwmem = "text",
  nwmsupp = "categorical",
  nwpart = "categorical",
  nwsex = "categorical",
  nwtrav = "numeric",
  nwtype = "categorical",
  random = "numeric",
  sequenc = "categorical"
)

.lasa_fc_047 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "047", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "047", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "047", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "047", waves = .lasa_wave_rows())
)
