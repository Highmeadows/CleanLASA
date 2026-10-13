## LASA filecode 013 -- variable names, variable labels, value labels,
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
  city = "categorical",
  country = "categorical",
  provinc = "categorical",
  remarks = "categorical"
)

# define variable labels ----
variable_labels(
  city = "Residence 1944: City",
  country = "Residence 1944: Country",
  provinc = "Residence 1944: Province (Holland only)",
  remarks = "Residence 1944: Special remarks",
  .applies_to_waves = c("Z")
)

variable_labels(
  "city", "country", "provinc", "remarks",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-4` = "outside holland", `-3` = "not living on 1 place", `-2` = "specific city unknown", `-1` = "na, asked", `1` = "aalsmeer", `565` = "\342\200\246 zwolle-kerspel",
  .applies_to_vars = c("city"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "specific country unknown", `-1` = "na, asked", `1` = "antilles", `26` = "\342\200\246 vietnam",
  .applies_to_vars = c("country"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "routing (no city)", `-1` = "province unknown", `1` = "drente", `2` = "flevoland", `3` = "friesland", `4` = "gelderland", `5` = "groningen", `6` = "limburg", `7` = "noord brabant", `8` = "noord holland", `9` = "overijsel", `10` = "utrecht", `11` = "zeeland", `12` = "zuid holland",
  .applies_to_vars = c("provinc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no remarks", `-1` = "na, asked", `1` = "airforce", `2` = "camp", `3` = "care hiders", `4` = "do not know", `5` = "hiding", `6` = "labour camp", `7` = "military", `8` = "more then one residence", `9` = "no answer", `10` = "on ship (rivers only)", `11` = "on ship (sea-going)", `12` = "prison", `13` = "unfindable", `14` = "wandering",
  .applies_to_vars = c("remarks"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "outside holland", `-3` = "not living on 1 place", `-2` = "specific city unknown", `-1` = "na, asked", `1` = "AALSMEER", `565` = "\342\200\246 ZWOLLE-KERSPEL",
  .applies_to_vars = c("city"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "specific country unknown", `-1` = "na, asked", `1` = "ANTILLES", `26` = "\342\200\246 VIETNAM",
  .applies_to_vars = c("country"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "routing (no city)", `-1` = "province unknown", `1` = "DRENTE", `2` = "FLEVOLAND", `3` = "FRIESLAND", `4` = "GELDERLAND", `5` = "GRONINGEN", `6` = "LIMBURG", `7` = "NOORD BRABANT", `8` = "NOORD HOLLAND", `9` = "OVERIJSEL", `10` = "UTRECHT", `11` = "ZEELAND", `12` = "Zuid HOLLAND",
  .applies_to_vars = c("provinc"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no remarks", `-1` = "na, asked", `1` = "AIRFORCE", `2` = "CAMP", `3` = "CARE HIDERS", `4` = "DO NOT KNOW", `5` = "HIDING", `6` = "LABOUR CAMP", `7` = "MILITARY", `8` = "MORE THEN ONE RESIDENCE", `9` = "NO ANSWER", `10` = "ON SHIP (RIVERS ONLY)", `11` = "ON SHIP (SEA-GOING)", `12` = "PRISON", `13` = "UNFINDABLE", `14` = "WANDERING",
  .applies_to_vars = c("remarks"),
  .applies_to_waves = c("B")
)

.lasa_fc_013 <- .lasa_finalize_fc("013")

