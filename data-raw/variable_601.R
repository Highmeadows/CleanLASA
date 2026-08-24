## LASA filecode 601 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  tpyechp = "Year change partner status"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tphinde = "type of housing",
    tpmarst = "marital status",
    tpmochh = "month change type of housing",
    tpmochm = "month change marital status",
    tpmochp = "month change partner status",
    tpnuper = "number of other persons in household (partner excluded)",
    tpyechh = "year change type of housing",
    tpyechm = "year change marital status",
    tpyechp = "year change partner status"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tpnuper = "Number of other persons in household (partner excluded)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tpnuper = "Number of other persons in household (partner excluded)"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tpnuper = "Number of other persons in household (partner excluded)"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tpnuper = "Number of other persons in household (partner excluded)"
  ),
  Wave_H_labels = harmonized_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochm",
    "tpmochp",
    "tpmoved",
    "tpmovmo",
    "tpmovye",
    "tpnuper",
    "tppartn",
    "tpyechm",
    "tpyechp"
  )],
  Wave_I_labels = harmonized_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochm",
    "tpmochp",
    "tpmoved",
    "tpmovmo",
    "tpmovye",
    "tpnuper",
    "tppartn",
    "tpyechm",
    "tpyechp"
  )],
  Wave_J_labels = harmonized_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochm",
    "tpmochp",
    "tpmoved",
    "tpmovmo",
    "tpmovye",
    "tpnuper",
    "tppartn",
    "tpyechm",
    "tpyechp"
  )],
  Wave_K_labels = harmonized_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochm",
    "tpmochp",
    "tpmoved",
    "tpmovmo",
    "tpmovye",
    "tpnuper",
    "tppartn",
    "tpyechm",
    "tpyechp"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  tphinde = c(
    `-1` = "asked, no answer",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing home-somatic",
    `4` = "nursing home-psychiatric",
    `5` = "hospital",
    `6` = "psychiatric hospital"
  ),
  tpmarst = c(
    `-1` = "asked, no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed",
    `5` = "registered partnership"
  ),
  tpmochh = c(
    `-2` = "not changed",
    `-1` = "asked, no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  tpmochm = c(
    `-3` = "no answer, see TPMARST",
    `-2` = "not changed",
    `-1` = "asked, no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  tpmochp = c(
    `-3` = "no answer, see TPPARTN",
    `-2` = "not changed",
    `-1` = "asked, no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  tpmoved = c(`-1` = "asked, no answer", `1` = "no", `2` = "yes", `3` = "proxy does not know"),
  tpmovmo = c(
    `-2` = "not moved",
    `-1` = "asked, no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  tpmovye = c(`-2` = "not moved", `-1` = "asked, no answer"),
  tpnuper = c(`-2` = "R not independent", `-1` = "asked, no answer"),
  tppartn = c(
    `-1` = "asked, no answer",
    `1` = "not living with partner",
    `2` = "partner, married",
    `3` = "partner, not married",
    `4` = "partner, outside household"
  ),
  tpyechh = c(`-2` = "not changed", `-1` = "asked, no answer"),
  tpyechm = c(`-3` = "no answer, see TPMARST", `-2` = "not changed", `-1` = "asked, no answer"),
  tpyechp = c(`-3` = "no answer, see TPPARTN", `-2` = "not changed", `-1` = "asked, no answer")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tpmarst = c(
    `-1` = "asked, no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed"
  ),
    tpmochm = .replace_labels(
    standardized_value_labels$tpmochm,
    `-3` = "no answer CTPMARST"
  ),
    tpmochp = .replace_labels(
    standardized_value_labels$tpmochp,
    `-3` = "no answer CTPPARTN"
  ),
    tppartn = c(
    `-1` = "asked, no answer",
    `1` = "not living with partner",
    `2` = "partner, married",
    `3` = "partner, not married"
  ),
    tpyechm = .replace_labels(
    standardized_value_labels$tpyechm,
    `-3` = "no answer CTPMARST"
  ),
    tpyechp = .replace_labels(
    standardized_value_labels$tpyechp,
    `-3` = "no answer CTPPARTN"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tpmarst = c(
    `-1` = "asked, no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed"
  ),
    tpmochm = .replace_labels(
    standardized_value_labels$tpmochm,
    `-3` = "no answer D/E/F/GTPMARST"
  ),
    tpmochp = .replace_labels(
    standardized_value_labels$tpmochp,
    `-3` = "no answer D/E/F/GTPPARTN"
  ),
    tppartn = .replace_labels(
    standardized_value_labels$tppartn,
    `1` = "not living with a partner"
  ),
    tpyechm = .replace_labels(
    standardized_value_labels$tpyechm,
    `-3` = "no answer D/E/F/GTPMARST"
  ),
    tpyechp = .replace_labels(
    standardized_value_labels$tpyechp,
    `-3` = "no answer D/E/F/GTPPARTN"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tpmarst = c(
    `-1` = "asked, no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed"
  ),
    tpmochm = .replace_labels(
    standardized_value_labels$tpmochm,
    `-3` = "no answer D/E/F/GTPMARST"
  ),
    tpmochp = .replace_labels(
    standardized_value_labels$tpmochp,
    `-3` = "no answer D/E/F/GTPPARTN"
  ),
    tppartn = .replace_labels(
    standardized_value_labels$tppartn,
    `1` = "not living with a partner"
  ),
    tpyechm = .replace_labels(
    standardized_value_labels$tpyechm,
    `-3` = "no answer D/E/F/GTPMARST"
  ),
    tpyechp = .replace_labels(
    standardized_value_labels$tpyechp,
    `-3` = "no answer D/E/F/GTPPARTN"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tpmarst = c(
    `-1` = "asked, no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed"
  ),
    tpmochm = .replace_labels(
    standardized_value_labels$tpmochm,
    `-3` = "no answer D/E/F/GTPMARST"
  ),
    tpmochp = .replace_labels(
    standardized_value_labels$tpmochp,
    `-3` = "no answer D/E/F/GTPPARTN"
  ),
    tppartn = .replace_labels(
    standardized_value_labels$tppartn,
    `1` = "not living with a partner"
  ),
    tpyechm = .replace_labels(
    standardized_value_labels$tpyechm,
    `-3` = "no answer D/E/F/GTPMARST"
  ),
    tpyechp = .replace_labels(
    standardized_value_labels$tpyechp,
    `-3` = "no answer D/E/F/GTPPARTN"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochh",
    "tpmochm",
    "tpmochp",
    "tpnuper",
    "tppartn",
    "tpyechh",
    "tpyechm",
    "tpyechp"
  )],
    tpmochm = .replace_labels(
    standardized_value_labels$tpmochm,
    `-3` = "no answer D/E/F/GTPMARST"
  ),
    tpmochp = .replace_labels(
    standardized_value_labels$tpmochp,
    `-3` = "no answer D/E/F/GTPPARTN"
  ),
    tppartn = .replace_labels(
    standardized_value_labels$tppartn,
    `1` = "not living with a partner"
  ),
    tpyechm = .replace_labels(
    standardized_value_labels$tpyechm,
    `-3` = "no answer D/E/F/GTPMARST"
  ),
    tpyechp = .replace_labels(
    standardized_value_labels$tpyechp,
    `-3` = "no answer D/E/F/GTPPARTN"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochm",
    "tpmochp",
    "tpmoved",
    "tpmovmo",
    "tpmovye",
    "tpnuper",
    "tppartn",
    "tpyechm",
    "tpyechp"
  )],
    tpmochm = c(
    `-2` = "not changed",
    `-1` = "asked no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    tpmochp = c(
    `-2` = "not changed",
    `-1` = "asked no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    tpmovmo = .replace_labels(
    standardized_value_labels$tpmovmo,
    `-1` = "asked no answer"
  ),
    tpmovye = .replace_labels(
    standardized_value_labels$tpmovye,
    `-1` = "asked no answer"
  ),
    tppartn = .replace_labels(
    standardized_value_labels$tppartn,
    `1` = "not living with a partner"
  ),
    tpyechm = c(`-2` = "not changed", `-1` = "asked no answer"),
    tpyechp = c(`-2` = "not changed", `-1` = "asked no answer")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochm",
    "tpmochp",
    "tpmoved",
    "tpmovmo",
    "tpmovye",
    "tpnuper",
    "tppartn",
    "tpyechm",
    "tpyechp"
  )],
    tpmochm = c(
    `-2` = "not changed",
    `-1` = "asked no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    tpmochp = c(
    `-2` = "not changed",
    `-1` = "asked no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    tpmovmo = .replace_labels(
    standardized_value_labels$tpmovmo,
    `-1` = "asked no answer"
  ),
    tpmovye = .replace_labels(
    standardized_value_labels$tpmovye,
    `-1` = "asked no answer"
  ),
    tppartn = .replace_labels(
    standardized_value_labels$tppartn,
    `1` = "not living with a partner"
  ),
    tpyechm = c(`-2` = "not changed", `-1` = "asked no answer"),
    tpyechp = c(`-2` = "not changed", `-1` = "asked no answer")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochm",
    "tpmochp",
    "tpmoved",
    "tpmovmo",
    "tpmovye",
    "tpnuper",
    "tppartn",
    "tpyechm",
    "tpyechp"
  )],
    tpmochm = c(
    `-2` = "not changed",
    `-1` = "asked no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    tpmochp = c(
    `-2` = "not changed",
    `-1` = "asked no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    tpmovmo = .replace_labels(
    standardized_value_labels$tpmovmo,
    `-1` = "asked no answer"
  ),
    tpmovye = .replace_labels(
    standardized_value_labels$tpmovye,
    `-1` = "asked no answer"
  ),
    tppartn = .replace_labels(
    standardized_value_labels$tppartn,
    `1` = "not living with a partner"
  ),
    tpyechm = c(`-2` = "not changed", `-1` = "asked no answer"),
    tpyechp = c(`-2` = "not changed", `-1` = "asked no answer")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "tphinde",
    "tpmarst",
    "tpmochm",
    "tpmochp",
    "tpmoved",
    "tpmovmo",
    "tpmovye",
    "tpnuper",
    "tppartn",
    "tpyechm",
    "tpyechp"
  )],
    tpmarst = c(
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed",
    `5` = "registered partnership"
  ),
    tpmochm = c(
    `-2` = "not changed",
    `-1` = "asked no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    tpmochp = c(
    `-2` = "not changed",
    `-1` = "asked no answer",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    tpmovmo = .replace_labels(
    standardized_value_labels$tpmovmo,
    `-1` = "asked no answer"
  ),
    tpmovye = .replace_labels(
    standardized_value_labels$tpmovye,
    `-1` = "asked no answer"
  ),
    tppartn = .replace_labels(
    standardized_value_labels$tppartn,
    `1` = "not living with a partner"
  ),
    tpyechm = c(`-2` = "not changed", `-1` = "asked no answer"),
    tpyechp = c(`-2` = "not changed", `-1` = "asked no answer")
  ),
  Harmonized_labels = standardized_value_labels
)

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

.lasa_fc_601 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "601", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "601", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "601", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "601", waves = .lasa_wave_rows())
)
