## LASA filecode z095 -- variable names, variable labels, value labels,
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
  urb = "categorical",
  urbyear = "numeric"
)

# define variable labels ----
variable_labels(
  urb = "level of urbanization (addresses per km2)",
  urbyear = "year of urbanization observation",
  .applies_to_waves = c("Z")
)

variable_labels(
  urb = "URBA: level of urbanization (number addresses per km2)",
  urbyear = "URByearA: year of observation characteristic quarter or neighborhood",
  .applies_to_waves = c("A")
)

variable_labels(
  urb = "URBB: level of urbanization (number addresses per km2)",
  urbyear = "URByearB: year of observation characteristic quarter or neighborhood",
  .applies_to_waves = c("B")
)

variable_labels(
  urb = "URBC: level of urbanization (number addresses per km2)",
  urbyear = "URByearC: year of observation characteristic quarter or neighborhood",
  .applies_to_waves = c("C")
)

variable_labels(
  urb = "URBD: level of urbanization (number addresses per km2)",
  urbyear = "URByearD: year of observation characteristic quarter or neighborhood",
  .applies_to_waves = c("D")
)

variable_labels(
  urb = "URBE: level of urbanization (number addresses per km2)",
  urbyear = "URByearE: year of observation characteristic quarter or neighborhood",
  .applies_to_waves = c("E")
)

variable_labels(
  urb = "URBF: level of urbanization (number addresses per km2)",
  urbyear = "URByearF: year of observation characteristic quarter or neighborhood",
  .applies_to_waves = c("F")
)

variable_labels(
  urb = "URBG: level of urbanization (number addresses per km2)",
  urbyear = "URByearG: year of observation characteristic quarter or neighborhood",
  .applies_to_waves = c("G")
)

variable_labels(
  urb = "URBH: level of urbanization (number addresses per km2)",
  urbyear = "URByearH: year of observation characteristic quarter or neighborhood",
  .applies_to_waves = c("H")
)

variable_labels(
  urb = "URBI: level of urbanization (number addresses per km2)",
  urbyear = "URByearI: year of observation characteristic quarter or neighborhood",
  .applies_to_waves = c("I")
)

variable_labels(
  urb = "level of urbanization (number addresses per km2 in quarter)",
  urbyear = "year of data urbanization",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-7` = "birthyr 1948-1957", `-6` = "birthyr 1938-1947", `-5` = "birthyr 1903-1907", `-1` = "missing data",
  .applies_to_vars = c("urb", "urbyear"),
  .applies_to_waves = c("Z", "A", "B", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-4` = "address unknown/secret", `-3` = "no observation / sample attrition", `-2` = "abroad", `1` = "not (<500)", `2` = "little (500-1000)", `3` = "somewhat (1000-1500)", `4` = "highly (1500-2500)", `5` = "very highly (>=2500)",
  .applies_to_vars = c("urb"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "address unknown/secret", `-3` = "no data collected (sample attrition)", `-2` = "abroad",
  .applies_to_vars = c("urbyear"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "address unknown",
  .applies_to_vars = c("urb", "urbyear"),
  .applies_to_waves = c("A", "B", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-3` = "no data collected (sample attrition)", `-2` = "abroad", `1` = "not (<500)", `2` = "little (500-1000)", `3` = "somewhat (1000-1500)", `4` = "highly (1500-2500)", `5` = "very highly (>=2500)",
  .applies_to_vars = c("urb"),
  .applies_to_waves = c("A", "B", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-3` = "no data collected (sample attrition)", `-2` = "abroad",
  .applies_to_vars = c("urbyear"),
  .applies_to_waves = c("A", "B", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-4` = "address unknown/secret", `-3` = "no observation", `1` = "not (<500)", `2` = "little (500-1000)", `3` = "somewhat (1000-1500)", `4` = "highly (1500-2500)", `5` = "very highly (>=2500)",
  .applies_to_vars = c("urb"),
  .applies_to_waves = c("J")
)

value_labels(
  `-4` = "address unknown/secret", `-2` = "abroad",
  .applies_to_vars = c("urbyear"),
  .applies_to_waves = c("J")
)

.lasa_fc_z095 <- .lasa_finalize_fc("z095")

