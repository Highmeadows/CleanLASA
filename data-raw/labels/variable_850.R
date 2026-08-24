## LASA filecode 850 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mapro = "aprotinine sample available",
  mbsstat = "status of blood sampling",
  mdna = "DNA sample available",
  medta = "edta sample available",
  mlab = "laboratory/place of blood sampling or analyses",
  mserum = "serum sample available"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("mlab")],
    mlab = "laboratorium analyses"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("mdna", "mlab")],
    mlab = "laboratorium analyses"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("mbsstat", "mdna", "mlab")],
    mlab = "(place of) laboratorium analyses"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("mbsstat", "mdna", "mlab")],
    mlab = "(place of) laboratorium analyses"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    mlab = "place of blood sampling"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mapro = c(`-2` = "no blood sample", `-1` = "no aprotonine sample", `1` = "aprotonine sample available"),
  mbsstat = c(
    `-2` = "no medical interview",
    `1` = "sampling on location",
    `2` = "sampling at home R",
    `3` = "refusal",
    `4` = "procedural mistake / soft refusal / no contact",
    `5` = "out of area / no sampling at home",
    `6` = "deceased"
  ),
  mdna = c(`-2` = "no blood sample", `-1` = "no DNA sample", `1` = "DNA sample available"),
  medta = c(`-2` = "no blood sample", `-1` = "no EDTA sample", `1` = "EDTA sample available"),
  mlab = c(
    `-3` = "no blood sample",
    `-2` = "Oss regio, no blood sample / no measurement possible / no blood sample",
    `-1` = "no basic determinations: blood sample available / no blood measurement done / no measurement",
    `1` = "Amsterdam lab: PCA Valeriuskliniek / Amsterdam lab / Amsterdam",
    `2` = "Zwolle lab: de Weezenlanden / Zwolle lab / Zwolle",
    `3` = "Oss lab / Oss"
  ),
  mserum = c(`-2` = "no blood sample", `-1` = "no serum sample", `1` = "serum sample available")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("mlab")],
    mlab = c(
    `-2` = "Oss regio, no blood sample",
    `-1` = "no basic determinations: blood sample available",
    `1` = "Amsterdam lab: PCA Valeriuskliniek",
    `2` = "Zwolle lab: de Weezenlanden"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("mdna", "mlab")],
    mlab = .replace_labels(
    standardized_value_labels$mlab,
    `-2` = "no measurement possible",
    `-1` = "no blood measurement done",
    `1` = "Amsterdam lab",
    `2` = "Zwolle lab",
    `3` = "Oss lab"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("mbsstat", "mdna", "mlab")],
    mbsstat = c(
    `-2` = "no medical interview",
    `1` = "sampling on location",
    `2` = "sampling at home R",
    `3` = "refusal",
    `4` = "procedural mistake"
  ),
    mlab = c(
    `-2` = "no blood sample",
    `-1` = "no measurement",
    `1` = "Amsterdam",
    `2` = "Zwolle",
    `3` = "Oss"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("mbsstat", "mdna", "mlab")],
    mbsstat = .replace_labels(
    standardized_value_labels$mbsstat,
    `4` = "soft refusal / no contact"
  ),
    mlab = c(
    `-2` = "no blood sample",
    `-1` = "no measurement",
    `1` = "Amsterdam",
    `2` = "Zwolle",
    `3` = "Oss"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    mbsstat = .replace_labels(
    standardized_value_labels$mbsstat,
    `4` = "soft refusal / no contact"
  ),
    mlab = c(`-2` = "no blood sample", `1` = "Amsterdam", `2` = "Zwolle", `3` = "Oss")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mapro = "categorical",
  mbsstat = "categorical",
  mdna = "categorical",
  medta = "categorical",
  mlab = "categorical",
  mserum = "categorical"
)

.lasa_fc_850 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "850", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "850", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "850", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "850", waves = .lasa_wave_rows())
)
