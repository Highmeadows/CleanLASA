## LASA filecode 604 -- variable names, variable labels, value labels,
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
  tphear = "categorical",
  tpsen01 = "categorical",
  tpsen03 = "categorical",
  tpsen04 = "categorical",
  tpsen07 = "categorical",
  tpsen09 = "categorical",
  tpsen10 = "categorical",
  tpsight = "categorical"
)

# define variable labels ----
variable_labels(
  tphear = "Change in hearing over past 3 years",
  tpsen01 = "Usually wears glasses or contact lenses",
  tpsen03 = "Read small newspaper print without glasses or contact lenses",
  tpsen04 = "Read small newspaper print with glasses or other aid",
  tpsen07 = "Usually wears hearing aid",
  tpsen09 = "Follow conversation with 3 or 4 persons without hearing aid",
  tpsen10 = "Follow conversation with 3 or 4 persons with hearing aid",
  tpsight = "Change in vision over past 3 years",
  .applies_to_waves = c("Z")
)

variable_labels(
  tphear = "Senses: change hearing last 3 years",
  tpsight = "Senses: change visus last 3 years",
  .applies_to_waves = c("C", "D", "E")
)

variable_labels(
  tpsen01 = "R usually wears glasses or contactlenses",
  tpsen03 = "Small print in paper without glasses (or contactlenses)",
  tpsen04 = "Small print in paper with glasses or other aid",
  tpsen07 = "R usually wears hearing aid",
  tpsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
  tpsen10 = "Follow conversation 3 or 4 persons: with hearing aid",
  .applies_to_waves = c("F", "G", "H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked", `1` = "much better", `2` = "better", `3` = "the same", `4` = "worse", `5` = "much worse",
  .applies_to_vars = c("tphear", "tpsight"),
  .applies_to_waves = c("Z", "C", "D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpsen01", "tpsen07"),
  .applies_to_waves = c("Z", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("tpsen03", "tpsen09"),
  .applies_to_waves = c("Z", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "na, see TPSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not use aid",
  .applies_to_vars = c("tpsen04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("tpsen10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see FTPSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("tpsen04"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTPSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("tpsen10"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see GTPSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("tpsen04"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GTPSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("tpsen10"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see HTPSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not use aid",
  .applies_to_vars = c("tpsen04"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HTPSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("tpsen10"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see ITPSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not use aid",
  .applies_to_vars = c("tpsen04"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see ITPSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("tpsen10"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see JTPSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not use aid",
  .applies_to_vars = c("tpsen04"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTPSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("tpsen10"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KTPSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not use aid",
  .applies_to_vars = c("tpsen04"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTPSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not have a hearing aid",
  .applies_to_vars = c("tpsen10"),
  .applies_to_waves = c("K")
)

.lasa_fc_604 <- .lasa_finalize_fc("604")

