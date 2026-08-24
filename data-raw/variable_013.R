## LASA filecode 013 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  city = "Residence 1944: City",
  country = "Residence 1944: Country",
  provinc = "Residence 1944: Province (Holland only)",
  remarks = "Residence 1944: Special remarks"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  city = c(
    `-4` = "outside holland",
    `-3` = "not living on 1 place",
    `-2` = "specific city unknown",
    `-1` = "no answer",
    `1` = "aalsmeer",
    `565` = "… zwolle-kerspel"
  ),
  country = c(`-2` = "specific country unknown", `-1` = "no answer", `1` = "antilles", `26` = "… vietnam"),
  provinc = c(
    `-2` = "routing (no city)",
    `-1` = "province unknown",
    `1` = "drente",
    `2` = "flevoland",
    `3` = "friesland",
    `4` = "gelderland",
    `5` = "groningen",
    `6` = "limburg",
    `7` = "noord brabant",
    `8` = "noord holland",
    `9` = "overijsel",
    `10` = "utrecht",
    `11` = "zeeland",
    `12` = "zuid holland"
  ),
  remarks = c(
    `-2` = "no remarks",
    `-1` = "no answer",
    `1` = "airforce",
    `2` = "camp",
    `3` = "care hiders",
    `4` = "do not know",
    `5` = "hiding",
    `6` = "labour camp",
    `7` = "military",
    `8` = "more then one residence",
    `9` = "no answer",
    `10` = "on ship (rivers only)",
    `11` = "on ship (sea-going)",
    `12` = "prison",
    `13` = "unfindable",
    `14` = "wandering"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    city = .replace_labels(
    standardized_value_labels$city,
    `1` = "AALSMEER",
    `565` = "… ZWOLLE-KERSPEL"
  ),
    country = .replace_labels(
    standardized_value_labels$country,
    `1` = "ANTILLES",
    `26` = "… VIETNAM"
  ),
    provinc = .replace_labels(
    standardized_value_labels$provinc,
    `1` = "DRENTE",
    `2` = "FLEVOLAND",
    `3` = "FRIESLAND",
    `4` = "GELDERLAND",
    `5` = "GRONINGEN",
    `6` = "LIMBURG",
    `7` = "NOORD BRABANT",
    `8` = "NOORD HOLLAND",
    `9` = "OVERIJSEL",
    `10` = "UTRECHT",
    `11` = "ZEELAND",
    `12` = "Zuid HOLLAND"
  ),
    remarks = .replace_labels(
    standardized_value_labels$remarks,
    `1` = "AIRFORCE",
    `2` = "CAMP",
    `3` = "CARE HIDERS",
    `4` = "DO NOT KNOW",
    `5` = "HIDING",
    `6` = "LABOUR CAMP",
    `7` = "MILITARY",
    `8` = "MORE THEN ONE RESIDENCE",
    `9` = "NO ANSWER",
    `10` = "ON SHIP (RIVERS ONLY)",
    `11` = "ON SHIP (SEA-GOING)",
    `12` = "PRISON",
    `13` = "UNFINDABLE",
    `14` = "WANDERING"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  city = "categorical",
  country = "categorical",
  provinc = "categorical",
  remarks = "categorical"
)

.lasa_fc_013 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "013", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "013", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "013", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "013", waves = .lasa_wave_rows())
)
