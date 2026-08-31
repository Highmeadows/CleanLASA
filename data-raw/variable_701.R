## LASA filecode 701 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  trhinde = "Type of housing",
  trmarst = "Marital status",
  trmochh = "Month change type of housing",
  trmochm = "Month change marital status",
  trmochp = "Month change partner status",
  trmoved = "R moved since last interview",
  trmovmo = "Moved since last interview: month",
  trmovye = "Moved since last interview: year",
  trnuper = "Number of other persons in household (partner excluded)",
  trpartn = "Household partner available",
  tryechh = "Year change type of housing",
  tryechm = "Year change marital status",
  tryechp = "Year change partner status"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `C` = c(
    "trhinde",
    "trmarst",
    "trmochh",
    "trmochm",
    "trmochp",
    "trnuper",
    "trpartn",
    "tryechh",
    "tryechm",
    "tryechp"
  ),
  `D` = c(
    "trhinde",
    "trmarst",
    "trmochh",
    "trmochm",
    "trmochp",
    "trnuper",
    "trpartn",
    "tryechh",
    "tryechm",
    "tryechp"
  ),
  `E` = c(
    "trhinde",
    "trmarst",
    "trmochh",
    "trmochm",
    "trmochp",
    "trnuper",
    "trpartn",
    "tryechh",
    "tryechm",
    "tryechp"
  ),
  `F` = c(
    "trhinde",
    "trmarst",
    "trmochh",
    "trmochm",
    "trmochp",
    "trnuper",
    "trpartn",
    "tryechh",
    "tryechm",
    "tryechp"
  ),
  `G` = c(
    "trhinde",
    "trmarst",
    "trmochh",
    "trmochm",
    "trmochp",
    "trnuper",
    "trpartn",
    "tryechh",
    "tryechm",
    "tryechp"
  ),
  `H` = c(
    "trhinde",
    "trmarst",
    "trmochm",
    "trmochp",
    "trmoved",
    "trmovmo",
    "trmovye",
    "trnuper",
    "trpartn",
    "tryechm",
    "tryechp"
  ),
  `I` = c(
    "trhinde",
    "trmarst",
    "trmochm",
    "trmochp",
    "trmoved",
    "trmovmo",
    "trmovye",
    "trnuper",
    "trpartn",
    "tryechm",
    "tryechp"
  ),
  `J` = c(
    "trhinde",
    "trmarst",
    "trmochm",
    "trmochp",
    "trmoved",
    "trmovmo",
    "trmovye",
    "trnuper",
    "trpartn",
    "tryechm",
    "tryechp"
  ),
  `K` = c(
    "trhinde",
    "trmarst",
    "trmochm",
    "trmochp",
    "trmoved",
    "trmovmo",
    "trmovye",
    "trnuper",
    "trpartn",
    "tryechm",
    "tryechp"
  )
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    trhinde = "type of housing",
    trmarst = "marital status",
    trmochh = "month change type of housing",
    trmochm = "month change marital status",
    trmochp = "month change partner status",
    trnuper = "number of other persons in household (partner excluded)",
    tryechh = "year change type of housing",
    tryechm = "year change marital status",
    tryechp = "year change partner status"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    trnuper = "number of other persons in household (partner excluded)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    trnuper = "number of other persons in household (partner excluded)"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    trnuper = "number of other persons in household (partner excluded)"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    trnuper = "number of other persons in household (partner excluded)"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    trnuper = "Number of other persons in household"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    trnuper = "Number of other persons in household"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    trnuper = "Number of other persons in household"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    trnuper = "Number of other persons in household"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trhinde = c(
    default_missing_labels[c("-1")],
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing home-somatic",
    `4` = "nursing home-psychogeriatric",
    `5` = "hospital",
    `6` = "psychiatric hospital",
    `8` = "monastery"
  ),
  trmarst = c(
    default_missing_labels[c("-1")],
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed",
    `5` = "registered partnership"
  ),
  trmochh = c(
    `-2` = "not changed",
    default_missing_labels[c("-1")],
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
  trmochm = c(
    `-3` = "no answer TRMARST",
    `-2` = "not changed",
    default_missing_labels[c("-1")],
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
  trmochp = c(
    `-3` = "no answer TRPARTN",
    `-2` = "not changed",
    default_missing_labels[c("-1")],
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
  trmoved = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  trmovmo = c(
    `-2` = "not moved",
    default_missing_labels[c("-1")],
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
  trmovye = c(
    `-2` = "not moved",
    default_missing_labels[c("-1")]
  ),
  trnuper = c(
    `-2` = "R not independent",
    default_missing_labels[c("-1")]
  ),
  trpartn = c(
    default_missing_labels[c("-1")],
    `1` = "not living with a partner",
    `2` = "partner, married",
    `3` = "partner, not married",
    `4` = "partner, outside household",
    `5` = "combination 2 + 4"
  ),
  tryechh = c(
    `-2` = "not changed",
    default_missing_labels[c("-1")]
  ),
  tryechm = c(
    `-3` = "no answer TRMARST",
    `-2` = "not changed",
    default_missing_labels[c("-1")]
  ),
  tryechp = c(
    `-3` = "no answer TRPARTN",
    `-2` = "not changed",
    default_missing_labels[c("-1")]
  )
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    trhinde = c(
    `-1` = "asked, no answer",
    `1` = "independent",
    `2` = "residential home",
    `3` = "nursing home-somatic",
    `4` = "nursing home-psychogeriatric",
    `5` = "hospital",
    `6` = "psychiatric hospital"
  ),
    trmarst = c(
    `-1` = "asked, no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed"
  ),
    trmochm = .replace_labels(
    standardized_value_labels$trmochm,
    `-3` = "no answer CTRMARST"
  ),
    trmochp = .replace_labels(
    standardized_value_labels$trmochp,
    `-3` = "no answer CTRPARTN"
  ),
    trpartn = c(
    `-1` = "asked, no answer",
    `1` = "not living with a partner",
    `2` = "partner, married",
    `3` = "partner, not married"
  ),
    tryechm = .replace_labels(
    standardized_value_labels$tryechm,
    `-3` = "no answer CTRMARST"
  ),
    tryechp = .replace_labels(
    standardized_value_labels$tryechp,
    `-3` = "no answer CTRPARTN"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    trmarst = c(
    `-1` = "asked, no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed"
  ),
    trmochm = .replace_labels(
    standardized_value_labels$trmochm,
    `-3` = "no answer DTRMARST"
  ),
    trmochp = .replace_labels(
    standardized_value_labels$trmochp,
    `-3` = "no answer DTRPARTN"
  ),
    trpartn = c(
    `-1` = "asked, no answer",
    `1` = "not living with a partner",
    `2` = "partner, married",
    `3` = "partner, not married",
    `4` = "partner, outside household"
  ),
    tryechm = .replace_labels(
    standardized_value_labels$tryechm,
    `-3` = "no answer DTRMARST"
  ),
    tryechp = .replace_labels(
    standardized_value_labels$tryechp,
    `-3` = "no answer DTRPARTN"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    trmarst = c(
    `-1` = "asked, no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed"
  ),
    trmochm = .replace_labels(
    standardized_value_labels$trmochm,
    `-3` = "no answer ETRMARST"
  ),
    trmochp = .replace_labels(
    standardized_value_labels$trmochp,
    `-3` = "no answer ETRPARTN"
  ),
    trpartn = c(
    `-1` = "asked, no answer",
    `1` = "not living with a partner",
    `2` = "partner, married",
    `3` = "partner, not married",
    `4` = "partner, outside household"
  ),
    tryechm = .replace_labels(
    standardized_value_labels$tryechm,
    `-3` = "no answer ETRMARST"
  ),
    tryechp = .replace_labels(
    standardized_value_labels$tryechp,
    `-3` = "no answer ETRPARTN"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    trmarst = c(
    `-1` = "asked, no answer",
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed"
  ),
    trmochm = .replace_labels(
    standardized_value_labels$trmochm,
    `-3` = "no answer FTRMARST"
  ),
    trmochp = .replace_labels(
    standardized_value_labels$trmochp,
    `-3` = "no answer FTRPARTN"
  ),
    tryechm = .replace_labels(
    standardized_value_labels$tryechm,
    `-3` = "no answer FTRMARST"
  ),
    tryechp = .replace_labels(
    standardized_value_labels$tryechp,
    `-3` = "no answer FTRPARTN"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    trmochm = .replace_labels(
    standardized_value_labels$trmochm,
    `-3` = "no answer GTRMARST"
  ),
    trmochp = .replace_labels(
    standardized_value_labels$trmochp,
    `-3` = "no answer GTRPARTN"
  ),
    tryechm = .replace_labels(
    standardized_value_labels$tryechm,
    `-3` = "no answer GTRMARST"
  ),
    tryechp = .replace_labels(
    standardized_value_labels$tryechp,
    `-3` = "no answer GTRPARTN"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    trmochm = c(
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
    trmochp = c(
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
    trmovmo = .replace_labels(
    standardized_value_labels$trmovmo,
    `-1` = "asked no answer"
  ),
    trmovye = .replace_labels(
    standardized_value_labels$trmovye,
    `-1` = "asked no answer"
  ),
    trpartn = c(
    `-1` = "asked, no answer",
    `1` = "not living with a partner",
    `2` = "partner, married",
    `3` = "partner, not married",
    `4` = "partner, outside household"
  ),
    tryechm = c(`-2` = "not changed", `-1` = "asked no answer"),
    tryechp = c(`-2` = "not changed", `-1` = "asked no answer")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    trmochm = c(
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
    trmochp = c(
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
    trmovmo = .replace_labels(
    standardized_value_labels$trmovmo,
    `-1` = "asked no answer"
  ),
    trmovye = .replace_labels(
    standardized_value_labels$trmovye,
    `-1` = "asked no answer"
  ),
    trpartn = c(
    `-1` = "asked, no answer",
    `1` = "not living with a partner",
    `2` = "partner, married",
    `3` = "partner, not married",
    `4` = "partner, outside household"
  ),
    tryechm = c(`-2` = "not changed", `-1` = "asked no answer"),
    tryechp = c(`-2` = "not changed", `-1` = "asked no answer")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    trmochm = c(
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
    trmochp = c(
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
    trmovmo = .replace_labels(
    standardized_value_labels$trmovmo,
    `-1` = "asked no answer"
  ),
    trmovye = .replace_labels(
    standardized_value_labels$trmovye,
    `-1` = "asked no answer"
  ),
    trpartn = c(
    `-1` = "asked, no answer",
    `1` = "not living with a partner",
    `2` = "partner, married",
    `3` = "partner, not married",
    `4` = "partner, outside household"
  ),
    tryechm = c(`-2` = "not changed", `-1` = "asked no answer"),
    tryechp = c(`-2` = "not changed", `-1` = "asked no answer")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    trmarst = c(
    `1` = "never married",
    `2` = "married",
    `3` = "divorced",
    `4` = "widowed",
    `5` = "registered partnership"
  ),
    trmochm = c(
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
    trmochp = c(
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
    trmovmo = .replace_labels(
    standardized_value_labels$trmovmo,
    `-1` = "asked no answer"
  ),
    trmovye = .replace_labels(
    standardized_value_labels$trmovye,
    `-1` = "asked no answer"
  ),
    trpartn = c(
    `-1` = "asked, no answer",
    `1` = "not living with a partner",
    `2` = "partner, married",
    `3` = "partner, not married",
    `4` = "partner, outside household"
  ),
    tryechm = c(`-2` = "not changed", `-1` = "asked no answer"),
    tryechp = c(`-2` = "not changed", `-1` = "asked no answer")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  trhinde = "categorical",
  trmarst = "categorical",
  trmochh = "categorical",
  trmochm = "categorical",
  trmochp = "categorical",
  trmoved = "categorical",
  trmovmo = "categorical",
  trmovye = "numeric",
  trnuper = "numeric",
  trpartn = "categorical",
  tryechh = "numeric",
  tryechm = "numeric",
  tryechp = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "701", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "701", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "701", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "701", waves = .lasa_wave_rows())
)

.lasa_fc_701 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

