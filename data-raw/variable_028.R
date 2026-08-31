## LASA filecode 028 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  advemv = "# missing values adver-alcos items",
  alcmv = "# missing values alcos items",
  alcos01 = "Alcos item 01: plans",
  alcos02 = "Alcos item 02: failure",
  alcos03 = "Alcos item 03: wrong",
  alcos04 = "Alcos item 04: complicated",
  alcos05 = "Alcos item 05: unpleasant",
  alcos06 = "Alcos item 06: problem solving",
  alcos07 = "Alcos item 07: decision",
  alcos08 = "Alcos item 08: quickly",
  alcos09 = "Alcos item 09: unexpected",
  alcos10 = "Alcos item 10: mistake",
  alcos11 = "Alcos item 11: new things",
  alcos12 = "Alcos item 12: doubt",
  compmv = "# missing values comp-alcos items",
  initmv = "# missing values init-alcos items"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `C` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `D` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `E` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `2B` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `F` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `G` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `H` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `3B` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `I` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `J` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  ),
  `K` = c(
    "advemv",
    "alcmv",
    "alcos01",
    "alcos02",
    "alcos03",
    "alcos04",
    "alcos05",
    "alcos06",
    "alcos07",
    "alcos08",
    "alcos09",
    "alcos10",
    "alcos11",
    "alcos12",
    "compmv",
    "initmv"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no disagreement/agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

standardized_value_labels <- list(
  advemv = c(`-2` = "not available"),
  alcmv = c(`-2` = "not available"),
  alcos01 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos02 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos03 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos04 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos05 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos06 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos07 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos08 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos09 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos10 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos11 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  alcos12 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  compmv = c(`-2` = "not available"),
  initmv = c(`-2` = "not available")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "na, see BRMALC in LASAB228"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "na, see BRMALC in LASAB228"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    advemv = .replace_labels(
    standardized_value_labels$advemv,
    `-2` = "no valid data"
  ),
    alcmv = .replace_labels(
    standardized_value_labels$alcmv,
    `-2` = "no valid data"
  ),
    alcos01 = .replace_labels(
    standardized_value_labels$alcos01,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos02 = .replace_labels(
    standardized_value_labels$alcos02,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos03 = .replace_labels(
    standardized_value_labels$alcos03,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos04 = .replace_labels(
    standardized_value_labels$alcos04,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos05 = .replace_labels(
    standardized_value_labels$alcos05,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos06 = .replace_labels(
    standardized_value_labels$alcos06,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos07 = .replace_labels(
    standardized_value_labels$alcos07,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos08 = .replace_labels(
    standardized_value_labels$alcos08,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos09 = .replace_labels(
    standardized_value_labels$alcos09,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos10 = .replace_labels(
    standardized_value_labels$alcos10,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos11 = .replace_labels(
    standardized_value_labels$alcos11,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    alcos12 = .replace_labels(
    standardized_value_labels$alcos12,
    `-2` = "na, see C/D/E/B/F/G/H/B/I/J/KRMALC in LASAC/D/E/2B/F/G/H/3B/I/J/K228",
    `3` = "no disagreement/ agreement"
  ),
    compmv = .replace_labels(
    standardized_value_labels$compmv,
    `-2` = "no valid data"
  ),
    initmv = .replace_labels(
    standardized_value_labels$initmv,
    `-2` = "no valid data"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  advemv = "numeric",
  alcmv = "numeric",
  alcos01 = "categorical",
  alcos02 = "categorical",
  alcos03 = "categorical",
  alcos04 = "categorical",
  alcos05 = "categorical",
  alcos06 = "categorical",
  alcos07 = "categorical",
  alcos08 = "categorical",
  alcos09 = "categorical",
  alcos10 = "categorical",
  alcos11 = "categorical",
  alcos12 = "categorical",
  compmv = "numeric",
  initmv = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "028", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "028", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "028", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "028", waves = .lasa_wave_rows())
)

.lasa_fc_028 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

