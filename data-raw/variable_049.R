## LASA filecode 049 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  nwmem = "network ID grandchild (f047)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "chid", "gcadvic", "gcage", "gcbaby", "gcfreq", "gcfreqp", "gcfun", "gcid", "gcsex", "gcstay", "gcstep", "nwmem",
  .applies_to_waves = c("F")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("gcadvic", "gcbaby", "gcfreq", "gcfreqp", "gcfun", "gcstay"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-4` = "not asked(age<17)", `-3` = "not asked(age?)", `1` = "never", `2` = "seldom", `3` = "sometimes", `4` = "often",
  .applies_to_vars = c("gcadvic", "gcfun"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "unknown", `0` = "0 years old",
  .applies_to_vars = c("gcage"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-4` = "not asked(age>16)", `-3` = "not asked(age?)", `1` = "never", `2` = "seldom", `3` = "sometimes", `4` = "often",
  .applies_to_vars = c("gcbaby", "gcstay"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-2` = "no contact(broken)", `1` = "never", `2` = "once a year/less", `3` = "few times a year", `4` = "once a month", `5` = "once a fortnight", `6` = "once a week", `7` = "few times a week", `8` = "each day",
  .applies_to_vars = c("gcfreq", "gcfreqp"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "unknown", `1` = "grandchild", `2` = "granddaughter",
  .applies_to_vars = c("gcsex"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "unknown", `1` = "biological", `2` = "step", `3` = "adoptive",
  .applies_to_vars = c("gcstep"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-2` = "<18 yrs old", `-1` = "not identifiable", `0` = "not identified",
  .applies_to_vars = c("nwmem"),
  .applies_to_waves = c("Z", "F")
)

.lasa_fc_049 <- .lasa_finalize_fc("049")

