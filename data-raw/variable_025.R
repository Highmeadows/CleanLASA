## LASA filecode 025 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  cesd01 = "Last week: bothered",
  cesd02 = "Last week: appetite",
  cesd03 = "Last week: blues",
  cesd04 = "Last week: good: positive",
  cesd05 = "Last week: mind",
  cesd06 = "Last week: depressed",
  cesd07 = "Last week: effort",
  cesd08 = "Last week: hopeful: positive",
  cesd09 = "Last week: failure",
  cesd10 = "Last week: fearful",
  cesd11 = "Last week: sleep",
  cesd12 = "Last week: happy: positive",
  cesd13 = "Last week: talk",
  cesd14 = "Last week: lonely",
  cesd15 = "Last week: unfriendly",
  cesd16 = "Last week: enjoy: positive",
  cesd17 = "Last week: cry",
  cesd18 = "Last week: sad",
  cesd19 = "Last week: dislike",
  cesd20 = "Last week: get going"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    cesd01 = "1. Last week: bothered",
    cesd02 = "2. Last week: appetite",
    cesd03 = "3. Last week: blues",
    cesd04 = "4. Last week: good: positive",
    cesd05 = "5. Last week: mind",
    cesd06 = "6. Last week: depressed",
    cesd07 = "7. Last week: effort",
    cesd08 = "8. Last week: hopeful: positive",
    cesd09 = "9. Last week: failure",
    cesd10 = "10. Last week: fearful",
    cesd11 = "11. Last week: sleep",
    cesd12 = "12. Last week: happy: positive",
    cesd13 = "13. Last week: talk",
    cesd14 = "14. Last week: lonely",
    cesd15 = "15. Last week: unfriendly",
    cesd16 = "16. Last week: enjoy: positive",
    cesd17 = "17. Last week: cry",
    cesd18 = "18. Last week: sad",
    cesd19 = "19. Last week: dislike",
    cesd20 = "20. Last week: get going"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  cesd01 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd02 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd03 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd04 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd05 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd06 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd07 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd08 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd09 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd10 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd11 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd12 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd13 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd14 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd15 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd16 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd17 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd18 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd19 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  ),
  cesd20 = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "rarely or never",
    `1` = "some of the time",
    `2` = "occasionally",
    `3` = "mostly or always"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    cesd01 = .replace_labels(
    standardized_value_labels$cesd01,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd02 = .replace_labels(
    standardized_value_labels$cesd02,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd03 = .replace_labels(
    standardized_value_labels$cesd03,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd04 = .replace_labels(
    standardized_value_labels$cesd04,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd05 = .replace_labels(
    standardized_value_labels$cesd05,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd06 = .replace_labels(
    standardized_value_labels$cesd06,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd07 = .replace_labels(
    standardized_value_labels$cesd07,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd08 = .replace_labels(
    standardized_value_labels$cesd08,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd09 = .replace_labels(
    standardized_value_labels$cesd09,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd10 = .replace_labels(
    standardized_value_labels$cesd10,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd11 = .replace_labels(
    standardized_value_labels$cesd11,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd12 = .replace_labels(
    standardized_value_labels$cesd12,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd13 = .replace_labels(
    standardized_value_labels$cesd13,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd14 = .replace_labels(
    standardized_value_labels$cesd14,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd15 = .replace_labels(
    standardized_value_labels$cesd15,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd16 = .replace_labels(
    standardized_value_labels$cesd16,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd17 = .replace_labels(
    standardized_value_labels$cesd17,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd18 = .replace_labels(
    standardized_value_labels$cesd18,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd19 = .replace_labels(
    standardized_value_labels$cesd19,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  ),
    cesd20 = .replace_labels(
    standardized_value_labels$cesd20,
    `-2` = "na, see B/C/D/E/B/F/G/H/B/B/I/J/KRMCESD in LAS(A)*225",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  cesd01 = "categorical",
  cesd02 = "categorical",
  cesd03 = "categorical",
  cesd04 = "categorical",
  cesd05 = "categorical",
  cesd06 = "categorical",
  cesd07 = "categorical",
  cesd08 = "categorical",
  cesd09 = "categorical",
  cesd10 = "categorical",
  cesd11 = "categorical",
  cesd12 = "categorical",
  cesd13 = "categorical",
  cesd14 = "categorical",
  cesd15 = "categorical",
  cesd16 = "categorical",
  cesd17 = "categorical",
  cesd18 = "categorical",
  cesd19 = "categorical",
  cesd20 = "categorical"
)

.lasa_fc_025 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "025", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "025", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "025", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "025", waves = .lasa_wave_rows())
)
