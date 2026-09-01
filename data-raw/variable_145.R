## LASA filecode 145 -- variable names, variable labels, value labels,
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
  mcshape = "categorical",
  mshap40 = "categorical",
  qcshape = "categorical",
  qishape = "categorical",
  qshap40 = "categorical"
)

# define variable labels ----
variable_labels(
  mcshape = "current body shape",
  mshap40 = "Body shape at 40",
  qcshape = "current body shape",
  qishape = "ideal body shape",
  qshap40 = "Body shape at 40",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qcshape", "qishape",
  .applies_to_waves = c("F", "G", "3B")
)

variable_labels(
  "qshap40",
  .applies_to_waves = c("3B")
)

variable_labels(
  "mcshape", "mshap40",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-1` = "not available", `1` = "silhouette 1 (extremely thin)", `2` = "silhouette 2", `3` = "silhouette 3", `4` = "silhouette 4", `5` = "silhouette 5", `6` = "silhouette 6", `7` = "silhouette 7", `8` = "silhouette 8", `9` = "silhouette 9 (very large)",
  .applies_to_vars = c("mcshape", "mshap40", "qcshape", "qishape", "qshap40"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no valid data", `1` = "silhouette 1 (extremely thin)", `2` = "silhouette 2", `3` = "silhouette 3", `4` = "silhouette 4", `5` = "silhouette 5", `6` = "silhouette 6", `7` = "silhouette 7", `8` = "silhouette 8", `9` = "silhouette 9 (very large)",
  .applies_to_vars = c("qcshape", "qishape"),
  .applies_to_waves = c("F", "G", "3B")
)

value_labels(
  `-1` = "no valid data", `1` = "silhouette 1 (extremely thin)", `2` = "silhouette 2", `3` = "silhouette 3", `4` = "silhouette 4", `5` = "silhouette 5", `6` = "silhouette 6", `7` = "silhouette 7", `8` = "silhouette 8", `9` = "silhouette 9 (very large)",
  .applies_to_vars = c("qshap40"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-1` = "no valid data", `1` = "silhouette 1 (extremely thin)", `2` = "silhouette 2", `3` = "silhouette 3", `4` = "silhouette 4", `5` = "silhouette 5", `6` = "silhouette 6", `7` = "silhouette 7", `8` = "silhouette 8", `9` = "silhouette 9 (very large)",
  .applies_to_vars = c("mcshape", "mshap40"),
  .applies_to_waves = c("MB")
)

.lasa_fc_145 <- .lasa_finalize_fc("145")

