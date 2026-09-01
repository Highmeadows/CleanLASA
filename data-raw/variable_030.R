## LASA filecode 030 -- variable names, variable labels, value labels,
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
  adl1a = "categorical",
  adl1b = "categorical",
  adl1c = "categorical",
  adl1d = "categorical",
  adl1e = "categorical",
  adl2a = "categorical",
  adl2b = "categorical",
  adl2c = "categorical",
  adl2d = "categorical",
  adl2e = "categorical",
  adl3a = "categorical",
  adl3b = "categorical",
  adl3c = "categorical",
  adl3d = "categorical",
  adl3e = "categorical",
  adl4a = "categorical",
  adl4b = "categorical",
  adl4c = "categorical",
  adl4d = "categorical",
  adl4e = "categorical",
  adl5a = "categorical",
  adl5b = "categorical",
  adl5c = "categorical",
  adl5d = "categorical",
  adl5e = "categorical",
  adl6a = "categorical",
  adl6b = "categorical",
  adl6c = "categorical",
  adl6d = "categorical",
  adl6e = "categorical",
  adl7a = "categorical",
  adl7b = "categorical",
  adl7c = "categorical",
  adl7d = "categorical",
  adl7e = "categorical"
)

# define variable labels ----
variable_labels(
  adl1a = "Stairs: 15 steps without stopping",
  adl1b = "Stairs: using aid",
  adl1c = "Stairs: help from someone",
  adl1d = "Stairs: R receive help",
  adl1e = "Stairs: less than wanted",
  adl2a = "(Un)dress: self",
  adl2b = "(Un)dress: using aid",
  adl2c = "(Un)dress: help from someone",
  adl2d = "(Un)dress: R receive help",
  adl2e = "(Un)dress: less than wanted",
  adl3a = "Chair: sit and rise from",
  adl3b = "Chair: using aid",
  adl3c = "Chair: help from someone",
  adl3d = "Chair: R receive help",
  adl3e = "Chair: less than wanted",
  adl4a = "Toenails: cutting own",
  adl4b = "Toenails: using aid",
  adl4c = "Toenails: help from someone",
  adl4d = "Toenails: R receive help",
  adl4e = "Toenails: less than wanted",
  adl5a = "Walking: 5 min. outside the house",
  adl5b = "Walking: using aid",
  adl5c = "Walking: help from someone",
  adl5d = "Walking: R receive help",
  adl5e = "Walking: less than wanted",
  adl6a = "Transport: use of own or public",
  adl6b = "Transport: using aid",
  adl6c = "Transport: help from someone",
  adl6d = "Transport: R receive help",
  adl6e = "Transport: less than wanted",
  adl7a = "Take a bath/shower: self",
  adl7b = "Take a bath/shower: using aid",
  adl7c = "Take a bath/shower: help from someone",
  adl7d = "Take a bath/shower: R receive help",
  adl7e = "Take a bath/shower: less than wanted",
  .applies_to_waves = c("Z")
)

variable_labels(
  "adl1a", "adl4a", "adl6a",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "adl2a", "adl3a", "adl5a",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "adl7a",
  .applies_to_waves = c("2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  adl1b = "Stairs: using aid (BADL1A > 1)",
  adl4b = "Toenails: using aid (BADL4A > 1)",
  adl6b = "Transport: using aid (BADL6A > 1)",
  .applies_to_waves = c("B", "MB")
)

variable_labels(
  adl1c = "Stairs: help from someone (BADL1A = 3)",
  adl1d = "Stairs: R receive help (BADL1A = 2)",
  adl4c = "Toenails: help from someone (BADL4A = 3)",
  adl4d = "Toenails: R receive help (BADL4A = 2)",
  adl6c = "Transport: help from someone (BADL6A = 3)",
  adl6d = "Transport: R receive help (BADL6A = 2)",
  .applies_to_waves = c("B")
)

variable_labels(
  adl1b = "Stairs: using aid (C/D/EADL1A > 1)",
  adl1c = "Stairs: help from someone (C/D/EADL1A > 2)",
  adl1d = "Stairs: R receive help (C/D/EADL1A = 2)",
  adl1e = "Stairs: less than wanted (C/D/EADL1A > 1)",
  adl2b = "(Un)dress: using aid (C/D/EADL2A > 1)",
  adl2c = "(Un)dress: help from someone (C/D/EADL2A > 2)",
  adl2d = "(Un)dress: R receive help (C/D/EADL2A = 2)",
  adl2e = "(Un)dress: less than wanted (C/D/EADL2A > 1)",
  adl3b = "Chair: using aid (C/D/EADL3A > 1)",
  adl3c = "Chair: help from someone (C/D/EADL3A > 2)",
  adl3d = "Chair: R receive help (C/D/EADL3A = 2)",
  adl3e = "Chair: less than wanted (C/D/EADL3A > 1)",
  adl4c = "Toenails: help from someone (C/D/EADL4A > 2)",
  adl4d = "Toenails: R receive help (C/D/EADL4A = 2)",
  adl4e = "Toenails: less than wanted (C/D/EADL4A > 1)",
  adl5b = "Walking: using aid (C/D/EADL5A > 1)",
  adl5c = "Walking: help from someone (C/D/EADL5A > 2)",
  adl5d = "Walking: R receive help (C/D/EADL5A = 2)",
  adl5e = "Walking: less than wanted (C/D/EADL5A > 1)",
  adl6b = "Transport: using aid (C/D/EADL6A > 1)",
  adl6c = "Transport: help from someone (C/D/EADL6A > 2)",
  adl6d = "Transport: R receive help (C/D/EADL6A = 2)",
  adl6e = "Transport: less than wanted (C/D/EADL6A > 1)",
  .applies_to_waves = c("C", "D", "E")
)

variable_labels(
  adl4b = "Toenails: using aid (C/DADL4A > 1)",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H")
)

variable_labels(
  adl1b = "Stairs: using aid (B/F/GADL1A > 1)",
  adl1c = "Stairs: help from someone (B/F/GADL1A > 2)",
  adl1d = "Stairs: R receive help (B/F/GADL1A = 2)",
  adl1e = "Stairs: less than wanted (B/F/GADL1A > 1)",
  adl2b = "(Un)dress: using aid (B/F/GADL2A > 1)",
  adl2c = "(Un)dress: help from someone (B/F/GADL2A > 2)",
  adl2d = "(Un)dress: R receive help (B/F/GADL2A = 2)",
  adl2e = "(Un)dress: less than wanted (B/F/GADL2A > 1)",
  adl3b = "Chair: using aid (B/F/GADL3A > 1)",
  adl3c = "Chair: help from someone (B/F/GADL3A > 2)",
  adl3d = "Chair: R receive help (B/F/GADL3A = 2)",
  adl3e = "Chair: less than wanted (B/F/GADL3A > 1)",
  adl4c = "Toenails: help from someone (B/F/GADL4A > 2)",
  adl4d = "Toenails: R receive help (B/F/GADL4A = 2)",
  adl4e = "Toenails: less than wanted (B/F/GADL4A > 1)",
  adl5b = "Walking: using aid (B/F/GADL5A > 1)",
  adl5c = "Walking: help from someone (B/F/GADL5A > 2)",
  adl5d = "Walking: R receive help (B/F/GADL5A = 2)",
  adl5e = "Walking: less than wanted (B/F/GADL5A > 1)",
  adl6b = "Transport: using aid (B/F/GADL6A > 1)",
  adl6c = "Transport: help from someone (B/F/GADL6A > 2)",
  adl6d = "Transport: R receive help (B/F/GADL6A = 2)",
  adl6e = "Transport: less than wanted (B/F/GADL6A > 1)",
  adl7b = "Take a bath/shower: using aid (B/F/GADL7A > 1)",
  adl7c = "Take a bath/shower: help from someone (B/F/GADL7A > 2)",
  adl7d = "Take a bath/shower: R receive help (B/F/GADL7A = 2)",
  adl7e = "Take a bath/shower: less than wanted (B/F/GADL7A > 1)",
  .applies_to_waves = c("2B", "F", "G")
)

variable_labels(
  adl1b = "Stairs: using aid (HADL1A > 1)",
  adl1c = "Stairs: help from someone (HADL1A > 2)",
  adl1d = "Stairs: R receive help (HADL1A = 2)",
  adl2b = "(Un)dress: using aid (HADL2A > 1)",
  adl2c = "(Un)dress: help from someone (HADL2A > 2)",
  adl2d = "(Un)dress: R receive help (HADL2A = 2)",
  adl3b = "Chair: using aid (HADL3A > 1)",
  adl3c = "Chair: help from someone (HADL3A > 2)",
  adl3d = "Chair: R receive help (HADL3A = 2)",
  adl4c = "Toenails: help from someone (HADL4A > 2)",
  adl4d = "Toenails: R receive help (HADL4A = 2)",
  adl5b = "Walking: using aid (HADL5A > 1)",
  adl5c = "Walking: help from someone (HADL5A > 2)",
  adl5d = "Walking: R receive help (HADL5A = 2)",
  adl6b = "Transport: using aid (HADL6A > 1)",
  adl6c = "Transport: help from someone (HADL6A > 2)",
  adl6d = "Transport: R receive help (HADL6A = 2)",
  adl7b = "Take a bath/shower: using aid (HADL7A > 1)",
  adl7c = "Take a bath/shower: help from someone (HADL7A > 2)",
  adl7d = "Take a bath/shower: R receive help (HADL7A = 2)",
  .applies_to_waves = c("H")
)

variable_labels(
  adl1b = "Stairs: using aid (B/I/J/KADL1A > 1)",
  adl1c = "Stairs: help from someone (B/I/J/KADL1A > 2)",
  adl1d = "Stairs: R receive help (B/I/J/KADL1A = 2)",
  adl2b = "(Un)dress: using aid (B/I/J/KADL2A > 1)",
  adl2c = "(Un)dress: help from someone (B/I/J/KADL2A > 2)",
  adl2d = "(Un)dress: R receive help (B/I/J/KADL2A = 2)",
  adl3b = "Chair: using aid (B/I/J/KADL3A > 1)",
  adl3c = "Chair: help from someone (B/I/J/KADL3A > 2)",
  adl3d = "Chair: R receive help (B/I/J/KADL3A = 2)",
  adl4b = "Toenails: using aid (B/I/J/KADL4A > 1)",
  adl4c = "Toenails: help from someone (B/I/J/KADL4A > 2)",
  adl4d = "Toenails: R receive help (B/I/J/KADL4A = 2)",
  adl5b = "Walking: using aid (B/I/J/KADL5A > 1)",
  adl5c = "Walking: help from someone (B/I/J/KADL5A > 2)",
  adl5d = "Walking: R receive help (B/I/J/KADL5A = 2)",
  adl6b = "Transport: using aid (B/I/J/KADL6A > 1)",
  adl6c = "Transport: help from someone (B/I/J/KADL6A > 2)",
  adl6d = "Transport: R receive help (B/I/J/KADL6A = 2)",
  adl7b = "Take a bath/shower: using aid (B/I/J/KADL7A > 1)",
  adl7c = "Take a bath/shower: help from someone (B/I/J/KADL7A > 2)",
  adl7d = "Take a bath/shower: R receive help (B/I/J/KADL7A = 2)",
  .applies_to_waves = c("3B", "I", "J", "K")
)

variable_labels(
  adl2b = "(Un)dress: using aid (BADL2A > 1)",
  adl3b = "Chair: using aid (BADL3A > 1)",
  adl5b = "Walking: using aid (BADL5A > 1)",
  adl7b = "Take a bath/shower: using aid (BADL7A > 1)",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("adl1b", "adl1c", "adl1d", "adl1e", "adl2a", "adl2b", "adl2c", "adl2d", "adl2e", "adl3a", "adl3b", "adl3c", "adl3d", "adl3e", "adl4a", "adl4b", "adl4c", "adl4d", "adl4e", "adl5a", "adl5b", "adl5c", "adl5d", "adl5e", "adl6a", "adl6b", "adl6c", "adl6d", "adl6e", "adl7a", "adl7b", "adl7c", "adl7d", "adl7e"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, interview terminated", `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "yes, without help",
  .applies_to_vars = c("adl1a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl1b", "adl2b", "adl3b", "adl4b", "adl5b", "adl6b"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl1c", "adl1d", "adl2c", "adl2d", "adl3c", "adl3d", "adl4c", "adl4d", "adl5c", "adl5d", "adl6c", "adl6d"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl1e", "adl2e", "adl3e", "adl4e", "adl5e", "adl6e"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "yes, with much difficulty", `4` = "yes, with some difficulty", `5` = "yes, without help",
  .applies_to_vars = c("adl2a", "adl3a", "adl5a"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "yes, without help",
  .applies_to_vars = c("adl4a", "adl6a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "yes, with much difficulty", `4` = "yes, with some difficulty", `5` = "yes, without help",
  .applies_to_vars = c("adl7a"),
  .applies_to_waves = c("Z", "2B", "F", "G", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl7b"),
  .applies_to_waves = c("Z", "2B", "F", "G", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl7c", "adl7d"),
  .applies_to_waves = c("Z", "2B", "F", "G", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl7e"),
  .applies_to_waves = c("Z", "2B", "F", "G")
)

value_labels(
  `-5` = "na, interview terminated",
  .applies_to_vars = c("adl1a"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "yes, with difficulty", `4` = "yes, without help",
  .applies_to_vars = c("adl1a"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL1A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl1b"),
  .applies_to_waves = c("B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL1A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl1c", "adl1d"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL1A", `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "yes, with difficulty", `4` = "yes, without help",
  .applies_to_vars = c("adl4a", "adl6a"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL4A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl4b"),
  .applies_to_waves = c("B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL4A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl4c", "adl4d"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL6A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl6b"),
  .applies_to_waves = c("B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL6A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl6c", "adl6d"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see C/D/EADL1A",
  .applies_to_vars = c("adl1b", "adl1c", "adl1d", "adl1e", "adl2a", "adl3a", "adl4a", "adl5a", "adl6a"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-2` = "na, see C/D/EADL2A",
  .applies_to_vars = c("adl2b", "adl2c", "adl2d", "adl2e"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-2` = "na, see C/D/EADL3A",
  .applies_to_vars = c("adl3b", "adl3c", "adl3d", "adl3e"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-2` = "na, see C/D/EADL4A",
  .applies_to_vars = c("adl4b", "adl4c", "adl4d", "adl4e"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-2` = "na, see C/D/EADL5A",
  .applies_to_vars = c("adl5b", "adl5c", "adl5d", "adl5e"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-2` = "na, see C/D/EADL6A",
  .applies_to_vars = c("adl6b", "adl6c", "adl6d", "adl6e"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "yes, with much difficulty", `4` = "yes, with some difficulty", `5` = "yes, without help",
  .applies_to_vars = c("adl1a"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "yes, with much difficulty", `4` = "yes, with some difficulty", `5` = "yes, without help",
  .applies_to_vars = c("adl4a", "adl6a"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/F/GADL1A",
  .applies_to_vars = c("adl1b", "adl1c", "adl1d", "adl1e", "adl2a", "adl3a", "adl4a", "adl5a", "adl6a", "adl7a"),
  .applies_to_waves = c("2B", "F", "G")
)

value_labels(
  `-2` = "na, see B/F/GADL2A",
  .applies_to_vars = c("adl2b", "adl2c", "adl2d", "adl2e"),
  .applies_to_waves = c("2B", "F", "G")
)

value_labels(
  `-2` = "na, see B/F/GADL3A",
  .applies_to_vars = c("adl3b", "adl3c", "adl3d", "adl3e"),
  .applies_to_waves = c("2B", "F", "G")
)

value_labels(
  `-2` = "na, see B/F/GADL4A",
  .applies_to_vars = c("adl4b", "adl4c", "adl4d", "adl4e"),
  .applies_to_waves = c("2B", "F", "G")
)

value_labels(
  `-2` = "na, see B/F/GADL5A",
  .applies_to_vars = c("adl5b", "adl5c", "adl5d", "adl5e"),
  .applies_to_waves = c("2B", "F", "G")
)

value_labels(
  `-2` = "na, see B/F/GADL6A",
  .applies_to_vars = c("adl6b", "adl6c", "adl6d", "adl6e"),
  .applies_to_waves = c("2B", "F", "G")
)

value_labels(
  `-2` = "na, see B/F/GADL7A",
  .applies_to_vars = c("adl7b", "adl7c", "adl7d", "adl7e"),
  .applies_to_waves = c("2B", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL1A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl1b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL1A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl1c", "adl1d"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL1A", `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "yes, with much difficulty", `4` = "yes, with some difficulty", `5` = "yes, without help",
  .applies_to_vars = c("adl2a", "adl3a", "adl4a", "adl5a", "adl6a", "adl7a"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL2A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl2b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL2A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl2c", "adl2d"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL3A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl3b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL3A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl3c", "adl3d"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL4A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl4b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL4A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl4c", "adl4d"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL5A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl5b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL5A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl5c", "adl5d"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL6A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl6b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL6A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl6c", "adl6d"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL7A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl7b"),
  .applies_to_waves = c("H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see HADL7A", `-1` = "na, asked", `1` = "never", `2` = "seldom", `3` = "occasionally", `4` = "often or always",
  .applies_to_vars = c("adl7c", "adl7d"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see B/I/J/KADL1A",
  .applies_to_vars = c("adl1b", "adl1c", "adl1d", "adl2a", "adl3a", "adl4a", "adl5a", "adl6a", "adl7a"),
  .applies_to_waves = c("3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/I/J/KADL2A",
  .applies_to_vars = c("adl2b", "adl2c", "adl2d"),
  .applies_to_waves = c("3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/I/J/KADL3A",
  .applies_to_vars = c("adl3b", "adl3c", "adl3d"),
  .applies_to_waves = c("3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/I/J/KADL4A",
  .applies_to_vars = c("adl4b", "adl4c", "adl4d"),
  .applies_to_waves = c("3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/I/J/KADL5A",
  .applies_to_vars = c("adl5b", "adl5c", "adl5d"),
  .applies_to_waves = c("3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/I/J/KADL6A",
  .applies_to_vars = c("adl6b", "adl6c", "adl6d"),
  .applies_to_waves = c("3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/I/J/KADL7A",
  .applies_to_vars = c("adl7b", "adl7c", "adl7d"),
  .applies_to_waves = c("3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL1A", `-1` = "na, asked", `1` = "no, I cannot", `2` = "only with help", `3` = "yes, with much difficulty", `4` = "yes, with some difficulty", `5` = "yes, without help",
  .applies_to_vars = c("adl2a", "adl3a", "adl4a", "adl5a", "adl6a", "adl7a"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL2A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl2b"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL3A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl3b"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL5A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl5b"),
  .applies_to_waves = c("MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BADL7A", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("adl7b"),
  .applies_to_waves = c("MB")
)

.lasa_fc_030 <- .lasa_finalize_fc("030")

