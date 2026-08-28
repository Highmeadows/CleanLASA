## LASA filecode 273 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  lo = "Loneliness score (De Jong Gierveld, 11 items)",
  loemo = "Emotional loneliness score (De Jong Gierveld)",
  losoc = "Social loneliness score (De Jong Gierveld)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `C` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `D` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `E` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `2B` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `F` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `G` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `H` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `3B` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `MB` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `I` = c(
    "lo",
    "loemo",
    "losoc"
  ),
  `J` = c(
    "lo",
    "loemo",
    "losoc"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness 11 items dichotomous",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness 11 items dichotomous",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness 11 items dichotomous",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness 11 items dichotomous",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness 11 items dichotomous",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness <scale de Jong Gierveld>",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness <scale de Jong Gierveld>",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness <scale de Jong Gierveld>",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness <scale de Jong Gierveld>",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness <scale de Jong Gierveld>",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness <scale de Jong Gierveld>",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    lo = "loneliness <scale de Jong Gierveld>",
    loemo = "emotional loneliness <scale de Jong Gierveld>",
    losoc = "social loneliness <scale de Jong Gierveld>"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  lo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-2` = ">1 missing items",
    `-1` = "missing-item threshold exceeded",
    `0` = NA_character_,
    `11` = NA_character_
  ),
  loemo = c(
    `-9` = "born <= 1907",
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = "source-defined code 6",
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  ),
  losoc = c(
    `-9` = "born <= 1907",
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_,
    `6` = "unit nonresponse",
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-2` = ">1 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_,
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_,
    `6` = "unit nonresponse",
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-2` = ">1 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_,
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_,
    `6` = "unit nonresponse",
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-2` = ">1 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_,
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_,
    `6` = "unit nonresponse",
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-2` = ">1 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_,
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_,
    `6` = "unit nonresponse",
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)",
    `9` = "born <=1907 or >1937"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-2` = ">1 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-9` = "born <= 1907",
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_,
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)"
  ),
    losoc = c(
    `-9` = "born <= 1907",
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_,
    `6` = "unit nonresponse",
    `7` = "proxy (unit nonresponse)",
    `8` = "telephone interview (unit nonresponse)"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "terminated interview",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">2 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">2 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">2 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">2 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    lo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">2 missing items",
    `0` = NA_character_,
    `11` = NA_character_
  ),
    loemo = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `6` = NA_character_
  ),
    losoc = c(
    `-5` = "short version",
    `-4` = "refusal/skip by interviewer",
    `-3` = "interview terminated",
    `-1` = ">1 missing items",
    `0` = NA_character_,
    `5` = NA_character_
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(lo = "numeric", loemo = "numeric", losoc = "numeric")

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "273", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "273", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "273", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "273", waves = .lasa_wave_rows())
)

.lasa_fc_273 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

