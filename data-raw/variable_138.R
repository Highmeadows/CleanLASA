## LASA filecode 138 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qreli02 = "Life after death",
  qreli03 = "Heaven",
  qreli04 = "Hell",
  qreli05 = "Devil",
  qreli06 = "Adam and Eve",
  qreli07 = "Bible as word God"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `E` = c(
    "qreli02",
    "qreli03",
    "qreli04",
    "qreli05",
    "qreli06",
    "qreli07"
  )
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qreli02 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qreli03 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qreli04 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qreli05 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qreli06 = c(`-1` = "not available", `1` = "yes", `2` = "no"),
  qreli07 = c(`-1` = "not available", `1` = "yes", `2` = "no")
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qreli02 = .replace_labels(
    standardized_value_labels$qreli02,
    `-1` = "no answer"
  ),
    qreli03 = .replace_labels(
    standardized_value_labels$qreli03,
    `-1` = "no answer"
  ),
    qreli04 = .replace_labels(
    standardized_value_labels$qreli04,
    `-1` = "no answer"
  ),
    qreli05 = .replace_labels(
    standardized_value_labels$qreli05,
    `-1` = "no answer"
  ),
    qreli06 = .replace_labels(
    standardized_value_labels$qreli06,
    `-1` = "no answer"
  ),
    qreli07 = .replace_labels(
    standardized_value_labels$qreli07,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qreli02 = "categorical",
  qreli03 = "categorical",
  qreli04 = "categorical",
  qreli05 = "categorical",
  qreli06 = "categorical",
  qreli07 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "138", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "138", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "138", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "138", waves = .lasa_wave_rows())
)

.lasa_fc_138 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

