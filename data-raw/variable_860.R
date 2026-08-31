## LASA filecode 860 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  zwolnr = "Numeric field PNUM from file BL2.DBF"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "malbumi",
    "mbse",
    "mcalciu",
    "mcreati",
    "mcrp",
    "merytr",
    "mferro",
    "mfolu",
    "mfreet4",
    "mgamma",
    "mglucos",
    "mhb",
    "mhdl",
    "mhdlcho",
    "mht",
    "mlab",
    "mldl",
    "mleuc",
    "mmch",
    "mmchc",
    "mmcv",
    "motasat",
    "mptasat",
    "mtotcho",
    "mtotpro",
    "mtrigly",
    "mtsh",
    "mureum",
    "mvitb12",
    "zwolnr"
  ),
  `C` = c(
    "malbcon",
    "malbumi",
    "mbse",
    "mcalciu",
    "mcreati",
    "mcrp",
    "merytr",
    "mferro",
    "mfolu",
    "mfreet4",
    "mgamma",
    "mglucos",
    "mhb",
    "mhdl",
    "mhdlcho",
    "mht",
    "mldl",
    "mleuc",
    "motasat",
    "mptasat",
    "mtotcho",
    "mtotpro",
    "mtrigly",
    "mtsh",
    "mureum",
    "mvitb12"
  ),
  `2B` = c(
    "malbumi",
    "mbse",
    "mcalciu",
    "mcreati",
    "mcrp",
    "merytr",
    "mferro",
    "mfolu",
    "mfreet4",
    "mgamma",
    "mglucos",
    "mhb",
    "mhdl",
    "mhdlcho",
    "mht",
    "mldl",
    "mleuc",
    "motasat",
    "mptasat",
    "mtotcho",
    "mtotpro",
    "mtrigly",
    "mtsh",
    "mureum",
    "mvitb12"
  ),
  `G` = c(
    "malbumi",
    "mcreati",
    "mglucos",
    "mtotcho"
  ),
  `3B` = c(
    "mglucos"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    malbumi = "Blood: albumine G/L",
    merytr = "Blood: erythrocyten x(10 power 12)/L",
    mfolu = "Blood: Foliumacid nMol/L",
    mfreet4 = "Blood: free T4 pMOL/L",
    mglucos = "Blood: glucose mMOL/L",
    mhb = "Blood: haemoglobine mMOL/L",
    mhdl = "Blood: hdl mMOL/L",
    mht = "Blood: haematocriet LL",
    mlab = "Laboratorium analyses",
    mldl = "Blood: ldl mmol/l",
    mleuc = "Blood: leucocyten x(10 power 9)/L",
    mmch = "Blood: multi cellulair haemoglobine a Mol",
    mmchc = "Blood: multi cellulair haemoglobine concentration mMol/L",
    mmcv = "Blood: multi cellulair volume FL",
    mtrigly = "Blood: triglyceriden mMOL/L",
    mureum = "Blood: ureum mMol/L",
    mvitb12 = "Blood: Vitamine B12 pMOL/L"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    malbcon = "Blood: albumin converted to BCG method (Adam, Oss)",
    mfreet4 = "Blood: free T4 pMOL/L",
    mglucos = "Blood: glucose mMOL/L",
    mhb = "Blood: haemoglobine mMOL/L",
    mhdl = "Blood: hdl mMOL/L",
    mldl = "Blood: ldl mmol/l",
    mtrigly = "Blood: triglyceriden mMOL/L",
    mvitb12 = "Blood: Vitamine B12 pMOL/L"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    mfolu = "Blood: Foliumacid nMol/L",
    mfreet4 = "Blood: free T4 pMOL/L",
    mglucos = "Blood: glucose mMOL/L",
    mhb = "Blood: haemoglobine mMOL/L",
    mhdl = "Blood: hdl mMOL/L",
    mldl = "Blood: ldl mmol/l",
    mtrigly = "Blood: triglyceriden mMOL/L",
    mvitb12 = "Blood: Vitamine B12 pMOL/L"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    mcreati = "Blood: creatinine µMol/L"
  ),
  Wave_3B_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  malbcon = c(`-2` = "no data, see CMLAB in LASAC850", `-1` = "no valid data"),
  malbumi = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mbse = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mcalciu = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mcreati = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mcrp = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  merytr = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mferro = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mfolu = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mfreet4 = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mgamma = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mglucos = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mhb = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mhdl = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mhdlcho = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mht = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mlab = c(
    `-2` = "Oss regio",
    `-1` = "no valid data",
    `1` = "laboratorium: de Weezenlanden",
    `2` = "laboratorium: PCA Valeriuskliniek"
  ),
  mldl = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mleuc = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mmch = c(`-2` = "Oss regio", `-1` = "no valid data"),
  mmchc = c(`-2` = "Oss regio", `-1` = "no valid data"),
  mmcv = c(`-2` = "Oss regio", `-1` = "no valid data"),
  motasat = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mptasat = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mtotcho = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mtotpro = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mtrigly = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mtsh = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mureum = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  mvitb12 = c(
    `-2` = "Oss regio / no data, see CMLAB in LASAC850 / no data, not determined",
    `-1` = "no valid data"
  ),
  zwolnr = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    malbumi = .replace_labels(
    standardized_value_labels$malbumi,
    `-2` = "Oss regio"
  ),
    mbse = .replace_labels(
    standardized_value_labels$mbse,
    `-2` = "Oss regio"
  ),
    mcalciu = .replace_labels(
    standardized_value_labels$mcalciu,
    `-2` = "Oss regio"
  ),
    mcreati = .replace_labels(
    standardized_value_labels$mcreati,
    `-2` = "Oss regio"
  ),
    mcrp = .replace_labels(
    standardized_value_labels$mcrp,
    `-2` = "Oss regio"
  ),
    merytr = .replace_labels(
    standardized_value_labels$merytr,
    `-2` = "Oss regio"
  ),
    mferro = .replace_labels(
    standardized_value_labels$mferro,
    `-2` = "Oss regio"
  ),
    mfolu = .replace_labels(
    standardized_value_labels$mfolu,
    `-2` = "Oss regio"
  ),
    mfreet4 = .replace_labels(
    standardized_value_labels$mfreet4,
    `-2` = "Oss regio"
  ),
    mgamma = .replace_labels(
    standardized_value_labels$mgamma,
    `-2` = "Oss regio"
  ),
    mglucos = .replace_labels(
    standardized_value_labels$mglucos,
    `-2` = "Oss regio"
  ),
    mhb = .replace_labels(
    standardized_value_labels$mhb,
    `-2` = "Oss regio"
  ),
    mhdl = .replace_labels(
    standardized_value_labels$mhdl,
    `-2` = "Oss regio"
  ),
    mhdlcho = .replace_labels(
    standardized_value_labels$mhdlcho,
    `-2` = "Oss regio"
  ),
    mht = .replace_labels(
    standardized_value_labels$mht,
    `-2` = "Oss regio"
  ),
    mldl = .replace_labels(
    standardized_value_labels$mldl,
    `-2` = "Oss regio"
  ),
    mleuc = .replace_labels(
    standardized_value_labels$mleuc,
    `-2` = "Oss regio"
  ),
    motasat = .replace_labels(
    standardized_value_labels$motasat,
    `-2` = "Oss regio"
  ),
    mptasat = .replace_labels(
    standardized_value_labels$mptasat,
    `-2` = "Oss regio"
  ),
    mtotcho = .replace_labels(
    standardized_value_labels$mtotcho,
    `-2` = "Oss regio"
  ),
    mtotpro = .replace_labels(
    standardized_value_labels$mtotpro,
    `-2` = "Oss regio"
  ),
    mtrigly = .replace_labels(
    standardized_value_labels$mtrigly,
    `-2` = "Oss regio"
  ),
    mtsh = .replace_labels(
    standardized_value_labels$mtsh,
    `-2` = "Oss regio"
  ),
    mureum = .replace_labels(
    standardized_value_labels$mureum,
    `-2` = "Oss regio"
  ),
    mvitb12 = .replace_labels(
    standardized_value_labels$mvitb12,
    `-2` = "Oss regio"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    malbumi = .replace_labels(
    standardized_value_labels$malbumi,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mbse = .replace_labels(
    standardized_value_labels$mbse,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mcalciu = .replace_labels(
    standardized_value_labels$mcalciu,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mcreati = .replace_labels(
    standardized_value_labels$mcreati,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mcrp = .replace_labels(
    standardized_value_labels$mcrp,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    merytr = .replace_labels(
    standardized_value_labels$merytr,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mferro = .replace_labels(
    standardized_value_labels$mferro,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mfolu = .replace_labels(
    standardized_value_labels$mfolu,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mfreet4 = .replace_labels(
    standardized_value_labels$mfreet4,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mgamma = .replace_labels(
    standardized_value_labels$mgamma,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mglucos = .replace_labels(
    standardized_value_labels$mglucos,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mhb = .replace_labels(
    standardized_value_labels$mhb,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mhdl = .replace_labels(
    standardized_value_labels$mhdl,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mhdlcho = .replace_labels(
    standardized_value_labels$mhdlcho,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mht = .replace_labels(
    standardized_value_labels$mht,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mldl = .replace_labels(
    standardized_value_labels$mldl,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mleuc = .replace_labels(
    standardized_value_labels$mleuc,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    motasat = .replace_labels(
    standardized_value_labels$motasat,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mptasat = .replace_labels(
    standardized_value_labels$mptasat,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mtotcho = .replace_labels(
    standardized_value_labels$mtotcho,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mtotpro = .replace_labels(
    standardized_value_labels$mtotpro,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mtrigly = .replace_labels(
    standardized_value_labels$mtrigly,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mtsh = .replace_labels(
    standardized_value_labels$mtsh,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mureum = .replace_labels(
    standardized_value_labels$mureum,
    `-2` = "no data, see CMLAB in LASAC850"
  ),
    mvitb12 = .replace_labels(
    standardized_value_labels$mvitb12,
    `-2` = "no data, see CMLAB in LASAC850"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    malbumi = .replace_labels(
    standardized_value_labels$malbumi,
    `-2` = "no data, not determined"
  ),
    mbse = .replace_labels(
    standardized_value_labels$mbse,
    `-2` = "no data, not determined"
  ),
    mcalciu = .replace_labels(
    standardized_value_labels$mcalciu,
    `-2` = "no data, not determined"
  ),
    mcreati = .replace_labels(
    standardized_value_labels$mcreati,
    `-2` = "no data, not determined"
  ),
    mcrp = .replace_labels(
    standardized_value_labels$mcrp,
    `-2` = "no data, not determined"
  ),
    merytr = .replace_labels(
    standardized_value_labels$merytr,
    `-2` = "no data, not determined"
  ),
    mferro = .replace_labels(
    standardized_value_labels$mferro,
    `-2` = "no data, not determined"
  ),
    mfolu = .replace_labels(
    standardized_value_labels$mfolu,
    `-2` = "no data, not determined"
  ),
    mfreet4 = .replace_labels(
    standardized_value_labels$mfreet4,
    `-2` = "no data, not determined"
  ),
    mgamma = .replace_labels(
    standardized_value_labels$mgamma,
    `-2` = "no data, not determined"
  ),
    mglucos = .replace_labels(
    standardized_value_labels$mglucos,
    `-2` = "no data, not determined"
  ),
    mhb = .replace_labels(
    standardized_value_labels$mhb,
    `-2` = "no data, not determined"
  ),
    mhdl = .replace_labels(
    standardized_value_labels$mhdl,
    `-2` = "no data, not determined"
  ),
    mhdlcho = .replace_labels(
    standardized_value_labels$mhdlcho,
    `-2` = "no data, not determined"
  ),
    mht = .replace_labels(
    standardized_value_labels$mht,
    `-2` = "no data, not determined"
  ),
    mldl = .replace_labels(
    standardized_value_labels$mldl,
    `-2` = "no data, not determined"
  ),
    mleuc = .replace_labels(
    standardized_value_labels$mleuc,
    `-2` = "no data, not determined"
  ),
    motasat = .replace_labels(
    standardized_value_labels$motasat,
    `-2` = "no data, not determined"
  ),
    mptasat = .replace_labels(
    standardized_value_labels$mptasat,
    `-2` = "no data, not determined"
  ),
    mtotcho = .replace_labels(
    standardized_value_labels$mtotcho,
    `-2` = "no data, not determined"
  ),
    mtotpro = .replace_labels(
    standardized_value_labels$mtotpro,
    `-2` = "no data, not determined"
  ),
    mtrigly = .replace_labels(
    standardized_value_labels$mtrigly,
    `-2` = "no data, not determined"
  ),
    mtsh = .replace_labels(
    standardized_value_labels$mtsh,
    `-2` = "no data, not determined"
  ),
    mureum = .replace_labels(
    standardized_value_labels$mureum,
    `-2` = "no data, not determined"
  ),
    mvitb12 = .replace_labels(
    standardized_value_labels$mvitb12,
    `-2` = "no data, not determined"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    malbumi = .replace_labels(
    standardized_value_labels$malbumi,
    `-2` = "no data, not determined"
  ),
    mcreati = .replace_labels(
    standardized_value_labels$mcreati,
    `-2` = "no data, not determined"
  ),
    mglucos = .replace_labels(
    standardized_value_labels$mglucos,
    `-2` = "no data, not determined"
  ),
    mtotcho = .replace_labels(
    standardized_value_labels$mtotcho,
    `-2` = "no data, not determined"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    mglucos = .replace_labels(
    standardized_value_labels$mglucos,
    `-2` = "no data, not determined"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "860", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "zwolnr", override_value = "zwolnr"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "860", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "860", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "860", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["zwolnr"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)

.lasa_fc_860 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

