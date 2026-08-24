## LASA filecode 133 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  quli01 = "SF12-01: GH, general health",
  quli02 = "SF12-02: PF, moderate activities",
  quli03 = "SF12-03: PF, climbing stairs",
  quli04 = "SF12-04: RP, physical accomplished less",
  quli05 = "SF12-05: RP, limited in activities",
  quli06 = "SF12-06: RE, mental accomplished less",
  quli07 = "SF12-07: RE, work not careful",
  quli08 = "SF12-08: BP, pain",
  quli09 = "SF12-09: MH, calm",
  quli10 = "SF12-10: VT, energy",
  quli11 = "SF12-11: MH, blue",
  quli12 = "SF12-12: SF, social activities",
  quli13 = "WHOQOL: rating quality of life",
  quli14 = "WHOQOL: feeling life is meaningful"
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
  Wave_E_labels = harmonized_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
  Wave_F_labels = harmonized_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
  Wave_G_labels = harmonized_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
  Wave_H_labels = harmonized_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
  Wave_3B_labels = harmonized_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  quli01 = c(
    `-1` = "not available",
    `1` = "excellent",
    `2` = "very good",
    `3` = "good",
    `4` = "fair",
    `5` = "poor"
  ),
  quli02 = c(
    `-1` = "not available",
    `1` = "yes, limited a lot",
    `2` = "yes, limited a little",
    `3` = "no, not limited at all"
  ),
  quli03 = c(
    `-1` = "not available",
    `1` = "yes, limited a lot",
    `2` = "yes, limited a little",
    `3` = "no, not limited at all"
  ),
  quli04 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  quli05 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  quli06 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  quli07 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  quli08 = c(
    `-1` = "not available",
    `1` = "not at all",
    `2` = "a little bit",
    `3` = "moderately",
    `4` = "quite a bit",
    `5` = "extremely"
  ),
  quli09 = c(
    `-1` = "not available",
    `1` = "all of the time",
    `2` = "most of the time",
    `3` = "a good bit of the time",
    `4` = "some of the time",
    `5` = "a little of the time",
    `6` = "none of the time"
  ),
  quli10 = c(
    `-1` = "not available",
    `1` = "all of the time",
    `2` = "most of the time",
    `3` = "a good bit of the time",
    `4` = "some of the time",
    `5` = "a little of the time",
    `6` = "none of the time"
  ),
  quli11 = c(
    `-1` = "not available",
    `1` = "all of the time",
    `2` = "most of the time",
    `3` = "a good bit of the time",
    `4` = "some of the time",
    `5` = "a little of the time",
    `6` = "none of the time"
  ),
  quli12 = c(
    `-1` = "not available",
    `1` = "all of the time",
    `2` = "most of the time",
    `3` = "a good bit of the time",
    `4` = "some of the time",
    `5` = "a little of the time",
    `6` = "none of the time"
  ),
  quli13 = c(
    `-1` = "not available",
    `1` = "very poor",
    `2` = "rather poor",
    `3` = "neither poor nor good",
    `4` = "rather good",
    `5` = "very good"
  ),
  quli14 = c(
    `-1` = "not available",
    `1` = "not at all",
    `2` = "a little",
    `3` = "a moderate amount",
    `4` = "very much",
    `5` = "an extreme amount"
  )
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
    quli01 = .replace_labels(
    standardized_value_labels$quli01,
    `-1` = "asked, no answer"
  ),
    quli02 = .replace_labels(
    standardized_value_labels$quli02,
    `-1` = "asked, no answer"
  ),
    quli03 = .replace_labels(
    standardized_value_labels$quli03,
    `-1` = "asked, no answer"
  ),
    quli04 = .replace_labels(
    standardized_value_labels$quli04,
    `-1` = "asked, no answer"
  ),
    quli05 = .replace_labels(
    standardized_value_labels$quli05,
    `-1` = "asked, no answer"
  ),
    quli06 = .replace_labels(
    standardized_value_labels$quli06,
    `-1` = "asked, no answer"
  ),
    quli07 = .replace_labels(
    standardized_value_labels$quli07,
    `-1` = "asked, no answer"
  ),
    quli08 = .replace_labels(
    standardized_value_labels$quli08,
    `-1` = "asked, no answer"
  ),
    quli09 = .replace_labels(
    standardized_value_labels$quli09,
    `-1` = "asked, no answer"
  ),
    quli10 = .replace_labels(
    standardized_value_labels$quli10,
    `-1` = "asked, no answer"
  ),
    quli11 = .replace_labels(
    standardized_value_labels$quli11,
    `-1` = "asked, no answer"
  ),
    quli12 = .replace_labels(
    standardized_value_labels$quli12,
    `-1` = "asked, no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
    quli01 = .replace_labels(
    standardized_value_labels$quli01,
    `-1` = "asked, no answer"
  ),
    quli02 = .replace_labels(
    standardized_value_labels$quli02,
    `-1` = "asked, no answer"
  ),
    quli03 = .replace_labels(
    standardized_value_labels$quli03,
    `-1` = "asked, no answer"
  ),
    quli04 = .replace_labels(
    standardized_value_labels$quli04,
    `-1` = "asked, no answer"
  ),
    quli05 = .replace_labels(
    standardized_value_labels$quli05,
    `-1` = "asked, no answer"
  ),
    quli06 = .replace_labels(
    standardized_value_labels$quli06,
    `-1` = "asked, no answer"
  ),
    quli07 = .replace_labels(
    standardized_value_labels$quli07,
    `-1` = "asked, no answer"
  ),
    quli08 = .replace_labels(
    standardized_value_labels$quli08,
    `-1` = "asked, no answer"
  ),
    quli09 = .replace_labels(
    standardized_value_labels$quli09,
    `-1` = "asked, no answer"
  ),
    quli10 = .replace_labels(
    standardized_value_labels$quli10,
    `-1` = "asked, no answer"
  ),
    quli11 = .replace_labels(
    standardized_value_labels$quli11,
    `-1` = "asked, no answer"
  ),
    quli12 = .replace_labels(
    standardized_value_labels$quli12,
    `-1` = "asked, no answer"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
    quli01 = .replace_labels(
    standardized_value_labels$quli01,
    `-1` = "asked, no answer"
  ),
    quli02 = .replace_labels(
    standardized_value_labels$quli02,
    `-1` = "asked, no answer"
  ),
    quli03 = .replace_labels(
    standardized_value_labels$quli03,
    `-1` = "asked, no answer"
  ),
    quli04 = .replace_labels(
    standardized_value_labels$quli04,
    `-1` = "asked, no answer"
  ),
    quli05 = .replace_labels(
    standardized_value_labels$quli05,
    `-1` = "asked, no answer"
  ),
    quli06 = .replace_labels(
    standardized_value_labels$quli06,
    `-1` = "asked, no answer"
  ),
    quli07 = .replace_labels(
    standardized_value_labels$quli07,
    `-1` = "asked, no answer"
  ),
    quli08 = .replace_labels(
    standardized_value_labels$quli08,
    `-1` = "asked, no answer"
  ),
    quli09 = .replace_labels(
    standardized_value_labels$quli09,
    `-1` = "asked, no answer"
  ),
    quli10 = .replace_labels(
    standardized_value_labels$quli10,
    `-1` = "asked, no answer"
  ),
    quli11 = .replace_labels(
    standardized_value_labels$quli11,
    `-1` = "asked, no answer"
  ),
    quli12 = .replace_labels(
    standardized_value_labels$quli12,
    `-1` = "asked, no answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
    quli01 = .replace_labels(
    standardized_value_labels$quli01,
    `-1` = "asked, no answer"
  ),
    quli02 = .replace_labels(
    standardized_value_labels$quli02,
    `-1` = "asked, no answer"
  ),
    quli03 = .replace_labels(
    standardized_value_labels$quli03,
    `-1` = "asked, no answer"
  ),
    quli04 = .replace_labels(
    standardized_value_labels$quli04,
    `-1` = "asked, no answer"
  ),
    quli05 = .replace_labels(
    standardized_value_labels$quli05,
    `-1` = "asked, no answer"
  ),
    quli06 = .replace_labels(
    standardized_value_labels$quli06,
    `-1` = "asked, no answer"
  ),
    quli07 = .replace_labels(
    standardized_value_labels$quli07,
    `-1` = "asked, no answer"
  ),
    quli08 = .replace_labels(
    standardized_value_labels$quli08,
    `-1` = "asked, no answer"
  ),
    quli09 = .replace_labels(
    standardized_value_labels$quli09,
    `-1` = "asked, no answer"
  ),
    quli10 = .replace_labels(
    standardized_value_labels$quli10,
    `-1` = "asked, no answer"
  ),
    quli11 = .replace_labels(
    standardized_value_labels$quli11,
    `-1` = "asked, no answer"
  ),
    quli12 = .replace_labels(
    standardized_value_labels$quli12,
    `-1` = "asked, no answer"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
    quli01 = .replace_labels(
    standardized_value_labels$quli01,
    `-1` = "asked, no answer"
  ),
    quli02 = .replace_labels(
    standardized_value_labels$quli02,
    `-1` = "asked, no answer"
  ),
    quli03 = .replace_labels(
    standardized_value_labels$quli03,
    `-1` = "asked, no answer"
  ),
    quli04 = .replace_labels(
    standardized_value_labels$quli04,
    `-1` = "asked, no answer"
  ),
    quli05 = .replace_labels(
    standardized_value_labels$quli05,
    `-1` = "asked, no answer"
  ),
    quli06 = .replace_labels(
    standardized_value_labels$quli06,
    `-1` = "asked, no answer"
  ),
    quli07 = .replace_labels(
    standardized_value_labels$quli07,
    `-1` = "asked, no answer"
  ),
    quli08 = .replace_labels(
    standardized_value_labels$quli08,
    `-1` = "asked, no answer"
  ),
    quli09 = .replace_labels(
    standardized_value_labels$quli09,
    `-1` = "asked, no answer"
  ),
    quli10 = .replace_labels(
    standardized_value_labels$quli10,
    `-1` = "asked, no answer"
  ),
    quli11 = .replace_labels(
    standardized_value_labels$quli11,
    `-1` = "asked, no answer"
  ),
    quli12 = .replace_labels(
    standardized_value_labels$quli12,
    `-1` = "asked, no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "quli01",
    "quli02",
    "quli03",
    "quli04",
    "quli05",
    "quli06",
    "quli07",
    "quli08",
    "quli09",
    "quli10",
    "quli11",
    "quli12"
  )],
    quli01 = .replace_labels(
    standardized_value_labels$quli01,
    `-1` = "asked, no answer"
  ),
    quli02 = .replace_labels(
    standardized_value_labels$quli02,
    `-1` = "asked, no answer"
  ),
    quli03 = .replace_labels(
    standardized_value_labels$quli03,
    `-1` = "asked, no answer"
  ),
    quli04 = .replace_labels(
    standardized_value_labels$quli04,
    `-1` = "asked, no answer"
  ),
    quli05 = .replace_labels(
    standardized_value_labels$quli05,
    `-1` = "asked, no answer"
  ),
    quli06 = .replace_labels(
    standardized_value_labels$quli06,
    `-1` = "asked, no answer"
  ),
    quli07 = .replace_labels(
    standardized_value_labels$quli07,
    `-1` = "asked, no answer"
  ),
    quli08 = .replace_labels(
    standardized_value_labels$quli08,
    `-1` = "asked, no answer"
  ),
    quli09 = .replace_labels(
    standardized_value_labels$quli09,
    `-1` = "asked, no answer"
  ),
    quli10 = .replace_labels(
    standardized_value_labels$quli10,
    `-1` = "asked, no answer"
  ),
    quli11 = .replace_labels(
    standardized_value_labels$quli11,
    `-1` = "asked, no answer"
  ),
    quli12 = .replace_labels(
    standardized_value_labels$quli12,
    `-1` = "asked, no answer"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    quli01 = .replace_labels(
    standardized_value_labels$quli01,
    `-1` = "asked, no answer"
  ),
    quli02 = .replace_labels(
    standardized_value_labels$quli02,
    `-1` = "asked, no answer"
  ),
    quli03 = .replace_labels(
    standardized_value_labels$quli03,
    `-1` = "asked, no answer"
  ),
    quli04 = .replace_labels(
    standardized_value_labels$quli04,
    `-1` = "asked, no answer"
  ),
    quli05 = .replace_labels(
    standardized_value_labels$quli05,
    `-1` = "asked, no answer"
  ),
    quli06 = .replace_labels(
    standardized_value_labels$quli06,
    `-1` = "asked, no answer"
  ),
    quli07 = .replace_labels(
    standardized_value_labels$quli07,
    `-1` = "asked, no answer"
  ),
    quli08 = .replace_labels(
    standardized_value_labels$quli08,
    `-1` = "asked, no answer"
  ),
    quli09 = .replace_labels(
    standardized_value_labels$quli09,
    `-1` = "asked, no answer"
  ),
    quli10 = .replace_labels(
    standardized_value_labels$quli10,
    `-1` = "asked, no answer"
  ),
    quli11 = .replace_labels(
    standardized_value_labels$quli11,
    `-1` = "asked, no answer"
  ),
    quli12 = .replace_labels(
    standardized_value_labels$quli12,
    `-1` = "asked, no answer"
  ),
    quli13 = .replace_labels(
    standardized_value_labels$quli13,
    `-1` = "asked, no answer"
  ),
    quli14 = .replace_labels(
    standardized_value_labels$quli14,
    `-1` = "asked, no answer"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    quli01 = .replace_labels(
    standardized_value_labels$quli01,
    `-1` = "asked, no answer"
  ),
    quli02 = .replace_labels(
    standardized_value_labels$quli02,
    `-1` = "asked, no answer"
  ),
    quli03 = .replace_labels(
    standardized_value_labels$quli03,
    `-1` = "asked, no answer"
  ),
    quli04 = .replace_labels(
    standardized_value_labels$quli04,
    `-1` = "asked, no answer"
  ),
    quli05 = .replace_labels(
    standardized_value_labels$quli05,
    `-1` = "asked, no answer"
  ),
    quli06 = .replace_labels(
    standardized_value_labels$quli06,
    `-1` = "asked, no answer"
  ),
    quli07 = .replace_labels(
    standardized_value_labels$quli07,
    `-1` = "asked, no answer"
  ),
    quli08 = .replace_labels(
    standardized_value_labels$quli08,
    `-1` = "asked, no answer"
  ),
    quli09 = .replace_labels(
    standardized_value_labels$quli09,
    `-1` = "asked, no answer"
  ),
    quli10 = .replace_labels(
    standardized_value_labels$quli10,
    `-1` = "asked, no answer"
  ),
    quli11 = .replace_labels(
    standardized_value_labels$quli11,
    `-1` = "asked, no answer"
  ),
    quli12 = .replace_labels(
    standardized_value_labels$quli12,
    `-1` = "asked, no answer"
  ),
    quli13 = .replace_labels(
    standardized_value_labels$quli13,
    `-1` = "asked, no answer"
  ),
    quli14 = .replace_labels(
    standardized_value_labels$quli14,
    `-1` = "asked, no answer"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    quli01 = .replace_labels(
    standardized_value_labels$quli01,
    `-1` = "asked, no answer"
  ),
    quli02 = .replace_labels(
    standardized_value_labels$quli02,
    `-1` = "asked, no answer"
  ),
    quli03 = .replace_labels(
    standardized_value_labels$quli03,
    `-1` = "asked, no answer"
  ),
    quli04 = .replace_labels(
    standardized_value_labels$quli04,
    `-1` = "asked, no answer"
  ),
    quli05 = .replace_labels(
    standardized_value_labels$quli05,
    `-1` = "asked, no answer"
  ),
    quli06 = .replace_labels(
    standardized_value_labels$quli06,
    `-1` = "asked, no answer"
  ),
    quli07 = .replace_labels(
    standardized_value_labels$quli07,
    `-1` = "asked, no answer"
  ),
    quli08 = .replace_labels(
    standardized_value_labels$quli08,
    `-1` = "asked, no answer"
  ),
    quli09 = .replace_labels(
    standardized_value_labels$quli09,
    `-1` = "asked, no answer"
  ),
    quli10 = .replace_labels(
    standardized_value_labels$quli10,
    `-1` = "asked, no answer"
  ),
    quli11 = .replace_labels(
    standardized_value_labels$quli11,
    `-1` = "asked, no answer"
  ),
    quli12 = .replace_labels(
    standardized_value_labels$quli12,
    `-1` = "asked, no answer"
  ),
    quli13 = .replace_labels(
    standardized_value_labels$quli13,
    `-1` = "asked, no answer"
  ),
    quli14 = .replace_labels(
    standardized_value_labels$quli14,
    `-1` = "asked, no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  quli01 = "categorical",
  quli02 = "categorical",
  quli03 = "categorical",
  quli04 = "categorical",
  quli05 = "categorical",
  quli06 = "categorical",
  quli07 = "categorical",
  quli08 = "categorical",
  quli09 = "categorical",
  quli10 = "categorical",
  quli11 = "categorical",
  quli12 = "categorical",
  quli13 = "categorical",
  quli14 = "categorical"
)

.lasa_fc_133 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "133", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "133", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "133", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "133", waves = .lasa_wave_rows())
)
