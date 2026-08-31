## LASA filecode 851 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  blage = "age at blood sampling",
  bldate = "date of blood sampling",
  mblacltg = "Blood: anti-clotting",
  mblcc = "Blood: cc",
  mblchemo = "Blood: chemotherapy",
  mblcmplt = "Blood: end",
  mbldrinkd = "Blood: drank something day",
  mbldrinkt = "Blood: drank something time",
  mbldrnk = "Blood: drank something",
  mblhphl = "Blood: hemophilia",
  mblinsul = "Blood: insulin",
  mblmeald = "Blood: last meal day",
  mblmealt = "Blood: last meal time",
  mblncomplt = "Blood: not complete specifics.",
  mbltime = "Time blood sample and questions: hours, minutes"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "mblacltg",
    "mblcc",
    "mblchemo",
    "mblcmplt",
    "mbldrinkd",
    "mbldrinkt",
    "mbldrnk",
    "mblhphl",
    "mblinsul",
    "mblmeald",
    "mblmealt",
    "mblncomplt",
    "mbltime"
  ),
  `C` = c(
    "blage",
    "bldate"
  ),
  `2B` = c(
    "blage",
    "bldate"
  ),
  `G` = c(
    "blage",
    "bldate"
  ),
  `3B` = c(
    "blage",
    "bldate"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    blage = "age at blood sampling C-wave",
    bldate = "date of blood sampling C-wave"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    blage = "age at blood sampling 2B-wave",
    bldate = "date of blood sampling 2B-wave"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    blage = "age at blood sampling G-wave",
    bldate = "date of blood sampling G-wave"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    blage = "age at blood sampling 3B-wave",
    bldate = "date of blood sampling 3B-wave"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  blage = stats::setNames(character(0), character(0)),
  bldate = stats::setNames(character(0), character(0)),
  mblacltg = stats::setNames(character(0), character(0)),
  mblcc = c(
    `-3` = "no blood, OSS",
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "10cc freezer",
    `2` = "hematology",
    `3` = "chemical"
  ),
  mblchemo = stats::setNames(character(0), character(0)),
  mblcmplt = c(
    `-3` = "no blood, OSS",
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "complete",
    `2` = "not complete"
  ),
  mbldrinkd = c(
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "today",
    `2` = "yesterday",
    `3` = "day before yesterday"
  ),
  mbldrinkt = c(
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "morning 7-12",
    `2` = "in between 12-13",
    `3` = "afternoon",
    `4` = "evening",
    `5` = "night"
  ),
  mbldrnk = c(
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mblhphl = c(
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mblinsul = stats::setNames(character(0), character(0)),
  mblmeald = c(
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "today",
    `2` = "yesterday",
    `3` = "day before yesterday"
  ),
  mblmealt = c(
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "morning 7-12",
    `2` = "in between 12-13",
    `3` = "afternoon",
    `4` = "evening",
    `5` = "night"
  ),
  mblncomplt = c(
    `-3` = "no blood, OSS",
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "refused",
    `2` = "sick",
    `3` = "fainted",
    `4` = "did not succeed",
    `5` = "no equipment",
    `6` = "refused by family",
    `7` = "refused by doctor",
    `8` = "area Oss",
    `9` = "other reason"
  ),
  mbltime = c(`-1` = "no valid data")
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Wave_C_labels = standardized_value_labels,
  Wave_2B_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_3B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  blage = "numeric",
  bldate = "date",
  mblacltg = "categorical",
  mblcc = "categorical",
  mblchemo = "categorical",
  mblcmplt = "categorical",
  mbldrinkd = "categorical",
  mbldrinkt = "categorical",
  mbldrnk = "categorical",
  mblhphl = "categorical",
  mblinsul = "categorical",
  mblmeald = "categorical",
  mblmealt = "categorical",
  mblncomplt = "categorical",
  mbltime = "text"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "851", waves = .lasa_wave_rows()) |>
    .override_label(wave = "3B", variable = "blage", override_value = "bmblage") |>
    .override_label(wave = "3B", variable = "bldate", override_value = "bmbldate"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "851", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "851", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "851", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["mblacltg"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mblchemo"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mblinsul"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["blage"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["bldate"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["blage"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["bldate"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["blage"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["bldate"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["blage"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["bldate"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)

.lasa_fc_851 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

