## LASA filecode 349 -- variable names, variable labels, value labels,
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
  qgsr = "numeric",
  qgsracp = "numeric",
  qgsrmk = "numeric",
  qgsrsu = "numeric",
  qmisgsr = "numeric"
)

# define variable labels ----
variable_labels(
  qgsr = "General self-regulation scale score",
  qgsracp = "General self-regulation action-and-coping-planning subscale score",
  qgsrmk = "General self-regulation metastrategy-knowledge subscale score",
  qgsrsu = "General self-regulation strategy-use subscale score",
  qmisgsr = "Number of missing general self-regulation items",
  .applies_to_waves = c("Z")
)

variable_labels(
  qgsr = "general self-regulation scale score",
  qgsracp = "action and coping planning GSR-subscale score",
  qgsrmk = "metastrategy-knowledge GSR-subscale score",
  qgsrsu = "strategy use GSR-subscale score",
  qmisgsr = "missing values general self-regulation",
  .applies_to_waves = c("G", "H")
)

# define value labels ----
value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("qgsr", "qgsracp", "qgsrmk", "qgsrsu"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `14` = NA_character_, `84` = NA_character_,
  .applies_to_vars = c("qgsr"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `6` = NA_character_, `36` = NA_character_,
  .applies_to_vars = c("qgsracp"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `4` = NA_character_, `24` = NA_character_,
  .applies_to_vars = c("qgsrmk", "qgsrsu"),
  .applies_to_waves = c("Z", "G", "H")
)

.lasa_fc_349 <- .lasa_finalize_fc("349")

