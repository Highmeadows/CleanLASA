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

variable_labels_list <- list(
  Wave_3B_labels = harmonized_labels,
  Wave_MB_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  bowmf = c(
    `-5` = "interview terminated",
    `-1` = "not available, asked",
    `1` = "less than once a day",
    `2` = "once a day",
    `3` = "twice a day",
    `4` = "more than twice a day"
  ),
  pd01 = c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes"),
  pd02 = c(
    `-5` = "interview terminated",
    `-2` = "R cannot write",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  pd03 = c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes"),
  pd04 = c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes"),
  pd05 = c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes"),
  pd06 = c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes"),
  pd07 = c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes"),
  pd08 = c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes"),
  pd09 = c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes"),
  remdis = c(`-5` = "interview terminated", `-1` = "not available, asked", `1` = "no", `2` = "yes")
)

value_labels_list <- list(
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    bowmf = .replace_labels(
    standardized_value_labels$bowmf,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd01 = .replace_labels(
    standardized_value_labels$pd01,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd02 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    pd03 = .replace_labels(
    standardized_value_labels$pd03,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd04 = .replace_labels(
    standardized_value_labels$pd04,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd05 = .replace_labels(
    standardized_value_labels$pd05,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd06 = .replace_labels(
    standardized_value_labels$pd06,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd07 = .replace_labels(
    standardized_value_labels$pd07,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd08 = .replace_labels(
    standardized_value_labels$pd08,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd09 = .replace_labels(
    standardized_value_labels$pd09,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    remdis = .replace_labels(
    standardized_value_labels$remdis,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    bowmf = .replace_labels(
    standardized_value_labels$bowmf,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd01 = .replace_labels(
    standardized_value_labels$pd01,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd02 = .replace_labels(
    standardized_value_labels$pd02,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd03 = .replace_labels(
    standardized_value_labels$pd03,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd04 = .replace_labels(
    standardized_value_labels$pd04,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd05 = .replace_labels(
    standardized_value_labels$pd05,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd06 = .replace_labels(
    standardized_value_labels$pd06,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd07 = .replace_labels(
    standardized_value_labels$pd07,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd08 = .replace_labels(
    standardized_value_labels$pd08,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    pd09 = .replace_labels(
    standardized_value_labels$pd09,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
  ),
    remdis = .replace_labels(
    standardized_value_labels$remdis,
    `-5` = "na, interview terminated",
    `-1` = "na, asked"
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

.lasa_fc_096 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "096", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "096", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "096", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "096", waves = .lasa_wave_rows())
)
