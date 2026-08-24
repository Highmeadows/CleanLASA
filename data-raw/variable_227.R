## LASA filecode 227 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mastery = "Mastery 5-item total scale",
  mastry7 = "Mastery 7-item total scale",
  rmmas = "Reason no mastery scale score",
  rmmas7 = "Reason no 7-item mastery scale score",
  rmself = "Reason no self-esteem scale score",
  selfest = "Self-esteem total scale"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c("mastery", "rmmas")],
    mastery = "Mastery total scale low-high",
    rmmas = "Reason missing: Mastery"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("mastery", "rmmas", "rmself", "selfest")],
    mastery = "Mastery 5-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    mastery = "Mastery 5-item total scale low-high",
    mastry7 = "Mastery 7-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    mastery = "Mastery 5-item total scale low-high",
    mastry7 = "Mastery 7-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("mastery", "rmmas", "rmself", "selfest")],
    mastery = "Mastery 5-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    mastery = "Mastery 5-item total scale low-high",
    mastry7 = "Mastery 7-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    mastery = "Mastery 5-item total scale low-high",
    mastry7 = "Mastery 7-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    mastery = "Mastery 5-item total scale low-high",
    mastry7 = "Mastery 7-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("mastery", "rmmas", "rmself", "selfest")],
    mastery = "Mastery 5-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c("mastery", "rmmas")],
    mastery = "Mastery 5-item total scale low-high"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    mastery = "Mastery 5-item total scale low-high",
    mastry7 = "Mastery 7-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    mastery = "Mastery 5-item total scale low-high",
    mastry7 = "Mastery 7-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    mastery = "Mastery 5-item total scale low-high",
    mastry7 = "Mastery 7-item total scale low-high",
    selfest = "Self-esteem total scale low-high"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mastery = c(`-2` = "no valid data", `5` = NA_character_, `25` = NA_character_),
  mastry7 = c(`-2` = "no valid data", `7` = NA_character_, `35` = NA_character_),
  rmmas = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refused to answer / refusal / lack of understanding"
  ),
  rmmas7 = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refusal / lack of understanding"
  ),
  rmself = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings",
    `4` = "refusal / lack of understanding"
  ),
  selfest = c(`-2` = "no valid data", `4` = NA_character_, `20` = NA_character_)
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c("mastery", "rmmas")],
    mastery = .replace_labels(
    standardized_value_labels$mastery,
    `-2` = "na, see BRMMAS"
  ),
    rmmas = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("mastery", "rmmas", "rmself", "selfest")],
    rmmas = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  ),
    rmself = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    rmmas = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  ),
    rmmas7 = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  ),
    rmself = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    rmmas = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  ),
    rmmas7 = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  ),
    rmself = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("mastery", "rmmas", "rmself", "selfest")],
    rmmas = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  ),
    rmself = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    rmmas = .replace_labels(
    standardized_value_labels$rmmas,
    `4` = "refused to answer"
  ),
    rmmas7 = .replace_labels(
    standardized_value_labels$rmmas7,
    `4` = "refused to answer"
  ),
    rmself = .replace_labels(
    standardized_value_labels$rmself,
    `4` = "refused to answer"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    rmmas = .replace_labels(
    standardized_value_labels$rmmas,
    `4` = "refused to answer"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    rmmas = .replace_labels(
    standardized_value_labels$rmmas,
    `4` = "refused to answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("mastery", "rmmas", "rmself", "selfest")],
    rmmas = .replace_labels(
    standardized_value_labels$rmmas,
    `4` = "refused to answer"
  ),
    rmself = .replace_labels(
    standardized_value_labels$rmself,
    `4` = "refusal, lack of understanding"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("mastery", "rmmas")],
    rmmas = c(
    `-2` = "valid score",
    `1` = "short interview",
    `2` = "interview terminated",
    `3` = "too many missings"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    rmmas = .replace_labels(
    standardized_value_labels$rmmas,
    `4` = "refused to answer"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    rmmas = .replace_labels(
    standardized_value_labels$rmmas,
    `4` = "refusal / lack of understanding"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    rmmas = .replace_labels(
    standardized_value_labels$rmmas,
    `4` = "refusal / lack of understanding"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mastery = "numeric",
  mastry7 = "numeric",
  rmmas = "categorical",
  rmmas7 = "categorical",
  rmself = "categorical",
  selfest = "numeric"
)

.lasa_fc_227 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "227", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "227", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "227", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "227", waves = .lasa_wave_rows())
)
