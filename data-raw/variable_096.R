## LASA filecode 096 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  bowmf = "bowel movement frequency",
  pd01 = "PD01: difficulty getting up from a chair",
  pd02 = "PD02: handwriting smaller",
  pd03 = "PD03: someone noticed your voice softer",
  pd04 = "PD04: insecure while walking",
  pd05 = "PD05: feel feet sticking to floor",
  pd06 = "PD06: someone noticed your face less expression",
  pd07 = "PD07: trembling arms or legs",
  pd08 = "PD08: difficulty sealing buttons",
  pd09 = "PD09: small shuffling steps walking",
  remdis = "REM sleep behaviour disorder"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `3B` = c(
    "bowmf",
    "pd01",
    "pd02",
    "pd03",
    "pd04",
    "pd05",
    "pd06",
    "pd07",
    "pd08",
    "pd09",
    "remdis"
  ),
  `MB` = c(
    "bowmf",
    "pd01",
    "pd02",
    "pd03",
    "pd04",
    "pd05",
    "pd06",
    "pd07",
    "pd08",
    "pd09",
    "remdis"
  )
)

variable_labels_list <- list(
  Wave_3B_labels = harmonized_labels,
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "no",
  `2` = "yes"
)

standardized_value_labels <- list(
  bowmf = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    `1` = "less than once a day",
    `2` = "once a day",
    `3` = "twice a day",
    `4` = "more than twice a day"
  ),
  pd01 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  pd02 = c(
    `-5` = "interview terminated",
    `-2` = "R cannot write",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  pd03 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  pd04 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  pd05 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  pd06 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  pd07 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  pd08 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  pd09 = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  remdis = c(
    `-5` = "interview terminated",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  )
)

value_labels_list <- list(
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    bowmf = .replace_labels(
    standardized_value_labels$bowmf,
    `-5` = "na, interview terminated"
  ),
    pd01 = .replace_labels(
    standardized_value_labels$pd01,
    `-5` = "na, interview terminated"
  ),
    pd02 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    pd03 = .replace_labels(
    standardized_value_labels$pd03,
    `-5` = "na, interview terminated"
  ),
    pd04 = .replace_labels(
    standardized_value_labels$pd04,
    `-5` = "na, interview terminated"
  ),
    pd05 = .replace_labels(
    standardized_value_labels$pd05,
    `-5` = "na, interview terminated"
  ),
    pd06 = .replace_labels(
    standardized_value_labels$pd06,
    `-5` = "na, interview terminated"
  ),
    pd07 = .replace_labels(
    standardized_value_labels$pd07,
    `-5` = "na, interview terminated"
  ),
    pd08 = .replace_labels(
    standardized_value_labels$pd08,
    `-5` = "na, interview terminated"
  ),
    pd09 = .replace_labels(
    standardized_value_labels$pd09,
    `-5` = "na, interview terminated"
  ),
    remdis = .replace_labels(
    standardized_value_labels$remdis,
    `-5` = "na, interview terminated"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    bowmf = .replace_labels(
    standardized_value_labels$bowmf,
    `-5` = "na, interview terminated"
  ),
    pd01 = .replace_labels(
    standardized_value_labels$pd01,
    `-5` = "na, interview terminated"
  ),
    pd02 = .replace_labels(
    standardized_value_labels$pd02,
    `-5` = "na, interview terminated"
  ),
    pd03 = .replace_labels(
    standardized_value_labels$pd03,
    `-5` = "na, interview terminated"
  ),
    pd04 = .replace_labels(
    standardized_value_labels$pd04,
    `-5` = "na, interview terminated"
  ),
    pd05 = .replace_labels(
    standardized_value_labels$pd05,
    `-5` = "na, interview terminated"
  ),
    pd06 = .replace_labels(
    standardized_value_labels$pd06,
    `-5` = "na, interview terminated"
  ),
    pd07 = .replace_labels(
    standardized_value_labels$pd07,
    `-5` = "na, interview terminated"
  ),
    pd08 = .replace_labels(
    standardized_value_labels$pd08,
    `-5` = "na, interview terminated"
  ),
    pd09 = .replace_labels(
    standardized_value_labels$pd09,
    `-5` = "na, interview terminated"
  ),
    remdis = .replace_labels(
    standardized_value_labels$remdis,
    `-5` = "na, interview terminated"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  bowmf = "categorical",
  pd01 = "categorical",
  pd02 = "categorical",
  pd03 = "categorical",
  pd04 = "categorical",
  pd05 = "categorical",
  pd06 = "categorical",
  pd07 = "categorical",
  pd08 = "categorical",
  pd09 = "categorical",
  remdis = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "096", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "096", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "096", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "096", waves = .lasa_wave_rows())
)

.lasa_fc_096 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

