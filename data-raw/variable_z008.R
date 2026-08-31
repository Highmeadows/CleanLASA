## LASA filecode z008 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  age = "age at interview",
  days = "age at interview in days",
  mage = "age at medical interview",
  mdays = "age at medical interview in days",
  t_dat = "interview date",
  tm_dat = "medical interview date"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `A` = c(
    "age",
    "days",
    "t_dat"
  ),
  `B` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  ),
  `C` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  ),
  `D` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  ),
  `E` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  ),
  `F` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  ),
  `G` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  ),
  `H` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  ),
  `I` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  ),
  `J` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  ),
  `K` = c(
    "age",
    "days",
    "mage",
    "mdays",
    "t_dat",
    "tm_dat"
  )
)

variable_labels_list <- list(
  Wave_A_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LSN interview (w1)",
    days = "Age at LSN interview in days (w1)",
    t_dat = "LSN interview date (w1)"
  ),
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w2)",
    days = "Age at LASA main/telephonic interview in days (w2)",
    mage = "Age at LASA medical interview (w2)",
    mdays = "Age at LASA medical interview in days (w2)",
    t_dat = "LASA main interview date (w2)",
    tm_dat = "LASA medical interview date (w2)"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w3)",
    days = "Age at LASA main/telephonic interview in days (w3)",
    mage = "Age at LASA medical interview (w3)",
    mdays = "Age at LASA medical interview in days (w3)",
    t_dat = "LASA main/telephonic interview date (w3)",
    tm_dat = "LASA medical interview date (w3)"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w4)",
    days = "Age at LASA main/telephonic interview in days (w4)",
    mage = "Age at LASA medical interview (w4)",
    mdays = "Age at LASA medical interview in days (w4)",
    t_dat = "LASA main/telephonic interview date (w4)",
    tm_dat = "LASA medical interview date (w4)"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w5)",
    days = "Age at LASA main/telephonic interview in days (w5)",
    mage = "Age at LASA medical interview (w5)",
    mdays = "Age at LASA medical interview in days (w5)",
    t_dat = "LASA main/telephonic interview date (w5)",
    tm_dat = "LASA medical interview date (w5)"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w6)",
    days = "Age at LASA main/telephonic interview in days (w6)",
    mage = "Age at LASA medical interview (w6)",
    mdays = "Age at LASA medical interview in days (w6)",
    t_dat = "LASA main/telephonic interview date (w6)",
    tm_dat = "LASA medical interview date (w6)"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w7)",
    days = "Age at LASA main/telephonic interview in days (w7)",
    mage = "Age at LASA medical interview (w7)",
    mdays = "Age at LASA medical interview in days (w7)",
    t_dat = "LASA main/telephonic interview date (w7)",
    tm_dat = "LASA medical interview date (w7)"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w8)",
    days = "Age at LASA main/telephonic interview in days (w8)",
    mage = "Age at LASA medical interview (w8)",
    mdays = "Age at LASA medical interview in days (w8)",
    t_dat = "LASA main/telephonic interview date (w8)",
    tm_dat = "LASA medical interview date (w8)"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w9)",
    days = "Age at LASA medical interview in days (w9)",
    mage = "Age at LASA medical interview (w9)",
    mdays = "Age at LASA medical interview in days (w9)",
    t_dat = "LASA main/telephonic interview date (w9)",
    tm_dat = "LASA medical interview date (w9)"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w10)",
    days = "Age at LASA medical interview in days (w10)",
    mage = "Age at LASA medical interview (w10)",
    mdays = "Age at LASA medical interview in days (w10)",
    t_dat = "LASA main/telephonic interview date (w10)",
    tm_dat = "LASA medical interview date (w10)"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    age = "Age at LASA main/telephonic interview (w11)",
    days = "Age at LASA medical interview in days (w11)",
    mage = "Age at LASA medical interview (w11)",
    mdays = "Age at LASA medical interview in days (w11)",
    t_dat = "LASA main/telephonic interview date (w11)",
    tm_dat = "LASA medical interview date (w11)"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  age = c(`-2` = "no interview available"),
  days = c(`-2` = "no interview available"),
  mage = c(`-2` = "no interview available"),
  mdays = c(`-2` = "no interview available"),
  t_dat = stats::setNames(character(0), character(0)),
  tm_dat = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_A_labels = standardized_value_labels,
  Wave_B_labels = standardized_value_labels,
  Wave_C_labels = standardized_value_labels,
  Wave_D_labels = standardized_value_labels,
  Wave_E_labels = standardized_value_labels,
  Wave_F_labels = standardized_value_labels,
  Wave_G_labels = standardized_value_labels,
  Wave_H_labels = standardized_value_labels,
  Wave_I_labels = standardized_value_labels,
  Wave_J_labels = standardized_value_labels,
  Wave_K_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  age = "numeric",
  days = "numeric",
  mage = "numeric",
  mdays = "numeric",
  t_dat = "date",
  tm_dat = "date"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "z008", waves = .lasa_wave_rows(has_wave_a = TRUE)) |>
    .override_label(wave = "A", variable = "t_dat", override_value = "t1_dat") |>
    .override_label(wave = "B", variable = "t_dat", override_value = "t2_dat") |>
    .override_label(wave = "B", variable = "tm_dat", override_value = "t2m_dat") |>
    .override_label(wave = "C", variable = "t_dat", override_value = "t3_dat") |>
    .override_label(wave = "C", variable = "tm_dat", override_value = "t3m_dat") |>
    .override_label(wave = "D", variable = "t_dat", override_value = "t4_dat") |>
    .override_label(wave = "D", variable = "tm_dat", override_value = "t4m_dat") |>
    .override_label(wave = "E", variable = "t_dat", override_value = "t5_dat") |>
    .override_label(wave = "E", variable = "tm_dat", override_value = "t5m_dat") |>
    .override_label(wave = "F", variable = "t_dat", override_value = "t6_dat") |>
    .override_label(wave = "F", variable = "tm_dat", override_value = "t6m_dat") |>
    .override_label(wave = "G", variable = "t_dat", override_value = "t7_dat") |>
    .override_label(wave = "G", variable = "tm_dat", override_value = "t7m_dat") |>
    .override_label(wave = "H", variable = "t_dat", override_value = "t8_dat") |>
    .override_label(wave = "H", variable = "tm_dat", override_value = "t8m_dat") |>
    .override_label(wave = "I", variable = "t_dat", override_value = "t9_dat") |>
    .override_label(wave = "I", variable = "tm_dat", override_value = "t9m_dat") |>
    .override_label(wave = "J", variable = "t_dat", override_value = "t10_dat") |>
    .override_label(wave = "J", variable = "tm_dat", override_value = "t10m_dat") |>
    .override_label(wave = "K", variable = "t_dat", override_value = "t11_dat") |>
    .override_label(wave = "K", variable = "tm_dat", override_value = "t11m_dat"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "z008", waves = .lasa_wave_rows(has_wave_a = TRUE)),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "z008", waves = .lasa_wave_rows(has_wave_a = TRUE)),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "z008", waves = .lasa_wave_rows(has_wave_a = TRUE))
)

fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "A"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["age"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["days"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mage"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mdays"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["age"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["days"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["mage"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["mdays"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["age"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["days"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["mage"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["mdays"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["age"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["days"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["mage"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["mdays"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["t_dat"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["tm_dat"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)

.lasa_fc_z008 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

