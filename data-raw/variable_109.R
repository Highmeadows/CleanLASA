## LASA filecode 109 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qpchc05 = "Perceived control in health care: I know when it is time to call in care",
  qpchc06 = "Perceived control in health care: I can find information about health or care when I need it",
  qpchc07 = "Perceived control in health care: I will find out if there are any aids or services I could really use",
  qpchc08 = "Perceived control in health care: I know where to apply for care, aids or services",
  qpchc09 = "Perceived control in health care: I am able to arrange any care, aids or services I need",
  qpchc10 = "Perceived control in health care: I understand the regulations of care organisations that are relevant for me",
  qpchc11 = "Perceived control in health care: I can manage to get to my healthcare professional(s) when I need to",
  qpchc12 = "Perceived control in health care: I can keep track of all appointments with my healthcare professional(s)",
  qpchc13 = "Perceived control in health care: I explain what is going on to my healthcare professional(s)",
  qpchc14 = "Perceived control in health care: I ask any questions I have about my health or treatment",
  qpchc15 = "Perceived control in health care: I indicate any wishes I have",
  qpchc17 = "Perceived control in health care: I can deal with the medication I am prescribed by my healthcare professional(s)",
  qpchc18 = "Perceived control in health care: I am able to carry out the recommendations I am prescribed by my healthcare professional(s)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `I` = c(
    "qpchc05",
    "qpchc06",
    "qpchc07",
    "qpchc08",
    "qpchc09",
    "qpchc10",
    "qpchc11",
    "qpchc12",
    "qpchc13",
    "qpchc14",
    "qpchc15",
    "qpchc17",
    "qpchc18"
  ),
  `J` = c(
    "qpchc05",
    "qpchc06",
    "qpchc07",
    "qpchc08",
    "qpchc09",
    "qpchc10",
    "qpchc11",
    "qpchc12",
    "qpchc13",
    "qpchc14",
    "qpchc15",
    "qpchc17",
    "qpchc18"
  ),
  `K` = c(
    "qpchc05",
    "qpchc06",
    "qpchc07",
    "qpchc08",
    "qpchc09",
    "qpchc10",
    "qpchc11",
    "qpchc12",
    "qpchc13",
    "qpchc14",
    "qpchc15",
    "qpchc17",
    "qpchc18"
  )
)

variable_labels_list <- list(
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no (dis)agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

standardized_value_labels <- list(
  qpchc05 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc06 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc07 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc08 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc09 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc10 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc11 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc12 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc13 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc14 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc15 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  qpchc17 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")],
    `6` = "not applicable"
  ),
  qpchc18 = c(
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")],
    `6` = "not applicable"
  )
)

value_labels_list <- list(
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qpchc05 = "categorical",
  qpchc06 = "categorical",
  qpchc07 = "categorical",
  qpchc08 = "categorical",
  qpchc09 = "categorical",
  qpchc10 = "categorical",
  qpchc11 = "categorical",
  qpchc12 = "categorical",
  qpchc13 = "categorical",
  qpchc14 = "categorical",
  qpchc15 = "categorical",
  qpchc17 = "categorical",
  qpchc18 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "109", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "109", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "109", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "109", waves = .lasa_wave_rows())
)

.lasa_fc_109 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

