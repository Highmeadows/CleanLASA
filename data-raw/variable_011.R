## LASA filecode 011 -- variable names, variable labels, value labels,
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
  hhnch = "numeric",
  hhnnonk = "numeric",
  hhnothf = "numeric",
  hhnsib = "numeric",
  hhnstch = "numeric",
  hhpart = "categorical",
  nupers = "numeric"
)

# define variable labels ----
variable_labels(
  hhnch = "Number of children in household",
  hhnnonk = "Number of nonkin persons in household",
  hhnothf = "Number of other family members in household",
  hhnsib = "Number of siblings in household",
  hhnstch = "Number of stepchildren in household",
  hhpart = "Partner in household",
  nupers = "Number of other persons in household",
  .applies_to_waves = c("Z")
)

variable_labels(
  nupers = "Number of persons in household",
  .applies_to_waves = c("B")
)

variable_labels(
  nupers = "# other persons in household (partner excluded)",
  .applies_to_waves = c("C", "D", "E", "2B")
)

variable_labels(
  hhnch = "number of children in household",
  hhnnonk = "number of nonkin persons in household",
  hhnothf = "number of other family members in household",
  hhnsib = "number of siblings in household",
  hhnstch = "number of stepchildren in household",
  hhpart = "partner in household",
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  nupers = "# other persons in household",
  .applies_to_waves = c("F", "G", "H", "3B", "MB", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("nupers"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip",
  .applies_to_vars = c("nupers"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("hhnch", "hhnnonk", "hhnothf", "hhnsib", "hhnstch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `0` = "no partner in household", `1` = "partner in household",
  .applies_to_vars = c("hhpart"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available, routing", `0` = "none",
  .applies_to_vars = c("nupers"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, not liv independently", `0` = "none",
  .applies_to_vars = c("nupers"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see C/D/E/BHINDEP in LASA014", `0` = "none",
  .applies_to_vars = c("nupers"),
  .applies_to_waves = c("C", "D", "E", "2B")
)

value_labels(
  `-2` = "na, see F/G/H/B/I/J/KNUPERS",
  .applies_to_vars = c("hhnch", "hhnnonk", "hhnothf", "hhnsib", "hhnstch", "hhpart"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `0` = "no partner in household", `1` = "partner in household",
  .applies_to_vars = c("hhpart"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see F/G/H/B/I/J/KHINDEP in LASA014", `0` = "none",
  .applies_to_vars = c("nupers"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `0` = "none",
  .applies_to_vars = c("nupers"),
  .applies_to_waves = c("MB")
)

.lasa_fc_011 <- .lasa_finalize_fc("011")

