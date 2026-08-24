## LASA filecode 710 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  tradapt = "Indication for adaptations",
  trappli = "Indication for an appliance",
  trdisth = "District nurse: number of hours/week",
  trdistr = "Indication for district nurse",
  trdomch = "Domestic tasks: number of hours/week",
  trdomec = "Home care: domestic tasks",
  trelddn = "Day/night treatment in home for the elderly",
  treldeh = "Home for the elderly: number of hours/week",
  trelder = "Stay in home for the elderly",
  trhomec = "Indication for home care",
  trmeal = "Indication for meals",
  trmealn = "Number of meals per week",
  trnurdn = "Day/night treatment in nursing home",
  trnursd = "Nursing home: department",
  trnursh = "Nursing home: number of hours/week",
  trnursi = "Stay in nursing home",
  trperch = "Personal care: number of hours/week",
  trpersc = "Home care: personal care",
  trrioot = "Other indication",
  trrioyn = "Indication (on medical grounds)",
  truf24c = "Use of facilities past half year: 24 hours care (at home or residential)",
  trufdac = "Use of facilities past half year: daytime activities (group)",
  trufgui = "Use of facilities past half year: guidance (one on one)",
  trufntc = "Use of facilities past half year: night treatment residential care",
  trufssc = "Use of facilities past half year: short stay residential care",
  trurgyn = "Urgent indication"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels[c(
    "tradapt",
    "trappli",
    "trdisth",
    "trdistr",
    "trdomch",
    "trdomec",
    "trelddn",
    "treldeh",
    "trelder",
    "trhomec",
    "trmeal",
    "trmealn",
    "trnurdn",
    "trnursd",
    "trnursh",
    "trnursi",
    "trperch",
    "trpersc",
    "trrioot",
    "trrioyn",
    "trurgyn"
  )],
  Wave_F_labels = harmonized_labels[c(
    "tradapt",
    "trappli",
    "trdisth",
    "trdistr",
    "trdomch",
    "trdomec",
    "trelddn",
    "treldeh",
    "trelder",
    "trhomec",
    "trmeal",
    "trmealn",
    "trnurdn",
    "trnursd",
    "trnursh",
    "trnursi",
    "trperch",
    "trpersc",
    "trrioot",
    "trrioyn",
    "trurgyn"
  )],
  Wave_I_labels = harmonized_labels[c("truf24c", "trufdac", "trufgui", "trufntc", "trufssc")],
  Wave_J_labels = harmonized_labels[c("truf24c", "trufdac", "trufgui", "trufntc", "trufssc")],
  Wave_K_labels = harmonized_labels[c("truf24c", "trufdac", "trufgui", "trufntc", "trufssc")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  tradapt = c(`-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trappli = c(`-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trdisth = c(`-2` = "na, see TRDISTR", `-1` = "na, asked"),
  trdistr = c(`-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trdomch = c(`-2` = "na, see TRDOMEC", `-1` = "na, asked"),
  trdomec = c(`-2` = "na, see TRHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trelddn = c(
    `-2` = "na, see TRELDER",
    `-1` = "na, asked",
    `1` = "day treatment",
    `2` = "night treatment",
    `3` = "both: day and night treatment"
  ),
  treldeh = c(`-2` = "na, see TRELDER", `-1` = "na, asked"),
  trelder = c(`-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trhomec = c(`-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trmeal = c(`-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trmealn = c(`-2` = "na, see TRMEAL", `-1` = "na, asked"),
  trnurdn = c(
    `-2` = "na, see TRNURSI",
    `-1` = "na, asked",
    `1` = "day treatment",
    `2` = "night treatment",
    `3` = "both: day and night treatment"
  ),
  trnursd = c(`-2` = "na, see TRNURSI", `-1` = "na, asked", `1` = "somatic", `2` = "psychogeriatric"),
  trnursh = c(`-2` = "na, see TRNURSI", `-1` = "na, asked"),
  trnursi = c(`-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trperch = c(`-2` = "na, see TRPERSC", `-1` = "na, asked"),
  trpersc = c(`-2` = "na, see TRHOMEC", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trrioot = c(`-2` = "na, see TRRIOYN", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trrioyn = c(
    `-1` = "na, asked",
    `1` = "no",
    `2` = "no, but expect one soon",
    `3` = "yes",
    `4` = "answer 2 + 3"
  ),
  truf24c = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trufdac = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trufgui = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trufntc = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trufssc = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  trurgyn = c(
    `-2` = "na, see TRRIOYN",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, urgent",
    `3` = "yes, very urgent"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "tradapt",
    "trappli",
    "trdisth",
    "trdistr",
    "trdomch",
    "trdomec",
    "trelddn",
    "treldeh",
    "trelder",
    "trhomec",
    "trmeal",
    "trmealn",
    "trnurdn",
    "trnursd",
    "trnursh",
    "trnursi",
    "trperch",
    "trpersc",
    "trrioot",
    "trrioyn",
    "trurgyn"
  )],
    tradapt = .replace_labels(
    standardized_value_labels$tradapt,
    `-2` = "na, see ETRRIOYN"
  ),
    trappli = .replace_labels(
    standardized_value_labels$trappli,
    `-2` = "na, see ETRRIOYN"
  ),
    trdisth = .replace_labels(
    standardized_value_labels$trdisth,
    `-2` = "na, see ETRDISTR"
  ),
    trdistr = .replace_labels(
    standardized_value_labels$trdistr,
    `-2` = "na, see ETRRIOYN"
  ),
    trdomch = .replace_labels(
    standardized_value_labels$trdomch,
    `-2` = "na, see ETRDOMEC"
  ),
    trdomec = .replace_labels(
    standardized_value_labels$trdomec,
    `-2` = "na, see ETRHOMEC"
  ),
    trelddn = .replace_labels(
    standardized_value_labels$trelddn,
    `-2` = "na, see ETRELDER"
  ),
    treldeh = .replace_labels(
    standardized_value_labels$treldeh,
    `-2` = "na, see ETRELDER"
  ),
    trelder = .replace_labels(
    standardized_value_labels$trelder,
    `-2` = "na, see ETRRIOYN"
  ),
    trhomec = .replace_labels(
    standardized_value_labels$trhomec,
    `-2` = "na, see ETRRIOYN"
  ),
    trmeal = .replace_labels(
    standardized_value_labels$trmeal,
    `-2` = "na, see ETRRIOYN"
  ),
    trmealn = .replace_labels(
    standardized_value_labels$trmealn,
    `-2` = "na, see ETRMEAL"
  ),
    trnurdn = .replace_labels(
    standardized_value_labels$trnurdn,
    `-2` = "na, see ETRNURSI"
  ),
    trnursd = .replace_labels(
    standardized_value_labels$trnursd,
    `-2` = "na, see ETRNURSI"
  ),
    trnursh = .replace_labels(
    standardized_value_labels$trnursh,
    `-2` = "na, see ETRNURSI"
  ),
    trnursi = .replace_labels(
    standardized_value_labels$trnursi,
    `-2` = "na, see ETRRIOYN"
  ),
    trperch = .replace_labels(
    standardized_value_labels$trperch,
    `-2` = "na, see ETRPERSC"
  ),
    trpersc = .replace_labels(
    standardized_value_labels$trpersc,
    `-2` = "na, see ETRHOMEC"
  ),
    trrioot = .replace_labels(
    standardized_value_labels$trrioot,
    `-2` = "na, see ETRRIOYN"
  ),
    trurgyn = .replace_labels(
    standardized_value_labels$trurgyn,
    `-2` = "na, see FTRRIOYN"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "tradapt",
    "trappli",
    "trdisth",
    "trdistr",
    "trdomch",
    "trdomec",
    "trelddn",
    "treldeh",
    "trelder",
    "trhomec",
    "trmeal",
    "trmealn",
    "trnurdn",
    "trnursd",
    "trnursh",
    "trnursi",
    "trperch",
    "trpersc",
    "trrioot",
    "trrioyn",
    "trurgyn"
  )],
    tradapt = .replace_labels(
    standardized_value_labels$tradapt,
    `-2` = "na, see FTRRIOYN"
  ),
    trappli = .replace_labels(
    standardized_value_labels$trappli,
    `-2` = "na, see FTRRIOYN"
  ),
    trdisth = .replace_labels(
    standardized_value_labels$trdisth,
    `-2` = "na, see FTRDISTR"
  ),
    trdistr = .replace_labels(
    standardized_value_labels$trdistr,
    `-2` = "na, see FTRRIOYN"
  ),
    trdomch = .replace_labels(
    standardized_value_labels$trdomch,
    `-2` = "na, see FTRDOMEC"
  ),
    trdomec = .replace_labels(
    standardized_value_labels$trdomec,
    `-2` = "na, see FTRHOMEC"
  ),
    trelddn = .replace_labels(
    standardized_value_labels$trelddn,
    `-2` = "na, see FTRELDER"
  ),
    treldeh = .replace_labels(
    standardized_value_labels$treldeh,
    `-2` = "na, see FTRELDER"
  ),
    trelder = .replace_labels(
    standardized_value_labels$trelder,
    `-2` = "na, see FTRRIOYN"
  ),
    trhomec = .replace_labels(
    standardized_value_labels$trhomec,
    `-2` = "na, see FTRRIOYN"
  ),
    trmeal = .replace_labels(
    standardized_value_labels$trmeal,
    `-2` = "na, see FTRRIOYN"
  ),
    trmealn = .replace_labels(
    standardized_value_labels$trmealn,
    `-2` = "na, see FTRMEAL"
  ),
    trnurdn = .replace_labels(
    standardized_value_labels$trnurdn,
    `-2` = "na, see FTRNURSI"
  ),
    trnursd = .replace_labels(
    standardized_value_labels$trnursd,
    `-2` = "na, see FTRNURSI"
  ),
    trnursh = .replace_labels(
    standardized_value_labels$trnursh,
    `-2` = "na, see FTRNURSI"
  ),
    trnursi = .replace_labels(
    standardized_value_labels$trnursi,
    `-2` = "na, see FTRRIOYN"
  ),
    trperch = .replace_labels(
    standardized_value_labels$trperch,
    `-2` = "na, see FTRPERSC"
  ),
    trpersc = .replace_labels(
    standardized_value_labels$trpersc,
    `-2` = "na, see FTRHOMEC"
  ),
    trrioot = .replace_labels(
    standardized_value_labels$trrioot,
    `-2` = "na, see FTRRIOYN"
  ),
    trurgyn = .replace_labels(
    standardized_value_labels$trurgyn,
    `-2` = "na, see FTRRIOYN"
  )
  ),
  Wave_I_labels = standardized_value_labels[c("truf24c", "trufdac", "trufgui", "trufntc", "trufssc")],
  Wave_J_labels = standardized_value_labels[c("truf24c", "trufdac", "trufgui", "trufntc", "trufssc")],
  Wave_K_labels = standardized_value_labels[c("truf24c", "trufdac", "trufgui", "trufntc", "trufssc")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  tradapt = "categorical",
  trappli = "categorical",
  trdisth = "numeric",
  trdistr = "categorical",
  trdomch = "numeric",
  trdomec = "categorical",
  trelddn = "categorical",
  treldeh = "numeric",
  trelder = "categorical",
  trhomec = "categorical",
  trmeal = "categorical",
  trmealn = "numeric",
  trnurdn = "categorical",
  trnursd = "categorical",
  trnursh = "numeric",
  trnursi = "categorical",
  trperch = "numeric",
  trpersc = "categorical",
  trrioot = "categorical",
  trrioyn = "categorical",
  truf24c = "categorical",
  trufdac = "categorical",
  trufgui = "categorical",
  trufntc = "categorical",
  trufssc = "categorical",
  trurgyn = "categorical"
)

.lasa_fc_710 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "710", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "710", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "710", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "710", waves = .lasa_wave_rows())
)
