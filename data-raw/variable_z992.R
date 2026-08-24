## LASA filecode z992 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  zecdl_i10 = "external cause of death: location, ICD10-classification (>= 2013)",
  zecdmi_i10 = "external cause of death: main injury, ICD10-classification (>= 2013)",
  zpc_i10 = "primary cause of death, ICD10-classification (>= 1996)",
  zpc_i10c = "primary cause of death, ICD10-chapter (>= 1996)",
  zpc_i9 = "primary cause of death, ICD9-classification (< 1996)",
  zpc_i9c = "primary cause of death, ICD9-chapter (< 1996)",
  zs1_i10 = "first secondary cause of death, ICD10-classification (>= 1996)",
  zs1_i10c = "first secondary cause of death, ICD10-chapter (>= 1996)",
  zs1_i9 = "first secondary cause of death, ICD9-classification (< 1996)",
  zs1_i9c = "first secondary cause of death, ICD9-chapter (< 1996)",
  zs2_i10 = "second secondary cause of death, ICD10-classification (>= 1996)",
  zs2_i10c = "second secondary cause of death, ICD10-chapter (>= 1996)",
  zs2_i9 = "second secondary cause of death, ICD9-classification (< 1996)",
  zs2_i9c = "second secondary cause of death, ICD9-chapter (< 1996)",
  zs3_i10 = "third secondary cause of death, ICD10-classification (>= 1996)",
  zs3_i10c = "third secondary cause of death, ICD10-chapter (>= 1996)",
  zs3_i9 = "third secondary cause of death, ICD9-classification (< 1996)",
  zs3_i9c = "third secondary cause of death, ICD9-chapter (< 1996)"
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  zecdl_i10 = c(
    `-3` = "ICD10 before 2013",
    `-2` = "no external cause of death (>= 2013)",
    `-1` = "ICD9",
    `0` = "Home",
    `1` = "Residential institution",
    `2` = "School, other institution and public administrative area",
    `3` = "Sports and athletics area",
    `4` = "Street and highway",
    `5` = "Trade and service area",
    `6` = "Industrial and construction area",
    `7` = "Farm",
    `8` = "Other specified places",
    `9` = "Unspecified place"
  ),
  zecdmi_i10 = c(`-3` = "ICD10 before 2013", `-2` = "no external cause of death (>= 2013)", `-1` = "ICD9"),
  zpc_i10 = c(`-1` = "ICD9"),
  zpc_i10c = c(
    `-2` = "no other secondary cause of death",
    `-1` = "ICD9",
    `1` = "Certain infectious and parasitic diseases",
    `2` = "Neoplasms",
    `3` = "Diseases of the blood(-forming) organs and certain disorders involving the immune mechanism",
    `4` = "Endocrine, nutritional and metabolic diseases",
    `5` = "Mental and behavioural disorders",
    `6` = "Diseases of the nervous system",
    `7` = "Diseases of the eye and adnexa",
    `8` = "Diseases of the ear and mastoid process",
    `9` = "Diseases of the circulatory system",
    `10` = "Diseases of the respiratory system",
    `11` = "Diseases of the digestive system",
    `12` = "Diseases of the skin and subcutaneous tissue",
    `13` = "Diseases of the musculoskeletal system and connective tissue",
    `14` = "Diseases of the genitourinary system",
    `15` = "Pregnancy, childbirth, and the puerperium",
    `16` = "Certain conditions originating in the perinatal period",
    `17` = "Congenital malformations, deformations and chromosomal abnormalities",
    `18` = "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified",
    `19` = "Injury, poisoning and certain other consequences of external causes",
    `20` = "External causes of morbidity and mortality",
    `21` = "Factors influencing health status and contact with health services",
    `22` = "Codes for special purposes"
  ),
  zpc_i9 = c(`-1` = "ICD10"),
  zpc_i9c = c(
    `-99` = "cause unknown",
    `-2` = "no other cause of death",
    `-1` = "ICD10",
    `1` = "Infectious and parasitic diseases",
    `2` = "Neoplasms",
    `3` = "Endocrine, nutritional and metabolic diseases, and immunity disorders",
    `4` = "Diseases of the blood and blood-forming organs",
    `5` = "Mental disorders",
    `6` = "Diseases of the nervous system",
    `7` = "Diseases of the sense organs",
    `8` = "Diseases of the circulatory system",
    `9` = "Diseases of the respiratory system",
    `10` = "Diseases of the digestive system",
    `11` = "Diseases of the genitourinary system",
    `12` = "Complications of pregnancy, childbirth, and the puerperium",
    `13` = "Diseases of the skin and subcutaneous tissue",
    `14` = "Diseases of the musculoskeletal system and connective tissue",
    `15` = "Congenital anomalies",
    `16` = "Certain conditions originating in the perinatal period",
    `17` = "Symptoms, signs, and ill-defined conditions",
    `18` = "Injury and poisoning",
    `19` = "External causes of injury and supplemental classification"
  ),
  zs1_i10 = c(`-2` = "no first secondary cause of death", `-1` = "ICD9"),
  zs1_i10c = c(
    `-2` = "no other secondary cause of death",
    `-1` = "ICD9",
    `1` = "Certain infectious and parasitic diseases",
    `2` = "Neoplasms",
    `3` = "Diseases of the blood(-forming) organs and certain disorders involving the immune mechanism",
    `4` = "Endocrine, nutritional and metabolic diseases",
    `5` = "Mental and behavioural disorders",
    `6` = "Diseases of the nervous system",
    `7` = "Diseases of the eye and adnexa",
    `8` = "Diseases of the ear and mastoid process",
    `9` = "Diseases of the circulatory system",
    `10` = "Diseases of the respiratory system",
    `11` = "Diseases of the digestive system",
    `12` = "Diseases of the skin and subcutaneous tissue",
    `13` = "Diseases of the musculoskeletal system and connective tissue",
    `14` = "Diseases of the genitourinary system",
    `15` = "Pregnancy, childbirth, and the puerperium",
    `16` = "Certain conditions originating in the perinatal period",
    `17` = "Congenital malformations, deformations and chromosomal abnormalities",
    `18` = "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified",
    `19` = "Injury, poisoning and certain other consequences of external causes",
    `20` = "External causes of morbidity and mortality",
    `21` = "Factors influencing health status and contact with health services",
    `22` = "Codes for special purposes"
  ),
  zs1_i9 = c(`-2` = "no first secondary cause of death", `-1` = "ICD10"),
  zs1_i9c = c(
    `-99` = "cause unknown",
    `-2` = "no other cause of death",
    `-1` = "ICD10",
    `1` = "Infectious and parasitic diseases",
    `2` = "Neoplasms",
    `3` = "Endocrine, nutritional and metabolic diseases, and immunity disorders",
    `4` = "Diseases of the blood and blood-forming organs",
    `5` = "Mental disorders",
    `6` = "Diseases of the nervous system",
    `7` = "Diseases of the sense organs",
    `8` = "Diseases of the circulatory system",
    `9` = "Diseases of the respiratory system",
    `10` = "Diseases of the digestive system",
    `11` = "Diseases of the genitourinary system",
    `12` = "Complications of pregnancy, childbirth, and the puerperium",
    `13` = "Diseases of the skin and subcutaneous tissue",
    `14` = "Diseases of the musculoskeletal system and connective tissue",
    `15` = "Congenital anomalies",
    `16` = "Certain conditions originating in the perinatal period",
    `17` = "Symptoms, signs, and ill-defined conditions",
    `18` = "Injury and poisoning",
    `19` = "External causes of injury and supplemental classification"
  ),
  zs2_i10 = c(`-2` = "no second secondary cause of death", `-1` = "ICD9"),
  zs2_i10c = c(
    `-2` = "no other secondary cause of death",
    `-1` = "ICD9",
    `1` = "Certain infectious and parasitic diseases",
    `2` = "Neoplasms",
    `3` = "Diseases of the blood(-forming) organs and certain disorders involving the immune mechanism",
    `4` = "Endocrine, nutritional and metabolic diseases",
    `5` = "Mental and behavioural disorders",
    `6` = "Diseases of the nervous system",
    `7` = "Diseases of the eye and adnexa",
    `8` = "Diseases of the ear and mastoid process",
    `9` = "Diseases of the circulatory system",
    `10` = "Diseases of the respiratory system",
    `11` = "Diseases of the digestive system",
    `12` = "Diseases of the skin and subcutaneous tissue",
    `13` = "Diseases of the musculoskeletal system and connective tissue",
    `14` = "Diseases of the genitourinary system",
    `15` = "Pregnancy, childbirth, and the puerperium",
    `16` = "Certain conditions originating in the perinatal period",
    `17` = "Congenital malformations, deformations and chromosomal abnormalities",
    `18` = "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified",
    `19` = "Injury, poisoning and certain other consequences of external causes",
    `20` = "External causes of morbidity and mortality",
    `21` = "Factors influencing health status and contact with health services",
    `22` = "Codes for special purposes"
  ),
  zs2_i9 = c(`-2` = "no second secondary cause of death", `-1` = "ICD10"),
  zs2_i9c = c(
    `-99` = "cause unknown",
    `-2` = "no other cause of death",
    `-1` = "ICD10",
    `1` = "Infectious and parasitic diseases",
    `2` = "Neoplasms",
    `3` = "Endocrine, nutritional and metabolic diseases, and immunity disorders",
    `4` = "Diseases of the blood and blood-forming organs",
    `5` = "Mental disorders",
    `6` = "Diseases of the nervous system",
    `7` = "Diseases of the sense organs",
    `8` = "Diseases of the circulatory system",
    `9` = "Diseases of the respiratory system",
    `10` = "Diseases of the digestive system",
    `11` = "Diseases of the genitourinary system",
    `12` = "Complications of pregnancy, childbirth, and the puerperium",
    `13` = "Diseases of the skin and subcutaneous tissue",
    `14` = "Diseases of the musculoskeletal system and connective tissue",
    `15` = "Congenital anomalies",
    `16` = "Certain conditions originating in the perinatal period",
    `17` = "Symptoms, signs, and ill-defined conditions",
    `18` = "Injury and poisoning",
    `19` = "External causes of injury and supplemental classification"
  ),
  zs3_i10 = c(`-2` = "no third secondary cause of death", `-1` = "ICD9"),
  zs3_i10c = c(
    `-2` = "no other secondary cause of death",
    `-1` = "ICD9",
    `1` = "Certain infectious and parasitic diseases",
    `2` = "Neoplasms",
    `3` = "Diseases of the blood(-forming) organs and certain disorders involving the immune mechanism",
    `4` = "Endocrine, nutritional and metabolic diseases",
    `5` = "Mental and behavioural disorders",
    `6` = "Diseases of the nervous system",
    `7` = "Diseases of the eye and adnexa",
    `8` = "Diseases of the ear and mastoid process",
    `9` = "Diseases of the circulatory system",
    `10` = "Diseases of the respiratory system",
    `11` = "Diseases of the digestive system",
    `12` = "Diseases of the skin and subcutaneous tissue",
    `13` = "Diseases of the musculoskeletal system and connective tissue",
    `14` = "Diseases of the genitourinary system",
    `15` = "Pregnancy, childbirth, and the puerperium",
    `16` = "Certain conditions originating in the perinatal period",
    `17` = "Congenital malformations, deformations and chromosomal abnormalities",
    `18` = "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified",
    `19` = "Injury, poisoning and certain other consequences of external causes",
    `20` = "External causes of morbidity and mortality",
    `21` = "Factors influencing health status and contact with health services",
    `22` = "Codes for special purposes"
  ),
  zs3_i9 = c(`-2` = "no third secondary cause of death", `-1` = "ICD10"),
  zs3_i9c = c(
    `-99` = "cause unknown",
    `-2` = "no other cause of death",
    `-1` = "ICD10",
    `1` = "Infectious and parasitic diseases",
    `2` = "Neoplasms",
    `3` = "Endocrine, nutritional and metabolic diseases, and immunity disorders",
    `4` = "Diseases of the blood and blood-forming organs",
    `5` = "Mental disorders",
    `6` = "Diseases of the nervous system",
    `7` = "Diseases of the sense organs",
    `8` = "Diseases of the circulatory system",
    `9` = "Diseases of the respiratory system",
    `10` = "Diseases of the digestive system",
    `11` = "Diseases of the genitourinary system",
    `12` = "Complications of pregnancy, childbirth, and the puerperium",
    `13` = "Diseases of the skin and subcutaneous tissue",
    `14` = "Diseases of the musculoskeletal system and connective tissue",
    `15` = "Congenital anomalies",
    `16` = "Certain conditions originating in the perinatal period",
    `17` = "Symptoms, signs, and ill-defined conditions",
    `18` = "Injury and poisoning",
    `19` = "External causes of injury and supplemental classification"
  )
)

value_labels_list <- list(
  Wave_B_labels = standardized_value_labels,
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  zecdl_i10 = "categorical",
  zecdmi_i10 = "text",
  zpc_i10 = "text",
  zpc_i10c = "categorical",
  zpc_i9 = "text",
  zpc_i9c = "categorical",
  zs1_i10 = "text",
  zs1_i10c = "categorical",
  zs1_i9 = "text",
  zs1_i9c = "categorical",
  zs2_i10 = "text",
  zs2_i10c = "categorical",
  zs2_i9 = "text",
  zs2_i9c = "categorical",
  zs3_i10 = "text",
  zs3_i10c = "categorical",
  zs3_i9 = "text",
  zs3_i9c = "categorical"
)

.lasa_fc_z992 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "z992", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "zecdl_i10", override_value = "zecdl_i10") |>
    .override_label(wave = "B", variable = "zecdmi_i10", override_value = "zecdmi_i10") |>
    .override_label(wave = "B", variable = "zpc_i10", override_value = "zpc_i10") |>
    .override_label(wave = "B", variable = "zpc_i10c", override_value = "zpc_i10c") |>
    .override_label(wave = "B", variable = "zpc_i9", override_value = "zpc_i9") |>
    .override_label(wave = "B", variable = "zpc_i9c", override_value = "zpc_i9c") |>
    .override_label(wave = "B", variable = "zs1_i10", override_value = "zs1_i10") |>
    .override_label(wave = "B", variable = "zs1_i10c", override_value = "zs1_i10c") |>
    .override_label(wave = "B", variable = "zs1_i9", override_value = "zs1_i9") |>
    .override_label(wave = "B", variable = "zs1_i9c", override_value = "zs1_i9c") |>
    .override_label(wave = "B", variable = "zs2_i10", override_value = "zs2_i10") |>
    .override_label(wave = "B", variable = "zs2_i10c", override_value = "zs2_i10c") |>
    .override_label(wave = "B", variable = "zs2_i9", override_value = "zs2_i9") |>
    .override_label(wave = "B", variable = "zs2_i9c", override_value = "zs2_i9c") |>
    .override_label(wave = "B", variable = "zs3_i10", override_value = "zs3_i10") |>
    .override_label(wave = "B", variable = "zs3_i10c", override_value = "zs3_i10c") |>
    .override_label(wave = "B", variable = "zs3_i9", override_value = "zs3_i9") |>
    .override_label(wave = "B", variable = "zs3_i9c", override_value = "zs3_i9c"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "z992", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "z992", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "z992", waves = .lasa_wave_rows())
)
