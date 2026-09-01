## LASA filecode 103 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: give it its own variable_labels()/value_labels() calls
## (or add it to .applies_to_waves of an existing call sharing its text).
## To add a new variable: add it to var_types_vec, then declare its
## text/codes below.

# define variable types ----
## Every canonical variable name this filecode declares, and its
## collapsed type ("numeric"/"categorical"/"text"/"date"). Free order --
## matched by name everywhere below, never by position.
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

# define variable labels ----
variable_labels(
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
  qsmus6 = "kind of music: other",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qmus3", "qmusk6s", "qsmus1", "qsmus2", "qsmus3", "qsmus4", "qsmus5", "qsmus6",
  .applies_to_waves = c("H", "I")
)

variable_labels(
  "qmusat", "qmusl", "qmuslc", "qmuslm", "qmuslnt", "qmussl", "qmussl_a1", "qmussl_a2", "qmussl_a3", "qmussl_a4", "qmussl_a5", "qmussl_a6", "qmussl_i1", "qmussl_i2", "qmussl_i3", "qmussl_i4", "qmussl_i5", "qmussl_i6", "qmussl_y1", "qmussl_y2", "qmussl_y3", "qmussl_y4", "qmussl_y5", "qmussl_y6", "qmussln",
  .applies_to_waves = c("J")
)

variable_labels(
  qmus1 = "make music",
  qmus2 = "type of instrument",
  qmus4 = "number of times per 2 weeks making music or singing",
  qmus5 = "minutes per time",
  .applies_to_waves = c("H", "I")
)

variable_labels(
  qmus1 = "making music or singing momentarily",
  qmus2 = "making music or singing: instrument",
  qmus4 = "making music or singing: number of times per 2 weeks",
  qmus5 = "making music or singing: minutes per time",
  .applies_to_waves = c("J")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("qmus4", "qmus5", "qmusat", "qmuslc", "qmuslm", "qmuslnt", "qmussl_a1", "qmussl_a2", "qmussl_a3", "qmussl_a4", "qmussl_a5", "qmussl_a6", "qmussl_y1", "qmussl_y2", "qmussl_y3", "qmussl_y4", "qmussl_y5", "qmussl_y6", "qmussln", "qsmus1", "qsmus2", "qsmus3", "qsmus4", "qsmus5", "qsmus6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qmus1", "qmus3"),
  .applies_to_waves = c("Z", "H", "I")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("qmus2"),
  .applies_to_waves = c("Z", "H", "I", "J")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("qmus4", "qmus5"),
  .applies_to_waves = c("Z", "H", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "always alone", `2` = "mostly alone", `3` = "changes, as often alone as together", `4` = "mostly together with others", `5` = "always together with others",
  .applies_to_vars = c("qmusat"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qmusl"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("qmuslc", "qmuslm", "qmuslnt"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qmussl"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("qmussl_a1", "qmussl_a2", "qmussl_a3", "qmussl_a4", "qmussl_a5", "qmussl_a6", "qmussl_y1", "qmussl_y2", "qmussl_y3", "qmussl_y4", "qmussl_y5", "qmussl_y6"),
  .applies_to_waves = c("Z", "J")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("qsmus1", "qsmus2", "qsmus3", "qsmus4", "qsmus5", "qsmus6"),
  .applies_to_waves = c("Z", "H", "I")
)

value_labels(
  `-2` = "na, see H/IQMUS1 & H/IQMUS3",
  .applies_to_vars = c("qmus4", "qmus5", "qsmus1", "qsmus2", "qsmus3", "qsmus4", "qsmus5", "qsmus6"),
  .applies_to_waves = c("H", "I")
)

value_labels(
  `-2` = "na, see JQMUSSLN",
  .applies_to_vars = c("qmussl_a1", "qmussl_a2", "qmussl_a3", "qmussl_a4", "qmussl_a5", "qmussl_a6", "qmussl_y1", "qmussl_y2", "qmussl_y3", "qmussl_y4", "qmussl_y5", "qmussl_y6"),
  .applies_to_waves = c("J")
)

value_labels(
  `-1` = "na asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qmus1", "qmusl"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JQMUS1", `-1` = "na, asked",
  .applies_to_vars = c("qmus4"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JQMUS4", `-1` = "na, asked",
  .applies_to_vars = c("qmus5"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JQMUS1", `-1` = "na, asked", `1` = "always alone", `2` = "mostly alone", `3` = "changes, as often alone as together", `4` = "mostly together with others", `5` = "always together with others",
  .applies_to_vars = c("qmusat"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JQMUSL", `-1` = "na, asked",
  .applies_to_vars = c("qmuslc", "qmuslnt"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JQMUSLNT", `-1` = "na, asked",
  .applies_to_vars = c("qmuslm"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JQMUSSL",
  .applies_to_vars = c("qmussln"),
  .applies_to_waves = c("J")
)

.lasa_fc_103 <- .lasa_finalize_fc("103")

