## LASA filecode 191 -- variable names, variable labels, value labels,
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
  macl = "numeric",
  maclst = "numeric",
  macr = "numeric",
  macrst = "numeric",
  mrm191 = "categorical",
  mrm191_1 = "categorical",
  mrm191_10 = "categorical",
  mrm191_2 = "categorical",
  mrm191_3 = "categorical",
  mrm191_4 = "categorical",
  mrm191_5 = "categorical",
  mrm191_6 = "categorical",
  mrm191_7 = "categorical",
  mrm191_8 = "categorical",
  mrm191_9 = "categorical",
  mrm191_rem = "text",
  mrm191s1 = "categorical",
  mrm191s2 = "categorical",
  mvasl = "numeric",
  mvaslst = "numeric",
  mvasr = "numeric",
  mvasrst = "numeric"
)

# define variable labels ----
variable_labels(
  macl = "number of lines read correctly (left eye)",
  maclst = "number of lines read correctly (left eye pinhole)",
  macr = "number of lines read correctly (right eye)",
  macrst = "number of lines read correctly (right eye pinhole)",
  mrm191 = "reason missing (partial) data",
  mrm191_1 = "reason missing: blind rightside",
  mrm191_10 = "reason missing: equipment failure",
  mrm191_2 = "reason missing: blind leftside",
  mrm191_3 = "reason missing: mentally unable",
  mrm191_4 = "reason missing: physically unable",
  mrm191_5 = "reason missing: aphasia",
  mrm191_6 = "reason missing: illiterate",
  mrm191_7 = "reason missing: refused",
  mrm191_8 = "reason missing: short interview",
  mrm191_9 = "reason missing: insufficient light",
  mrm191_rem = "remarks reason missing (partial) data",
  mrm191s1 = "specification reason missing: blind rightside",
  mrm191s2 = "specification reason missing: blind leftside",
  mvasl = "Visual Acuity Score, number of letters read correctly (left eye)",
  mvaslst = "Visual Acuity Score, number of letters read correctly (left eye pinhole)",
  mvasr = "Visual Acuity Score, number of letters read correctly (right eye)",
  mvasrst = "Visual Acuity Score, number of letters read correctly (right eye pinhole)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "macl", "maclst", "macr", "macrst",
  .applies_to_waves = c("E", "H", "3B")
)

variable_labels(
  "mrm191",
  .applies_to_waves = c("E", "F", "G")
)

variable_labels(
  "mrm191_rem",
  .applies_to_waves = c("E")
)

variable_labels(
  "mvasl", "mvaslst", "mvasr", "mvasrst",
  .applies_to_waves = c("E", "F", "G", "H", "3B")
)

variable_labels(
  "mrm191_1", "mrm191_10", "mrm191_2", "mrm191_3", "mrm191_4", "mrm191_5", "mrm191_6", "mrm191_7", "mrm191_8", "mrm191_9", "mrm191s1", "mrm191s2",
  .applies_to_waves = c("F", "G", "H", "3B")
)

# define value labels ----
value_labels(
  `-3` = "no valid data", `1` = NA_character_, `18` = NA_character_,
  .applies_to_vars = c("macl", "maclst", "macr", "macrst"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no valid data", `-2` = "(partial) valid data", `1` = "short interview", `2` = "insufficient light", `3` = "visually impaired/(partially) blind", `4` = "physically unable", `5` = "aphasia/illiterate", `6` = "equipment failure", `7` = "refused",
  .applies_to_vars = c("mrm191"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mrm191_1", "mrm191_10", "mrm191_2", "mrm191_3", "mrm191_4", "mrm191_5", "mrm191_6", "mrm191_7", "mrm191_8", "mrm191_9"),
  .applies_to_waves = c("Z", "F", "G", "H", "3B")
)

value_labels(
  `-2` = "no valid data", `1` = "still perception of light", `2` = "no perception of light", `3` = "prosthesis",
  .applies_to_vars = c("mrm191s1", "mrm191s2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no valid data", `10` = NA_character_, `100` = NA_character_,
  .applies_to_vars = c("mvasl", "mvaslst", "mvasr", "mvasrst"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no data", `1` = NA_character_, `18` = NA_character_,
  .applies_to_vars = c("macl", "maclst", "macr", "macrst"),
  .applies_to_waves = c("E", "H", "3B")
)

value_labels(
  `-3` = "no data", `-2` = "(partial) valid data", `1` = "short interview", `2` = "insufficient light", `3` = "visually impaired/(partially) blind", `4` = "physically unable", `5` = "aphasia/illiterate", `6` = "equipment failure", `7` = "refused",
  .applies_to_vars = c("mrm191"),
  .applies_to_waves = c("E", "F", "G")
)

value_labels(
  `-3` = "no data", `10` = NA_character_, `100` = NA_character_,
  .applies_to_vars = c("mvasl", "mvaslst", "mvasr", "mvasrst"),
  .applies_to_waves = c("E", "F", "G", "H", "3B")
)

value_labels(
  `-2` = "na, see FMRM191_1", `1` = "still perception of light", `2` = "no perception of light", `3` = "prosthesis",
  .applies_to_vars = c("mrm191s1"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FMRM191_2", `1` = "still perception of light", `2` = "no perception of light", `3` = "prosthesis",
  .applies_to_vars = c("mrm191s2"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see GMRM191_1", `1` = "still perception of light", `2` = "no perception of light", `3` = "prosthesis",
  .applies_to_vars = c("mrm191s1"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMRM191_2", `1` = "still perception of light", `2` = "no perception of light", `3` = "prosthesis",
  .applies_to_vars = c("mrm191s2"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see HMRM191_1", `1` = "still perception of light", `2` = "no perception of light", `3` = "prosthesis",
  .applies_to_vars = c("mrm191s1"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMRM191_2", `1` = "still perception of light", `2` = "no perception of light", `3` = "prosthesis",
  .applies_to_vars = c("mrm191s2"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see BMRM191_1", `1` = "still perception of light", `2` = "no perception of light", `3` = "prosthesis",
  .applies_to_vars = c("mrm191s1"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BMRM191_2", `1` = "still perception of light", `2` = "no perception of light", `3` = "prosthesis",
  .applies_to_vars = c("mrm191s2"),
  .applies_to_waves = c("3B")
)

.lasa_fc_191 <- .lasa_finalize_fc("191")

