## LASA filecode 225 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(cesdint = "CES-D total score", rmcesd = "Reason for missing CES-D score")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "cesdint",
    "rmcesd"
  ),
  `C` = c(
    "cesdint",
    "rmcesd"
  ),
  `D` = c(
    "cesdint",
    "rmcesd"
  ),
  `E` = c(
    "cesdint",
    "rmcesd"
  ),
  `2B` = c(
    "cesdint",
    "rmcesd"
  ),
  `F` = c(
    "cesdint",
    "rmcesd"
  ),
  `G` = c(
    "cesdint",
    "rmcesd"
  ),
  `H` = c(
    "cesdint",
    "rmcesd"
  ),
  `3B` = c(
    "cesdint",
    "rmcesd"
  ),
  `MB` = c(
    "cesdint",
    "rmcesd"
  ),
  `I` = c(
    "cesdint",
    "rmcesd"
  ),
  `J` = c(
    "cesdint",
    "rmcesd"
  ),
  `K` = c(
    "cesdint",
    "rmcesd"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    cesdint = "B CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    cesdint = "C CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    cesdint = "D CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    cesdint = "E CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    cesdint = "2B CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    cesdint = "F CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    cesdint = "G CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    cesdint = "H CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    cesdint = "3B CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    cesdint = "MB CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    cesdint = "I CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    cesdint = "J CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    cesdint = "K CES-D SCALE TOTAL SCORE INTEGER",
    rmcesd = "reason missing ces-d score"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  cesdint = c(`-2` = "no valid data", `0` = NA_character_, `16` = "cut off", `60` = NA_character_),
  rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test / no valid data"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    cesdint = .replace_labels(
    standardized_value_labels$cesdint,
    `-2` = "na, see BRMCESD"
  ),
    rmcesd = .replace_labels(
    standardized_value_labels$rmcesd,
    `4` = "refused test"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(`-2` = "valid score", `2` = "interview terminated", `3` = "too many missings")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = .replace_labels(
    standardized_value_labels$rmcesd,
    `4` = "no valid data"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    rmcesd = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(cesdint = "numeric", rmcesd = "categorical")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "225", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "225", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "225", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "225", waves = .lasa_wave_rows())
)

.lasa_fc_225 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

