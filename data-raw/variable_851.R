## LASA filecode 851 -- variable names, variable labels, value labels,
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
  blage = "numeric",
  bldate = "date",
  mblacltg = "categorical",
  mblcc = "categorical",
  mblchemo = "categorical",
  mblcmplt = "categorical",
  mbldrinkd = "categorical",
  mbldrinkt = "categorical",
  mbldrnk = "categorical",
  mblhphl = "categorical",
  mblinsul = "categorical",
  mblmeald = "categorical",
  mblmealt = "categorical",
  mblncomplt = "categorical",
  mbltime = "text"
)

# define variable labels ----
variable_labels(
  blage = "age at blood sampling",
  bldate = "date of blood sampling",
  mblacltg = "Blood: anti-clotting",
  mblcc = "Blood: cc",
  mblchemo = "Blood: chemotherapy",
  mblcmplt = "Blood: end",
  mbldrinkd = "Blood: drank something day",
  mbldrinkt = "Blood: drank something time",
  mbldrnk = "Blood: drank something",
  mblhphl = "Blood: hemophilia",
  mblinsul = "Blood: insulin",
  mblmeald = "Blood: last meal day",
  mblmealt = "Blood: last meal time",
  mblncomplt = "Blood: not complete specifics.",
  mbltime = "Time blood sample and questions: hours, minutes",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mblacltg", "mblcc", "mblchemo", "mblcmplt", "mbldrinkd", "mbldrinkt", "mbldrnk", "mblhphl", "mblinsul", "mblmeald", "mblmealt", "mblncomplt", "mbltime",
  .applies_to_waves = c("B")
)

variable_labels(
  blage = "age at blood sampling C-wave",
  bldate = "date of blood sampling C-wave",
  .applies_to_waves = c("C")
)

variable_labels(
  blage = "age at blood sampling 2B-wave",
  bldate = "date of blood sampling 2B-wave",
  .applies_to_waves = c("2B")
)

variable_labels(
  blage = "age at blood sampling G-wave",
  bldate = "date of blood sampling G-wave",
  .applies_to_waves = c("G")
)

variable_labels(
  blage = "age at blood sampling 3B-wave",
  bldate = "date of blood sampling 3B-wave",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-2` = "no answer, skipped", `-1` = "na, asked",
  .applies_to_vars = c("mblcc", "mblcmplt", "mbldrinkd", "mbldrinkt", "mbldrnk", "mblhphl", "mblmeald", "mblmealt", "mblncomplt"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "no blood, OSS", `1` = "10cc freezer", `2` = "hematology", `3` = "chemical",
  .applies_to_vars = c("mblcc"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "no blood, OSS", `1` = "complete", `2` = "not complete",
  .applies_to_vars = c("mblcmplt"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "today", `2` = "yesterday", `3` = "day before yesterday",
  .applies_to_vars = c("mbldrinkd", "mblmeald"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "morning 7-12", `2` = "in between 12-13", `3` = "afternoon", `4` = "evening", `5` = "night",
  .applies_to_vars = c("mbldrinkt", "mblmealt"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbldrnk", "mblhphl"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "no blood, OSS", `1` = "refused", `2` = "sick", `3` = "fainted", `4` = "did not succeed", `5` = "no equipment", `6` = "refused by family", `7` = "refused by doctor", `8` = "area Oss", `9` = "other reason",
  .applies_to_vars = c("mblncomplt"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mbltime"),
  .applies_to_waves = c("Z", "B")
)

.lasa_fc_851 <- .lasa_finalize_fc("851")
.lasa_fc_851$variables <- .lasa_fc_851$variables |>
  .override_label(wave = "3B", variable = "blage", override_value = "bmblage") |>
  .override_label(wave = "3B", variable = "bldate", override_value = "bmbldate")

