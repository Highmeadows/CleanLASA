## LASA filecode 233 -- variable names, variable labels, value labels,
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
  numberchildnonres = "numeric",
  numberchildres = "numeric",
  numbertasksalpha = "numeric",
  numbertaskschildnonres = "numeric",
  numbertaskschildres = "numeric",
  numbertasksfam = "numeric",
  numbertasksigwoth = "numeric",
  numbertasksneighbours = "numeric",
  numbertasksnurse = "numeric",
  numbertasksoth = "numeric",
  numbertaskspartner = "numeric",
  numbertaskspersonnel = "numeric",
  numbertasksprivate = "numeric",
  numbertasksvol = "numeric",
  totalalpha = "numeric",
  totalchildnonres = "numeric",
  totalchildres = "numeric",
  totalfam = "numeric",
  totaligwoth = "numeric",
  totalneighbours = "numeric",
  totalnurse = "numeric",
  totaloth = "numeric",
  totalpartner = "numeric",
  totalpersonnel = "numeric",
  totalprivate = "numeric",
  totalvol = "numeric"
)

# define variable labels ----
variable_labels(
  numberchildnonres = "Number of non-resident children",
  numberchildres = "Number of resident children",
  numbertasksalpha = "Number of tasks provided by elderly/home/alpha",
  numbertaskschildnonres = "Number of tasks provided by non-resident child",
  numbertaskschildres = "Number of tasks provided by resident child",
  numbertasksfam = "Number of tasks provided by non-resident other family",
  numbertasksigwoth = "Number of tasks provided by resident other",
  numbertasksneighbours = "Number of tasks provided by neighbours/friends/acquaintances",
  numbertasksnurse = "Number of tasks provided by district nurse",
  numbertasksoth = "Number of tasks provided by other",
  numbertaskspartner = "Number of tasks provided by partner",
  numbertaskspersonnel = "Number of tasks provided by personnel home/hospital",
  numbertasksprivate = "Number of tasks provided by private",
  numbertasksvol = "Number of tasks provided by volunteers",
  totalalpha = "Total number of elderly/home/alpha",
  totalchildnonres = "Total number of non-resident child",
  totalchildres = "Total number of resident child",
  totalfam = "Total number of non-resident other family",
  totaligwoth = "Total number of resident other",
  totalneighbours = "Total number of neighbours/friends/acquaintances",
  totalnurse = "Total number of district nurse",
  totaloth = "Total number of other",
  totalpartner = "Total number of partner",
  totalpersonnel = "Total number of personnel home/hospital",
  totalprivate = "Total number of private",
  totalvol = "Total number of volunteers",
  .applies_to_waves = c("Z")
)

variable_labels(
  numberchildnonres = "number of non-resident children",
  numberchildres = "number of resident children",
  numbertasksalpha = "number of tasks provided by elderly/home/alpha",
  numbertaskschildnonres = "number of tasks provided by non-resident child",
  numbertaskschildres = "number of tasks provided by resident child",
  numbertasksfam = "number of tasks provided by non-resident other family",
  numbertasksigwoth = "number of tasks provided by resident other",
  numbertasksneighbours = "number of tasks provided by neighbours/friends/acquaintances",
  numbertasksnurse = "number of tasks provided by district nurse",
  numbertasksoth = "number of tasks provided by other",
  numbertaskspartner = "number of tasks provided by partner",
  numbertaskspersonnel = "number of tasks provided by personnel home/hospital",
  numbertasksprivate = "number of tasks provided by private",
  numbertasksvol = "number of tasks provided by volunteers",
  totalalpha = "total number of elderly/home/alpha",
  totalchildnonres = "total number of non-resident child",
  totalchildres = "total number of resident child",
  totalfam = "total number of non-resident other family",
  totaligwoth = "total number of resident other",
  totalneighbours = "total number of neighbours/friends/acquaintances",
  totalnurse = "total number of district nurse",
  totaloth = "total number of other",
  totalpartner = "total number of partner",
  totalpersonnel = "total number of personnel home/hospital",
  totalprivate = "total number of private",
  totalvol = "total number of volunteers",
  .applies_to_waves = c("H")
)

# define value labels ----
value_labels(
  `-1` = "unknown",
  .applies_to_vars = c("totalalpha", "totalchildnonres", "totalchildres", "totalfam", "totaligwoth", "totalneighbours", "totalnurse", "totaloth", "totalpartner", "totalpersonnel", "totalprivate", "totalvol"),
  .applies_to_waves = c("Z", "H")
)

.lasa_fc_233 <- .lasa_finalize_fc("233")
.lasa_fc_233$variables <- .lasa_fc_233$variables |>
  .override_label(wave = "H", variable = "numberchildnonres", override_value = "numberchildnonres") |>
  .override_label(wave = "H", variable = "numberchildres", override_value = "numberchildres") |>
  .override_label(wave = "H", variable = "numbertasksalpha", override_value = "numbertasksalpha") |>
  .override_label(wave = "H", variable = "numbertaskschildnonres", override_value = "numbertaskschildnonres") |>
  .override_label(wave = "H", variable = "numbertaskschildres", override_value = "numbertaskschildres") |>
  .override_label(wave = "H", variable = "numbertasksfam", override_value = "numbertasksfam") |>
  .override_label(wave = "H", variable = "numbertasksigwoth", override_value = "numbertasksIgwoth") |>
  .override_label(wave = "H", variable = "numbertasksneighbours", override_value = "numbertasksneighbours") |>
  .override_label(wave = "H", variable = "numbertasksnurse", override_value = "numbertasksnurse") |>
  .override_label(wave = "H", variable = "numbertasksoth", override_value = "numbertasksoth") |>
  .override_label(wave = "H", variable = "numbertaskspartner", override_value = "numbertaskspartner") |>
  .override_label(wave = "H", variable = "numbertaskspersonnel", override_value = "numbertaskspersonnel") |>
  .override_label(wave = "H", variable = "numbertasksprivate", override_value = "numbertasksprivate") |>
  .override_label(wave = "H", variable = "numbertasksvol", override_value = "numbertasksvol") |>
  .override_label(wave = "H", variable = "totalalpha", override_value = "totalalpha") |>
  .override_label(wave = "H", variable = "totalchildnonres", override_value = "totalchildnonres") |>
  .override_label(wave = "H", variable = "totalchildres", override_value = "totalchildres") |>
  .override_label(wave = "H", variable = "totalfam", override_value = "totalfam") |>
  .override_label(wave = "H", variable = "totaligwoth", override_value = "totalIgwoth") |>
  .override_label(wave = "H", variable = "totalneighbours", override_value = "totalneighbours") |>
  .override_label(wave = "H", variable = "totalnurse", override_value = "totalnurse") |>
  .override_label(wave = "H", variable = "totaloth", override_value = "totaloth") |>
  .override_label(wave = "H", variable = "totalpartner", override_value = "totalpartner") |>
  .override_label(wave = "H", variable = "totalpersonnel", override_value = "totalpersonnel") |>
  .override_label(wave = "H", variable = "totalprivate", override_value = "totalprivate") |>
  .override_label(wave = "H", variable = "totalvol", override_value = "totalvol")

