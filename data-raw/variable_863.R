## LASA filecode 863 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mbiotes = "bioavailable testosterone",
  mest = "total estradiol (pmol/l)",
  mfsh = "follicle-stimulating hormone (u/l)",
  mftc = "free fraction testosterone",
  mftcp = "percentage free fraction testosterone",
  mlh = "luteinizing hormone (u/l)",
  mshbg = "sex hormone binding globulin (nmol/l)",
  mtes = "total testosterone (nmol/l)",
  mtes_ng = "total testosterone (ng/dl)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `C` = c(
    "mbiotes",
    "mest",
    "mfsh",
    "mftc",
    "mftcp",
    "mlh",
    "mshbg",
    "mtes",
    "mtes_ng"
  )
)

variable_labels_list <- list(
  Wave_C_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mbiotes = c(`-2` = "no data, see MTES", `-1` = "not calculated, insufficient data"),
  mest = c(`-3` = "incorrect value", `-2` = "no data, woman", `-1` = "no determination"),
  mfsh = c(`-3` = "incorrect value", `-2` = "no data, woman", `-1` = "no determination"),
  mftc = c(`-2` = "no data, see MTES", `-1` = "not calculated, insufficient data"),
  mftcp = c(`-2` = "no data, see MTES", `-1` = "not calculated, insufficient data"),
  mlh = c(`-3` = "incorrect value", `-2` = "no data, woman", `-1` = "no determination"),
  mshbg = c(`-1` = "no valid data"),
  mtes = c(`-3` = "incorrect value", `-2` = "no data, woman", `-1` = "no determination"),
  mtes_ng = c(`-3` = "incorrect value", `-2` = "no data, woman", `-1` = "no determination")
)

value_labels_list <- list(
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mbiotes = .replace_labels(
    standardized_value_labels$mbiotes,
    `-2` = "no data, see CMTES"
  ),
    mftc = .replace_labels(
    standardized_value_labels$mftc,
    `-2` = "no data, see CMTES"
  ),
    mftcp = .replace_labels(
    standardized_value_labels$mftcp,
    `-2` = "no data, see CMTES"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "863", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "863", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "863", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "863", waves = .lasa_wave_rows())
)

.lasa_fc_863 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

