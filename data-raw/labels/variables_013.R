## LASA filecode 013 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_013 <- list(
  variables = data.frame(
    wave = c("B", "B", "B", "B"),
    variable_name = c("bcity", "bcountry", "bprovinc", "bremarks"),
    canonical_name = c("city", "country", "provinc", "remarks"),
    variable_label = c(
      "Residence 1944: City",
      "Residence 1944: Country",
      "Residence 1944: Province (Holland only)",
      "Residence 1944: Special remarks"
    ),
    harmonized_var_label = c(
      "Residence 1944: City",
      "Residence 1944: Country",
      "Residence 1944: Province (Holland only)",
      "Residence 1944: Special remarks"
    ),
    var_type = c("categorical", "categorical", "categorical", "categorical"),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    city = list(
      B = c(
        `-4` = "outside holland",
        `-3` = "not living on 1 place",
        `-2` = "specific city unknown",
        `-1` = "no answer",
        `1` = "AALSMEER",
        `565` = "… ZWOLLE-KERSPEL"
      )
    ),
    country = list(
      B = c(`-2` = "specific country unknown", `-1` = "no answer", `1` = "ANTILLES", `26` = "… VIETNAM")
    ),
    provinc = list(
      B = c(
        `-2` = "routing (no city)",
        `-1` = "province unknown",
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
      )
    ),
    remarks = list(
      B = c(
        `-2` = "no remarks",
        `-1` = "no answer",
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
    )
  ),

  value_labels_harmonized = list(
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
)
