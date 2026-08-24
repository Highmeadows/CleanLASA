## LASA filecode 048 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  afstand = "distance",
  chage = "age child",
  chages = "source of data on age child",
  chbrok = "year contact /w child broken",
  chdead = "year child",
  chdiv = "previous marriages",
  chempl = "employment child: no/part/fulltime",
  chfreq = "contact frequency",
  chid = "child ID",
  chinhh = "child sharing household with R",
  chmar = "marital status",
  chpart = "partner status child",
  chsex = "sex of child",
  chstat = "identification status",
  chtrav = "travelling time to child (minutes)",
  chtype = "type child",
  datasrc = "data",
  domain = "random number, used in ranking ties",
  freqran = "ranking number frequency",
  gc = "grandchildren (children of this child)",
  gcage = "age youngest child of child",
  nwmem = "network member ID",
  partner = "partner sharing household with child",
  random = "random number, used in ranking ties"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("domain", "freqran", "nwmem", "random")],
    nwmem = "network member id T3"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
    "chage",
    "chages",
    "chbrok",
    "chdead",
    "chempl",
    "chfreq",
    "chid",
    "chinhh",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "gcage"
  )],
    chage = "age child (@ time: see ECHAGES)",
    chempl = "no/part/fulltime work child",
    chstat = "status child identification"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
    "chage",
    "chbrok",
    "chempl",
    "chfreq",
    "chid",
    "chinhh",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "datasrc",
    "gcage",
    "nwmem"
  )],
    chbrok = "contact broken"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "chage",
    "chages",
    "chbrok",
    "chdead",
    "chdiv",
    "chempl",
    "chfreq",
    "chid",
    "chinhh",
    "chmar",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "gc",
    "nwmem"
  )],
    chage = "age child @ wave A | wave F (see fchages)",
    chempl = "no/part/fulltime work child",
    chstat = "status child identification"
  ),
  Wave_3B_labels = harmonized_labels[c(
    "chage",
    "chempl",
    "chfreq",
    "chid",
    "chinhh",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "gcage",
    "nwmem"
  )],
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c("afstand", "chage", "chfreq", "chid", "chsex", "partner")],
    chage = "age"
  ),
  Wave_I_labels = harmonized_labels[c(
    "chage",
    "chbrok",
    "chdead",
    "chempl",
    "chfreq",
    "chid",
    "chinhh",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "gcage",
    "nwmem"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  afstand = c(`-1` = "no answer"),
  chage = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in kk",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-6` = "rcf addition",
    `-5` = "coding category -5",
    `-4` = "coding category -4",
    `-3` = "contact broken",
    `-1` = "no answer"
  ),
  chages = c(
    `-6` = "rcf addition",
    `-4` = "deceased",
    `-2` = "not asked(error)",
    `1` = "asked lasadc",
    `2` = "coding category 2",
    `3` = "lsna 1992"
  ),
  chbrok = c(
    `-5` = "coding category -5",
    `-4` = "deceased",
    `-3` = "not broken & no contact",
    `-2` = "coding category -2",
    `-1` = "coding category -1",
    `1` = "coding category 1",
    `2` = "broken",
    `3` = "other"
  ),
  chdead = c(
    `-9` = "deceased dbf:died",
    `-5` = "deceased not asked/unknown",
    `-3` = "alive",
    `-2` = "coding category -2",
    `-1` = "coding category -1",
    `0` = "not deceased",
    `1` = "before wave a",
    `3` = "before wave c",
    `4` = "before wave d"
  ),
  chdiv = c(
    `-6` = "rcf addition",
    `-5` = "currently divorced",
    `-4` = "died",
    `-3` = "never married",
    `-2` = "age<18yrs",
    `-1` = "no answer",
    `1` = "no previous marriage",
    `2` = "ended by divorce",
    `3` = "ended by widowhood",
    `4` = "1+prev partner relationship",
    `6` = "3+eerdere p-rel"
  ),
  chempl = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in kk",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-6` = "rcf addition",
    `-5` = "coding category -5",
    `-4` = "coding category -4",
    `-3` = "contact broken",
    `-2` = "coding category -2",
    `-1` = "no answer",
    `1` = "not employed",
    `2` = "<=27 hours/week",
    `3` = ">= 28 hours a week"
  ),
  chfreq = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in kk",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-6` = "rcf addition",
    `-5` = "coding category -5",
    `-4` = "coding category -4",
    `-3` = "contact broken",
    `-2` = "child added after network; not identified in kk",
    `-1` = "no answer",
    `1` = "never",
    `2` = "yearly or less often",
    `3` = "few times year",
    `4` = "monthly",
    `5` = "once every 2 weeks",
    `6` = "weekly",
    `7` = "few times week",
    `8` = "daily/hh member"
  ),
  chid = stats::setNames(character(0), character(0)),
  chinhh = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in kk",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-5` = "coding category -5",
    `-4` = "coding category -4",
    `-3` = "contact broken",
    `-2` = "not (not asked)",
    `-1` = "no answer",
    `0` = "not sharing household",
    `1` = "sharing household"
  ),
  chmar = c(
    `-6` = "rcf addition",
    `-4` = "died",
    `-2` = "age<18yrs",
    `-1` = "no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "registered partnership",
    `4` = "divorced",
    `5` = "widowhood"
  ),
  chpart = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in kk",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-6` = "rcf addition",
    `-5` = "coding category -5",
    `-4` = "coding category -4",
    `-3` = "contact broken",
    `-2` = "coding category -2",
    `-1` = "no answer",
    `0` = "no partner",
    `1` = "partner in hh child",
    `2` = "partner outs hh child"
  ),
  chsex = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in kk",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-5` = "rcf/sys addition",
    `-4` = "not asked: never contact or died",
    `-1` = "coding category -1",
    `1` = "son",
    `2` = "daughter"
  ),
  chstat = c(
    `-1` = "refusal @ a",
    `0` = "identified, new",
    `1` = "coding category 1",
    `2` = "coding category 2",
    `3` = "coding category 3",
    `4` = "coding category 4",
    `5` = "coding category 5",
    `6` = "coding category 6",
    `7` = "coding category 7",
    `8` = "coding category 8",
    `9` = "coding category 9",
    `10` = "coding category 10",
    `11` = "coding category 11",
    `12` = "coding category 12",
    `13` = "coding category 13",
    `14` = "coding category 14",
    `15` = "coding category 15",
    `16` = "coding category 16",
    `17` = "from network, in household, added in kk interview",
    `18` = "from network, not in household, added in kk interview",
    `19` = "added in kk interview",
    `20` = "from previous observation (excluding step, adoptive, foster)",
    `99` = "added:rcf/sys"
  ),
  chtrav = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in kk",
    `-8` = "not asked: skip by interviewer",
    `-7` = "coding category -7",
    `-6` = "rcf addition",
    `-5` = "coding category -5",
    `-4` = "coding category -4",
    `-3` = "contact broken",
    `-2` = "not asked (child in network)",
    `-1` = "no answer",
    `0` = "no time",
    `30` = "30 minutes",
    `60` = "1 hour",
    `1440` = ">24 hours"
  ),
  chtype = c(
    `-5` = "coding category -5",
    `-3` = "contact broken",
    `-1` = "unknown",
    `1` = "own/biological child",
    `2` = "step: current partner",
    `3` = "step: former partner",
    `4` = "adoptive",
    `5` = "foster",
    `6` = "step/foster/adoptive",
    `8` = "step (which partner?)",
    `9` = "other person"
  ),
  datasrc = c(
    `11111` = "source: sex type inhh freq trav from network",
    `11112` = "trav asked",
    `11113` = "trav asked changed",
    `11121` = "freq asked",
    `11122` = "freq+trav asked",
    `11211` = "inhh asked",
    `11212` = "inhh+trav asked",
    `11222` = "inhh+freq+trav asked",
    `11311` = "inhh changed",
    `12111` = "type asked",
    `12112` = "type+trav asked",
    `13111` = "type asked changed",
    `22222` = "asked",
    `22223` = "asked;trav changed",
    `22232` = "asked;freq changed",
    `33333` = "asked,changed",
    `44444` = "rcf/sys addition"
  ),
  domain = c(
    `1` = "household",
    `2` = "children/-in-law",
    `3` = "other kin",
    `4` = "neighborhood",
    `5` = "work/school",
    `6` = "organizations",
    `7` = "other non-kin",
    `8` = "forgotten",
    `9` = "system addition",
    `10` = "rcf addition"
  ),
  freqran = c(
    `-3` = "sys/rcf addition",
    `-1` = "exists?,del by iter",
    `1` = NA_character_,
    `2` = NA_character_,
    `11` = ">10 not selected"
  ),
  gc = c(
    `-6` = "rcf addition",
    `-4` = "deceased",
    `-2` = "age<16",
    `-1` = "no answer",
    `0` = "f048:yes f049:no",
    `1` = "f048:no",
    `2` = "yes(asked)",
    `3` = "yes(known from a)",
    `4` = "yes(sys-rcf)",
    `5` = "yes(broken contact)",
    `6` = "yes(broken;no f049)",
    `7` = "yes(miss #;no f049)",
    `8` = "yes(error;no f049)"
  ),
  gcage = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in kk",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-5` = "coding category -5",
    `-4` = "coding category -4",
    `-3` = "coding category -3",
    `-2` = "coding category -2",
    `-1` = "coding category -1"
  ),
  nwmem = c(
    `-5` = "missing network",
    `-4` = "identified;age 0-17",
    `-3` = "not identified;age 0-17",
    `-2` = "coding category -2",
    `-1` = "coding category -1"
  ),
  partner = c(`-1` = "no answer"),
  random = c(`-3` = "sys/rcf addition", `0` = NA_character_, `99` = NA_character_)
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("domain", "freqran", "random")],
    domain = .replace_labels(
    standardized_value_labels$domain,
    `9` = "SYSTEM addition",
    `10` = "RCF addition"
  ),
    freqran = .replace_labels(
    standardized_value_labels$freqran,
    `-3` = "SYS/RCF addition"
  ),
    random = .replace_labels(
    standardized_value_labels$random,
    `-3` = "SYS/RCF addition"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "chage",
    "chages",
    "chbrok",
    "chdead",
    "chempl",
    "chfreq",
    "chinhh",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "gcage"
  )],
    chage = c(`-5` = "see Echstat", `-4` = "deceased", `-3` = "contact broken", `-1` = "no answer"),
    chages = c(
    `-4` = "deceased",
    `-2` = "not asked(error)",
    `1` = "asked LASAdc",
    `2` = "asked LASAe",
    `3` = "LSNa 1992"
  ),
    chbrok = c(
    `-4` = "deceased",
    `-3` = "not broken&no ctc",
    `-2` = "not broken",
    `-1` = "no answer",
    `1` = "broken, year?"
  ),
    chdead = c(
    `-9` = "deceased dbf:died",
    `-3` = "alive",
    `-2` = "died<=LASAd",
    `-1` = "no answer year",
    `0` = "not deceased",
    `1` = "before wave A",
    `3` = "before wave C",
    `4` = "before wave D"
  ),
    chempl = c(
    `-5` = "see Echstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-2` = "not asked(error)",
    `-1` = "no answer",
    `1` = "not employed",
    `2` = "<=27 hours/week",
    `3` = ">= 28 hours a week"
  ),
    chfreq = c(
    `-5` = "see Echstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-1` = "no answer",
    `1` = "never",
    `2` = "yearly or less often",
    `3` = "few times year",
    `4` = "monthly",
    `5` = "once every 2 weeks",
    `6` = "weekly",
    `7` = "few times week",
    `8` = "daily/hh member"
  ),
    chinhh = c(
    `-5` = "see Echstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-2` = "not (not asked)",
    `-1` = "no answer",
    `0` = "not sharing household",
    `1` = "sharing household"
  ),
    chpart = c(
    `-5` = "see Echstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-2` = "not asked(error)",
    `-1` = "no answer",
    `0` = "no partner",
    `1` = "partner in hh child",
    `2` = "partner outs hh child"
  ),
    chsex = c(`-1` = "unknown", `1` = "son", `2` = "daughter"),
    chstat = c(
    `0` = "identified, new",
    `1` = "identified, match",
    `2` = "not id:forgotten",
    `3` = "not id:died",
    `4` = "not id:died<wave D",
    `5` = "not id:contact broken",
    `6` = "not id&<>lasaz047",
    `7` = "!not id:reason unclear",
    `8` = "!not id:Q not understood",
    `9` = "!not id:refusal",
    `10` = "identified<wave E",
    `11` = "identified@wave E"
  ),
    chtrav = c(
    `-5` = "see Echstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-1` = "no answer",
    `0` = "no time",
    `30` = "30 minutes",
    `60` = "1 hour",
    `1440` = ">24 hours"
  ),
    chtype = c(
    `-5` = "see Echstat",
    `-3` = "contact broken",
    `1` = "own child",
    `2` = "step:current partner",
    `3` = "step:former partner",
    `5` = "foster",
    `6` = "step/foster/adoptive"
  ),
    gcage = c(
    `-5` = "see Echstat",
    `-4` = "parent deceased",
    `-3` = "contact broken",
    `-2` = "no children",
    `-1` = "no answer"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "chage",
    "chbrok",
    "chempl",
    "chfreq",
    "chinhh",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "datasrc",
    "gcage",
    "nwmem"
  )],
    chage = c(`-5` = "RCF/SYS addition", `-4` = "deceased", `-3` = "contact broken", `-1` = "no answer"),
    chbrok = c(
    `-5` = "RCF/SYS addition",
    `-2` = "not asked (freq<>1)",
    `1` = "not broken",
    `2` = "broken",
    `3` = "other"
  ),
    chempl = c(
    `-5` = "RCF addition",
    `-2` = "not asked: age<16",
    `-1` = "no answer",
    `1` = "not employed",
    `2` = "<=27 hours/week",
    `3` = ">= 28 hours a week"
  ),
    chfreq = c(
    `-5` = "RCF/SYS addition",
    `-1` = "no answer",
    `1` = "never",
    `2` = "yearly or less often",
    `3` = "few times year",
    `4` = "monthly",
    `5` = "once every 2 weeks",
    `6` = "weekly",
    `7` = "few times week",
    `8` = "daily/hh member"
  ),
    chinhh = c(
    `-5` = "RCF/SYS addition",
    `-1` = "no answer",
    `0` = "not sharing household",
    `1` = "sharing household"
  ),
    chpart = c(
    `-5` = "RCF/SYS addition",
    `-2` = "not asked: age<18",
    `-1` = "no answer",
    `0` = "no partner",
    `1` = "partner in hh child",
    `2` = "partner outs hh child"
  ),
    chsex = c(`-5` = "RCF/SYS addition", `-1` = "unknown", `1` = "son", `2` = "daughter"),
    chstat = c(
    `1` = "identified in interview",
    `2` = "added:iter error",
    `3` = "added:R error",
    `4` = "added:refusal",
    `5` = "added:no contact",
    `6` = "added:no ctc w/ mother",
    `7` = "added:step",
    `8` = "added:in household",
    `9` = "added:foster",
    `10` = "added:young child",
    `99` = "added:RCF/SYS"
  ),
    chtrav = c(
    `-5` = "RCF/SYS addition",
    `-1` = "no answer",
    `0` = "no time",
    `30` = "30 minutes",
    `60` = "1 hour",
    `1440` = ">24 hours"
  ),
    chtype = c(
    `-5` = "RCF/SYS addition",
    `-3` = "contact broken",
    `1` = "own child",
    `2` = "step:current partner",
    `3` = "step:former partner",
    `4` = "adoptive",
    `5` = "foster",
    `6` = "step/foster/adoptive"
  ),
    datasrc = .replace_labels(
    standardized_value_labels$datasrc,
    `44444` = "RCF/SYS addition"
  ),
    gcage = c(
    `-5` = "RCF/SYS addition",
    `-4` = "not asked: age<16",
    `-3` = "no answer children",
    `-2` = "no children",
    `-1` = "no answer age"
  ),
    nwmem = .replace_labels(
    standardized_value_labels$nwmem,
    `-2` = "not identified;SYS/RCF addition",
    `-1` = "not identified"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "chage",
    "chages",
    "chbrok",
    "chdead",
    "chdiv",
    "chempl",
    "chfreq",
    "chinhh",
    "chmar",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "gc",
    "nwmem"
  )],
    chage = c(
    `-6` = "RCF addition",
    `-5` = "see Fchstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-1` = "no answer"
  ),
    chages = c(`-6` = "RCF addition", `-4` = "deceased", `-2` = "not asked(error)", `2` = "asked KK"),
    chbrok = c(
    `-4` = "deceased",
    `-3` = "not broken&no ctc",
    `-2` = "not broken",
    `-1` = "unknown",
    `1` = "broken, year?"
  ),
    chdead = c(
    `-9` = "deceased dbf:died",
    `-3` = "alive",
    `-2` = "ctc broken",
    `-1` = "no answer year",
    `0` = "not deceased",
    `1` = "before wave A",
    `3` = "before wave C",
    `4` = "before wave D"
  ),
    chdiv = .replace_labels(
    standardized_value_labels$chdiv,
    `-6` = "RCF addition"
  ),
    chempl = c(
    `-6` = "RCF addition",
    `-5` = "see Fchstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-2` = "not asked(error)",
    `-1` = "no answer",
    `1` = "not employed",
    `2` = "<=27 hours/week",
    `3` = ">= 28 hours a week"
  ),
    chfreq = c(
    `-6` = "RCF addition",
    `-5` = "see Fchstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-1` = "no answer",
    `1` = "never",
    `2` = "yearly or less often",
    `3` = "few times year",
    `4` = "monthly",
    `5` = "once every 2 weeks",
    `6` = "weekly",
    `7` = "few times week",
    `8` = "daily/hh member"
  ),
    chinhh = c(
    `-5` = "see Fchstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-2` = "not (not asked)",
    `-1` = "no answer",
    `0` = "not sharing household",
    `1` = "sharing household"
  ),
    chmar = .replace_labels(
    standardized_value_labels$chmar,
    `-6` = "RCF addition"
  ),
    chpart = c(
    `-6` = "RCF addition",
    `-5` = "see Fchstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-2` = "not asked(error)",
    `-1` = "no answer",
    `0` = "no partner",
    `1` = "partner in hh child",
    `2` = "partner outs hh child"
  ),
    chsex = c(`-1` = "unknown", `1` = "son", `2` = "daughter"),
    chstat = c(
    `-1` = "refusal @ A",
    `11` = "ident @ A",
    `12` = "ident @ A (network)",
    `13` = "ident @ F (network)",
    `14` = "(old)ident @ F (network)",
    `15` = "(new)ident @ F (network)",
    `16` = "(old)ident @ F (RCF)"
  ),
    chtrav = c(
    `-6` = "RCF addition",
    `-5` = "see Fchstat",
    `-4` = "deceased",
    `-3` = "contact broken",
    `-1` = "no answer",
    `0` = "no time",
    `30` = "30 minutes",
    `60` = "1 hour",
    `1440` = ">24 hours"
  ),
    chtype = c(
    `-1` = "unknown",
    `1` = "biological child",
    `2` = "step:current partner",
    `3` = "step:former partner",
    `5` = "foster",
    `6` = "step/foster/adoptive"
  ),
    gc = .replace_labels(
    standardized_value_labels$gc,
    `-6` = "RCF addition",
    `3` = "yes(known from A)",
    `4` = "yes(SYS-RCF)",
    `5` = "yes(broken ctc)"
  ),
    nwmem = c(`-1` = "not identified in network")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "chage",
    "chempl",
    "chfreq",
    "chinhh",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "gcage",
    "nwmem"
  )],
    chage = c(`-5` = "RCF/SYS addition", `-3` = "contact broken", `-1` = "no answer"),
    chempl = c(
    `-5` = "RCF/SYS addition",
    `-2` = "not asked: age<16",
    `-1` = "no answer",
    `1` = "not employed",
    `2` = "<=27 hours/week",
    `3` = ">= 28 hours a week"
  ),
    chfreq = c(
    `-5` = "RCF/SYS addition",
    `-1` = "no answer",
    `1` = "never",
    `2` = "yearly or less often",
    `3` = "few times year",
    `4` = "monthly",
    `5` = "once every 2 weeks",
    `6` = "weekly",
    `7` = "few times week",
    `8` = "daily/hh member"
  ),
    chinhh = c(`-1` = "no answer", `0` = "not sharing household", `1` = "sharing household"),
    chpart = c(
    `-5` = "RCF/SYS addition",
    `-2` = "not asked: age<18",
    `-1` = "no answer",
    `0` = "no partner",
    `1` = "partner in hh child",
    `2` = "partner outs hh child"
  ),
    chsex = c(`-5` = "RCF/SYS addition", `-1` = "unknown", `1` = "son", `2` = "daughter"),
    chstat = c(
    `11` = "child+name from network",
    `12` = "child (not name) from network",
    `13` = "child added in interview",
    `14` = "from network, added after interview",
    `15` = "from RCF, added after interview"
  ),
    chtrav = c(
    `-7` = "not asked (child in network, not in top10)",
    `-5` = "RCF/SYS addition",
    `-2` = "not asked (child in network)",
    `-1` = "no answer",
    `0` = "no time",
    `30` = "30 minutes",
    `60` = "1 hour",
    `1440` = ">24 hours"
  ),
    chtype = c(
    `1` = "own child",
    `2` = "step:current partner",
    `3` = "step:former partner",
    `4` = "adoptive",
    `5` = "foster",
    `6` = "step/foster/adoptive",
    `8` = "step (which partner?)",
    `9` = "other person"
  ),
    gcage = c(
    `-5` = "RCF/SYS addition",
    `-4` = "not asked: too young",
    `-3` = "don't know about grandchildren",
    `-2` = "no children from this child",
    `-1` = "no answer"
  ),
    nwmem = .replace_labels(
    standardized_value_labels$nwmem,
    `-2` = "not identified;interview/SYS/RCF addition",
    `-1` = "not identified"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("afstand", "chfreq", "chsex", "partner")],
    chfreq = c(`-1` = "no answer"),
    chsex = c(`-1` = "no answer")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "chage",
    "chbrok",
    "chdead",
    "chempl",
    "chfreq",
    "chinhh",
    "chpart",
    "chsex",
    "chstat",
    "chtrav",
    "chtype",
    "gcage",
    "nwmem"
  )],
    chage = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in KK",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-5` = "RCF/SYS addition",
    `-4` = "not asked: never contact or died",
    `-3` = "contact broken",
    `-1` = "no answer"
  ),
    chbrok = c(
    `-5` = "not asked / unknown",
    `-4` = "deceased",
    `-3` = "not broken & no contact",
    `-2` = "not broken",
    `-1` = "no answer"
  ),
    chdead = c(
    `-5` = "deceased not asked / unknown",
    `-3` = "alive",
    `-2` = "died < observation H or 3B",
    `-1` = "died, no answer year"
  ),
    chempl = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in KK",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-5` = "RCF/SYS addition",
    `-4` = "not asked: never contact or died",
    `-2` = "not asked: age<16",
    `-1` = "no answer",
    `1` = "not employed",
    `2` = "<=27 hours/week",
    `3` = ">= 28 hours a week"
  ),
    chfreq = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in KK",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-5` = "RCF/SYS addition",
    `-4` = "not asked: never contact or died",
    `-2` = "child added after network; not identified in KK",
    `-1` = "no answer",
    `1` = "never",
    `2` = "yearly or less often",
    `3` = "few times year",
    `4` = "monthly",
    `5` = "once every 2 weeks",
    `6` = "weekly",
    `7` = "few times week",
    `8` = "daily/hh member"
  ),
    chinhh = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in KK",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-4` = "not asked: never contact or died",
    `-1` = "no answer",
    `0` = "not sharing household",
    `1` = "sharing household"
  ),
    chpart = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in KK",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-5` = "RCF/SYS addition",
    `-4` = "not asked: never contact or died",
    `-2` = "not asked: age<18",
    `-1` = "no answer",
    `0` = "no partner",
    `1` = "partner in hh child",
    `2` = "partner outs hh child"
  ),
    chsex = .replace_labels(
    standardized_value_labels$chsex,
    `-9` = "in network, not in KK",
    `-5` = "RCF/SYS addition",
    `-1` = "no answer"
  ),
    chstat = c(
    `11` = "child+name from network",
    `12` = "child (not name) from network",
    `13` = "child added in KK interview",
    `14` = "from network, added after NW interview",
    `15` = "SYS/RCF, added after NW/KK interview",
    `16` = "from network, in household, not asked in KK",
    `17` = "from network, in household, added in KK interview",
    `18` = "from network, not in household, added in KK interview",
    `19` = "added in KK interview",
    `20` = "from previous observation (excluding step, adoptive, foster)"
  ),
    chtrav = c(
    `-12` = "deceased",
    `-11` = "not asked: added from previous observation",
    `-10` = "added manually",
    `-9` = "in network, not in KK",
    `-8` = "not asked: skip by interviewer",
    `-7` = "child added in or after interview",
    `-5` = "RCF/SYS addition",
    `-4` = "not asked: never contact or died",
    `-2` = "not asked (child in network)",
    `-1` = "no answer",
    `0` = "no time",
    `30` = "30 minutes",
    `60` = "1 hour",
    `1440` = ">24 hours"
  ),
    chtype = c(
    `1` = "own/biological child",
    `2` = "step: current partner",
    `3` = "step: former partner",
    `4` = "adoptive",
    `5` = "foster",
    `6` = "step/foster/adoptive",
    `8` = "step (which partner?)",
    `9` = "other person"
  ),
    gcage = .replace_labels(
    standardized_value_labels$gcage,
    `-9` = "in network, not in KK",
    `-5` = "RCF/SYS addition",
    `-4` = "not asked: never contact or died",
    `-3` = "don't know about grandchildren",
    `-2` = "no children from this child",
    `-1` = "no answer"
  ),
    nwmem = .replace_labels(
    standardized_value_labels$nwmem,
    `-2` = "not identified;interview/SYS/RCF addition",
    `-1` = "not identified"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  afstand = "numeric",
  chage = "numeric",
  chages = "categorical",
  chbrok = "categorical",
  chdead = "categorical",
  chdiv = "categorical",
  chempl = "categorical",
  chfreq = "categorical",
  chid = "text",
  chinhh = "categorical",
  chmar = "categorical",
  chpart = "categorical",
  chsex = "categorical",
  chstat = "categorical",
  chtrav = "numeric",
  chtype = "categorical",
  datasrc = "categorical",
  domain = "categorical",
  freqran = "numeric",
  gc = "categorical",
  gcage = "numeric",
  nwmem = "text",
  partner = "categorical",
  random = "numeric"
)

.lasa_fc_048 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "048", waves = .lasa_wave_rows()) |>
    .override_label(wave = "E", variable = "chtype", override_value = "echstep") |>
    .override_label(wave = "MB", variable = "afstand", override_value = "afstand") |>
    .override_label(wave = "MB", variable = "chage", override_value = "leeftijd") |>
    .override_label(wave = "MB", variable = "chfreq", override_value = "contact") |>
    .override_label(wave = "MB", variable = "chid", override_value = "kindnr") |>
    .override_label(wave = "MB", variable = "chsex", override_value = "geslacht") |>
    .override_label(wave = "MB", variable = "partner", override_value = "partner"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "048", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "048", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "048", waves = .lasa_wave_rows())
)
