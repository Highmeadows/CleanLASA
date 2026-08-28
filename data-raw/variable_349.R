## LASA filecode 349 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qgsr = "General self-regulation scale score",
  qgsracp = "General self-regulation action-and-coping-planning subscale score",
  qgsrmk = "General self-regulation metastrategy-knowledge subscale score",
  qgsrsu = "General self-regulation strategy-use subscale score",
  qmisgsr = "Number of missing general self-regulation items"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `G` = c(
    "qgsr",
    "qgsracp",
    "qgsrmk",
    "qgsrsu",
    "qmisgsr"
  ),
  `H` = c(
    "qgsr",
    "qgsracp",
    "qgsrmk",
    "qgsrsu",
    "qmisgsr"
  )
)

variable_labels_list <- list(
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    qgsr = "general self-regulation scale score",
    qgsracp = "action and coping planning GSR-subscale score",
    qgsrmk = "metastrategy-knowledge GSR-subscale score",
    qgsrsu = "strategy use GSR-subscale score",
    qmisgsr = "missing values general self-regulation"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    qgsr = "general self-regulation scale score",
    qgsracp = "action and coping planning GSR-subscale score",
    qgsrmk = "metastrategy-knowledge GSR-subscale score",
    qgsrsu = "strategy use GSR-subscale score",
    qmisgsr = "missing values general self-regulation"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qgsr = c(`-2` = "no valid data", `14` = NA_character_, `84` = NA_character_),
  qgsracp = c(`-2` = "no valid data", `6` = NA_character_, `36` = NA_character_),
  qgsrmk = c(`-2` = "no valid data", `4` = NA_character_, `24` = NA_character_),
  qgsrsu = c(`-2` = "no valid data", `4` = NA_character_, `24` = NA_character_),
  qmisgsr = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qgsr = "numeric",
  qgsracp = "numeric",
  qgsrmk = "numeric",
  qgsrsu = "numeric",
  qmisgsr = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "349", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "349", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "349", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "349", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["qmisgsr"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["qmisgsr"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)

.lasa_fc_349 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

