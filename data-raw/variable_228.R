## LASA filecode 228 -- variable names, variable labels, value labels,
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
  adversi = "numeric",
  alcos = "numeric",
  comple = "numeric",
  initia = "numeric",
  rmalc = "categorical"
)

# define variable labels ----
variable_labels(
  adversi = "Persistence in the face of adversity score",
  alcos = "Perceived self-efficacy scale score",
  comple = "Effort completing behavior score",
  initia = "Willingness to initiate behavior score",
  rmalc = "Reason for missing perceived self-efficacy score",
  .applies_to_waves = c("Z")
)

variable_labels(
  adversi = "persistence in the face of adversity",
  alcos = "alcos scale score",
  comple = "effort completing behavior",
  initia = "willingness to initiate behavior",
  rmalc = "reason missing alcos score",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("adversi", "alcos", "comple", "initia"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "valid score",
  .applies_to_vars = c("rmalc"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `4` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("adversi"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `14` = NA_character_, `20` = NA_character_, `22` = NA_character_, `23` = NA_character_, `60` = NA_character_,
  .applies_to_vars = c("alcos"),
  .applies_to_waves = c("Z")
)

value_labels(
  `5` = NA_character_, `8` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("comple"),
  .applies_to_waves = c("Z")
)

value_labels(
  `3` = NA_character_, `15` = NA_character_,
  .applies_to_vars = c("initia"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refusal / lack of understanding",
  .applies_to_vars = c("rmalc"),
  .applies_to_waves = c("Z", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BRMALC", `4` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("adversi"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRMALC", `14` = NA_character_, `60` = NA_character_,
  .applies_to_vars = c("alcos"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRMALC", `5` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("comple"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRMALC", `3` = NA_character_, `15` = NA_character_,
  .applies_to_vars = c("initia"),
  .applies_to_waves = c("B")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "too many missings",
  .applies_to_vars = c("rmalc"),
  .applies_to_waves = c("B", "C", "D", "E", "2B")
)

value_labels(
  `20` = NA_character_, `60` = NA_character_,
  .applies_to_vars = c("alcos"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `8` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("comple"),
  .applies_to_waves = c("C", "D", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `23` = NA_character_, `60` = NA_character_,
  .applies_to_vars = c("alcos"),
  .applies_to_waves = c("E", "2B", "F")
)

value_labels(
  `5` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("comple"),
  .applies_to_waves = c("E", "2B", "F")
)

value_labels(
  `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refused to answer",
  .applies_to_vars = c("rmalc"),
  .applies_to_waves = c("F")
)

value_labels(
  `22` = NA_character_, `60` = NA_character_,
  .applies_to_vars = c("alcos"),
  .applies_to_waves = c("G", "H", "3B", "I", "J", "K")
)

.lasa_fc_228 <- .lasa_finalize_fc("228")

