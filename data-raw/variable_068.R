## LASA filecode 068 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcarc1 = "Medical care: contact with pharmacy",
  mcarc2 = "Medical care: contact with physician or specialist",
  mcarc3 = "Medical care: contact with hospital or health centre",
  mcarc4 = "Medical care: contact with dentist",
  mcarc5 = "Medical care: contact with alternative or traditional healer",
  mcarc6 = "Medical care: contact with other",
  mcarr01 = "Medical care reason: new complaint / sickness during stay",
  mcarr02 = "Medical care reason: dissatisfaction about care in the Netherlands",
  mcarr03 = "Medical care reason: severity of the complaint during stay",
  mcarr04 = "Medical care reason: no language barriers with physician or specialist",
  mcarr05 = "Medical care reason: periodic consultation / health check",
  mcarr06 = "Medical care reason: to buy medicines not prescribed in the Netherlands",
  mcarr07 = "Medical care reason: to buy medicines not available in the Netherlands",
  mcarr08 = "Medical care reason: cheaper in country of origin",
  mcarr09 = "Medical care reason: because of the waiting lists in the Netherlands",
  mcarr10 = "Medical care reason: other"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `MB` = c(
    "mcarc1",
    "mcarc2",
    "mcarc3",
    "mcarc4",
    "mcarc5",
    "mcarc6",
    "mcarr01",
    "mcarr02",
    "mcarr03",
    "mcarr04",
    "mcarr05",
    "mcarr06",
    "mcarr07",
    "mcarr08",
    "mcarr09",
    "mcarr10"
  )
)

variable_labels_list <- list(
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "mentioned"
)

standardized_value_labels <- list(
  mcarc1 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarc2 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarc3 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarc4 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarc5 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarc6 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr01 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr02 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr03 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr04 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr05 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr06 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr07 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr08 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr09 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  mcarr10 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  )
)

value_labels_list <- list(
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    mcarc1 = .replace_labels(
    standardized_value_labels$mcarc1,
    `-2` = "na, see BMCARCO"
  ),
    mcarc2 = .replace_labels(
    standardized_value_labels$mcarc2,
    `-2` = "na, see BMCARCO"
  ),
    mcarc3 = .replace_labels(
    standardized_value_labels$mcarc3,
    `-2` = "na, see BMCARCO"
  ),
    mcarc4 = .replace_labels(
    standardized_value_labels$mcarc4,
    `-2` = "na, see BMCARCO"
  ),
    mcarc5 = .replace_labels(
    standardized_value_labels$mcarc5,
    `-2` = "na, see BMCARCO"
  ),
    mcarc6 = .replace_labels(
    standardized_value_labels$mcarc6,
    `-2` = "na, see BMCARCO"
  ),
    mcarr01 = .replace_labels(
    standardized_value_labels$mcarr01,
    `-2` = "na, see BMCARCO"
  ),
    mcarr02 = .replace_labels(
    standardized_value_labels$mcarr02,
    `-2` = "na, see BMCARCO"
  ),
    mcarr03 = .replace_labels(
    standardized_value_labels$mcarr03,
    `-2` = "na, see BMCARCO"
  ),
    mcarr04 = .replace_labels(
    standardized_value_labels$mcarr04,
    `-2` = "na, see BMCARCO"
  ),
    mcarr05 = .replace_labels(
    standardized_value_labels$mcarr05,
    `-2` = "na, see BMCARCO"
  ),
    mcarr06 = .replace_labels(
    standardized_value_labels$mcarr06,
    `-2` = "na, see BMCARCO"
  ),
    mcarr07 = .replace_labels(
    standardized_value_labels$mcarr07,
    `-2` = "na, see BMCARCO"
  ),
    mcarr08 = .replace_labels(
    standardized_value_labels$mcarr08,
    `-2` = "na, see BMCARCO"
  ),
    mcarr09 = .replace_labels(
    standardized_value_labels$mcarr09,
    `-2` = "na, see BMCARCO"
  ),
    mcarr10 = .replace_labels(
    standardized_value_labels$mcarr10,
    `-2` = "na, see BMCARCO"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mcarc1 = "categorical",
  mcarc2 = "categorical",
  mcarc3 = "categorical",
  mcarc4 = "categorical",
  mcarc5 = "categorical",
  mcarc6 = "categorical",
  mcarr01 = "categorical",
  mcarr02 = "categorical",
  mcarr03 = "categorical",
  mcarr04 = "categorical",
  mcarr05 = "categorical",
  mcarr06 = "categorical",
  mcarr07 = "categorical",
  mcarr08 = "categorical",
  mcarr09 = "categorical",
  mcarr10 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "068", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "068", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "068", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "068", waves = .lasa_wave_rows())
)

.lasa_fc_068 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

