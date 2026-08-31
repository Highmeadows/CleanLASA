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

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `E` = c(
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
  ),
  `F` = c(
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
  ),
  `I` = c(
    "truf24c",
    "trufdac",
    "trufgui",
    "trufntc",
    "trufssc"
  ),
  `J` = c(
    "truf24c",
    "trufdac",
    "trufgui",
    "trufntc",
    "trufssc"
  ),
  `K` = c(
    "truf24c",
    "trufdac",
    "trufgui",
    "trufntc",
    "trufssc"
  )
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "no",
  `2` = "yes"
)

standardized_value_labels <- list(
  tradapt = c(
    `-2` = "na, see TRRIOYN",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trappli = c(
    `-2` = "na, see TRRIOYN",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trdisth = c(
    `-2` = "na, see TRDISTR",
    default_missing_labels[c("-1")]
  ),
  trdistr = c(
    `-2` = "na, see TRRIOYN",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trdomch = c(
    `-2` = "na, see TRDOMEC",
    default_missing_labels[c("-1")]
  ),
  trdomec = c(
    `-2` = "na, see TRHOMEC",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trelddn = c(
    `-2` = "na, see TRELDER",
    default_missing_labels[c("-1")],
    `1` = "day treatment",
    `2` = "night treatment",
    `3` = "both: day and night treatment"
  ),
  treldeh = c(
    `-2` = "na, see TRELDER",
    default_missing_labels[c("-1")]
  ),
  trelder = c(
    `-2` = "na, see TRRIOYN",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trhomec = c(
    `-2` = "na, see TRRIOYN",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trmeal = c(
    `-2` = "na, see TRRIOYN",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trmealn = c(
    `-2` = "na, see TRMEAL",
    default_missing_labels[c("-1")]
  ),
  trnurdn = c(
    `-2` = "na, see TRNURSI",
    default_missing_labels[c("-1")],
    `1` = "day treatment",
    `2` = "night treatment",
    `3` = "both: day and night treatment"
  ),
  trnursd = c(
    `-2` = "na, see TRNURSI",
    default_missing_labels[c("-1")],
    `1` = "somatic",
    `2` = "psychogeriatric"
  ),
  trnursh = c(
    `-2` = "na, see TRNURSI",
    default_missing_labels[c("-1")]
  ),
  trnursi = c(
    `-2` = "na, see TRRIOYN",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trperch = c(
    `-2` = "na, see TRPERSC",
    default_missing_labels[c("-1")]
  ),
  trpersc = c(
    `-2` = "na, see TRHOMEC",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trrioot = c(
    `-2` = "na, see TRRIOYN",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trrioyn = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1")],
    `2` = "no, but expect one soon",
    `3` = "yes",
    `4` = "answer 2 + 3"
  ),
  truf24c = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trufdac = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trufgui = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trufntc = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trufssc = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  trurgyn = c(
    `-2` = "na, see TRRIOYN",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1")],
    `2` = "yes, urgent",
    `3` = "yes, very urgent"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
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
    standardized_value_labels,
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
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "710", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "710", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "710", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "710", waves = .lasa_wave_rows())
)

.lasa_fc_710 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

