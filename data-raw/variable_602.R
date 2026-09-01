## LASA filecode 602 -- variable names, variable labels, value labels,
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
  tpartv1 = "categorical",
  tpcanc1 = "categorical",
  tpcanc1a = "categorical",
  tpcara1 = "categorical",
  tpchol1 = "categorical",
  tpchol1a = "categorical",
  tpcor1 = "categorical",
  tpcor2 = "categorical",
  tpcorm1 = "categorical",
  tpcorm2 = "categorical",
  tpcory1 = "numeric",
  tpcory2 = "numeric",
  tpcva01 = "categorical",
  tpdiab1 = "categorical",
  tpfadem = "categorical",
  tpftrea = "categorical",
  tphart1 = "categorical",
  tphbd1 = "categorical",
  tphbd1a = "categorical",
  tphead = "categorical",
  tpheam = "categorical",
  tpheanr = "numeric",
  tpheay = "numeric",
  tpmodem = "categorical",
  tpmtrea = "categorical",
  tpnochrom = "numeric",
  tpnochrot = "numeric",
  tpothnr = "numeric",
  tpoths1 = "categorical",
  tpoths2 = "categorical",
  tpoths3 = "categorical",
  tpoths4 = "categorical",
  tpoths5 = "categorical",
  tpreaso = "categorical",
  tprheu1 = "categorical",
  tprheu1_1 = "categorical",
  tprheu2 = "categorical",
  tpsubh1 = "categorical"
)

# define variable labels ----
variable_labels(
  tpartv1 = "Arteries, disease or abnormalities",
  tpcanc1 = "Cancer",
  tpcanc1a = "Cancer: nature of tumor or swelling",
  tpcara1 = "CNSLD",
  tpchol1 = "Hypercholesterolemia",
  tpchol1a = "Hypercholesterolemia: medication use",
  tpcor1 = "Corona",
  tpcor2 = "Corona second time",
  tpcorm1 = "Corona: month",
  tpcorm2 = "Corona second: month",
  tpcory1 = "Corona: year",
  tpcory2 = "Corona second: year",
  tpcva01 = "CVA",
  tpdiab1 = "Diabetes",
  tpfadem = "Dementia father",
  tpftrea = "Treatment dementia father",
  tphart1 = "Heart disease",
  tphbd1 = "Hypertension",
  tphbd1a = "Hypertension: medication use",
  tphead = "Head injury",
  tpheam = "Head injury last: month",
  tpheanr = "Head injury: number",
  tpheay = "Head injury last: year",
  tpmodem = "Dementia mother",
  tpmtrea = "Treatment dementia mother",
  tpnochrom = "Number of chronic diseases from 7 majors",
  tpnochrot = "Number of chronic diseases including maximum 2 others",
  tpothnr = "Number of other chronic diseases mentioned",
  tpoths1 = "First other chronic disease",
  tpoths2 = "Second other chronic disease",
  tpoths3 = "Third other chronic disease",
  tpoths4 = "Fourth other chronic disease",
  tpoths5 = "Fifth other chronic disease",
  tpreaso = "Reason no interview with respondent",
  tprheu1 = "Osteoarthritis",
  tprheu1_1 = "Osteoarthritis: other",
  tprheu2 = "Rheumatoid arthritis",
  tpsubh1 = "General health",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tpartv1", "tpcanc1", "tpcara1", "tpcva01", "tpdiab1", "tphart1", "tphbd1", "tpothnr", "tpoths1", "tpoths2", "tpoths3", "tprheu2", "tpsubh1",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "tpnochrom", "tpnochrot",
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

variable_labels(
  "tprheu1",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J")
)

variable_labels(
  "tpfadem", "tpftrea", "tpmodem", "tpmtrea",
  .applies_to_waves = c("D")
)

variable_labels(
  "tphead", "tpheam", "tpheanr", "tpheay", "tpreaso",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "tpoths4",
  .applies_to_waves = c("E", "F", "H", "I", "J")
)

variable_labels(
  "tpoths5",
  .applies_to_waves = c("F", "I", "J")
)

variable_labels(
  "tpcanc1a", "tphbd1a",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  "tpchol1", "tpchol1a", "tpcor1", "tpcor2", "tpcorm1", "tpcorm2", "tpcory1", "tpcory2", "tprheu1_1",
  .applies_to_waves = c("K")
)

variable_labels(
  tpnochrom = "Number of chronic diseases from 7 majors (constructed)",
  tpnochrot = "Number of chronic diseases including maximum 2 others (constructed)",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  tprheu1 = "Osteoarthritis: knees, hips or hands",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("tpnochrom", "tpnochrot"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no head trauma",
  .applies_to_vars = c("tpheam", "tpheanr", "tpheay"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("tpartv1", "tpcanc1", "tpcara1", "tpcva01", "tpdiab1", "tphart1", "tphbd1", "tprheu1", "tprheu2"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no answer, see TPCANC1", `-1` = "na, asked", `1` = "benign", `2` = "malign", `3` = "unknown",
  .applies_to_vars = c("tpcanc1a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "does not know",
  .applies_to_vars = c("tpchol1", "tpchol1a"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("tpcor1", "tprheu1_1"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "never had corona", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("tpcor2"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "no corona", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpcorm1", "tpcorm2"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "no corona", `-1` = "na, asked",
  .applies_to_vars = c("tpcory1", "tpcory2"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-1` = "asked, no answer / does not know", `0` = "no", `1` = "yes",
  .applies_to_vars = c("tpfadem", "tpmodem"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "no dementia", `-1` = "asked, no answer / does not know", `0` = "no", `1` = "yes",
  .applies_to_vars = c("tpftrea", "tpmtrea"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "does not know",
  .applies_to_vars = c("tphbd1a"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("tphead"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("tpheam"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("tpheanr", "tpheay"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("tpothnr"),
  .applies_to_waves = c("Z", "C", "D", "E")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Mental problems, incl. depression", `25` = "Eye diseases", `26` = "Ear diseases/hearing problems", `27` = "Venous insufficiency/varicose veins", `28` = "Anaemia", `29` = "Chronic headaches (no migraine)", `30` = "Chronic neck-problems", `31` = "Dizziness without falling", `32` = "Congenital disorders", `33` = "Hypercholesterolaemia", `34` = "Gout", `35` = "Menopausal complaints (females)", `36` = "Osteoporosis", `37` = "Other pulmonary diseases (no CNSLD)", `38` = "Systemic diseases", `39` = "Other hormonal diseases (no diabetes/thyroid)", `40` = "Other urological disease (no incontinence)", `41` = "Other locomotor disease", `42` = "Other vascular disease", `43` = "Other neurological disease", `44` = "TIA", `45` = "Other hematological disease", `46` = "Pancreatitis-chronic", `47` = "no label", `48` = "Addiction", `49` = "Other chronic disease", `50` = "Other non-chronic disease",
  .applies_to_vars = c("tpoths1", "tpoths2", "tpoths3"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Parkinson", `25` = "Mental problems, incl. depression", `26` = "Other - to be coded -", `27` = "Venous insufficiency/varicose veins", `28` = "Anaemia", `29` = "Chronic headaches (no migraine)", `30` = "Chronic neck-problems", `31` = "Dizziness without falling", `32` = "Congenital disorders", `33` = "Hypercholesterolaemia", `34` = "Gout", `35` = "Menopausal complaints (females)", `36` = "Osteoporosis", `37` = "Other pulmonary diseases (no CNSLD)", `38` = "Systemic diseases", `39` = "Other hormonal diseases (no diabetes/thyroid)", `40` = "Other urological disease (no incontinence)", `41` = "Other locomotor disease", `42` = "Other vascular disease", `43` = "Other neurological disease", `44` = "TIA", `45` = "Other hematological disease", `46` = "Pancreatitis-chronic", `47` = "no label", `48` = "Addiction", `49` = "Other chronic disease", `50` = "Other non-chronic disease",
  .applies_to_vars = c("tpoths4", "tpoths5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "physical indication", `2` = "psychological indication", `3` = "physical + psychological indication", `4` = "answer refused", `5` = "does not know", `6` = "R not interested/motivated", `7` = "R abroad / unreachable", `8` = "other reason / demented", `9` = "other reason",
  .applies_to_vars = c("tpreaso"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "sometimes good/bad", `5` = "poor",
  .applies_to_vars = c("tpsubh1"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "asked, no answer", `1` = "physical indication", `2` = "psychological indication", `3` = "physical + psychological indication", `4` = "answer refused", `5` = "does not know",
  .applies_to_vars = c("tpreaso"),
  .applies_to_waves = c("D", "E", "F", "G")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Mental problems, incl. depression", `25` = "Eye diseases", `26` = "Ear diseases/hearing problems", `27` = "Venous insufficiency/varicose veins", `28` = "Anaemia", `29` = "Chronic headaches (no migraine)", `30` = "Chronic neck-problems", `31` = "Dizziness without falling", `32` = "Congenital disorders", `33` = "Hypercholesterolaemia", `34` = "Gout", `35` = "Menopausal complaints (females)", `36` = "Osteoporosis", `37` = "Other pulmonary diseases (no CNSLD)", `38` = "Systemic diseases", `39` = "Other hormonal diseases (no diabetes/thyroid)", `40` = "Other urological disease (no incontinence)", `41` = "Other locomotor disease", `42` = "Other vascular disease", `43` = "Other neurological disease", `44` = "TIA", `45` = "Other hematological disease", `46` = "Pancreatitis-chronic", `47` = "no label", `48` = "Addiction", `49` = "Other chronic disease", `50` = "Other non-chronic disease",
  .applies_to_vars = c("tpoths4"),
  .applies_to_waves = c("E", "F")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Mental problems, incl. depression", `25` = "Eye diseases", `26` = "Ear diseases/hearing problems", `27` = "Venous insufficiency/varicose veins", `28` = "Anaemia", `29` = "Chronic headaches (no migraine)", `30` = "Chronic neck-problems", `31` = "Dizziness without falling", `32` = "Congenital disorders", `33` = "Hypercholesterolaemia", `34` = "Gout", `35` = "Menopausal complaints (females)", `36` = "Osteoporosis", `37` = "Other pulmonary diseases (no CNSLD)", `38` = "Systemic diseases", `39` = "Other hormonal diseases (no diabetes/thyroid)", `40` = "Other urological disease (no incontinence)", `41` = "Other locomotor disease", `42` = "Other vascular disease", `43` = "Other neurological disease", `44` = "TIA", `45` = "Other hematological disease", `46` = "Pancreatitis-chronic", `47` = "no label", `48` = "Addiction", `49` = "Other chronic disease", `50` = "Other non-chronic disease",
  .applies_to_vars = c("tpoths5"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Parkinson", `25` = "Mental problems, incl. depression", `26` = "Other - to be coded -",
  .applies_to_vars = c("tpoths1", "tpoths2", "tpoths3", "tpoths4"),
  .applies_to_waves = c("H", "I", "J")
)

value_labels(
  `-1` = "asked, no answer", `1` = "physical indication", `2` = "psychological indication", `3` = "physical + psychological indication", `4` = "answer refused", `5` = "does not know", `6` = "R not interested/motivated", `7` = "R abroad / unreachable", `8` = "other reason",
  .applies_to_vars = c("tpreaso"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Parkinson", `25` = "Mental problems, incl. depression", `26` = "Other - to be coded -",
  .applies_to_vars = c("tpoths5"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "physical indication", `2` = "psychological indication", `3` = "physical + psychological indication", `4` = "answer refused", `5` = "does not know", `6` = "R not interested/motivated", `7` = "R abroad / unreachable", `8` = "demented", `9` = "other reason",
  .applies_to_vars = c("tpreaso"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-2` = "no answer, see JTPCANC1", `-1` = "na, asked", `1` = "benign", `2` = "malign", `3` = "unknown",
  .applies_to_vars = c("tpcanc1a"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "no answer, see KTPCANC1", `-1` = "na, asked", `1` = "benign", `2` = "malign", `3` = "unknown",
  .applies_to_vars = c("tpcanc1a"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Fractures as a result of accident/fall", `21` = "Other consequences of accident/fall", `22` = "Permanent consequencies surgery", `23` = "Disease of nervous system", `24` = "Parkinson", `25` = "Mental problems, incl. depression", `26` = "Hearing impairment", `27` = "Arthritis", `28` = "Eye problems", `29` = "Sleep apnea", `30` = "TIA (Transient ischemic attack)", `31` = "Other - to be coded",
  .applies_to_vars = c("tpoths1", "tpoths2", "tpoths3"),
  .applies_to_waves = c("K")
)

.lasa_fc_602 <- .lasa_finalize_fc("602")

