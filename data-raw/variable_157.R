## LASA filecode 157 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mcontra = "contrast: total score low-high",
  mctglas = "during test: glasses or contact lenses",
  mctglcl = "contrast test: with glasses or contact lenses",
  mctinch = "contrast: inch",
  mctley1 = "contrast: left eye A",
  mctley2 = "contrast: left eye B",
  mctley3 = "contrast: left eye C",
  mctley4 = "contrast: left eye D",
  mctley5 = "contrast: left eye E",
  mctpart = "participation with contrast test",
  mctrey1 = "contrast: right eye A",
  mctrey2 = "contrast: right eye B",
  mctrey3 = "contrast: right eye C",
  mctrey4 = "contrast: right eye D",
  mctrey5 = "contrast: right eye E",
  mctrm = "reason contrast test not done",
  mctunde = "understanding of contrast test",
  mdasig1 = "Daily sight: see better cloudy vs sunny weather",
  mdasig2 = "Daily sight: blinded on clear day",
  mdasig3 = "Daily sight: blinded by indoor/outdoor",
  mdasig4 = "Daily sight: see bicycles and cars approaching",
  mdasig5 = "Daily sight: regularly do not see doors and chairs",
  mdasig6 = "Daily sight: regularly do not see floor related objects",
  meyetes = "Eye contrast test done: constructed",
  mlecont = "left eye: total score low-high",
  mricont = "right eye: total score low-high"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "mcontra",
    "mctinch",
    "mctley1",
    "mctley2",
    "mctley3",
    "mctley4",
    "mctley5",
    "mctpart",
    "mctrey1",
    "mctrey2",
    "mctrey3",
    "mctrey4",
    "mctrey5",
    "mctunde",
    "mdasig1",
    "mdasig2",
    "mdasig3",
    "mlecont",
    "mricont"
  ),
  `C` = c(
    "mctglas",
    "mctinch",
    "mctley1",
    "mctley2",
    "mctley3",
    "mctley4",
    "mctley5",
    "mctpart",
    "mctrey1",
    "mctrey2",
    "mctrey3",
    "mctrey4",
    "mctrey5",
    "mctrm",
    "mctunde",
    "mdasig1",
    "mdasig2",
    "mdasig3",
    "meyetes"
  ),
  `D` = c(
    "mctglcl",
    "mctinch",
    "mctley1",
    "mctley2",
    "mctley3",
    "mctley4",
    "mctley5",
    "mctpart",
    "mctrey1",
    "mctrey2",
    "mctrey3",
    "mctrey4",
    "mctrey5",
    "mctunde",
    "mdasig1",
    "mdasig2",
    "mdasig3",
    "mdasig4",
    "mdasig5",
    "mdasig6"
  ),
  `E` = c(
    "mdasig1",
    "mdasig2",
    "mdasig3",
    "mdasig4",
    "mdasig5",
    "mdasig6"
  ),
  `2B` = c(
    "mdasig1",
    "mdasig2",
    "mdasig3",
    "mdasig4",
    "mdasig5",
    "mdasig6"
  ),
  `F` = c(
    "mdasig1",
    "mdasig2",
    "mdasig3",
    "mdasig4",
    "mdasig5",
    "mdasig6"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    mdasig1 = "weather: cloudy",
    mdasig2 = "weather: clear sky",
    mdasig3 = "sight: blinded by indoor/outdoor"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    mdasig1 = "weather: cloudy",
    mdasig2 = "weather: clear sky",
    mdasig3 = "weather: blinded by indoor/outdoor"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    mctinch = "contast test: inch",
    mctley1 = "contrast test: left eye A",
    mctley2 = "contrast test: left eye B",
    mctley3 = "contrast test: left eye C",
    mctley4 = "contrast test: left eye D",
    mctley5 = "contrast test: left eye E",
    mctrey1 = "contrast test: right eye A",
    mctrey2 = "contrast test: right eye B",
    mctrey3 = "contrast test: right eye C",
    mctrey4 = "contrast test: right eye D",
    mctrey5 = "contrast test: right eye E",
    mdasig3 = "Daily sight: blinded when indoor/outdoor"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    mdasig3 = "Daily sight: blinded when indoor/outdoor"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    mdasig3 = "Daily sight: blinded when indoor/outdoor"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    mdasig3 = "Daily sight: blinded when indoor/outdoor"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  mcontra = c(`-1` = "no valid data"),
  mctglas = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see CMEYETES",
    `1` = "none",
    `2` = "glasses",
    `3` = "contact lenses"
  ),
  mctglcl = c(
    default_missing_labels[c("-1")],
    `1` = "none",
    `2` = "glasses",
    `3` = "contact lenses"
  ),
  mctinch = c(
    `-3` = "no valid data / na, wrong skip",
    `-2` = "no measurement done / na, see CMEYETES",
    `-1` = "no answer, asked / no measurement",
    `1` = "30cm",
    `2` = "32cm",
    `3` = "40cm",
    `4` = "18inch [ca 46 cm]"
  ),
  mctley1 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctley2 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctley3 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctley4 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctley5 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctpart = stats::setNames(character(0), character(0)),
  mctrey1 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctrey2 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctrey3 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctrey4 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctrey5 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked / no measurement"
  ),
  mctrm = c(
    `-2` = "na, see CMEYETES",
    `4` = "refused",
    `5` = "not able to [cognitive]",
    `6` = "not able to [physical]",
    `7` = "technical problems",
    `8` = "unknown"
  ),
  mctunde = c(
    `-3` = "no valid data / na, wrong skip",
    `-2` = "no measurement done / na, see CMEYETES",
    default_missing_labels[c("-1")],
    `1` = "excellent",
    `2` = "good",
    `3` = "moderate",
    `4` = "bad",
    `5` = "refused",
    `6` = "other reason",
    `10` = "other: not done",
    `20` = "other: not able to: phys",
    `30` = "other: not able to: cogn",
    `40` = "other: not done: technical"
  ),
  mdasig1 = c(
    `-3` = "no valid data",
    `-2` = "no measurement done",
    default_missing_labels[c("-1")],
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
  mdasig2 = c(
    `-3` = "no valid data",
    `-2` = "no measurement done",
    default_missing_labels[c("-1")],
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
  mdasig3 = c(
    `-3` = "no valid data",
    `-2` = "no measurement done",
    default_missing_labels[c("-1")],
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
  mdasig4 = c(
    default_missing_labels[c("-1")],
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
  mdasig5 = c(
    default_missing_labels[c("-1")],
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
  mdasig6 = c(
    default_missing_labels[c("-1")],
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
  meyetes = c(`1` = "done", `2` = "not done", `3` = "no right eye", `4` = "no left eye", `5` = "terminated"),
  mlecont = c(`-1` = "no valid data"),
  mricont = c(`-1` = "no valid data")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    mctinch = c(`-3` = "no valid data", `-2` = "no measurement done", `-1` = "no answer, asked"),
    mctunde = c(
    `-3` = "no valid data",
    `-2` = "no measurement done",
    `-1` = "no answer, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "moderate",
    `4` = "bad",
    `5` = "refused",
    `6` = "other reason"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mctinch = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMEYETES",
    `1` = "30cm",
    `2` = "32cm",
    `3` = "40cm",
    `4` = "18inch [ca 46 cm]"
  ),
    mctley1 = .replace_labels(
    standardized_value_labels$mctley1,
    `-1` = "na, asked"
  ),
    mctley2 = .replace_labels(
    standardized_value_labels$mctley2,
    `-1` = "na, asked"
  ),
    mctley3 = .replace_labels(
    standardized_value_labels$mctley3,
    `-1` = "na, asked"
  ),
    mctley4 = .replace_labels(
    standardized_value_labels$mctley4,
    `-1` = "na, asked"
  ),
    mctley5 = .replace_labels(
    standardized_value_labels$mctley5,
    `-1` = "na, asked"
  ),
    mctrey1 = .replace_labels(
    standardized_value_labels$mctrey1,
    `-1` = "na, asked"
  ),
    mctrey2 = .replace_labels(
    standardized_value_labels$mctrey2,
    `-1` = "na, asked"
  ),
    mctrey3 = .replace_labels(
    standardized_value_labels$mctrey3,
    `-1` = "na, asked"
  ),
    mctrey4 = .replace_labels(
    standardized_value_labels$mctrey4,
    `-1` = "na, asked"
  ),
    mctrey5 = .replace_labels(
    standardized_value_labels$mctrey5,
    `-1` = "na, asked"
  ),
    mctunde = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMEYETES",
    `-1` = "na, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "moderate",
    `4` = "bad",
    `10` = "other: not done",
    `20` = "other: not able to: phys",
    `30` = "other: not able to: cogn",
    `40` = "other: not done: technical"
  ),
    mdasig1 = c(
    `-3` = "no valid data",
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig2 = c(
    `-3` = "no valid data",
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig3 = c(
    `-3` = "no valid data",
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    mctinch = c(`-1` = "no measurement"),
    mctley1 = c(`-1` = "no measurement"),
    mctley2 = c(`-1` = "no measurement"),
    mctley3 = c(`-1` = "no measurement"),
    mctley4 = c(`-1` = "no measurement"),
    mctley5 = c(`-1` = "no measurement"),
    mctrey1 = c(`-1` = "no measurement"),
    mctrey2 = c(`-1` = "no measurement"),
    mctrey3 = c(`-1` = "no measurement"),
    mctrey4 = c(`-1` = "no measurement"),
    mctrey5 = c(`-1` = "no measurement"),
    mctunde = c(
    `-2` = "no measurement done",
    `-1` = "no answer, asked",
    `1` = "excellent",
    `2` = "good",
    `3` = "moderate",
    `4` = "bad",
    `5` = "refused",
    `6` = "other reason"
  ),
    mdasig1 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig2 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig3 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    mdasig1 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig2 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig3 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    mdasig1 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig2 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig3 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    mdasig1 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig2 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  ),
    mdasig3 = c(
    `-1` = "no answer, asked",
    `1` = "rarely",
    `2` = "sometimes",
    `3` = "often",
    `4` = "almost always"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mcontra = "numeric",
  mctglas = "categorical",
  mctglcl = "categorical",
  mctinch = "categorical",
  mctley1 = "numeric",
  mctley2 = "numeric",
  mctley3 = "numeric",
  mctley4 = "numeric",
  mctley5 = "numeric",
  mctpart = "text",
  mctrey1 = "numeric",
  mctrey2 = "numeric",
  mctrey3 = "numeric",
  mctrey4 = "numeric",
  mctrey5 = "numeric",
  mctrm = "categorical",
  mctunde = "categorical",
  mdasig1 = "categorical",
  mdasig2 = "categorical",
  mdasig3 = "categorical",
  mdasig4 = "categorical",
  mdasig5 = "categorical",
  mdasig6 = "categorical",
  meyetes = "categorical",
  mlecont = "numeric",
  mricont = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "157", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "157", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "157", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "157", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["mctley1"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctley2"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctley3"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctley4"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctley5"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctpart"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctrey1"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctrey2"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctrey3"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctrey4"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctrey5"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mctpart"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mctpart"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)

.lasa_fc_157 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

