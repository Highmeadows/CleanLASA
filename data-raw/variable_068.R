## LASA filecode 068 -- variable names, variable labels, value labels,
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
  mcarc1 = "categorical",
  mcarc2 = "categorical",
  mcarc3 = "categorical",
  mcarc4 = "categorical",
  mcarc5 = "categorical",
  mcarc6 = "categorical",
  mcarr01 = "categorical",
  mcarr02 = "categorical",
  mcarr03 = "categorical",
  mcarr04 = "categorical",
  mcarr05 = "categorical",
  mcarr06 = "categorical",
  mcarr07 = "categorical",
  mcarr08 = "categorical",
  mcarr09 = "categorical",
  mcarr10 = "categorical"
)

# define variable labels ----
variable_labels(
  mcarc1 = "Medical care: contact with pharmacy",
  mcarc2 = "Medical care: contact with physician or specialist",
  mcarc3 = "Medical care: contact with hospital or health centre",
  mcarc4 = "Medical care: contact with dentist",
  mcarc5 = "Medical care: contact with alternative or traditional healer",
  mcarc6 = "Medical care: contact with other",
  mcarr01 = "Medical care reason: new complaint / sickness during stay",
  mcarr02 = "Medical care reason: dissatisfaction about care in the Netherlands",
  mcarr03 = "Medical care reason: severity of the complaint during stay",
  mcarr04 = "Medical care reason: no language barriers with physician or specialist",
  mcarr05 = "Medical care reason: periodic consultation / health check",
  mcarr06 = "Medical care reason: to buy medicines not prescribed in the Netherlands",
  mcarr07 = "Medical care reason: to buy medicines not available in the Netherlands",
  mcarr08 = "Medical care reason: cheaper in country of origin",
  mcarr09 = "Medical care reason: because of the waiting lists in the Netherlands",
  mcarr10 = "Medical care reason: other",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mcarc1", "mcarc2", "mcarc3", "mcarc4", "mcarc5", "mcarc6", "mcarr01", "mcarr02", "mcarr03", "mcarr04", "mcarr05", "mcarr06", "mcarr07", "mcarr08", "mcarr09", "mcarr10",
  .applies_to_waves = c("MB")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("mcarc1", "mcarc2", "mcarc3", "mcarc4", "mcarc5", "mcarc6", "mcarr01", "mcarr02", "mcarr03", "mcarr04", "mcarr05", "mcarr06", "mcarr07", "mcarr08", "mcarr09", "mcarr10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcarc1", "mcarc2", "mcarc3", "mcarc4", "mcarc5", "mcarc6", "mcarr01", "mcarr02", "mcarr03", "mcarr04", "mcarr05", "mcarr06", "mcarr07", "mcarr08", "mcarr09", "mcarr10"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-2` = "na, see BMCARCO",
  .applies_to_vars = c("mcarc1", "mcarc2", "mcarc3", "mcarc4", "mcarc5", "mcarc6", "mcarr01", "mcarr02", "mcarr03", "mcarr04", "mcarr05", "mcarr06", "mcarr07", "mcarr08", "mcarr09", "mcarr10"),
  .applies_to_waves = c("MB")
)

.lasa_fc_068 <- .lasa_finalize_fc("068")

