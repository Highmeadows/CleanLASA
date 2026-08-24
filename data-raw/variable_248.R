## LASA filecode 248 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  `048stat` = "Status of children data collection (048)",
  ch_aliv = "Number of children alive",
  child = "Parental status based on children data",
  choth = "Number of other children alive (unknown/adoptive/foster)",
  chown = "Number of own children alive",
  chstep = "Number of stepchildren alive",
  data048 = "Availability/status of children data (048)",
  nc_volu = "Reason for childlessness",
  nchild = "Number of children",
  nrecs048 = "Number of children (medical interview)"
)

variable_labels_list <- list(
  Wave_E_labels = .replace_labels(
    harmonized_labels[c("data048")],
    data048 = "availability data 048"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c("048stat", "ch_aliv", "child", "choth", "chown", "chstep", "nc_volu", "nchild")],
    `048stat` = "status data collected b048",
    ch_aliv = "number of children alive",
    child = "parental status (based on b048)",
    choth = "# other (type unknown, adopt, foster) (alive)",
    chown = "# own children (alive)",
    chstep = "# step children (alive)",
    nc_volu = "reason for childlessness",
    nchild = "number of children"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c("data048")],
    data048 = "availability data 048"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c("048stat", "ch_aliv", "child", "choth", "chown", "chstep", "nc_volu", "nchild")],
    `048stat` = "status data collected b048",
    ch_aliv = "number of children alive (biological, step, adoptive, foster)",
    child = "parental status (based on b048)",
    choth = "# other (type unknown, adopt, foster) (alive)",
    chown = "# own children (alive)",
    chstep = "# step children (alive)",
    nc_volu = "reason for childlessness",
    nchild = "number of children ever (biological, step, adoptive, foster)"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels[c("nchild", "nrecs048")],
    nchild = "number of children (questions in demographic part f-t-f interview)",
    nrecs048 = "number of children (questions in medical interview)"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  `048stat` = c(
    `-3` = "interview terminated",
    `-2` = "refusal",
    `-1` = "no children",
    `1` = "children in b048",
    `2` = "children in b048, incomplete/unknown",
    `3` = "children in b048, incomplete: foster children",
    `4` = "children in b048, incomplete: refusal questions on children",
    `5` = "children in b048, incomplete: refusal questions on stepchildren"
  ),
  ch_aliv = c(
    `-1` = "no answer",
    `0` = NA_character_,
    `4` = NA_character_,
    `6` = NA_character_,
    `10` = NA_character_
  ),
  child = c(
    `-1` = "no answer on children",
    `0` = "childless",
    `1` = "yes; no specific information",
    `2` = "yes, own children",
    `3` = "yes, stepchildren",
    `4` = "yes, own and stepchildren",
    `5` = "yes, only other children"
  ),
  choth = c(
    `-2` = "number unknown/no specific information",
    `-1` = "no answer/refusal/interview terminated",
    `0` = NA_character_,
    `1` = NA_character_,
    `4` = NA_character_,
    `6` = NA_character_,
    `10` = NA_character_
  ),
  chown = c(
    `-2` = "number unknown/no specific information",
    `-1` = "no answer/refusal/interview terminated",
    `0` = NA_character_,
    `1` = NA_character_,
    `4` = NA_character_,
    `6` = NA_character_,
    `10` = NA_character_
  ),
  chstep = c(
    `-2` = "number unknown/no specific information",
    `-1` = "no answer/refusal/interview terminated",
    `0` = NA_character_,
    `1` = NA_character_,
    `4` = NA_character_,
    `6` = NA_character_,
    `10` = NA_character_
  ),
  data048 = c(
    `-5` = "all children died",
    `-4` = "no children",
    `-3` = "data unavailable due refusal/interview outcome",
    `-2` = "short/nonstandard interview",
    `-1` = "LSAdc",
    `1` = "children data/questions available",
    `2` = "no children",
    `3` = "refusal",
    `4` = "short version",
    `5` = "born < 1938"
  ),
  nc_volu = c(
    `-3` = "not childless (answer)",
    `-2` = "not childless / not asked",
    `-1` = "no answer",
    `1` = "choice",
    `2` = "no suitable partner available",
    `3` = "inadequate life circumstances",
    `4` = "medical reasons",
    `5` = "no choice other",
    `6` = "homosexual"
  ),
  nchild = c(
    `-3` = "skip questions children",
    `-1` = "no answer",
    `0` = NA_character_,
    `1` = NA_character_,
    `4` = NA_character_,
    `6` = NA_character_,
    `10` = NA_character_,
    `13` = NA_character_
  ),
  nrecs048 = c(
    `-2` = "questions 048 not asked",
    `-1` = "no answer",
    `0` = NA_character_,
    `1` = NA_character_,
    `13` = NA_character_
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("data048")],
    data048 = c(
    `-5` = "all children died",
    `-4` = "no children",
    `-3` = "refusal",
    `-2` = "short/terminated interview",
    `-1` = "LSAdc",
    `1` = "data children"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c("048stat", "ch_aliv", "child", "choth", "chown", "chstep", "nc_volu", "nchild")],
    `048stat` = c(
    `-3` = "terminated",
    `-2` = "refusal",
    `-1` = "no children",
    `1` = "children in a048",
    `2` = "children in b048, incomplete: type unknown",
    `3` = "children in b048, incomplete: foster children"
  ),
    ch_aliv = c(`0` = NA_character_, `4` = NA_character_, `6` = NA_character_, `10` = NA_character_),
    child = .replace_labels(
    standardized_value_labels$child,
    `-1` = "children?",
    `2` = "yes, own",
    `3` = "yes, step",
    `4` = "yes, own + step",
    `5` = "yes, only other"
  ),
    choth = c(
    `-2` = "no specific information",
    `0` = NA_character_,
    `4` = NA_character_,
    `6` = NA_character_,
    `10` = NA_character_
  ),
    chown = c(
    `-2` = "no specific information",
    `0` = NA_character_,
    `4` = NA_character_,
    `6` = NA_character_,
    `10` = NA_character_
  ),
    chstep = c(
    `-2` = "no specific information",
    `0` = NA_character_,
    `4` = NA_character_,
    `6` = NA_character_,
    `10` = NA_character_
  ),
    nc_volu = c(
    `-2` = "not childless",
    `-1` = "no answer",
    `1` = "choice",
    `2` = "no partner available",
    `3` = "inadequate life circumstances",
    `4` = "medical reasons",
    `5` = "no choice other"
  ),
    nchild = c(`0` = NA_character_, `4` = NA_character_, `6` = NA_character_, `10` = NA_character_)
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("data048")],
    data048 = c(
    `-3` = "terminated interview",
    `-2` = "short version",
    `1` = "questions asked",
    `2` = "no children",
    `3` = "refusal",
    `4` = "short version",
    `5` = "born < 1938"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c("048stat", "ch_aliv", "child", "choth", "chown", "chstep", "nc_volu", "nchild")],
    `048stat` = c(
    `-3` = "interview terminated",
    `-2` = "refusal on question about number of children",
    `-1` = "no children",
    `1` = "children in b048",
    `2` = "children in b048, incomplete: reason/type unknown",
    `4` = "children in b048, incomplete: refusal questions on children",
    `5` = "children in b048, incomplete: refusal questions on stepchildren"
  ),
    ch_aliv = c(`-1` = "no answer"),
    child = .replace_labels(
    standardized_value_labels$child,
    `-1` = "children? (no answer)",
    `2` = "yes, own",
    `3` = "yes, step",
    `4` = "yes, own + step",
    `5` = "yes, only other"
  ),
    choth = c(
    `-2` = "children in this category, number unknown",
    `-1` = "no answer/refusal/interview terminated",
    `0` = NA_character_,
    `1` = NA_character_
  ),
    chown = c(
    `-2` = "children in this category, number unknown",
    `-1` = "no answer/refusal/interview terminated",
    `0` = NA_character_,
    `1` = NA_character_
  ),
    chstep = c(
    `-2` = "children in this category, number unknown",
    `-1` = "no answer/refusal/interview terminated",
    `0` = NA_character_,
    `1` = NA_character_
  ),
    nc_volu = .replace_labels(
    standardized_value_labels$nc_volu,
    `-2` = "not childless (not asked)",
    `2` = "no or not right partner available",
    `4` = "medical reasons (fertility, illness)"
  ),
    nchild = c(`-1` = "no answer")
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("nchild", "nrecs048")],
    nchild = c(
    `-3` = "skip questions children",
    `-1` = "no answer question no/yes children",
    `0` = NA_character_,
    `1` = NA_character_,
    `13` = NA_character_
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  `048stat` = "categorical",
  ch_aliv = "numeric",
  child = "categorical",
  choth = "numeric",
  chown = "numeric",
  chstep = "numeric",
  data048 = "categorical",
  nc_volu = "categorical",
  nchild = "numeric",
  nrecs048 = "numeric"
)

.lasa_fc_248 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "248", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "248", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "248", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "248", waves = .lasa_wave_rows())
)
