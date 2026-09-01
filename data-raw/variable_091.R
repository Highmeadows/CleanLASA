## LASA filecode 091 -- variable names, variable labels, value labels,
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
  ptsd01 = "categorical",
  ptsd02 = "categorical",
  ptsd03 = "categorical",
  ptsd04 = "categorical",
  ptsd05 = "categorical",
  ptsd06 = "categorical",
  ptsd07 = "categorical",
  ptsd08 = "categorical",
  ptsd09 = "categorical",
  ptsd10 = "categorical",
  ptsd11 = "categorical",
  ptsd12 = "categorical",
  ptsd13 = "categorical",
  ptsd14 = "categorical",
  ptsd15 = "categorical",
  ptsd16 = "categorical",
  ptsd17 = "categorical",
  ptsd18 = "categorical",
  ptsd19 = "categorical",
  ptsd20 = "categorical",
  ptsd21 = "categorical",
  ptsd22 = "categorical",
  ptsd23 = "categorical"
)

# define variable labels ----
variable_labels(
  ptsd01 = "1. Last 4 weeks: express",
  ptsd02 = "2. Last 4 weeks: avoid thoughts",
  ptsd03 = "3. Last 4 weeks: no recall",
  ptsd04 = "4. Last 4 weeks: irritable",
  ptsd05 = "5. Last 4 weeks: body sensations",
  ptsd06 = "6. Last 4 weeks: sleep through",
  ptsd07 = "7. Last 4 weeks: dreams",
  ptsd08 = "8. Last 4 weeks: decreased interest",
  ptsd09 = "9. Last 4 weeks: repetitive memories",
  ptsd10 = "10. Last 4 weeks: reoccurrences",
  ptsd11 = "11. Last 4 weeks: no future",
  ptsd12 = "12. Last 4 weeks: difficulty concentrating",
  ptsd13 = "13. Last 4 weeks: jumpy",
  ptsd14 = "14. Last 4 weeks: avoid feelings",
  ptsd15 = "15. Last 4 weeks: avoid memories",
  ptsd16 = "16. Last 4 weeks: anger",
  ptsd17 = "17. Last 4 weeks: sleep in",
  ptsd18 = "18. Last 4 weeks: past experiences",
  ptsd19 = "19. Last 4 weeks: estranged",
  ptsd20 = "20. Last 4 weeks: apprehensive",
  ptsd21 = "21. Last 4 weeks: nasty memories",
  ptsd22 = "22. Last 4 weeks: unconnected",
  ptsd23 = "23. Last 4 weeks: daily activities",
  .applies_to_waves = c("Z")
)

variable_labels(
  "ptsd01", "ptsd02", "ptsd03", "ptsd04", "ptsd05", "ptsd06", "ptsd07", "ptsd08", "ptsd09", "ptsd10", "ptsd11", "ptsd12", "ptsd13", "ptsd14", "ptsd15", "ptsd16", "ptsd17", "ptsd18", "ptsd19", "ptsd20", "ptsd21", "ptsd22", "ptsd23",
  .applies_to_waves = c("D", "E")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("ptsd01", "ptsd02", "ptsd03", "ptsd04", "ptsd05", "ptsd06", "ptsd07", "ptsd08", "ptsd09", "ptsd10", "ptsd11", "ptsd12", "ptsd13", "ptsd14", "ptsd15", "ptsd16", "ptsd17", "ptsd18", "ptsd19", "ptsd20", "ptsd21", "ptsd22", "ptsd23"),
  .applies_to_waves = c("Z", "D", "E")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("ptsd01", "ptsd02", "ptsd03", "ptsd04", "ptsd05", "ptsd06", "ptsd07", "ptsd08", "ptsd09", "ptsd10", "ptsd11", "ptsd12", "ptsd13", "ptsd14", "ptsd15", "ptsd16", "ptsd17", "ptsd18", "ptsd19", "ptsd20", "ptsd21", "ptsd22", "ptsd23"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "not at all", `2` = "somewhat", `3` = "considerably", `4` = "very much",
  .applies_to_vars = c("ptsd01", "ptsd02", "ptsd03", "ptsd04", "ptsd05", "ptsd06", "ptsd07", "ptsd08", "ptsd09", "ptsd10", "ptsd11", "ptsd12", "ptsd13", "ptsd14", "ptsd15", "ptsd16", "ptsd17", "ptsd18", "ptsd19", "ptsd20", "ptsd21", "ptsd22", "ptsd23"),
  .applies_to_waves = c("Z", "D", "E")
)

value_labels(
  `-2` = "na, see D/ERMPTSD in LASAD/E291",
  .applies_to_vars = c("ptsd01", "ptsd02", "ptsd03", "ptsd04", "ptsd05", "ptsd06", "ptsd07", "ptsd08", "ptsd09", "ptsd10", "ptsd11", "ptsd12", "ptsd13", "ptsd14", "ptsd15", "ptsd16", "ptsd17", "ptsd18", "ptsd19", "ptsd20", "ptsd21", "ptsd22", "ptsd23"),
  .applies_to_waves = c("D", "E")
)

.lasa_fc_091 <- .lasa_finalize_fc("091")

