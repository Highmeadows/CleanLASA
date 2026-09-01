## LASA filecode 152 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  mvitfr3 = "vitamin 3: frequency",
  .applies_to_waves = c("Z")
)

variable_labels(
  "m#med",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "matc2", "matc3", "matc4", "matc5", "matc6",
  .applies_to_waves = c("B", "D", "E", "2B", "F")
)

variable_labels(
  "mdos1", "mdos2", "mdos3", "mdos4", "mdos5", "mdos6", "mmedvitinj",
  .applies_to_waves = c("B")
)

variable_labels(
  "mdurat1", "mmed1",
  .applies_to_waves = c("B", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "mdurat2", "mdurat3", "mdurat4", "mdurat5", "mdurat6", "mmed2", "mmed3", "mmed4", "mmed5", "mmed6",
  .applies_to_waves = c("B", "D", "E", "2B", "F", "G", "H", "3B")
)

variable_labels(
  "mmedcaltab", "mmedfertab",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  "mmednr1", "mmednr2", "mmednr3", "mmednr4", "mmednr5", "mmednr6",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F")
)

variable_labels(
  "mmednr7", "mmednr8",
  .applies_to_waves = c("C", "D", "E", "2B", "F")
)

variable_labels(
  "mtad1", "mtad2", "mtad3", "mtad4", "mtad5", "mtad6", "mtad7", "mtad8",
  .applies_to_waves = c("C")
)

variable_labels(
  "m#timp1", "mmeasu1", "mmeduse", "mperio1", "mquant1",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "m#timp2", "m#timp3", "m#timp4", "m#timp5", "m#timp6", "m#timp7", "m#timp8", "mdurat7", "mdurat8", "mmeasu2", "mmeasu3", "mmeasu4", "mmeasu5", "mmeasu6", "mmeasu7", "mmeasu8", "mmed7", "mmed8", "mperio2", "mperio3", "mperio4", "mperio5", "mperio6", "mperio7", "mperio8", "mquant2", "mquant3", "mquant4", "mquant5", "mquant6", "mquant7", "mquant8",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B")
)

variable_labels(
  "matc7", "matc8", "mccsatc", "mccsnr",
  .applies_to_waves = c("D", "E", "2B", "F")
)

variable_labels(
  "mbff", "mbffatc", "mbffnr", "mmedbis", "mmedbisnm",
  .applies_to_waves = c("D", "E")
)

variable_labels(
  "mccs", "mmedcortnm",
  .applies_to_waves = c("D", "E", "2B", "F", "G")
)

variable_labels(
  "mmeno82", "mmenonrm", "moes", "moesatc", "moesnr",
  .applies_to_waves = c("D")
)

variable_labels(
  "drinking", "matc1", "mdform1",
  .applies_to_waves = c("G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "m#timp10", "m#timp9", "matc10", "matc9", "mdform10", "mdform9", "mdurat10", "mdurat9", "mmeasu10", "mmeasu9", "mmed10", "mmed9", "mperio10", "mperio9", "mquant10", "mquant9",
  .applies_to_waves = c("G", "H")
)

variable_labels(
  "mdform2", "mdform3", "mdform4", "mdform5", "mdform6", "mdform7", "mdform8",
  .applies_to_waves = c("G", "H", "3B")
)

variable_labels(
  "m#timp11", "m#timp12", "m#timp13", "m#timp14", "matc11", "matc12", "matc13", "matc14", "mdform11", "mdform12", "mdform13", "mdform14", "mdurat11", "mdurat12", "mdurat13", "mdurat14", "mmeasu11", "mmeasu12", "mmeasu13", "mmeasu14", "mmed11", "mmed12", "mmed13", "mmed14", "mperio11", "mperio12", "mperio13", "mperio14", "mquant11", "mquant12", "mquant13", "mquant14",
  .applies_to_waves = c("H")
)

variable_labels(
  "mcalcfr", "mccs1", "mccs2", "mccsatc1", "mccsatc2", "mdairy", "mmedcortnm1", "mmedcortnm2", "mmedvittab", "mvit1", "mvit2", "mvitfr1", "mvitfr2", "mvitfr3",
  .applies_to_waves = c("3B")
)

variable_labels(
  "mvit3",
  .applies_to_waves = c("3B", "MB")
)

variable_labels(
  matc1 = "med. 1: ATC-code (constructed)",
  .applies_to_waves = c("B", "D", "E", "2B", "F")
)

variable_labels(
  mmeduse = "Medication use",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  mmedvittab = "Tablets: vitamins",
  .applies_to_waves = c("B")
)

variable_labels(
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
  mmedcort = "Ever use corticostero\303\257den > 3 months",
  mmedvittab = "Tablets: vitamines",
  mquant1 = "Medicine 1: quantity",
  mquant2 = "Medicine 2: quantity",
  mquant3 = "Medicine 3: quantity",
  mquant4 = "Medicine 4: quantity",
  mquant5 = "Medicine 5: quantity",
  mquant6 = "Medicine 6: quantity",
  mquant7 = "Medicine 7: quantity",
  mquant8 = "Medicine 8: quantity",
  .applies_to_waves = c("C")
)

variable_labels(
  mmedcaltab = "tablets: calcium",
  mmedcort = "ever use corticosteroids > 3 months",
  mmedfertab = "tablets: ferro",
  mmedvittab = "tablets: vitamins",
  .applies_to_waves = c("D")
)

variable_labels(
  mmedcort = "use corticosteroids last 3 years",
  .applies_to_waves = c("E", "2B", "F", "G", "H")
)

variable_labels(
  matc2 = "med. 2: ATC-code in: G, H, 3B, I, J, K:",
  matc3 = "med. 3: ATC-code in: G, H, 3B, I, J, K:",
  matc4 = "med. 4: ATC-code in: G, H, 3B, I, J, K:",
  matc5 = "med. 5: ATC-code in: G, H, 3B, I, J, K:",
  matc6 = "med. 6: ATC-code in: G, H, 3B, I, J, K:",
  matc7 = "med. 7: ATC-code in: G, H, 3B, I, J, K:",
  matc8 = "med. 8: ATC-code in: G, H, 3B, I, J, K:",
  .applies_to_waves = c("G", "H", "3B")
)

variable_labels(
  mccsatc = "corticosteroid: ATC-code",
  .applies_to_waves = c("G")
)

variable_labels(
  mmedcaltab = "use of calcium tablets (no prescription)",
  mmedcort = "use prescribed corticosteroids ever",
  .applies_to_waves = c("3B")
)

# define value labels ----
value_labels(
  `-2` = "na, see BMMED", `-1` = "R does not know",
  .applies_to_vars = c("mdos1", "mdos2", "mdos3", "mdos4", "mdos5", "mdos6"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "no valid data / na, asked",
  .applies_to_vars = c("mdurat7", "mdurat8", "mquant1", "mquant2", "mquant3", "mquant4", "mquant5", "mquant6", "mquant7", "mquant8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BM#MED",
  .applies_to_vars = c("mdurat1", "mdurat2", "mdurat3", "mdurat4", "mdurat5", "mdurat6", "mmednr1", "mmednr2", "mmednr3", "mmednr4", "mmednr5", "mmednr6"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "no answer, skipped",
  .applies_to_vars = c("mmedcaltab", "mmedfertab", "mmeduse", "mmedvitinj", "mmedvittab"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-5` = "na, interview terminated",
  .applies_to_vars = c("mmedbis", "mmedcaltab", "mmedcort", "mmedfertab", "mmeduse", "mmedvittab"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked", `1` = "with each meal (3 or more glasses a day)", `2` = "not with each meal (1 or 2 glasses a day)", `3` = "every week, but not every day", `4` = "every week, but not every day", `5` = "less than once a week",
  .applies_to_vars = c("drinking"),
  .applies_to_waves = c("Z", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMMEDUSE", `0` = "no medicines",
  .applies_to_vars = c("m#med"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, for thrombosis", `-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked",
  .applies_to_vars = c("m#timp1", "m#timp2", "m#timp3", "m#timp4", "m#timp5", "m#timp6", "m#timp7", "m#timp8"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F")
)

value_labels(
  `-3` = "na, for thrombosis", `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked",
  .applies_to_vars = c("m#timp10", "m#timp9"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-3` = "na, for thrombosis", `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked",
  .applies_to_vars = c("m#timp11", "m#timp12", "m#timp13", "m#timp14"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-2` = "na, see G/H/B/I/J/KMMEDUSE", `-1` = "na, asked",
  .applies_to_vars = c("matc1"),
  .applies_to_waves = c("Z", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see G/H/B/I/J/KMMEDUSE", `-1` = "na, asked",
  .applies_to_vars = c("matc10", "matc9"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "na, see G/H/B/I/J/KMMEDUSE", `-1` = "na, asked",
  .applies_to_vars = c("matc11", "matc12", "matc13", "matc14"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-2` = "na, see G/H/B/I/J/KMMEDUSE", `-1` = "na, asked",
  .applies_to_vars = c("matc2", "matc3", "matc4", "matc5", "matc6", "matc7", "matc8"),
  .applies_to_waves = c("Z", "G", "H", "3B")
)

value_labels(
  `-2` = "na, see D/EM#MED", `-1` = "na, asked",
  .applies_to_vars = c("mbffnr"),
  .applies_to_waves = c("Z", "D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "less than one day a week", `2` = "1-2 days a week", `3` = "3-4 days a week", `4` = "5-6 days a week", `5` = "daily",
  .applies_to_vars = c("mcalcfr", "mvitfr1"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked",
  .applies_to_vars = c("mccsnr"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F")
)

value_labels(
  `-2` = "na, see G/HM#MED", `-1` = "na, asked", `1` = "tablet", `2` = "capsule", `3` = "drops", `4` = "effervescent tablet", `5` = "injection", `6` = "inhaler", `7` = "powder", `8` = "ointment", `9` = "other form / plaster", `10` = "suppository", `11` = "spray", `12` = "other form",
  .applies_to_vars = c("mdform1", "mdform2", "mdform3", "mdform4", "mdform5", "mdform6", "mdform7", "mdform8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see G/HM#MED", `-1` = "na, asked", `1` = "tablet", `2` = "capsule", `3` = "drops", `4` = "effervescent tablet", `5` = "injection", `6` = "inhaler", `7` = "powder", `8` = "ointment", `9` = "other form",
  .applies_to_vars = c("mdform10", "mdform9"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "na, see G/HM#MED", `-1` = "na, asked", `1` = "tablet", `2` = "capsule", `3` = "drops", `4` = "effervescent tablet", `5` = "injection", `6` = "inhaler", `7` = "powder", `8` = "ointment", `9` = "other form",
  .applies_to_vars = c("mdform11", "mdform12", "mdform13", "mdform14"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-3` = "no valid data / na, wrong skip", `-1` = "na, asked / no valid data", `1` = "less than 1 month", `2` = "1 month to 1 year", `3` = "1 to 5 years", `4` = "longer than 5 years / longer than 5 years 1", `5` = "sometimes", `6` = "only when necessary",
  .applies_to_vars = c("mdurat1", "mdurat2", "mdurat3", "mdurat4", "mdurat5", "mdurat6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "less than 1 month", `2` = "1 month to 1 year", `3` = "1 to 5 years", `4` = "longer than 5 years 1",
  .applies_to_vars = c("mdurat10", "mdurat9"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "less than 1 month", `2` = "1 month to 1 year", `3` = "1 to 5 years", `4` = "longer than 5 years 1",
  .applies_to_vars = c("mdurat11", "mdurat12", "mdurat13", "mdurat14"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CM#MED", `1` = "less than 1 month", `2` = "1 month to 1 year", `3` = "1 to 5 years", `4` = "longer than 5 years / longer than 5 years 1",
  .applies_to_vars = c("mdurat7", "mdurat8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked", `1` = "microgramme", `2` = "milligramme", `3` = "gramme", `4` = "other measurement / milliliter", `5` = "unit per ml", `6` = "percentage",
  .applies_to_vars = c("mmeasu1", "mmeasu2", "mmeasu3", "mmeasu4", "mmeasu5", "mmeasu6", "mmeasu7", "mmeasu8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see G/HM#MED", `-1` = "na, asked", `1` = "microgramme", `2` = "milligramme", `3` = "gramme", `4` = "other measurement",
  .applies_to_vars = c("mmeasu10", "mmeasu9"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "na, see G/HM#MED", `-1` = "na, asked", `1` = "microgramme", `2` = "milligramme", `3` = "gramme", `4` = "other measurement",
  .applies_to_vars = c("mmeasu11", "mmeasu12", "mmeasu13", "mmeasu14"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmedbis"),
  .applies_to_waves = c("Z", "C", "D", "E")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmedcaltab"),
  .applies_to_waves = c("Z", "C", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmedcort"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "only once/ short cure / only once / short cure", `-2` = "na, see D/E/B/FMMEDCORT", `-1` = "R does not know period / na, asked / na, asked", `99` = "99 months or longer",
  .applies_to_vars = c("mmedcortnm"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mmedcortnm1"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-2` = "na, no second corticosteroid", `-1` = "na, asked",
  .applies_to_vars = c("mmedcortnm2"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmedfertab"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mmednr1", "mmednr2", "mmednr3", "mmednr4", "mmednr5", "mmednr6"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see CM#MED", `-1` = "na, asked",
  .applies_to_vars = c("mmednr7", "mmednr8"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmeduse"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmedvitinj"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmedvittab"),
  .applies_to_waves = c("Z", "C", "D", "3B")
)

value_labels(
  `-2` = "na, male respondent", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmeno82"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DMMENO82", `-1` = "R does not know period", `99` = "99 months or longer",
  .applies_to_vars = c("mmenonrm"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see DM#MED", `-1` = "na, asked",
  .applies_to_vars = c("moesnr"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month", `4` = "for thrombosis", `5` = "as required", `6` = "other kind of period",
  .applies_to_vars = c("mperio1", "mperio2", "mperio3", "mperio4", "mperio5", "mperio6", "mperio7", "mperio8"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month", `4` = "for thrombosis", `5` = "as required", `6` = "other kind of period",
  .applies_to_vars = c("mperio10", "mperio9"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month", `4` = "for thrombosis", `5` = "as required", `6` = "other kind of period",
  .applies_to_vars = c("mperio11", "mperio12", "mperio13", "mperio14"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CM#MED",
  .applies_to_vars = c("mquant1", "mquant2", "mquant3", "mquant4", "mquant5", "mquant6", "mquant7", "mquant8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked",
  .applies_to_vars = c("mquant10", "mquant9"),
  .applies_to_waves = c("Z", "G", "H")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked",
  .applies_to_vars = c("mquant11", "mquant12", "mquant13", "mquant14"),
  .applies_to_waves = c("Z", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CM#MED", `-1` = "no valid data", `98` = "less than once a day", `99` = "if necessary",
  .applies_to_vars = c("mtad1", "mtad2", "mtad3", "mtad4", "mtad5", "mtad6", "mtad7", "mtad8"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "na, no second vitamin", `-1` = "na, asked", `1` = "less than one day a week", `2` = "1-2 days a week", `3` = "3-4 days a week", `4` = "5-6 days a week", `5` = "daily",
  .applies_to_vars = c("mvitfr2"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-2` = "na, no third vitamin", `-1` = "na, asked", `1` = "less than one day a week", `2` = "1-2 days a week", `3` = "3-4 days a week", `4` = "5-6 days a week", `5` = "daily",
  .applies_to_vars = c("mvitfr3"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMMEDUSE",
  .applies_to_vars = c("m#med"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no valid data", `-1` = "na, asked", `1` = "less than 1 month", `2` = "1 month to 1 year", `3` = "1 to 5 years", `4` = "longer than 5 years", `5` = "sometimes", `6` = "only when necessary",
  .applies_to_vars = c("mdurat1", "mdurat2", "mdurat3", "mdurat4", "mdurat5", "mdurat6"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no answer, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmedcaltab", "mmedfertab", "mmeduse", "mmedvittab"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see CMMEDUSE",
  .applies_to_vars = c("m#med"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CM#MED", `-1` = "no valid data", `1` = "less than 1 month", `2` = "1 month to 1 year", `3` = "1 to 5 years", `4` = "longer than 5 years",
  .applies_to_vars = c("mdurat1", "mdurat2", "mdurat3", "mdurat4", "mdurat5", "mdurat6", "mdurat7", "mdurat8"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CM#MED", `-1` = "na, asked",
  .applies_to_vars = c("mmednr1", "mmednr2", "mmednr3", "mmednr4", "mmednr5", "mmednr6"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CM#MED", `-1` = "no valid data",
  .applies_to_vars = c("mquant1", "mquant2", "mquant3", "mquant4", "mquant5", "mquant6", "mquant7", "mquant8"),
  .applies_to_waves = c("C")
)

value_labels(
  `0` = "no medicines",
  .applies_to_vars = c("m#med"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked", `1` = "less than 1 month", `2` = "1 month to 1 year", `3` = "1 to 5 years", `4` = "longer than 5 years",
  .applies_to_vars = c("mdurat1", "mdurat2", "mdurat3", "mdurat4", "mdurat5", "mdurat6", "mdurat7", "mdurat8"),
  .applies_to_waves = c("D", "E", "2B", "F")
)

value_labels(
  `-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked", `1` = "microgramme", `2` = "milligramme", `3` = "gramme", `4` = "other measurement",
  .applies_to_vars = c("mmeasu1", "mmeasu2", "mmeasu3", "mmeasu4", "mmeasu5", "mmeasu6", "mmeasu7", "mmeasu8"),
  .applies_to_waves = c("D", "E", "2B", "F")
)

value_labels(
  `-2` = "na, see D/E/B/FMMEDCORT", `-1` = "R does not know period / na, asked", `99` = "99 months or longer",
  .applies_to_vars = c("mmedcortnm"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see D/E/B/FM#MED", `-1` = "na, asked",
  .applies_to_vars = c("mmednr1", "mmednr2", "mmednr3", "mmednr4", "mmednr5", "mmednr6", "mmednr7", "mmednr8", "mquant1", "mquant2", "mquant3", "mquant4", "mquant5", "mquant6", "mquant7", "mquant8"),
  .applies_to_waves = c("D", "E", "2B", "F")
)

value_labels(
  `-3` = "only once/ short cure", `-2` = "na, see D/E/B/FMMEDCORT", `-1` = "R does not know period / na, asked",
  .applies_to_vars = c("mmedcortnm"),
  .applies_to_waves = c("E", "2B", "F")
)

value_labels(
  `-3` = "na, for thrombosis", `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked",
  .applies_to_vars = c("m#timp1"),
  .applies_to_waves = c("G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-3` = "na, for thrombosis", `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked",
  .applies_to_vars = c("m#timp2", "m#timp3", "m#timp4", "m#timp5", "m#timp6", "m#timp7", "m#timp8"),
  .applies_to_waves = c("G", "H", "3B")
)

value_labels(
  `-2` = "na, see G/HM#MED", `-1` = "na, asked", `1` = "tablet", `2` = "capsule", `3` = "drops", `4` = "effervescent tablet", `5` = "injection", `6` = "inhaler", `7` = "powder", `8` = "ointment", `9` = "other form",
  .applies_to_vars = c("mdform1", "mdform2", "mdform3", "mdform4", "mdform5", "mdform6", "mdform7", "mdform8"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "less than 1 month", `2` = "1 month to 1 year", `3` = "1 to 5 years", `4` = "longer than 5 years 1",
  .applies_to_vars = c("mdurat1"),
  .applies_to_waves = c("G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "less than 1 month", `2` = "1 month to 1 year", `3` = "1 to 5 years", `4` = "longer than 5 years 1",
  .applies_to_vars = c("mdurat2", "mdurat3", "mdurat4", "mdurat5", "mdurat6", "mdurat7", "mdurat8"),
  .applies_to_waves = c("G", "H", "3B")
)

value_labels(
  `-2` = "na, see G/HM#MED", `-1` = "na, asked", `1` = "microgramme", `2` = "milligramme", `3` = "gramme", `4` = "other measurement",
  .applies_to_vars = c("mmeasu1", "mmeasu2", "mmeasu3", "mmeasu4", "mmeasu5", "mmeasu6", "mmeasu7", "mmeasu8"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-3` = "only once / short cure", `-2` = "na, see G/HMMEDCORT", `-1` = "na, asked",
  .applies_to_vars = c("mmedcortnm"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month", `4` = "for thrombosis", `5` = "as required", `6` = "other kind of period",
  .applies_to_vars = c("mperio1"),
  .applies_to_waves = c("G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "day", `2` = "week", `3` = "month", `4` = "for thrombosis", `5` = "as required", `6` = "other kind of period",
  .applies_to_vars = c("mperio2", "mperio3", "mperio4", "mperio5", "mperio6", "mperio7", "mperio8"),
  .applies_to_waves = c("G", "H", "3B")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked",
  .applies_to_vars = c("mquant1"),
  .applies_to_waves = c("G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see G/H/B/B/I/J/KM#MED", `-1` = "na, asked",
  .applies_to_vars = c("mquant2", "mquant3", "mquant4", "mquant5", "mquant6", "mquant7", "mquant8"),
  .applies_to_waves = c("G", "H", "3B")
)

value_labels(
  `-2` = "na, see B/I/J/KMMEDUSE", `0` = "no medicines",
  .applies_to_vars = c("m#med"),
  .applies_to_waves = c("3B", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "tablet", `2` = "capsule", `3` = "drops", `4` = "effervescent tablet", `5` = "injection", `6` = "inhaler", `7` = "powder", `8` = "ointment", `9` = "plaster", `10` = "suppository", `11` = "spray", `12` = "other form",
  .applies_to_vars = c("mdform1"),
  .applies_to_waves = c("3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "tablet", `2` = "capsule", `3` = "drops", `4` = "effervescent tablet", `5` = "injection", `6` = "inhaler", `7` = "powder", `8` = "ointment", `9` = "plaster", `10` = "suppository", `11` = "spray", `12` = "other form",
  .applies_to_vars = c("mdform2", "mdform3", "mdform4", "mdform5", "mdform6", "mdform7", "mdform8"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "microgramme", `2` = "milligramme", `3` = "gramme", `4` = "milliliter", `5` = "unit per ml", `6` = "percentage",
  .applies_to_vars = c("mmeasu1"),
  .applies_to_waves = c("3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see B/B/I/J/KM#MED", `-1` = "na, asked", `1` = "microgramme", `2` = "milligramme", `3` = "gramme", `4` = "milliliter", `5` = "unit per ml", `6` = "percentage",
  .applies_to_vars = c("mmeasu2", "mmeasu3", "mmeasu4", "mmeasu5", "mmeasu6", "mmeasu7", "mmeasu8"),
  .applies_to_waves = c("3B")
)

.lasa_fc_152 <- .lasa_finalize_fc("152")
.lasa_fc_152$variables <- .lasa_fc_152$variables |>
  .override_label(wave = "G", variable = "drinking", override_value = "drinking") |>
  .override_label(wave = "H", variable = "drinking", override_value = "drinking") |>
  .override_label(wave = "3B", variable = "drinking", override_value = "drinking") |>
  .override_label(wave = "MB", variable = "drinking", override_value = "drinking") |>
  .override_label(wave = "I", variable = "drinking", override_value = "drinking") |>
  .override_label(wave = "J", variable = "drinking", override_value = "drinking") |>
  .override_label(wave = "K", variable = "drinking", override_value = "drinking")

