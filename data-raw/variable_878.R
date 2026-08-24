## LASA filecode 878 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mse_selectin = "Soluble E-selectin (ng/mL)",
  msicam_1 = "Soluble Intercellular Adhesion molecule-1 (ng/mL)",
  msvcam_1 = "Soluble Vascular Cell Adhesion molecule-1 (ng/mL)",
  selg878 = "Selection g878: APO E4 allele present"
)

variable_labels_list <- list(
  Wave_G_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mse_selectin = stats::setNames(character(0), character(0)),
  msicam_1 = stats::setNames(character(0), character(0)),
  msvcam_1 = stats::setNames(character(0), character(0)),
  selg878 = c(`0` = "no", `1` = "yes")
)

value_labels_list <- list(
  Wave_G_labels = standardized_value_labels[c("selg878")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(mse_selectin = "numeric", msicam_1 = "numeric", msvcam_1 = "numeric", selg878 = "categorical")

.lasa_fc_878 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "878", waves = .lasa_wave_rows()) |>
    .override_label(wave = "G", variable = "selg878", override_value = "selg878"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "878", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "878", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "878", waves = .lasa_wave_rows())
)
