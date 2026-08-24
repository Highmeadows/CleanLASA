## LASA filecode 196 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  mhlq9 = "HLQ: understand warnings about unhealthy behaviours (smoking, low physical activity and drinking too much)"
)

variable_labels_list <- list(
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mhlq1 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq10 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq11 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq12 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq13 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq14 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq15 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq16 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq2 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq3 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq4 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq5 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq6 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq7 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq8 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  ),
  mhlq9 = c(
    `-1` = "na, asked",
    `1` = "very easy",
    `2` = "fairly easy",
    `3` = "fairly difficult",
    `4` = "very difficult"
  )
)

value_labels_list <- list(
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

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

.lasa_fc_196 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "196", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "196", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "196", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "196", waves = .lasa_wave_rows())
)
