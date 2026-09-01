## LASA filecode z991 -- variable names, variable labels, value labels,
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
  zdeceas17 = "categorical",
  zdedate_y = "numeric",
  zecdl = "text",
  zecdmi = "text",
  zpcod = "text",
  zscod1 = "text",
  zscod2 = "text",
  zscod3 = "text"
)

# define variable labels ----
variable_labels(
  zdeceas17 = "respondent deceased before 2018",
  zdedate_y = "date of death, year part",
  zecdl = "external cause of death: location",
  zecdmi = "external cause of death: main injury",
  zpcod = "primary cause of death",
  zscod1 = "first secondary cause of death",
  zscod2 = "second secondary cause of death",
  zscod3 = "third secondary cause of death",
  .applies_to_waves = c("Z")
)

variable_labels(
  "zdeceas17", "zdedate_y", "zecdl", "zecdmi", "zpcod", "zscod1", "zscod2", "zscod3",
  .applies_to_waves = c("B")
)

# define value labels ----
value_labels(
  `-2` = "no data, see gbadata", `0` = "no", `1` = "yes",
  .applies_to_vars = c("zdeceas17"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no data, see deceas",
  .applies_to_vars = c("zdedate_y"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not deceased (before 2018)", `-4` = "deceased abroad / no gbadata", `-3` = "cause unknown / no matching (LASA/CBS)", `-2` = "no data CBS asked (no LASA data)", `-1` = "no informed consent for enquiry",
  .applies_to_vars = c("zpcod"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no data, see GBADATA", `0` = "no", `1` = "yes",
  .applies_to_vars = c("zdeceas17"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no data, see DECEAS",
  .applies_to_vars = c("zdedate_y"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "not deceased (before 2018)", `-4` = "deceased abroad / no GBADATA", `-3` = "cause unknown / no matching (LASA/CBS)", `-2` = "no data CBS asked (no LASA data)", `-1` = "no informed consent for enquiry",
  .applies_to_vars = c("zpcod"),
  .applies_to_waves = c("B")
)

.lasa_fc_z991 <- .lasa_finalize_fc("z991")
.lasa_fc_z991$variables <- .lasa_fc_z991$variables |>
  .override_label(wave = "B", variable = "zdeceas17", override_value = "zdeceas17") |>
  .override_label(wave = "B", variable = "zdedate_y", override_value = "zdedate_y") |>
  .override_label(wave = "B", variable = "zecdl", override_value = "zecdl") |>
  .override_label(wave = "B", variable = "zecdmi", override_value = "zecdmi") |>
  .override_label(wave = "B", variable = "zpcod", override_value = "zpcod") |>
  .override_label(wave = "B", variable = "zscod1", override_value = "zscod1") |>
  .override_label(wave = "B", variable = "zscod2", override_value = "zscod2") |>
  .override_label(wave = "B", variable = "zscod3", override_value = "zscod3")

