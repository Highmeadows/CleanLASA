## LASA filecode 155 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcodt1 = "Coding: trial 1",
  mcodt2 = "Coding: trial 2",
  mcodt3 = "Coding: trial 3",
  mcodtp = "particularities: no particularities",
  mcodtp1 = "particularities: others present",
  mcodtp2 = "particularities: visually handicapped",
  mcodtp3 = "particularities: radio or tv noise",
  mcodtp4 = "particularities: interrupted",
  mcodtp5 = "particularities: other reason",
  mcodtpoth = "particularities other specification",
  mcormis = "Coding task: reason no trail(s)",
  mnotest = "(part of) Coding test done"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    mcormis = "coding task: reason no trial(s)"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    mcormis = "coding task: reason no trial(s)"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    mcormis = "coding task: reason no trial(s)"
  ),
  Wave_E_labels = harmonized_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mnotest"
  )],
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    mcormis = "coding task: reason no trial(s)"
  ),
  Wave_F_labels = harmonized_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcormis",
    "mnotest"
  )],
  Wave_G_labels = harmonized_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcormis",
    "mnotest"
  )],
  Wave_H_labels = harmonized_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcormis",
    "mnotest"
  )],
  Wave_3B_labels = harmonized_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcormis",
    "mnotest"
  )],
  Wave_I_labels = harmonized_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mnotest"
  )],
  Wave_J_labels = harmonized_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcodtpoth",
    "mnotest"
  )],
  Wave_K_labels = harmonized_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mnotest"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcodt1 = c(`-4` = "no valid data", `-1` = "no trial"),
  mcodt2 = c(`-4` = "no valid data", `-1` = "no trial"),
  mcodt3 = c(`-4` = "no valid data", `-1` = "no trial"),
  mcodtp = c(
    `-4` = "no valid data",
    `-3` = "no test",
    `-2` = "no particularities",
    `0` = "not mentioned / no",
    `1` = "mentioned / yes"
  ),
  mcodtp1 = c(
    `-4` = "no valid data",
    `-3` = "no test",
    `-2` = "no particularities",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcodtp2 = c(
    `-4` = "no valid data",
    `-3` = "no test",
    `-2` = "no particularities",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcodtp3 = c(
    `-4` = "no valid data",
    `-3` = "no test",
    `-2` = "no particularities",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcodtp4 = c(
    `-4` = "no valid data",
    `-3` = "no test",
    `-2` = "no particularities",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcodtp5 = c(
    `-4` = "no valid data",
    `-3` = "no test",
    `-2` = "no particularities",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcodtpoth = c(
    `-4` = "no valid data",
    `-3` = "no test",
    `-2` = "no particularities",
    `-1` = "no others mentioned",
    `1` = "extra instructions",
    `2` = "other disturbing factors",
    `3` = "R confused/not fit",
    `4` = "stopped/technical",
    `5` = "not specified"
  ),
  mcormis = c(
    `-4` = "no valid data",
    `-2` = "valid score",
    `0` = "complete test done / to be coded",
    `1` = "visus problems / short interview",
    `2` = "refused / interview terminated",
    `3` = "cognitive / too many missings",
    `4` = "physical / refused test",
    `5` = "technical / not able to (cognitive)",
    `6` = "unknown / not able to (physical)",
    `7` = "technical/interruption"
  ),
  mnotest = c(
    `-4` = "no valid data",
    `0` = "test not done",
    `1` = "1 trial done",
    `2` = "2 trials done",
    `3` = "3 trials done"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("mcodt1", "mcodt2", "mcodt3", "mcodtp", "mcodtpoth", "mcormis", "mnotest")],
    mcodt1 = c(`-1` = "no trial"),
    mcodt2 = c(`-1` = "no trial"),
    mcodt3 = c(`-1` = "no trial"),
    mcodtp = c(`-3` = "no test", `-2` = "no particularities", `0` = "not mentioned", `1` = "mentioned"),
    mcodtpoth = c(
    `-3` = "no test",
    `-2` = "no particularities",
    `-1` = "no others mentioned",
    `1` = "extra instructions",
    `2` = "other disturbing factors",
    `3` = "R confused/not fit",
    `4` = "stopped/technical",
    `5` = "not specified"
  ),
    mcormis = c(
    `-4` = "no valid data",
    `0` = "complete test done",
    `1` = "visus problems",
    `2` = "refused",
    `3` = "cognitive",
    `4` = "physical",
    `5` = "technical",
    `6` = "unknown"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("mcodt1", "mcodt2", "mcodt3", "mcodtp", "mcodtpoth", "mcormis", "mnotest")],
    mcodtp = .replace_labels(
    standardized_value_labels$mcodtp,
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcodtpoth = c(
    `-3` = "no test",
    `-2` = "no particularities",
    `-1` = "no others mentioned",
    `1` = "extra instructions",
    `2` = "other disturbing factors",
    `3` = "R confused/not fit",
    `4` = "stopped/technical",
    `5` = "not specified"
  ),
    mcormis = c(
    `-4` = "no valid data",
    `0` = "complete test done",
    `1` = "visus problems",
    `2` = "refused",
    `3` = "cognitive",
    `4` = "physical",
    `5` = "technical",
    `6` = "unknown"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("mcodt1", "mcodt2", "mcodt3", "mcodtp", "mcodtpoth", "mcormis", "mnotest")],
    mcodtp = .replace_labels(
    standardized_value_labels$mcodtp,
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcodtpoth = c(
    `-3` = "no test",
    `-2` = "no particularities",
    `-1` = "no others mentioned",
    `1` = "extra instructions",
    `2` = "other disturbing factors",
    `3` = "R confused/not fit",
    `4` = "stopped/technical",
    `5` = "not specified"
  ),
    mcormis = c(
    `-4` = "no valid data",
    `0` = "complete test done",
    `1` = "visus problems",
    `2` = "refused",
    `3` = "cognitive",
    `4` = "physical",
    `5` = "technical",
    `6` = "unknown"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("mcodt1", "mcodt2", "mcodt3", "mcodtp", "mnotest")],
    mcodtp = .replace_labels(
    standardized_value_labels$mcodtp,
    `0` = "not mentioned",
    `1` = "mentioned"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("mcodt1", "mcodt2", "mcodt3", "mcodtpoth", "mcormis", "mnotest")],
    mcodtpoth = c(
    `-3` = "no test",
    `-2` = "no particularities",
    `-1` = "no others mentioned",
    `1` = "extra instructions",
    `2` = "other disturbing factors",
    `3` = "R confused/not fit",
    `4` = "stopped/technical",
    `5` = "not specified"
  ),
    mcormis = c(
    `-4` = "no valid data",
    `0` = "complete test done",
    `1` = "visus problems",
    `2` = "refused",
    `3` = "cognitive",
    `4` = "physical",
    `5` = "technical",
    `6` = "unknown"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcormis",
    "mnotest"
  )],
    mcodtp = c(`-4` = "no valid data", `-3` = "no test", `0` = "no", `1` = "yes"),
    mcormis = c(
    `-2` = "valid score",
    `0` = "to be coded",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical/interruption"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcormis",
    "mnotest"
  )],
    mcodtp = c(`-4` = "no valid data", `-3` = "no test", `0` = "no", `1` = "yes"),
    mcormis = c(
    `-2` = "valid score",
    `0` = "to be coded",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical/interruption"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcormis",
    "mnotest"
  )],
    mcodtp = c(`-4` = "no valid data", `-3` = "no test", `0` = "no", `1` = "yes"),
    mcormis = c(
    `-2` = "valid score",
    `0` = "to be coded",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical/interruption"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcormis",
    "mnotest"
  )],
    mcodtp = c(`-4` = "no valid data", `-3` = "no test", `0` = "no", `1` = "yes"),
    mcormis = c(
    `-2` = "valid score",
    `0` = "to be coded",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test",
    `5` = "not able to (cognitive)",
    `6` = "not able to (physical)",
    `7` = "technical/interruption"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mnotest"
  )],
    mcodtp = c(`-4` = "no valid data", `-3` = "no test", `0` = "no", `1` = "yes")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mcodtpoth",
    "mnotest"
  )],
    mcodtp = c(`-4` = "no valid data", `-3` = "no test", `0` = "no", `1` = "yes")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcodt1",
    "mcodt2",
    "mcodt3",
    "mcodtp",
    "mcodtp1",
    "mcodtp2",
    "mcodtp3",
    "mcodtp4",
    "mcodtp5",
    "mnotest"
  )],
    mcodtp = c(`-4` = "no valid data", `-3` = "no test", `0` = "no", `1` = "yes")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mcodt1 = "numeric",
  mcodt2 = "numeric",
  mcodt3 = "numeric",
  mcodtp = "categorical",
  mcodtp1 = "categorical",
  mcodtp2 = "categorical",
  mcodtp3 = "categorical",
  mcodtp4 = "categorical",
  mcodtp5 = "categorical",
  mcodtpoth = "text",
  mcormis = "categorical",
  mnotest = "categorical"
)

.lasa_fc_155 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "155", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "155", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "155", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "155", waves = .lasa_wave_rows())
)
