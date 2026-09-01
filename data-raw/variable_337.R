## LASA filecode 337 -- variable names, variable labels, value labels,
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
  qamb = "numeric",
  qres = "numeric",
  qvall = "numeric",
  qzest = "numeric"
)

# define variable labels ----
variable_labels(
  qamb = "Valuation of late life ambition subscale score",
  qres = "Valuation of late life resilience subscale score",
  qvall = "Valuation of late life scale score",
  qzest = "Valuation of late life zest-for-life subscale score",
  .applies_to_waves = c("Z")
)

variable_labels(
  qamb = "ambition vall-subscale score",
  qres = "resilience vall-subscale score",
  qvall = "value of late life scale score",
  qzest = "zest for life vall-subscale score",
  .applies_to_waves = c("E", "F")
)

# define value labels ----
value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("qamb", "qres", "qvall", "qzest"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `4` = NA_character_, `19` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("qamb"),
  .applies_to_waves = c("Z")
)

value_labels(
  `4` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("qres", "qzest"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `12` = NA_character_, `53` = NA_character_, `56` = NA_character_,
  .applies_to_vars = c("qvall"),
  .applies_to_waves = c("Z")
)

value_labels(
  `4` = NA_character_, `19` = NA_character_,
  .applies_to_vars = c("qamb"),
  .applies_to_waves = c("E")
)

value_labels(
  `12` = NA_character_, `56` = NA_character_,
  .applies_to_vars = c("qvall"),
  .applies_to_waves = c("E")
)

value_labels(
  `4` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("qamb"),
  .applies_to_waves = c("F")
)

value_labels(
  `12` = NA_character_, `53` = NA_character_,
  .applies_to_vars = c("qvall"),
  .applies_to_waves = c("F")
)

.lasa_fc_337 <- .lasa_finalize_fc("337")

