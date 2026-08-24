## LASA filecode 183 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mlimbend = "Bend down from a seated position",
  mlimbox = "Lift a box",
  mlimhrdchr = "Sit for one hour on a hard chair",
  mlimhvobj = "Lift a heavy object of at least 10 kilo",
  mlimobjflr = "Small lightweight object from the floor",
  mlimrsbed = "Raise yourself in bed",
  mlimrun = "Run for 100 meters fast to catch a bus",
  mlimscks = "Socks on and off your feet",
  mlimshelf = "A book from a high shelf or cupboard",
  mlimstn30 = "Stand continuously for 30 minutes",
  mlimwshbsn = "Wash hair over a washbasin",
  mlimwshy = "Wash and dry yourself all over"
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mlimbend = stats::setNames(character(0), character(0)),
  mlimbox = stats::setNames(character(0), character(0)),
  mlimhrdchr = stats::setNames(character(0), character(0)),
  mlimhvobj = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "yes, without any trouble",
    `2` = "yes, with some trouble",
    `3` = "no [or with help]"
  ),
  mlimobjflr = stats::setNames(character(0), character(0)),
  mlimrsbed = stats::setNames(character(0), character(0)),
  mlimrun = stats::setNames(character(0), character(0)),
  mlimscks = stats::setNames(character(0), character(0)),
  mlimshelf = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "yes, without any trouble",
    `2` = "yes, with some trouble",
    `3` = "no [or with help]"
  ),
  mlimstn30 = stats::setNames(character(0), character(0)),
  mlimwshbsn = stats::setNames(character(0), character(0)),
  mlimwshy = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_C_labels = standardized_value_labels[c("mlimhvobj", "mlimshelf")],
  Wave_D_labels = standardized_value_labels[c("mlimhvobj", "mlimshelf")],
  Wave_E_labels = standardized_value_labels[c("mlimhvobj", "mlimshelf")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mlimbend = "categorical",
  mlimbox = "categorical",
  mlimhrdchr = "categorical",
  mlimhvobj = "categorical",
  mlimobjflr = "categorical",
  mlimrsbed = "categorical",
  mlimrun = "categorical",
  mlimscks = "categorical",
  mlimshelf = "categorical",
  mlimstn30 = "categorical",
  mlimwshbsn = "categorical",
  mlimwshy = "categorical"
)

.lasa_fc_183 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "183", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "183", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "183", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "183", waves = .lasa_wave_rows())
)
