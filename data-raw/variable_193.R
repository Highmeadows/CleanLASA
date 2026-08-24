## LASA filecode 193 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mhtbid = "number [id] of administered broadband srt test (second)",
  mhtbtime = "time of administration of broadband srt test (second)",
  mhtdate = "date administration srt tests",
  mhtday = "day hearing test",
  mhtmont = "month hearing test",
  mhtpc = "number of pc used to administer srt tests",
  mhtsid = "number [id] of administered smallband srt test (first)",
  mhtstime = "time of administration of smallband srt test (first)",
  mhtvol = "set volume of srt tests",
  mhtyear = "year hearing test",
  msrtnb = "speech-reception-threshold in noise (in decibel signal-to-noise ratio) of broadband srt test",
  msrtnbc = "categorized speech-reception-threshold in noise, broadband srt",
  msrtnbsd = "standard deviation of adaptive procedure broadband srt test",
  msrtns = "speech-reception-threshold in noise (in decibel signal-to-noise ratio) of smallband srt test",
  msrtnsc = "categorized speech-reception-threshold in noise, smallband srt",
  msrtnssd = "standard deviation of adaptive procedure smallband srt test",
  msrttn = "speech-reception-threshold (in dB)",
  msrttnc = "categorized speech-reception-threshold"
)

variable_labels_list <- list(
  Wave_E_labels = harmonized_labels[c("mhtday", "mhtmont", "mhtyear", "msrttn", "msrttnc")],
  Wave_F_labels = harmonized_labels[c("mhtday", "mhtmont", "mhtyear", "msrttn", "msrttnc")],
  Wave_G_labels = harmonized_labels[c(
    "mhtbid",
    "mhtbtime",
    "mhtdate",
    "mhtpc",
    "mhtsid",
    "mhtstime",
    "mhtvol",
    "msrtnb",
    "msrtnbc",
    "msrtnbsd",
    "msrtns",
    "msrtnsc",
    "msrtnssd"
  )],
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mhtbid = c(`-2` = "test not done"),
  mhtbtime = stats::setNames(character(0), character(0)),
  mhtdate = stats::setNames(character(0), character(0)),
  mhtday = c(`-2` = "test not done"),
  mhtmont = c(
    `-2` = "test not done",
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
  mhtpc = c(`-2` = "test not done"),
  mhtsid = c(`-2` = "test not done"),
  mhtstime = stats::setNames(character(0), character(0)),
  mhtvol = c(`-2` = "test not done"),
  mhtyear = c(`-2` = "test not done"),
  msrtnb = c(`-22` = "test not done"),
  msrtnbc = c(
    `-22` = "test not done",
    `1` = "good* hearing",
    `2` = "insufficient hearing",
    `3` = "poor hearing"
  ),
  msrtnbsd = c(`-22` = "test not done"),
  msrtns = c(`-22` = "test not done"),
  msrtnsc = c(
    `-22` = "test not done",
    `1` = "good* hearing",
    `2` = "insufficient hearing",
    `3` = "poor hearing"
  ),
  msrtnssd = c(`-22` = "test not done"),
  msrttn = c(
    `-24` = "non-valid, too many incomplete triplets",
    `-23` = "non-valid, aborted measurement",
    `-22` = "test not done",
    `-9.8` = NA_character_,
    `-9.2` = NA_character_,
    `5.71` = NA_character_,
    `6.36` = NA_character_,
    `8` = NA_character_
  ),
  msrttnc = c(
    `-4` = "non-valid, too many incomplete triplets",
    `-3` = "non-valid, aborted measurement",
    `-2` = "test not done",
    `1` = "sufficient* hearing",
    `2` = "insufficient hearing",
    `3` = "poor hearing"
  )
)

value_labels_list <- list(
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c("mhtday", "mhtmont", "mhtyear", "msrttn", "msrttnc")],
    msrttn = c(
    `-24` = "non-valid, too many incomplete triplets",
    `-23` = "non-valid, aborted measurement",
    `-22` = "test not done",
    `-9.2` = NA_character_,
    `5.71` = NA_character_,
    `6.36` = NA_character_
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c("mhtday", "mhtmont", "mhtyear", "msrttn", "msrttnc")],
    msrttn = c(
    `-24` = "non-valid, too many incomplete triplets",
    `-23` = "non-valid, aborted measurement",
    `-22` = "test not done",
    `-9.8` = NA_character_,
    `-9.2` = NA_character_,
    `6.36` = NA_character_,
    `8` = NA_character_
  )
  ),
  Wave_G_labels = standardized_value_labels[c(
    "mhtbid",
    "mhtpc",
    "mhtsid",
    "mhtvol",
    "msrtnb",
    "msrtnbc",
    "msrtnbsd",
    "msrtns",
    "msrtnsc",
    "msrtnssd"
  )],
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mhtbid = "text",
  mhtbtime = "text",
  mhtdate = "date",
  mhtday = "date",
  mhtmont = "date",
  mhtpc = "text",
  mhtsid = "text",
  mhtstime = "text",
  mhtvol = "numeric",
  mhtyear = "date",
  msrtnb = "numeric",
  msrtnbc = "categorical",
  msrtnbsd = "numeric",
  msrtns = "numeric",
  msrtnsc = "categorical",
  msrtnssd = "numeric",
  msrttn = "numeric",
  msrttnc = "categorical"
)

.lasa_fc_193 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "193", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "193", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "193", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "193", waves = .lasa_wave_rows())
)
