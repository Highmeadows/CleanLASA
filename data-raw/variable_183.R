## LASA filecode 183 -- variable names, variable labels, value labels,
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
  mlimbend = "categorical",
  mlimbox = "categorical",
  mlimhrdchr = "categorical",
  mlimhvobj = "categorical",
  mlimobjflr = "categorical",
  mlimrsbed = "categorical",
  mlimrun = "categorical",
  mlimscks = "categorical",
  mlimshelf = "categorical",
  mlimstn30 = "categorical",
  mlimwshbsn = "categorical",
  mlimwshy = "categorical"
)

# define variable labels ----
variable_labels(
  mlimbend = "Bend down from a seated position",
  mlimbox = "Lift a box",
  mlimhrdchr = "Sit for one hour on a hard chair",
  mlimhvobj = "Lift a heavy object of at least 10 kilo",
  mlimobjflr = "Small lightweight object from the floor",
  mlimrsbed = "Raise yourself in bed",
  mlimrun = "Run for 100 meters fast to catch a bus",
  mlimscks = "Socks on and off your feet",
  mlimshelf = "A book from a high shelf or cupboard",
  mlimstn30 = "Stand continuously for 30 minutes",
  mlimwshbsn = "Wash hair over a washbasin",
  mlimwshy = "Wash and dry yourself all over",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mlimbend", "mlimbox", "mlimhrdchr", "mlimhvobj", "mlimobjflr", "mlimrsbed", "mlimrun", "mlimscks", "mlimshelf", "mlimstn30", "mlimwshbsn", "mlimwshy",
  .applies_to_waves = c("C", "D", "E")
)

# define value labels ----
value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "yes, without any trouble", `2` = "yes, with some trouble", `3` = "no [or with help]",
  .applies_to_vars = c("mlimhvobj", "mlimshelf"),
  .applies_to_waves = c("Z", "C", "D", "E")
)

.lasa_fc_183 <- .lasa_finalize_fc("183")

