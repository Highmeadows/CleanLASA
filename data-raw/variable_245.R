## LASA filecode 245 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  `mspec#` = "Number of medical specialists reported",
  mspec01 = "Internist",
  mspec02 = "Lung specialist",
  mspec03 = "Cardiologist",
  mspec04 = "Endocrinologist",
  mspec05 = "Gastro-enterologist",
  mspec06 = "Nephrologist",
  mspec07 = "Rheumatologist",
  mspec08 = "Haemotologist",
  mspec09 = "Oncologist",
  mspec10 = "Geriatrist",
  mspec11 = "Neurologist",
  mspec12 = "Rehabilitation specialist",
  mspec13 = "Dermatologist",
  mspec14 = "Radiologist",
  mspec15 = "Radiotherapist",
  mspec16 = "Nuclear medicine physician",
  mspec17 = "Surgeon",
  mspec18 = "Vascular surgeon",
  mspec19 = "Orthopaedist",
  mspec20 = "Urologist",
  mspec21 = "Plastic surgeon",
  mspec22 = "Chest surgeon",
  mspec23 = "Neurosurgeon",
  mspec24 = "Oral/dental surgeon",
  mspec25 = "Anaesthesiologist",
  mspec26 = "Gynaecologist",
  mspec27 = "Ear/nose/throat specialist",
  mspec28 = "Opthalmologist",
  mspec29 = "Clinical chemist / blood examination",
  mspec30 = "Audiologist",
  mspec31 = "Psychologist",
  mspec32 = "Chiropractor",
  mspec33 = "Phlebologist",
  mspec34 = "Podologist",
  mspec35 = "Medical specialist type 35",
  mspec36 = "Medical microbiologist"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec31 = "psychologist",
    mspec32 = "chiropractor"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec31 = "psychologist",
    mspec32 = "chiropractor"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec31 = "psychologist",
    mspec32 = "chiropractor",
    mspec33 = "phlebologist",
    mspec34 = "podologist"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec31 = "psychologist",
    mspec32 = "chiropractor",
    mspec33 = "phlebologist",
    mspec34 = "podologist"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34",
    "mspec35"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec31 = "psychologist",
    mspec32 = "chiropractor",
    mspec33 = "phlebologist",
    mspec34 = "podologist",
    mspec35 = "tropical doctor"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34",
    "mspec35"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec31 = "psychologist",
    mspec32 = "chiropractor",
    mspec33 = "phlebologist",
    mspec34 = "podologist",
    mspec35 = "geneticist"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34",
    "mspec35"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec31 = "psychologist",
    mspec32 = "chiropractor",
    mspec33 = "phlebologist",
    mspec34 = "podologist",
    mspec35 = "geneticist"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec33",
    "mspec34",
    "mspec35",
    "mspec36"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec33 = "phlebologist",
    mspec34 = "podologist",
    mspec35 = "geneticist",
    mspec36 = "medical microbiologist"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec33",
    "mspec34",
    "mspec35",
    "mspec36"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec33 = "phlebologist",
    mspec34 = "podologist",
    mspec35 = "geneticist",
    mspec36 = "medical microbiologist"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec33",
    "mspec34",
    "mspec35",
    "mspec36"
  )],
    `mspec#` = "# of specialists reported",
    mspec01 = "internist",
    mspec02 = "lung specialist",
    mspec03 = "cardiologist",
    mspec04 = "endocrinologist",
    mspec05 = "gastro-enterologist",
    mspec06 = "nephrologist",
    mspec07 = "rheumatologist",
    mspec08 = "haemotologist",
    mspec09 = "oncologist",
    mspec10 = "geriatrist",
    mspec11 = "neurologist",
    mspec12 = "rehabilitation specialist",
    mspec13 = "dermatologist",
    mspec14 = "radiologist",
    mspec15 = "radiotherapist",
    mspec16 = "nuclear medicine physician",
    mspec17 = "surgeon",
    mspec18 = "vascular surgeon",
    mspec19 = "orthopaedist",
    mspec20 = "urologist",
    mspec21 = "plastic surgeon",
    mspec22 = "chest surgeon",
    mspec23 = "neurosurgeon",
    mspec24 = "oral/dental surgeon",
    mspec25 = "anaesthesiologist",
    mspec26 = "gynaecologist",
    mspec27 = "ear/nose/throat specialist",
    mspec28 = "opthalmologist",
    mspec29 = "clinical chemist / blood examination",
    mspec30 = "audiologist",
    mspec33 = "phlebologist",
    mspec34 = "podologist",
    mspec35 = "geneticist",
    mspec36 = "medical microbiologist"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  `mspec#` = c(
    `-4` = "short version",
    `-2` = "not applicable, see medical specialist contact",
    `-1` = "asked / no answer"
  ),
  mspec01 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec02 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec03 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec04 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec05 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec06 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec07 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec08 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec09 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec10 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec11 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec12 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec13 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec14 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec15 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec16 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec17 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec18 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec19 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec20 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec21 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec22 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec23 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec24 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec25 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec26 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec27 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec28 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec29 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec30 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec31 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec32 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec33 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec34 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec35 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  ),
  mspec36 = c(
    `-2` = "not applicable, see number of specialists reported",
    `0` = "not reported",
    `1` = "reported"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32"
  )],
    `mspec#` = .replace_labels(
    standardized_value_labels$`mspec#`,
    `-4` = "na, short version",
    `-2` = "na, see BMEDSPEC in LASAB045",
    `-1` = "na, asked"
  ),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see BMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see BMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see BMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see BMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see BMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see BMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see BMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see BMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see BMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see BMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see BMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see BMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see BMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see BMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see BMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see BMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see BMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see BMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see BMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see BMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see BMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see BMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see BMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see BMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see BMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see BMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see BMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see BMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see BMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see BMSPEC#"
  ),
    mspec31 = .replace_labels(
    standardized_value_labels$mspec31,
    `-2` = "na, see BMSPEC#"
  ),
    mspec32 = .replace_labels(
    standardized_value_labels$mspec32,
    `-2` = "na, see BMSPEC#"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32"
  )],
    `mspec#` = c(`-2` = "na, see CMEDSPEC in LASAC045", `-1` = "na, asked"),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see CMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see CMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see CMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see CMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see CMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see CMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see CMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see CMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see CMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see CMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see CMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see CMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see CMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see CMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see CMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see CMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see CMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see CMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see CMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see CMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see CMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see CMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see CMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see CMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see CMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see CMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see CMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see CMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see CMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see CMSPEC#"
  ),
    mspec31 = .replace_labels(
    standardized_value_labels$mspec31,
    `-2` = "na, see CMSPEC#"
  ),
    mspec32 = .replace_labels(
    standardized_value_labels$mspec32,
    `-2` = "na, see CMSPEC#"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34"
  )],
    `mspec#` = c(`-2` = "na, see DMEDSPEC in LASAD045", `-1` = "na, asked"),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see DMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see DMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see DMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see DMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see DMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see DMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see DMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see DMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see DMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see DMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see DMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see DMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see DMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see DMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see DMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see DMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see DMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see DMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see DMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see DMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see DMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see DMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see DMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see DMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see DMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see DMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see DMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see DMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see DMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see DMSPEC#"
  ),
    mspec31 = .replace_labels(
    standardized_value_labels$mspec31,
    `-2` = "na, see DMSPEC#"
  ),
    mspec32 = .replace_labels(
    standardized_value_labels$mspec32,
    `-2` = "na, see DMSPEC#"
  ),
    mspec33 = .replace_labels(
    standardized_value_labels$mspec33,
    `-2` = "na, see DMSPEC#"
  ),
    mspec34 = .replace_labels(
    standardized_value_labels$mspec34,
    `-2` = "na, see DMSPEC#"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34"
  )],
    `mspec#` = c(`-2` = "na, see EMEDSPEC in LASAE045", `-1` = "na, asked"),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see EMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see EMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see EMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see EMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see EMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see EMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see EMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see EMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see EMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see EMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see EMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see EMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see EMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see EMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see EMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see EMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see EMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see EMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see EMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see EMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see EMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see EMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see EMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see EMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see EMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see EMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see EMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see EMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see EMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see EMSPEC#"
  ),
    mspec31 = .replace_labels(
    standardized_value_labels$mspec31,
    `-2` = "na, see EMSPEC#"
  ),
    mspec32 = .replace_labels(
    standardized_value_labels$mspec32,
    `-2` = "na, see EMSPEC#"
  ),
    mspec33 = .replace_labels(
    standardized_value_labels$mspec33,
    `-2` = "na, see EMSPEC#"
  ),
    mspec34 = .replace_labels(
    standardized_value_labels$mspec34,
    `-2` = "na, see EMSPEC#"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34",
    "mspec35"
  )],
    `mspec#` = c(`-2` = "na, see BMEDSPEC in LASA2B045", `-1` = "na, asked"),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see BMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see BMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see BMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see BMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see BMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see BMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see BMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see BMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see BMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see BMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see BMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see BMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see BMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see BMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see BMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see BMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see BMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see BMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see BMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see BMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see BMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see BMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see BMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see BMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see BMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see BMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see BMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see BMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see BMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see BMSPEC#"
  ),
    mspec31 = .replace_labels(
    standardized_value_labels$mspec31,
    `-2` = "na, see BMSPEC#"
  ),
    mspec32 = .replace_labels(
    standardized_value_labels$mspec32,
    `-2` = "na, see BMSPEC#"
  ),
    mspec33 = .replace_labels(
    standardized_value_labels$mspec33,
    `-2` = "na, see BMSPEC#"
  ),
    mspec34 = .replace_labels(
    standardized_value_labels$mspec34,
    `-2` = "na, see BMSPEC#"
  ),
    mspec35 = .replace_labels(
    standardized_value_labels$mspec35,
    `-2` = "na, see BMSPEC#"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34",
    "mspec35"
  )],
    `mspec#` = c(`-2` = "na, see FMEDSPEC in LASAF045", `-1` = "na, asked"),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see FMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see FMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see FMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see FMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see FMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see FMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see FMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see FMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see FMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see FMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see FMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see FMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see FMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see FMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see FMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see FMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see FMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see FMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see FMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see FMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see FMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see FMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see FMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see FMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see FMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see FMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see FMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see FMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see FMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see FMSPEC#"
  ),
    mspec31 = .replace_labels(
    standardized_value_labels$mspec31,
    `-2` = "na, see FMSPEC#"
  ),
    mspec32 = .replace_labels(
    standardized_value_labels$mspec32,
    `-2` = "na, see FMSPEC#"
  ),
    mspec33 = .replace_labels(
    standardized_value_labels$mspec33,
    `-2` = "na, see FMSPEC#"
  ),
    mspec34 = .replace_labels(
    standardized_value_labels$mspec34,
    `-2` = "na, see FMSPEC#"
  ),
    mspec35 = .replace_labels(
    standardized_value_labels$mspec35,
    `-2` = "na, see FMSPEC#"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec31",
    "mspec32",
    "mspec33",
    "mspec34",
    "mspec35"
  )],
    `mspec#` = c(`-2` = "na, see GMEDSPEC in LASAG045", `-1` = "na, asked"),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see GMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see GMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see GMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see GMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see GMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see GMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see GMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see GMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see GMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see GMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see GMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see GMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see GMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see GMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see GMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see GMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see GMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see GMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see GMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see GMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see GMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see GMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see GMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see GMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see GMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see GMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see GMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see GMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see GMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see GMSPEC#"
  ),
    mspec31 = .replace_labels(
    standardized_value_labels$mspec31,
    `-2` = "na, see GMSPEC#"
  ),
    mspec32 = .replace_labels(
    standardized_value_labels$mspec32,
    `-2` = "na, see GMSPEC#"
  ),
    mspec33 = .replace_labels(
    standardized_value_labels$mspec33,
    `-2` = "na, see GMSPEC#"
  ),
    mspec34 = .replace_labels(
    standardized_value_labels$mspec34,
    `-2` = "na, see GMSPEC#"
  ),
    mspec35 = .replace_labels(
    standardized_value_labels$mspec35,
    `-2` = "na, see GMSPEC#"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec33",
    "mspec34",
    "mspec35",
    "mspec36"
  )],
    `mspec#` = c(`-2` = "na, see HMEDSPEC in LASAH045", `-1` = "na, asked"),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see HMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see HMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see HMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see HMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see HMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see HMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see HMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see HMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see HMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see HMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see HMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see HMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see HMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see HMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see HMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see HMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see HMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see HMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see HMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see HMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see HMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see HMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see HMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see HMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see HMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see HMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see HMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see HMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see HMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see HMSPEC#"
  ),
    mspec33 = .replace_labels(
    standardized_value_labels$mspec33,
    `-2` = "na, see HMSPEC#"
  ),
    mspec34 = .replace_labels(
    standardized_value_labels$mspec34,
    `-2` = "na, see HMSPEC#"
  ),
    mspec35 = .replace_labels(
    standardized_value_labels$mspec35,
    `-2` = "na, see HMSPEC#"
  ),
    mspec36 = .replace_labels(
    standardized_value_labels$mspec36,
    `-2` = "na, see HMSPEC#"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec33",
    "mspec34",
    "mspec35",
    "mspec36"
  )],
    `mspec#` = c(`-2` = "na, see BMEDSPEC in LASA3B045", `-1` = "na, asked"),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see BMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see BMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see BMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see BMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see BMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see BMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see BMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see BMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see BMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see BMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see BMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see BMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see BMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see BMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see BMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see BMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see BMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see BMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see BMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see BMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see BMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see BMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see BMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see BMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see BMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see BMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see BMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see BMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see BMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see BMSPEC#"
  ),
    mspec33 = .replace_labels(
    standardized_value_labels$mspec33,
    `-2` = "na, see BMSPEC#"
  ),
    mspec34 = .replace_labels(
    standardized_value_labels$mspec34,
    `-2` = "na, see BMSPEC#"
  ),
    mspec35 = .replace_labels(
    standardized_value_labels$mspec35,
    `-2` = "na, see BMSPEC#"
  ),
    mspec36 = .replace_labels(
    standardized_value_labels$mspec36,
    `-2` = "na, see BMSPEC#"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "mspec#",
    "mspec01",
    "mspec02",
    "mspec03",
    "mspec04",
    "mspec05",
    "mspec06",
    "mspec07",
    "mspec08",
    "mspec09",
    "mspec10",
    "mspec11",
    "mspec12",
    "mspec13",
    "mspec14",
    "mspec15",
    "mspec16",
    "mspec17",
    "mspec18",
    "mspec19",
    "mspec20",
    "mspec21",
    "mspec22",
    "mspec23",
    "mspec24",
    "mspec25",
    "mspec26",
    "mspec27",
    "mspec28",
    "mspec29",
    "mspec30",
    "mspec33",
    "mspec34",
    "mspec35",
    "mspec36"
  )],
    `mspec#` = c(`-2` = "na, see IMEDSPEC in LASAI045", `-1` = "na, asked"),
    mspec01 = .replace_labels(
    standardized_value_labels$mspec01,
    `-2` = "na, see IMSPEC#"
  ),
    mspec02 = .replace_labels(
    standardized_value_labels$mspec02,
    `-2` = "na, see IMSPEC#"
  ),
    mspec03 = .replace_labels(
    standardized_value_labels$mspec03,
    `-2` = "na, see IMSPEC#"
  ),
    mspec04 = .replace_labels(
    standardized_value_labels$mspec04,
    `-2` = "na, see IMSPEC#"
  ),
    mspec05 = .replace_labels(
    standardized_value_labels$mspec05,
    `-2` = "na, see IMSPEC#"
  ),
    mspec06 = .replace_labels(
    standardized_value_labels$mspec06,
    `-2` = "na, see IMSPEC#"
  ),
    mspec07 = .replace_labels(
    standardized_value_labels$mspec07,
    `-2` = "na, see IMSPEC#"
  ),
    mspec08 = .replace_labels(
    standardized_value_labels$mspec08,
    `-2` = "na, see IMSPEC#"
  ),
    mspec09 = .replace_labels(
    standardized_value_labels$mspec09,
    `-2` = "na, see IMSPEC#"
  ),
    mspec10 = .replace_labels(
    standardized_value_labels$mspec10,
    `-2` = "na, see IMSPEC#"
  ),
    mspec11 = .replace_labels(
    standardized_value_labels$mspec11,
    `-2` = "na, see IMSPEC#"
  ),
    mspec12 = .replace_labels(
    standardized_value_labels$mspec12,
    `-2` = "na, see IMSPEC#"
  ),
    mspec13 = .replace_labels(
    standardized_value_labels$mspec13,
    `-2` = "na, see IMSPEC#"
  ),
    mspec14 = .replace_labels(
    standardized_value_labels$mspec14,
    `-2` = "na, see IMSPEC#"
  ),
    mspec15 = .replace_labels(
    standardized_value_labels$mspec15,
    `-2` = "na, see IMSPEC#"
  ),
    mspec16 = .replace_labels(
    standardized_value_labels$mspec16,
    `-2` = "na, see IMSPEC#"
  ),
    mspec17 = .replace_labels(
    standardized_value_labels$mspec17,
    `-2` = "na, see IMSPEC#"
  ),
    mspec18 = .replace_labels(
    standardized_value_labels$mspec18,
    `-2` = "na, see IMSPEC#"
  ),
    mspec19 = .replace_labels(
    standardized_value_labels$mspec19,
    `-2` = "na, see IMSPEC#"
  ),
    mspec20 = .replace_labels(
    standardized_value_labels$mspec20,
    `-2` = "na, see IMSPEC#"
  ),
    mspec21 = .replace_labels(
    standardized_value_labels$mspec21,
    `-2` = "na, see IMSPEC#"
  ),
    mspec22 = .replace_labels(
    standardized_value_labels$mspec22,
    `-2` = "na, see IMSPEC#"
  ),
    mspec23 = .replace_labels(
    standardized_value_labels$mspec23,
    `-2` = "na, see IMSPEC#"
  ),
    mspec24 = .replace_labels(
    standardized_value_labels$mspec24,
    `-2` = "na, see IMSPEC#"
  ),
    mspec25 = .replace_labels(
    standardized_value_labels$mspec25,
    `-2` = "na, see IMSPEC#"
  ),
    mspec26 = .replace_labels(
    standardized_value_labels$mspec26,
    `-2` = "na, see IMSPEC#"
  ),
    mspec27 = .replace_labels(
    standardized_value_labels$mspec27,
    `-2` = "na, see IMSPEC#"
  ),
    mspec28 = .replace_labels(
    standardized_value_labels$mspec28,
    `-2` = "na, see IMSPEC#"
  ),
    mspec29 = .replace_labels(
    standardized_value_labels$mspec29,
    `-2` = "na, see IMSPEC#"
  ),
    mspec30 = .replace_labels(
    standardized_value_labels$mspec30,
    `-2` = "na, see IMSPEC#"
  ),
    mspec33 = .replace_labels(
    standardized_value_labels$mspec33,
    `-2` = "na, see IMSPEC#"
  ),
    mspec34 = .replace_labels(
    standardized_value_labels$mspec34,
    `-2` = "na, see IMSPEC#"
  ),
    mspec35 = .replace_labels(
    standardized_value_labels$mspec35,
    `-2` = "na, see IMSPEC#"
  ),
    mspec36 = .replace_labels(
    standardized_value_labels$mspec36,
    `-2` = "na, see IMSPEC#"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  `mspec#` = "numeric",
  mspec01 = "categorical",
  mspec02 = "categorical",
  mspec03 = "categorical",
  mspec04 = "categorical",
  mspec05 = "categorical",
  mspec06 = "categorical",
  mspec07 = "categorical",
  mspec08 = "categorical",
  mspec09 = "categorical",
  mspec10 = "categorical",
  mspec11 = "categorical",
  mspec12 = "categorical",
  mspec13 = "categorical",
  mspec14 = "categorical",
  mspec15 = "categorical",
  mspec16 = "categorical",
  mspec17 = "categorical",
  mspec18 = "categorical",
  mspec19 = "categorical",
  mspec20 = "categorical",
  mspec21 = "categorical",
  mspec22 = "categorical",
  mspec23 = "categorical",
  mspec24 = "categorical",
  mspec25 = "categorical",
  mspec26 = "categorical",
  mspec27 = "categorical",
  mspec28 = "categorical",
  mspec29 = "categorical",
  mspec30 = "categorical",
  mspec31 = "categorical",
  mspec32 = "categorical",
  mspec33 = "categorical",
  mspec34 = "categorical",
  mspec35 = "categorical",
  mspec36 = "categorical"
)

.lasa_fc_245 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "245", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "245", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "245", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "245", waves = .lasa_wave_rows())
)
