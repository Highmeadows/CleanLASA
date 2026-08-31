## LASA filecode 337 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qamb = "Valuation of late life ambition subscale score",
  qres = "Valuation of late life resilience subscale score",
  qvall = "Valuation of late life scale score",
  qzest = "Valuation of late life zest-for-life subscale score"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `E` = c(
    "qamb",
    "qres",
    "qvall",
    "qzest"
  ),
  `F` = c(
    "qamb",
    "qres",
    "qvall",
    "qzest"
  )
)

variable_labels_list <- list(
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    qamb = "ambition vall-subscale score",
    qres = "resilience vall-subscale score",
    qvall = "value of late life scale score",
    qzest = "zest for life vall-subscale score"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    qamb = "ambition vall-subscale score",
    qres = "resilience vall-subscale score",
    qvall = "value of late life scale score",
    qzest = "zest for life vall-subscale score"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qamb = c(`-2` = "no valid data", `4` = NA_character_, `19` = NA_character_, `20` = NA_character_),
  qres = c(`-2` = "no valid data", `4` = NA_character_, `20` = NA_character_),
  qvall = c(`-2` = "no valid data", `12` = NA_character_, `53` = NA_character_, `56` = NA_character_),
  qzest = c(`-2` = "no valid data", `4` = NA_character_, `20` = NA_character_)
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qamb = c(`-2` = "no valid data", `4` = NA_character_, `19` = NA_character_),
    qvall = c(`-2` = "no valid data", `12` = NA_character_, `56` = NA_character_)
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    qamb = c(`-2` = "no valid data", `4` = NA_character_, `20` = NA_character_),
    qvall = c(`-2` = "no valid data", `12` = NA_character_, `53` = NA_character_)
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qamb = "numeric", qres = "numeric", qvall = "numeric", qzest = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "337", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "337", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "337", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "337", waves = .lasa_wave_rows())
)

.lasa_fc_337 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

