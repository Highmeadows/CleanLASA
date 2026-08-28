## LASA filecode 220 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  dsbsp = "WAIS Digit Span backward span",
  dsbw = "WAIS Digit Span number of correct backward items",
  dsfsp = "WAIS Digit Span forward span",
  dsfw = "WAIS Digit Span number of correct forward items",
  dstot = "WAIS Digit Span total number of correct items",
  rmds = "Reason for missing Digit Span score"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `3B` = c(
    "dsbsp",
    "dsbw",
    "dsfsp",
    "dsfw",
    "dstot",
    "rmds"
  )
)

variable_labels_list <- list(
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    dsbsp = "WAIS Digit Span: Span backwards",
    dsbw = "WAIS Digit Span: number of correct backward items",
    dsfsp = "WAIS Digit Span: Span forwards",
    dsfw = "WAIS Digit Span: number of correct forward items",
    dstot = "WAIS Digit Span: total number of correct items",
    rmds = "reason missing Digit Span"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  dsbsp = c(`-2` = "no score, see BRMDS", `-1` = "no score, too many missings"),
  dsbw = c(`-2` = "no score, see BRMDS", `-1` = "no score, too many missings"),
  dsfsp = c(`-2` = "no score, see BRMDS", `-1` = "no score, too many missings"),
  dsfw = c(`-2` = "no score, see BRMDS", `-1` = "no score, too many missings"),
  dstot = c(`-2` = "no score, see BRMDS", `-1` = "no score, too many missings"),
  rmds = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "language problem"
  )
)

value_labels_list <- list(
  Wave_3B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  dsbsp = "numeric",
  dsbw = "numeric",
  dsfsp = "numeric",
  dsfw = "numeric",
  dstot = "numeric",
  rmds = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "220", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "220", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "220", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "220", waves = .lasa_wave_rows())
)

.lasa_fc_220 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

