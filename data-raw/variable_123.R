## LASA filecode 123 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  qdpq01 = "DPQ 01: bad temper",
  qdpq02 = "DPQ 02: wander off",
  qdpq03 = "DPQ 03: strangers",
  qdpq04 = "DPQ 04: control",
  qdpq05 = "DPQ 05: nervous",
  qdpq06 = "DPQ 06: people",
  qdpq07 = "DPQ 07: humour",
  qdpq08 = "DPQ 08: contact",
  qdpq09 = "DPQ 09: feeling down",
  qdpq10 = "DPQ 10: receptions",
  qdpq11 = "DPQ 11: small matters",
  qdpq12 = "DPQ 12: shy",
  qdpq13 = "DPQ 13: different",
  qdpq14 = "DPQ 14: new friends",
  qdpq15 = "DPQ 15: useless",
  qdpq16 = "DPQ 16: background",
  qdpq17 = "DPQ 17: tension",
  qdpq18 = "DPQ 18: influence",
  qdpq19 = "DPQ 19: regret",
  qdpq20 = "DPQ 20: restlessness",
  qdpq21 = "DPQ 21: surrounded",
  qdpq22 = "DPQ 22: hate",
  qdpq23 = "DPQ 23: shy 2",
  qdpq24 = "DPQ 24: difficult",
  qdpq25 = "DPQ 25: inconvenience"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  qdpq01 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq02 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq03 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq04 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq05 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq06 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq07 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq08 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq09 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq10 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq11 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq12 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq13 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq14 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq15 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq16 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq17 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq18 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq19 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq20 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq21 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq22 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq23 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq24 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable"),
  qdpq25 = c(`-1` = "not available", `1` = "applicable", `2` = "?", `3` = "not applicable")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    qdpq01 = .replace_labels(
    standardized_value_labels$qdpq01,
    `-1` = "no answer"
  ),
    qdpq02 = .replace_labels(
    standardized_value_labels$qdpq02,
    `-1` = "no answer"
  ),
    qdpq03 = .replace_labels(
    standardized_value_labels$qdpq03,
    `-1` = "no answer"
  ),
    qdpq04 = .replace_labels(
    standardized_value_labels$qdpq04,
    `-1` = "no answer"
  ),
    qdpq05 = .replace_labels(
    standardized_value_labels$qdpq05,
    `-1` = "no answer"
  ),
    qdpq06 = .replace_labels(
    standardized_value_labels$qdpq06,
    `-1` = "no answer"
  ),
    qdpq07 = .replace_labels(
    standardized_value_labels$qdpq07,
    `-1` = "no answer"
  ),
    qdpq08 = .replace_labels(
    standardized_value_labels$qdpq08,
    `-1` = "no answer"
  ),
    qdpq09 = .replace_labels(
    standardized_value_labels$qdpq09,
    `-1` = "no answer"
  ),
    qdpq10 = .replace_labels(
    standardized_value_labels$qdpq10,
    `-1` = "no answer"
  ),
    qdpq11 = .replace_labels(
    standardized_value_labels$qdpq11,
    `-1` = "no answer"
  ),
    qdpq12 = .replace_labels(
    standardized_value_labels$qdpq12,
    `-1` = "no answer"
  ),
    qdpq13 = .replace_labels(
    standardized_value_labels$qdpq13,
    `-1` = "no answer"
  ),
    qdpq14 = .replace_labels(
    standardized_value_labels$qdpq14,
    `-1` = "no answer"
  ),
    qdpq15 = .replace_labels(
    standardized_value_labels$qdpq15,
    `-1` = "no answer"
  ),
    qdpq16 = .replace_labels(
    standardized_value_labels$qdpq16,
    `-1` = "no answer"
  ),
    qdpq17 = .replace_labels(
    standardized_value_labels$qdpq17,
    `-1` = "no answer"
  ),
    qdpq18 = .replace_labels(
    standardized_value_labels$qdpq18,
    `-1` = "no answer"
  ),
    qdpq19 = .replace_labels(
    standardized_value_labels$qdpq19,
    `-1` = "no answer"
  ),
    qdpq20 = .replace_labels(
    standardized_value_labels$qdpq20,
    `-1` = "no answer"
  ),
    qdpq21 = .replace_labels(
    standardized_value_labels$qdpq21,
    `-1` = "no answer"
  ),
    qdpq22 = .replace_labels(
    standardized_value_labels$qdpq22,
    `-1` = "no answer"
  ),
    qdpq23 = .replace_labels(
    standardized_value_labels$qdpq23,
    `-1` = "no answer"
  ),
    qdpq24 = .replace_labels(
    standardized_value_labels$qdpq24,
    `-1` = "no answer"
  ),
    qdpq25 = .replace_labels(
    standardized_value_labels$qdpq25,
    `-1` = "no answer"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    qdpq01 = .replace_labels(
    standardized_value_labels$qdpq01,
    `-1` = "no answer"
  ),
    qdpq02 = .replace_labels(
    standardized_value_labels$qdpq02,
    `-1` = "no answer"
  ),
    qdpq03 = .replace_labels(
    standardized_value_labels$qdpq03,
    `-1` = "no answer"
  ),
    qdpq04 = .replace_labels(
    standardized_value_labels$qdpq04,
    `-1` = "no answer"
  ),
    qdpq05 = .replace_labels(
    standardized_value_labels$qdpq05,
    `-1` = "no answer"
  ),
    qdpq06 = .replace_labels(
    standardized_value_labels$qdpq06,
    `-1` = "no answer"
  ),
    qdpq07 = .replace_labels(
    standardized_value_labels$qdpq07,
    `-1` = "no answer"
  ),
    qdpq08 = .replace_labels(
    standardized_value_labels$qdpq08,
    `-1` = "no answer"
  ),
    qdpq09 = .replace_labels(
    standardized_value_labels$qdpq09,
    `-1` = "no answer"
  ),
    qdpq10 = .replace_labels(
    standardized_value_labels$qdpq10,
    `-1` = "no answer"
  ),
    qdpq11 = .replace_labels(
    standardized_value_labels$qdpq11,
    `-1` = "no answer"
  ),
    qdpq12 = .replace_labels(
    standardized_value_labels$qdpq12,
    `-1` = "no answer"
  ),
    qdpq13 = .replace_labels(
    standardized_value_labels$qdpq13,
    `-1` = "no answer"
  ),
    qdpq14 = .replace_labels(
    standardized_value_labels$qdpq14,
    `-1` = "no answer"
  ),
    qdpq15 = .replace_labels(
    standardized_value_labels$qdpq15,
    `-1` = "no answer"
  ),
    qdpq16 = .replace_labels(
    standardized_value_labels$qdpq16,
    `-1` = "no answer"
  ),
    qdpq17 = .replace_labels(
    standardized_value_labels$qdpq17,
    `-1` = "no answer"
  ),
    qdpq18 = .replace_labels(
    standardized_value_labels$qdpq18,
    `-1` = "no answer"
  ),
    qdpq19 = .replace_labels(
    standardized_value_labels$qdpq19,
    `-1` = "no answer"
  ),
    qdpq20 = .replace_labels(
    standardized_value_labels$qdpq20,
    `-1` = "no answer"
  ),
    qdpq21 = .replace_labels(
    standardized_value_labels$qdpq21,
    `-1` = "no answer"
  ),
    qdpq22 = .replace_labels(
    standardized_value_labels$qdpq22,
    `-1` = "no answer"
  ),
    qdpq23 = .replace_labels(
    standardized_value_labels$qdpq23,
    `-1` = "no answer"
  ),
    qdpq24 = .replace_labels(
    standardized_value_labels$qdpq24,
    `-1` = "no answer"
  ),
    qdpq25 = .replace_labels(
    standardized_value_labels$qdpq25,
    `-1` = "no answer"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    qdpq01 = .replace_labels(
    standardized_value_labels$qdpq01,
    `-1` = "no answer"
  ),
    qdpq02 = .replace_labels(
    standardized_value_labels$qdpq02,
    `-1` = "no answer"
  ),
    qdpq03 = .replace_labels(
    standardized_value_labels$qdpq03,
    `-1` = "no answer"
  ),
    qdpq04 = .replace_labels(
    standardized_value_labels$qdpq04,
    `-1` = "no answer"
  ),
    qdpq05 = .replace_labels(
    standardized_value_labels$qdpq05,
    `-1` = "no answer"
  ),
    qdpq06 = .replace_labels(
    standardized_value_labels$qdpq06,
    `-1` = "no answer"
  ),
    qdpq07 = .replace_labels(
    standardized_value_labels$qdpq07,
    `-1` = "no answer"
  ),
    qdpq08 = .replace_labels(
    standardized_value_labels$qdpq08,
    `-1` = "no answer"
  ),
    qdpq09 = .replace_labels(
    standardized_value_labels$qdpq09,
    `-1` = "no answer"
  ),
    qdpq10 = .replace_labels(
    standardized_value_labels$qdpq10,
    `-1` = "no answer"
  ),
    qdpq11 = .replace_labels(
    standardized_value_labels$qdpq11,
    `-1` = "no answer"
  ),
    qdpq12 = .replace_labels(
    standardized_value_labels$qdpq12,
    `-1` = "no answer"
  ),
    qdpq13 = .replace_labels(
    standardized_value_labels$qdpq13,
    `-1` = "no answer"
  ),
    qdpq14 = .replace_labels(
    standardized_value_labels$qdpq14,
    `-1` = "no answer"
  ),
    qdpq15 = .replace_labels(
    standardized_value_labels$qdpq15,
    `-1` = "no answer"
  ),
    qdpq16 = .replace_labels(
    standardized_value_labels$qdpq16,
    `-1` = "no answer"
  ),
    qdpq17 = .replace_labels(
    standardized_value_labels$qdpq17,
    `-1` = "no answer"
  ),
    qdpq18 = .replace_labels(
    standardized_value_labels$qdpq18,
    `-1` = "no answer"
  ),
    qdpq19 = .replace_labels(
    standardized_value_labels$qdpq19,
    `-1` = "no answer"
  ),
    qdpq20 = .replace_labels(
    standardized_value_labels$qdpq20,
    `-1` = "no answer"
  ),
    qdpq21 = .replace_labels(
    standardized_value_labels$qdpq21,
    `-1` = "no answer"
  ),
    qdpq22 = .replace_labels(
    standardized_value_labels$qdpq22,
    `-1` = "no answer"
  ),
    qdpq23 = .replace_labels(
    standardized_value_labels$qdpq23,
    `-1` = "no answer"
  ),
    qdpq24 = .replace_labels(
    standardized_value_labels$qdpq24,
    `-1` = "no answer"
  ),
    qdpq25 = .replace_labels(
    standardized_value_labels$qdpq25,
    `-1` = "no answer"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    qdpq01 = .replace_labels(
    standardized_value_labels$qdpq01,
    `-1` = "no answer"
  ),
    qdpq02 = .replace_labels(
    standardized_value_labels$qdpq02,
    `-1` = "no answer"
  ),
    qdpq03 = .replace_labels(
    standardized_value_labels$qdpq03,
    `-1` = "no answer"
  ),
    qdpq04 = .replace_labels(
    standardized_value_labels$qdpq04,
    `-1` = "no answer"
  ),
    qdpq05 = .replace_labels(
    standardized_value_labels$qdpq05,
    `-1` = "no answer"
  ),
    qdpq06 = .replace_labels(
    standardized_value_labels$qdpq06,
    `-1` = "no answer"
  ),
    qdpq07 = .replace_labels(
    standardized_value_labels$qdpq07,
    `-1` = "no answer"
  ),
    qdpq08 = .replace_labels(
    standardized_value_labels$qdpq08,
    `-1` = "no answer"
  ),
    qdpq09 = .replace_labels(
    standardized_value_labels$qdpq09,
    `-1` = "no answer"
  ),
    qdpq10 = .replace_labels(
    standardized_value_labels$qdpq10,
    `-1` = "no answer"
  ),
    qdpq11 = .replace_labels(
    standardized_value_labels$qdpq11,
    `-1` = "no answer"
  ),
    qdpq12 = .replace_labels(
    standardized_value_labels$qdpq12,
    `-1` = "no answer"
  ),
    qdpq13 = .replace_labels(
    standardized_value_labels$qdpq13,
    `-1` = "no answer"
  ),
    qdpq14 = .replace_labels(
    standardized_value_labels$qdpq14,
    `-1` = "no answer"
  ),
    qdpq15 = .replace_labels(
    standardized_value_labels$qdpq15,
    `-1` = "no answer"
  ),
    qdpq16 = .replace_labels(
    standardized_value_labels$qdpq16,
    `-1` = "no answer"
  ),
    qdpq17 = .replace_labels(
    standardized_value_labels$qdpq17,
    `-1` = "no answer"
  ),
    qdpq18 = .replace_labels(
    standardized_value_labels$qdpq18,
    `-1` = "no answer"
  ),
    qdpq19 = .replace_labels(
    standardized_value_labels$qdpq19,
    `-1` = "no answer"
  ),
    qdpq20 = .replace_labels(
    standardized_value_labels$qdpq20,
    `-1` = "no answer"
  ),
    qdpq21 = .replace_labels(
    standardized_value_labels$qdpq21,
    `-1` = "no answer"
  ),
    qdpq22 = .replace_labels(
    standardized_value_labels$qdpq22,
    `-1` = "no answer"
  ),
    qdpq23 = .replace_labels(
    standardized_value_labels$qdpq23,
    `-1` = "no answer"
  ),
    qdpq24 = .replace_labels(
    standardized_value_labels$qdpq24,
    `-1` = "no answer"
  ),
    qdpq25 = .replace_labels(
    standardized_value_labels$qdpq25,
    `-1` = "no answer"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    qdpq01 = .replace_labels(
    standardized_value_labels$qdpq01,
    `-1` = "no answer"
  ),
    qdpq02 = .replace_labels(
    standardized_value_labels$qdpq02,
    `-1` = "no answer"
  ),
    qdpq03 = .replace_labels(
    standardized_value_labels$qdpq03,
    `-1` = "no answer"
  ),
    qdpq04 = .replace_labels(
    standardized_value_labels$qdpq04,
    `-1` = "no answer"
  ),
    qdpq05 = .replace_labels(
    standardized_value_labels$qdpq05,
    `-1` = "no answer"
  ),
    qdpq06 = .replace_labels(
    standardized_value_labels$qdpq06,
    `-1` = "no answer"
  ),
    qdpq07 = .replace_labels(
    standardized_value_labels$qdpq07,
    `-1` = "no answer"
  ),
    qdpq08 = .replace_labels(
    standardized_value_labels$qdpq08,
    `-1` = "no answer"
  ),
    qdpq09 = .replace_labels(
    standardized_value_labels$qdpq09,
    `-1` = "no answer"
  ),
    qdpq10 = .replace_labels(
    standardized_value_labels$qdpq10,
    `-1` = "no answer"
  ),
    qdpq11 = .replace_labels(
    standardized_value_labels$qdpq11,
    `-1` = "no answer"
  ),
    qdpq12 = .replace_labels(
    standardized_value_labels$qdpq12,
    `-1` = "no answer"
  ),
    qdpq13 = .replace_labels(
    standardized_value_labels$qdpq13,
    `-1` = "no answer"
  ),
    qdpq14 = .replace_labels(
    standardized_value_labels$qdpq14,
    `-1` = "no answer"
  ),
    qdpq15 = .replace_labels(
    standardized_value_labels$qdpq15,
    `-1` = "no answer"
  ),
    qdpq16 = .replace_labels(
    standardized_value_labels$qdpq16,
    `-1` = "no answer"
  ),
    qdpq17 = .replace_labels(
    standardized_value_labels$qdpq17,
    `-1` = "no answer"
  ),
    qdpq18 = .replace_labels(
    standardized_value_labels$qdpq18,
    `-1` = "no answer"
  ),
    qdpq19 = .replace_labels(
    standardized_value_labels$qdpq19,
    `-1` = "no answer"
  ),
    qdpq20 = .replace_labels(
    standardized_value_labels$qdpq20,
    `-1` = "no answer"
  ),
    qdpq21 = .replace_labels(
    standardized_value_labels$qdpq21,
    `-1` = "no answer"
  ),
    qdpq22 = .replace_labels(
    standardized_value_labels$qdpq22,
    `-1` = "no answer"
  ),
    qdpq23 = .replace_labels(
    standardized_value_labels$qdpq23,
    `-1` = "no answer"
  ),
    qdpq24 = .replace_labels(
    standardized_value_labels$qdpq24,
    `-1` = "no answer"
  ),
    qdpq25 = .replace_labels(
    standardized_value_labels$qdpq25,
    `-1` = "no answer"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    qdpq01 = .replace_labels(
    standardized_value_labels$qdpq01,
    `-1` = "no answer"
  ),
    qdpq02 = .replace_labels(
    standardized_value_labels$qdpq02,
    `-1` = "no answer"
  ),
    qdpq03 = .replace_labels(
    standardized_value_labels$qdpq03,
    `-1` = "no answer"
  ),
    qdpq04 = .replace_labels(
    standardized_value_labels$qdpq04,
    `-1` = "no answer"
  ),
    qdpq05 = .replace_labels(
    standardized_value_labels$qdpq05,
    `-1` = "no answer"
  ),
    qdpq06 = .replace_labels(
    standardized_value_labels$qdpq06,
    `-1` = "no answer"
  ),
    qdpq07 = .replace_labels(
    standardized_value_labels$qdpq07,
    `-1` = "no answer"
  ),
    qdpq08 = .replace_labels(
    standardized_value_labels$qdpq08,
    `-1` = "no answer"
  ),
    qdpq09 = .replace_labels(
    standardized_value_labels$qdpq09,
    `-1` = "no answer"
  ),
    qdpq10 = .replace_labels(
    standardized_value_labels$qdpq10,
    `-1` = "no answer"
  ),
    qdpq11 = .replace_labels(
    standardized_value_labels$qdpq11,
    `-1` = "no answer"
  ),
    qdpq12 = .replace_labels(
    standardized_value_labels$qdpq12,
    `-1` = "no answer"
  ),
    qdpq13 = .replace_labels(
    standardized_value_labels$qdpq13,
    `-1` = "no answer"
  ),
    qdpq14 = .replace_labels(
    standardized_value_labels$qdpq14,
    `-1` = "no answer"
  ),
    qdpq15 = .replace_labels(
    standardized_value_labels$qdpq15,
    `-1` = "no answer"
  ),
    qdpq16 = .replace_labels(
    standardized_value_labels$qdpq16,
    `-1` = "no answer"
  ),
    qdpq17 = .replace_labels(
    standardized_value_labels$qdpq17,
    `-1` = "no answer"
  ),
    qdpq18 = .replace_labels(
    standardized_value_labels$qdpq18,
    `-1` = "no answer"
  ),
    qdpq19 = .replace_labels(
    standardized_value_labels$qdpq19,
    `-1` = "no answer"
  ),
    qdpq20 = .replace_labels(
    standardized_value_labels$qdpq20,
    `-1` = "no answer"
  ),
    qdpq21 = .replace_labels(
    standardized_value_labels$qdpq21,
    `-1` = "no answer"
  ),
    qdpq22 = .replace_labels(
    standardized_value_labels$qdpq22,
    `-1` = "no answer"
  ),
    qdpq23 = .replace_labels(
    standardized_value_labels$qdpq23,
    `-1` = "no answer"
  ),
    qdpq24 = .replace_labels(
    standardized_value_labels$qdpq24,
    `-1` = "no answer"
  ),
    qdpq25 = .replace_labels(
    standardized_value_labels$qdpq25,
    `-1` = "no answer"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  qdpq01 = "categorical",
  qdpq02 = "categorical",
  qdpq03 = "categorical",
  qdpq04 = "categorical",
  qdpq05 = "categorical",
  qdpq06 = "categorical",
  qdpq07 = "categorical",
  qdpq08 = "categorical",
  qdpq09 = "categorical",
  qdpq10 = "categorical",
  qdpq11 = "categorical",
  qdpq12 = "categorical",
  qdpq13 = "categorical",
  qdpq14 = "categorical",
  qdpq15 = "categorical",
  qdpq16 = "categorical",
  qdpq17 = "categorical",
  qdpq18 = "categorical",
  qdpq19 = "categorical",
  qdpq20 = "categorical",
  qdpq21 = "categorical",
  qdpq22 = "categorical",
  qdpq23 = "categorical",
  qdpq24 = "categorical",
  qdpq25 = "categorical"
)

.lasa_fc_123 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "123", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "123", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "123", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "123", waves = .lasa_wave_rows())
)
