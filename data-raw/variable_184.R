## LASA filecode 184 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mdiet = "Diet: yes/no",
  mdiethcal = "Diet: high-calorie",
  mdietlcal = "Diet: low-calorie",
  mdietlchol = "Diet: low-cholesterol",
  mdietlsalt = "Diet: low-salt",
  mdietoth = "Diet: other",
  mdietsugf = "Diet: sugar free",
  mdietveg = "Diet: vegetarian",
  mmilka50y = "Milk consumption: from age 50 on",
  mmilkb25y = "Milk consumption: up to 25 years",
  mmilkb50y = "Milk consumption: between 25 and 50 yr",
  mmilkhchs = "Milk products: number of days hard cheese",
  mmilkmlk = "Milk products: number of days milk",
  mmilkschs = "Milk products: number of days soft cheese",
  mmilkvar = "Milk products: number of days various",
  mmilkyght = "Milk products: number of days yoghurt"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `C` = c(
    "mdiet",
    "mdiethcal",
    "mdietlcal",
    "mdietlchol",
    "mdietlsalt",
    "mdietoth",
    "mdietsugf",
    "mdietveg",
    "mmilka50y",
    "mmilkb25y",
    "mmilkb50y",
    "mmilkhchs",
    "mmilkmlk",
    "mmilkschs",
    "mmilkvar",
    "mmilkyght"
  ),
  `D` = c(
    "mdiet",
    "mdietlcal",
    "mdietlchol",
    "mdietlsalt",
    "mdietsugf",
    "mdietveg"
  )
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mdiet = c(`-5` = "na, interview terminated", `-1` = "no valid data", `1` = "no", `2` = "yes"),
  mdiethcal = c(`-2` = "na, see CMDIET", `0` = "not mentioned", `1` = "mentioned"),
  mdietlcal = c(`-2` = "na, see C/DMDIET", `0` = "not mentioned", `1` = "mentioned"),
  mdietlchol = c(`-2` = "na, see C/DMDIET", `0` = "not mentioned", `1` = "mentioned"),
  mdietlsalt = c(`-2` = "na, see C/DMDIET", `0` = "not mentioned", `1` = "mentioned"),
  mdietoth = c(`-2` = "na, see CMDIET", `0` = "not mentioned", `1` = "mentioned"),
  mdietsugf = c(`-2` = "na, see C/DMDIET", `0` = "not mentioned", `1` = "mentioned"),
  mdietveg = c(`-2` = "na, see C/DMDIET", `0` = "not mentioned", `1` = "mentioned"),
  mmilka50y = c(
    `-5` = "na, interview terminated",
    `-1` = "no valid data",
    `1` = "about every meal",
    `2` = "every day but not every meal",
    `3` = "every week but not every day",
    `4` = "< once a week"
  ),
  mmilkb25y = c(
    `-5` = "na, interview terminated",
    `-1` = "no valid data",
    `1` = "about every meal",
    `2` = "every day but not every meal",
    `3` = "every week but not every day",
    `4` = "< once a week"
  ),
  mmilkb50y = c(
    `-5` = "na, interview terminated",
    `-1` = "no valid data",
    `1` = "about every meal",
    `2` = "every day but not every meal",
    `3` = "every week but not every day",
    `4` = "< once a week"
  ),
  mmilkhchs = c(`-5` = "na, interview terminated", `-1` = "no valid data", `0` = "none"),
  mmilkmlk = c(`-5` = "na, interview terminated", `-1` = "no valid data", `0` = "none"),
  mmilkschs = c(`-5` = "na, interview terminated", `-1` = "no valid data", `0` = "none"),
  mmilkvar = c(`-5` = "na, interview terminated", `-1` = "no valid data", `0` = "none"),
  mmilkyght = c(`-5` = "na, interview terminated", `-1` = "no valid data", `0` = "none")
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mdiet = "categorical",
  mdiethcal = "categorical",
  mdietlcal = "categorical",
  mdietlchol = "categorical",
  mdietlsalt = "categorical",
  mdietoth = "categorical",
  mdietsugf = "categorical",
  mdietveg = "categorical",
  mmilka50y = "numeric",
  mmilkb25y = "numeric",
  mmilkb50y = "categorical",
  mmilkhchs = "numeric",
  mmilkmlk = "numeric",
  mmilkschs = "numeric",
  mmilkvar = "numeric",
  mmilkyght = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "184", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "184", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "184", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "184", waves = .lasa_wave_rows())
)

.lasa_fc_184 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

