## LASA filecode 197 -- variable names, variable labels, value labels,
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
  maarc1 = "categorical",
  maarc10 = "categorical",
  maarc2 = "categorical",
  maarc3 = "categorical",
  maarc4 = "categorical",
  maarc5 = "categorical",
  maarc6 = "categorical",
  maarc7 = "categorical",
  maarc8 = "categorical",
  maarc9 = "categorical"
)

# define variable labels ----
variable_labels(
  maarc1 = "AARC: I appreciate relationships and people much more",
  maarc10 = "AARC: I find it harder to motivate myself",
  maarc2 = "AARC: my mental capacity is declining",
  maarc3 = "AARC: I pay more attention to my health",
  maarc4 = "AARC: I have to limit my activities",
  maarc5 = "AARC: I have more experience and knowledge to evaluate things and people",
  maarc6 = "AARC: I have less energy",
  maarc7 = "AARC: I have a better sense of what is important to me",
  maarc8 = "AARC: I feel more dependent on the help of others",
  maarc9 = "AARC: I have more freedom to live my days the way I want",
  .applies_to_waves = c("Z")
)

variable_labels(
  "maarc1", "maarc10", "maarc2", "maarc3", "maarc4", "maarc5", "maarc6", "maarc7", "maarc8", "maarc9",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("maarc1", "maarc10", "maarc2", "maarc3", "maarc4", "maarc5", "maarc6", "maarc7", "maarc8", "maarc9"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `1` = "not at all", `2` = "a little", `3` = "moderately", `4` = "quite a bit", `5` = "very much",
  .applies_to_vars = c("maarc1", "maarc10", "maarc2", "maarc3", "maarc4", "maarc5", "maarc6", "maarc7", "maarc8", "maarc9"),
  .applies_to_waves = c("Z", "K")
)

.lasa_fc_197 <- .lasa_finalize_fc("197")

