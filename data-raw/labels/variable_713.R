## LASA filecode 713 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  trjob1 = "paid job at present",
  trjob6 = "last job: hours/week",
  trjobl1 = "paid job before",
  trjobstom = "stopped working: month",
  trjobstoy = "stopped working: year"
)

variable_labels_list <- list(
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trjob1 = c(`-2` = "na, outside birth-year eligibility", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trjob6 = c(`-3` = "does not know", `-2` = "na, see TRJOB1", `-1` = "na, asked"),
  trjobl1 = c(`-2` = "na, see TRJOB1", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  trjobstom = c(
    `-2` = "na, see TRJOBL1",
    `-1` = "na, asked",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  trjobstoy = c(`-2` = "na, see TRJOBL1", `-1` = "na, asked")
)

value_labels_list <- list(
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    trjob6 = .replace_labels(
    standardized_value_labels$trjob6,
    `-2` = "na, see ITRJOB1"
  ),
    trjobl1 = .replace_labels(
    standardized_value_labels$trjobl1,
    `-2` = "na, see ITRJOB1"
  ),
    trjobstom = .replace_labels(
    standardized_value_labels$trjobstom,
    `-2` = "na, see ITRJOBL1"
  ),
    trjobstoy = .replace_labels(
    standardized_value_labels$trjobstoy,
    `-2` = "na, see ITRJOBL1"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    trjob6 = .replace_labels(
    standardized_value_labels$trjob6,
    `-2` = "na, see JTRJOB1"
  ),
    trjobl1 = .replace_labels(
    standardized_value_labels$trjobl1,
    `-2` = "na, see JTRJOB1"
  ),
    trjobstom = .replace_labels(
    standardized_value_labels$trjobstom,
    `-2` = "na, see JTRJOBL1"
  ),
    trjobstoy = .replace_labels(
    standardized_value_labels$trjobstoy,
    `-2` = "na, see JTRJOBL1"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    trjob6 = .replace_labels(
    standardized_value_labels$trjob6,
    `-2` = "na, see KTRJOB1"
  ),
    trjobl1 = .replace_labels(
    standardized_value_labels$trjobl1,
    `-2` = "na, see KTRJOB1"
  ),
    trjobstom = .replace_labels(
    standardized_value_labels$trjobstom,
    `-2` = "na, see KTRJOBL1"
  ),
    trjobstoy = .replace_labels(
    standardized_value_labels$trjobstoy,
    `-2` = "na, see KTRJOBL1"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  trjob1 = "categorical",
  trjob6 = "numeric",
  trjobl1 = "categorical",
  trjobstom = "date",
  trjobstoy = "date"
)

.lasa_fc_713 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "713", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "713", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "713", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "713", waves = .lasa_wave_rows())
)
