## LASA filecode 862 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcreat = "creatinine",
  mdpd = "urine: deoxypyridinoline (DPD)",
  mdpdcre = "urine: deoxypyridinoline/creatinine ratio",
  migf1 = "serum: insuline-like growth factor-1 (IGF-1)",
  most = "serum: osteocalcin (OC)",
  mpth = "serum: parathyroid hormone (PTH)",
  mrem862 = "remarks about determination",
  mvitd25 = "serum: 25-hydroxyvitamin D (25(OH)D), nmol/L",
  mvitd25st = "serum: 25-hydroxyvitamin D (25(OH)D), nmol/L, ODIN-standardized"
)

variable_labels_list <- list(
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("mcreat", "mdpd", "mdpdcre", "migf1", "most", "mpth", "mvitd25", "mvitd25st")],
    mcreat = "urine: creatinine (mmol/l)"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("mpth", "mvitd25", "mvitd25st")],
    mpth = "serum: parathyroid hormone (PTH), pmol/L"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c("mpth", "mvitd25", "mvitd25st")],
    mpth = "serum: parathyroid hormone (PTH), pmol/L"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("mcreat", "mrem862", "mvitd25")],
    mcreat = "serum: creatinine (umol/L)",
    mvitd25 = "serum: 25-hydroxyvitamin D (25(OH)D) (nmol/l)"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcreat = c(
    `-3` = "incorrect value",
    `-2` = "value below determination / no serum, not determined",
    `-1` = "no determination / no valid data"
  ),
  mdpd = c(`-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination"),
  mdpdcre = c(`-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination"),
  migf1 = c(`-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination"),
  most = c(`-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination"),
  mpth = c(`-3` = "incorrect value", `-2` = "value below determination", `-1` = "no determination"),
  mrem862 = stats::setNames(character(0), character(0)),
  mvitd25 = c(
    `-3` = "incorrect value",
    `-2` = "value below determination / no serum, not determined",
    `-1` = "no determination / no valid data"
  ),
  mvitd25st = c(`-1` = "no determination")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("mcreat", "mdpd", "mdpdcre", "migf1", "most", "mpth", "mvitd25", "mvitd25st")],
    mcreat = .replace_labels(
    standardized_value_labels$mcreat,
    `-2` = "value below determination",
    `-1` = "no determination"
  ),
    mvitd25 = .replace_labels(
    standardized_value_labels$mvitd25,
    `-2` = "value below determination",
    `-1` = "no determination"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("mpth", "mvitd25", "mvitd25st")],
    mvitd25 = .replace_labels(
    standardized_value_labels$mvitd25,
    `-2` = "value below determination",
    `-1` = "no determination"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("mpth", "mvitd25", "mvitd25st")],
    mvitd25 = .replace_labels(
    standardized_value_labels$mvitd25,
    `-2` = "value below determination",
    `-1` = "no determination"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("mcreat", "mvitd25")],
    mcreat = c(`-2` = "no serum, not determined", `-1` = "no valid data"),
    mvitd25 = c(`-2` = "no serum, not determined", `-1` = "no valid data")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mcreat = "numeric",
  mdpd = "numeric",
  mdpdcre = "numeric",
  migf1 = "numeric",
  most = "numeric",
  mpth = "numeric",
  mrem862 = "text",
  mvitd25 = "numeric",
  mvitd25st = "numeric"
)

.lasa_fc_862 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "862", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "862", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "862", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "862", waves = .lasa_wave_rows())
)
