## LASA filecode 860 -- variable names, variable labels, value labels,
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
  malbcon = "numeric",
  malbumi = "numeric",
  mbse = "numeric",
  mcalciu = "numeric",
  mcreati = "numeric",
  mcrp = "numeric",
  merytr = "numeric",
  mferro = "numeric",
  mfolu = "numeric",
  mfreet4 = "numeric",
  mgamma = "numeric",
  mglucos = "numeric",
  mhb = "numeric",
  mhdl = "numeric",
  mhdlcho = "numeric",
  mht = "numeric",
  mlab = "categorical",
  mldl = "numeric",
  mleuc = "numeric",
  mmch = "numeric",
  mmchc = "numeric",
  mmcv = "numeric",
  motasat = "numeric",
  mptasat = "numeric",
  mtotcho = "numeric",
  mtotpro = "numeric",
  mtrigly = "numeric",
  mtsh = "numeric",
  mureum = "numeric",
  mvitb12 = "numeric",
  zwolnr = "text"
)

# define variable labels ----
variable_labels(
  malbcon = "Blood: albumin converted to BCG method (Amsterdam, Oss)",
  malbumi = "Blood: albumin G/L",
  mbse = "Blood: BSE mm/U",
  mcalciu = "Blood: calcium mMol/L",
  mcreati = "Blood: creatinine uMOL/L",
  mcrp = "Blood: CRP mG/L",
  merytr = "Blood: erythrocytes x(10 power 12)/L",
  mferro = "Blood: Ferro uMOL/L",
  mfolu = "Blood: Folic acid nMol/L",
  mfreet4 = "Blood: free T4 pMol/L",
  mgamma = "Blood: gamma GT U/L",
  mglucos = "Blood: glucose mMol/L",
  mhb = "Blood: haemoglobin mMOL/L",
  mhdl = "Blood: HDL mMol/L",
  mhdlcho = "Blood: Cholesterol/HDL ratio",
  mht = "Blood: haematocrit LL",
  mlab = "Laboratory analyses",
  mldl = "Blood: LDL mmol/L",
  mleuc = "Blood: leucocytes x(10 power 9)/L",
  mmch = "Blood: multi cellular haemoglobin a Mol",
  mmchc = "Blood: multi cellular haemoglobin concentration mMol/L",
  mmcv = "Blood: multi cellular volume FL",
  motasat = "Blood: OT (ASAT) U/L",
  mptasat = "Blood: PT (ASAT) U/L",
  mtotcho = "Blood: total cholesterol mMol/L",
  mtotpro = "Blood: total protein G/L",
  mtrigly = "Blood: triglycerides mMol/L",
  mtsh = "Blood: TSH mU/L",
  mureum = "Blood: urea mMol/L",
  mvitb12 = "Blood: Vitamin B12 pMOL/L",
  zwolnr = "Numeric field PNUM from file BL2.DBF",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mbse", "mcalciu", "mcreati", "mcrp", "mferro", "mgamma", "mhdlcho", "motasat", "mptasat", "mtotpro", "mtsh",
  .applies_to_waves = c("B", "C", "2B")
)

variable_labels(
  "mtotcho",
  .applies_to_waves = c("B", "C", "2B", "G")
)

variable_labels(
  "zwolnr",
  .applies_to_waves = c("B")
)

variable_labels(
  "malbumi",
  .applies_to_waves = c("C", "2B", "G")
)

variable_labels(
  "merytr", "mht", "mleuc", "mureum",
  .applies_to_waves = c("C", "2B")
)

variable_labels(
  "mfolu",
  .applies_to_waves = c("C")
)

variable_labels(
  "mglucos",
  .applies_to_waves = c("G", "3B")
)

variable_labels(
  malbumi = "Blood: albumine G/L",
  merytr = "Blood: erythrocyten x(10 power 12)/L",
  mht = "Blood: haematocriet LL",
  mlab = "Laboratorium analyses",
  mleuc = "Blood: leucocyten x(10 power 9)/L",
  mmch = "Blood: multi cellulair haemoglobine a Mol",
  mmchc = "Blood: multi cellulair haemoglobine concentration mMol/L",
  mmcv = "Blood: multi cellulair volume FL",
  mureum = "Blood: ureum mMol/L",
  .applies_to_waves = c("B")
)

variable_labels(
  mfolu = "Blood: Foliumacid nMol/L",
  .applies_to_waves = c("B", "2B")
)

variable_labels(
  mfreet4 = "Blood: free T4 pMOL/L",
  mglucos = "Blood: glucose mMOL/L",
  mhb = "Blood: haemoglobine mMOL/L",
  mhdl = "Blood: hdl mMOL/L",
  mldl = "Blood: ldl mmol/l",
  mtrigly = "Blood: triglyceriden mMOL/L",
  mvitb12 = "Blood: Vitamine B12 pMOL/L",
  .applies_to_waves = c("B", "C", "2B")
)

variable_labels(
  malbcon = "Blood: albumin converted to BCG method (Adam, Oss)",
  .applies_to_waves = c("C")
)

variable_labels(
  mcreati = "Blood: creatinine \302\265Mol/L",
  .applies_to_waves = c("G")
)

# define value labels ----
value_labels(
  `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
  .applies_to_vars = c("malbumi", "mbse", "mcalciu", "mcreati", "mcrp", "merytr", "mferro", "mfolu", "mfreet4", "mgamma", "mglucos", "mhb", "mhdl", "mhdlcho", "mht", "mldl", "mleuc", "motasat", "mptasat", "mtotcho", "mtotpro", "mtrigly", "mtsh", "mureum", "mvitb12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no data, see CMLAB in LASAC850", `-1` = "no valid data",
  .applies_to_vars = c("malbcon"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("malbumi", "mbse", "mcalciu", "mcreati", "mcrp", "merytr", "mferro", "mfolu", "mfreet4", "mgamma", "mglucos", "mhb", "mhdl", "mhdlcho", "mht", "mldl", "mleuc", "motasat", "mptasat", "mtotcho", "mtotpro", "mtrigly", "mtsh", "mureum", "mvitb12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "Oss regio", `-1` = "no valid data", `1` = "laboratorium: de Weezenlanden", `2` = "laboratorium: PCA Valeriuskliniek",
  .applies_to_vars = c("mlab"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "Oss regio", `-1` = "no valid data",
  .applies_to_vars = c("mmch", "mmchc", "mmcv"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "Oss regio", `-1` = "no valid data",
  .applies_to_vars = c("malbumi", "mbse", "mcalciu", "mcreati", "mcrp", "merytr", "mferro", "mfolu", "mfreet4", "mgamma", "mglucos", "mhb", "mhdl", "mhdlcho", "mht", "mldl", "mleuc", "motasat", "mptasat", "mtotcho", "mtotpro", "mtrigly", "mtsh", "mureum", "mvitb12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "no data, see CMLAB in LASAC850", `-1` = "no valid data",
  .applies_to_vars = c("malbumi", "mbse", "mcalciu", "mcreati", "mcrp", "merytr", "mferro", "mfolu", "mfreet4", "mgamma", "mglucos", "mhb", "mhdl", "mhdlcho", "mht", "mldl", "mleuc", "motasat", "mptasat", "mtotcho", "mtotpro", "mtrigly", "mtsh", "mureum", "mvitb12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "no data, not determined", `-1` = "no valid data",
  .applies_to_vars = c("malbumi", "mcreati", "mtotcho"),
  .applies_to_waves = c("2B", "G")
)

value_labels(
  `-2` = "no data, not determined", `-1` = "no valid data",
  .applies_to_vars = c("mbse", "mcalciu", "mcrp", "merytr", "mferro", "mfolu", "mfreet4", "mgamma", "mhb", "mhdl", "mhdlcho", "mht", "mldl", "mleuc", "motasat", "mptasat", "mtotpro", "mtrigly", "mtsh", "mureum", "mvitb12"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "no data, not determined", `-1` = "no valid data",
  .applies_to_vars = c("mglucos"),
  .applies_to_waves = c("2B", "G", "3B")
)

.lasa_fc_860 <- .lasa_finalize_fc("860")
.lasa_fc_860$variables <- .lasa_fc_860$variables |>
  .override_label(wave = "B", variable = "zwolnr", override_value = "zwolnr")

