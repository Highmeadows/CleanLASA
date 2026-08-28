## LASA filecode 226 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(anxint = "Anxiety scale total score", rmanx = "Reason for missing anxiety scale score")

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "anxint",
    "rmanx"
  ),
  `C` = c(
    "anxint",
    "rmanx"
  ),
  `D` = c(
    "anxint",
    "rmanx"
  ),
  `E` = c(
    "anxint",
    "rmanx"
  ),
  `F` = c(
    "anxint",
    "rmanx"
  ),
  `G` = c(
    "anxint",
    "rmanx"
  ),
  `H` = c(
    "anxint",
    "rmanx"
  ),
  `3B` = c(
    "anxint",
    "rmanx"
  ),
  `MB` = c(
    "anxint",
    "rmanx"
  ),
  `I` = c(
    "anxint",
    "rmanx"
  ),
  `J` = c(
    "anxint",
    "rmanx"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    anxint = "ANXIETY SCALE TOTAL SCORE INTEGER",
    rmanx = "Reason no anxiety scale score"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  anxint = c(`-2` = "no valid data", `0` = NA_character_, `21` = NA_character_),
  rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused test"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    anxint = .replace_labels(
    standardized_value_labels$anxint,
    `-2` = "na, see BRMANX"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    rmanx = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(anxint = "numeric", rmanx = "categorical")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "226", waves = .lasa_wave_rows()) |>
    .override_label(wave = "MB", variable = "anxint", override_value = "bmanxint") |>
    .override_label(wave = "MB", variable = "rmanx", override_value = "bmrmanx"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "226", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "226", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "226", waves = .lasa_wave_rows())
)

.lasa_fc_226 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

