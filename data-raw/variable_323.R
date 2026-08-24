## LASA filecode 323 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qneurot = "Dutch Personality Questionnaire neuroticism score",
  qsocina = "Dutch Personality Questionnaire social inadequacy score"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    qneurot = "Dutch Personality Questionnaire: Neuroticism",
    qsocina = "Dutch Personality Questionnaire: Social inadequacy"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    qneurot = "Dutch Personality Questionnaire: Neuroticism",
    qsocina = "Dutch Personality Questionnaire: Social inadequacy"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    qneurot = "Dutch Personality Questionnaire: Neuroticism",
    qsocina = "Dutch Personality Questionnaire: Social inadequacy"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    qneurot = "Dutch Personality Questionnaire: Neuroticism",
    qsocina = "Dutch Personality Questionnaire: Social inadequacy"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    qneurot = "Dutch Personality Questionnaire: Neuroticism",
    qsocina = "Dutch Personality Questionnaire: Social inadequacy"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    qneurot = "Dutch Personality Questionnaire: Neuroticism",
    qsocina = "Dutch Personality Questionnaire: Social inadequacy"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qneurot = c(`-1` = "no scale, missing values", `0` = NA_character_, `30` = NA_character_),
  qsocina = c(`-1` = "no scale, missing values", `0` = NA_character_, `20` = NA_character_)
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qneurot = .replace_labels(
    standardized_value_labels$qneurot,
    `-1` = "no scale, mv"
  ),
    qsocina = .replace_labels(
    standardized_value_labels$qsocina,
    `-1` = "no scale, mv"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qneurot = .replace_labels(
    standardized_value_labels$qneurot,
    `-1` = "no scale, mv"
  ),
    qsocina = .replace_labels(
    standardized_value_labels$qsocina,
    `-1` = "no scale, mv"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qneurot = .replace_labels(
    standardized_value_labels$qneurot,
    `-1` = "no scale, mv"
  ),
    qsocina = .replace_labels(
    standardized_value_labels$qsocina,
    `-1` = "no scale, mv"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qneurot = .replace_labels(
    standardized_value_labels$qneurot,
    `-1` = "no scale, mv"
  ),
    qsocina = .replace_labels(
    standardized_value_labels$qsocina,
    `-1` = "no scale, mv"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qneurot = .replace_labels(
    standardized_value_labels$qneurot,
    `-1` = "no scale, mv"
  ),
    qsocina = .replace_labels(
    standardized_value_labels$qsocina,
    `-1` = "no scale, mv"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qneurot = .replace_labels(
    standardized_value_labels$qneurot,
    `-1` = "no scale, mv"
  ),
    qsocina = .replace_labels(
    standardized_value_labels$qsocina,
    `-1` = "no scale, mv"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(qneurot = "numeric", qsocina = "numeric")

.lasa_fc_323 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "323", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "323", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "323", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "323", waves = .lasa_wave_rows())
)
