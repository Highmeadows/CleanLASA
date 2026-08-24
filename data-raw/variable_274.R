## LASA filecode 274 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(vignet = "Total vignettes FRE score")

variable_labels_list <- list(
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    vignet = "total score vignettes FRE"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  vignet = c(`-1` = ">3 missings", `0` = NA_character_, `19` = NA_character_)
)

value_labels_list <- list(
  Wave_D_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(vignet = "numeric")

.lasa_fc_274 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "274", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "274", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "274", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "274", waves = .lasa_wave_rows())
)
