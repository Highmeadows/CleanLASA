## LASA filecode 701 -- variable names, variable labels, value labels,
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
  trhinde = "categorical",
  trmarst = "categorical",
  trmochh = "categorical",
  trmochm = "categorical",
  trmochp = "categorical",
  trmoved = "categorical",
  trmovmo = "categorical",
  trmovye = "numeric",
  trnuper = "numeric",
  trpartn = "categorical",
  tryechh = "numeric",
  tryechm = "numeric",
  tryechp = "numeric"
)

# define variable labels ----
variable_labels(
  trhinde = "Type of housing",
  trmarst = "Marital status",
  trmochh = "Month change type of housing",
  trmochm = "Month change marital status",
  trmochp = "Month change partner status",
  trmoved = "R moved since last interview",
  trmovmo = "Moved since last interview: month",
  trmovye = "Moved since last interview: year",
  trnuper = "Number of other persons in household (partner excluded)",
  trpartn = "Household partner available",
  tryechh = "Year change type of housing",
  tryechm = "Year change marital status",
  tryechp = "Year change partner status",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trpartn",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "trhinde", "trmarst", "trmochm", "trmochp", "tryechm", "tryechp",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "trmochh", "tryechh",
  .applies_to_waves = c("D", "E", "F", "G")
)

variable_labels(
  "trmoved", "trmovmo", "trmovye",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  trhinde = "type of housing",
  trmarst = "marital status",
  trmochh = "month change type of housing",
  trmochm = "month change marital status",
  trmochp = "month change partner status",
  tryechh = "year change type of housing",
  tryechm = "year change marital status",
  tryechp = "year change partner status",
  .applies_to_waves = c("C")
)

variable_labels(
  trnuper = "number of other persons in household (partner excluded)",
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

variable_labels(
  trnuper = "Number of other persons in household",
  .applies_to_waves = c("H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "R not independent",
  .applies_to_vars = c("trnuper"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "not moved",
  .applies_to_vars = c("trmovmo", "trmovye"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "independent", `2` = "residential home", `3` = "nursing home-somatic", `4` = "nursing home-psychogeriatric", `5` = "hospital", `6` = "psychiatric hospital", `8` = "monastery",
  .applies_to_vars = c("trhinde"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "never married", `2` = "married", `3` = "divorced", `4` = "widowed", `5` = "registered partnership",
  .applies_to_vars = c("trmarst"),
  .applies_to_waves = c("Z", "G", "H", "I", "J")
)

value_labels(
  `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochh"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "no answer TRMARST", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochm"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no answer TRPARTN", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trmoved"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmovmo"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("trmovye"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("trnuper"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "not living with a partner", `2` = "partner, married", `3` = "partner, not married", `4` = "partner, outside household", `5` = "combination 2 + 4",
  .applies_to_vars = c("trpartn"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechh"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "no answer TRMARST", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechm"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no answer TRPARTN", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "asked, no answer", `1` = "independent", `2` = "residential home", `3` = "nursing home-somatic", `4` = "nursing home-psychogeriatric", `5` = "hospital", `6` = "psychiatric hospital",
  .applies_to_vars = c("trhinde"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "asked, no answer", `1` = "never married", `2` = "married", `3` = "divorced", `4` = "widowed",
  .applies_to_vars = c("trmarst"),
  .applies_to_waves = c("C", "D", "E", "F")
)

value_labels(
  `-3` = "no answer CTRMARST", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochm"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no answer CTRPARTN", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochp"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "asked, no answer", `1` = "not living with a partner", `2` = "partner, married", `3` = "partner, not married",
  .applies_to_vars = c("trpartn"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no answer CTRMARST", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechm"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no answer CTRPARTN", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechp"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no answer DTRMARST", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochm"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "no answer DTRPARTN", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochp"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "asked, no answer", `1` = "not living with a partner", `2` = "partner, married", `3` = "partner, not married", `4` = "partner, outside household",
  .applies_to_vars = c("trpartn"),
  .applies_to_waves = c("D", "E", "H", "I", "J", "K")
)

value_labels(
  `-3` = "no answer DTRMARST", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechm"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "no answer DTRPARTN", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechp"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "no answer ETRMARST", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochm"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "no answer ETRPARTN", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochp"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "no answer ETRMARST", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechm"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "no answer ETRPARTN", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechp"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "no answer FTRMARST", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochm"),
  .applies_to_waves = c("F")
)

value_labels(
  `-3` = "no answer FTRPARTN", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochp"),
  .applies_to_waves = c("F")
)

value_labels(
  `-3` = "no answer FTRMARST", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechm"),
  .applies_to_waves = c("F")
)

value_labels(
  `-3` = "no answer FTRPARTN", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechp"),
  .applies_to_waves = c("F")
)

value_labels(
  `-3` = "no answer GTRMARST", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochm"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "no answer GTRPARTN", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochp"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "no answer GTRMARST", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechm"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "no answer GTRPARTN", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tryechp"),
  .applies_to_waves = c("G")
)

value_labels(
  `-1` = "asked no answer",
  .applies_to_vars = c("trmochm", "trmochp", "trmovmo", "trmovye", "tryechm", "tryechp"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-2` = "not changed", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmochm", "trmochp"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trmovmo"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-2` = "not changed",
  .applies_to_vars = c("tryechm", "tryechp"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `1` = "never married", `2` = "married", `3` = "divorced", `4` = "widowed", `5` = "registered partnership",
  .applies_to_vars = c("trmarst"),
  .applies_to_waves = c("K")
)

.lasa_fc_701 <- .lasa_finalize_fc("701")

