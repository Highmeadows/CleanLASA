## LASA filecode 278 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(an = "Need for affiliation scale (6 items)")

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    an = "need for affiliation <6 items>"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    an = "need for affiliation <6 items>"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  an = c(
    `-4` = "not assessed",
    `-3` = "interview terminated",
    `-2` = "no valid scale score",
    `-1` = ">0 missing items",
    `6` = NA_character_,
    `18` = NA_character_
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    an = .replace_labels(
    standardized_value_labels$an,
    `-4` = "short version questionnaire",
    `-2` = "no valid data"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    an = .replace_labels(
    standardized_value_labels$an,
    `-4` = "refusal/skip by interviewer",
    `-2` = ">0 missing items"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(an = "numeric")

.lasa_fc_278 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "278", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "278", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "278", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "278", waves = .lasa_wave_rows())
)
