## LASA filecode 879 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  madipo = "HMW adiponectin (ug/mL)",
  mghrel = "ghrelin (ng/L - lower limit <240 ng/L)",
  mlepti = "leptin (ug/L)",
  mrm879 = "remarks file LASAG879"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `G` = c(
    "madipo",
    "mghrel",
    "mlepti",
    "mrm879"
  )
)

variable_labels_list <- list(
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    madipo = "HMW adiponectine (ug/mL)",
    mghrel = "ghreline (ng/L - lower limit <240 ng/L)",
    mlepti = "leptine (ug/L)",
    mrm879 = "remarks file lasag879"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  madipo = c(`-2` = "see MRM879"),
  mghrel = c(`-2` = "see MRM879"),
  mlepti = c(`-2` = "see MRM879"),
  mrm879 = c(
    `-1` = "data",
    `1` = "no determination / no blood sample available",
    `2` = "haemolytic",
    `3` = "too little material"
  )
)

value_labels_list <- list(
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    madipo = .replace_labels(
    standardized_value_labels$madipo,
    `-2` = "see GMRM879"
  ),
    mghrel = .replace_labels(
    standardized_value_labels$mghrel,
    `-2` = "see GMRM879"
  ),
    mlepti = .replace_labels(
    standardized_value_labels$mlepti,
    `-2` = "see GMRM879"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(madipo = "numeric", mghrel = "numeric", mlepti = "numeric", mrm879 = "categorical")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "879", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "879", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "879", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "879", waves = .lasa_wave_rows())
)

.lasa_fc_879 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

