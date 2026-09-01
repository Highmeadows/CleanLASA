## LASA filecode 863 -- variable names, variable labels, value labels,
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
  mbiotes = "numeric",
  mest = "numeric",
  mfsh = "numeric",
  mftc = "numeric",
  mftcp = "numeric",
  mlh = "numeric",
  mshbg = "numeric",
  mtes = "numeric",
  mtes_ng = "numeric"
)

# define variable labels ----
variable_labels(
  mbiotes = "bioavailable testosterone",
  mest = "total estradiol (pmol/l)",
  mfsh = "follicle-stimulating hormone (u/l)",
  mftc = "free fraction testosterone",
  mftcp = "percentage free fraction testosterone",
  mlh = "luteinizing hormone (u/l)",
  mshbg = "sex hormone binding globulin (nmol/l)",
  mtes = "total testosterone (nmol/l)",
  mtes_ng = "total testosterone (ng/dl)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mbiotes", "mest", "mfsh", "mftc", "mftcp", "mlh", "mshbg", "mtes", "mtes_ng",
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-3` = "incorrect value", `-2` = "no data, woman", `-1` = "no determination",
  .applies_to_vars = c("mest", "mfsh", "mlh", "mtes", "mtes_ng"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "no data, see MTES", `-1` = "not calculated, insufficient data",
  .applies_to_vars = c("mbiotes", "mftc", "mftcp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mshbg"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "no data, see CMTES", `-1` = "not calculated, insufficient data",
  .applies_to_vars = c("mbiotes", "mftc", "mftcp"),
  .applies_to_waves = c("C")
)

.lasa_fc_863 <- .lasa_finalize_fc("863")

