## LASA filecode 868 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mab1_40 = "Amyloid-Beta 1 – 40 (pg/mL)",
  mab1_42 = "Amyloid-Beta 1 – 42 (pg/mL)",
  mgfap = "Glial Fibrillary Acidic Protein (pg/mL)",
  mnflight = "Neurofilament Light (pg/mL)",
  mp_tau181 = "Phosphorylated - Tau181 (pg/mL)",
  msap = "serum amyloid P component",
  selg868 = "Selection g868: APO E4 allele present"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `C` = c(
    "msap"
  ),
  `G` = c(
    "mab1_40",
    "mab1_42",
    "mgfap",
    "mnflight",
    "mp_tau181",
    "selg868"
  )
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mab1_40 = stats::setNames(character(0), character(0)),
  mab1_42 = stats::setNames(character(0), character(0)),
  mgfap = stats::setNames(character(0), character(0)),
  mnflight = stats::setNames(character(0), character(0)),
  mp_tau181 = stats::setNames(character(0), character(0)),
  msap = stats::setNames(character(0), character(0)),
  selg868 = c(`0` = "no", `1` = "yes")
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mab1_40 = "numeric",
  mab1_42 = "numeric",
  mgfap = "numeric",
  mnflight = "numeric",
  mp_tau181 = "numeric",
  msap = "numeric",
  selg868 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "868", waves = .lasa_wave_rows()) |>
    .override_label(wave = "G", variable = "selg868", override_value = "selg868"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "868", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "868", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "868", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["msap"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mab1_40"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mab1_42"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mgfap"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mnflight"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mp_tau181"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)

.lasa_fc_868 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

