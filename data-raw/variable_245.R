## LASA filecode 245 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  mspec36 = "Medical microbiologist",
  .applies_to_waves = c("Z")
)

variable_labels(
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
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I")
)

variable_labels(
  mspec31 = "psychologist",
  mspec32 = "chiropractor",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  mspec33 = "phlebologist",
  mspec34 = "podologist",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I")
)

variable_labels(
  mspec35 = "tropical doctor",
  .applies_to_waves = c("2B")
)

variable_labels(
  mspec35 = "geneticist",
  .applies_to_waves = c("F", "G", "H", "3B", "I")
)

variable_labels(
  mspec36 = "medical microbiologist",
  .applies_to_waves = c("H", "3B", "I")
)

# define value labels ----
value_labels(
  `-2` = "not applicable, see number of specialists reported",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30", "mspec31", "mspec32", "mspec33", "mspec34", "mspec35", "mspec36"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-2` = "not applicable, see medical specialist contact", `-1` = "asked / no answer",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not reported", `1` = "reported",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `0` = "not reported", `1` = "reported",
  .applies_to_vars = c("mspec31", "mspec32"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G")
)

value_labels(
  `0` = "not reported", `1` = "reported",
  .applies_to_vars = c("mspec33", "mspec34"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `0` = "not reported", `1` = "reported",
  .applies_to_vars = c("mspec35"),
  .applies_to_waves = c("Z", "F", "G", "H", "I")
)

value_labels(
  `0` = "not reported", `1` = "reported",
  .applies_to_vars = c("mspec36"),
  .applies_to_waves = c("Z", "H", "I")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I")
)

value_labels(
  `-4` = "na, short version", `-2` = "na, see BMEDSPEC in LASAB045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BMSPEC#", `0` = "not reported", `1` = "reported",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-2` = "na, see BMSPEC#", `0` = "not reported", `1` = "reported",
  .applies_to_vars = c("mspec31", "mspec32"),
  .applies_to_waves = c("B", "2B")
)

value_labels(
  `-2` = "na, see CMSPEC#",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30", "mspec31", "mspec32"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CMEDSPEC in LASAC045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see DMSPEC#",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30", "mspec31", "mspec32", "mspec33", "mspec34"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see DMEDSPEC in LASAD045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see EMSPEC#",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30", "mspec31", "mspec32", "mspec33", "mspec34"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see EMEDSPEC in LASAE045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see BMEDSPEC in LASA2B045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMSPEC#", `0` = "not reported", `1` = "reported",
  .applies_to_vars = c("mspec33", "mspec34", "mspec35"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-2` = "na, see FMSPEC#",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30", "mspec31", "mspec32", "mspec33", "mspec34", "mspec35"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FMEDSPEC in LASAF045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see GMSPEC#",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30", "mspec31", "mspec32", "mspec33", "mspec34", "mspec35"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMEDSPEC in LASAG045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see HMSPEC#",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30", "mspec33", "mspec34", "mspec35", "mspec36"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMEDSPEC in LASAH045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see BMEDSPEC in LASA3B045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BMSPEC#", `0` = "not reported", `1` = "reported",
  .applies_to_vars = c("mspec36"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see IMSPEC#",
  .applies_to_vars = c("mspec01", "mspec02", "mspec03", "mspec04", "mspec05", "mspec06", "mspec07", "mspec08", "mspec09", "mspec10", "mspec11", "mspec12", "mspec13", "mspec14", "mspec15", "mspec16", "mspec17", "mspec18", "mspec19", "mspec20", "mspec21", "mspec22", "mspec23", "mspec24", "mspec25", "mspec26", "mspec27", "mspec28", "mspec29", "mspec30", "mspec33", "mspec34", "mspec35", "mspec36"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMEDSPEC in LASAI045",
  .applies_to_vars = c("mspec#"),
  .applies_to_waves = c("I")
)

.lasa_fc_245 <- .lasa_finalize_fc("245")

