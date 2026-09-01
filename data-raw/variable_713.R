## LASA filecode 713 -- variable names, variable labels, value labels,
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
  trjob1 = "categorical",
  trjob6 = "numeric",
  trjobl1 = "categorical",
  trjobstom = "date",
  trjobstoy = "date"
)

# define variable labels ----
variable_labels(
  trjob1 = "paid job at present",
  trjob6 = "last job: hours/week",
  trjobl1 = "paid job before",
  trjobstom = "stopped working: month",
  trjobstoy = "stopped working: year",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trjob1", "trjob6", "trjobl1", "trjobstom", "trjobstoy",
  .applies_to_waves = c("I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("trjob1", "trjob6", "trjobl1", "trjobstom", "trjobstoy"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-2` = "na, outside birth-year eligibility", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trjob1"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-3` = "does not know", `-2` = "na, see TRJOB1",
  .applies_to_vars = c("trjob6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRJOB1", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trjobl1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRJOBL1", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trjobstom"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRJOBL1",
  .applies_to_vars = c("trjobstoy"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "does not know", `-2` = "na, see ITRJOB1",
  .applies_to_vars = c("trjob6"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see ITRJOB1", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trjobl1"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see ITRJOBL1", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trjobstom"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see ITRJOBL1",
  .applies_to_vars = c("trjobstoy"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "does not know", `-2` = "na, see JTRJOB1",
  .applies_to_vars = c("trjob6"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRJOB1", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trjobl1"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRJOBL1", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trjobstom"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRJOBL1",
  .applies_to_vars = c("trjobstoy"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "does not know", `-2` = "na, see KTRJOB1",
  .applies_to_vars = c("trjob6"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTRJOB1", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trjobl1"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTRJOBL1", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trjobstom"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTRJOBL1",
  .applies_to_vars = c("trjobstoy"),
  .applies_to_waves = c("K")
)

.lasa_fc_713 <- .lasa_finalize_fc("713")

