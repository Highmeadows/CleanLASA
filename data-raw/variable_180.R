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

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `C` = c(
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
  ),
  `D` = c(
    "mbathshand",
    "mkitcup",
    "mwalkrill"
  )
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "no",
  `2` = "yes",
  `3` = "not applicable"
)

standardized_value_labels <- list(
  mbathhand = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mbathshand = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mbathslp = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mbedswtch = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mkitcup = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  ),
  mkitstpl = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mkitstplbr = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mkitucup = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mkituwin = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mkitwin = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mlivcarp = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mlivwksp = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mstairhand = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mstairlmat = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mstairrgh = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mstairslmat = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mstairturn = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mwalkfootb = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mwalklightsw = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    `-1` = "no valid answer",
    default_answer_labels[c("1", "2", "3")]
  ),
  mwalkrill = c(
    `-5` = "interview terminated",
    `-2` = "not asked, routing",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3")]
  )
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mbathshand = .replace_labels(
    standardized_value_labels$mbathshand,
    `-1` = "no valid answer"
  ),
    mkitcup = .replace_labels(
    standardized_value_labels$mkitcup,
    `-1` = "no valid answer"
  )
  ),
  Wave_D_labels = standardized_value_labels,
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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "180", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "180", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "180", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "180", waves = .lasa_wave_rows())
)

.lasa_fc_180 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

