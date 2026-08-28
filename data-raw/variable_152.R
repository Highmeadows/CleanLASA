## LASA filecode 152 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  drinking = "dairy products after the age of 50",
  `m#med` = "number of medicines",
  `m#timp1` = "med. 1: # times a period",
  `m#timp10` = "med. 10: # times a period",
  `m#timp11` = "med. 11: # times a period",
  `m#timp12` = "med. 12: # times a period",
  `m#timp13` = "med. 13: # times a period",
  `m#timp14` = "med. 14: # times a period",
  `m#timp2` = "med. 2: # times a period",
  `m#timp3` = "med. 3: # times a period",
  `m#timp4` = "med. 4: # times a period",
  `m#timp5` = "med. 5: # times a period",
  `m#timp6` = "med. 6: # times a period",
  `m#timp7` = "med. 7: # times a period",
  `m#timp8` = "med. 8: # times a period",
  `m#timp9` = "med. 9: # times a period",
  matc1 = "med. 1: ATC-code in: G, H, 3B, I, J, K:",
  matc10 = "med. 10: ATC-code in: G, H, 3B, I, J, K:",
  matc11 = "med. 11: ATC-code in: G, H, 3B, I, J, K:",
  matc12 = "med. 12: ATC-code in: G, H, 3B, I, J, K:",
  matc13 = "med. 13: ATC-code in: G, H, 3B, I, J, K:",
  matc14 = "med. 14: ATC-code in: G, H, 3B, I, J, K:",
  matc2 = "med. 2: ATC-code (constructed)",
  matc3 = "med. 3: ATC-code (constructed)",
  matc4 = "med. 4: ATC-code (constructed)",
  matc5 = "med. 5: ATC-code (constructed)",
  matc6 = "med. 6: ATC-code (constructed)",
  matc7 = "med. 7: ATC-code (constructed)",
  matc8 = "med. 8: ATC-code (constructed)",
  matc9 = "med. 9: ATC-code in: G, H, 3B, I, J, K:",
  mbff = "bisphosphonate: name",
  mbffatc = "bisphosphonate: ATC-code (constructed)",
  mbffnr = "bisphosphonate: number (constructed)",
  mcalcfr = "calcium: frequency",
  mccs = "corticosteroid: name",
  mccs1 = "corticosteroid 1: name",
  mccs2 = "corticosteroid 2: name",
  mccsatc = "corticosteroid: ATC-code (constructed)",
  mccsatc1 = "corticosteroid 1: ATC-code",
  mccsatc2 = "corticosteroid 2: ATC-code",
  mccsnr = "corticosteroid: number (constructed)",
  mdairy = "drinking dairy products after the age of 50",
  mdform1 = "med. 1: dosage form",
  mdform10 = "med. 10: dosage form",
  mdform11 = "med. 11: dosage form",
  mdform12 = "med. 12: dosage form",
  mdform13 = "med. 13: dosage form",
  mdform14 = "med. 14: dosage form",
  mdform2 = "med. 2: dosage form",
  mdform3 = "med. 3: dosage form",
  mdform4 = "med. 4: dosage form",
  mdform5 = "med. 5: dosage form",
  mdform6 = "med. 6: dosage form",
  mdform7 = "med. 7: dosage form",
  mdform8 = "med. 8: dosage form",
  mdform9 = "med. 9: dosage form",
  mdos1 = "med. 1: dosage (in ml)",
  mdos2 = "med. 2: dosage (in ml)",
  mdos3 = "med. 3: dosage (in ml)",
  mdos4 = "med. 4: dosage (in ml)",
  mdos5 = "med. 5: dosage (in ml)",
  mdos6 = "med. 6: dosage (in ml)",
  mdurat1 = "med. 1: duration",
  mdurat10 = "med. 10: duration",
  mdurat11 = "med. 11: duration",
  mdurat12 = "med. 12: duration",
  mdurat13 = "med. 13: duration",
  mdurat14 = "med. 14: duration",
  mdurat2 = "med. 2: duration",
  mdurat3 = "med. 3: duration",
  mdurat4 = "med. 4: duration",
  mdurat5 = "med. 5: duration",
  mdurat6 = "med. 6: duration",
  mdurat7 = "med. 7: duration",
  mdurat8 = "med. 8: duration",
  mdurat9 = "med. 9: duration",
  mmeasu1 = "med. 1: measurement",
  mmeasu10 = "med. 10: measurement",
  mmeasu11 = "med. 11: measurement",
  mmeasu12 = "med. 12: measurement",
  mmeasu13 = "med. 13: measurement",
  mmeasu14 = "med. 14: measurement",
  mmeasu2 = "med. 2: measurement",
  mmeasu3 = "med. 3: measurement",
  mmeasu4 = "med. 4: measurement",
  mmeasu5 = "med. 5: measurement",
  mmeasu6 = "med. 6: measurement",
  mmeasu7 = "med. 7: measurement",
  mmeasu8 = "med. 8: measurement",
  mmeasu9 = "med. 9: measurement",
  mmed1 = "med. 1: name",
  mmed10 = "med. 10: name",
  mmed11 = "med. 11: name",
  mmed12 = "med. 12: name",
  mmed13 = "med. 13: name",
  mmed14 = "med. 14: name",
  mmed2 = "med. 2: name",
  mmed3 = "med. 3: name",
  mmed4 = "med. 4: name",
  mmed5 = "med. 5: name",
  mmed6 = "med. 6: name",
  mmed7 = "med. 7: name",
  mmed8 = "med. 8: name",
  mmed9 = "med. 9: name",
  mmedbis = "use of bisphosphonates last 3 years",
  mmedbisnm = "bisphosphonates: # months",
  mmedcaltab = "Tablets: calcium",
  mmedcort = "Corticosteroid use",
  mmedcortnm = "corticosteroids: # months",
  mmedcortnm1 = "corticosteroids 1: # months",
  mmedcortnm2 = "corticosteroids 2: # months",
  mmedfertab = "Tablets: ferro",
  mmednr1 = "med. 1: number (constructed)",
  mmednr2 = "med. 2: number (constructed)",
  mmednr3 = "med. 3: number (constructed)",
  mmednr4 = "med. 4: number (constructed)",
  mmednr5 = "med. 5: number (constructed)",
  mmednr6 = "med. 6: number (constructed)",
  mmednr7 = "med. 7: number (constructed)",
  mmednr8 = "med. 8: number (constructed)",
  mmeduse = "medication use",
  mmedvitinj = "Injections: vitamins",
  mmedvittab = "use of vitamin tablets (no prescription)",
  mmeno82 = "menopause: female sex hormones",
  mmenonrm = "menopause: # months",
  moes = "oestrogen: name",
  moesatc = "oestrogen: ATC-code (constructed)",
  moesnr = "oestrogen: number (constructed)",
  mperio1 = "med. 1: period",
  mperio10 = "med. 10: period",
  mperio11 = "med. 11: period",
  mperio12 = "med. 12: period",
  mperio13 = "med. 13: period",
  mperio14 = "med. 14: period",
  mperio2 = "med. 2: period",
  mperio3 = "med. 3: period",
  mperio4 = "med. 4: period",
  mperio5 = "med. 5: period",
  mperio6 = "med. 6: period",
  mperio7 = "med. 7: period",
  mperio8 = "med. 8: period",
  mperio9 = "med. 9: period",
  mquant1 = "med. 1: quantity",
  mquant10 = "med. 10: quantity",
  mquant11 = "med. 11: quantity",
  mquant12 = "med. 12: quantity",
  mquant13 = "med. 13: quantity",
  mquant14 = "med. 14: quantity",
  mquant2 = "med. 2: quantity",
  mquant3 = "med. 3: quantity",
  mquant4 = "med. 4: quantity",
  mquant5 = "med. 5: quantity",
  mquant6 = "med. 6: quantity",
  mquant7 = "med. 7: quantity",
  mquant8 = "med. 8: quantity",
  mquant9 = "med. 9: quantity",
  mtad1 = "Medicine 1: times a day",
  mtad2 = "Medicine 2: times a day",
  mtad3 = "Medicine 3: times a day",
  mtad4 = "Medicine 4: times a day",
  mtad5 = "Medicine 5: times a day",
  mtad6 = "Medicine 6: times a day",
  mtad7 = "Medicine 7: times a day",
  mtad8 = "Medicine 8: times a day",
  mvit1 = "vitamin 1: name (in Dutch)",
  mvit2 = "vitamin 2: name (in Dutch)",
  mvit3 = "vitamin 3: name (in Dutch)",
  mvitfr1 = "vitamin 1: frequency",
  mvitfr2 = "vitamin 2: frequency",
  mvitfr3 = "vitamin 3: frequency"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "m#med",
    "matc1",
    "matc2",
    "matc3",
    "matc4",
    "matc5",
    "matc6",
    "mdos1",
    "mdos2",
    "mdos3",
    "mdos4",
    "mdos5",
    "mdos6",
    "mdurat1",
    "mdurat2",
    "mdurat3",
    "mdurat4",
    "mdurat5",
    "mdurat6",
    "mmed1",
    "mmed2",
    "mmed3",
    "mmed4",
    "mmed5",
    "mmed6",
    "mmedcaltab",
    "mmedfertab",
    "mmednr1",
    "mmednr2",
    "mmednr3",
    "mmednr4",
    "mmednr5",
    "mmednr6",
    "mmeduse",
    "mmedvitinj",
    "mmedvittab"
  ),
  `C` = c(
    "m#med",
    "matc1",
    "matc2",
    "matc3",
    "matc4",
    "matc5",
    "matc6",
    "matc7",
    "matc8",
    "mdurat1",
    "mdurat2",
    "mdurat3",
    "mdurat4",
    "mdurat5",
    "mdurat6",
    "mdurat7",
    "mdurat8",
    "mmeasu1",
    "mmeasu2",
    "mmeasu3",
    "mmeasu4",
    "mmeasu5",
    "mmeasu6",
    "mmeasu7",
    "mmeasu8",
    "mmed1",
    "mmed2",
    "mmed3",
    "mmed4",
    "mmed5",
    "mmed6",
    "mmed7",
    "mmed8",
    "mmedbis",
    "mmedcaltab",
    "mmedcort",
    "mmedfertab",
    "mmednr1",
    "mmednr2",
    "mmednr3",
    "mmednr4",
    "mmednr5",
    "mmednr6",
    "mmednr7",
    "mmednr8",
    "mmeduse",
    "mmedvittab",
    "mquant1",
    "mquant2",
    "mquant3",
    "mquant4",
    "mquant5",
    "mquant6",
    "mquant7",
    "mquant8",
    "mtad1",
    "mtad2",
    "mtad3",
    "mtad4",
    "mtad5",
    "mtad6",
    "mtad7",
    "mtad8"
  ),
  `D` = c(
    "m#med",
    "m#timp1",
    "m#timp2",
    "m#timp3",
    "m#timp4",
    "m#timp5",
    "m#timp6",
    "m#timp7",
    "m#timp8",
    "matc1",
    "matc2",
    "matc3",
    "matc4",
    "matc5",
    "matc6",
    "matc7",
    "matc8",
    "mbff",
    "mbffatc",
    "mbffnr",
    "mccs",
    "mccsatc",
    "mccsnr",
    "mdurat1",
    "mdurat2",
    "mdurat3",
    "mdurat4",
    "mdurat5",
    "mdurat6",
    "mdurat7",
    "mdurat8",
    "mmeasu1",
    "mmeasu2",
    "mmeasu3",
    "mmeasu4",
    "mmeasu5",
    "mmeasu6",
    "mmeasu7",
    "mmeasu8",
    "mmed1",
    "mmed2",
    "mmed3",
    "mmed4",
    "mmed5",
    "mmed6",
    "mmed7",
    "mmed8",
    "mmedbis",
    "mmedbisnm",
    "mmedcaltab",
    "mmedcort",
    "mmedcortnm",
    "mmedfertab",
    "mmednr1",
    "mmednr2",
    "mmednr3",
    "mmednr4",
    "mmednr5",
    "mmednr6",
    "mmednr7",
    "mmednr8",
    "mmeduse",
    "mmedvittab",
    "mmeno82",
    "mmenonrm",
    "moes",
    "moesatc",
    "moesnr",
    "mperio1",
    "mperio2",
    "mperio3",
    "mperio4",
    "mperio5",
    "mperio6",
    "mperio7",
    "mperio8",
    "mquant1",
    "mquant2",
    "mquant3",
    "mquant4",
    "mquant5",
    "mquant6",
    "mquant7",
    "mquant8"
  ),
  `E` = c(
    "m#med",
    "m#timp1",
    "m#timp2",
    "m#timp3",
    "m#timp4",
    "m#timp5",
    "m#timp6",
    "m#timp7",
    "m#timp8",
    "matc1",
    "matc2",
    "matc3",
    "matc4",
    "matc5",
    "matc6",
    "matc7",
    "matc8",
    "mbff",
    "mbffatc",
    "mbffnr",
    "mccs",
    "mccsatc",
    "mccsnr",
    "mdurat1",
    "mdurat2",
    "mdurat3",
    "mdurat4",
    "mdurat5",
    "mdurat6",
    "mdurat7",
    "mdurat8",
    "mmeasu1",
    "mmeasu2",
    "mmeasu3",
    "mmeasu4",
    "mmeasu5",
    "mmeasu6",
    "mmeasu7",
    "mmeasu8",
    "mmed1",
    "mmed2",
    "mmed3",
    "mmed4",
    "mmed5",
    "mmed6",
    "mmed7",
    "mmed8",
    "mmedbis",
    "mmedbisnm",
    "mmedcort",
    "mmedcortnm",
    "mmednr1",
    "mmednr2",
    "mmednr3",
    "mmednr4",
    "mmednr5",
    "mmednr6",
    "mmednr7",
    "mmednr8",
    "mmeduse",
    "mperio1",
    "mperio2",
    "mperio3",
    "mperio4",
    "mperio5",
    "mperio6",
    "mperio7",
    "mperio8",
    "mquant1",
    "mquant2",
    "mquant3",
    "mquant4",
    "mquant5",
    "mquant6",
    "mquant7",
    "mquant8"
  ),
  `2B` = c(
    "m#med",
    "m#timp1",
    "m#timp2",
    "m#timp3",
    "m#timp4",
    "m#timp5",
    "m#timp6",
    "m#timp7",
    "m#timp8",
    "matc1",
    "matc2",
    "matc3",
    "matc4",
    "matc5",
    "matc6",
    "matc7",
    "matc8",
    "mccs",
    "mccsatc",
    "mccsnr",
    "mdurat1",
    "mdurat2",
    "mdurat3",
    "mdurat4",
    "mdurat5",
    "mdurat6",
    "mdurat7",
    "mdurat8",
    "mmeasu1",
    "mmeasu2",
    "mmeasu3",
    "mmeasu4",
    "mmeasu5",
    "mmeasu6",
    "mmeasu7",
    "mmeasu8",
    "mmed1",
    "mmed2",
    "mmed3",
    "mmed4",
    "mmed5",
    "mmed6",
    "mmed7",
    "mmed8",
    "mmedcort",
    "mmedcortnm",
    "mmednr1",
    "mmednr2",
    "mmednr3",
    "mmednr4",
    "mmednr5",
    "mmednr6",
    "mmednr7",
    "mmednr8",
    "mmeduse",
    "mperio1",
    "mperio2",
    "mperio3",
    "mperio4",
    "mperio5",
    "mperio6",
    "mperio7",
    "mperio8",
    "mquant1",
    "mquant2",
    "mquant3",
    "mquant4",
    "mquant5",
    "mquant6",
    "mquant7",
    "mquant8"
  ),
  `F` = c(
    "m#med",
    "m#timp1",
    "m#timp2",
    "m#timp3",
    "m#timp4",
    "m#timp5",
    "m#timp6",
    "m#timp7",
    "m#timp8",
    "matc1",
    "matc2",
    "matc3",
    "matc4",
    "matc5",
    "matc6",
    "matc7",
    "matc8",
    "mccs",
    "mccsatc",
    "mccsnr",
    "mdurat1",
    "mdurat2",
    "mdurat3",
    "mdurat4",
    "mdurat5",
    "mdurat6",
    "mdurat7",
    "mdurat8",
    "mmeasu1",
    "mmeasu2",
    "mmeasu3",
    "mmeasu4",
    "mmeasu5",
    "mmeasu6",
    "mmeasu7",
    "mmeasu8",
    "mmed1",
    "mmed2",
    "mmed3",
    "mmed4",
    "mmed5",
    "mmed6",
    "mmed7",
    "mmed8",
    "mmedcort",
    "mmedcortnm",
    "mmednr1",
    "mmednr2",
    "mmednr3",
    "mmednr4",
    "mmednr5",
    "mmednr6",
    "mmednr7",
    "mmednr8",
    "mmeduse",
    "mperio1",
    "mperio2",
    "mperio3",
    "mperio4",
    "mperio5",
    "mperio6",
    "mperio7",
    "mperio8",
    "mquant1",
    "mquant2",
    "mquant3",
    "mquant4",
    "mquant5",
    "mquant6",
    "mquant7",
    "mquant8"
  ),
  `G` = c(
    "drinking",
    "m#med",
    "m#timp1",
    "m#timp10",
    "m#timp2",
    "m#timp3",
    "m#timp4",
    "m#timp5",
    "m#timp6",
    "m#timp7",
    "m#timp8",
    "m#timp9",
    "matc1",
    "matc10",
    "matc2",
    "matc3",
    "matc4",
    "matc5",
    "matc6",
    "matc7",
    "matc8",
    "matc9",
    "mccs",
    "mccsatc",
    "mdform1",
    "mdform10",
    "mdform2",
    "mdform3",
    "mdform4",
    "mdform5",
    "mdform6",
    "mdform7",
    "mdform8",
    "mdform9",
    "mdurat1",
    "mdurat10",
    "mdurat2",
    "mdurat3",
    "mdurat4",
    "mdurat5",
    "mdurat6",
    "mdurat7",
    "mdurat8",
    "mdurat9",
    "mmeasu1",
    "mmeasu10",
    "mmeasu2",
    "mmeasu3",
    "mmeasu4",
    "mmeasu5",
    "mmeasu6",
    "mmeasu7",
    "mmeasu8",
    "mmeasu9",
    "mmed1",
    "mmed10",
    "mmed2",
    "mmed3",
    "mmed4",
    "mmed5",
    "mmed6",
    "mmed7",
    "mmed8",
    "mmed9",
    "mmedcort",
    "mmedcortnm",
    "mmeduse",
    "mperio1",
    "mperio10",
    "mperio2",
    "mperio3",
    "mperio4",
    "mperio5",
    "mperio6",
    "mperio7",
    "mperio8",
    "mperio9",
    "mquant1",
    "mquant10",
    "mquant2",
    "mquant3",
    "mquant4",
    "mquant5",
    "mquant6",
    "mquant7",
    "mquant8",
    "mquant9"
  ),
  `H` = c(
    "drinking",
    "m#med",
    "m#timp1",
    "m#timp10",
    "m#timp11",
    "m#timp12",
    "m#timp13",
    "m#timp14",
    "m#timp2",
    "m#timp3",
    "m#timp4",
    "m#timp5",
    "m#timp6",
    "m#timp7",
    "m#timp8",
    "m#timp9",
    "matc1",
    "matc10",
    "matc11",
    "matc12",
    "matc13",
    "matc14",
    "matc2",
    "matc3",
    "matc4",
    "matc5",
    "matc6",
    "matc7",
    "matc8",
    "matc9",
    "mdform1",
    "mdform10",
    "mdform11",
    "mdform12",
    "mdform13",
    "mdform14",
    "mdform2",
    "mdform3",
    "mdform4",
    "mdform5",
    "mdform6",
    "mdform7",
    "mdform8",
    "mdform9",
    "mdurat1",
    "mdurat10",
    "mdurat11",
    "mdurat12",
    "mdurat13",
    "mdurat14",
    "mdurat2",
    "mdurat3",
    "mdurat4",
    "mdurat5",
    "mdurat6",
    "mdurat7",
    "mdurat8",
    "mdurat9",
    "mmeasu1",
    "mmeasu10",
    "mmeasu11",
    "mmeasu12",
    "mmeasu13",
    "mmeasu14",
    "mmeasu2",
    "mmeasu3",
    "mmeasu4",
    "mmeasu5",
    "mmeasu6",
    "mmeasu7",
    "mmeasu8",
    "mmeasu9",
    "mmed1",
    "mmed10",
    "mmed11",
    "mmed12",
    "mmed13",
    "mmed14",
    "mmed2",
    "mmed3",
    "mmed4",
    "mmed5",
    "mmed6",
    "mmed7",
    "mmed8",
    "mmed9",
    "mmedcort",
    "mmeduse",
    "mperio1",
    "mperio10",
    "mperio11",
    "mperio12",
    "mperio13",
    "mperio14",
    "mperio2",
    "mperio3",
    "mperio4",
    "mperio5",
    "mperio6",
    "mperio7",
    "mperio8",
    "mperio9",
    "mquant1",
    "mquant10",
    "mquant11",
    "mquant12",
    "mquant13",
    "mquant14",
    "mquant2",
    "mquant3",
    "mquant4",
    "mquant5",
    "mquant6",
    "mquant7",
    "mquant8",
    "mquant9"
  ),
  `3B` = c(
    "drinking",
    "m#med",
    "m#timp1",
    "m#timp2",
    "m#timp3",
    "m#timp4",
    "m#timp5",
    "m#timp6",
    "m#timp7",
    "m#timp8",
    "matc1",
    "matc2",
    "matc3",
    "matc4",
    "matc5",
    "matc6",
    "matc7",
    "matc8",
    "mcalcfr",
    "mccs1",
    "mccs2",
    "mccsatc1",
    "mccsatc2",
    "mdairy",
    "mdform1",
    "mdform2",
    "mdform3",
    "mdform4",
    "mdform5",
    "mdform6",
    "mdform7",
    "mdform8",
    "mdurat1",
    "mdurat2",
    "mdurat3",
    "mdurat4",
    "mdurat5",
    "mdurat6",
    "mdurat7",
    "mdurat8",
    "mmeasu1",
    "mmeasu2",
    "mmeasu3",
    "mmeasu4",
    "mmeasu5",
    "mmeasu6",
    "mmeasu7",
    "mmeasu8",
    "mmed1",
    "mmed2",
    "mmed3",
    "mmed4",
    "mmed5",
    "mmed6",
    "mmed7",
    "mmed8",
    "mmedcaltab",
    "mmedcort",
    "mmedcortnm1",
    "mmedcortnm2",
    "mmeduse",
    "mmedvittab",
    "mperio1",
    "mperio2",
    "mperio3",
    "mperio4",
    "mperio5",
    "mperio6",
    "mperio7",
    "mperio8",
    "mquant1",
    "mquant2",
    "mquant3",
    "mquant4",
    "mquant5",
    "mquant6",
    "mquant7",
    "mquant8",
    "mvit1",
    "mvit2",
    "mvit3",
    "mvitfr1",
    "mvitfr2",
    "mvitfr3"
  ),
  `MB` = c(
    "drinking",
    "m#timp1",
    "matc1",
    "mdform1",
    "mdurat1",
    "mmeasu1",
    "mmed1",
    "mmeduse",
    "mperio1",
    "mquant1",
    "mvit3"
  ),
  `I` = c(
    "drinking",
    "m#med",
    "m#timp1",
    "matc1",
    "mdform1",
    "mdurat1",
    "mmeasu1",
    "mmed1",
    "mmeduse",
    "mperio1",
    "mquant1"
  ),
  `J` = c(
    "drinking",
    "m#med",
    "m#timp1",
    "matc1",
    "mdform1",
    "mdurat1",
    "mmeasu1",
    "mmed1",
    "mmeduse",
    "mperio1",
    "mquant1"
  ),
  `K` = c(
    "drinking",
    "m#med",
    "m#timp1",
    "matc1",
    "mdform1",
    "mdurat1",
    "mmeasu1",
    "mmed1",
    "mmeduse",
    "mperio1",
    "mquant1"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    matc1 = "med. 1: ATC-code (constructed)",
    mmeduse = "Medication use",
    mmedvittab = "Tablets: vitamins"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    matc1 = "Medicine 1: ATC-code (constructed)",
    matc2 = "Medicine 2: ATC-code (constructed)",
    matc3 = "Medicine 3: ATC-code (constructed)",
    matc4 = "Medicine 4: ATC-code (constructed)",
    matc5 = "Medicine 5: ATC-code (constructed)",
    matc6 = "Medicine 6: ATC-code (constructed)",
    matc7 = "Medicine 7: ATC-code (constructed)",
    matc8 = "Medicine 8: ATC-code (constructed)",
    mdurat1 = "Medicine 1: duration",
    mdurat2 = "Medicine 2: duration",
    mdurat3 = "Medicine 3: duration",
    mdurat4 = "Medicine 4: duration",
    mdurat5 = "Medicine 5: duration",
    mdurat6 = "Medicine 6: duration",
    mdurat7 = "Medicine 7: duration",
    mdurat8 = "Medicine 8: duration",
    mmeasu1 = "Medicine 1: measurement",
    mmeasu2 = "Medicine 2: measurement",
    mmeasu3 = "Medicine 3: measurement",
    mmeasu4 = "Medicine 4: measurement",
    mmeasu5 = "Medicine 5: measurement",
    mmeasu6 = "Medicine 6: measurement",
    mmeasu7 = "Medicine 7: measurement",
    mmeasu8 = "Medicine 8: measurement",
    mmed1 = "Medicine 1: name",
    mmed2 = "Medicine 2: name",
    mmed3 = "Medicine 3: name",
    mmed4 = "Medicine 4: name",
    mmed5 = "Medicine 5: name",
    mmed6 = "Medicine 6: name",
    mmed7 = "Medicine 7: name",
    mmed8 = "Medicine 8: name",
    mmedbis = "Use of biphosfonates last 10 years",
    mmedcort = "Ever use corticosteroïden > 3 months",
    mmeduse = "Medication use",
    mmedvittab = "Tablets: vitamines",
    mquant1 = "Medicine 1: quantity",
    mquant2 = "Medicine 2: quantity",
    mquant3 = "Medicine 3: quantity",
    mquant4 = "Medicine 4: quantity",
    mquant5 = "Medicine 5: quantity",
    mquant6 = "Medicine 6: quantity",
    mquant7 = "Medicine 7: quantity",
    mquant8 = "Medicine 8: quantity"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    matc1 = "med. 1: ATC-code (constructed)",
    mmedcaltab = "tablets: calcium",
    mmedcort = "ever use corticosteroids > 3 months",
    mmedfertab = "tablets: ferro",
    mmedvittab = "tablets: vitamins"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    matc1 = "med. 1: ATC-code (constructed)",
    mmedcort = "use corticosteroids last 3 years"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    matc1 = "med. 1: ATC-code (constructed)",
    mmedcort = "use corticosteroids last 3 years"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    matc1 = "med. 1: ATC-code (constructed)",
    mmedcort = "use corticosteroids last 3 years"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    matc2 = "med. 2: ATC-code in: G, H, 3B, I, J, K:",
    matc3 = "med. 3: ATC-code in: G, H, 3B, I, J, K:",
    matc4 = "med. 4: ATC-code in: G, H, 3B, I, J, K:",
    matc5 = "med. 5: ATC-code in: G, H, 3B, I, J, K:",
    matc6 = "med. 6: ATC-code in: G, H, 3B, I, J, K:",
    matc7 = "med. 7: ATC-code in: G, H, 3B, I, J, K:",
    matc8 = "med. 8: ATC-code in: G, H, 3B, I, J, K:",
    mccsatc = "corticosteroid: ATC-code",
    mmedcort = "use corticosteroids last 3 years"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    matc2 = "med. 2: ATC-code in: G, H, 3B, I, J, K:",
    matc3 = "med. 3: ATC-code in: G, H, 3B, I, J, K:",
    matc4 = "med. 4: ATC-code in: G, H, 3B, I, J, K:",
    matc5 = "med. 5: ATC-code in: G, H, 3B, I, J, K:",
    matc6 = "med. 6: ATC-code in: G, H, 3B, I, J, K:",
    matc7 = "med. 7: ATC-code in: G, H, 3B, I, J, K:",
    matc8 = "med. 8: ATC-code in: G, H, 3B, I, J, K:",
    mmedcort = "use corticosteroids last 3 years"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    matc2 = "med. 2: ATC-code in: G, H, 3B, I, J, K:",
    matc3 = "med. 3: ATC-code in: G, H, 3B, I, J, K:",
    matc4 = "med. 4: ATC-code in: G, H, 3B, I, J, K:",
    matc5 = "med. 5: ATC-code in: G, H, 3B, I, J, K:",
    matc6 = "med. 6: ATC-code in: G, H, 3B, I, J, K:",
    matc7 = "med. 7: ATC-code in: G, H, 3B, I, J, K:",
    matc8 = "med. 8: ATC-code in: G, H, 3B, I, J, K:",
    mmedcaltab = "use of calcium tablets (no prescription)",
    mmedcort = "use prescribed corticosteroids ever"
  ),
  Wave_MB_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "day",
  `2` = "1 month to 1 year",
  `3` = "1 to 5 years",
  `4` = "effervescent tablet",
  `5` = "as required",
  `6` = "inhaler",
  `7` = "powder",
  `8` = "ointment"
)

standardized_value_labels <- list(
  drinking = c(
    default_missing_labels[c("-1")],
    `1` = "with each meal (3 or more glasses a day)",
    `2` = "not with each meal (1 or 2 glasses a day)",
    `3` = "every week, but not every day",
    `4` = "every week, but not every day",
    `5` = "less than once a week"
  ),
  `m#med` = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see BMMEDUSE",
    `0` = "no medicines"
  ),
  `m#timp1` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp10` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp11` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp12` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp13` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp14` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp2` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp3` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp4` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp5` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp6` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp7` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp8` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")]
  ),
  `m#timp9` = c(
    `-3` = "na, for thrombosis",
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  matc1 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc10 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc11 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc12 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc13 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc14 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc2 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc3 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc4 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc5 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc6 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc7 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc8 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  matc9 = c(
    `-2` = "na, see G/H/B/I/J/KMMEDUSE",
    default_missing_labels[c("-1")]
  ),
  mbff = stats::setNames(character(0), character(0)),
  mbffatc = stats::setNames(character(0), character(0)),
  mbffnr = c(
    `-2` = "na, see D/EM#MED",
    default_missing_labels[c("-1")]
  ),
  mcalcfr = c(
    default_missing_labels[c("-1")],
    `1` = "less than one day a week",
    `2` = "1-2 days a week",
    `3` = "3-4 days a week",
    `4` = "5-6 days a week",
    `5` = "daily"
  ),
  mccs = stats::setNames(character(0), character(0)),
  mccs1 = stats::setNames(character(0), character(0)),
  mccs2 = stats::setNames(character(0), character(0)),
  mccsatc = stats::setNames(character(0), character(0)),
  mccsatc1 = stats::setNames(character(0), character(0)),
  mccsatc2 = stats::setNames(character(0), character(0)),
  mccsnr = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")]
  ),
  mdairy = stats::setNames(character(0), character(0)),
  mdform1 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form / plaster",
    `10` = "suppository",
    `11` = "spray",
    `12` = "other form"
  ),
  mdform10 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form"
  ),
  mdform11 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form"
  ),
  mdform12 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form"
  ),
  mdform13 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form"
  ),
  mdform14 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form"
  ),
  mdform2 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form / plaster",
    `10` = "suppository",
    `11` = "spray",
    `12` = "other form"
  ),
  mdform3 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form / plaster",
    `10` = "suppository",
    `11` = "spray",
    `12` = "other form"
  ),
  mdform4 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form / plaster",
    `10` = "suppository",
    `11` = "spray",
    `12` = "other form"
  ),
  mdform5 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form / plaster",
    `10` = "suppository",
    `11` = "spray",
    `12` = "other form"
  ),
  mdform6 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form / plaster",
    `10` = "suppository",
    `11` = "spray",
    `12` = "other form"
  ),
  mdform7 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form / plaster",
    `10` = "suppository",
    `11` = "spray",
    `12` = "other form"
  ),
  mdform8 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form / plaster",
    `10` = "suppository",
    `11` = "spray",
    `12` = "other form"
  ),
  mdform9 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    default_answer_labels[c("4", "6", "7", "8")],
    `5` = "injection",
    `9` = "other form"
  ),
  mdos1 = c(`-2` = "na, see BMMED", `-1` = "R does not know"),
  mdos2 = c(`-2` = "na, see BMMED", `-1` = "R does not know"),
  mdos3 = c(`-2` = "na, see BMMED", `-1` = "R does not know"),
  mdos4 = c(`-2` = "na, see BMMED", `-1` = "R does not know"),
  mdos5 = c(`-2` = "na, see BMMED", `-1` = "R does not know"),
  mdos6 = c(`-2` = "na, see BMMED", `-1` = "R does not know"),
  mdurat1 = c(
    `-3` = "no valid data / na, wrong skip",
    `-2` = "na, see BM#MED",
    `-1` = "na, asked / no valid data",
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years / longer than 5 years 1",
    `5` = "sometimes",
    `6` = "only when necessary"
  ),
  mdurat10 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years 1"
  ),
  mdurat11 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years 1"
  ),
  mdurat12 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years 1"
  ),
  mdurat13 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years 1"
  ),
  mdurat14 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years 1"
  ),
  mdurat2 = c(
    `-3` = "no valid data / na, wrong skip",
    `-2` = "na, see BM#MED",
    `-1` = "na, asked / no valid data",
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years / longer than 5 years 1",
    `5` = "sometimes",
    `6` = "only when necessary"
  ),
  mdurat3 = c(
    `-3` = "no valid data / na, wrong skip",
    `-2` = "na, see BM#MED",
    `-1` = "na, asked / no valid data",
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years / longer than 5 years 1",
    `5` = "sometimes",
    `6` = "only when necessary"
  ),
  mdurat4 = c(
    `-3` = "no valid data / na, wrong skip",
    `-2` = "na, see BM#MED",
    `-1` = "na, asked / no valid data",
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years / longer than 5 years 1",
    `5` = "sometimes",
    `6` = "only when necessary"
  ),
  mdurat5 = c(
    `-3` = "no valid data / na, wrong skip",
    `-2` = "na, see BM#MED",
    `-1` = "na, asked / no valid data",
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years / longer than 5 years 1",
    `5` = "sometimes",
    `6` = "only when necessary"
  ),
  mdurat6 = c(
    `-3` = "no valid data / na, wrong skip",
    `-2` = "na, see BM#MED",
    `-1` = "na, asked / no valid data",
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years / longer than 5 years 1",
    `5` = "sometimes",
    `6` = "only when necessary"
  ),
  mdurat7 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked",
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years / longer than 5 years 1"
  ),
  mdurat8 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked",
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years / longer than 5 years 1"
  ),
  mdurat9 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    `1` = "less than 1 month",
    default_answer_labels[c("2", "3")],
    `4` = "longer than 5 years 1"
  ),
  mmeasu1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement / milliliter",
    `5` = "unit per ml",
    `6` = "percentage"
  ),
  mmeasu10 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
  mmeasu11 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
  mmeasu12 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
  mmeasu13 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
  mmeasu14 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
  mmeasu2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement / milliliter",
    `5` = "unit per ml",
    `6` = "percentage"
  ),
  mmeasu3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement / milliliter",
    `5` = "unit per ml",
    `6` = "percentage"
  ),
  mmeasu4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement / milliliter",
    `5` = "unit per ml",
    `6` = "percentage"
  ),
  mmeasu5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement / milliliter",
    `5` = "unit per ml",
    `6` = "percentage"
  ),
  mmeasu6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement / milliliter",
    `5` = "unit per ml",
    `6` = "percentage"
  ),
  mmeasu7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement / milliliter",
    `5` = "unit per ml",
    `6` = "percentage"
  ),
  mmeasu8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement / milliliter",
    `5` = "unit per ml",
    `6` = "percentage"
  ),
  mmeasu9 = c(
    `-2` = "na, see G/HM#MED",
    default_missing_labels[c("-1")],
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
  mmed1 = stats::setNames(character(0), character(0)),
  mmed10 = stats::setNames(character(0), character(0)),
  mmed11 = stats::setNames(character(0), character(0)),
  mmed12 = stats::setNames(character(0), character(0)),
  mmed13 = stats::setNames(character(0), character(0)),
  mmed14 = stats::setNames(character(0), character(0)),
  mmed2 = stats::setNames(character(0), character(0)),
  mmed3 = stats::setNames(character(0), character(0)),
  mmed4 = stats::setNames(character(0), character(0)),
  mmed5 = stats::setNames(character(0), character(0)),
  mmed6 = stats::setNames(character(0), character(0)),
  mmed7 = stats::setNames(character(0), character(0)),
  mmed8 = stats::setNames(character(0), character(0)),
  mmed9 = stats::setNames(character(0), character(0)),
  mmedbis = c(
    `-5` = "na, interview terminated",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mmedbisnm = stats::setNames(character(0), character(0)),
  mmedcaltab = c(
    `-5` = "na, interview terminated",
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mmedcort = c(
    `-5` = "na, interview terminated",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mmedcortnm = c(
    `-3` = "only once/ short cure / only once / short cure",
    `-2` = "na, see D/E/B/FMMEDCORT",
    `-1` = "R does not know period / na, asked / na, asked",
    `99` = "99 months or longer"
  ),
  mmedcortnm1 = c(
    default_missing_labels[c("-1")]
  ),
  mmedcortnm2 = c(
    `-2` = "na, no second corticosteroid",
    default_missing_labels[c("-1")]
  ),
  mmedfertab = c(
    `-5` = "na, interview terminated",
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mmednr1 = c(
    `-2` = "na, see BM#MED",
    default_missing_labels[c("-1")]
  ),
  mmednr2 = c(
    `-2` = "na, see BM#MED",
    default_missing_labels[c("-1")]
  ),
  mmednr3 = c(
    `-2` = "na, see BM#MED",
    default_missing_labels[c("-1")]
  ),
  mmednr4 = c(
    `-2` = "na, see BM#MED",
    default_missing_labels[c("-1")]
  ),
  mmednr5 = c(
    `-2` = "na, see BM#MED",
    default_missing_labels[c("-1")]
  ),
  mmednr6 = c(
    `-2` = "na, see BM#MED",
    default_missing_labels[c("-1")]
  ),
  mmednr7 = c(
    `-2` = "na, see CM#MED",
    default_missing_labels[c("-1")]
  ),
  mmednr8 = c(
    `-2` = "na, see CM#MED",
    default_missing_labels[c("-1")]
  ),
  mmeduse = c(
    `-5` = "na, interview terminated",
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mmedvitinj = c(
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mmedvittab = c(
    `-5` = "na, interview terminated",
    `-2` = "no answer, skipped",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mmeno82 = c(
    `-2` = "na, male respondent",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mmenonrm = c(`-2` = "na, see DMMENO82", `-1` = "R does not know period", `99` = "99 months or longer"),
  moes = stats::setNames(character(0), character(0)),
  moesatc = stats::setNames(character(0), character(0)),
  moesnr = c(
    `-2` = "na, see DM#MED",
    default_missing_labels[c("-1")]
  ),
  mperio1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio10 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio11 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio12 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio13 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio14 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mperio9 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "5")],
    `2` = "week",
    `3` = "month",
    `4` = "for thrombosis",
    `6` = "other kind of period"
  ),
  mquant1 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked"
  ),
  mquant10 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  mquant11 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  mquant12 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  mquant13 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  mquant14 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  mquant2 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked"
  ),
  mquant3 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked"
  ),
  mquant4 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked"
  ),
  mquant5 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked"
  ),
  mquant6 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked"
  ),
  mquant7 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked"
  ),
  mquant8 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data / na, asked"
  ),
  mquant9 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    default_missing_labels[c("-1")]
  ),
  mtad1 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `98` = "less than once a day",
    `99` = "if necessary"
  ),
  mtad2 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `98` = "less than once a day",
    `99` = "if necessary"
  ),
  mtad3 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `98` = "less than once a day",
    `99` = "if necessary"
  ),
  mtad4 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `98` = "less than once a day",
    `99` = "if necessary"
  ),
  mtad5 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `98` = "less than once a day",
    `99` = "if necessary"
  ),
  mtad6 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `98` = "less than once a day",
    `99` = "if necessary"
  ),
  mtad7 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `98` = "less than once a day",
    `99` = "if necessary"
  ),
  mtad8 = c(
    default_missing_labels[c("-3")],
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `98` = "less than once a day",
    `99` = "if necessary"
  ),
  mvit1 = stats::setNames(character(0), character(0)),
  mvit2 = stats::setNames(character(0), character(0)),
  mvit3 = stats::setNames(character(0), character(0)),
  mvitfr1 = c(
    default_missing_labels[c("-1")],
    `1` = "less than one day a week",
    `2` = "1-2 days a week",
    `3` = "3-4 days a week",
    `4` = "5-6 days a week",
    `5` = "daily"
  ),
  mvitfr2 = c(
    `-2` = "na, no second vitamin",
    default_missing_labels[c("-1")],
    `1` = "less than one day a week",
    `2` = "1-2 days a week",
    `3` = "3-4 days a week",
    `4` = "5-6 days a week",
    `5` = "daily"
  ),
  mvitfr3 = c(
    `-2` = "na, no third vitamin",
    default_missing_labels[c("-1")],
    `1` = "less than one day a week",
    `2` = "1-2 days a week",
    `3` = "3-4 days a week",
    `4` = "5-6 days a week",
    `5` = "daily"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`-3` = "na, wrong skip", `-2` = "na, see BMMEDUSE"),
    mdurat1 = .replace_labels(
    standardized_value_labels$mdurat1,
    `-3` = "no valid data",
    `-1` = "na, asked",
    `4` = "longer than 5 years"
  ),
    mdurat2 = .replace_labels(
    standardized_value_labels$mdurat2,
    `-3` = "no valid data",
    `-1` = "na, asked",
    `4` = "longer than 5 years"
  ),
    mdurat3 = .replace_labels(
    standardized_value_labels$mdurat3,
    `-3` = "no valid data",
    `-1` = "na, asked",
    `4` = "longer than 5 years"
  ),
    mdurat4 = .replace_labels(
    standardized_value_labels$mdurat4,
    `-3` = "no valid data",
    `-1` = "na, asked",
    `4` = "longer than 5 years"
  ),
    mdurat5 = .replace_labels(
    standardized_value_labels$mdurat5,
    `-3` = "no valid data",
    `-1` = "na, asked",
    `4` = "longer than 5 years"
  ),
    mdurat6 = .replace_labels(
    standardized_value_labels$mdurat6,
    `-3` = "no valid data",
    `-1` = "na, asked",
    `4` = "longer than 5 years"
  ),
    mmedcaltab = c(`-2` = "no answer, skipped", `-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    mmedfertab = c(`-2` = "no answer, skipped", `-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    mmeduse = c(`-2` = "no answer, skipped", `-1` = "no answer, asked", `1` = "no", `2` = "yes"),
    mmedvittab = c(`-2` = "no answer, skipped", `-1` = "no answer, asked", `1` = "no", `2` = "yes")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`-2` = "na, see CMMEDUSE"),
    mdurat1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CM#MED",
    `-1` = "no valid data",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat7 = .replace_labels(
    standardized_value_labels$mdurat7,
    `-1` = "no valid data",
    `4` = "longer than 5 years"
  ),
    mdurat8 = .replace_labels(
    standardized_value_labels$mdurat8,
    `-1` = "no valid data",
    `4` = "longer than 5 years"
  ),
    mmedcaltab = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedfertab = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmednr1 = .replace_labels(
    standardized_value_labels$mmednr1,
    `-2` = "na, see CM#MED"
  ),
    mmednr2 = .replace_labels(
    standardized_value_labels$mmednr2,
    `-2` = "na, see CM#MED"
  ),
    mmednr3 = .replace_labels(
    standardized_value_labels$mmednr3,
    `-2` = "na, see CM#MED"
  ),
    mmednr4 = .replace_labels(
    standardized_value_labels$mmednr4,
    `-2` = "na, see CM#MED"
  ),
    mmednr5 = .replace_labels(
    standardized_value_labels$mmednr5,
    `-2` = "na, see CM#MED"
  ),
    mmednr6 = .replace_labels(
    standardized_value_labels$mmednr6,
    `-2` = "na, see CM#MED"
  ),
    mmeduse = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedvittab = c(`-5` = "na, interview terminated", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mquant1 = .replace_labels(
    standardized_value_labels$mquant1,
    `-1` = "no valid data"
  ),
    mquant2 = .replace_labels(
    standardized_value_labels$mquant2,
    `-1` = "no valid data"
  ),
    mquant3 = .replace_labels(
    standardized_value_labels$mquant3,
    `-1` = "no valid data"
  ),
    mquant4 = .replace_labels(
    standardized_value_labels$mquant4,
    `-1` = "no valid data"
  ),
    mquant5 = .replace_labels(
    standardized_value_labels$mquant5,
    `-1` = "no valid data"
  ),
    mquant6 = .replace_labels(
    standardized_value_labels$mquant6,
    `-1` = "no valid data"
  ),
    mquant7 = .replace_labels(
    standardized_value_labels$mquant7,
    `-1` = "no valid data"
  ),
    mquant8 = .replace_labels(
    standardized_value_labels$mquant8,
    `-1` = "no valid data"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`0` = "no medicines"),
    mdurat1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mmeasu1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmedbis = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedcort = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedcortnm = c(
    `-2` = "na, see D/E/B/FMMEDCORT",
    `-1` = "R does not know period / na, asked",
    `99` = "99 months or longer"
  ),
    mmednr1 = .replace_labels(
    standardized_value_labels$mmednr1,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr2 = .replace_labels(
    standardized_value_labels$mmednr2,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr3 = .replace_labels(
    standardized_value_labels$mmednr3,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr4 = .replace_labels(
    standardized_value_labels$mmednr4,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr5 = .replace_labels(
    standardized_value_labels$mmednr5,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr6 = .replace_labels(
    standardized_value_labels$mmednr6,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr7 = .replace_labels(
    standardized_value_labels$mmednr7,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr8 = .replace_labels(
    standardized_value_labels$mmednr8,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedvittab = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mquant1 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant2 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant3 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant4 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant5 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant6 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant7 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant8 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`0` = "no medicines"),
    mdurat1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mmeasu1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmedbis = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedcort = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedcortnm = c(
    `-3` = "only once/ short cure",
    `-2` = "na, see D/E/B/FMMEDCORT",
    `-1` = "R does not know period / na, asked"
  ),
    mmednr1 = .replace_labels(
    standardized_value_labels$mmednr1,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr2 = .replace_labels(
    standardized_value_labels$mmednr2,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr3 = .replace_labels(
    standardized_value_labels$mmednr3,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr4 = .replace_labels(
    standardized_value_labels$mmednr4,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr5 = .replace_labels(
    standardized_value_labels$mmednr5,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr6 = .replace_labels(
    standardized_value_labels$mmednr6,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr7 = .replace_labels(
    standardized_value_labels$mmednr7,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr8 = .replace_labels(
    standardized_value_labels$mmednr8,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mquant1 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant2 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant3 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant4 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant5 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant6 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant7 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant8 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`0` = "no medicines"),
    mdurat1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mmeasu1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmedcort = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedcortnm = c(
    `-3` = "only once/ short cure",
    `-2` = "na, see D/E/B/FMMEDCORT",
    `-1` = "R does not know period / na, asked"
  ),
    mmednr1 = .replace_labels(
    standardized_value_labels$mmednr1,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr2 = .replace_labels(
    standardized_value_labels$mmednr2,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr3 = .replace_labels(
    standardized_value_labels$mmednr3,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr4 = .replace_labels(
    standardized_value_labels$mmednr4,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr5 = .replace_labels(
    standardized_value_labels$mmednr5,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr6 = .replace_labels(
    standardized_value_labels$mmednr6,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr7 = .replace_labels(
    standardized_value_labels$mmednr7,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr8 = .replace_labels(
    standardized_value_labels$mmednr8,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mquant1 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant2 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant3 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant4 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant5 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant6 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant7 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant8 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`0` = "no medicines"),
    mdurat1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mdurat8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years"
  ),
    mmeasu1 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu2 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu3 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu4 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu5 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu6 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu7 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu8 = c(
    `-2` = "na, see D/E/B/FM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmedcort = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedcortnm = c(
    `-3` = "only once/ short cure",
    `-2` = "na, see D/E/B/FMMEDCORT",
    `-1` = "R does not know period / na, asked"
  ),
    mmednr1 = .replace_labels(
    standardized_value_labels$mmednr1,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr2 = .replace_labels(
    standardized_value_labels$mmednr2,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr3 = .replace_labels(
    standardized_value_labels$mmednr3,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr4 = .replace_labels(
    standardized_value_labels$mmednr4,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr5 = .replace_labels(
    standardized_value_labels$mmednr5,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr6 = .replace_labels(
    standardized_value_labels$mmednr6,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr7 = .replace_labels(
    standardized_value_labels$mmednr7,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmednr8 = .replace_labels(
    standardized_value_labels$mmednr8,
    `-2` = "na, see D/E/B/FM#MED"
  ),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mquant1 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant2 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant3 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant4 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant5 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant6 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant7 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked"),
    mquant8 = c(`-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`0` = "no medicines"),
    `m#timp1` = .replace_labels(
    standardized_value_labels$`m#timp1`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp2` = .replace_labels(
    standardized_value_labels$`m#timp2`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp3` = .replace_labels(
    standardized_value_labels$`m#timp3`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp4` = .replace_labels(
    standardized_value_labels$`m#timp4`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp5` = .replace_labels(
    standardized_value_labels$`m#timp5`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp6` = .replace_labels(
    standardized_value_labels$`m#timp6`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp7` = .replace_labels(
    standardized_value_labels$`m#timp7`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp8` = .replace_labels(
    standardized_value_labels$`m#timp8`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mdform1 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform2 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform3 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform4 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform5 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform6 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform7 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform8 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdurat1 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat2 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat3 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat4 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat5 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat6 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat7 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat8 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mmeasu1 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu2 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu3 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu4 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu5 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu6 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu7 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu8 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmedcort = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedcortnm = c(`-3` = "only once / short cure", `-2` = "na, see G/HMMEDCORT", `-1` = "na, asked"),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mperio1 = .replace_labels(
    standardized_value_labels$mperio1,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio2 = .replace_labels(
    standardized_value_labels$mperio2,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio3 = .replace_labels(
    standardized_value_labels$mperio3,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio4 = .replace_labels(
    standardized_value_labels$mperio4,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio5 = .replace_labels(
    standardized_value_labels$mperio5,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio6 = .replace_labels(
    standardized_value_labels$mperio6,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio7 = .replace_labels(
    standardized_value_labels$mperio7,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio8 = .replace_labels(
    standardized_value_labels$mperio8,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mquant1 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant2 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant3 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant4 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant5 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant6 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant7 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant8 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`0` = "no medicines"),
    `m#timp1` = .replace_labels(
    standardized_value_labels$`m#timp1`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp2` = .replace_labels(
    standardized_value_labels$`m#timp2`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp3` = .replace_labels(
    standardized_value_labels$`m#timp3`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp4` = .replace_labels(
    standardized_value_labels$`m#timp4`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp5` = .replace_labels(
    standardized_value_labels$`m#timp5`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp6` = .replace_labels(
    standardized_value_labels$`m#timp6`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp7` = .replace_labels(
    standardized_value_labels$`m#timp7`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp8` = .replace_labels(
    standardized_value_labels$`m#timp8`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mdform1 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform2 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform3 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform4 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform5 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform6 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform7 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdform8 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "tablet",
    `2` = "capsule",
    `3` = "drops",
    `4` = "effervescent tablet",
    `5` = "injection",
    `6` = "inhaler",
    `7` = "powder",
    `8` = "ointment",
    `9` = "other form"
  ),
    mdurat1 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat2 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat3 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat4 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat5 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat6 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat7 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat8 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mmeasu1 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu2 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu3 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu4 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu5 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu6 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu7 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmeasu8 = c(
    `-2` = "na, see G/HM#MED",
    `-1` = "na, asked",
    `1` = "microgramme",
    `2` = "milligramme",
    `3` = "gramme",
    `4` = "other measurement"
  ),
    mmedcort = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mperio1 = .replace_labels(
    standardized_value_labels$mperio1,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio2 = .replace_labels(
    standardized_value_labels$mperio2,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio3 = .replace_labels(
    standardized_value_labels$mperio3,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio4 = .replace_labels(
    standardized_value_labels$mperio4,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio5 = .replace_labels(
    standardized_value_labels$mperio5,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio6 = .replace_labels(
    standardized_value_labels$mperio6,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio7 = .replace_labels(
    standardized_value_labels$mperio7,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio8 = .replace_labels(
    standardized_value_labels$mperio8,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mquant1 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant2 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant3 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant4 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant5 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant6 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant7 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant8 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`-2` = "na, see B/I/J/KMMEDUSE", `0` = "no medicines"),
    `m#timp1` = .replace_labels(
    standardized_value_labels$`m#timp1`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp2` = .replace_labels(
    standardized_value_labels$`m#timp2`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp3` = .replace_labels(
    standardized_value_labels$`m#timp3`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp4` = .replace_labels(
    standardized_value_labels$`m#timp4`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp5` = .replace_labels(
    standardized_value_labels$`m#timp5`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp6` = .replace_labels(
    standardized_value_labels$`m#timp6`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp7` = .replace_labels(
    standardized_value_labels$`m#timp7`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    `m#timp8` = .replace_labels(
    standardized_value_labels$`m#timp8`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mdform1 = .replace_labels(
    standardized_value_labels$mdform1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdform2 = .replace_labels(
    standardized_value_labels$mdform2,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdform3 = .replace_labels(
    standardized_value_labels$mdform3,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdform4 = .replace_labels(
    standardized_value_labels$mdform4,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdform5 = .replace_labels(
    standardized_value_labels$mdform5,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdform6 = .replace_labels(
    standardized_value_labels$mdform6,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdform7 = .replace_labels(
    standardized_value_labels$mdform7,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdform8 = .replace_labels(
    standardized_value_labels$mdform8,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdurat1 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat2 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat3 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat4 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat5 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat6 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat7 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mdurat8 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mmeasu1 = .replace_labels(
    standardized_value_labels$mmeasu1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeasu2 = .replace_labels(
    standardized_value_labels$mmeasu2,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeasu3 = .replace_labels(
    standardized_value_labels$mmeasu3,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeasu4 = .replace_labels(
    standardized_value_labels$mmeasu4,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeasu5 = .replace_labels(
    standardized_value_labels$mmeasu5,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeasu6 = .replace_labels(
    standardized_value_labels$mmeasu6,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeasu7 = .replace_labels(
    standardized_value_labels$mmeasu7,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeasu8 = .replace_labels(
    standardized_value_labels$mmeasu8,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmedcaltab = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedcort = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmedvittab = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mperio1 = .replace_labels(
    standardized_value_labels$mperio1,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio2 = .replace_labels(
    standardized_value_labels$mperio2,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio3 = .replace_labels(
    standardized_value_labels$mperio3,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio4 = .replace_labels(
    standardized_value_labels$mperio4,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio5 = .replace_labels(
    standardized_value_labels$mperio5,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio6 = .replace_labels(
    standardized_value_labels$mperio6,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio7 = .replace_labels(
    standardized_value_labels$mperio7,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mperio8 = .replace_labels(
    standardized_value_labels$mperio8,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mquant1 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant2 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant3 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant4 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant5 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant6 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant7 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked"),
    mquant8 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked")
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    `m#timp1` = .replace_labels(
    standardized_value_labels$`m#timp1`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mdform1 = .replace_labels(
    standardized_value_labels$mdform1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdurat1 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mmeasu1 = .replace_labels(
    standardized_value_labels$mmeasu1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mperio1 = .replace_labels(
    standardized_value_labels$mperio1,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mquant1 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`-2` = "na, see B/I/J/KMMEDUSE", `0` = "no medicines"),
    `m#timp1` = .replace_labels(
    standardized_value_labels$`m#timp1`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mdform1 = .replace_labels(
    standardized_value_labels$mdform1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdurat1 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mmeasu1 = .replace_labels(
    standardized_value_labels$mmeasu1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mperio1 = .replace_labels(
    standardized_value_labels$mperio1,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mquant1 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`-2` = "na, see B/I/J/KMMEDUSE", `0` = "no medicines"),
    `m#timp1` = .replace_labels(
    standardized_value_labels$`m#timp1`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mdform1 = .replace_labels(
    standardized_value_labels$mdform1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdurat1 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mmeasu1 = .replace_labels(
    standardized_value_labels$mmeasu1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mperio1 = .replace_labels(
    standardized_value_labels$mperio1,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mquant1 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    `m#med` = c(`-2` = "na, see B/I/J/KMMEDUSE", `0` = "no medicines"),
    `m#timp1` = .replace_labels(
    standardized_value_labels$`m#timp1`,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mdform1 = .replace_labels(
    standardized_value_labels$mdform1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `9` = "plaster"
  ),
    mdurat1 = c(
    `-2` = "na, see G/H/B/B/I/J/KM#MED",
    `-1` = "na, asked",
    `1` = "less than 1 month",
    `2` = "1 month to 1 year",
    `3` = "1 to 5 years",
    `4` = "longer than 5 years 1"
  ),
    mmeasu1 = .replace_labels(
    standardized_value_labels$mmeasu1,
    `-2` = "na, see B/B/I/J/KM#MED",
    `4` = "milliliter"
  ),
    mmeduse = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    mperio1 = .replace_labels(
    standardized_value_labels$mperio1,
    `-2` = "na, see G/H/B/B/I/J/KM#MED"
  ),
    mquant1 = c(`-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  drinking = "categorical",
  `m#med` = "numeric",
  `m#timp1` = "numeric",
  `m#timp10` = "numeric",
  `m#timp11` = "numeric",
  `m#timp12` = "numeric",
  `m#timp13` = "numeric",
  `m#timp14` = "numeric",
  `m#timp2` = "numeric",
  `m#timp3` = "numeric",
  `m#timp4` = "numeric",
  `m#timp5` = "numeric",
  `m#timp6` = "numeric",
  `m#timp7` = "numeric",
  `m#timp8` = "numeric",
  `m#timp9` = "numeric",
  matc1 = "text",
  matc10 = "text",
  matc11 = "text",
  matc12 = "text",
  matc13 = "text",
  matc14 = "text",
  matc2 = "text",
  matc3 = "text",
  matc4 = "text",
  matc5 = "text",
  matc6 = "text",
  matc7 = "text",
  matc8 = "text",
  matc9 = "text",
  mbff = "text",
  mbffatc = "text",
  mbffnr = "numeric",
  mcalcfr = "categorical",
  mccs = "text",
  mccs1 = "text",
  mccs2 = "text",
  mccsatc = "text",
  mccsatc1 = "text",
  mccsatc2 = "text",
  mccsnr = "numeric",
  mdairy = "numeric",
  mdform1 = "categorical",
  mdform10 = "categorical",
  mdform11 = "categorical",
  mdform12 = "categorical",
  mdform13 = "categorical",
  mdform14 = "categorical",
  mdform2 = "categorical",
  mdform3 = "categorical",
  mdform4 = "categorical",
  mdform5 = "categorical",
  mdform6 = "categorical",
  mdform7 = "categorical",
  mdform8 = "categorical",
  mdform9 = "categorical",
  mdos1 = "numeric",
  mdos2 = "numeric",
  mdos3 = "numeric",
  mdos4 = "numeric",
  mdos5 = "numeric",
  mdos6 = "numeric",
  mdurat1 = "categorical",
  mdurat10 = "categorical",
  mdurat11 = "categorical",
  mdurat12 = "categorical",
  mdurat13 = "categorical",
  mdurat14 = "categorical",
  mdurat2 = "categorical",
  mdurat3 = "categorical",
  mdurat4 = "categorical",
  mdurat5 = "categorical",
  mdurat6 = "categorical",
  mdurat7 = "categorical",
  mdurat8 = "categorical",
  mdurat9 = "categorical",
  mmeasu1 = "categorical",
  mmeasu10 = "categorical",
  mmeasu11 = "categorical",
  mmeasu12 = "categorical",
  mmeasu13 = "categorical",
  mmeasu14 = "categorical",
  mmeasu2 = "categorical",
  mmeasu3 = "categorical",
  mmeasu4 = "categorical",
  mmeasu5 = "categorical",
  mmeasu6 = "categorical",
  mmeasu7 = "categorical",
  mmeasu8 = "categorical",
  mmeasu9 = "categorical",
  mmed1 = "text",
  mmed10 = "text",
  mmed11 = "text",
  mmed12 = "text",
  mmed13 = "text",
  mmed14 = "text",
  mmed2 = "text",
  mmed3 = "text",
  mmed4 = "text",
  mmed5 = "text",
  mmed6 = "text",
  mmed7 = "text",
  mmed8 = "text",
  mmed9 = "text",
  mmedbis = "categorical",
  mmedbisnm = "numeric",
  mmedcaltab = "categorical",
  mmedcort = "categorical",
  mmedcortnm = "numeric",
  mmedcortnm1 = "numeric",
  mmedcortnm2 = "numeric",
  mmedfertab = "categorical",
  mmednr1 = "numeric",
  mmednr2 = "numeric",
  mmednr3 = "numeric",
  mmednr4 = "numeric",
  mmednr5 = "numeric",
  mmednr6 = "numeric",
  mmednr7 = "numeric",
  mmednr8 = "numeric",
  mmeduse = "categorical",
  mmedvitinj = "categorical",
  mmedvittab = "categorical",
  mmeno82 = "categorical",
  mmenonrm = "numeric",
  moes = "text",
  moesatc = "text",
  moesnr = "numeric",
  mperio1 = "categorical",
  mperio10 = "categorical",
  mperio11 = "categorical",
  mperio12 = "categorical",
  mperio13 = "categorical",
  mperio14 = "categorical",
  mperio2 = "categorical",
  mperio3 = "categorical",
  mperio4 = "categorical",
  mperio5 = "categorical",
  mperio6 = "categorical",
  mperio7 = "categorical",
  mperio8 = "categorical",
  mperio9 = "categorical",
  mquant1 = "numeric",
  mquant10 = "numeric",
  mquant11 = "numeric",
  mquant12 = "numeric",
  mquant13 = "numeric",
  mquant14 = "numeric",
  mquant2 = "numeric",
  mquant3 = "numeric",
  mquant4 = "numeric",
  mquant5 = "numeric",
  mquant6 = "numeric",
  mquant7 = "numeric",
  mquant8 = "numeric",
  mquant9 = "numeric",
  mtad1 = "categorical",
  mtad2 = "categorical",
  mtad3 = "categorical",
  mtad4 = "categorical",
  mtad5 = "categorical",
  mtad6 = "categorical",
  mtad7 = "categorical",
  mtad8 = "categorical",
  mvit1 = "text",
  mvit2 = "text",
  mvit3 = "text",
  mvitfr1 = "categorical",
  mvitfr2 = "categorical",
  mvitfr3 = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "152", waves = .lasa_wave_rows()) |>
    .override_label(wave = "G", variable = "drinking", override_value = "drinking") |>
    .override_label(wave = "H", variable = "drinking", override_value = "drinking") |>
    .override_label(wave = "3B", variable = "drinking", override_value = "drinking") |>
    .override_label(wave = "MB", variable = "drinking", override_value = "drinking") |>
    .override_label(wave = "I", variable = "drinking", override_value = "drinking") |>
    .override_label(wave = "J", variable = "drinking", override_value = "drinking") |>
    .override_label(wave = "K", variable = "drinking", override_value = "drinking"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "152", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "152", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "152", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["matc1"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["matc2"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["matc3"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["matc4"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["matc5"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["matc6"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mmed2"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mmed3"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mmed4"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mmed5"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mmed6"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["matc1"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["matc2"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["matc3"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["matc4"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["matc5"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["matc6"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["matc7"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["matc8"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmeasu1"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmeasu2"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmeasu3"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmeasu4"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmeasu5"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmeasu6"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmeasu7"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmeasu8"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmed2"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmed3"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmed4"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmed5"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmed6"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmed7"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["mmed8"]][fc_labels$value_labels$LASA_Wave == "C"] <- list(NULL)
fc_labels$value_labels[["matc1"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["matc2"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["matc3"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["matc4"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["matc5"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["matc6"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["matc7"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["matc8"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mbff"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mbffatc"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mccs"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mccsatc"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmed2"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmed3"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmed4"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmed5"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmed6"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmed7"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmed8"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmedbisnm"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmedcaltab"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["mmedfertab"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["moes"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["moesatc"]][fc_labels$value_labels$LASA_Wave == "D"] <- list(NULL)
fc_labels$value_labels[["matc1"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["matc2"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["matc3"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["matc4"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["matc5"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["matc6"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["matc7"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["matc8"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mbff"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mbffatc"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mccs"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mccsatc"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mmed2"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mmed3"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mmed4"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mmed5"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mmed6"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mmed7"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mmed8"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["mmedbisnm"]][fc_labels$value_labels$LASA_Wave == "E"] <- list(NULL)
fc_labels$value_labels[["matc1"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["matc2"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["matc3"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["matc4"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["matc5"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["matc6"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["matc7"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["matc8"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mccs"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mccsatc"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mmed2"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mmed3"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mmed4"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mmed5"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mmed6"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mmed7"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mmed8"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["matc1"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["matc2"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["matc3"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["matc4"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["matc5"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["matc6"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["matc7"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["matc8"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mccs"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mccsatc"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mmed2"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mmed3"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mmed4"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mmed5"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mmed6"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mmed7"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mmed8"]][fc_labels$value_labels$LASA_Wave == "F"] <- list(NULL)
fc_labels$value_labels[["mccs"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mccsatc"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed10"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed2"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed3"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed4"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed5"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed6"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed7"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed8"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed9"]][fc_labels$value_labels$LASA_Wave == "G"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed10"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed11"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed12"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed13"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed14"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed2"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed3"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed4"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed5"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed6"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed7"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed8"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mmed9"]][fc_labels$value_labels$LASA_Wave == "H"] <- list(NULL)
fc_labels$value_labels[["mccs1"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mccs2"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mccsatc1"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mccsatc2"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mdairy"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mmed2"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mmed3"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mmed4"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mmed5"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mmed6"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mmed7"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mmed8"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mvit1"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mvit2"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mvit3"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["matc1"]][fc_labels$value_labels$LASA_Wave == "MB"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "MB"] <- list(NULL)
fc_labels$value_labels[["mvit3"]][fc_labels$value_labels$LASA_Wave == "MB"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["mmed1"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)

.lasa_fc_152 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

