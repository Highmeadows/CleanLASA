## LASA filecode 714 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  trapp6m = "Appetite last 6 months",
  trapp7d = "Appetite last 7 days",
  trestw = "Estimation body weight",
  trmed155 = "Weight: self-report",
  trvac144 = "Weight change other reason: coded",
  trvar142 = "Weight change last 6 months",
  trvar143G = "Weight gain kilogram",
  trvar143L = "Weight loss kilogram",
  trvar144G = "Weight gain reason",
  trvar144L = "Weight loss reason",
  trvc144G = "Reason weight gain (constructed)",
  trvc144L = "Reason weight loss (constructed)"
)

variable_labels_list <- list(
  Wave_I_labels = harmonized_labels[c(
    "trapp6m",
    "trestw",
    "trmed155",
    "trvac144",
    "trvar142",
    "trvar143G",
    "trvar143L",
    "trvar144G",
    "trvar144L",
    "trvc144G",
    "trvc144L"
  )],
  Wave_J_labels = harmonized_labels[c(
    "trapp7d",
    "trestw",
    "trmed155",
    "trvac144",
    "trvar142",
    "trvar143G",
    "trvar143L",
    "trvar144G",
    "trvar144L",
    "trvc144G",
    "trvc144L"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trapp6m = c(`-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor"),
  trapp7d = c(`-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor"),
  trestw = c(
    `-3` = "na, section not done",
    `-1` = "na, asked",
    `1` = "severe underweight",
    `2` = "underweight",
    `3` = "approx. normal weight",
    `4` = "overweight",
    `5` = "severe overweight",
    `6` = "do not know"
  ),
  trmed155 = c(`-1` = "na, asked"),
  trvac144 = stats::setNames(character(0), character(0)),
  trvar142 = c(`-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight"),
  trvar143G = c(`-1` = "na, asked"),
  trvar143L = c(`-1` = "na, asked"),
  trvar144G = c(
    `-1` = "na, asked",
    `1` = "sickness",
    `2` = "eating more or different",
    `3` = "less physical activity",
    `4` = "combination of eating more/different and physical inactive",
    `5` = "reason unknown",
    `6` = "other reason"
  ),
  trvar144L = c(
    `-1` = "na, asked",
    `1` = "sickness (unintentional)",
    `2` = "diet (intentional)",
    `3` = "other diet (unintentional)",
    `4` = "more physical activity (intentional)",
    `5` = "reason unknown (unintentional)",
    `6` = "social factors (unintentional)",
    `7` = "combination of eating less/healthier and more physically active (intentional)",
    `8` = "other reason"
  ),
  trvc144G = c(
    `-2` = "na, see TRVAR144G",
    `-1` = "na, asked",
    `1` = "sickness",
    `2` = "related to eating",
    `3` = "physical inactivity",
    `4` = "eating and physical inactivity",
    `5` = "reason unknown",
    `6` = "other reason",
    `7` = "aging",
    `8` = "social factors"
  ),
  trvc144L = c(
    `-2` = "na, see TRVAR144L",
    `-1` = "na, asked",
    `1` = "sickness (unintentional)",
    `2` = "diet (intentional)",
    `3` = "different diet (unintentional)",
    `4` = "physical activity (intentional)",
    `5` = "reason unknown (unintentional)",
    `6` = "social factors (unintentional)",
    `7` = "other reason",
    `8` = "eating less or different (unknown)",
    `9` = "eating less and physical active (intentional)",
    `10` = "physical activity (unintentional)",
    `11` = "physical activity (unknown)",
    `12` = "aging (unintentional)"
  )
)

value_labels_list <- list(
  Wave_I_labels = standardized_value_labels[c(
    "trapp6m",
    "trestw",
    "trmed155",
    "trvar142",
    "trvar143G",
    "trvar143L",
    "trvar144G",
    "trvar144L",
    "trvc144G",
    "trvc144L"
  )],
  Wave_J_labels = standardized_value_labels[c(
    "trapp7d",
    "trestw",
    "trmed155",
    "trvar142",
    "trvar143G",
    "trvar143L",
    "trvar144G",
    "trvar144L",
    "trvc144G",
    "trvc144L"
  )],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  trapp6m = "categorical",
  trapp7d = "categorical",
  trestw = "categorical",
  trmed155 = "numeric",
  trvac144 = "categorical",
  trvar142 = "categorical",
  trvar143G = "numeric",
  trvar143L = "numeric",
  trvar144G = "categorical",
  trvar144L = "categorical",
  trvc144G = "categorical",
  trvc144L = "categorical"
)

.lasa_fc_714 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "714", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "714", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "714", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "714", waves = .lasa_wave_rows())
)
