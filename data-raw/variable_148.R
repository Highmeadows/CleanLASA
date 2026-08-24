## LASA filecode 148 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qeoldt1 = "EOL: dec. treatm.: R self",
  qeoldt2 = "EOL: dec. treatm.: R self after consulting GP",
  qeoldt3 = "EOL: dec. treatm.: R self and GP",
  qeoldt4 = "EOL: dec. treatm.: GP after consulting R self",
  qeoldt5 = "EOL: dec. treatm.: GP",
  qvgcan1 = "vignet cancer: nasal gastric tube",
  qvgcan2 = "vignet cancer: antibiotics",
  qvgcan3 = "vignet cancer: resuscitation",
  qvgcan4 = "vignet cancer: mechanical respiration",
  qvgcan5 = "vignet cancer: euthanasia",
  qvgdem1 = "vignet dementia: nasal gastric tube",
  qvgdem2 = "vignet dementia: antibiotics",
  qvgdem3 = "vignet dementia: resuscitation",
  qvgdem4 = "vignet dementia: mechanical respiration",
  qvgdem5 = "vignet dementia: euthanasia"
)

variable_labels_list <- list(
  Wave_G_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qeoldt1 = c(`-1` = "not available", `0` = "not mentioned"),
  qeoldt2 = c(`-1` = "not available", `0` = "not mentioned"),
  qeoldt3 = c(`-1` = "not available", `0` = "not mentioned"),
  qeoldt4 = c(`-1` = "not available", `0` = "not mentioned"),
  qeoldt5 = c(`-1` = "not available", `0` = "not mentioned"),
  qvgcan1 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no"),
  qvgcan2 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no"),
  qvgcan3 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no"),
  qvgcan4 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no"),
  qvgcan5 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no"),
  qvgdem1 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no"),
  qvgdem2 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no"),
  qvgdem3 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no"),
  qvgdem4 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no"),
  qvgdem5 = c(`-1` = "not available", `1` = "yes", `2` = "probably yes", `3` = "probably not", `4` = "no")
)

value_labels_list <- list(
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    qeoldt1 = .replace_labels(
    standardized_value_labels$qeoldt1,
    `-1` = "mentioned"
  ),
    qeoldt2 = .replace_labels(
    standardized_value_labels$qeoldt2,
    `-1` = "mentioned"
  ),
    qeoldt3 = .replace_labels(
    standardized_value_labels$qeoldt3,
    `-1` = "mentioned"
  ),
    qeoldt4 = .replace_labels(
    standardized_value_labels$qeoldt4,
    `-1` = "mentioned"
  ),
    qeoldt5 = .replace_labels(
    standardized_value_labels$qeoldt5,
    `-1` = "mentioned"
  ),
    qvgcan1 = .replace_labels(
    standardized_value_labels$qvgcan1,
    `-1` = "no answer, asked"
  ),
    qvgcan2 = .replace_labels(
    standardized_value_labels$qvgcan2,
    `-1` = "no answer, asked"
  ),
    qvgcan3 = .replace_labels(
    standardized_value_labels$qvgcan3,
    `-1` = "no answer, asked"
  ),
    qvgcan4 = .replace_labels(
    standardized_value_labels$qvgcan4,
    `-1` = "no answer, asked"
  ),
    qvgcan5 = .replace_labels(
    standardized_value_labels$qvgcan5,
    `-1` = "no answer, asked"
  ),
    qvgdem1 = .replace_labels(
    standardized_value_labels$qvgdem1,
    `-1` = "no answer, asked"
  ),
    qvgdem2 = .replace_labels(
    standardized_value_labels$qvgdem2,
    `-1` = "no answer, asked"
  ),
    qvgdem3 = .replace_labels(
    standardized_value_labels$qvgdem3,
    `-1` = "no answer, asked"
  ),
    qvgdem4 = .replace_labels(
    standardized_value_labels$qvgdem4,
    `-1` = "no answer, asked"
  ),
    qvgdem5 = .replace_labels(
    standardized_value_labels$qvgdem5,
    `-1` = "no answer, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qeoldt1 = "categorical",
  qeoldt2 = "categorical",
  qeoldt3 = "categorical",
  qeoldt4 = "categorical",
  qeoldt5 = "categorical",
  qvgcan1 = "categorical",
  qvgcan2 = "categorical",
  qvgcan3 = "categorical",
  qvgcan4 = "categorical",
  qvgcan5 = "categorical",
  qvgdem1 = "categorical",
  qvgdem2 = "categorical",
  qvgdem3 = "categorical",
  qvgdem4 = "categorical",
  qvgdem5 = "categorical"
)

.lasa_fc_148 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "148", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "148", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "148", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "148", waves = .lasa_wave_rows())
)
