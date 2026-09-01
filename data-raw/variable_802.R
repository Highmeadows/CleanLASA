## LASA filecode 802 -- variable names, variable labels, value labels,
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
  qlgs1 = "categorical",
  qlgs2 = "categorical",
  qlgs3 = "categorical",
  qlgs4 = "categorical",
  qlgs5 = "categorical",
  qlgs6 = "categorical"
)

# define variable labels ----
variable_labels(
  qlgs1 = "LGS01: I try to pass along the knowledge I have gained through my experiences",
  qlgs2 = "LGS02: I do not feel that other people need me",
  qlgs3 = "LGS12: I have important skills that I try to teach others",
  qlgs4 = "LGS13: I feel that I have done nothing that will survive after I die",
  qlgs5 = "LGS18: I have a responsibility to improve the neighborhood in which I live",
  qlgs6 = "LGS20: I feel as though my contributions will exist after I die",
  .applies_to_waves = c("Z")
)

variable_labels(
  "qlgs1", "qlgs2", "qlgs3", "qlgs4", "qlgs5", "qlgs6",
  .applies_to_waves = c("J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("qlgs1", "qlgs2", "qlgs3", "qlgs4", "qlgs5", "qlgs6"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `1` = "strongly disagree", `2` = "slightly disagree", `3` = "slightly agree", `4` = "strongly agree",
  .applies_to_vars = c("qlgs1", "qlgs2", "qlgs3", "qlgs4", "qlgs5", "qlgs6"),
  .applies_to_waves = c("Z", "J", "K")
)

.lasa_fc_802 <- .lasa_finalize_fc("802")

