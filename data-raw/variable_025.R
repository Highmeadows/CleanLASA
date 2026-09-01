## LASA filecode 025 -- variable names, variable labels, value labels,
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
  cesd01 = "categorical",
  cesd02 = "categorical",
  cesd03 = "categorical",
  cesd04 = "categorical",
  cesd05 = "categorical",
  cesd06 = "categorical",
  cesd07 = "categorical",
  cesd08 = "categorical",
  cesd09 = "categorical",
  cesd10 = "categorical",
  cesd11 = "categorical",
  cesd12 = "categorical",
  cesd13 = "categorical",
  cesd14 = "categorical",
  cesd15 = "categorical",
  cesd16 = "categorical",
  cesd17 = "categorical",
  cesd18 = "categorical",
  cesd19 = "categorical",
  cesd20 = "categorical"
)

# define variable labels ----
variable_labels(
  cesd01 = "Last week: bothered",
  cesd02 = "Last week: appetite",
  cesd03 = "Last week: blues",
  cesd04 = "Last week: good: positive",
  cesd05 = "Last week: mind",
  cesd06 = "Last week: depressed",
  cesd07 = "Last week: effort",
  cesd08 = "Last week: hopeful: positive",
  cesd09 = "Last week: failure",
  cesd10 = "Last week: fearful",
  cesd11 = "Last week: sleep",
  cesd12 = "Last week: happy: positive",
  cesd13 = "Last week: talk",
  cesd14 = "Last week: lonely",
  cesd15 = "Last week: unfriendly",
  cesd16 = "Last week: enjoy: positive",
  cesd17 = "Last week: cry",
  cesd18 = "Last week: sad",
  cesd19 = "Last week: dislike",
  cesd20 = "Last week: get going",
  .applies_to_waves = c("Z")
)

variable_labels(
  cesd01 = "1. Last week: bothered",
  cesd02 = "2. Last week: appetite",
  cesd03 = "3. Last week: blues",
  cesd04 = "4. Last week: good: positive",
  cesd05 = "5. Last week: mind",
  cesd06 = "6. Last week: depressed",
  cesd07 = "7. Last week: effort",
  cesd08 = "8. Last week: hopeful: positive",
  cesd09 = "9. Last week: failure",
  cesd10 = "10. Last week: fearful",
  cesd11 = "11. Last week: sleep",
  cesd12 = "12. Last week: happy: positive",
  cesd13 = "13. Last week: talk",
  cesd14 = "14. Last week: lonely",
  cesd15 = "15. Last week: unfriendly",
  cesd16 = "16. Last week: enjoy: positive",
  cesd17 = "17. Last week: cry",
  cesd18 = "18. Last week: sad",
  cesd19 = "19. Last week: dislike",
  cesd20 = "20. Last week: get going",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("cesd01", "cesd02", "cesd03", "cesd04", "cesd05", "cesd06", "cesd07", "cesd08", "cesd09", "cesd10", "cesd11", "cesd12", "cesd13", "cesd14", "cesd15", "cesd16", "cesd17", "cesd18", "cesd19", "cesd20"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("cesd01", "cesd02", "cesd03", "cesd04", "cesd05", "cesd06", "cesd07", "cesd08", "cesd09", "cesd10", "cesd11", "cesd12", "cesd13", "cesd14", "cesd15", "cesd16", "cesd17", "cesd18", "cesd19", "cesd20"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "rarely or never", `1` = "some of the time", `2` = "occasionally", `3` = "mostly or always",
  .applies_to_vars = c("cesd01", "cesd02", "cesd03", "cesd04", "cesd05", "cesd06", "cesd07", "cesd08", "cesd09", "cesd10", "cesd11", "cesd12", "cesd13", "cesd14", "cesd15", "cesd16", "cesd17", "cesd18", "cesd19", "cesd20"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
  .applies_to_vars = c("cesd01", "cesd02", "cesd03", "cesd04", "cesd05", "cesd06", "cesd07", "cesd08", "cesd09", "cesd10", "cesd11", "cesd12", "cesd13", "cesd14", "cesd15", "cesd16", "cesd17", "cesd18", "cesd19", "cesd20"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

.lasa_fc_025 <- .lasa_finalize_fc("025")

