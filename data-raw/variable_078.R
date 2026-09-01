## LASA filecode 078 -- variable names, variable labels, value labels,
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
  an1 = "categorical",
  an10 = "categorical",
  an4 = "categorical",
  an6 = "categorical",
  an8 = "categorical",
  an9 = "categorical"
)

# define variable labels ----
variable_labels(
  an1 = "want to talk about feelings",
  an10 = "when difficulties, like to lean on someone",
  an4 = "when in trouble, I need support",
  an6 = "cope with sorrows on my own",
  an8 = "go to others when something bothers me",
  an9 = "my feelings are my own business",
  .applies_to_waves = c("Z")
)

variable_labels(
  "an1", "an10", "an4", "an6", "an8", "an9",
  .applies_to_waves = c("B", "E")
)

# define value labels ----
value_labels(
  `-2` = "no valid data", `-1` = "na, asked",
  .applies_to_vars = c("an1", "an10", "an4", "an6", "an8", "an9"),
  .applies_to_waves = c("Z", "B", "E")
)

value_labels(
  `-4` = "na, short interview", `-3` = "interview terminated", `1` = "no", `2` = "more or less", `3` = "yes",
  .applies_to_vars = c("an1", "an10", "an4", "an6", "an8", "an9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "short version Q", `-3` = "interview broken off", `1` = "no", `2` = "more-or-less", `3` = "yes",
  .applies_to_vars = c("an1", "an10", "an4", "an6", "an8", "an9"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "refusal/skip by I", `-3` = "terminated interview", `1` = "no", `2` = "more-or-less", `3` = "yes",
  .applies_to_vars = c("an1", "an10", "an4", "an6", "an8", "an9"),
  .applies_to_waves = c("E")
)

.lasa_fc_078 <- .lasa_finalize_fc("078")

