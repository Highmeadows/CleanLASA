## LASA filecode 238 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  cort_int = "Orthodoxy Scale Score",
  cos_int = "Cosmic Transcendence Scale Score",
  sal_int = "Salience Scale Score"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    cort_int = "ORTHODOXY SCALE SCORE",
    cos_int = "COSMIC TRANSCENDENCE SCALE SCORE",
    sal_int = "SALIENCE SCALE SCORE"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("cos_int", "sal_int")],
    cos_int = "COSMIC TRANSCENDENCE SCALE SCORE",
    sal_int = "SALIENCE SCALE SCORE"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("cos_int", "sal_int")],
    cos_int = "COSMIC TRANSCENDENCE SCALE SCORE",
    sal_int = "SALIENCE SCALE SCORE"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("cos_int", "sal_int")],
    cos_int = "COSMIC TRANSCENDENCE SCALE SCORE",
    sal_int = "SALIENCE SCALE SCORE"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("cos_int")],
    cos_int = "COSMIC TRANSCENDENCE SCALE SCORE"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  cort_int = c(
    `-2` = "na, see RMGL",
    `-1` = "na, too many missings",
    `0` = NA_character_,
    `7` = NA_character_
  ),
  cos_int = c(
    `-2` = "na, see RMGL",
    `-1` = "na, too many missings",
    `0` = NA_character_,
    `4` = NA_character_
  ),
  sal_int = c(
    `-2` = "na, see RMGL",
    `-1` = "na, too many missings",
    `0` = NA_character_,
    `20` = NA_character_
  )
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    cort_int = .replace_labels(
    standardized_value_labels$cort_int,
    `-2` = "na, see CRMGL"
  ),
    cos_int = .replace_labels(
    standardized_value_labels$cos_int,
    `-2` = "na, see CRMGL"
  ),
    sal_int = .replace_labels(
    standardized_value_labels$sal_int,
    `-2` = "na, see CRMGL"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("cos_int", "sal_int")],
    cos_int = .replace_labels(
    standardized_value_labels$cos_int,
    `-2` = "na, see DRMGL"
  ),
    sal_int = .replace_labels(
    standardized_value_labels$sal_int,
    `-2` = "na, see DRMGL"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("cos_int", "sal_int")],
    cos_int = .replace_labels(
    standardized_value_labels$cos_int,
    `-2` = "na, see ERMGL"
  ),
    sal_int = .replace_labels(
    standardized_value_labels$sal_int,
    `-2` = "na, see ERMGL"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("cos_int", "sal_int")],
    cos_int = .replace_labels(
    standardized_value_labels$cos_int,
    `-2` = "na, see BRMGL"
  ),
    sal_int = .replace_labels(
    standardized_value_labels$sal_int,
    `-2` = "na, see BRMGL"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("cos_int")],
    cos_int = .replace_labels(
    standardized_value_labels$cos_int,
    `-2` = "na, see FRMGL"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(cort_int = "numeric", cos_int = "numeric", sal_int = "numeric")

.lasa_fc_238 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "238", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "238", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "238", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "238", waves = .lasa_wave_rows())
)
