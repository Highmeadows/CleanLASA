## LASA filecode 171 -- variable names, variable labels, value labels,
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
  mcalf01 = "numeric",
  mcalf02 = "categorical",
  mcalf03 = "categorical",
  mcalf04 = "categorical",
  mcalf05 = "categorical",
  mcalf06 = "categorical",
  mcalf07 = "categorical",
  mcalf08 = "categorical",
  mcalf09 = "categorical",
  mcalf1 = "numeric",
  mcalf10 = "categorical",
  mcalf11 = "categorical",
  mcalf12 = "categorical",
  mcalf13 = "categorical",
  mcalf1a = "numeric",
  mcalf1b = "numeric",
  rm161 = "categorical",
  rm171 = "categorical"
)

# define variable labels ----
variable_labels(
  mcalf01 = "measured calf circumference in cm",
  mcalf02 = "calf measurement particularities",
  mcalf03 = "calf particularity: refused",
  mcalf04 = "calf particularity: respondent sitting down",
  mcalf05 = "calf particularity: not physically able",
  mcalf06 = "calf particularity: on right leg",
  mcalf07 = "calf particularity: impediments",
  mcalf08 = "calf particularity: edema present",
  mcalf09 = "calf particularity: support stocking",
  mcalf1 = "measured calf in cm",
  mcalf10 = "calf particularity: long underwear",
  mcalf11 = "calf particularity: other",
  mcalf12 = "calf particularity: no bare leg",
  mcalf13 = "calf particularity: much space between tape and leg",
  mcalf1a = "measured calf (1) in cm",
  mcalf1b = "measured calf (2) in cm",
  rm161 = "data status",
  rm171 = "reason missing / data status",
  .applies_to_waves = c("Z")
)

variable_labels(
  mcalf01 = "circumference: in cm",
  mcalf02 = "measurement: remarks Y/N",
  mcalf03 = "remark: refused",
  mcalf04 = "remark: sitting down",
  mcalf05 = "remark: not physically able",
  mcalf06 = "remark: on right calf",
  mcalf07 = "remark: impediments",
  mcalf08 = "remark: edema present",
  mcalf09 = "remark: support stocking",
  mcalf10 = "remark: long underwear",
  mcalf11 = "remark other",
  .applies_to_waves = c("B")
)

variable_labels(
  mcalf02 = "Calf particularities",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B")
)

variable_labels(
  mcalf03 = "Calf: refused",
  mcalf04 = "Calf: R sitting down",
  mcalf06 = "Calf: on right leg",
  mcalf12 = "Calf: no bare leg",
  mcalf13 = "Calf: much space between tape and leg",
  .applies_to_waves = c("D", "E", "2B", "G", "H", "3B")
)

variable_labels(
  mcalf1a = "Measured calf (1) in cm",
  mcalf1b = "Measured calf (2) in cm",
  rm161 = NA_character_,
  .applies_to_waves = c("D", "E", "F", "G")
)

variable_labels(
  mcalf1 = "Measured calf in cm",
  .applies_to_waves = c("2B")
)

variable_labels(
  mcalf01 = "Measured calf in cm",
  rm171 = "Reason missing: LASAH/B171",
  .applies_to_waves = c("H", "3B")
)

# define value labels ----
value_labels(
  `-3` = "not in sample", `-2` = "na, see H/BRM171", `-1` = "measurement missing",
  .applies_to_vars = c("mcalf01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not applicable / skipped", `-2` = "na, see BRM161", `-1` = "na, asked", `0` = "not mentioned", `1` = "particularity status", `2` = "particularity status or category", `3` = "measurement/particularity status", `4` = "R sitting down", `5` = "on right leg", `6` = "R refused",
  .applies_to_vars = c("mcalf02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not applicable / skipped", `-2` = "na, see MCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "particularity status", `2` = "yes", `3` = "not done various reasons",
  .applies_to_vars = c("mcalf03", "mcalf04", "mcalf06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons",
  .applies_to_vars = c("mcalf05", "mcalf07", "mcalf08", "mcalf09", "mcalf10", "mcalf11"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRM161", `-1` = "na, asked",
  .applies_to_vars = c("mcalf1"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see MCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcalf12", "mcalf13"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see FRM161", `-1` = "na, asked",
  .applies_to_vars = c("mcalf1a", "mcalf1b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid data", `0` = "- to be coded -", `1` = "short version", `2` = "interview terminated",
  .applies_to_vars = c("rm161"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-2` = "valid data", `0` = "- to be coded -", `1` = "short version", `2` = "interview terminated",
  .applies_to_vars = c("rm171"),
  .applies_to_waves = c("Z", "H", "3B")
)

value_labels(
  `-3` = "not in sample", `-1` = "no measurement",
  .applies_to_vars = c("mcalf01"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "not in sample", `1` = "no", `2` = "yes", `3` = "not done various reasons",
  .applies_to_vars = c("mcalf02", "mcalf03", "mcalf04", "mcalf06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see D/EMCALF02",
  .applies_to_vars = c("mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/ERM161", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mcalf02"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/ERM161", `-1` = "na, asked",
  .applies_to_vars = c("mcalf1a", "mcalf1b"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-2` = "valid data", `2` = "interview terminated",
  .applies_to_vars = c("rm161"),
  .applies_to_waves = c("D", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRM161", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mcalf02"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see FRM161", `-1` = "na, asked", `1` = "no particularities", `2` = "no bare leg", `3` = "much space between tape and leg", `4` = "R sitting down", `5` = "on right leg", `6` = "R refused",
  .applies_to_vars = c("mcalf02"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FRM161", `-1` = "na, asked",
  .applies_to_vars = c("mcalf1a", "mcalf1b"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "valid data", `1` = "short version", `2` = "interview terminated",
  .applies_to_vars = c("rm161"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mcalf02"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GMCALF02", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GRM161", `-1` = "na, asked",
  .applies_to_vars = c("mcalf1a", "mcalf1b"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see H/BMCALF02",
  .applies_to_vars = c("mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-2` = "na, see H/BRM171", `-1` = "na, asked",
  .applies_to_vars = c("mcalf01"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-2` = "na, see H/BRM171", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcalf02"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13"),
  .applies_to_waves = c("H", "3B")
)

.lasa_fc_171 <- .lasa_finalize_fc("171")

