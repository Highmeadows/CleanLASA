## LASA filecode 027 -- variable names, variable labels, value labels,
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
  masmv = "numeric",
  masmv7 = "numeric",
  master1 = "categorical",
  master2 = "categorical",
  master3 = "categorical",
  master4 = "categorical",
  master5 = "categorical",
  master6 = "categorical",
  master7 = "categorical",
  selfes1 = "categorical",
  selfes2 = "categorical",
  selfes3 = "categorical",
  selfes4 = "categorical",
  selfmv = "numeric"
)

# define variable labels ----
variable_labels(
  masmv = "Number of missing values in 5 mastery items",
  masmv7 = "Number of missing values in 7 mastery items",
  master1 = "Mastery item 01: control",
  master2 = "Mastery item 02: problems",
  master3 = "Mastery item 03: changes",
  master4 = "Mastery item 04: helpless",
  master5 = "Mastery item 05: life",
  master6 = "Mastery item 06: everything",
  master7 = "Mastery item 07: future",
  selfes1 = "I am satisfied with myself",
  selfes2 = "I am quite sure of myself",
  selfes3 = "I feel useless at times",
  selfes4 = "I look positive at myself",
  selfmv = "Number of missing values in self-esteem items",
  .applies_to_waves = c("Z")
)

variable_labels(
  "master1", "master2", "master3", "master4", "master5",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "selfes1",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "selfes2", "selfes3", "selfes4",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "master6", "master7",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  masmv = "# missing values mastery items",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  selfmv = "# missing values self-esteem items",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  masmv7 = "# missing values 7 mastery items",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("masmv"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("masmv7"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "na, see RMMAS in LASA227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5", "master6", "master7"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, short/terminated interview / see RMSELF in LASA227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RMSELF in LASA227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("selfmv"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BRMMAS in LASAB227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, short/terminated interview", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see CRMMAS in LASAC227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CRMSELF in LASAC227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see DRMMAS in LASAD227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5", "master6", "master7"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DRMSELF in LASAD227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see ERMMAS in LASAE227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5", "master6", "master7"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ERMSELF in LASAE227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see BRMMAS in LAS2B227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BRMSELF in LAS2B227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see FRMMAS in LASAF227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5", "master6", "master7"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FRMSELF in LASAF227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see GRMMAS in LASAG227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5", "master6", "master7"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GRMSELF in LASAG227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see HRMMAS in LASAH227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5", "master6", "master7"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HRMSELF in LASAH227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see BRMMAS in LAS3B227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BRMSELF in LAS3B227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BRMMAS in LASMB227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-2` = "na, see IRMMAS in LASAI227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5", "master6", "master7"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IRMSELF in LASAI227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see JRMMAS in LASAJ227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5", "master6", "master7"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JRMSELF in LASAJ227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KRMMAS in LASAK227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("master1", "master2", "master3", "master4", "master5", "master6", "master7"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KRMSELF in LASAK227", `-1` = "na, asked", `1` = "strongly disagree", `2` = "disagree", `3` = "no disagreement/agreement", `4` = "agree", `5` = "strongly agree",
  .applies_to_vars = c("selfes1", "selfes2", "selfes3", "selfes4"),
  .applies_to_waves = c("K")
)

.lasa_fc_027 <- .lasa_finalize_fc("027")

