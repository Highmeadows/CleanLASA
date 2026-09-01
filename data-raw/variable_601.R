## LASA filecode 601 -- variable names, variable labels, value labels,
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
  tphinde = "categorical",
  tpmarst = "categorical",
  tpmochh = "date",
  tpmochm = "date",
  tpmochp = "date",
  tpmoved = "categorical",
  tpmovmo = "date",
  tpmovye = "date",
  tpnuper = "numeric",
  tppartn = "categorical",
  tpyechh = "date",
  tpyechm = "date",
  tpyechp = "date"
)

# define variable labels ----
variable_labels(
  tphinde = "Type of housing",
  tpmarst = "Marital status",
  tpmochh = "Month change type of housing",
  tpmochm = "Month change marital status",
  tpmochp = "Month change partner status",
  tpmoved = "R moved since last interview",
  tpmovmo = "Moved since last interview: month",
  tpmovye = "Moved since last interview: year",
  tpnuper = "Number of other persons in household",
  tppartn = "Household partner available",
  tpyechh = "Year change type of housing",
  tpyechm = "Year change marital status",
  tpyechp = "Year change partner status",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tppartn",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "tphinde", "tpmarst", "tpmochm", "tpmochp", "tpyechm", "tpyechp",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "tpmochh", "tpyechh",
  .applies_to_waves = c("D", "E", "F", "G")
)

variable_labels(
  "tpmoved", "tpmovmo", "tpmovye", "tpnuper",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  tphinde = "type of housing",
  tpmarst = "marital status",
  tpmochh = "month change type of housing",
  tpmochm = "month change marital status",
  tpmochp = "month change partner status",
  tpnuper = "number of other persons in household (partner excluded)",
  tpyechh = "year change type of housing",
  tpyechm = "year change marital status",
  tpyechp = "year change partner status",
  .applies_to_waves = c("C")
)

variable_labels(
  tpnuper = "Number of other persons in household (partner excluded)",
  .applies_to_waves = c("D", "E", "F", "G")
)

# define value labels ----
value_labels(
  `-2` = "R not independent",
  .applies_to_vars = c("tpnuper"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "not moved",
  .applies_to_vars = c("tpmovmo", "tpmovye"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "independent", `2` = "residential home", `3` = "nursing home-somatic", `4` = "nursing home-psychiatric", `5` = "hospital", `6` = "psychiatric hospital",
  .applies_to_vars = c("tphinde"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "never married", `2` = "married", `3` = "divorced", `4` = "widowed", `5` = "registered partnership",
  .applies_to_vars = c("tpmarst"),
  .applies_to_waves = c("Z", "G", "H", "I", "J")
)

value_labels(
  `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmochh"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "no answer, see TPMARST", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmochm"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no answer, see TPPARTN", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmochp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "proxy does not know",
  .applies_to_vars = c("tpmoved"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmovmo"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("tpmovye"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("tpnuper"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "not living with partner", `2` = "partner, married", `3` = "partner, not married", `4` = "partner, outside household",
  .applies_to_vars = c("tppartn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tpyechh"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G")
)

value_labels(
  `-3` = "no answer, see TPMARST", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tpyechm"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no answer, see TPPARTN", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tpyechp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "asked, no answer", `1` = "never married", `2` = "married", `3` = "divorced", `4` = "widowed",
  .applies_to_vars = c("tpmarst"),
  .applies_to_waves = c("C", "D", "E", "F")
)

value_labels(
  `-3` = "no answer CTPMARST", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmochm"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no answer CTPPARTN", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmochp"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "asked, no answer", `1` = "not living with partner", `2` = "partner, married", `3` = "partner, not married",
  .applies_to_vars = c("tppartn"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no answer CTPMARST", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tpyechm"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no answer CTPPARTN", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tpyechp"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "no answer D/E/F/GTPMARST", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmochm"),
  .applies_to_waves = c("D", "E", "F", "G")
)

value_labels(
  `-3` = "no answer D/E/F/GTPPARTN", `-2` = "not changed", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmochp"),
  .applies_to_waves = c("D", "E", "F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "not living with a partner", `2` = "partner, married", `3` = "partner, not married", `4` = "partner, outside household",
  .applies_to_vars = c("tppartn"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-3` = "no answer D/E/F/GTPMARST", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tpyechm"),
  .applies_to_waves = c("D", "E", "F", "G")
)

value_labels(
  `-3` = "no answer D/E/F/GTPPARTN", `-2` = "not changed", `-1` = "na, asked",
  .applies_to_vars = c("tpyechp"),
  .applies_to_waves = c("D", "E", "F", "G")
)

value_labels(
  `-1` = "asked no answer",
  .applies_to_vars = c("tpmochm", "tpmochp", "tpmovmo", "tpmovye", "tpyechm", "tpyechp"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-2` = "not changed", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmochm", "tpmochp"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpmovmo"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-2` = "not changed",
  .applies_to_vars = c("tpyechm", "tpyechp"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `1` = "never married", `2` = "married", `3` = "divorced", `4` = "widowed", `5` = "registered partnership",
  .applies_to_vars = c("tpmarst"),
  .applies_to_waves = c("K")
)

.lasa_fc_601 <- .lasa_finalize_fc("601")

