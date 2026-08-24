## LASA filecode 153 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  malcage = "Age stopped drinking",
  malcagestop = "Age stopped",
  malcbeer = "Beer",
  malcbefore = "Drank before",
  malcd = "Number of days a week/month usage",
  malcgin = "Gin",
  malclig = "Light",
  malcliq = "Liqueur",
  malcmix = "Cocktail",
  malcnr = "Number of glasses at one time",
  malcnr6 = "Number of time six glasses or more",
  malctod = "Which time of day",
  malcupy = "Alcohol use for the past year",
  malcuse = "Use in past",
  malcw = "Other people worried about alcohol use",
  malcwine = "Wine",
  malcyn = "Do you drink alcohol"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
    "malcagestop",
    "malcbeer",
    "malcbefore",
    "malcd",
    "malcgin",
    "malclig",
    "malcliq",
    "malcmix",
    "malcnr",
    "malcnr6",
    "malctod",
    "malcwine",
    "malcyn"
  )],
    malcd = "Number of days a week",
    malcnr6 = "Number of times six glasses or more"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c("malcnr", "malcnr6", "malcupy", "malcyn")],
    malcnr = "number of glasses each time",
    malcnr6 = "number of times R 6 glasses a day past half year"
  ),
  Wave_D_labels = harmonized_labels[c("malcd", "malcnr", "malcnr6", "malcyn")],
  Wave_E_labels = harmonized_labels[c("malcd", "malcnr", "malcnr6", "malcyn")],
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
    "malcage",
    "malcbeer",
    "malcd",
    "malcgin",
    "malclig",
    "malcliq",
    "malcmix",
    "malcnr",
    "malcnr6",
    "malcuse",
    "malcwine",
    "malcyn"
  )],
    malcd = "Days a week usage"
  ),
  Wave_F_labels = harmonized_labels[c("malcd", "malcnr", "malcnr6", "malcyn")],
  Wave_G_labels = harmonized_labels[c("malcd", "malcnr", "malcnr6", "malcyn")],
  Wave_H_labels = harmonized_labels[c("malcd", "malcnr", "malcnr6", "malcw", "malcyn")],
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
    "malcage",
    "malcbeer",
    "malcd",
    "malcgin",
    "malclig",
    "malcliq",
    "malcmix",
    "malcnr",
    "malcnr6",
    "malcuse",
    "malcw",
    "malcwine",
    "malcyn"
  )],
    malcd = "Days a week usage",
    malcw = "Alcohol: other people worried about alcohol use"
  ),
  Wave_MB_labels = harmonized_labels[c("malcd", "malcnr", "malcyn")],
  Wave_I_labels = harmonized_labels[c("malcd", "malcnr", "malcnr6", "malcw", "malcyn")],
  Wave_J_labels = harmonized_labels[c("malcd", "malcnr", "malcnr6", "malcw", "malcyn")],
  Wave_K_labels = harmonized_labels[c("malcd", "malcnr", "malcnr6", "malcw", "malcyn")],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  malcage = c(`-2` = "na, see BMALCUSE", `-1` = "no answer, asked"),
  malcagestop = c(
    `-4` = "no valid data",
    `-3` = "R never drank",
    `-2` = "R drinks at present",
    `-1` = "no answer, asked"
  ),
  malcbeer = c(
    `-4` = "no valid data",
    `-2` = "R does not drink / na, see BMALCYN",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
  malcbefore = c(
    `-4` = "no valid data",
    `-2` = "R never drank",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
  malcd = c(
    `-4` = "no valid data",
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "less than 1 day a month"
  ),
  malcgin = c(
    `-4` = "no valid data",
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
  malclig = c(
    `-4` = "no valid data",
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
  malcliq = c(
    `-4` = "no valid data",
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
  malcmix = c(
    `-4` = "no valid data",
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
  malcnr = c(
    `-4` = "no valid data",
    `-3` = "R never drank / na, wrong skip",
    `-2` = "R drinks at present / na, see CMALCYN / R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
  malcnr6 = c(
    `-5` = "no valid data",
    `-4` = "R never drank",
    `-3` = "R drink/drank > 6 glasses / na, wrong skip",
    `-2` = "R drink/drank < 2 glasses / na, see CMACLNR / R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day / daily",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "less than 1 day a month / < 1 glass a month"
  ),
  malctod = c(
    `-4` = "no valid data",
    `-2` = "no answer, skipped",
    `-1` = "no answer, asked",
    `1` = "morning 7-12 hour",
    `2` = "afternoon 12-18 hour",
    `3` = "evening 18-24 hour",
    `4` = "night 0-7 hour"
  ),
  malcupy = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMALCYN",
    `-1` = "na, asked",
    `1` = "daily",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
  malcuse = c(`-2` = "na, see BMALCYN", `-1` = "no answer, asked", `1` = "no", `2` = "yes"),
  malcw = c(
    `-2` = "R does not drink / R does not drink 6 or more glasses at one time",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes, but not in past year",
    `3` = "yes, in past year"
  ),
  malcwine = c(
    `-4` = "no valid data",
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  ),
  malcyn = c(
    `-5` = "na, interview terminated",
    `-4` = "no valid data",
    `-2` = "no answer, skipped",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "malcagestop",
    "malcbeer",
    "malcbefore",
    "malcd",
    "malcgin",
    "malclig",
    "malcliq",
    "malcmix",
    "malcnr",
    "malcnr6",
    "malctod",
    "malcwine",
    "malcyn"
  )],
    malcbeer = .replace_labels(
    standardized_value_labels$malcbeer,
    `-2` = "R does not drink"
  ),
    malcnr = .replace_labels(
    standardized_value_labels$malcnr,
    `-3` = "R never drank",
    `-2` = "R drinks at present"
  ),
    malcnr6 = .replace_labels(
    standardized_value_labels$malcnr6,
    `-3` = "R drink/drank > 6 glasses",
    `-2` = "R drink/drank < 2 glasses",
    `1` = "every day",
    `6` = "less than 1 day a month"
  ),
    malcyn = c(
    `-4` = "no valid data",
    `-2` = "no answer, skipped",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c("malcnr", "malcnr6", "malcupy", "malcyn")],
    malcnr = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMALCYN",
    `-1` = "na, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMACLNR",
    `-1` = "na, asked",
    `1` = "daily",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "< 1 glass a month"
  ),
    malcyn = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c("malcd", "malcnr", "malcnr6", "malcyn")],
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("malcd", "malcnr", "malcnr6", "malcyn")],
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "malcage",
    "malcbeer",
    "malcd",
    "malcgin",
    "malclig",
    "malcliq",
    "malcmix",
    "malcnr",
    "malcnr6",
    "malcuse",
    "malcwine",
    "malcyn"
  )],
    malcbeer = c(`-2` = "na, see BMALCYN", `-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcgin = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malclig = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcliq = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcmix = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcwine = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("malcd", "malcnr", "malcnr6", "malcyn")],
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c("malcd", "malcnr", "malcnr6", "malcyn")],
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c("malcd", "malcnr", "malcnr6", "malcw", "malcyn")],
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcw = .replace_labels(
    standardized_value_labels$malcw,
    `-2` = "R does not drink"
  ),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "malcage",
    "malcbeer",
    "malcd",
    "malcgin",
    "malclig",
    "malcliq",
    "malcmix",
    "malcnr",
    "malcnr6",
    "malcuse",
    "malcw",
    "malcwine",
    "malcyn"
  )],
    malcbeer = c(`-2` = "na, see BMALCYN", `-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcgin = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malclig = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcliq = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcmix = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcw = .replace_labels(
    standardized_value_labels$malcw,
    `-2` = "R does not drink 6 or more glasses at one time"
  ),
    malcwine = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels[c("malcd", "malcnr", "malcyn")],
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c("malcd", "malcnr", "malcnr6", "malcw", "malcyn")],
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcw = .replace_labels(
    standardized_value_labels$malcw,
    `-2` = "R does not drink"
  ),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c("malcd", "malcnr", "malcnr6", "malcw", "malcyn")],
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcw = .replace_labels(
    standardized_value_labels$malcw,
    `-2` = "R does not drink"
  ),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c("malcd", "malcnr", "malcnr6", "malcw", "malcyn")],
    malcd = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcnr = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "11 glasses or more",
    `2` = "8-10 glasses",
    `3` = "6-7 glasses",
    `4` = "4-5 glasses",
    `5` = "2-3 glasses",
    `6` = "1 glass"
  ),
    malcnr6 = c(
    `-2` = "R does not drink",
    `-1` = "no answer, asked",
    `1` = "every day",
    `2` = "5-6 days a week",
    `3` = "3-4 days a week",
    `4` = "1-2 days a week",
    `5` = "1-3 days a month",
    `6` = "<1 day a month"
  ),
    malcw = .replace_labels(
    standardized_value_labels$malcw,
    `-2` = "R does not drink"
  ),
    malcyn = c(`-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  malcage = "numeric",
  malcagestop = "numeric",
  malcbeer = "categorical",
  malcbefore = "categorical",
  malcd = "categorical",
  malcgin = "categorical",
  malclig = "categorical",
  malcliq = "categorical",
  malcmix = "categorical",
  malcnr = "categorical",
  malcnr6 = "categorical",
  malctod = "categorical",
  malcupy = "categorical",
  malcuse = "categorical",
  malcw = "categorical",
  malcwine = "categorical",
  malcyn = "categorical"
)

.lasa_fc_153 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "153", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "153", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "153", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "153", waves = .lasa_wave_rows())
)
