## LASA filecode 048 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  random = "random number, used in ranking ties",
  .applies_to_waves = c("Z")
)

variable_labels(
  "domain", "freqran", "random",
  .applies_to_waves = c("C")
)

variable_labels(
  "chages",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  "chbrok", "chdead",
  .applies_to_waves = c("E", "F", "I")
)

variable_labels(
  "chfreq", "chid", "chsex",
  .applies_to_waves = c("E", "2B", "F", "3B", "MB", "I")
)

variable_labels(
  "chinhh", "chpart", "chtrav", "chtype",
  .applies_to_waves = c("E", "2B", "F", "3B", "I")
)

variable_labels(
  "gcage",
  .applies_to_waves = c("E", "2B", "3B", "I")
)

variable_labels(
  "chage", "chempl", "chstat",
  .applies_to_waves = c("2B", "3B", "I")
)

variable_labels(
  "datasrc",
  .applies_to_waves = c("2B")
)

variable_labels(
  "nwmem",
  .applies_to_waves = c("2B", "F", "3B", "I")
)

variable_labels(
  "chdiv", "chmar", "gc",
  .applies_to_waves = c("F")
)

variable_labels(
  "afstand", "partner",
  .applies_to_waves = c("MB")
)

variable_labels(
  nwmem = "network member id T3",
  .applies_to_waves = c("C")
)

variable_labels(
  chage = "age child (@ time: see ECHAGES)",
  .applies_to_waves = c("E")
)

variable_labels(
  chempl = "no/part/fulltime work child",
  chstat = "status child identification",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  chbrok = "contact broken",
  .applies_to_waves = c("2B")
)

variable_labels(
  chage = "age child @ wave A | wave F (see fchages)",
  .applies_to_waves = c("F")
)

variable_labels(
  chage = "age",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-12` = "deceased", `-11` = "not asked: added from previous observation", `-10` = "added manually", `-8` = "not asked: skip by interviewer",
  .applies_to_vars = c("chage", "chempl", "chfreq", "chinhh", "chpart", "chsex", "chtrav", "gcage"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("afstand", "partner"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-9` = "in network, not in kk", `-7` = "child added in or after interview", `-6` = "rcf addition", `-5` = "label varies by wave", `-4` = "na, short interview", `-3` = "contact broken", `-1` = "na, asked",
  .applies_to_vars = c("chage"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "rcf addition", `-4` = "deceased", `-2` = "not asked(error)", `1` = "asked lasadc", `2` = "label varies by wave", `3` = "lsna 1992",
  .applies_to_vars = c("chages"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "label varies by wave", `-4` = "deceased", `-3` = "not broken & no contact", `-2` = "not available, routing", `-1` = "na, asked", `1` = "label varies by wave", `2` = "broken", `3` = "other",
  .applies_to_vars = c("chbrok"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "deceased dbf:died", `-5` = "deceased not asked/unknown", `-3` = "alive", `-2` = "not available, routing", `-1` = "na, asked", `0` = "not deceased", `1` = "before wave a", `3` = "before wave c", `4` = "before wave d",
  .applies_to_vars = c("chdead"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "rcf addition", `-5` = "currently divorced", `-4` = "died", `-3` = "never married", `-2` = "age<18yrs", `-1` = "na, asked", `1` = "no previous marriage", `2` = "ended by divorce", `3` = "ended by widowhood", `4` = "1+prev partner relationship", `6` = "3+eerdere p-rel",
  .applies_to_vars = c("chdiv"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "in network, not in kk", `-7` = "child added in or after interview", `-6` = "rcf addition", `-5` = "label varies by wave", `-4` = "na, short interview", `-3` = "contact broken", `-2` = "not available, routing", `-1` = "na, asked", `1` = "not employed", `2` = "<=27 hours/week", `3` = ">= 28 hours a week",
  .applies_to_vars = c("chempl"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "in network, not in kk", `-7` = "child added in or after interview", `-6` = "rcf addition", `-5` = "label varies by wave", `-4` = "na, short interview", `-3` = "contact broken", `-2` = "child added after network; not identified in kk", `-1` = "na, asked", `1` = "never", `2` = "yearly or less often", `3` = "few times year", `4` = "monthly", `5` = "once every 2 weeks", `6` = "weekly", `7` = "few times week", `8` = "daily/hh member",
  .applies_to_vars = c("chfreq"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "in network, not in kk", `-7` = "child added in or after interview", `-5` = "label varies by wave", `-4` = "na, short interview", `-3` = "contact broken", `-2` = "not (not asked)", `-1` = "na, asked", `0` = "not sharing household", `1` = "sharing household",
  .applies_to_vars = c("chinhh"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "rcf addition", `-4` = "died", `-2` = "age<18yrs", `-1` = "na, asked", `1` = "never married", `2` = "married", `3` = "registered partnership", `4` = "divorced", `5` = "widowhood",
  .applies_to_vars = c("chmar"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "in network, not in kk", `-7` = "child added in or after interview", `-6` = "rcf addition", `-5` = "label varies by wave", `-4` = "na, short interview", `-3` = "contact broken", `-2` = "not available, routing", `-1` = "na, asked", `0` = "no partner", `1` = "partner in hh child", `2` = "partner outs hh child",
  .applies_to_vars = c("chpart"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "in network, not in kk", `-7` = "child added in or after interview", `-5` = "rcf/sys addition", `-4` = "not asked: never contact or died", `-1` = "na, asked", `1` = "son", `2` = "daughter",
  .applies_to_vars = c("chsex"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "refusal @ a", `0` = "identified, new", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "label varies by wave", `8` = "label varies by wave", `9` = "label varies by wave", `10` = "label varies by wave", `11` = "label varies by wave", `12` = "label varies by wave", `13` = "label varies by wave", `14` = "label varies by wave", `15` = "label varies by wave", `16` = "label varies by wave", `17` = "from network, in household, added in kk interview", `18` = "from network, not in household, added in kk interview", `19` = "added in kk interview", `20` = "from previous observation (excluding step, adoptive, foster)", `99` = "added:rcf/sys",
  .applies_to_vars = c("chstat"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "in network, not in kk", `-7` = "label varies by wave", `-6` = "rcf addition", `-5` = "label varies by wave", `-4` = "na, short interview", `-3` = "contact broken", `-2` = "not asked (child in network)", `-1` = "na, asked", `0` = "no time", `30` = "30 minutes", `60` = "1 hour", `1440` = ">24 hours",
  .applies_to_vars = c("chtrav"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "label varies by wave", `-3` = "contact broken", `-1` = "unknown", `1` = "own/biological child", `2` = "step: current partner", `3` = "step: former partner", `4` = "adoptive", `5` = "foster", `6` = "step/foster/adoptive", `8` = "step (which partner?)", `9` = "other person",
  .applies_to_vars = c("chtype"),
  .applies_to_waves = c("Z")
)

value_labels(
  `11111` = "source: sex type inhh freq trav from network", `11112` = "trav asked", `11113` = "trav asked changed", `11121` = "freq asked", `11122` = "freq+trav asked", `11211` = "inhh asked", `11212` = "inhh+trav asked", `11222` = "inhh+freq+trav asked", `11311` = "inhh changed", `12111` = "type asked", `12112` = "type+trav asked", `13111` = "type asked changed", `22222` = "asked", `22223` = "asked;trav changed", `22232` = "asked;freq changed", `33333` = "asked,changed", `44444` = "rcf/sys addition",
  .applies_to_vars = c("datasrc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "household", `2` = "children/-in-law", `3` = "other kin", `4` = "neighborhood", `5` = "work/school", `6` = "organizations", `7` = "other non-kin", `8` = "forgotten", `9` = "system addition", `10` = "rcf addition",
  .applies_to_vars = c("domain"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "sys/rcf addition", `-1` = "exists?,del by iter", `1` = NA_character_, `2` = NA_character_, `11` = ">10 not selected",
  .applies_to_vars = c("freqran"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "rcf addition", `-4` = "deceased", `-2` = "age<16", `-1` = "na, asked", `0` = "f048:yes f049:no", `1` = "f048:no", `2` = "yes(asked)", `3` = "yes(known from a)", `4` = "yes(sys-rcf)", `5` = "yes(broken contact)", `6` = "yes(broken;no f049)", `7` = "yes(miss #;no f049)", `8` = "yes(error;no f049)",
  .applies_to_vars = c("gc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "in network, not in kk", `-7` = "child added in or after interview", `-5` = "label varies by wave", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("gcage"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "missing network", `-4` = "identified;age 0-17", `-3` = "not identified;age 0-17", `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("nwmem"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "sys/rcf addition", `0` = NA_character_, `99` = NA_character_,
  .applies_to_vars = c("random"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "household", `2` = "children/-in-law", `3` = "other kin", `4` = "neighborhood", `5` = "work/school", `6` = "organizations", `7` = "other non-kin", `8` = "forgotten", `9` = "SYSTEM addition", `10` = "RCF addition",
  .applies_to_vars = c("domain"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "SYS/RCF addition", `-1` = "exists?,del by iter", `1` = NA_character_, `2` = NA_character_, `11` = ">10 not selected",
  .applies_to_vars = c("freqran"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "SYS/RCF addition", `0` = NA_character_, `99` = NA_character_,
  .applies_to_vars = c("random"),
  .applies_to_waves = c("C")
)

value_labels(
  `-5` = "see Echstat", `-4` = "deceased", `-3` = "contact broken", `-1` = "no answer",
  .applies_to_vars = c("chage"),
  .applies_to_waves = c("E")
)

value_labels(
  `-4` = "deceased", `-2` = "not asked(error)", `1` = "asked LASAdc", `2` = "asked LASAe", `3` = "LSNa 1992",
  .applies_to_vars = c("chages"),
  .applies_to_waves = c("E")
)

value_labels(
  `-4` = "deceased", `-3` = "not broken&no ctc", `-2` = "not broken", `-1` = "no answer", `1` = "broken, year?",
  .applies_to_vars = c("chbrok"),
  .applies_to_waves = c("E")
)

value_labels(
  `-9` = "deceased dbf:died", `-3` = "alive", `-2` = "died<=LASAd", `-1` = "no answer year", `0` = "not deceased", `1` = "before wave A", `3` = "before wave C", `4` = "before wave D",
  .applies_to_vars = c("chdead"),
  .applies_to_waves = c("E")
)

value_labels(
  `-5` = "see Echstat", `-4` = "deceased", `-3` = "contact broken", `-2` = "not asked(error)", `-1` = "no answer", `1` = "not employed", `2` = "<=27 hours/week", `3` = ">= 28 hours a week",
  .applies_to_vars = c("chempl"),
  .applies_to_waves = c("E")
)

value_labels(
  `-5` = "see Echstat", `-4` = "deceased", `-3` = "contact broken", `-1` = "no answer", `1` = "never", `2` = "yearly or less often", `3` = "few times year", `4` = "monthly", `5` = "once every 2 weeks", `6` = "weekly", `7` = "few times week", `8` = "daily/hh member",
  .applies_to_vars = c("chfreq"),
  .applies_to_waves = c("E")
)

value_labels(
  `-5` = "see Echstat", `-4` = "deceased", `-3` = "contact broken", `-2` = "not (not asked)", `-1` = "no answer", `0` = "not sharing household", `1` = "sharing household",
  .applies_to_vars = c("chinhh"),
  .applies_to_waves = c("E")
)

value_labels(
  `-5` = "see Echstat", `-4` = "deceased", `-3` = "contact broken", `-2` = "not asked(error)", `-1` = "no answer", `0` = "no partner", `1` = "partner in hh child", `2` = "partner outs hh child",
  .applies_to_vars = c("chpart"),
  .applies_to_waves = c("E")
)

value_labels(
  `-1` = "unknown", `1` = "son", `2` = "daughter",
  .applies_to_vars = c("chsex"),
  .applies_to_waves = c("E", "F")
)

value_labels(
  `0` = "identified, new", `1` = "identified, match", `2` = "not id:forgotten", `3` = "not id:died", `4` = "not id:died<wave D", `5` = "not id:contact broken", `6` = "not id&<>lasaz047", `7` = "!not id:reason unclear", `8` = "!not id:Q not understood", `9` = "!not id:refusal", `10` = "identified<wave E", `11` = "identified@wave E",
  .applies_to_vars = c("chstat"),
  .applies_to_waves = c("E")
)

value_labels(
  `-5` = "see Echstat", `-4` = "deceased", `-3` = "contact broken", `-1` = "no answer", `0` = "no time", `30` = "30 minutes", `60` = "1 hour", `1440` = ">24 hours",
  .applies_to_vars = c("chtrav"),
  .applies_to_waves = c("E")
)

value_labels(
  `-5` = "see Echstat", `-3` = "contact broken", `1` = "own child", `2` = "step:current partner", `3` = "step:former partner", `5` = "foster", `6` = "step/foster/adoptive",
  .applies_to_vars = c("chtype"),
  .applies_to_waves = c("E")
)

value_labels(
  `-5` = "see Echstat", `-4` = "parent deceased", `-3` = "contact broken", `-2` = "no children", `-1` = "no answer",
  .applies_to_vars = c("gcage"),
  .applies_to_waves = c("E")
)

value_labels(
  `-5` = "RCF/SYS addition", `-4` = "deceased", `-3` = "contact broken", `-1` = "no answer",
  .applies_to_vars = c("chage"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-2` = "not asked (freq<>1)", `1` = "not broken", `2` = "broken", `3` = "other",
  .applies_to_vars = c("chbrok"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "RCF addition", `-2` = "not asked: age<16", `-1` = "no answer", `1` = "not employed", `2` = "<=27 hours/week", `3` = ">= 28 hours a week",
  .applies_to_vars = c("chempl"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-1` = "no answer", `1` = "never", `2` = "yearly or less often", `3` = "few times year", `4` = "monthly", `5` = "once every 2 weeks", `6` = "weekly", `7` = "few times week", `8` = "daily/hh member",
  .applies_to_vars = c("chfreq"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-1` = "no answer", `0` = "not sharing household", `1` = "sharing household",
  .applies_to_vars = c("chinhh"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-2` = "not asked: age<18", `-1` = "no answer", `0` = "no partner", `1` = "partner in hh child", `2` = "partner outs hh child",
  .applies_to_vars = c("chpart"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-1` = "unknown", `1` = "son", `2` = "daughter",
  .applies_to_vars = c("chsex"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `1` = "identified in interview", `2` = "added:iter error", `3` = "added:R error", `4` = "added:refusal", `5` = "added:no contact", `6` = "added:no ctc w/ mother", `7` = "added:step", `8` = "added:in household", `9` = "added:foster", `10` = "added:young child", `99` = "added:RCF/SYS",
  .applies_to_vars = c("chstat"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-1` = "no answer", `0` = "no time", `30` = "30 minutes", `60` = "1 hour", `1440` = ">24 hours",
  .applies_to_vars = c("chtrav"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-3` = "contact broken", `1` = "own child", `2` = "step:current partner", `3` = "step:former partner", `4` = "adoptive", `5` = "foster", `6` = "step/foster/adoptive",
  .applies_to_vars = c("chtype"),
  .applies_to_waves = c("2B")
)

value_labels(
  `11111` = "source: sex type inhh freq trav from network", `11112` = "trav asked", `11113` = "trav asked changed", `11121` = "freq asked", `11122` = "freq+trav asked", `11211` = "inhh asked", `11212` = "inhh+trav asked", `11222` = "inhh+freq+trav asked", `11311` = "inhh changed", `12111` = "type asked", `12112` = "type+trav asked", `13111` = "type asked changed", `22222` = "asked", `22223` = "asked;trav changed", `22232` = "asked;freq changed", `33333` = "asked,changed", `44444` = "RCF/SYS addition",
  .applies_to_vars = c("datasrc"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-4` = "not asked: age<16", `-3` = "no answer children", `-2` = "no children", `-1` = "no answer age",
  .applies_to_vars = c("gcage"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "missing network", `-4` = "identified;age 0-17", `-3` = "not identified;age 0-17", `-2` = "not identified;SYS/RCF addition", `-1` = "not identified",
  .applies_to_vars = c("nwmem"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-6` = "RCF addition", `-5` = "see Fchstat", `-4` = "deceased", `-3` = "contact broken", `-1` = "no answer",
  .applies_to_vars = c("chage"),
  .applies_to_waves = c("F")
)

value_labels(
  `-6` = "RCF addition", `-4` = "deceased", `-2` = "not asked(error)", `2` = "asked KK",
  .applies_to_vars = c("chages"),
  .applies_to_waves = c("F")
)

value_labels(
  `-4` = "deceased", `-3` = "not broken&no ctc", `-2` = "not broken", `-1` = "unknown", `1` = "broken, year?",
  .applies_to_vars = c("chbrok"),
  .applies_to_waves = c("F")
)

value_labels(
  `-9` = "deceased dbf:died", `-3` = "alive", `-2` = "ctc broken", `-1` = "no answer year", `0` = "not deceased", `1` = "before wave A", `3` = "before wave C", `4` = "before wave D",
  .applies_to_vars = c("chdead"),
  .applies_to_waves = c("F")
)

value_labels(
  `-6` = "RCF addition", `-5` = "currently divorced", `-4` = "died", `-3` = "never married", `-2` = "age<18yrs", `-1` = "na, asked", `1` = "no previous marriage", `2` = "ended by divorce", `3` = "ended by widowhood", `4` = "1+prev partner relationship", `6` = "3+eerdere p-rel",
  .applies_to_vars = c("chdiv"),
  .applies_to_waves = c("F")
)

value_labels(
  `-6` = "RCF addition", `-5` = "see Fchstat", `-4` = "deceased", `-3` = "contact broken", `-2` = "not asked(error)", `-1` = "no answer", `1` = "not employed", `2` = "<=27 hours/week", `3` = ">= 28 hours a week",
  .applies_to_vars = c("chempl"),
  .applies_to_waves = c("F")
)

value_labels(
  `-6` = "RCF addition", `-5` = "see Fchstat", `-4` = "deceased", `-3` = "contact broken", `-1` = "no answer", `1` = "never", `2` = "yearly or less often", `3` = "few times year", `4` = "monthly", `5` = "once every 2 weeks", `6` = "weekly", `7` = "few times week", `8` = "daily/hh member",
  .applies_to_vars = c("chfreq"),
  .applies_to_waves = c("F")
)

value_labels(
  `-5` = "see Fchstat", `-4` = "deceased", `-3` = "contact broken", `-2` = "not (not asked)", `-1` = "no answer", `0` = "not sharing household", `1` = "sharing household",
  .applies_to_vars = c("chinhh"),
  .applies_to_waves = c("F")
)

value_labels(
  `-6` = "RCF addition", `-4` = "died", `-2` = "age<18yrs", `-1` = "na, asked", `1` = "never married", `2` = "married", `3` = "registered partnership", `4` = "divorced", `5` = "widowhood",
  .applies_to_vars = c("chmar"),
  .applies_to_waves = c("F")
)

value_labels(
  `-6` = "RCF addition", `-5` = "see Fchstat", `-4` = "deceased", `-3` = "contact broken", `-2` = "not asked(error)", `-1` = "no answer", `0` = "no partner", `1` = "partner in hh child", `2` = "partner outs hh child",
  .applies_to_vars = c("chpart"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "refusal @ A", `11` = "ident @ A", `12` = "ident @ A (network)", `13` = "ident @ F (network)", `14` = "(old)ident @ F (network)", `15` = "(new)ident @ F (network)", `16` = "(old)ident @ F (RCF)",
  .applies_to_vars = c("chstat"),
  .applies_to_waves = c("F")
)

value_labels(
  `-6` = "RCF addition", `-5` = "see Fchstat", `-4` = "deceased", `-3` = "contact broken", `-1` = "no answer", `0` = "no time", `30` = "30 minutes", `60` = "1 hour", `1440` = ">24 hours",
  .applies_to_vars = c("chtrav"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "unknown", `1` = "biological child", `2` = "step:current partner", `3` = "step:former partner", `5` = "foster", `6` = "step/foster/adoptive",
  .applies_to_vars = c("chtype"),
  .applies_to_waves = c("F")
)

value_labels(
  `-6` = "RCF addition", `-4` = "deceased", `-2` = "age<16", `-1` = "na, asked", `0` = "f048:yes f049:no", `1` = "f048:no", `2` = "yes(asked)", `3` = "yes(known from A)", `4` = "yes(SYS-RCF)", `5` = "yes(broken ctc)", `6` = "yes(broken;no f049)", `7` = "yes(miss #;no f049)", `8` = "yes(error;no f049)",
  .applies_to_vars = c("gc"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "not identified in network",
  .applies_to_vars = c("nwmem"),
  .applies_to_waves = c("F")
)

value_labels(
  `-5` = "RCF/SYS addition", `-3` = "contact broken", `-1` = "no answer",
  .applies_to_vars = c("chage"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-2` = "not asked: age<16", `-1` = "no answer", `1` = "not employed", `2` = "<=27 hours/week", `3` = ">= 28 hours a week",
  .applies_to_vars = c("chempl"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-1` = "no answer", `0` = "not sharing household", `1` = "sharing household",
  .applies_to_vars = c("chinhh"),
  .applies_to_waves = c("3B")
)

value_labels(
  `11` = "child+name from network", `12` = "child (not name) from network", `13` = "child added in interview", `14` = "from network, added after interview", `15` = "from RCF, added after interview",
  .applies_to_vars = c("chstat"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-7` = "not asked (child in network, not in top10)", `-5` = "RCF/SYS addition", `-2` = "not asked (child in network)", `-1` = "no answer", `0` = "no time", `30` = "30 minutes", `60` = "1 hour", `1440` = ">24 hours",
  .applies_to_vars = c("chtrav"),
  .applies_to_waves = c("3B")
)

value_labels(
  `1` = "own child", `2` = "step:current partner", `3` = "step:former partner", `4` = "adoptive", `5` = "foster", `6` = "step/foster/adoptive", `8` = "step (which partner?)", `9` = "other person",
  .applies_to_vars = c("chtype"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-5` = "RCF/SYS addition", `-4` = "not asked: too young", `-3` = "don't know about grandchildren", `-2` = "no children from this child", `-1` = "no answer",
  .applies_to_vars = c("gcage"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-5` = "missing network", `-4` = "identified;age 0-17", `-3` = "not identified;age 0-17", `-2` = "not identified;interview/SYS/RCF addition", `-1` = "not identified",
  .applies_to_vars = c("nwmem"),
  .applies_to_waves = c("3B", "I")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("chfreq", "chsex"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-9` = "in network, not in KK", `-7` = "child added in or after interview", `-5` = "RCF/SYS addition", `-4` = "not asked: never contact or died", `-3` = "contact broken", `-1` = "no answer",
  .applies_to_vars = c("chage"),
  .applies_to_waves = c("I")
)

value_labels(
  `-5` = "not asked / unknown", `-4` = "deceased", `-3` = "not broken & no contact", `-2` = "not broken", `-1` = "no answer",
  .applies_to_vars = c("chbrok"),
  .applies_to_waves = c("I")
)

value_labels(
  `-5` = "deceased not asked / unknown", `-3` = "alive", `-2` = "died < observation H or 3B", `-1` = "died, no answer year",
  .applies_to_vars = c("chdead"),
  .applies_to_waves = c("I")
)

value_labels(
  `-9` = "in network, not in KK", `-7` = "child added in or after interview", `-5` = "RCF/SYS addition", `-4` = "not asked: never contact or died", `-2` = "not asked: age<16", `-1` = "no answer", `1` = "not employed", `2` = "<=27 hours/week", `3` = ">= 28 hours a week",
  .applies_to_vars = c("chempl"),
  .applies_to_waves = c("I")
)

value_labels(
  `-9` = "in network, not in KK", `-7` = "child added in or after interview", `-5` = "RCF/SYS addition", `-4` = "not asked: never contact or died", `-2` = "child added after network; not identified in KK", `-1` = "no answer", `1` = "never", `2` = "yearly or less often", `3` = "few times year", `4` = "monthly", `5` = "once every 2 weeks", `6` = "weekly", `7` = "few times week", `8` = "daily/hh member",
  .applies_to_vars = c("chfreq"),
  .applies_to_waves = c("I")
)

value_labels(
  `-9` = "in network, not in KK", `-7` = "child added in or after interview", `-4` = "not asked: never contact or died", `-1` = "no answer", `0` = "not sharing household", `1` = "sharing household",
  .applies_to_vars = c("chinhh"),
  .applies_to_waves = c("I")
)

value_labels(
  `-9` = "in network, not in KK", `-7` = "child added in or after interview", `-5` = "RCF/SYS addition", `-4` = "not asked: never contact or died", `-2` = "not asked: age<18", `-1` = "no answer", `0` = "no partner", `1` = "partner in hh child", `2` = "partner outs hh child",
  .applies_to_vars = c("chpart"),
  .applies_to_waves = c("I")
)

value_labels(
  `-9` = "in network, not in KK", `-7` = "child added in or after interview", `-5` = "RCF/SYS addition", `-4` = "not asked: never contact or died", `-1` = "no answer", `1` = "son", `2` = "daughter",
  .applies_to_vars = c("chsex"),
  .applies_to_waves = c("I")
)

value_labels(
  `11` = "child+name from network", `12` = "child (not name) from network", `13` = "child added in KK interview", `14` = "from network, added after NW interview", `15` = "SYS/RCF, added after NW/KK interview", `16` = "from network, in household, not asked in KK", `17` = "from network, in household, added in KK interview", `18` = "from network, not in household, added in KK interview", `19` = "added in KK interview", `20` = "from previous observation (excluding step, adoptive, foster)",
  .applies_to_vars = c("chstat"),
  .applies_to_waves = c("I")
)

value_labels(
  `-9` = "in network, not in KK", `-7` = "child added in or after interview", `-5` = "RCF/SYS addition", `-4` = "not asked: never contact or died", `-2` = "not asked (child in network)", `-1` = "no answer", `0` = "no time", `30` = "30 minutes", `60` = "1 hour", `1440` = ">24 hours",
  .applies_to_vars = c("chtrav"),
  .applies_to_waves = c("I")
)

value_labels(
  `1` = "own/biological child", `2` = "step: current partner", `3` = "step: former partner", `4` = "adoptive", `5` = "foster", `6` = "step/foster/adoptive", `8` = "step (which partner?)", `9` = "other person",
  .applies_to_vars = c("chtype"),
  .applies_to_waves = c("I")
)

value_labels(
  `-9` = "in network, not in KK", `-7` = "child added in or after interview", `-5` = "RCF/SYS addition", `-4` = "not asked: never contact or died", `-3` = "don't know about grandchildren", `-2` = "no children from this child", `-1` = "no answer",
  .applies_to_vars = c("gcage"),
  .applies_to_waves = c("I")
)

.lasa_fc_048 <- .lasa_finalize_fc("048")
.lasa_fc_048$variables <- .lasa_fc_048$variables |>
  .override_label(wave = "E", variable = "chtype", override_value = "echstep") |>
  .override_label(wave = "MB", variable = "afstand", override_value = "afstand") |>
  .override_label(wave = "MB", variable = "chage", override_value = "leeftijd") |>
  .override_label(wave = "MB", variable = "chfreq", override_value = "contact") |>
  .override_label(wave = "MB", variable = "chid", override_value = "kindnr") |>
  .override_label(wave = "MB", variable = "chsex", override_value = "geslacht") |>
  .override_label(wave = "MB", variable = "partner", override_value = "partner")

