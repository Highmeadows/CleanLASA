## LASA filecode 192 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mvcm101 = "VCM1: feeling ashamed",
  mvcm102 = "VCM1: feeling frustrated or annoyed",
  mvcm103 = "VCM1: feeling lonely or abandoned",
  mvcm104 = "VCM1: feeling sad or unhappy",
  mvcm105 = "VCM1: worried about decline of eyesight",
  mvcm106 = "VCM1: worried about general safety at home",
  mvcm107 = "VCM1: worried about general safety outdoors",
  mvcm108 = "VCM1: worried about dealing with daily life",
  mvcm109 = "VCM1: eyesight an obstacle for things you wanted to do",
  mvcm110 = "VCM1: eyesight an obstacle for life in general",
  mvq1 = "eye surgery or eye/vision measurement in past month",
  mvq2 = "different glasses/contacts or change of eyesight in past month"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `E` = c(
    "mvcm101",
    "mvcm102",
    "mvcm103",
    "mvcm104",
    "mvcm105",
    "mvcm106",
    "mvcm107",
    "mvcm108",
    "mvcm109",
    "mvcm110",
    "mvq1",
    "mvq2"
  ),
  `F` = c(
    "mvcm101",
    "mvcm102",
    "mvcm103",
    "mvcm104",
    "mvcm105",
    "mvcm106",
    "mvcm107",
    "mvcm108",
    "mvcm109",
    "mvcm110",
    "mvq1",
    "mvq2"
  ),
  `G` = c(
    "mvcm101",
    "mvcm102",
    "mvcm103",
    "mvcm104",
    "mvcm105",
    "mvcm106",
    "mvcm107",
    "mvcm108",
    "mvcm109",
    "mvcm110",
    "mvq1",
    "mvq2"
  ),
  `H` = c(
    "mvcm101",
    "mvcm102",
    "mvcm103",
    "mvcm104",
    "mvcm105",
    "mvcm106",
    "mvcm107",
    "mvcm108",
    "mvcm109",
    "mvcm110",
    "mvq1",
    "mvq2"
  )
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "never",
  `2` = "seldom",
  `3` = "sometimes",
  `4` = "reasonably often",
  `5` = "often",
  `6` = "very often"
)

standardized_value_labels <- list(
  mvcm101 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvcm102 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvcm103 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvcm104 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvcm105 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvcm106 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvcm107 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvcm108 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvcm109 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvcm110 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5", "6")]
  ),
  mvq1 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mvq2 = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  )
)

value_labels_list <- list(
  Wave_E_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mvcm101 = "categorical",
  mvcm102 = "categorical",
  mvcm103 = "categorical",
  mvcm104 = "categorical",
  mvcm105 = "categorical",
  mvcm106 = "categorical",
  mvcm107 = "categorical",
  mvcm108 = "categorical",
  mvcm109 = "categorical",
  mvcm110 = "categorical",
  mvq1 = "categorical",
  mvq2 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "192", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "192", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "192", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "192", waves = .lasa_wave_rows())
)

.lasa_fc_192 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

