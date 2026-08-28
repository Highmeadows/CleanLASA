## LASA filecode 713 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
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

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `I` = c(
    "trjob1",
    "trjob6",
    "trjobl1",
    "trjobstom",
    "trjobstoy"
  ),
  `J` = c(
    "trjob1",
    "trjob6",
    "trjobl1",
    "trjobstom",
    "trjobstoy"
  ),
  `K` = c(
    "trjob1",
    "trjob6",
    "trjobl1",
    "trjobstom",
    "trjobstoy"
  )
)

variable_labels_list <- list(
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  trjob1 = c(
    `-2` = "na, outside birth-year eligibility",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  trjob6 = c(
    `-3` = "does not know",
    `-2` = "na, see TRJOB1",
    default_missing_labels[c("-1")]
  ),
  trjobl1 = c(
    `-2` = "na, see TRJOB1",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  trjobstom = c(
    `-2` = "na, see TRJOBL1",
    default_missing_labels[c("-1")],
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
  trjobstoy = c(
    `-2` = "na, see TRJOBL1",
    default_missing_labels[c("-1")]
  )
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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "713", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "713", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "713", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "713", waves = .lasa_wave_rows())
)

.lasa_fc_713 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

