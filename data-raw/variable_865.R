## LASA filecode 865 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mft3 = "free T3 (pmol/l)",
  mft4 = "free T4 (pmol/l)",
  mtsh2 = "thyroid-stimulating hormone (mU/l)"
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mft3 = c(`-2` = "na, see MTSH2 & MFT4", `-1` = "no determination"),
  mft4 = c(`-2` = "na, see MTSH2", `-1` = "no determination"),
  mtsh2 = c(`-1` = "no determination")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mft3 = .replace_labels(
    standardized_value_labels$mft3,
    `-2` = "na, see CMTSH2 & CMFT4"
  ),
    mft4 = .replace_labels(
    standardized_value_labels$mft4,
    `-2` = "na, see CMTSH2"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mft3 = "numeric", mft4 = "numeric", mtsh2 = "numeric")

.lasa_fc_865 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "865", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "865", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "865", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "865", waves = .lasa_wave_rows())
)
