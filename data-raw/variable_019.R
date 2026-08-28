## LASA filecode 019 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  incdclm = "Moment of (major) decline: month",
  incdcly = "Moment of (major) decline: year",
  incdecl = "Net monthly decline in income",
  incfutu = "Next two years income: increase/decrease",
  incsat1 = "Satisfaction with income level",
  incsat2 = "Satisfaction with income and living standard"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "incdecl",
    "incfutu",
    "incsat1",
    "incsat2"
  ),
  `C` = c(
    "incdclm",
    "incdcly",
    "incdecl",
    "incfutu",
    "incsat1",
    "incsat2"
  ),
  `D` = c(
    "incdclm",
    "incdcly",
    "incdecl",
    "incfutu",
    "incsat1",
    "incsat2"
  ),
  `E` = c(
    "incsat1",
    "incsat2"
  ),
  `2B` = c(
    "incdecl",
    "incsat1",
    "incsat2"
  ),
  `F` = c(
    "incsat1",
    "incsat2"
  ),
  `G` = c(
    "incdclm",
    "incdcly",
    "incdecl",
    "incsat1",
    "incsat2"
  ),
  `H` = c(
    "incdclm",
    "incdcly",
    "incdecl",
    "incsat1",
    "incsat2"
  ),
  `3B` = c(
    "incdclm",
    "incdcly",
    "incdecl",
    "incsat1",
    "incsat2"
  ),
  `MB` = c(
    "incdecl",
    "incsat1",
    "incsat2"
  ),
  `I` = c(
    "incdclm",
    "incdcly",
    "incdecl",
    "incsat1",
    "incsat2"
  ),
  `J` = c(
    "incdclm",
    "incdcly",
    "incdecl",
    "incsat1",
    "incsat2"
  ),
  `K` = c(
    "incdclm",
    "incdcly",
    "incdecl",
    "incsat1",
    "incsat2"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    incdecl = "Income decline last 5 years net/month (in Dutch Guilders)"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    incdclm = "moment of (major) decline: month",
    incdcly = "moment of (major) decline: year",
    incdecl = "net monthly decline in income last 3 years (in Dutch Guilders)",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    incdclm = "moment of (major) decline: month",
    incdcly = "moment of (major) decline: year",
    incdecl = "net monthly decline in income last 3 years (in Dutch Guilders)",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    incdecl = "net monthly decline in income last 5 years",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    incdclm = "moment of (major) decline: month",
    incdcly = "moment of (major) decline: year",
    incdecl = "net monthly decline in income last 3 years",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    incdclm = "moment of (major) decline: month",
    incdcly = "moment of (major) decline: year",
    incdecl = "net monthly decline in income last 3 years",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    incdclm = "moment of (major) decline: month",
    incdcly = "moment of (major) decline: year",
    incdecl = "net monthly decline in income last 5 years",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    incdecl = "net monthly decline in income last 5 years",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    incdclm = "moment of (major) decline: month",
    incdcly = "moment of (major) decline: year",
    incdecl = "net monthly decline in income last 3 years",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    incdclm = "moment of (major) decline: month",
    incdcly = "moment of (major) decline: year",
    incdecl = "net monthly decline in income last 3 years",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    incdclm = "moment of (major) decline: month",
    incdcly = "moment of (major) decline: year",
    incdecl = "net monthly decline in income last 3 years",
    incsat1 = "satisfaction with income level",
    incsat2 = "satisfaction with income and living standard"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  incdclm = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "january",
    `2` = "february",
    `3` = "march",
    `4` = "april",
    `5` = "may",
    `6` = "june",
    `7` = "july",
    `8` = "august",
    `9` = "september",
    `10` = "october",
    `11` = "november",
    `12` = "december"
  ),
  incdcly = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  incdecl = c(
    `-6` = "not available, refused",
    `-5` = "not available, refused",
    default_missing_labels[c("-4", "-3", "-2")],
    `-1` = "not available",
    `1` = "no",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "label varies by wave",
    `8` = "yes, do not know how many"
  ),
  incfutu = c(
    default_missing_labels[c("-4", "-1")],
    `1` = "decrease",
    `2` = "same",
    `3` = "increase"
  ),
  incsat1 = c(
    `-6` = "not available, refused",
    `-5` = "not available, refused",
    default_missing_labels[c("-4", "-3")],
    `-1` = "not available",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
  incsat2 = c(
    `-6` = "not available, refused",
    `-5` = "not available, refused",
    default_missing_labels[c("-4", "-3")],
    `-1` = "not available",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    incdecl = c(
    `-6` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, do not know",
    `1` = "no",
    `2` = "yes, < ƒ 100",
    `3` = "yes, ƒ 100 - 200",
    `4` = "yes, ƒ 200 - 300",
    `5` = "yes, ƒ 300 - 400",
    `6` = "yes, ƒ 400 - 500",
    `7` = "yes, > ƒ 500"
  ),
    incfutu = .replace_labels(
    standardized_value_labels$incfutu,
    `-4` = "na, short version"
  ),
    incsat1 = c(
    `-6` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, do not know",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-6` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, do not know",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    incdclm = .replace_labels(
    standardized_value_labels$incdclm,
    `-2` = "na, see C/DINCDECL",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    incdcly = .replace_labels(
    standardized_value_labels$incdcly,
    `-2` = "na, see C/DINCDECL"
  ),
    incdecl = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, < ƒ 100",
    `3` = "yes, ƒ 100 - 200",
    `4` = "yes, ƒ 200 - 300",
    `5` = "yes, ƒ 300 - 400",
    `6` = "yes, ƒ 400 - 500",
    `7` = "yes, ƒ 500 >",
    `8` = "yes, do not know how many"
  ),
    incfutu = .replace_labels(
    standardized_value_labels$incfutu,
    `-4` = "na, short version",
    `2` = "stays the same"
  ),
    incsat1 = c(
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    incdclm = .replace_labels(
    standardized_value_labels$incdclm,
    `-2` = "na, see C/DINCDECL",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    incdcly = .replace_labels(
    standardized_value_labels$incdcly,
    `-2` = "na, see C/DINCDECL"
  ),
    incdecl = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, < ƒ 100",
    `3` = "yes, ƒ 100 - 200",
    `4` = "yes, ƒ 200 - 300",
    `5` = "yes, ƒ 300 - 400",
    `6` = "yes, ƒ 400 - 500",
    `7` = "yes, ƒ 500 >",
    `8` = "yes, do not know how many"
  ),
    incfutu = .replace_labels(
    standardized_value_labels$incfutu,
    `-4` = "na, short version",
    `2` = "stays the same"
  ),
    incsat1 = c(
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    incsat1 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    incdecl = c(
    `-5` = "na, refusal",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "no",
    `2` = "yes, < 45,45 euro",
    `3` = "yes, 45,45 - 90,90 euro",
    `4` = "yes, 90,90 - 136,36 euro",
    `5` = "yes, 136,36 - 181,81 euro",
    `6` = "yes, 181,81 - 227,27 euro",
    `7` = "yes, > 227,27 euro",
    `8` = "yes, do not know how many"
  ),
    incsat1 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    incsat1 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    incdclm = .replace_labels(
    standardized_value_labels$incdclm,
    `-2` = "na, see G/H/I/J/KINCDECL",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    incdcly = .replace_labels(
    standardized_value_labels$incdcly,
    `-2` = "na, see G/H/I/J/KINCDECL"
  ),
    incdecl = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, < 45 euro",
    `3` = "yes, 45 - 136 euro",
    `4` = "yes, 136 - 227 euro",
    `5` = "yes, 227 - 318 euro",
    `6` = "yes, 318 - 410 euro",
    `7` = "yes, > 410 euro"
  ),
    incsat1 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    incdclm = .replace_labels(
    standardized_value_labels$incdclm,
    `-2` = "na, see G/H/I/J/KINCDECL",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    incdcly = .replace_labels(
    standardized_value_labels$incdcly,
    `-2` = "na, see G/H/I/J/KINCDECL"
  ),
    incdecl = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, < 45 euro",
    `3` = "yes, 45 - 136 euro",
    `4` = "yes, 136 - 227 euro",
    `5` = "yes, 227 - 318 euro",
    `6` = "yes, 318 - 410 euro",
    `7` = "yes, > 410 euro"
  ),
    incsat1 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    incdclm = c(`-3` = "na, wrong skip", `-2` = "na, see BINCDECL", `-1` = "na, asked"),
    incdcly = .replace_labels(
    standardized_value_labels$incdcly,
    `-2` = "na, see BINCDECL"
  ),
    incdecl = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, < 45 euro",
    `3` = "yes, 45 - 136 euro",
    `4` = "yes, 136 - 227 euro",
    `5` = "yes, 227 - 318 euro",
    `6` = "yes, 318 - 410 euro",
    `7` = "yes, > 410 euro"
  ),
    incsat1 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    incdecl = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, < 45 euro",
    `3` = "yes, 45 - 136 euro",
    `4` = "yes, 136 - 227 euro",
    `5` = "yes, 227 - 318 euro",
    `6` = "yes, 318 - 410 euro",
    `7` = "yes, > 410 euro"
  ),
    incsat1 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    incdclm = .replace_labels(
    standardized_value_labels$incdclm,
    `-2` = "na, see G/H/I/J/KINCDECL",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    incdcly = .replace_labels(
    standardized_value_labels$incdcly,
    `-2` = "na, see G/H/I/J/KINCDECL"
  ),
    incdecl = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, < 45 euro",
    `3` = "yes, 45 - 136 euro",
    `4` = "yes, 136 - 227 euro",
    `5` = "yes, 227 - 318 euro",
    `6` = "yes, 318 - 410 euro",
    `7` = "yes, > 410 euro"
  ),
    incsat1 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    incdclm = .replace_labels(
    standardized_value_labels$incdclm,
    `-2` = "na, see G/H/I/J/KINCDECL",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    incdcly = .replace_labels(
    standardized_value_labels$incdcly,
    `-2` = "na, see G/H/I/J/KINCDECL"
  ),
    incdecl = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, < 45 euro",
    `3` = "yes, 45 - 136 euro",
    `4` = "yes, 136 - 227 euro",
    `5` = "yes, 227 - 318 euro",
    `6` = "yes, 318 - 410 euro",
    `7` = "yes, > 410 euro"
  ),
    incsat1 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    incdclm = .replace_labels(
    standardized_value_labels$incdclm,
    `-2` = "na, see G/H/I/J/KINCDECL",
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
    incdcly = .replace_labels(
    standardized_value_labels$incdcly,
    `-2` = "na, see G/H/I/J/KINCDECL"
  ),
    incdecl = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "no answer, routing",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, < 45 euro",
    `3` = "yes, 45 - 136 euro",
    `4` = "yes, 136 - 227 euro",
    `5` = "yes, 227 - 318 euro",
    `6` = "yes, 318 - 410 euro",
    `7` = "yes, > 410 euro"
  ),
    incsat1 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  ),
    incsat2 = c(
    `-5` = "na, refused",
    `-4` = "na, short version",
    `-1` = "na, asked",
    `1` = "dissatisfied",
    `2` = "a little dissatisfied",
    `3` = "not dissatisfied/satisfied",
    `4` = "a little satisfied",
    `5` = "satisfied"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  incdclm = "date",
  incdcly = "date",
  incdecl = "categorical",
  incfutu = "categorical",
  incsat1 = "categorical",
  incsat2 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "019", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "019", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "019", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "019", waves = .lasa_wave_rows())
)

.lasa_fc_019 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

