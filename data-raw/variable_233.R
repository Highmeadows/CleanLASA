## LASA filecode 233 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  totalvol = "Total number of volunteers"
)

variable_labels_list <- list(
  Wave_H_labels = .replace_labels(
    harmonized_labels,
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
    totalvol = "total number of volunteers"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  numberchildnonres = stats::setNames(character(0), character(0)),
  numberchildres = stats::setNames(character(0), character(0)),
  numbertasksalpha = stats::setNames(character(0), character(0)),
  numbertaskschildnonres = stats::setNames(character(0), character(0)),
  numbertaskschildres = stats::setNames(character(0), character(0)),
  numbertasksfam = stats::setNames(character(0), character(0)),
  numbertasksigwoth = stats::setNames(character(0), character(0)),
  numbertasksneighbours = stats::setNames(character(0), character(0)),
  numbertasksnurse = stats::setNames(character(0), character(0)),
  numbertasksoth = stats::setNames(character(0), character(0)),
  numbertaskspartner = stats::setNames(character(0), character(0)),
  numbertaskspersonnel = stats::setNames(character(0), character(0)),
  numbertasksprivate = stats::setNames(character(0), character(0)),
  numbertasksvol = stats::setNames(character(0), character(0)),
  totalalpha = c(`-1` = "unknown"),
  totalchildnonres = c(`-1` = "unknown"),
  totalchildres = c(`-1` = "unknown"),
  totalfam = c(`-1` = "unknown"),
  totaligwoth = c(`-1` = "unknown"),
  totalneighbours = c(`-1` = "unknown"),
  totalnurse = c(`-1` = "unknown"),
  totaloth = c(`-1` = "unknown"),
  totalpartner = c(`-1` = "unknown"),
  totalpersonnel = c(`-1` = "unknown"),
  totalprivate = c(`-1` = "unknown"),
  totalvol = c(`-1` = "unknown")
)

value_labels_list <- list(
  Wave_H_labels = standardized_value_labels[c(
    "totalalpha",
    "totalchildnonres",
    "totalchildres",
    "totalfam",
    "totaligwoth",
    "totalneighbours",
    "totalnurse",
    "totaloth",
    "totalpartner",
    "totalpersonnel",
    "totalprivate",
    "totalvol"
  )],
  Harmonized_labels = standardized_value_labels
)

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

.lasa_fc_233 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "233", waves = .lasa_wave_rows()) |>
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
    .override_label(wave = "H", variable = "totalvol", override_value = "totalvol"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "233", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "233", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "233", waves = .lasa_wave_rows())
)
