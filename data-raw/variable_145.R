## LASA filecode 145 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcshape = "current body shape",
  mshap40 = "Body shape at 40",
  qcshape = "current body shape",
  qishape = "ideal body shape",
  qshap40 = "Body shape at 40"
)

variable_labels_list <- list(
  Wave_F_labels = harmonized_labels[c("qcshape", "qishape")],
  Wave_G_labels = harmonized_labels[c("qcshape", "qishape")],
  Wave_3B_labels = harmonized_labels[c("qcshape", "qishape", "qshap40")],
  Wave_MB_labels = harmonized_labels[c("mcshape", "mshap40")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcshape = c(
    `-1` = "not available",
    `1` = "silhouette 1 (extremely thin)",
    `2` = "silhouette 2",
    `3` = "silhouette 3",
    `4` = "silhouette 4",
    `5` = "silhouette 5",
    `6` = "silhouette 6",
    `7` = "silhouette 7",
    `8` = "silhouette 8",
    `9` = "silhouette 9 (very large)"
  ),
  mshap40 = c(
    `-1` = "not available",
    `1` = "silhouette 1 (extremely thin)",
    `2` = "silhouette 2",
    `3` = "silhouette 3",
    `4` = "silhouette 4",
    `5` = "silhouette 5",
    `6` = "silhouette 6",
    `7` = "silhouette 7",
    `8` = "silhouette 8",
    `9` = "silhouette 9 (very large)"
  ),
  qcshape = c(
    `-1` = "not available",
    `1` = "silhouette 1 (extremely thin)",
    `2` = "silhouette 2",
    `3` = "silhouette 3",
    `4` = "silhouette 4",
    `5` = "silhouette 5",
    `6` = "silhouette 6",
    `7` = "silhouette 7",
    `8` = "silhouette 8",
    `9` = "silhouette 9 (very large)"
  ),
  qishape = c(
    `-1` = "not available",
    `1` = "silhouette 1 (extremely thin)",
    `2` = "silhouette 2",
    `3` = "silhouette 3",
    `4` = "silhouette 4",
    `5` = "silhouette 5",
    `6` = "silhouette 6",
    `7` = "silhouette 7",
    `8` = "silhouette 8",
    `9` = "silhouette 9 (very large)"
  ),
  qshap40 = c(
    `-1` = "not available",
    `1` = "silhouette 1 (extremely thin)",
    `2` = "silhouette 2",
    `3` = "silhouette 3",
    `4` = "silhouette 4",
    `5` = "silhouette 5",
    `6` = "silhouette 6",
    `7` = "silhouette 7",
    `8` = "silhouette 8",
    `9` = "silhouette 9 (very large)"
  )
)

value_labels_list <- list(
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("qcshape", "qishape")],
    qcshape = .replace_labels(
    standardized_value_labels$qcshape,
    `-1` = "no valid data"
  ),
    qishape = .replace_labels(
    standardized_value_labels$qishape,
    `-1` = "no valid data"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("qcshape", "qishape")],
    qcshape = .replace_labels(
    standardized_value_labels$qcshape,
    `-1` = "no valid data"
  ),
    qishape = .replace_labels(
    standardized_value_labels$qishape,
    `-1` = "no valid data"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("qcshape", "qishape", "qshap40")],
    qcshape = .replace_labels(
    standardized_value_labels$qcshape,
    `-1` = "no valid data"
  ),
    qishape = .replace_labels(
    standardized_value_labels$qishape,
    `-1` = "no valid data"
  ),
    qshap40 = .replace_labels(
    standardized_value_labels$qshap40,
    `-1` = "no valid data"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("mcshape", "mshap40")],
    mcshape = .replace_labels(
    standardized_value_labels$mcshape,
    `-1` = "no valid data"
  ),
    mshap40 = .replace_labels(
    standardized_value_labels$mshap40,
    `-1` = "no valid data"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mcshape = "categorical",
  mshap40 = "categorical",
  qcshape = "categorical",
  qishape = "categorical",
  qshap40 = "categorical"
)

.lasa_fc_145 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "145", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "145", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "145", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "145", waves = .lasa_wave_rows())
)
