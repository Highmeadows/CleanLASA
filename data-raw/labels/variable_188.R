## LASA filecode 188 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mpain1 = "Pain: past 3 month",
  mpain10 = "Pain: fixed on place and intensity",
  mpain11 = "Pain: suppress feelings of anger",
  mpain12 = "Pain: exercise or go to physiotherapy",
  mpain13 = "Pain: ignore the pain",
  mpain14 = "Pain: stay active",
  mpain15 = "Pain: banish troubling thoughts",
  mpain16 = "Pain: read",
  mpain17 = "Pain: do leisure activities",
  mpain18 = "Pain: try to divert attention",
  mpain19 = "Pain: drawing",
  mpain2 = "Pain: think pain wears me out",
  mpain3 = "Pain: tell others how bad",
  mpain4 = "Pain: pray for relief",
  mpain5 = "Pain: restrict social activities",
  mpain6 = "Pain: need help for daily duties",
  mpain7 = "Pain: think nothing helps for relief",
  mpain8 = "Pain: take medicine for relief",
  mpain9 = "Pain: call doctor or nurse"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mpain1 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  mpain10 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain11 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain12 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain13 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain14 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain15 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain16 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain17 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain18 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain19 = c(
    `-2` = "no valid data",
    `-1` = "na, asked",
    `1` = "not applicable",
    `2` = "drawing filled in",
    `3` = "drawing partial filled in",
    `4` = "filling in failed",
    `5` = "interviewer filled in drawing"
  ),
  mpain2 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain3 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain4 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain5 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain6 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain7 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain8 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  ),
  mpain9 = c(
    `-1` = "na, asked",
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often",
    `5` = "very often"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    mpain19 = .replace_labels(
    standardized_value_labels$mpain19,
    `-2` = "na, see EMPAIN1"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mpain1 = "categorical",
  mpain10 = "categorical",
  mpain11 = "categorical",
  mpain12 = "categorical",
  mpain13 = "categorical",
  mpain14 = "categorical",
  mpain15 = "categorical",
  mpain16 = "categorical",
  mpain17 = "categorical",
  mpain18 = "categorical",
  mpain19 = "categorical",
  mpain2 = "categorical",
  mpain3 = "categorical",
  mpain4 = "categorical",
  mpain5 = "categorical",
  mpain6 = "categorical",
  mpain7 = "categorical",
  mpain8 = "categorical",
  mpain9 = "categorical"
)

.lasa_fc_188 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "188", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "188", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "188", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "188", waves = .lasa_wave_rows())
)
