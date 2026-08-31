## LASA filecode 804 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qphyfem = "How feminine do you feel physically (scale)",
  qphymas = "How masculine do you feel physically (scale)",
  qphyq = "Physically: R does not want to answer (one of) these questions",
  qpsyfem = "How feminine do you feel psychologically/emotionally (scale)",
  qpsymas = "How masculine do you feel psychologically/emotionally (scale)",
  qpsyq = "Psychologically/emotionally: R does not want to answer (one of) these questions"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `J` = c(
    "qphyfem",
    "qphymas",
    "qphyq",
    "qpsyfem",
    "qpsymas",
    "qpsyq"
  ),
  `K` = c(
    "qphyfem",
    "qphymas",
    "qphyq",
    "qpsyfem",
    "qpsymas",
    "qpsyq"
  )
)

variable_labels_list <- list(
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qphyfem = c(
    default_missing_labels[c("-1")],
    `0` = NA_character_,
    `10` = NA_character_
  ),
  qphymas = c(
    default_missing_labels[c("-1")],
    `0` = NA_character_,
    `10` = NA_character_
  ),
  qphyq = c(`0` = "not mentioned", `1` = "mentioned"),
  qpsyfem = c(
    default_missing_labels[c("-1")],
    `0` = NA_character_,
    `10` = NA_character_
  ),
  qpsymas = c(
    default_missing_labels[c("-1")],
    `0` = NA_character_,
    `10` = NA_character_
  ),
  qpsyq = c(`0` = "not mentioned", `1` = "mentioned")
)

value_labels_list <- list(
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qphyfem = "categorical",
  qphymas = "categorical",
  qphyq = "categorical",
  qpsyfem = "categorical",
  qpsymas = "categorical",
  qpsyq = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "804", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "804", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "804", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "804", waves = .lasa_wave_rows())
)

.lasa_fc_804 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

