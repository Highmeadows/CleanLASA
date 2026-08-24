## LASA filecode 094 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  dltd = "Desired life time duration",
  eltd = "Expected life time duration",
  happy = "Happiness line: standardised",
  lifeli = "Life line: standardised",
  lijnen = "Did R draw a cross on the lines/ zijn er kruisjes op de lijn gezet",
  pflt = "Preferences for future life time",
  resint = "type of interview",
  subjage = "Subjective age"
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels[c("happy", "lifeli", "lijnen", "resint")],
  Wave_E_labels = harmonized_labels[c("lifeli")],
  Wave_F_labels = harmonized_labels[c("lifeli")],
  Wave_G_labels = harmonized_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
  Wave_H_labels = harmonized_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
  Wave_I_labels = harmonized_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
  Wave_J_labels = harmonized_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
  Wave_K_labels = harmonized_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  dltd = c(`-2` = "not available, routing", `-1` = "not available, asked"),
  eltd = c(`-2` = "not available, routing", `-1` = "not available, asked"),
  happy = c(`-2` = "not asked", `-1` = "not available, asked", `0` = NA_character_, `1` = NA_character_),
  lifeli = c(
    `-4` = "interview terminated",
    `-3` = "short interview",
    `-2` = "coding category -2",
    `-1` = "not available, asked",
    `0` = NA_character_,
    `1` = NA_character_
  ),
  lijnen = c(
    `1` = "none/op geen van beide",
    `2` = "only on the happiness line/alleen op de gelukslijn",
    `3` = "only on the life line/alleen op de levenslijn",
    `4` = "on both lines/op allebei de lijnen"
  ),
  pflt = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "as old as possible, irrespective health problems",
    `2` = "shorter life, if without major health problems"
  ),
  resint = c(
    `-1` = "no data",
    `1` = "face to face: complete",
    `2` = "face to face: short",
    `3` = "face to face: terminated",
    `4` = "face to face: sh/term",
    `5` = "telephone: respondent",
    `6` = "telephone: respondent"
  ),
  subjage = c(`-2` = "not available, routing", `-1` = "not available, asked")
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("happy", "lifeli", "lijnen", "resint")],
    happy = .replace_labels(
    standardized_value_labels$happy,
    `-1` = "asked, no score"
  ),
    lifeli = c(`-2` = "not asked", `-1` = "asked, no score", `0` = NA_character_, `1` = NA_character_)
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("lifeli")],
    lifeli = c(
    `-4` = "interview terminated",
    `-3` = "short interview",
    `-2` = "na, refused",
    `0` = NA_character_,
    `1` = NA_character_
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("lifeli")],
    lifeli = c(
    `-4` = "interview terminated",
    `-3` = "short interview",
    `-2` = "na, refused",
    `0` = NA_character_,
    `1` = NA_character_
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
    dltd = .replace_labels(
    standardized_value_labels$dltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    eltd = .replace_labels(
    standardized_value_labels$eltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    lifeli = .replace_labels(
    standardized_value_labels$lifeli,
    `-2` = "na, refused",
    `-1` = "na, asked"
  ),
    pflt = .replace_labels(
    standardized_value_labels$pflt,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    subjage = .replace_labels(
    standardized_value_labels$subjage,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
    dltd = .replace_labels(
    standardized_value_labels$dltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    eltd = .replace_labels(
    standardized_value_labels$eltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    lifeli = .replace_labels(
    standardized_value_labels$lifeli,
    `-2` = "na, refused",
    `-1` = "na, asked"
  ),
    pflt = .replace_labels(
    standardized_value_labels$pflt,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    subjage = .replace_labels(
    standardized_value_labels$subjage,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
    dltd = .replace_labels(
    standardized_value_labels$dltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    eltd = .replace_labels(
    standardized_value_labels$eltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    lifeli = .replace_labels(
    standardized_value_labels$lifeli,
    `-2` = "na, refused",
    `-1` = "na, asked"
  ),
    pflt = .replace_labels(
    standardized_value_labels$pflt,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    subjage = .replace_labels(
    standardized_value_labels$subjage,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
    dltd = .replace_labels(
    standardized_value_labels$dltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    eltd = .replace_labels(
    standardized_value_labels$eltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    lifeli = .replace_labels(
    standardized_value_labels$lifeli,
    `-2` = "na, refused",
    `-1` = "na, asked"
  ),
    pflt = .replace_labels(
    standardized_value_labels$pflt,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    subjage = .replace_labels(
    standardized_value_labels$subjage,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("dltd", "eltd", "lifeli", "pflt", "subjage")],
    dltd = .replace_labels(
    standardized_value_labels$dltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    eltd = .replace_labels(
    standardized_value_labels$eltd,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    lifeli = .replace_labels(
    standardized_value_labels$lifeli,
    `-2` = "na, refused",
    `-1` = "na, asked"
  ),
    pflt = .replace_labels(
    standardized_value_labels$pflt,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  ),
    subjage = .replace_labels(
    standardized_value_labels$subjage,
    `-2` = "na, see G/H/I/J/KLIFELI",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  dltd = "numeric",
  eltd = "numeric",
  happy = "numeric",
  lifeli = "numeric",
  lijnen = "categorical",
  pflt = "categorical",
  resint = "categorical",
  subjage = "numeric"
)

.lasa_fc_094 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "094", waves = .lasa_wave_rows()) |>
    .override_label(wave = "D", variable = "lijnen", override_value = "lijnen"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "094", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "094", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "094", waves = .lasa_wave_rows())
)
