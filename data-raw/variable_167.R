## LASA filecode 167 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mnwctf1 = "contact frequency children (not co-residing)",
  mnwctf2 = "contact frequency grandchildren (not co-residing)",
  mnwctf3 = "contact frequency children-in-law",
  mnwctf4 = "contact frequency uncles, aunts, siblings, in-laws",
  mnwctf6 = "contact frequency friends, acquaintances",
  mnwctf8 = "contact frequency neighbors",
  nwctf1 = "contact frequency children (not co-residing)",
  nwctf2 = "contact frequency grandchildren (not co-residing)",
  nwctf3 = "contact frequency children-in-law",
  nwctf4 = "contact frequency uncles, aunts, siblings, in-laws",
  nwctf5 = "contact frequency MT friends, acquaintances",
  nwctf6 = "contact frequency NL/other friends, acquaintances",
  nwctf7 = "contact frequency MT neighbors",
  nwctf8 = "contact frequency NL/other neighbors",
  reschild = "residence of children (in-law): Netherlands or abroad",
  resinlaws = "residence of in-laws: Netherlands or abroad",
  resotherkin = "residence of other kin: Netherlands or abroad",
  ressibs = "residence of siblings: Netherlands or abroad"
)

variable_labels_list <- list(
  Wave_3B_labels = harmonized_labels[c("mnwctf1", "mnwctf2", "mnwctf3", "mnwctf4", "mnwctf6", "mnwctf8")],
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c(
    "nwctf1",
    "nwctf2",
    "nwctf3",
    "nwctf4",
    "nwctf5",
    "nwctf6",
    "nwctf7",
    "nwctf8",
    "reschild",
    "resinlaws",
    "resotherkin",
    "ressibs"
  )],
    reschild = "residence children (in-law): in NL or abroad",
    resinlaws = "residence in-laws: in NL or abroad",
    resotherkin = "residence other kin: in NL or abroad",
    ressibs = "residence siblings: in NL or abroad"
  ),
  Wave_I_labels = harmonized_labels[c("mnwctf1", "mnwctf2", "mnwctf3", "mnwctf4", "mnwctf6", "mnwctf8")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mnwctf1 = c(
    `-4` = "no medical interview",
    `-3` = "not asked (interview terminated)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "never or less than once a year",
    `2` = "once or few times a year",
    `3` = "once or few times a month",
    `4` = "once or few times a week",
    `5` = "daily"
  ),
  mnwctf2 = c(
    `-4` = "no medical interview",
    `-3` = "not asked (interview terminated)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "never or less than once a year",
    `2` = "once or few times a year",
    `3` = "once or few times a month",
    `4` = "once or few times a week",
    `5` = "daily"
  ),
  mnwctf3 = c(
    `-4` = "no medical interview",
    `-3` = "not asked (interview terminated)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "never or less than once a year",
    `2` = "once or few times a year",
    `3` = "once or few times a month",
    `4` = "once or few times a week",
    `5` = "daily"
  ),
  mnwctf4 = c(
    `-4` = "no medical interview",
    `-3` = "not asked (interview terminated)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "never or less than once a year",
    `2` = "once or few times a year",
    `3` = "once or few times a month",
    `4` = "once or few times a week",
    `5` = "daily"
  ),
  mnwctf6 = c(
    `-4` = "no medical interview",
    `-3` = "not asked (interview terminated)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "never or less than once a year",
    `2` = "once or few times a year",
    `3` = "once or few times a month",
    `4` = "once or few times a week",
    `5` = "daily"
  ),
  mnwctf8 = c(
    `-4` = "no medical interview",
    `-3` = "not asked (interview terminated)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "never or less than once a year",
    `2` = "once or few times a year",
    `3` = "once or few times a month",
    `4` = "once or few times a week",
    `5` = "daily"
  ),
  nwctf1 = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer"
  ),
  nwctf2 = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer"
  ),
  nwctf3 = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer"
  ),
  nwctf4 = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer"
  ),
  nwctf5 = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer"
  ),
  nwctf6 = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer"
  ),
  nwctf7 = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer"
  ),
  nwctf8 = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer"
  ),
  reschild = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "in Netherlands",
    `2` = "in Morocco/Turkey",
    `3` = "elsewhere",
    `4` = "equal number in Morocco/Turkey and NL"
  ),
  resinlaws = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "in Netherlands",
    `2` = "in Morocco/Turkey",
    `3` = "elsewhere",
    `4` = "equal number in Morocco/Turkey and NL"
  ),
  resotherkin = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "in Netherlands",
    `2` = "in Morocco/Turkey",
    `3` = "elsewhere",
    `4` = "equal number in Morocco/Turkey and NL"
  ),
  ressibs = c(
    `-3` = "not asked (interview terminated/skip)",
    `-2` = "answer: not applicable",
    `-1` = "no answer",
    `1` = "in Netherlands",
    `2` = "in Morocco/Turkey",
    `3` = "elsewhere",
    `4` = "equal number in Morocco/Turkey and NL"
  )
)

value_labels_list <- list(
  Wave_3B_labels = standardized_value_labels[c("mnwctf1", "mnwctf2", "mnwctf3", "mnwctf4", "mnwctf6", "mnwctf8")],
  Wave_MB_labels = standardized_value_labels[c(
    "nwctf1",
    "nwctf2",
    "nwctf3",
    "nwctf4",
    "nwctf5",
    "nwctf6",
    "nwctf7",
    "nwctf8",
    "reschild",
    "resinlaws",
    "resotherkin",
    "ressibs"
  )],
  Wave_I_labels = standardized_value_labels[c("mnwctf1", "mnwctf2", "mnwctf3", "mnwctf4", "mnwctf6", "mnwctf8")],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mnwctf1 = "categorical",
  mnwctf2 = "categorical",
  mnwctf3 = "categorical",
  mnwctf4 = "categorical",
  mnwctf6 = "categorical",
  mnwctf8 = "categorical",
  nwctf1 = "categorical",
  nwctf2 = "categorical",
  nwctf3 = "categorical",
  nwctf4 = "categorical",
  nwctf5 = "categorical",
  nwctf6 = "categorical",
  nwctf7 = "categorical",
  nwctf8 = "categorical",
  reschild = "categorical",
  resinlaws = "categorical",
  resotherkin = "categorical",
  ressibs = "categorical"
)

.lasa_fc_167 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "167", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "167", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "167", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "167", waves = .lasa_wave_rows())
)
