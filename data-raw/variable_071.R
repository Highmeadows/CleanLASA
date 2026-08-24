## LASA filecode 071 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  eval01 = "Evaluation age norms: daily pursuits",
  eval02 = "Evaluation age norms: financial situation",
  eval03 = "Evaluation age norms: contact with family/friends",
  eval04 = "Evaluation age norms: current affairs"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  eval01 = c(
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  eval02 = c(
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  eval03 = c(
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
  eval04 = c(
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    eval01 = c(
    `-4` = "no answer, short version",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
    eval02 = c(
    `-4` = "no answer, short version",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
    eval03 = c(
    `-4` = "no answer, short version",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
    eval04 = c(
    `-4` = "no answer, short version",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    eval01 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
    eval02 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
    eval03 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  ),
    eval04 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `1` = "no",
    `2` = "more or less",
    `3` = "yes"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  eval01 = "categorical",
  eval02 = "categorical",
  eval03 = "categorical",
  eval04 = "categorical"
)

.lasa_fc_071 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "071", waves = .lasa_wave_rows()) |>
    .override_label(wave = "K", variable = "eval03", override_value = "kbeval03"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "071", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "071", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "071", waves = .lasa_wave_rows())
)
