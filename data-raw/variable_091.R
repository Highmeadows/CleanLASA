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

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  ptsd01 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd02 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd03 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd04 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd05 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd06 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd07 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd08 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd09 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd10 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd11 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd12 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd13 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd14 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd15 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd16 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd17 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd18 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd19 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd20 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd21 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd22 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  ),
  ptsd23 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "not at all",
    `2` = "somewhat",
    `3` = "considerably",
    `4` = "very much"
  )
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    ptsd01 = .replace_labels(
    standardized_value_labels$ptsd01,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd02 = .replace_labels(
    standardized_value_labels$ptsd02,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd03 = .replace_labels(
    standardized_value_labels$ptsd03,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd04 = .replace_labels(
    standardized_value_labels$ptsd04,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd05 = .replace_labels(
    standardized_value_labels$ptsd05,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd06 = .replace_labels(
    standardized_value_labels$ptsd06,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd07 = .replace_labels(
    standardized_value_labels$ptsd07,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd08 = .replace_labels(
    standardized_value_labels$ptsd08,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd09 = .replace_labels(
    standardized_value_labels$ptsd09,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd10 = .replace_labels(
    standardized_value_labels$ptsd10,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd11 = .replace_labels(
    standardized_value_labels$ptsd11,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd12 = .replace_labels(
    standardized_value_labels$ptsd12,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd13 = .replace_labels(
    standardized_value_labels$ptsd13,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd14 = .replace_labels(
    standardized_value_labels$ptsd14,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd15 = .replace_labels(
    standardized_value_labels$ptsd15,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd16 = .replace_labels(
    standardized_value_labels$ptsd16,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd17 = .replace_labels(
    standardized_value_labels$ptsd17,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd18 = .replace_labels(
    standardized_value_labels$ptsd18,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd19 = .replace_labels(
    standardized_value_labels$ptsd19,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd20 = .replace_labels(
    standardized_value_labels$ptsd20,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd21 = .replace_labels(
    standardized_value_labels$ptsd21,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd22 = .replace_labels(
    standardized_value_labels$ptsd22,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd23 = .replace_labels(
    standardized_value_labels$ptsd23,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    ptsd01 = .replace_labels(
    standardized_value_labels$ptsd01,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd02 = .replace_labels(
    standardized_value_labels$ptsd02,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd03 = .replace_labels(
    standardized_value_labels$ptsd03,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd04 = .replace_labels(
    standardized_value_labels$ptsd04,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd05 = .replace_labels(
    standardized_value_labels$ptsd05,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd06 = .replace_labels(
    standardized_value_labels$ptsd06,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd07 = .replace_labels(
    standardized_value_labels$ptsd07,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd08 = .replace_labels(
    standardized_value_labels$ptsd08,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd09 = .replace_labels(
    standardized_value_labels$ptsd09,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd10 = .replace_labels(
    standardized_value_labels$ptsd10,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd11 = .replace_labels(
    standardized_value_labels$ptsd11,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd12 = .replace_labels(
    standardized_value_labels$ptsd12,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd13 = .replace_labels(
    standardized_value_labels$ptsd13,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd14 = .replace_labels(
    standardized_value_labels$ptsd14,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd15 = .replace_labels(
    standardized_value_labels$ptsd15,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd16 = .replace_labels(
    standardized_value_labels$ptsd16,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd17 = .replace_labels(
    standardized_value_labels$ptsd17,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd18 = .replace_labels(
    standardized_value_labels$ptsd18,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd19 = .replace_labels(
    standardized_value_labels$ptsd19,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd20 = .replace_labels(
    standardized_value_labels$ptsd20,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd21 = .replace_labels(
    standardized_value_labels$ptsd21,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd22 = .replace_labels(
    standardized_value_labels$ptsd22,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
  ),
    ptsd23 = .replace_labels(
    standardized_value_labels$ptsd23,
    `-2` = "na, see D/ERMPTSD in LASAD/E291",
    `-1` = "na, asked"
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

.lasa_fc_091 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "091", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "091", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "091", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "091", waves = .lasa_wave_rows())
)
