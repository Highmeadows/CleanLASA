## LASA filecode 324 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qachcha = "Metamemory achievement/change score",
  qachiev = "Metamemory achievement score",
  qanxadd = "Metamemory anxiety score (extra items)",
  qanxiet = "Metamemory anxiety score",
  qlocus = "Metamemory locus of control score",
  qlocusa = "Metamemory locus of control score (extra items)",
  qstrat1 = "Metamemory strategy 1 score",
  qstrat2 = "Metamemory strategy 2 score",
  qstratt = "Metamemory strategy total score"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("qachcha", "qanxiet", "qlocus", "qstrat1", "qstrat2", "qstratt")],
    qachcha = "Achievement/change metamemory concept low-high",
    qanxiet = "Anxiety in metamemory concept low-high",
    qlocus = "Locus of control in metamemory concept low-high",
    qstrat1 = "Strategy 1 in metamemory concept low-high",
    qstrat2 = "Strategy 2 in metamemory concept low-high",
    qstratt = "Strategy total in metamemory concept low-high"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    qachcha = "Achievement/change metamemory concept low-high",
    qachiev = "Achievement metamemory concept low-high",
    qanxadd = "Anxiety with extra items low-high",
    qanxiet = "Anxiety in metamemory concept low-high",
    qlocus = "Locus of control in metamemory concept low-high",
    qlocusa = "Locus of control with extra items low-high",
    qstrat1 = "Strategy 1 in metamemory concept low-high",
    qstrat2 = "Strategy 2 in metamemory concept low-high",
    qstratt = "Strategy total in metamemory concept low-high"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    qachcha = "Achievement/change metamemory concept low-high",
    qachiev = "Achievement metamemory concept low-high",
    qanxadd = "Anxiety with extra items low-high",
    qanxiet = "Anxiety in metamemory concept low-high",
    qlocus = "Locus of control in metamemory concept low-high",
    qlocusa = "Locus of control with extra items low-high",
    qstrat1 = "Strategy 1 in metamemory concept low-high",
    qstrat2 = "Strategy 2 in metamemory concept low-high",
    qstratt = "Strategy total in metamemory concept low-high"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qachcha = c(`-1` = "no valid data", `4` = NA_character_, `20` = NA_character_),
  qachiev = c(`-1` = "no valid data", `8` = NA_character_, `40` = NA_character_),
  qanxadd = c(`-1` = "no valid data", `12` = NA_character_, `60` = NA_character_),
  qanxiet = c(`-1` = "no valid data", `9` = NA_character_, `45` = NA_character_),
  qlocus = c(`-1` = "no valid data", `5` = NA_character_, `25` = NA_character_),
  qlocusa = c(`-1` = "no valid data", `7` = NA_character_, `35` = NA_character_),
  qstrat1 = c(`-1` = "no valid data", `4` = NA_character_, `20` = NA_character_),
  qstrat2 = c(`-1` = "no valid data", `6` = NA_character_, `30` = NA_character_),
  qstratt = c(`-1` = "no valid data", `10` = NA_character_, `50` = NA_character_)
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels[c("qachcha", "qanxiet", "qlocus", "qstrat1", "qstrat2", "qstratt")],
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qachcha = "numeric",
  qachiev = "numeric",
  qanxadd = "numeric",
  qanxiet = "numeric",
  qlocus = "numeric",
  qlocusa = "numeric",
  qstrat1 = "numeric",
  qstrat2 = "numeric",
  qstratt = "numeric"
)

.lasa_fc_324 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "324", waves = .lasa_wave_rows()) |>
    .override_label(wave = "C", variable = "qstrat1", override_value = "cstrat1") |>
    .override_label(wave = "D", variable = "qstrat1", override_value = "dstrat1"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "324", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "324", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "324", waves = .lasa_wave_rows())
)
