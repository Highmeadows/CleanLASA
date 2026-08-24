## LASA filecode 235 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  nochrom = "Number of chronic diseases from 7 major diseases",
  nochrot = "Number of chronic diseases including others",
  xnochrom = "Longitudinal number of chronic diseases from 7 major diseases",
  xnochrot = "Longitudinal number of chronic diseases including others"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    nochrom = "# chronic diseases from 7 Majors",
    nochrot = "# chronic diseases incl Others",
    xnochrom = "(longitudinal) # chronic diseases from 7 Majors",
    xnochrot = "(longitudinal) # chronic diseases incl Others"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    nochrom = "# chronic diseases from 7 Majors",
    nochrot = "# chronic diseases incl Others",
    xnochrom = "(longitudinal) # chronic diseases from 7 Majors",
    xnochrot = "(longitudinal) # chronic diseases incl Others"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c("nochrom")],
    nochrom = "Number chronic diseases from 7 majors"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels[c("nochrom", "nochrot")],
    nochrom = "Number chronic diseases from 7 majors",
    nochrot = "Number chronic diseases incl. others"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  nochrom = c(`-1` = "no valid data"),
  nochrot = c(`-1` = "no valid data"),
  xnochrom = c(`-1` = "no valid data"),
  xnochrot = c(`-1` = "no valid data")
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Wave_E_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Wave_2B_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Wave_F_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Wave_G_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Wave_H_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Wave_3B_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Wave_MB_labels = standardized_value_labels[c("nochrom")],
  Wave_I_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Wave_J_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Wave_K_labels = standardized_value_labels[c("nochrom", "nochrot")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(nochrom = "numeric", nochrot = "numeric", xnochrom = "numeric", xnochrot = "numeric")

.lasa_fc_235 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "235", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "xnochrom", override_value = "xnochrom") |>
    .override_label(wave = "B", variable = "xnochrot", override_value = "xnochrot") |>
    .override_label(wave = "C", variable = "xnochrom", override_value = "xnochrom") |>
    .override_label(wave = "C", variable = "xnochrot", override_value = "xnochrot"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "235", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "235", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "235", waves = .lasa_wave_rows())
)
