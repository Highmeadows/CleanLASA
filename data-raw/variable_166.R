## LASA filecode 166 -- variable names, variable labels, value labels,
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
  mDSb01 = "numeric",
  mDSb02 = "numeric",
  mDSb03 = "numeric",
  mDSb04 = "numeric",
  mDSb05 = "numeric",
  mDSb06 = "numeric",
  mDSb07 = "numeric",
  mDSbsp = "numeric",
  mDSbw = "numeric",
  mDSf01 = "numeric",
  mDSf02 = "numeric",
  mDSf03 = "numeric",
  mDSf04 = "numeric",
  mDSf05 = "numeric",
  mDSf06 = "numeric",
  mDSf07 = "numeric",
  mDSf08 = "numeric",
  mDSfsp = "numeric",
  mDSfw = "numeric",
  mDStot = "numeric",
  mdsbwp_1 = "categorical",
  mdsbwp_2 = "categorical",
  mdsbwp_3 = "categorical",
  mdsbwp_4 = "categorical",
  mdsbwp_5 = "categorical",
  mdsfwp_1 = "categorical",
  mdsfwp_2 = "categorical",
  mdsfwp_3 = "categorical",
  mdsfwp_4 = "categorical",
  mdsfwp_5 = "categorical"
)

# define variable labels ----
variable_labels(
  mDSb01 = "Digit Span backwards: 2 numbers, attempt 1+2",
  mDSb02 = "Digit Span backwards: 3 numbers, attempt 1+2",
  mDSb03 = "Digit Span backwards: 4 numbers, attempt 1+2",
  mDSb04 = "Digit Span backwards: 5 numbers, attempt 1+2",
  mDSb05 = "Digit Span backwards: 6 numbers, attempt 1+2",
  mDSb06 = "Digit Span backwards: 7 numbers, attempt 1+2",
  mDSb07 = "Digit Span backwards: 8 numbers, attempt 1+2",
  mDSbsp = "WAIS Digit Span: span backwards",
  mDSbw = "WAIS Digit Span: number of correct backward items",
  mDSf01 = "Digit Span forwards: 2 numbers, attempt 1+2",
  mDSf02 = "Digit Span forwards: 3 numbers, attempt 1+2",
  mDSf03 = "Digit Span forwards: 4 numbers, attempt 1+2",
  mDSf04 = "Digit Span forwards: 5 numbers, attempt 1+2",
  mDSf05 = "Digit Span forwards: 6 numbers, attempt 1+2",
  mDSf06 = "Digit Span forwards: 7 numbers, attempt 1+2",
  mDSf07 = "Digit Span forwards: 8 numbers, attempt 1+2",
  mDSf08 = "Digit Span forwards: 9 numbers, attempt 1+2",
  mDSfsp = "WAIS Digit Span: span forwards",
  mDSfw = "WAIS Digit Span: number of correct forward items",
  mDStot = "WAIS Digit Span: total number of correct items",
  mdsbwp_1 = "Digit Span backwards particularity: company others",
  mdsbwp_2 = "Digit Span backwards particularity: hearing-impaired",
  mdsbwp_3 = "Digit Span backwards particularity: radio or television",
  mdsbwp_4 = "Digit Span backwards particularity: test interrupted",
  mdsbwp_5 = "Digit Span backwards particularity: other",
  mdsfwp_1 = "Digit Span forwards particularity: company others",
  mdsfwp_2 = "Digit Span forwards particularity: hearing-impaired",
  mdsfwp_3 = "Digit Span forwards particularity: radio or television",
  mdsfwp_4 = "Digit Span forwards particularity: test interrupted",
  mdsfwp_5 = "Digit Span forwards particularity: other",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mDSb01", "mDSb02", "mDSb03", "mDSb04", "mDSb05", "mDSb06", "mDSb07", "mDSf01", "mDSf02", "mDSf03", "mDSf04", "mDSf05", "mDSf06", "mDSf07", "mDSf08", "mDStot",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  "mDSbw", "mDSfw",
  .applies_to_waves = c("H", "I", "J")
)

variable_labels(
  "mDSbsp", "mDSfsp",
  .applies_to_waves = c("K")
)

variable_labels(
  mDSbsp = "WAIS Digit Span: Span backwards",
  mDSfsp = "WAIS Digit Span: Span forwards",
  .applies_to_waves = c("H", "I", "J")
)

variable_labels(
  mDSbw = "WAIS Digit Span: number of correct items backward",
  mDSfw = "WAIS Digit Span: number of correct items forward",
  mdsbwp_1 = "Digit Span backwards: particularities: company others",
  mdsbwp_2 = "Digit Span backwards: particularities: hearing-impaired",
  mdsbwp_3 = "Digit Span backwards: particularities: radio or television",
  mdsbwp_4 = "Digit Span backwards: particularities: test interrupted",
  mdsbwp_5 = "Digit Span backwards: particularities: other",
  mdsfwp_1 = "Digit Span forwards: particularities: company others",
  mdsfwp_2 = "Digit Span forwards: particularities: hearing-impaired",
  mdsfwp_3 = "Digit Span forwards: particularities: radio or television",
  mdsfwp_4 = "Digit Span forwards: particularities: test interrupted",
  mdsfwp_5 = "Digit Span forwards: particularities: other",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "no item response",
  .applies_to_vars = c("mDSb01", "mDSb02", "mDSb03", "mDSb04", "mDSb05", "mDSb06", "mDSb07", "mDSf01", "mDSf02", "mDSf03", "mDSf04", "mDSf05", "mDSf06", "mDSf07", "mDSf08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no score, too many missings",
  .applies_to_vars = c("mDSbsp", "mDSbw", "mDSfsp", "mDSfw", "mDStot"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-2` = "no",
  .applies_to_vars = c("mdsbwp_1", "mdsbwp_2", "mdsbwp_3", "mdsbwp_4", "mdsbwp_5", "mdsfwp_1", "mdsfwp_2", "mdsfwp_3", "mdsfwp_4", "mdsfwp_5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not asked, previous answers incorrect",
  .applies_to_vars = c("mDSb01", "mDSb02", "mDSb03", "mDSb04", "mDSb05", "mDSb06", "mDSb07", "mDSf01", "mDSf02", "mDSf03", "mDSf04", "mDSf05", "mDSf06", "mDSf07", "mDSf08"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-3` = "test not done",
  .applies_to_vars = c("mDSb01", "mDSb02", "mDSb03", "mDSb04", "mDSb05", "mDSb06", "mDSb07", "mDSbsp", "mDSbw", "mDSf01", "mDSf02", "mDSf03", "mDSf04", "mDSf05", "mDSf06", "mDSf07", "mDSf08", "mDSfsp", "mDSfw", "mDStot"),
  .applies_to_waves = c("Z", "H", "I", "J")
)

value_labels(
  `-9` = "test not done",
  .applies_to_vars = c("mDSb01", "mDSb02", "mDSb03", "mDSb04", "mDSb05", "mDSb06", "mDSb07", "mDSbsp", "mDSbw", "mDSf01", "mDSf02", "mDSf03", "mDSf04", "mDSf05", "mDSf06", "mDSf07", "mDSf08", "mDSfsp", "mDSfw", "mDStot"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `0` = "0 correct", `1` = "1 correct", `2` = "2 correct",
  .applies_to_vars = c("mDSb01", "mDSb02", "mDSb03", "mDSb04", "mDSb05", "mDSb06", "mDSb07", "mDSf01", "mDSf02", "mDSf03", "mDSf04", "mDSf05", "mDSf06", "mDSf07", "mDSf08"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-2` = "DS backwards not done",
  .applies_to_vars = c("mDStot"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mdsbwp_1", "mdsbwp_2", "mdsbwp_3", "mdsbwp_4", "mdsbwp_5", "mdsfwp_1", "mdsfwp_2", "mdsfwp_3", "mdsfwp_4", "mdsfwp_5"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-1` = "asked, no answer",
  .applies_to_vars = c("mDSb01", "mDSb02", "mDSb03", "mDSb04", "mDSb05", "mDSb06", "mDSb07", "mDSf01", "mDSf02", "mDSf03", "mDSf04", "mDSf05", "mDSf06", "mDSf07", "mDSf08"),
  .applies_to_waves = c("H")
)

value_labels(
  `-1` = "not asked",
  .applies_to_vars = c("mDSb01", "mDSb02", "mDSb03", "mDSb04", "mDSb05", "mDSb06", "mDSb07", "mDSf01", "mDSf02", "mDSf03", "mDSf04", "mDSf05", "mDSf06", "mDSf07", "mDSf08"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "no particularities",
  .applies_to_vars = c("mdsbwp_1", "mdsbwp_2", "mdsbwp_3", "mdsbwp_4", "mdsbwp_5", "mdsfwp_1", "mdsfwp_2", "mdsfwp_3", "mdsfwp_4", "mdsfwp_5"),
  .applies_to_waves = c("K")
)

.lasa_fc_166 <- .lasa_finalize_fc("166")

