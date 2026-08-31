## LASA filecode 049 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  chid = "child ID (f048)",
  gcadvic = "grandchild asked for advice",
  gcage = "age grandchild",
  gcbaby = "babysitted during last year?",
  gcfreq = "frequency contact",
  gcfreqp = "frequency contact voluntary/pleasure",
  gcfun = "voluntary visits by grandchild",
  gcid = "grandchild ID",
  gcsex = "grandson or granddaughter",
  gcstay = "grandchild stayed with R?",
  gcstep = "own, step, adoptive grandchild?",
  nwmem = "network ID grandchild (f047)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `F` = c(
    "chid",
    "gcadvic",
    "gcage",
    "gcbaby",
    "gcfreq",
    "gcfreqp",
    "gcfun",
    "gcid",
    "gcsex",
    "gcstay",
    "gcstep",
    "nwmem"
  )
)

variable_labels_list <- list(
  Wave_F_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  chid = stats::setNames(character(0), character(0)),
  gcadvic = c(
    `-4` = "not asked(age<17)",
    `-3` = "not asked(age?)",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often"
  ),
  gcage = c(`-1` = "unknown", `0` = "0 years old"),
  gcbaby = c(
    `-4` = "not asked(age>16)",
    `-3` = "not asked(age?)",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often"
  ),
  gcfreq = c(
    `-2` = "no contact(broken)",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "once a year/less",
    `3` = "few times a year",
    `4` = "once a month",
    `5` = "once a fortnight",
    `6` = "once a week",
    `7` = "few times a week",
    `8` = "each day"
  ),
  gcfreqp = c(
    `-2` = "no contact(broken)",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "once a year/less",
    `3` = "few times a year",
    `4` = "once a month",
    `5` = "once a fortnight",
    `6` = "once a week",
    `7` = "few times a week",
    `8` = "each day"
  ),
  gcfun = c(
    `-4` = "not asked(age<17)",
    `-3` = "not asked(age?)",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often"
  ),
  gcid = stats::setNames(character(0), character(0)),
  gcsex = c(`-1` = "unknown", `1` = "grandchild", `2` = "granddaughter"),
  gcstay = c(
    `-4` = "not asked(age>16)",
    `-3` = "not asked(age?)",
    default_missing_labels[c("-1")],
    `1` = "never",
    `2` = "seldom",
    `3` = "sometimes",
    `4` = "often"
  ),
  gcstep = c(`-1` = "unknown", `1` = "biological", `2` = "step", `3` = "adoptive"),
  nwmem = c(`-2` = "<18 yrs old", `-1` = "not identifiable", `0` = "not identified")
)

value_labels_list <- list(
  Wave_F_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  chid = "text",
  gcadvic = "categorical",
  gcage = "numeric",
  gcbaby = "categorical",
  gcfreq = "categorical",
  gcfreqp = "categorical",
  gcfun = "categorical",
  gcid = "text",
  gcsex = "categorical",
  gcstay = "categorical",
  gcstep = "categorical",
  nwmem = "text"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "049", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "049", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "049", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "049", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["chid"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["gcid"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)

.lasa_fc_049 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

