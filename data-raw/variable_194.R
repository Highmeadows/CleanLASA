## LASA filecode 194 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mhearpv = "hearing: position volume control",
  mheartd = "hearing: test done",
  mheartdoth = "if gmheartd = 5 (other), info by interviewer from booklet",
  mhearup = "hearing: understanding talk at party",
  mhearwa = "hearing: wearing aids",
  mhearwh = "hearing: wearing aid hours a day",
  msrtnbnote = "hearing: noted score broadband srt test (second test)",
  msrtnsnote = "hearing: noted score smallband srt test (first test)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `E` = c(
    "mhearpv",
    "mheartd",
    "mhearup",
    "mhearwa"
  ),
  `F` = c(
    "mhearpv",
    "mheartd",
    "mhearup",
    "mhearwa"
  ),
  `G` = c(
    "mheartd",
    "mheartdoth",
    "mhearup",
    "mhearwa",
    "mhearwh",
    "msrtnbnote",
    "msrtnsnote"
  )
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mhearpv = c(
    default_missing_labels[c("-1")]
  ),
  mheartd = c(
    default_missing_labels[c("-1")],
    `1` = "test failed",
    `2` = "with very much difficulty",
    `3` = "with a little difficulty",
    `4` = "easily",
    `5` = "other: [to be coded]",
    `6` = "technical failure",
    `7` = "unknown error"
  ),
  mheartdoth = stats::setNames(character(0), character(0)),
  mhearup = c(
    default_missing_labels[c("-1")],
    `1` = "almost never",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
  mhearwa = c(
    default_missing_labels[c("-1")],
    `1` = "none",
    `2` = "1 hearing aid",
    `3` = "2 hearing aids"
  ),
  mhearwh = c(
    default_missing_labels[c("-1")],
    `1` = "I do not have hearing aids",
    `2` = "I do not wear my hearing aids",
    `3` = "<1h",
    `4` = "1-4 h",
    `5` = "4-8 h",
    `6` = "whole day"
  ),
  msrtnbnote = c(
    default_missing_labels[c("-1")]
  ),
  msrtnsnote = c(
    default_missing_labels[c("-1")]
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    mheartd = c(
    `-1` = "na, asked",
    `1` = "test failed",
    `2` = "with very much difficulty",
    `3` = "with a little difficulty",
    `4` = "easily",
    `5` = "other: [to be coded]"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    mheartd = c(
    `-1` = "na, asked",
    `1` = "test failed",
    `2` = "with very much difficulty",
    `3` = "with a little difficulty",
    `4` = "easily",
    `5` = "other: [to be coded]"
  )
  ),
  Wave_G_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mhearpv = "numeric",
  mheartd = "categorical",
  mheartdoth = "text",
  mhearup = "categorical",
  mhearwa = "categorical",
  mhearwh = "categorical",
  msrtnbnote = "numeric",
  msrtnsnote = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "194", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "194", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "194", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "194", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["mheartdoth"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)

.lasa_fc_194 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

