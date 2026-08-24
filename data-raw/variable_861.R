## LASA filecode 861 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mact = "B: a1-antichymotrypsin % NMP 02",
  mcrp = "C-Reactive Protein (µg/mL)",
  mhscrp = "C-reactive protein concentration",
  mil1b = "Interleukin-1 beta (pg/mL)",
  mil6 = "interleukin-6 concentration",
  mil8 = "Interleukin-8 (pg/mL)",
  mrem861 = "remarks about determination",
  msaa = "Serum Amyloid A (µg/mL)",
  mtnfa = "Tumor Necrosis Factor - alpha (pg/mL)",
  selg861 = "Selection g861: APO E4 allele present"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("mact", "mhscrp", "mil6")],
    mhscrp = "B: C-reactive protein ug/mL",
    mil6 = "B: interleukin-6 pg/mL"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("mact", "mhscrp", "mil6")],
    mact = "C: a1-antichymotrypsin % NMP 02",
    mhscrp = "C: C-reactive protein ug/mL",
    mil6 = "C: interleukin-6 pg/mL"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("mcrp", "mil1b", "mil6", "mil8", "msaa", "mtnfa", "selg861")],
    mil6 = "Interleukin-6 (pg/mL)"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("mhscrp", "mil6", "mrem861")],
    mhscrp = "serum: C-reactive protein mg/L",
    mil6 = "serum: interleukin-6 pg/mL"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mact = c(
    `-3` = "incorrect value",
    `-2` = "value below determination",
    `-1` = "no valid data / no determination"
  ),
  mcrp = stats::setNames(character(0), character(0)),
  mhscrp = c(`-2` = "no serum, not determined", `-1` = "no valid data"),
  mil1b = c(`-1` = "too low concentration (< 0,03 pg/mL)"),
  mil6 = c(
    `-3` = "incorrect value",
    `-2` = "value below determination / no serum, not determined",
    `-1` = "no valid data / no determination"
  ),
  mil8 = stats::setNames(character(0), character(0)),
  mrem861 = stats::setNames(character(0), character(0)),
  msaa = stats::setNames(character(0), character(0)),
  mtnfa = stats::setNames(character(0), character(0)),
  selg861 = c(`0` = "no", `1` = "yes")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("mact", "mil6")],
    mact = c(`-1` = "no valid data"),
    mil6 = c(`-1` = "no valid data")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("mact", "mil6")],
    mact = .replace_labels(
    standardized_value_labels$mact,
    `-1` = "no determination"
  ),
    mil6 = .replace_labels(
    standardized_value_labels$mil6,
    `-2` = "value below determination",
    `-1` = "no determination"
  )
  ),
  Wave_G_labels = standardized_value_labels[c("mil1b", "selg861")],
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("mhscrp", "mil6")],
    mil6 = c(`-2` = "no serum, not determined", `-1` = "no valid data")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mact = "numeric",
  mcrp = "numeric",
  mhscrp = "numeric",
  mil1b = "numeric",
  mil6 = "numeric",
  mil8 = "numeric",
  mrem861 = "text",
  msaa = "numeric",
  mtnfa = "numeric",
  selg861 = "categorical"
)

.lasa_fc_861 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "861", waves = .lasa_wave_rows()) |>
    .override_label(wave = "G", variable = "selg861", override_value = "selg861"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "861", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "861", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "861", waves = .lasa_wave_rows())
)
