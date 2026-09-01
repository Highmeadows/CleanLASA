## LASA filecode z004 -- variable names, variable labels, value labels,
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
  aedu = "numeric",
  aeducat = "categorical",
  aethnic = "categorical",
  anation = "categorical",
  bycohort = "categorical",
  byear = "numeric",
  sex = "categorical"
)

# define variable labels ----
variable_labels(
  aedu = "education level attained (years)",
  aeducat = "education level attained (categorical)",
  aethnic = "ethnic identification",
  anation = "nationality",
  bycohort = "5-years-cohort birthyear",
  byear = "birthyear of respondent",
  sex = "sex respondent",
  .applies_to_waves = c("Z")
)

variable_labels(
  "aedu", "aeducat", "aethnic", "anation", "bycohort", "byear", "sex",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-1` = "na, asked", `5` = "elementary not completed", `6` = "elementary education", `9` = "lower vocational education", `10` = "general intermediate education", `11` = "intermediate vocation education", `12` = "general secondary education", `15` = "higher vocational education", `16` = "college education", `18` = "university education",
  .applies_to_vars = c("aedu"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "na, asked", `1` = "elementary not completed", `2` = "elementary education", `3` = "lower vocational education", `4` = "general intermediate education", `5` = "intermediate vocation education", `6` = "general secondary education", `7` = "higher vocational education", `8` = "college education", `9` = "university education",
  .applies_to_vars = c("aeducat"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "na, wrong skip (born abroad+nat=Neth)", `-2` = "born Neth+nat=Neth", `1` = "Dutch/Netherlands", `2` = "Aruban", `3` = "Antillean", `4` = "Chinese", `5` = "Greece", `6` = "Italian", `7` = "Yugoslavian", `8` = "Capeverdian", `9` = "Moroccan", `10` = "Moluccan", `11` = "Portuguese", `12` = "Spanish", `13` = "Surinam", `14` = "Tunisian", `15` = "Turkish", `16` = "Other", `17` = "Indonesian", `18` = "Iranian", `19` = "American", `20` = "European", `21` = "Polish", `22` = "French", `23` = "Indian", `24` = "German", `25` = "English", `26` = "Creole", `27` = "Hindu", `28` = "Serbian", `29` = "Israeli",
  .applies_to_vars = c("aethnic"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "Dutch only", `2` = "Surinam only", `3` = "Turkish only", `4` = "Moroccan only", `5` = "Indonesian only", `6` = "other only", `7` = "Dutch+other", `8` = "US", `9` = "US+Dutch", `10` = "German", `11` = "German+Dutch", `12` = "Belgian", `13` = "Belgian+Dutch", `14` = "British", `15` = "British+Dutch", `16` = "none", `17` = "French", `18` = "French+Dutch", `19` = "Italian", `20` = "Italian+Dutch", `21` = "Indian", `22` = "Indian+Dutch", `23` = "Italian", `24` = "Italian+Dutch", `25` = "Polish", `26` = "Polish+Dutch", `27` = "Trinidadian", `28` = "Trinidadian+Dutch", `29` = "Swiss", `30` = "Swiss+Dutch", `31` = "US", `32` = "US+Dutch", `33` = "Portuguese", `34` = "Portuguese+Dutch",
  .applies_to_vars = c("anation"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `2` = "1908-12", `3` = "1913-17", `4` = "1918-22", `5` = "1923-27", `6` = "1923-27", `7` = "1933-37", `8` = "1938-42", `9` = "1943-47", `10` = "1948-52", `11` = "1953-57",
  .applies_to_vars = c("bycohort"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `1` = "male", `2` = "female",
  .applies_to_vars = c("sex"),
  .applies_to_waves = c("Z", "B")
)

.lasa_fc_z004 <- .lasa_finalize_fc("z004")
.lasa_fc_z004$variables <- .lasa_fc_z004$variables |>
  .override_label(wave = "B", variable = "aedu", override_value = "aedu") |>
  .override_label(wave = "B", variable = "aeducat", override_value = "aeducat") |>
  .override_label(wave = "B", variable = "aethnic", override_value = "aethnic") |>
  .override_label(wave = "B", variable = "anation", override_value = "anation") |>
  .override_label(wave = "B", variable = "bycohort", override_value = "bycohort") |>
  .override_label(wave = "B", variable = "byear", override_value = "byear") |>
  .override_label(wave = "B", variable = "sex", override_value = "sex")

