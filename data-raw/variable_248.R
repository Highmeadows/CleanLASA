## LASA filecode 248 -- variable names, variable labels, value labels,
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
  `048stat` = "categorical",
  ch_aliv = "numeric",
  child = "categorical",
  choth = "numeric",
  chown = "numeric",
  chstep = "numeric",
  data048 = "categorical",
  nc_volu = "categorical",
  nchild = "numeric",
  nrecs048 = "numeric"
)

# define variable labels ----
variable_labels(
  `048stat` = "Status of children data collection (048)",
  ch_aliv = "Number of children alive",
  child = "Parental status based on children data",
  choth = "Number of other children alive (unknown/adoptive/foster)",
  chown = "Number of own children alive",
  chstep = "Number of stepchildren alive",
  data048 = "Availability/status of children data (048)",
  nc_volu = "Reason for childlessness",
  nchild = "Number of children",
  nrecs048 = "Number of children (medical interview)",
  .applies_to_waves = c("Z")
)

variable_labels(
  data048 = "availability data 048",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  `048stat` = "status data collected b048",
  child = "parental status (based on b048)",
  choth = "# other (type unknown, adopt, foster) (alive)",
  chown = "# own children (alive)",
  chstep = "# step children (alive)",
  nc_volu = "reason for childlessness",
  .applies_to_waves = c("2B", "3B")
)

variable_labels(
  ch_aliv = "number of children alive",
  nchild = "number of children",
  .applies_to_waves = c("2B")
)

variable_labels(
  ch_aliv = "number of children alive (biological, step, adoptive, foster)",
  nchild = "number of children ever (biological, step, adoptive, foster)",
  .applies_to_waves = c("3B")
)

variable_labels(
  nchild = "number of children (questions in demographic part f-t-f interview)",
  nrecs048 = "number of children (questions in medical interview)",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-3` = "interview terminated", `-2` = "refusal", `-1` = "no children", `1` = "children in b048", `2` = "children in b048, incomplete/unknown", `3` = "children in b048, incomplete: foster children", `4` = "children in b048, incomplete: refusal questions on children", `5` = "children in b048, incomplete: refusal questions on stepchildren",
  .applies_to_vars = c("048stat"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `0` = NA_character_, `4` = NA_character_, `6` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("ch_aliv"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer on children", `0` = "childless", `1` = "yes; no specific information", `2` = "yes, own children", `3` = "yes, stepchildren", `4` = "yes, own and stepchildren", `5` = "yes, only other children",
  .applies_to_vars = c("child"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "number unknown/no specific information", `-1` = "no answer/refusal/interview terminated", `0` = NA_character_, `1` = NA_character_, `4` = NA_character_, `6` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("choth", "chown", "chstep"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "all children died", `-4` = "no children", `-3` = "data unavailable due refusal/interview outcome", `-2` = "short/nonstandard interview", `-1` = "LSAdc", `1` = "children data/questions available", `2` = "no children", `3` = "refusal", `4` = "short version", `5` = "born < 1938",
  .applies_to_vars = c("data048"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not childless (answer)", `-2` = "not childless / not asked", `-1` = "na, asked", `1` = "choice", `2` = "no suitable partner available", `3` = "inadequate life circumstances", `4` = "medical reasons", `5` = "no choice other", `6` = "homosexual",
  .applies_to_vars = c("nc_volu"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "skip questions children", `-1` = "na, asked", `0` = NA_character_, `1` = NA_character_, `4` = NA_character_, `6` = NA_character_, `10` = NA_character_, `13` = NA_character_,
  .applies_to_vars = c("nchild"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "questions 048 not asked", `-1` = "na, asked", `0` = NA_character_, `1` = NA_character_, `13` = NA_character_,
  .applies_to_vars = c("nrecs048"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-5` = "all children died", `-4` = "no children", `-3` = "refusal", `-2` = "short/terminated interview", `-1` = "LSAdc", `1` = "data children",
  .applies_to_vars = c("data048"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "terminated", `-2` = "refusal", `-1` = "no children", `1` = "children in a048", `2` = "children in b048, incomplete: type unknown", `3` = "children in b048, incomplete: foster children",
  .applies_to_vars = c("048stat"),
  .applies_to_waves = c("2B")
)

value_labels(
  `0` = NA_character_, `4` = NA_character_, `6` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("ch_aliv", "nchild"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-1` = "children?", `0` = "childless", `1` = "yes; no specific information", `2` = "yes, own", `3` = "yes, step", `4` = "yes, own + step", `5` = "yes, only other",
  .applies_to_vars = c("child"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "no specific information", `0` = NA_character_, `4` = NA_character_, `6` = NA_character_, `10` = NA_character_,
  .applies_to_vars = c("choth", "chown", "chstep"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "not childless", `-1` = "no answer", `1` = "choice", `2` = "no partner available", `3` = "inadequate life circumstances", `4` = "medical reasons", `5` = "no choice other",
  .applies_to_vars = c("nc_volu"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "terminated interview", `-2` = "short version", `1` = "questions asked", `2` = "no children", `3` = "refusal", `4` = "short version", `5` = "born < 1938",
  .applies_to_vars = c("data048"),
  .applies_to_waves = c("F")
)

value_labels(
  `-3` = "interview terminated", `-2` = "refusal on question about number of children", `-1` = "no children", `1` = "children in b048", `2` = "children in b048, incomplete: reason/type unknown", `4` = "children in b048, incomplete: refusal questions on children", `5` = "children in b048, incomplete: refusal questions on stepchildren",
  .applies_to_vars = c("048stat"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("ch_aliv", "nchild"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-1` = "children? (no answer)", `0` = "childless", `1` = "yes; no specific information", `2` = "yes, own", `3` = "yes, step", `4` = "yes, own + step", `5` = "yes, only other",
  .applies_to_vars = c("child"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "children in this category, number unknown", `-1` = "no answer/refusal/interview terminated", `0` = NA_character_, `1` = NA_character_,
  .applies_to_vars = c("choth", "chown", "chstep"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "not childless (answer)", `-2` = "not childless (not asked)", `-1` = "na, asked", `1` = "choice", `2` = "no or not right partner available", `3` = "inadequate life circumstances", `4` = "medical reasons (fertility, illness)", `5` = "no choice other", `6` = "homosexual",
  .applies_to_vars = c("nc_volu"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "skip questions children", `-1` = "no answer question no/yes children", `0` = NA_character_, `1` = NA_character_, `13` = NA_character_,
  .applies_to_vars = c("nchild"),
  .applies_to_waves = c("MB")
)

.lasa_fc_248 <- .lasa_finalize_fc("248")

