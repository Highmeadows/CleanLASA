## LASA filecode 227 -- variable names, variable labels, value labels,
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
  mastery = "numeric",
  mastry7 = "numeric",
  rmmas = "categorical",
  rmmas7 = "categorical",
  rmself = "categorical",
  selfest = "numeric"
)

# define variable labels ----
variable_labels(
  mastery = "Mastery 5-item total scale",
  mastry7 = "Mastery 7-item total scale",
  rmmas = "Reason no mastery scale score",
  rmmas7 = "Reason no 7-item mastery scale score",
  rmself = "Reason no self-esteem scale score",
  selfest = "Self-esteem total scale",
  .applies_to_waves = c("Z")
)

variable_labels(
  "rmmas",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "rmself",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "rmmas7",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  mastery = "Mastery total scale low-high",
  rmmas = "Reason missing: Mastery",
  .applies_to_waves = c("B")
)

variable_labels(
  mastery = "Mastery 5-item total scale low-high",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  selfest = "Self-esteem total scale low-high",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  mastry7 = "Mastery 7-item total scale low-high",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "no valid data", `5` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("mastery"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "no valid data", `7` = NA_character_, `35` = NA_character_,
  .applies_to_vars = c("mastry7"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refused to answer / refusal / lack of understanding",
  .applies_to_vars = c("rmmas"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refusal / lack of understanding",
  .applies_to_vars = c("rmmas7", "rmself"),
  .applies_to_waves = c("Z", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no valid data", `4` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("selfest"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BRMMAS", `5` = NA_character_, `25` = NA_character_,
  .applies_to_vars = c("mastery"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings",
  .applies_to_vars = c("rmmas"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "MB")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings",
  .applies_to_vars = c("rmself"),
  .applies_to_waves = c("C", "D", "E", "2B")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings",
  .applies_to_vars = c("rmmas7"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refused to answer",
  .applies_to_vars = c("rmmas"),
  .applies_to_waves = c("F", "G", "H", "3B", "I")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refused to answer",
  .applies_to_vars = c("rmmas7", "rmself"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refusal, lack of understanding",
  .applies_to_vars = c("rmself"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "valid score", `1` = "short interview", `2` = "interview terminated", `3` = "too many missings", `4` = "refusal / lack of understanding",
  .applies_to_vars = c("rmmas"),
  .applies_to_waves = c("J", "K")
)

.lasa_fc_227 <- .lasa_finalize_fc("227")

