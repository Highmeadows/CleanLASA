## LASA filecode 247 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  sq = "sequence questions on support",
  .applies_to_waves = c("Z")
)

variable_labels(
  "eg", "er", "ig", "ir", "meg", "mer", "mig", "mir", "mis247", "nwsize", "sq",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  confinf = "information on identification confidant",
  confnum = "# confidants identified",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  nwconftype = "confidant relationship type",
  nwdaily = "frequency contact aggregate",
  nwdiversity = "network diversity number roles 0-13",
  nwpctnonkin = "percentage nonkin 0-100",
  .applies_to_waves = c("J", "K")
)

# define value labels ----
value_labels(
  `-1` = "no oth members",
  .applies_to_vars = c("eg", "er", "ig", "ir", "meg", "mer", "mig", "mir", "sq"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no members",
  .applies_to_vars = c("sq"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "no network members",
  .applies_to_vars = c("confinf", "confnum"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version", `-1` = "na, asked", `1` = "no confidant available", `2` = "confidant not necessary", `3` = "confidant(s) identified", `4` = "all are confidant, 0 identified", `5` = "all are confidant + identified", `6` = "other(s) not in network, 0 identified", `7` = "other(s) not in network + identified",
  .applies_to_vars = c("confinf"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version", `-1` = "na, asked", `0` = NA_character_, `1` = NA_character_, `2` = NA_character_, `3` = NA_character_, `4` = NA_character_, `5` = NA_character_, `6` = NA_character_, `7` = NA_character_, `8` = NA_character_, `9` = NA_character_,
  .applies_to_vars = c("confnum"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-6` = "damaged information", `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version", `0` = NA_character_, `36` = NA_character_,
  .applies_to_vars = c("eg", "er", "ig", "ir"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-6` = "damaged information", `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version", `0` = NA_character_, `1` = NA_character_, `2` = NA_character_, `3` = NA_character_,
  .applies_to_vars = c("meg", "mer", "mig", "mir"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `0` = "no missings", `4` = "support skip", `5` = "support terminated", `40` = "characteristics skipped", `44` = ">characteristics skipped", `55` = ">characteristics skipped", `111` = "size=0", `444` = "contactfrequency skipped", `555` = ">contactfrequency terminated", `3333` = "short version", `4444` = "refusal R/skip by Interviewer", `5555` = "terminated", `6666` = "damaged information",
  .applies_to_vars = c("mis247"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version", `-2` = "not asked (observation LSNa; LASAb)", `-1` = "na, asked", `0` = "no network members; no confidant available; confidant not necessary", `1` = "partner is #1 among confidants", `2` = "partner among confidants", `3` = "biological child among confidants", `4` = "non-biological child/child-in-law", `5` = "other kin", `6` = "friend", `7` = "other non-kin/all network members/person not in network",
  .applies_to_vars = c("nwconftype"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-8` = "telephone interview", `-7` = "proxy interview", `-6` = "damaged information", `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version", `0` = "no network members", `1` = "weekly contact", `2` = "several times/week", `3` = "daily contact w/ other than partner", `4` = "partner: living w/ | daily contact",
  .applies_to_vars = c("nwdaily"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-8` = "telephone interview", `-7` = "proxy interview", `-6` = "damaged information", `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version",
  .applies_to_vars = c("nwdiversity"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-8` = "telephone interview", `-7` = "proxy interview", `-6` = "damaged information", `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version", `0` = NA_character_, `100` = NA_character_,
  .applies_to_vars = c("nwpctnonkin"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-6` = "damaged information", `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version", `0` = NA_character_, `1` = NA_character_, `10` = NA_character_, `20` = NA_character_, `30` = NA_character_, `40` = NA_character_, `50` = NA_character_, `60` = NA_character_, `70` = NA_character_, `80` = NA_character_,
  .applies_to_vars = c("nwsize"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-6` = "damaged information", `-5` = "terminated", `-4` = "refusal R/skip by Interviewer", `-3` = "short version",
  .applies_to_vars = c("sq"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

.lasa_fc_247 <- .lasa_finalize_fc("247")

