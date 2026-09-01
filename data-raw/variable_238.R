## LASA filecode 238 -- variable names, variable labels, value labels,
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
  cort_int = "numeric",
  cos_int = "numeric",
  sal_int = "numeric"
)

# define variable labels ----
variable_labels(
  cort_int = "Orthodoxy Scale Score",
  cos_int = "Cosmic Transcendence Scale Score",
  sal_int = "Salience Scale Score",
  .applies_to_waves = c("Z")
)

variable_labels(
  cort_int = "ORTHODOXY SCALE SCORE",
  .applies_to_waves = c("C")
)

variable_labels(
  cos_int = "COSMIC TRANSCENDENCE SCALE SCORE",
  .applies_to_waves = c("C", "D", "E", "2B", "F")
)

variable_labels(
  sal_int = "SALIENCE SCALE SCORE",
  .applies_to_waves = c("C", "D", "E", "2B")
)

# define value labels ----
value_labels(
  `-2` = "na, see RMGL", `-1` = "na, too many missings", `0` = NA_character_, `7` = NA_character_,
  .applies_to_vars = c("cort_int"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RMGL", `-1` = "na, too many missings", `0` = NA_character_, `4` = NA_character_,
  .applies_to_vars = c("cos_int"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see RMGL", `-1` = "na, too many missings", `0` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("sal_int"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see CRMGL", `-1` = "na, too many missings", `0` = NA_character_, `7` = NA_character_,
  .applies_to_vars = c("cort_int"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CRMGL", `-1` = "na, too many missings", `0` = NA_character_, `4` = NA_character_,
  .applies_to_vars = c("cos_int"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CRMGL", `-1` = "na, too many missings", `0` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("sal_int"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see DRMGL", `-1` = "na, too many missings", `0` = NA_character_, `4` = NA_character_,
  .applies_to_vars = c("cos_int"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DRMGL", `-1` = "na, too many missings", `0` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("sal_int"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see ERMGL", `-1` = "na, too many missings", `0` = NA_character_, `4` = NA_character_,
  .applies_to_vars = c("cos_int"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ERMGL", `-1` = "na, too many missings", `0` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("sal_int"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see BRMGL", `-1` = "na, too many missings", `0` = NA_character_, `4` = NA_character_,
  .applies_to_vars = c("cos_int"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BRMGL", `-1` = "na, too many missings", `0` = NA_character_, `20` = NA_character_,
  .applies_to_vars = c("sal_int"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see FRMGL", `-1` = "na, too many missings", `0` = NA_character_, `4` = NA_character_,
  .applies_to_vars = c("cos_int"),
  .applies_to_waves = c("F")
)

.lasa_fc_238 <- .lasa_finalize_fc("238")

