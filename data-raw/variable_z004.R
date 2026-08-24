## LASA filecode z004 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  aedu = "education level attained (years)",
  aeducat = "education level attained (categorical)",
  aethnic = "ethnic identification",
  anation = "nationality",
  bycohort = "5-years-cohort birthyear",
  byear = "birthyear of respondent",
  sex = "sex respondent"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  aedu = c(
    `-1` = "no answer",
    `5` = "elementary not completed",
    `6` = "elementary education",
    `9` = "lower vocational education",
    `10` = "general intermediate education",
    `11` = "intermediate vocation education",
    `12` = "general secondary education",
    `15` = "higher vocational education",
    `16` = "college education",
    `18` = "university education"
  ),
  aeducat = c(
    `-1` = "no answer",
    `1` = "elementary not completed",
    `2` = "elementary education",
    `3` = "lower vocational education",
    `4` = "general intermediate education",
    `5` = "intermediate vocation education",
    `6` = "general secondary education",
    `7` = "higher vocational education",
    `8` = "college education",
    `9` = "university education"
  ),
  aethnic = c(
    `-3` = "na, wrong skip (born abroad+nat=Neth)",
    `-2` = "born Neth+nat=Neth",
    `1` = "Dutch/Netherlands",
    `2` = "Aruban",
    `3` = "Antillean",
    `4` = "Chinese",
    `5` = "Greece",
    `6` = "Italian",
    `7` = "Yugoslavian",
    `8` = "Capeverdian",
    `9` = "Moroccan",
    `10` = "Moluccan",
    `11` = "Portuguese",
    `12` = "Spanish",
    `13` = "Surinam",
    `14` = "Tunisian",
    `15` = "Turkish",
    `16` = "Other",
    `17` = "Indonesian",
    `18` = "Iranian",
    `19` = "American",
    `20` = "European",
    `21` = "Polish",
    `22` = "French",
    `23` = "Indian",
    `24` = "German",
    `25` = "English",
    `26` = "Creole",
    `27` = "Hindu",
    `28` = "Serbian",
    `29` = "Israeli"
  ),
  anation = c(
    `1` = "Dutch only",
    `2` = "Surinam only",
    `3` = "Turkish only",
    `4` = "Moroccan only",
    `5` = "Indonesian only",
    `6` = "other only",
    `7` = "Dutch+other",
    `8` = "US",
    `9` = "US+Dutch",
    `10` = "German",
    `11` = "German+Dutch",
    `12` = "Belgian",
    `13` = "Belgian+Dutch",
    `14` = "British",
    `15` = "British+Dutch",
    `16` = "none",
    `17` = "French",
    `18` = "French+Dutch",
    `19` = "Italian",
    `20` = "Italian+Dutch",
    `21` = "Indian",
    `22` = "Indian+Dutch",
    `23` = "Italian",
    `24` = "Italian+Dutch",
    `25` = "Polish",
    `26` = "Polish+Dutch",
    `27` = "Trinidadian",
    `28` = "Trinidadian+Dutch",
    `29` = "Swiss",
    `30` = "Swiss+Dutch",
    `31` = "US",
    `32` = "US+Dutch",
    `33` = "Portuguese",
    `34` = "Portuguese+Dutch"
  ),
  bycohort = c(
    `2` = "1908-12",
    `3` = "1913-17",
    `4` = "1918-22",
    `5` = "1923-27",
    `6` = "1923-27",
    `7` = "1933-37",
    `8` = "1938-42",
    `9` = "1943-47",
    `10` = "1948-52",
    `11` = "1953-57"
  ),
  byear = stats::setNames(character(0), character(0)),
  sex = c(`1` = "male", `2` = "female")
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels[c("aedu", "aeducat", "aethnic", "anation", "bycohort", "sex")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  aedu = "numeric",
  aeducat = "categorical",
  aethnic = "categorical",
  anation = "categorical",
  bycohort = "categorical",
  byear = "numeric",
  sex = "categorical"
)

.lasa_fc_z004 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "z004", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "aedu", override_value = "aedu") |>
    .override_label(wave = "B", variable = "aeducat", override_value = "aeducat") |>
    .override_label(wave = "B", variable = "aethnic", override_value = "aethnic") |>
    .override_label(wave = "B", variable = "anation", override_value = "anation") |>
    .override_label(wave = "B", variable = "bycohort", override_value = "bycohort") |>
    .override_label(wave = "B", variable = "byear", override_value = "byear") |>
    .override_label(wave = "B", variable = "sex", override_value = "sex"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "z004", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "z004", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "z004", waves = .lasa_wave_rows())
)
