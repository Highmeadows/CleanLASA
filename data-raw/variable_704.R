## LASA filecode 704 -- variable names, variable labels, value labels,
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
  trhear = "categorical",
  trsen01 = "categorical",
  trsen03 = "categorical",
  trsen04 = "categorical",
  trsen07 = "categorical",
  trsen09 = "categorical",
  trsen09c = "categorical",
  trsen10 = "categorical",
  trsen10c = "categorical",
  trsen7a = "categorical",
  trsen7b = "categorical",
  trsen7c = "categorical",
  trsight = "categorical"
)

# define variable labels ----
variable_labels(
  trhear = "Senses: change hearing last 3 years",
  trsen01 = "R usually wears glasses or contact lenses",
  trsen03 = "Small print in paper without glasses/contact lenses",
  trsen04 = "Small print in paper with glasses or other aid",
  trsen07 = "R usually wears hearing aid",
  trsen09 = "Follow conversation 3 or 4 persons without/not using hearing aid",
  trsen09c = "Using 1 or 2 hearing aids: follow conversation 3 or 4 persons without hearing aid",
  trsen10 = "Follow conversation 3 or 4 persons with hearing aid",
  trsen10c = "Using 1 or 2 hearing aids: follow conversation 3 or 4 persons with hearing aid",
  trsen7a = "R possesses hearing aid(s)",
  trsen7b = "Using 1 or 2 hearing aids: hours per day",
  trsen7c = "Using 1 or 2 hearing aids: R is wearing right now",
  trsight = "Senses: change vision last 3 years",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trhear",
  .applies_to_waves = c("C")
)

variable_labels(
  "trsen04",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "trsen07",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I")
)

variable_labels(
  "trsen09c", "trsen10c", "trsen7a", "trsen7b", "trsen7c",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  trsight = "Senses: change visus last 3 years",
  .applies_to_waves = c("C")
)

variable_labels(
  trsen01 = "R usually wears glasses or contactlenses",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  trsen03 = "Small print in paper without glasses or contactlenses",
  trsen09 = "Follow conversation 3 or 4 persons: without hearing aid",
  trsen10 = "Follow conversation 3 or 4 persons: with hearing aid",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I")
)

variable_labels(
  trsen03 = "Small print in paper without glasses",
  trsen09 = "No hearing aid/not using hearing aid: follow conversation 3 or 4 persons",
  .applies_to_waves = c("J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked", `1` = "much better", `2` = "better", `3` = "the same", `4` = "worse", `5` = "much worse",
  .applies_to_vars = c("trhear", "trsight"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trsen01"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen03"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "na, see TRSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not use aid",
  .applies_to_vars = c("trsen04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trsen07"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-2` = "na, see TRSEN7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen09", "trsen09c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRSEN7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not wear a hearing aid in this specific situation",
  .applies_to_vars = c("trsen10c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no, never had hearing aid", `2` = "yes, possesses 1 hearing aid, but does not (no longer) use it", `3` = "yes, possesses 2 hearing aids, but does not (no longer) use it", `4` = "yes, possesses 1 hearing aid and uses it", `5` = "yes, possesses 2 hearing aids, but uses 1", `6` = "yes, possesses 2 hearing aids and uses both",
  .applies_to_vars = c("trsen7a"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-2` = "na, see TRSEN7A", `1` = "< 1 hour per day", `2` = "1-4 hours per day", `3` = "4-8 hours per day", `4` = "whole day",
  .applies_to_vars = c("trsen7b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRSEN7A", `1` = "R does not wear a hearing aid right now", `2` = "R wears hearing aid left", `3` = "R wears hearing aid right", `4` = "R wears 2 hearing aids",
  .applies_to_vars = c("trsen7c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see DTRSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen04"),
  .applies_to_waves = c("D")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen09"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I")
)

value_labels(
  `-2` = "na, see DTRSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen10"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see ETRSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen04"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see ETRSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen10"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see FTRSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen04"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FTRSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen10"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see GTRSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen04"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GTRSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen10"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see HTRSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen04"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HTRSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen10"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see ITRSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen04"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see ITRSEN09", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen10"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see JTRSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not use aid",
  .applies_to_vars = c("trsen04"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRSEN7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen09", "trsen09c"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRSEN7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not wear a hearing aid in this specific situation",
  .applies_to_vars = c("trsen10c"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRSEN7A", `1` = "< 1 hour per day", `2` = "1-4 hours per day", `3` = "4-8 hours per day", `4` = "whole day",
  .applies_to_vars = c("trsen7b"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRSEN7A", `1` = "R does not wear a hearing aid right now", `2` = "R wears hearing aid left", `3` = "R wears hearing aid right", `4` = "R wears 2 hearing aids",
  .applies_to_vars = c("trsen7c"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KTRSEN03", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not use aid",
  .applies_to_vars = c("trsen04"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTRSEN7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot",
  .applies_to_vars = c("trsen09", "trsen09c"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTRSEN7A", `-1` = "na, asked", `1` = "yes, without difficulty", `2` = "yes, with some difficulty", `3` = "yes, with much difficulty", `4` = "no, R cannot", `5` = "R does not wear a hearing aid in this specific situation",
  .applies_to_vars = c("trsen10c"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTRSEN7A", `1` = "< 1 hour per day", `2` = "1-4 hours per day", `3` = "4-8 hours per day", `4` = "whole day",
  .applies_to_vars = c("trsen7b"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTRSEN7A", `1` = "R does not wear a hearing aid right now", `2` = "R wears hearing aid left", `3` = "R wears hearing aid right", `4` = "R wears 2 hearing aids",
  .applies_to_vars = c("trsen7c"),
  .applies_to_waves = c("K")
)

.lasa_fc_704 <- .lasa_finalize_fc("704")

