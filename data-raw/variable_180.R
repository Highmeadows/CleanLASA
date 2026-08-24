## LASA filecode 180 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mbathhand = "Bathroom/toilet: handrail",
  mbathshand = "Bathroom/toilet: shower handrail",
  mbathslp = "Bathroom/toil: antislip",
  mbedswtch = "Bedroom: light switch",
  mkitcup = "Kitchen: cupboard",
  mkitstpl = "Kitchen: stepladder",
  mkitstplbr = "Kitchen: stepladder brace",
  mkitucup = "Kitchen: use of cupboard",
  mkituwin = "Kitchen: use of upper window",
  mkitwin = "Kitchen: upper window",
  mlivcarp = "Living room: loose carpets",
  mlivwksp = "Living room: enough walking space",
  mstairhand = "Stairs: double handrails",
  mstairlmat = "Stairs: loose material",
  mstairrgh = "Stairs: rough",
  mstairslmat = "Stairs: sometimes loose material",
  mstairturn = "Stairs: turned (home)",
  mwalkfootb = "Walking route: footboard",
  mwalklightsw = "Walking route: light switch",
  mwalkrill = "Walkingroute: illumination"
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels[c(
    "mbathhand",
    "mbathshand",
    "mbathslp",
    "mbedswtch",
    "mkitcup",
    "mkitstpl",
    "mkitstplbr",
    "mkitucup",
    "mkituwin",
    "mkitwin",
    "mlivcarp",
    "mlivwksp",
    "mstairhand",
    "mstairlmat",
    "mstairrgh",
    "mstairslmat",
    "mstairturn",
    "mwalkfootb",
    "mwalklightsw"
  )],
  Wave_D_labels = harmonized_labels[c("mbathshand", "mkitcup", "mwalkrill")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mbathhand = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mbathshand = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mbathslp = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mbedswtch = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mkitcup = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mkitstpl = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mkitstplbr = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mkitucup = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mkituwin = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mkitwin = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mlivcarp = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mlivwksp = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mstairhand = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mstairlmat = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mstairrgh = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mstairslmat = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mstairturn = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mwalkfootb = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mwalklightsw = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  ),
  mwalkrill = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "not applicable"
  )
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "mbathhand",
    "mbathshand",
    "mbathslp",
    "mbedswtch",
    "mkitcup",
    "mkitstpl",
    "mkitstplbr",
    "mkitucup",
    "mkituwin",
    "mkitwin",
    "mlivcarp",
    "mlivwksp",
    "mstairhand",
    "mstairlmat",
    "mstairrgh",
    "mstairslmat",
    "mstairturn",
    "mwalkfootb",
    "mwalklightsw"
  )],
    mbathshand = .replace_labels(
    standardized_value_labels$mbathshand,
    `-1` = "no valid answer"
  ),
    mkitcup = .replace_labels(
    standardized_value_labels$mkitcup,
    `-1` = "no valid answer"
  )
  ),
  Wave_D_labels = standardized_value_labels[c("mbathshand", "mkitcup", "mwalkrill")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mbathhand = "categorical",
  mbathshand = "categorical",
  mbathslp = "categorical",
  mbedswtch = "categorical",
  mkitcup = "categorical",
  mkitstpl = "categorical",
  mkitstplbr = "categorical",
  mkitucup = "categorical",
  mkituwin = "categorical",
  mkitwin = "categorical",
  mlivcarp = "categorical",
  mlivwksp = "categorical",
  mstairhand = "categorical",
  mstairlmat = "categorical",
  mstairrgh = "categorical",
  mstairslmat = "categorical",
  mstairturn = "categorical",
  mwalkfootb = "categorical",
  mwalklightsw = "categorical",
  mwalkrill = "categorical"
)

.lasa_fc_180 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "180", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "180", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "180", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "180", waves = .lasa_wave_rows())
)
