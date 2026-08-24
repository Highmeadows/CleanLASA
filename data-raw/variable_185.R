## LASA filecode 185 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mankle1 = "Ankle (1): width in mm",
  mankle2 = "Ankle (2): width in mm",
  mfeetinsp = "Inspection feet: whole",
  mfeetinsp1 = "Inspection feet: sores",
  mfeetinsp2 = "Inspection feet: plaster",
  mfeetinsp3 = "Inspection feet: corns",
  mfeetinsp4 = "Inspection feet: skewed toes",
  mfeetinsp5 = "Inspection feet: amputation toes",
  mfeetinsp6 = "Inspection feet: amputation part of foot",
  mfeetinsp7 = "Inspection feet: amputation feet",
  mfeetinsp8 = "Inspection feet: other",
  mfeetinspo = "Inspection feet: other specification",
  mfeetpllts = "Inspection feet: pull up toes",
  mfeetsmf = "Inspection feet: smack feet",
  mknee1 = NA_character_,
  mknee2 = NA_character_,
  mpulse1 = NA_character_,
  mpulse2 = NA_character_
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels[c(
    "mfeetinsp",
    "mfeetinsp1",
    "mfeetinsp2",
    "mfeetinsp3",
    "mfeetinsp4",
    "mfeetinsp5",
    "mfeetinsp6",
    "mfeetinsp7",
    "mfeetinsp8",
    "mfeetinspo",
    "mfeetpllts",
    "mfeetsmf"
  )],
  Wave_E_labels = harmonized_labels[c("mfeetpllts")],
  Wave_F_labels = harmonized_labels[c("mfeetpllts")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mankle1 = c(`-5` = "na, interview terminated"),
  mankle2 = c(`-1` = "no valid data"),
  mfeetinsp = c(`-5` = "interview terminated", `-1` = "no valid data", `1` = "yes", `2` = "no"),
  mfeetinsp1 = c(
    `-2` = "na, see C/DMFEETINSP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mfeetinsp2 = c(
    `-2` = "na, see C/DMFEETINSP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mfeetinsp3 = c(
    `-2` = "na, see C/DMFEETINSP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mfeetinsp4 = c(
    `-2` = "na, see C/DMFEETINSP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mfeetinsp5 = c(
    `-2` = "na, see C/DMFEETINSP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mfeetinsp6 = c(
    `-2` = "na, see C/DMFEETINSP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mfeetinsp7 = c(
    `-2` = "na, see C/DMFEETINSP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mfeetinsp8 = c(
    `-2` = "na, see C/DMFEETINSP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mfeetinspo = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMFEETINSP8",
    `-1` = "no valid data / na, asked",
    `0` = "to be coded"
  ),
  mfeetpllts = c(`-5` = "interview terminated", `-1` = "na, asked", `1` = "yes", `2` = "no"),
  mfeetsmf = c(`-5` = "interview terminated", `-1` = "no valid data / na, asked", `1` = "yes", `2` = "no"),
  mknee1 = c(`1` = "Knee"),
  mknee2 = c(`2` = "Knee"),
  mpulse1 = c(`1` = "Pulse"),
  mpulse2 = c(`2` = "Pulse")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mfeetpllts = .replace_labels(
    standardized_value_labels$mfeetpllts,
    `-1` = "no valid data / na, asked"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "mfeetinsp",
    "mfeetinsp1",
    "mfeetinsp2",
    "mfeetinsp3",
    "mfeetinsp4",
    "mfeetinsp5",
    "mfeetinsp6",
    "mfeetinsp7",
    "mfeetinsp8",
    "mfeetinspo",
    "mfeetpllts",
    "mfeetsmf"
  )],
    mfeetinsp = c(`-1` = "no valid data", `1` = "yes", `2` = "no"),
    mfeetpllts = c(`-1` = "no valid data / na, asked", `1` = "yes", `2` = "no"),
    mfeetsmf = c(`-1` = "no valid data / na, asked", `1` = "yes", `2` = "no")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("mfeetpllts")],
    mfeetpllts = c(`-1` = "na, asked", `1` = "yes", `2` = "no")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("mfeetpllts")],
    mfeetpllts = c(`-1` = "na, asked", `1` = "yes", `2` = "no")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mankle1 = "numeric",
  mankle2 = "numeric",
  mfeetinsp = "categorical",
  mfeetinsp1 = "categorical",
  mfeetinsp2 = "categorical",
  mfeetinsp3 = "categorical",
  mfeetinsp4 = "categorical",
  mfeetinsp5 = "categorical",
  mfeetinsp6 = "categorical",
  mfeetinsp7 = "categorical",
  mfeetinsp8 = "categorical",
  mfeetinspo = "categorical",
  mfeetpllts = "categorical",
  mfeetsmf = "categorical",
  mknee1 = "categorical",
  mknee2 = "categorical",
  mpulse1 = "categorical",
  mpulse2 = "categorical"
)

.lasa_fc_185 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "185", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "185", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "185", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "185", waves = .lasa_wave_rows())
)
