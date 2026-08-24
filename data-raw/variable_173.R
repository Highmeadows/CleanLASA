## LASA filecode 173 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mexlo1 = "I am happy with the way I have lived my life",
  mexlo12 = "I feel I have people I can trust and rely on if I need them",
  mexlo16 = "I stay in bad relationships too long in order not to be alone",
  mexlo18 = "I feel helpless",
  mexlo21 = "I feel alone",
  mexlo23 = "I mean something to others",
  mexlo24 = "Important relationships have ended or become weaker",
  mexlo25 = "I feel at the mercy of the world",
  mexlo26 = "I feel dead",
  mexlo27 = "The universe is full of meaning",
  mexlo29 = "I feel that there is little point to life",
  mexlo3 = "There is a purpose to my life",
  mexlo30 = "No one else in the world can understand my feelings",
  mexlo31 = "My world seems so different from everybody else's",
  mexlo6 = "I am surrounded by strangers I cannot connect with",
  mexlo8 = "I feel lonely"
)

variable_labels_list <- list(
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    mexlo1 = "I am happy with the way I have lived my life / Ik ben gelukkig over hoe ik mijn leven heb geleid",
    mexlo12 = "I feel I have people I can trust and rely on if I need them / Ik heb mensen waarop ik kan vertrouwen en rekenen wanneer ik daar behoefte aan heb",
    mexlo16 = "I stay in bad relationships too long in order not to be alone / Ik blijf te lang in een slechte relatie omdat ik niet alleen wil zijn",
    mexlo18 = "I feel helpless / Ik voel me hulpeloos",
    mexlo21 = "I feel alone / Ik voel me alleen",
    mexlo23 = "I mean something to others / Ik beteken iets voor andere mensen",
    mexlo24 = "Important relationships have ended or become weaker / Belangrijke contacten zijn weggevallen of verwaterd",
    mexlo25 = "I feel at the mercy of the world / Ik voel mij machteloos tegenover de wereld",
    mexlo26 = "I feel dead / Het voelt alsof ik dood ben",
    mexlo27 = "The universe is full of meaning / Deze wereld biedt vele mogelijkheden",
    mexlo29 = "I feel that there is little point to life / Het leven heeft weinig zin",
    mexlo3 = "There is a purpose to my life / Mijn leven heeft een bepaalde bedoeling",
    mexlo30 = "No one else in the world can understand my feelings / Niemand kan mijn gevoelens begrijpen",
    mexlo31 = "My world seems so different from everybody else's / Mijn wereld is totaal anders dan die van andere mensen",
    mexlo6 = "I am surrounded by strangers I cannot connect with / Ik ben omringd door vreemden met wie ik geen contact kan leggen",
    mexlo8 = "I feel lonely / Ik voel mij eenzaam"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mexlo1 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo12 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo16 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo18 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo21 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo23 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo24 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo25 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo26 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo27 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo29 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo3 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo30 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo31 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo6 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  ),
  mexlo8 = c(
    `-4` = "interview terminated",
    `-2` = "not asked",
    `-1` = "na, asked",
    `1` = "no!",
    `2` = "no",
    `3` = "more or less",
    `4` = "yes",
    `5` = "yes!"
  )
)

value_labels_list <- list(
  Wave_J_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mexlo1 = "categorical",
  mexlo12 = "categorical",
  mexlo16 = "categorical",
  mexlo18 = "categorical",
  mexlo21 = "categorical",
  mexlo23 = "categorical",
  mexlo24 = "categorical",
  mexlo25 = "categorical",
  mexlo26 = "categorical",
  mexlo27 = "categorical",
  mexlo29 = "categorical",
  mexlo3 = "categorical",
  mexlo30 = "categorical",
  mexlo31 = "categorical",
  mexlo6 = "categorical",
  mexlo8 = "categorical"
)

.lasa_fc_173 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "173", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "173", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "173", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "173", waves = .lasa_wave_rows())
)
