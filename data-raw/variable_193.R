## LASA filecode 193 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: give it its own variable_labels()/value_labels() calls
## (or add it to .applies_to_waves of an existing call sharing its text).
## To add a new variable: add it to var_types_vec, then declare its
## text/codes below.

# define variable types ----
## Every canonical variable name this filecode declares, and its
## collapsed type ("numeric"/"categorical"/"text"/"date"). Free order --
## matched by name everywhere below, never by position.
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

# define variable labels ----
variable_labels(
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
  msrttnc = "categorized speech-reception-threshold",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mhtday", "mhtmont", "mhtyear", "msrttn", "msrttnc",
  .applies_to_waves = c("E", "F")
)

variable_labels(
  "mhtbid", "mhtbtime", "mhtdate", "mhtpc", "mhtsid", "mhtstime", "mhtvol", "msrtnb", "msrtnbc", "msrtnbsd", "msrtns", "msrtnsc", "msrtnssd",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `-2` = "test not done",
  .applies_to_vars = c("mhtbid", "mhtpc", "mhtsid", "mhtvol"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-2` = "test not done",
  .applies_to_vars = c("mhtday", "mhtyear"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-2` = "test not done", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("mhtmont"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-22` = "test not done",
  .applies_to_vars = c("msrtnb", "msrtnbsd", "msrtns", "msrtnssd"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-22` = "test not done", `1` = "good* hearing", `2` = "insufficient hearing", `3` = "poor hearing",
  .applies_to_vars = c("msrtnbc", "msrtnsc"),
  .applies_to_waves = c("Z", "G")
)

value_labels(
  `-24` = "non-valid, too many incomplete triplets", `-23` = "non-valid, aborted measurement", `-22` = "test not done", `-9.8` = NA_character_, `-9.2` = NA_character_, `5.71` = NA_character_, `6.36` = NA_character_, `8` = NA_character_,
  .applies_to_vars = c("msrttn"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "non-valid, too many incomplete triplets", `-3` = "non-valid, aborted measurement", `-2` = "test not done", `1` = "sufficient* hearing", `2` = "insufficient hearing", `3` = "poor hearing",
  .applies_to_vars = c("msrttnc"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-24` = "non-valid, too many incomplete triplets", `-23` = "non-valid, aborted measurement", `-22` = "test not done", `-9.2` = NA_character_, `5.71` = NA_character_, `6.36` = NA_character_,
  .applies_to_vars = c("msrttn"),
  .applies_to_waves = c("E")
)

value_labels(
  `-24` = "non-valid, too many incomplete triplets", `-23` = "non-valid, aborted measurement", `-22` = "test not done", `-9.8` = NA_character_, `-9.2` = NA_character_, `6.36` = NA_character_, `8` = NA_character_,
  .applies_to_vars = c("msrttn"),
  .applies_to_waves = c("F")
)

.lasa_fc_193 <- .lasa_finalize_fc("193")

