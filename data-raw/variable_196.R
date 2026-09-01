## LASA filecode 196 -- variable names, variable labels, value labels,
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
  mhlq1 = "categorical",
  mhlq10 = "categorical",
  mhlq11 = "categorical",
  mhlq12 = "categorical",
  mhlq13 = "categorical",
  mhlq14 = "categorical",
  mhlq15 = "categorical",
  mhlq16 = "categorical",
  mhlq2 = "categorical",
  mhlq3 = "categorical",
  mhlq4 = "categorical",
  mhlq5 = "categorical",
  mhlq6 = "categorical",
  mhlq7 = "categorical",
  mhlq8 = "categorical",
  mhlq9 = "categorical"
)

# define variable labels ----
variable_labels(
  mhlq1 = "HLQ: find information about the treatment of illnesses that concern you",
  mhlq10 = "HLQ: understand why you need health screenings",
  mhlq11 = "HLQ: judge if information on health risks in media is reliable",
  mhlq12 = "HLQ: decide how to protect yourself from illness based on information in the media",
  mhlq13 = "HLQ: find information about activities that are good for your mental well-being",
  mhlq14 = "HLQ: understand advice on health from family or friends",
  mhlq15 = "HLQ: understand information in media on how to get healthier",
  mhlq16 = "HLQ: judge which everyday behaviour is related to your health",
  mhlq2 = "HLQ: find out where to go for professional help when sick",
  mhlq3 = "HLQ: understand what your doctor says to you",
  mhlq4 = "HLQ: understand doctor or pharmacist instruction on how to take a prescribed medicine",
  mhlq5 = "HLQ: judge when you may need a second opinion from another doctor",
  mhlq6 = "HLQ: make a decision about illness with information from doctor",
  mhlq7 = "HLQ: follow instructions from your doctor or pharmacist",
  mhlq8 = "HLQ: find information on how to manage mental health problems (stress or depression)",
  mhlq9 = "HLQ: understand warnings about unhealthy behaviours (smoking, low physical activity and drinking too much)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mhlq1", "mhlq10", "mhlq11", "mhlq12", "mhlq13", "mhlq14", "mhlq15", "mhlq16", "mhlq2", "mhlq3", "mhlq4", "mhlq5", "mhlq6", "mhlq7", "mhlq8", "mhlq9",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mhlq1", "mhlq10", "mhlq11", "mhlq12", "mhlq13", "mhlq14", "mhlq15", "mhlq16", "mhlq2", "mhlq3", "mhlq4", "mhlq5", "mhlq6", "mhlq7", "mhlq8", "mhlq9"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `1` = "very easy", `2` = "fairly easy", `3` = "fairly difficult", `4` = "very difficult",
  .applies_to_vars = c("mhlq1", "mhlq10", "mhlq11", "mhlq12", "mhlq13", "mhlq14", "mhlq15", "mhlq16", "mhlq2", "mhlq3", "mhlq4", "mhlq5", "mhlq6", "mhlq7", "mhlq8", "mhlq9"),
  .applies_to_waves = c("Z", "K")
)

.lasa_fc_196 <- .lasa_finalize_fc("196")

