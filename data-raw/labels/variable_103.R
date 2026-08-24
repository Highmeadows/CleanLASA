## LASA filecode 103 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qmus1 = "Making music or singing",
  qmus2 = "Making music or singing: instrument",
  qmus3 = "singing as a hobby",
  qmus4 = "Making music or singing: number of times per 2 weeks",
  qmus5 = "Making music or singing: minutes per time",
  qmusat = "making music or singing: alone or together",
  qmusk6s = "kind of music: other, specified",
  qmusl = "listening to music",
  qmuslc = "listening to music: number of concerts attending per year",
  qmuslm = "listening to music: minutes per time",
  qmuslnt = "listening to music: number of times per 2 weeks",
  qmussl = "music or singing lessons",
  qmussl_a1 = "lessons 1: age at start",
  qmussl_a2 = "lessons 2: age at start",
  qmussl_a3 = "lessons 3: age at start",
  qmussl_a4 = "lessons 4: age at start",
  qmussl_a5 = "lessons 5: age at start",
  qmussl_a6 = "lessons 6: age at start",
  qmussl_i1 = "lessons 1: instrument",
  qmussl_i2 = "lessons 2: instrument",
  qmussl_i3 = "lessons 3: instrument",
  qmussl_i4 = "lessons 4: instrument",
  qmussl_i5 = "lessons 5: instrument",
  qmussl_i6 = "lessons 6: instrument",
  qmussl_y1 = "lessons 1: number of years",
  qmussl_y2 = "lessons 2: number of years",
  qmussl_y3 = "lessons 3: number of years",
  qmussl_y4 = "lessons 4: number of years",
  qmussl_y5 = "lessons 5: number of years",
  qmussl_y6 = "lessons 6: number of years",
  qmussln = "lessons: number of instruments (including voice)",
  qsmus1 = "kind of music: classic",
  qsmus2 = "kind of music: jazz",
  qsmus3 = "kind of music: Dutch",
  qsmus4 = "kind of music: pop",
  qsmus5 = "kind of music: rock",
  qsmus6 = "kind of music: other"
)

variable_labels_list <- list(
  Wave_H_labels = .replace_labels(
    harmonized_labels[c(
    "qmus1",
    "qmus2",
    "qmus3",
    "qmus4",
    "qmus5",
    "qmusk6s",
    "qsmus1",
    "qsmus2",
    "qsmus3",
    "qsmus4",
    "qsmus5",
    "qsmus6"
  )],
    qmus1 = "make music",
    qmus2 = "type of instrument",
    qmus4 = "number of times per 2 weeks making music or singing",
    qmus5 = "minutes per time"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "qmus1",
    "qmus2",
    "qmus3",
    "qmus4",
    "qmus5",
    "qmusk6s",
    "qsmus1",
    "qsmus2",
    "qsmus3",
    "qsmus4",
    "qsmus5",
    "qsmus6"
  )],
    qmus1 = "make music",
    qmus2 = "type of instrument",
    qmus4 = "number of times per 2 weeks making music or singing",
    qmus5 = "minutes per time"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "qmus1",
    "qmus2",
    "qmus4",
    "qmus5",
    "qmusat",
    "qmusl",
    "qmuslc",
    "qmuslm",
    "qmuslnt",
    "qmussl",
    "qmussl_a1",
    "qmussl_a2",
    "qmussl_a3",
    "qmussl_a4",
    "qmussl_a5",
    "qmussl_a6",
    "qmussl_i1",
    "qmussl_i2",
    "qmussl_i3",
    "qmussl_i4",
    "qmussl_i5",
    "qmussl_i6",
    "qmussl_y1",
    "qmussl_y2",
    "qmussl_y3",
    "qmussl_y4",
    "qmussl_y5",
    "qmussl_y6",
    "qmussln"
  )],
    qmus1 = "making music or singing momentarily",
    qmus2 = "making music or singing: instrument",
    qmus4 = "making music or singing: number of times per 2 weeks",
    qmus5 = "making music or singing: minutes per time"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qmus1 = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  qmus2 = c(`-1` = "no answer"),
  qmus3 = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  qmus4 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmus5 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmusat = c(
    `-2` = "not available, routing",
    `-1` = "no answer",
    `1` = "always alone",
    `2` = "mostly alone",
    `3` = "changes, as often alone as together",
    `4` = "mostly together with others",
    `5` = "always together with others"
  ),
  qmusk6s = stats::setNames(character(0), character(0)),
  qmusl = c(`-1` = "not available, asked", `1` = "no", `2` = "yes"),
  qmuslc = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmuslm = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmuslnt = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  qmussl_a1 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_a2 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_a3 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_a4 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_a5 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_a6 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_i1 = stats::setNames(character(0), character(0)),
  qmussl_i2 = stats::setNames(character(0), character(0)),
  qmussl_i3 = stats::setNames(character(0), character(0)),
  qmussl_i4 = stats::setNames(character(0), character(0)),
  qmussl_i5 = stats::setNames(character(0), character(0)),
  qmussl_i6 = stats::setNames(character(0), character(0)),
  qmussl_y1 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_y2 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_y3 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_y4 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_y5 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussl_y6 = c(`-2` = "not available, routing", `-1` = "no answer"),
  qmussln = c(`-2` = "not available, routing"),
  qsmus1 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  qsmus2 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  qsmus3 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  qsmus4 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  qsmus5 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned"),
  qsmus6 = c(`-2` = "not available, routing", `0` = "not mentioned", `1` = "mentioned")
)

value_labels_list <- list(
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "qmus1",
    "qmus2",
    "qmus3",
    "qmus4",
    "qmus5",
    "qsmus1",
    "qsmus2",
    "qsmus3",
    "qsmus4",
    "qsmus5",
    "qsmus6"
  )],
    qmus4 = .replace_labels(
    standardized_value_labels$qmus4,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qmus5 = .replace_labels(
    standardized_value_labels$qmus5,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus1 = .replace_labels(
    standardized_value_labels$qsmus1,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus2 = .replace_labels(
    standardized_value_labels$qsmus2,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus3 = .replace_labels(
    standardized_value_labels$qsmus3,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus4 = .replace_labels(
    standardized_value_labels$qsmus4,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus5 = .replace_labels(
    standardized_value_labels$qsmus5,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus6 = .replace_labels(
    standardized_value_labels$qsmus6,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "qmus1",
    "qmus2",
    "qmus3",
    "qmus4",
    "qmus5",
    "qsmus1",
    "qsmus2",
    "qsmus3",
    "qsmus4",
    "qsmus5",
    "qsmus6"
  )],
    qmus4 = .replace_labels(
    standardized_value_labels$qmus4,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qmus5 = .replace_labels(
    standardized_value_labels$qmus5,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus1 = .replace_labels(
    standardized_value_labels$qsmus1,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus2 = .replace_labels(
    standardized_value_labels$qsmus2,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus3 = .replace_labels(
    standardized_value_labels$qsmus3,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus4 = .replace_labels(
    standardized_value_labels$qsmus4,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus5 = .replace_labels(
    standardized_value_labels$qsmus5,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  ),
    qsmus6 = .replace_labels(
    standardized_value_labels$qsmus6,
    `-2` = "na, see H/IQMUS1 & H/IQMUS3"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "qmus1",
    "qmus2",
    "qmus4",
    "qmus5",
    "qmusat",
    "qmusl",
    "qmuslc",
    "qmuslm",
    "qmuslnt",
    "qmussl",
    "qmussl_a1",
    "qmussl_a2",
    "qmussl_a3",
    "qmussl_a4",
    "qmussl_a5",
    "qmussl_a6",
    "qmussl_y1",
    "qmussl_y2",
    "qmussl_y3",
    "qmussl_y4",
    "qmussl_y5",
    "qmussl_y6",
    "qmussln"
  )],
    qmus1 = .replace_labels(
    standardized_value_labels$qmus1,
    `-1` = "na asked"
  ),
    qmus4 = .replace_labels(
    standardized_value_labels$qmus4,
    `-2` = "na, see JQMUS1"
  ),
    qmus5 = .replace_labels(
    standardized_value_labels$qmus5,
    `-2` = "na, see JQMUS4"
  ),
    qmusat = .replace_labels(
    standardized_value_labels$qmusat,
    `-2` = "na, see JQMUS1"
  ),
    qmusl = .replace_labels(
    standardized_value_labels$qmusl,
    `-1` = "na asked"
  ),
    qmuslc = .replace_labels(
    standardized_value_labels$qmuslc,
    `-2` = "na, see JQMUSL"
  ),
    qmuslm = .replace_labels(
    standardized_value_labels$qmuslm,
    `-2` = "na, see JQMUSLNT"
  ),
    qmuslnt = .replace_labels(
    standardized_value_labels$qmuslnt,
    `-2` = "na, see JQMUSL"
  ),
    qmussl_a1 = .replace_labels(
    standardized_value_labels$qmussl_a1,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_a2 = .replace_labels(
    standardized_value_labels$qmussl_a2,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_a3 = .replace_labels(
    standardized_value_labels$qmussl_a3,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_a4 = .replace_labels(
    standardized_value_labels$qmussl_a4,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_a5 = .replace_labels(
    standardized_value_labels$qmussl_a5,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_a6 = .replace_labels(
    standardized_value_labels$qmussl_a6,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_y1 = .replace_labels(
    standardized_value_labels$qmussl_y1,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_y2 = .replace_labels(
    standardized_value_labels$qmussl_y2,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_y3 = .replace_labels(
    standardized_value_labels$qmussl_y3,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_y4 = .replace_labels(
    standardized_value_labels$qmussl_y4,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_y5 = .replace_labels(
    standardized_value_labels$qmussl_y5,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussl_y6 = .replace_labels(
    standardized_value_labels$qmussl_y6,
    `-2` = "na, see JQMUSSLN"
  ),
    qmussln = .replace_labels(
    standardized_value_labels$qmussln,
    `-2` = "na, see JQMUSSL"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qmus1 = "categorical",
  qmus2 = "text",
  qmus3 = "categorical",
  qmus4 = "numeric",
  qmus5 = "numeric",
  qmusat = "categorical",
  qmusk6s = "text",
  qmusl = "categorical",
  qmuslc = "numeric",
  qmuslm = "numeric",
  qmuslnt = "numeric",
  qmussl = "categorical",
  qmussl_a1 = "numeric",
  qmussl_a2 = "numeric",
  qmussl_a3 = "numeric",
  qmussl_a4 = "numeric",
  qmussl_a5 = "numeric",
  qmussl_a6 = "numeric",
  qmussl_i1 = "text",
  qmussl_i2 = "text",
  qmussl_i3 = "text",
  qmussl_i4 = "text",
  qmussl_i5 = "text",
  qmussl_i6 = "text",
  qmussl_y1 = "numeric",
  qmussl_y2 = "numeric",
  qmussl_y3 = "numeric",
  qmussl_y4 = "numeric",
  qmussl_y5 = "numeric",
  qmussl_y6 = "numeric",
  qmussln = "numeric",
  qsmus1 = "categorical",
  qsmus2 = "categorical",
  qsmus3 = "categorical",
  qsmus4 = "categorical",
  qsmus5 = "categorical",
  qsmus6 = "categorical"
)

.lasa_fc_103 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "103", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "103", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "103", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "103", waves = .lasa_wave_rows())
)
