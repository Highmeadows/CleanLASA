## LASA filecode 870 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mapo = "apoe phenotype",
  mapoe1 = "apoe allele 1",
  mapoe2 = "apoe allele 2",
  mbluse = "usage blood LASA-B-sample",
  me4 = "any e4 allele"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels[c("mapo", "mapoe1", "mapoe2")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mapo = c(
    `-2` = "sample concentration too low",
    `-1` = "not determined / no valid determination",
    `22` = "e2/2",
    `23` = "e2/3",
    `33` = "e3/3",
    `42` = "e2/4",
    `43` = "e3/4",
    `44` = "e4/4"
  ),
  mapoe1 = c(
    `-2` = "sample concentration too low",
    `-1` = "not determined / no valid determination",
    `2` = "isoform 2",
    `3` = "isoform 3",
    `4` = "isoform 4",
    `9` = "missing"
  ),
  mapoe2 = c(
    `-2` = "sample concentration too low",
    `-1` = "not determined / no valid determination",
    `2` = "isoform 2",
    `3` = "isoform 3",
    `4` = "isoform 4",
    `9` = "missing"
  ),
  mbluse = c(`-1` = "not determined", `0` = "usage blood LASA-B-sample", `1` = "LASA-B-sample blood used"),
  me4 = c(`-1` = "not determined", `0` = "no e4 allele", `1` = "any e4 allele")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    mapo = c(
    `-1` = "not determined",
    `22` = "e2/2",
    `23` = "e2/3",
    `33` = "e3/3",
    `42` = "e2/4",
    `43` = "e3/4",
    `44` = "e4/4"
  ),
    mapoe1 = c(
    `-1` = "not determined",
    `2` = "isoform 2",
    `3` = "isoform 3",
    `4` = "isoform 4",
    `9` = "missing"
  ),
    mapoe2 = c(
    `-1` = "not determined",
    `2` = "isoform 2",
    `3` = "isoform 3",
    `4` = "isoform 4",
    `9` = "missing"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("mapo", "mapoe1", "mapoe2")],
    mapo = .replace_labels(
    standardized_value_labels$mapo,
    `-1` = "no valid determination"
  ),
    mapoe1 = .replace_labels(
    standardized_value_labels$mapoe1,
    `-1` = "no valid determination"
  ),
    mapoe2 = .replace_labels(
    standardized_value_labels$mapoe2,
    `-1` = "no valid determination"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mapo = "categorical",
  mapoe1 = "categorical",
  mapoe2 = "categorical",
  mbluse = "categorical",
  me4 = "categorical"
)

.lasa_fc_870 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "870", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "870", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "870", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "870", waves = .lasa_wave_rows())
)
