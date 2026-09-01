## LASA filecode 273 -- variable names, variable labels, value labels,
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
  lo = "numeric",
  loemo = "numeric",
  losoc = "numeric"
)

# define variable labels ----
variable_labels(
  lo = "Loneliness score (De Jong Gierveld, 11 items)",
  loemo = "Emotional loneliness score (De Jong Gierveld)",
  losoc = "Social loneliness score (De Jong Gierveld)",
  .applies_to_waves = c("Z")
)

variable_labels(
  lo = "loneliness 11 items dichotomous",
  .applies_to_waves = c("B", "C", "D", "E", "2B")
)

variable_labels(
  loemo = "emotional loneliness <scale de Jong Gierveld>",
  losoc = "social loneliness <scale de Jong Gierveld>",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

variable_labels(
  lo = "loneliness <scale de Jong Gierveld>",
  .applies_to_waves = c("F", "G", "H", "3B", "MB", "I", "J")
)

# define value labels ----
value_labels(
  `-3` = "interview terminated",
  .applies_to_vars = c("lo", "loemo", "losoc"),
  .applies_to_waves = c("Z", "H", "3B", "MB", "I", "J")
)

value_labels(
  `-4` = "refusal/skip by interviewer",
  .applies_to_vars = c("lo", "loemo", "losoc"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

value_labels(
  `-5` = "short version", `-2` = ">1 missing items", `-1` = "missing-item threshold exceeded", `0` = NA_character_, `11` = NA_character_,
  .applies_to_vars = c("lo"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "born <= 1907", `-5` = "short version", `-1` = ">1 missing items", `0` = NA_character_, `6` = "source-defined code 6", `7` = "proxy (unit nonresponse)", `8` = "telephone interview (unit nonresponse)", `9` = "born <=1907 or >1937",
  .applies_to_vars = c("loemo"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-9` = "born <= 1907", `-5` = "short version", `-1` = ">1 missing items", `0` = NA_character_, `5` = NA_character_, `6` = "unit nonresponse", `7` = "proxy (unit nonresponse)", `8` = "telephone interview (unit nonresponse)", `9` = "born <=1907 or >1937",
  .applies_to_vars = c("losoc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "terminated interview",
  .applies_to_vars = c("lo", "loemo", "losoc"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-2` = ">1 missing items", `0` = NA_character_, `11` = NA_character_,
  .applies_to_vars = c("lo"),
  .applies_to_waves = c("B", "C", "D", "E", "2B")
)

value_labels(
  `-5` = "short version", `-1` = ">1 missing items", `0` = NA_character_, `6` = NA_character_, `7` = "proxy (unit nonresponse)", `8` = "telephone interview (unit nonresponse)", `9` = "born <=1907 or >1937",
  .applies_to_vars = c("loemo"),
  .applies_to_waves = c("B", "C", "D", "E")
)

value_labels(
  `-5` = "short version", `-1` = ">1 missing items", `0` = NA_character_, `5` = NA_character_, `6` = "unit nonresponse", `7` = "proxy (unit nonresponse)", `8` = "telephone interview (unit nonresponse)", `9` = "born <=1907 or >1937",
  .applies_to_vars = c("losoc"),
  .applies_to_waves = c("B", "C", "D", "E")
)

value_labels(
  `-5` = "short version", `-1` = ">1 missing items", `0` = NA_character_, `6` = NA_character_,
  .applies_to_vars = c("loemo"),
  .applies_to_waves = c("2B", "G", "H", "3B", "MB", "I", "J")
)

value_labels(
  `-5` = "short version", `-1` = ">1 missing items", `0` = NA_character_, `5` = NA_character_,
  .applies_to_vars = c("losoc"),
  .applies_to_waves = c("2B", "G", "H", "3B", "MB", "I", "J")
)

value_labels(
  `-1` = ">1 missing items", `0` = NA_character_, `11` = NA_character_,
  .applies_to_vars = c("lo"),
  .applies_to_waves = c("F")
)

value_labels(
  `-9` = "born <= 1907", `-5` = "short version", `-1` = ">1 missing items", `0` = NA_character_, `6` = NA_character_, `7` = "proxy (unit nonresponse)", `8` = "telephone interview (unit nonresponse)",
  .applies_to_vars = c("loemo"),
  .applies_to_waves = c("F")
)

value_labels(
  `-9` = "born <= 1907", `-5` = "short version", `-1` = ">1 missing items", `0` = NA_character_, `5` = NA_character_, `6` = "unit nonresponse", `7` = "proxy (unit nonresponse)", `8` = "telephone interview (unit nonresponse)",
  .applies_to_vars = c("losoc"),
  .applies_to_waves = c("F")
)

value_labels(
  `-5` = "short version", `-1` = ">1 missing items", `0` = NA_character_, `11` = NA_character_,
  .applies_to_vars = c("lo"),
  .applies_to_waves = c("G")
)

value_labels(
  `-5` = "short version", `-1` = ">2 missing items", `0` = NA_character_, `11` = NA_character_,
  .applies_to_vars = c("lo"),
  .applies_to_waves = c("H", "3B", "MB", "I", "J")
)

.lasa_fc_273 <- .lasa_finalize_fc("273")

