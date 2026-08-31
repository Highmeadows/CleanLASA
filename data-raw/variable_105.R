## LASA filecode 105 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qrco03 = "Religious coping 03: in crisis turn to God",
  qrco05 = "Religious coping 05: confess sins and ask forgiveness",
  qrco07 = "Religious coping 07: God abandoned me",
  rco03 = "Religious coping 03: in crisis turn to God",
  rco05 = "Religious coping 05: confess sins and ask forgiveness",
  rco07 = "Religious coping 07: God abandoned me"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `3B` = c(
    "qrco03",
    "qrco05",
    "qrco07"
  ),
  `MB` = c(
    "rco03",
    "rco05",
    "rco07"
  )
)

variable_labels_list <- list(
  Wave_3B_labels = harmonized_labels,
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qrco03 = c(
    `-2` = "short interview",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "very often"
  ),
  qrco05 = c(
    `-2` = "short interview",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "very often"
  ),
  qrco07 = c(
    `-2` = "short interview",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "very often"
  ),
  rco03 = c(
    `-2` = "short interview",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "very often"
  ),
  rco05 = c(
    `-2` = "short interview",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "very often"
  ),
  rco07 = c(
    `-2` = "short interview",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "sometimes",
    `3` = "regularly",
    `4` = "very often"
  )
)

value_labels_list <- list(
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qrco03 = .replace_labels(
    standardized_value_labels$qrco03,
    `-2` = "na, short interview"
  ),
    qrco05 = .replace_labels(
    standardized_value_labels$qrco05,
    `-2` = "na, short interview"
  ),
    qrco07 = .replace_labels(
    standardized_value_labels$qrco07,
    `-2` = "na, short interview"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    rco03 = .replace_labels(
    standardized_value_labels$rco03,
    `-2` = "na, short interview"
  ),
    rco05 = .replace_labels(
    standardized_value_labels$rco05,
    `-2` = "na, short interview"
  ),
    rco07 = .replace_labels(
    standardized_value_labels$rco07,
    `-2` = "na, short interview"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qrco03 = "categorical",
  qrco05 = "categorical",
  qrco07 = "categorical",
  rco03 = "categorical",
  rco05 = "categorical",
  rco07 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "105", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "105", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "105", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "105", waves = .lasa_wave_rows())
)

.lasa_fc_105 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

