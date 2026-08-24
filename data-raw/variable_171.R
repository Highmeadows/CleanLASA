## LASA filecode 171 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcalf01 = "measured calf circumference in cm",
  mcalf02 = "calf measurement particularities",
  mcalf03 = "calf particularity: refused",
  mcalf04 = "calf particularity: respondent sitting down",
  mcalf05 = "calf particularity: not physically able",
  mcalf06 = "calf particularity: on right leg",
  mcalf07 = "calf particularity: impediments",
  mcalf08 = "calf particularity: edema present",
  mcalf09 = "calf particularity: support stocking",
  mcalf1 = "measured calf in cm",
  mcalf10 = "calf particularity: long underwear",
  mcalf11 = "calf particularity: other",
  mcalf12 = "calf particularity: no bare leg",
  mcalf13 = "calf particularity: much space between tape and leg",
  mcalf1a = "measured calf (1) in cm",
  mcalf1b = "measured calf (2) in cm",
  rm161 = "data status",
  rm171 = "reason missing / data status"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
    "mcalf01",
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf05",
    "mcalf06",
    "mcalf07",
    "mcalf08",
    "mcalf09",
    "mcalf10",
    "mcalf11"
  )],
    mcalf01 = "circumference: in cm",
    mcalf02 = "measurement: remarks Y/N",
    mcalf03 = "remark: refused",
    mcalf04 = "remark: sitting down",
    mcalf05 = "remark: not physically able",
    mcalf06 = "remark: on right calf",
    mcalf07 = "remark: impediments",
    mcalf08 = "remark: edema present",
    mcalf09 = "remark: support stocking",
    mcalf10 = "remark: long underwear",
    mcalf11 = "remark other"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mcalf1a",
    "mcalf1b",
    "rm161"
  )],
    mcalf02 = "Calf particularities",
    mcalf03 = "Calf: refused",
    mcalf04 = "Calf: R sitting down",
    mcalf06 = "Calf: on right leg",
    mcalf12 = "Calf: no bare leg",
    mcalf13 = "Calf: much space between tape and leg",
    mcalf1a = "Measured calf (1) in cm",
    mcalf1b = "Measured calf (2) in cm",
    rm161 = NA_character_
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mcalf1a",
    "mcalf1b",
    "rm161"
  )],
    mcalf02 = "Calf particularities",
    mcalf03 = "Calf: refused",
    mcalf04 = "Calf: R sitting down",
    mcalf06 = "Calf: on right leg",
    mcalf12 = "Calf: no bare leg",
    mcalf13 = "Calf: much space between tape and leg",
    mcalf1a = "Measured calf (1) in cm",
    mcalf1b = "Measured calf (2) in cm",
    rm161 = NA_character_
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("mcalf02", "mcalf03", "mcalf04", "mcalf06", "mcalf1", "mcalf12", "mcalf13")],
    mcalf02 = "Calf particularities",
    mcalf03 = "Calf: refused",
    mcalf04 = "Calf: R sitting down",
    mcalf06 = "Calf: on right leg",
    mcalf1 = "Measured calf in cm",
    mcalf12 = "Calf: no bare leg",
    mcalf13 = "Calf: much space between tape and leg"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("mcalf02", "mcalf1a", "mcalf1b", "rm161")],
    mcalf02 = "Calf particularities",
    mcalf1a = "Measured calf (1) in cm",
    mcalf1b = "Measured calf (2) in cm",
    rm161 = NA_character_
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mcalf1a",
    "mcalf1b",
    "rm161"
  )],
    mcalf02 = "Calf particularities",
    mcalf03 = "Calf: refused",
    mcalf04 = "Calf: R sitting down",
    mcalf06 = "Calf: on right leg",
    mcalf12 = "Calf: no bare leg",
    mcalf13 = "Calf: much space between tape and leg",
    mcalf1a = "Measured calf (1) in cm",
    mcalf1b = "Measured calf (2) in cm",
    rm161 = NA_character_
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c("mcalf01", "mcalf02", "mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13", "rm171")],
    mcalf01 = "Measured calf in cm",
    mcalf02 = "Calf particularities",
    mcalf03 = "Calf: refused",
    mcalf04 = "Calf: R sitting down",
    mcalf06 = "Calf: on right leg",
    mcalf12 = "Calf: no bare leg",
    mcalf13 = "Calf: much space between tape and leg",
    rm171 = "Reason missing: LASAH/B171"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("mcalf01", "mcalf02", "mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13", "rm171")],
    mcalf01 = "Measured calf in cm",
    mcalf02 = "Calf particularities",
    mcalf03 = "Calf: refused",
    mcalf04 = "Calf: R sitting down",
    mcalf06 = "Calf: on right leg",
    mcalf12 = "Calf: no bare leg",
    mcalf13 = "Calf: much space between tape and leg",
    rm171 = "Reason missing: LASAH/B171"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcalf01 = c(`-3` = "not in sample", `-2` = "na, see H/BRM171", `-1` = "measurement missing"),
  mcalf02 = c(
    `-3` = "not applicable / skipped",
    `-2` = "na, see BRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "particularity status",
    `2` = "particularity status or category",
    `3` = "measurement/particularity status",
    `4` = "R sitting down",
    `5` = "on right leg",
    `6` = "R refused"
  ),
  mcalf03 = c(
    `-3` = "not applicable / skipped",
    `-2` = "na, see MCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "particularity status",
    `2` = "yes",
    `3` = "not done various reasons"
  ),
  mcalf04 = c(
    `-3` = "not applicable / skipped",
    `-2` = "na, see MCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "particularity status",
    `2` = "yes",
    `3` = "not done various reasons"
  ),
  mcalf05 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons"),
  mcalf06 = c(
    `-3` = "not applicable / skipped",
    `-2` = "na, see MCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "particularity status",
    `2` = "yes",
    `3` = "not done various reasons"
  ),
  mcalf07 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons"),
  mcalf08 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons"),
  mcalf09 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons"),
  mcalf1 = c(`-3` = "na, wrong skip", `-2` = "na, see BRM161", `-1` = "na, asked"),
  mcalf10 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons"),
  mcalf11 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons"),
  mcalf12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see MCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcalf13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see MCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mcalf1a = c(`-3` = "na, wrong skip", `-2` = "na, see FRM161", `-1` = "na, asked"),
  mcalf1b = c(`-3` = "na, wrong skip", `-2` = "na, see FRM161", `-1` = "na, asked"),
  rm161 = c(
    `-2` = "valid data",
    `0` = "- to be coded -",
    `1` = "short version",
    `2` = "interview terminated"
  ),
  rm171 = c(
    `-2` = "valid data",
    `0` = "- to be coded -",
    `1` = "short version",
    `2` = "interview terminated"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcalf01",
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf05",
    "mcalf06",
    "mcalf07",
    "mcalf08",
    "mcalf09",
    "mcalf10",
    "mcalf11"
  )],
    mcalf01 = c(`-3` = "not in sample", `-1` = "no measurement"),
    mcalf02 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons"),
    mcalf03 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons"),
    mcalf04 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons"),
    mcalf06 = c(`-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mcalf1a",
    "mcalf1b",
    "rm161"
  )],
    mcalf02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/ERM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mcalf03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/EMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/EMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/EMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf12 = .replace_labels(
    standardized_value_labels$mcalf12,
    `-2` = "na, see D/EMCALF02"
  ),
    mcalf13 = .replace_labels(
    standardized_value_labels$mcalf13,
    `-2` = "na, see D/EMCALF02"
  ),
    mcalf1a = .replace_labels(
    standardized_value_labels$mcalf1a,
    `-2` = "na, see D/ERM161"
  ),
    mcalf1b = .replace_labels(
    standardized_value_labels$mcalf1b,
    `-2` = "na, see D/ERM161"
  ),
    rm161 = c(`-2` = "valid data", `2` = "interview terminated")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mcalf1a",
    "mcalf1b",
    "rm161"
  )],
    mcalf02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/ERM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mcalf03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/EMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/EMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/EMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf12 = .replace_labels(
    standardized_value_labels$mcalf12,
    `-2` = "na, see D/EMCALF02"
  ),
    mcalf13 = .replace_labels(
    standardized_value_labels$mcalf13,
    `-2` = "na, see D/EMCALF02"
  ),
    mcalf1a = .replace_labels(
    standardized_value_labels$mcalf1a,
    `-2` = "na, see D/ERM161"
  ),
    mcalf1b = .replace_labels(
    standardized_value_labels$mcalf1b,
    `-2` = "na, see D/ERM161"
  ),
    rm161 = c(`-2` = "valid data", `2` = "interview terminated")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("mcalf02", "mcalf03", "mcalf04", "mcalf06", "mcalf1", "mcalf12", "mcalf13")],
    mcalf02 = c(`-3` = "na, wrong skip", `-2` = "na, see BRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mcalf03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf12 = .replace_labels(
    standardized_value_labels$mcalf12,
    `-2` = "na, see BMCALF02"
  ),
    mcalf13 = .replace_labels(
    standardized_value_labels$mcalf13,
    `-2` = "na, see BMCALF02"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("mcalf02", "mcalf1a", "mcalf1b", "rm161")],
    mcalf02 = c(
    `-2` = "na, see FRM161",
    `-1` = "na, asked",
    `1` = "no particularities",
    `2` = "no bare leg",
    `3` = "much space between tape and leg",
    `4` = "R sitting down",
    `5` = "on right leg",
    `6` = "R refused"
  ),
    mcalf1a = c(`-2` = "na, see FRM161", `-1` = "na, asked"),
    mcalf1b = c(`-2` = "na, see FRM161", `-1` = "na, asked"),
    rm161 = c(`-2` = "valid data", `1` = "short version", `2` = "interview terminated")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mcalf1a",
    "mcalf1b",
    "rm161"
  )],
    mcalf02 = c(`-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mcalf03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see GMCALF02",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mcalf12 = .replace_labels(
    standardized_value_labels$mcalf12,
    `-2` = "na, see GMCALF02"
  ),
    mcalf13 = .replace_labels(
    standardized_value_labels$mcalf13,
    `-2` = "na, see GMCALF02"
  ),
    mcalf1a = c(`-2` = "na, see GRM161", `-1` = "na, asked"),
    mcalf1b = c(`-2` = "na, see GRM161", `-1` = "na, asked")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("mcalf01", "mcalf02", "mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13", "rm171")],
    mcalf01 = c(`-2` = "na, see H/BRM171", `-1` = "na, asked"),
    mcalf02 = c(`-2` = "na, see H/BRM171", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf03 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf04 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf06 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf12 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf13 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("mcalf01", "mcalf02", "mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13", "rm171")],
    mcalf01 = c(`-2` = "na, see H/BRM171", `-1` = "na, asked"),
    mcalf02 = c(`-2` = "na, see H/BRM171", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf03 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf04 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf06 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf12 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mcalf13 = c(`-2` = "na, see H/BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mcalf01 = "numeric",
  mcalf02 = "categorical",
  mcalf03 = "categorical",
  mcalf04 = "categorical",
  mcalf05 = "categorical",
  mcalf06 = "categorical",
  mcalf07 = "categorical",
  mcalf08 = "categorical",
  mcalf09 = "categorical",
  mcalf1 = "numeric",
  mcalf10 = "categorical",
  mcalf11 = "categorical",
  mcalf12 = "categorical",
  mcalf13 = "categorical",
  mcalf1a = "numeric",
  mcalf1b = "numeric",
  rm161 = "categorical",
  rm171 = "categorical"
)

.lasa_fc_171 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "171", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "171", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "171", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "171", waves = .lasa_wave_rows())
)
