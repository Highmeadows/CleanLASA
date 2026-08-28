## LASA filecode 228 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  adversi = "Persistence in the face of adversity score",
  alcos = "Perceived self-efficacy scale score",
  comple = "Effort completing behavior score",
  initia = "Willingness to initiate behavior score",
  rmalc = "Reason for missing perceived self-efficacy score"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `C` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `D` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `E` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `2B` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `F` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `G` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `H` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `3B` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `I` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `J` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  ),
  `K` = c(
    "adversi",
    "alcos",
    "comple",
    "initia",
    "rmalc"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    adversi = "persistence in the face of adversity",
    alcos = "alcos scale score",
    comple = "effort completing behavior",
    initia = "willingness to initiate behavior",
    rmalc = "reason missing alcos score"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  adversi = c(`-2` = "no valid data", `4` = NA_character_, `20` = NA_character_),
  alcos = c(
    `-2` = "no valid data",
    `14` = NA_character_,
    `20` = NA_character_,
    `22` = NA_character_,
    `23` = NA_character_,
    `60` = NA_character_
  ),
  comple = c(`-2` = "no valid data", `5` = NA_character_, `8` = NA_character_, `25` = NA_character_),
  initia = c(`-2` = "no valid data", `3` = NA_character_, `15` = NA_character_),
  rmalc = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refusal / lack of understanding"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    adversi = .replace_labels(
    standardized_value_labels$adversi,
    `-2` = "na, see BRMALC"
  ),
    alcos = c(`-2` = "na, see BRMALC", `14` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "na, see BRMALC", `5` = NA_character_, `25` = NA_character_),
    initia = .replace_labels(
    standardized_value_labels$initia,
    `-2` = "na, see BRMALC"
  ),
    rmalc = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `20` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `8` = NA_character_, `25` = NA_character_),
    rmalc = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `20` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `8` = NA_character_, `25` = NA_character_),
    rmalc = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `23` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `5` = NA_character_, `25` = NA_character_),
    rmalc = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `23` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `5` = NA_character_, `25` = NA_character_),
    rmalc = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `23` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `5` = NA_character_, `25` = NA_character_),
    rmalc = .replace_labels(
    standardized_value_labels$rmalc,
    `4` = "refused to answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `22` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `8` = NA_character_, `25` = NA_character_)
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `22` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `8` = NA_character_, `25` = NA_character_)
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `22` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `8` = NA_character_, `25` = NA_character_)
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `22` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `8` = NA_character_, `25` = NA_character_)
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `22` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `8` = NA_character_, `25` = NA_character_)
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    alcos = c(`-2` = "no valid data", `22` = NA_character_, `60` = NA_character_),
    comple = c(`-2` = "no valid data", `8` = NA_character_, `25` = NA_character_)
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  adversi = "numeric",
  alcos = "numeric",
  comple = "numeric",
  initia = "numeric",
  rmalc = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "228", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "228", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "228", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "228", waves = .lasa_wave_rows())
)

.lasa_fc_228 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

