## LASA filecode z008 -- variable names, variable labels, value labels,
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
  age = "numeric",
  days = "numeric",
  mage = "numeric",
  mdays = "numeric",
  t_dat = "date",
  tm_dat = "date"
)

# define variable labels ----
variable_labels(
  age = "age at interview",
  days = "age at interview in days",
  mage = "age at medical interview",
  mdays = "age at medical interview in days",
  t_dat = "interview date",
  tm_dat = "medical interview date",
  .applies_to_waves = c("Z")
)

variable_labels(
  age = "Age at LSN interview (w1)",
  days = "Age at LSN interview in days (w1)",
  t_dat = "LSN interview date (w1)",
  .applies_to_waves = c("A")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w2)",
  days = "Age at LASA main/telephonic interview in days (w2)",
  mage = "Age at LASA medical interview (w2)",
  mdays = "Age at LASA medical interview in days (w2)",
  t_dat = "LASA main interview date (w2)",
  tm_dat = "LASA medical interview date (w2)",
  .applies_to_waves = c("B")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w3)",
  days = "Age at LASA main/telephonic interview in days (w3)",
  mage = "Age at LASA medical interview (w3)",
  mdays = "Age at LASA medical interview in days (w3)",
  t_dat = "LASA main/telephonic interview date (w3)",
  tm_dat = "LASA medical interview date (w3)",
  .applies_to_waves = c("C")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w4)",
  days = "Age at LASA main/telephonic interview in days (w4)",
  mage = "Age at LASA medical interview (w4)",
  mdays = "Age at LASA medical interview in days (w4)",
  t_dat = "LASA main/telephonic interview date (w4)",
  tm_dat = "LASA medical interview date (w4)",
  .applies_to_waves = c("D")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w5)",
  days = "Age at LASA main/telephonic interview in days (w5)",
  mage = "Age at LASA medical interview (w5)",
  mdays = "Age at LASA medical interview in days (w5)",
  t_dat = "LASA main/telephonic interview date (w5)",
  tm_dat = "LASA medical interview date (w5)",
  .applies_to_waves = c("E")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w6)",
  days = "Age at LASA main/telephonic interview in days (w6)",
  mage = "Age at LASA medical interview (w6)",
  mdays = "Age at LASA medical interview in days (w6)",
  t_dat = "LASA main/telephonic interview date (w6)",
  tm_dat = "LASA medical interview date (w6)",
  .applies_to_waves = c("F")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w7)",
  days = "Age at LASA main/telephonic interview in days (w7)",
  mage = "Age at LASA medical interview (w7)",
  mdays = "Age at LASA medical interview in days (w7)",
  t_dat = "LASA main/telephonic interview date (w7)",
  tm_dat = "LASA medical interview date (w7)",
  .applies_to_waves = c("G")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w8)",
  days = "Age at LASA main/telephonic interview in days (w8)",
  mage = "Age at LASA medical interview (w8)",
  mdays = "Age at LASA medical interview in days (w8)",
  t_dat = "LASA main/telephonic interview date (w8)",
  tm_dat = "LASA medical interview date (w8)",
  .applies_to_waves = c("H")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w9)",
  days = "Age at LASA medical interview in days (w9)",
  mage = "Age at LASA medical interview (w9)",
  mdays = "Age at LASA medical interview in days (w9)",
  t_dat = "LASA main/telephonic interview date (w9)",
  tm_dat = "LASA medical interview date (w9)",
  .applies_to_waves = c("I")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w10)",
  days = "Age at LASA medical interview in days (w10)",
  mage = "Age at LASA medical interview (w10)",
  mdays = "Age at LASA medical interview in days (w10)",
  t_dat = "LASA main/telephonic interview date (w10)",
  tm_dat = "LASA medical interview date (w10)",
  .applies_to_waves = c("J")
)

variable_labels(
  age = "Age at LASA main/telephonic interview (w11)",
  days = "Age at LASA medical interview in days (w11)",
  mage = "Age at LASA medical interview (w11)",
  mdays = "Age at LASA medical interview in days (w11)",
  t_dat = "LASA main/telephonic interview date (w11)",
  tm_dat = "LASA medical interview date (w11)",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-2` = "no interview available",
  .applies_to_vars = c("age", "days"),
  .applies_to_waves = c("Z", "A", "B", "C", "D", "E", "F", "G")
)

value_labels(
  `-2` = "no interview available",
  .applies_to_vars = c("mage", "mdays"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "F", "G")
)

.lasa_fc_z008 <- .lasa_finalize_fc("z008")
.lasa_fc_z008$variables <- .lasa_fc_z008$variables |>
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
  .override_label(wave = "K", variable = "tm_dat", override_value = "t11m_dat")

