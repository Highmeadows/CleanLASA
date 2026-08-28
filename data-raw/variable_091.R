## LASA filecode 091 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  ptsd01 = "1. Last 4 weeks: express",
  ptsd02 = "2. Last 4 weeks: avoid thoughts",
  ptsd03 = "3. Last 4 weeks: no recall",
  ptsd04 = "4. Last 4 weeks: irritable",
  ptsd05 = "5. Last 4 weeks: body sensations",
  ptsd06 = "6. Last 4 weeks: sleep through",
  ptsd07 = "7. Last 4 weeks: dreams",
  ptsd08 = "8. Last 4 weeks: decreased interest",
  ptsd09 = "9. Last 4 weeks: repetitive memories",
  ptsd10 = "10. Last 4 weeks: reoccurrences",
  ptsd11 = "11. Last 4 weeks: no future",
  ptsd12 = "12. Last 4 weeks: difficulty concentrating",
  ptsd13 = "13. Last 4 weeks: jumpy",
  ptsd14 = "14. Last 4 weeks: avoid feelings",
  ptsd15 = "15. Last 4 weeks: avoid memories",
  ptsd16 = "16. Last 4 weeks: anger",
  ptsd17 = "17. Last 4 weeks: sleep in",
  ptsd18 = "18. Last 4 weeks: past experiences",
  ptsd19 = "19. Last 4 weeks: estranged",
  ptsd20 = "20. Last 4 weeks: apprehensive",
  ptsd21 = "21. Last 4 weeks: nasty memories",
  ptsd22 = "22. Last 4 weeks: unconnected",
  ptsd23 = "23. Last 4 weeks: daily activities"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `D` = c(
    "ptsd01",
    "ptsd02",
    "ptsd03",
    "ptsd04",
    "ptsd05",
    "ptsd06",
    "ptsd07",
    "ptsd08",
    "ptsd09",
    "ptsd10",
    "ptsd11",
    "ptsd12",
    "ptsd13",
    "ptsd14",
    "ptsd15",
    "ptsd16",
    "ptsd17",
    "ptsd18",
    "ptsd19",
    "ptsd20",
    "ptsd21",
    "ptsd22",
    "ptsd23"
  ),
  `E` = c(
    "ptsd01",
    "ptsd02",
    "ptsd03",
    "ptsd04",
    "ptsd05",
    "ptsd06",
    "ptsd07",
    "ptsd08",
    "ptsd09",
    "ptsd10",
    "ptsd11",
    "ptsd12",
    "ptsd13",
    "ptsd14",
    "ptsd15",
    "ptsd16",
    "ptsd17",
    "ptsd18",
    "ptsd19",
    "ptsd20",
    "ptsd21",
    "ptsd22",
    "ptsd23"
  )
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "not at all",
  `2` = "somewhat",
  `3` = "considerably",
  `4` = "very much"
)

standardized_value_labels <- list(
  ptsd01 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd02 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd03 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd04 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd05 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd06 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd07 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd08 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd09 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd10 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd11 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd12 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd13 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd14 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd15 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd16 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd17 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd18 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd19 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd20 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd21 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd22 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  ),
  ptsd23 = c(
    default_missing_labels[c("-2", "-1")],
    default_answer_labels[c("1", "2", "3", "4")]
  )
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    ptsd01 = .replace_labels(
    standardized_value_labels$ptsd01,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd02 = .replace_labels(
    standardized_value_labels$ptsd02,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd03 = .replace_labels(
    standardized_value_labels$ptsd03,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd04 = .replace_labels(
    standardized_value_labels$ptsd04,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd05 = .replace_labels(
    standardized_value_labels$ptsd05,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd06 = .replace_labels(
    standardized_value_labels$ptsd06,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd07 = .replace_labels(
    standardized_value_labels$ptsd07,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd08 = .replace_labels(
    standardized_value_labels$ptsd08,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd09 = .replace_labels(
    standardized_value_labels$ptsd09,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd10 = .replace_labels(
    standardized_value_labels$ptsd10,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd11 = .replace_labels(
    standardized_value_labels$ptsd11,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd12 = .replace_labels(
    standardized_value_labels$ptsd12,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd13 = .replace_labels(
    standardized_value_labels$ptsd13,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd14 = .replace_labels(
    standardized_value_labels$ptsd14,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd15 = .replace_labels(
    standardized_value_labels$ptsd15,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd16 = .replace_labels(
    standardized_value_labels$ptsd16,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd17 = .replace_labels(
    standardized_value_labels$ptsd17,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd18 = .replace_labels(
    standardized_value_labels$ptsd18,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd19 = .replace_labels(
    standardized_value_labels$ptsd19,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd20 = .replace_labels(
    standardized_value_labels$ptsd20,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd21 = .replace_labels(
    standardized_value_labels$ptsd21,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd22 = .replace_labels(
    standardized_value_labels$ptsd22,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd23 = .replace_labels(
    standardized_value_labels$ptsd23,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    ptsd01 = .replace_labels(
    standardized_value_labels$ptsd01,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd02 = .replace_labels(
    standardized_value_labels$ptsd02,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd03 = .replace_labels(
    standardized_value_labels$ptsd03,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd04 = .replace_labels(
    standardized_value_labels$ptsd04,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd05 = .replace_labels(
    standardized_value_labels$ptsd05,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd06 = .replace_labels(
    standardized_value_labels$ptsd06,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd07 = .replace_labels(
    standardized_value_labels$ptsd07,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd08 = .replace_labels(
    standardized_value_labels$ptsd08,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd09 = .replace_labels(
    standardized_value_labels$ptsd09,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd10 = .replace_labels(
    standardized_value_labels$ptsd10,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd11 = .replace_labels(
    standardized_value_labels$ptsd11,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd12 = .replace_labels(
    standardized_value_labels$ptsd12,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd13 = .replace_labels(
    standardized_value_labels$ptsd13,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd14 = .replace_labels(
    standardized_value_labels$ptsd14,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd15 = .replace_labels(
    standardized_value_labels$ptsd15,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd16 = .replace_labels(
    standardized_value_labels$ptsd16,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd17 = .replace_labels(
    standardized_value_labels$ptsd17,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd18 = .replace_labels(
    standardized_value_labels$ptsd18,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd19 = .replace_labels(
    standardized_value_labels$ptsd19,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd20 = .replace_labels(
    standardized_value_labels$ptsd20,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd21 = .replace_labels(
    standardized_value_labels$ptsd21,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd22 = .replace_labels(
    standardized_value_labels$ptsd22,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  ),
    ptsd23 = .replace_labels(
    standardized_value_labels$ptsd23,
    `-2` = "na, see D/ERMPTSD in LASAD/E291"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  ptsd01 = "categorical",
  ptsd02 = "categorical",
  ptsd03 = "categorical",
  ptsd04 = "categorical",
  ptsd05 = "categorical",
  ptsd06 = "categorical",
  ptsd07 = "categorical",
  ptsd08 = "categorical",
  ptsd09 = "categorical",
  ptsd10 = "categorical",
  ptsd11 = "categorical",
  ptsd12 = "categorical",
  ptsd13 = "categorical",
  ptsd14 = "categorical",
  ptsd15 = "categorical",
  ptsd16 = "categorical",
  ptsd17 = "categorical",
  ptsd18 = "categorical",
  ptsd19 = "categorical",
  ptsd20 = "categorical",
  ptsd21 = "categorical",
  ptsd22 = "categorical",
  ptsd23 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "091", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "091", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "091", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "091", waves = .lasa_wave_rows())
)

.lasa_fc_091 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

