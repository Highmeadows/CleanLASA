## LASA filecode 140 -- variable names, variable labels, value labels,
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
  qfa_ch = "categorical",
  qmo_ch = "categorical",
  qmo_emp = "categorical",
  qmo_vol = "categorical",
  qparsep = "categorical",
  qparsey = "numeric"
)

# define variable labels ----
variable_labels(
  qfa_ch = "Father church member during youth R?",
  qmo_ch = "Mother church member during youth R?",
  qmo_emp = "Mother employed during youth R?",
  qmo_vol = "Mother volunteer work during youth R?",
  qparsep = "Parents ever separated/divorced?",
  qparsey = "Year parents separated/divorced",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qfa_ch", "qmo_ch", "qmo_emp", "qmo_vol", "qparsep", "qparsey",
  .applies_to_waves = c("2B", "3B")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "no church member", `2` = "Reformed", `3` = "Dutch reformed", `4` = "small reformed denomination", `5` = "Roman-Catholic", `6` = "Humanistic society", `7` = "Jewish", `8` = "other", `9` = "Jewish", `10` = "other",
  .applies_to_vars = c("qfa_ch", "qmo_ch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available", `1` = "no", `2` = "yes",
  .applies_to_vars = c("qmo_emp", "qmo_vol", "qparsep"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available", `-1` = "not available",
  .applies_to_vars = c("qparsey"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no answer",
  .applies_to_vars = c("qfa_ch", "qmo_ch", "qmo_emp", "qmo_vol", "qparsep", "qparsey"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `1` = "no church member", `2` = "Reformed", `3` = "Dutch reformed", `4` = "small reformed denomination", `5` = "Roman-Catholic", `6` = "Humanistic society", `7` = "Jewish", `8` = "other",
  .applies_to_vars = c("qfa_ch", "qmo_ch"),
  .applies_to_waves = c("2B")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("qmo_emp", "qmo_vol", "qparsep"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "no answer, see BQPARSEP",
  .applies_to_vars = c("qparsey"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `1` = "no church member", `2` = "Dutch reformed", `3` = "Reformed Association within the Dutch Reformed Church", `4` = "Reformed churches in the Netherlands (Synodal)", `5` = "Other Reformed churches", `6` = "Other protestant churches", `7` = "Roman-Catholic", `8` = "Humanistic society", `9` = "Jewish", `10` = "other",
  .applies_to_vars = c("qfa_ch", "qmo_ch"),
  .applies_to_waves = c("3B")
)

.lasa_fc_140 <- .lasa_finalize_fc("140")

