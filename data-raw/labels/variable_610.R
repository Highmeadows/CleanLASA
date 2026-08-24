## LASA filecode 610 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  tpadapt = "Indication for adaptations",
  tpappli = "Indication for an appliance",
  tpdisth = "District nurse: number of hours/week",
  tpdistr = "Indication for district nurse",
  tpdomch = "Domestic tasks: number of hours/week",
  tpdomec = "Home care: domestic tasks",
  tpelddn = "Day/night treatment in home for the elderly",
  tpeldeh = "Home for the elderly: number of hours/week",
  tpelder = "Stay in home for the elderly",
  tphomec = "Indication for home care",
  tpmeal = "Indication for meals",
  tpmealn = "Number of meals per week",
  tpnurdn = "Day/night treatment in nursing home",
  tpnursd = "Nursing home: department",
  tpnursh = "Nursing home: number of hours/week",
  tpnursi = "Stay in nursing home",
  tpperch = "Personal care: number of hours/week",
  tppersc = "Home care: personal care",
  tprioot = "Other indication",
  tprioyn = "Indication (on medical grounds)",
  tpuf24c = "Use of facilities past half year: 24 hours care (at home or residential)",
  tpufdac = "Use of facilities past half year: daytime activities (group)",
  tpufgui = "Use of facilities past half year: guidance (one on one)",
  tpufntc = "Use of facilities past half year: night treatment residential care",
  tpufssc = "Use of facilities past half year: short stay residential care",
  tpurgyn = "Urgent indication"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels[c(
    "tpadapt",
    "tpappli",
    "tpdisth",
    "tpdistr",
    "tpdomch",
    "tpdomec",
    "tpelddn",
    "tpeldeh",
    "tpelder",
    "tphomec",
    "tpmeal",
    "tpmealn",
    "tpnurdn",
    "tpnursd",
    "tpnursh",
    "tpnursi",
    "tpperch",
    "tppersc",
    "tprioot",
    "tprioyn",
    "tpurgyn"
  )],
  Wave_F_labels = harmonized_labels[c(
    "tpadapt",
    "tpappli",
    "tpdisth",
    "tpdistr",
    "tpdomch",
    "tpdomec",
    "tpelddn",
    "tpeldeh",
    "tpelder",
    "tphomec",
    "tpmeal",
    "tpmealn",
    "tpnurdn",
    "tpnursd",
    "tpnursh",
    "tpnursi",
    "tpperch",
    "tppersc",
    "tprioot",
    "tprioyn",
    "tpurgyn"
  )],
  Wave_J_labels = harmonized_labels[c("tpuf24c", "tpufdac", "tpufgui", "tpufntc", "tpufssc")],
  Wave_K_labels = harmonized_labels[c("tpuf24c", "tpufdac", "tpufgui", "tpufntc", "tpufssc")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  tpadapt = c(`-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpappli = c(`-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpdisth = c(`-2` = "na, see TPDISTR", `-1` = "na, asked"),
  tpdistr = c(`-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpdomch = c(`-2` = "na, see TPDOMEC", `-1` = "na, asked"),
  tpdomec = c(`-2` = "na, see TPHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpelddn = c(
    `-2` = "na, see TPELDER",
    `-1` = "na, asked",
    `1` = "day treatment",
    `2` = "night treatment",
    `3` = "both: day and night treatment"
  ),
  tpeldeh = c(`-2` = "na, see TPELDER", `-1` = "na, asked"),
  tpelder = c(`-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tphomec = c(`-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpmeal = c(`-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpmealn = c(`-2` = "na, see TPMEAL", `-1` = "na, asked"),
  tpnurdn = c(
    `-2` = "na, see TPNURSI",
    `-1` = "na, asked",
    `1` = "day treatment",
    `2` = "night treatment",
    `3` = "both: day and night treatment"
  ),
  tpnursd = c(`-2` = "na, see TPNURSI", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric"),
  tpnursh = c(`-2` = "na, see TPNURSI", `-1` = "na, asked"),
  tpnursi = c(`-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpperch = c(`-2` = "na, see TPPERSC", `-1` = "na, asked"),
  tppersc = c(`-2` = "na, see TPHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tprioot = c(`-2` = "na, see TPRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  tprioyn = c(
    `-1` = "na, asked",
    `1` = "no",
    `2` = "no, but expect one soon",
    `3` = "yes",
    `4` = "answer 2 + 3"
  ),
  tpuf24c = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpufdac = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpufgui = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpufntc = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpufssc = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  tpurgyn = c(
    `-2` = "na, see TPRIOYN",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, urgent",
    `3` = "yes, very urgent"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "tpadapt",
    "tpappli",
    "tpdisth",
    "tpdistr",
    "tpdomch",
    "tpdomec",
    "tpelddn",
    "tpeldeh",
    "tpelder",
    "tphomec",
    "tpmeal",
    "tpmealn",
    "tpnurdn",
    "tpnursd",
    "tpnursh",
    "tpnursi",
    "tpperch",
    "tppersc",
    "tprioot",
    "tprioyn",
    "tpurgyn"
  )],
    tpadapt = .replace_labels(
    standardized_value_labels$tpadapt,
    `-2` = "na, see ETPRIOYN"
  ),
    tpappli = .replace_labels(
    standardized_value_labels$tpappli,
    `-2` = "na, see ETPRIOYN"
  ),
    tpdisth = .replace_labels(
    standardized_value_labels$tpdisth,
    `-2` = "na, see ETPDISTR"
  ),
    tpdistr = .replace_labels(
    standardized_value_labels$tpdistr,
    `-2` = "na, see ETPRIOYN"
  ),
    tpdomch = .replace_labels(
    standardized_value_labels$tpdomch,
    `-2` = "na, see ETPDOMEC"
  ),
    tpdomec = .replace_labels(
    standardized_value_labels$tpdomec,
    `-2` = "na, see ETPHOMEC"
  ),
    tpelddn = .replace_labels(
    standardized_value_labels$tpelddn,
    `-2` = "na, see ETPELDER"
  ),
    tpeldeh = .replace_labels(
    standardized_value_labels$tpeldeh,
    `-2` = "na, see ETPELDER"
  ),
    tpelder = .replace_labels(
    standardized_value_labels$tpelder,
    `-2` = "na, see ETPRIOYN"
  ),
    tphomec = .replace_labels(
    standardized_value_labels$tphomec,
    `-2` = "na, see ETPRIOYN"
  ),
    tpmeal = .replace_labels(
    standardized_value_labels$tpmeal,
    `-2` = "na, see ETPRIOYN"
  ),
    tpmealn = .replace_labels(
    standardized_value_labels$tpmealn,
    `-2` = "na, see ETPMEAL"
  ),
    tpnurdn = .replace_labels(
    standardized_value_labels$tpnurdn,
    `-2` = "na, see ETPNURSI"
  ),
    tpnursd = .replace_labels(
    standardized_value_labels$tpnursd,
    `-2` = "na, see ETPNURSI"
  ),
    tpnursh = .replace_labels(
    standardized_value_labels$tpnursh,
    `-2` = "na, see ETPNURSI"
  ),
    tpnursi = .replace_labels(
    standardized_value_labels$tpnursi,
    `-2` = "na, see ETPRIOYN"
  ),
    tpperch = .replace_labels(
    standardized_value_labels$tpperch,
    `-2` = "na, see ETPPERSC"
  ),
    tppersc = .replace_labels(
    standardized_value_labels$tppersc,
    `-2` = "na, see ETPHOMEC"
  ),
    tprioot = .replace_labels(
    standardized_value_labels$tprioot,
    `-2` = "na, see ETPRIOYN"
  ),
    tpurgyn = .replace_labels(
    standardized_value_labels$tpurgyn,
    `-2` = "na, see ETPRIOYN"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "tpadapt",
    "tpappli",
    "tpdisth",
    "tpdistr",
    "tpdomch",
    "tpdomec",
    "tpelddn",
    "tpeldeh",
    "tpelder",
    "tphomec",
    "tpmeal",
    "tpmealn",
    "tpnurdn",
    "tpnursd",
    "tpnursh",
    "tpnursi",
    "tpperch",
    "tppersc",
    "tprioot",
    "tprioyn",
    "tpurgyn"
  )],
    tpadapt = .replace_labels(
    standardized_value_labels$tpadapt,
    `-2` = "na, see FTPRIOYN"
  ),
    tpappli = .replace_labels(
    standardized_value_labels$tpappli,
    `-2` = "na, see FTPRIOYN"
  ),
    tpdisth = .replace_labels(
    standardized_value_labels$tpdisth,
    `-2` = "na, see FTPDISTR"
  ),
    tpdistr = .replace_labels(
    standardized_value_labels$tpdistr,
    `-2` = "na, see FTPRIOYN"
  ),
    tpdomch = .replace_labels(
    standardized_value_labels$tpdomch,
    `-2` = "na, see FTPDOMEC"
  ),
    tpdomec = .replace_labels(
    standardized_value_labels$tpdomec,
    `-2` = "na, see FTPHOMEC"
  ),
    tpelddn = .replace_labels(
    standardized_value_labels$tpelddn,
    `-2` = "na, see FTPELDER"
  ),
    tpeldeh = .replace_labels(
    standardized_value_labels$tpeldeh,
    `-2` = "na, see FTPELDER"
  ),
    tpelder = .replace_labels(
    standardized_value_labels$tpelder,
    `-2` = "na, see FTPRIOYN"
  ),
    tphomec = .replace_labels(
    standardized_value_labels$tphomec,
    `-2` = "na, see FTPRIOYN"
  ),
    tpmeal = .replace_labels(
    standardized_value_labels$tpmeal,
    `-2` = "na, see FTPRIOYN"
  ),
    tpmealn = .replace_labels(
    standardized_value_labels$tpmealn,
    `-2` = "na, see FTPMEAL"
  ),
    tpnurdn = .replace_labels(
    standardized_value_labels$tpnurdn,
    `-2` = "na, see FTPNURSI"
  ),
    tpnursd = .replace_labels(
    standardized_value_labels$tpnursd,
    `-2` = "na, see FTPNURSI"
  ),
    tpnursh = .replace_labels(
    standardized_value_labels$tpnursh,
    `-2` = "na, see FTPNURSI"
  ),
    tpnursi = .replace_labels(
    standardized_value_labels$tpnursi,
    `-2` = "na, see FTPRIOYN"
  ),
    tpperch = .replace_labels(
    standardized_value_labels$tpperch,
    `-2` = "na, see FTPPERSC"
  ),
    tppersc = .replace_labels(
    standardized_value_labels$tppersc,
    `-2` = "na, see FTPHOMEC"
  ),
    tprioot = .replace_labels(
    standardized_value_labels$tprioot,
    `-2` = "na, see FTPRIOYN"
  ),
    tpurgyn = .replace_labels(
    standardized_value_labels$tpurgyn,
    `-2` = "na, see FTPRIOYN"
  )
  ),
  Wave_J_labels = standardized_value_labels[c("tpuf24c", "tpufdac", "tpufgui", "tpufntc", "tpufssc")],
  Wave_K_labels = standardized_value_labels[c("tpuf24c", "tpufdac", "tpufgui", "tpufntc", "tpufssc")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  tpadapt = "categorical",
  tpappli = "categorical",
  tpdisth = "numeric",
  tpdistr = "categorical",
  tpdomch = "numeric",
  tpdomec = "categorical",
  tpelddn = "categorical",
  tpeldeh = "numeric",
  tpelder = "categorical",
  tphomec = "categorical",
  tpmeal = "categorical",
  tpmealn = "numeric",
  tpnurdn = "categorical",
  tpnursd = "categorical",
  tpnursh = "numeric",
  tpnursi = "categorical",
  tpperch = "numeric",
  tppersc = "categorical",
  tprioot = "categorical",
  tprioyn = "categorical",
  tpuf24c = "categorical",
  tpufdac = "categorical",
  tpufgui = "categorical",
  tpufntc = "categorical",
  tpufssc = "categorical",
  tpurgyn = "categorical"
)

.lasa_fc_610 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "610", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "610", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "610", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "610", waves = .lasa_wave_rows())
)
