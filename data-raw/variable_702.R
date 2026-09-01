## LASA filecode 702 -- variable names, variable labels, value labels,
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
  trartv1 = "categorical",
  trcanc1 = "categorical",
  trcanc1a = "categorical",
  trcara1 = "categorical",
  trchol1 = "categorical",
  trchol1a = "categorical",
  trcor1 = "categorical",
  trcor2 = "categorical",
  trcorm1 = "categorical",
  trcorm2 = "categorical",
  trcory1 = "numeric",
  trcory2 = "numeric",
  trcva01 = "categorical",
  trdiab1 = "categorical",
  trfadem = "categorical",
  trftrea = "categorical",
  trhart1 = "categorical",
  trhbd1 = "categorical",
  trhbd1a = "categorical",
  trhead = "categorical",
  trheam = "categorical",
  trheanr = "numeric",
  trheay = "numeric",
  trmodem = "categorical",
  trmtrea = "categorical",
  trnochrom = "numeric",
  trnochrot = "numeric",
  trothnr = "numeric",
  troths1 = "categorical",
  troths2 = "categorical",
  troths3 = "categorical",
  troths4 = "categorical",
  troths5 = "categorical",
  trrheu1 = "categorical",
  trrheu2 = "categorical",
  trsubh1 = "categorical"
)

# define variable labels ----
variable_labels(
  trartv1 = "Arteries, disease or abnormalities",
  trcanc1 = "Cancer",
  trcanc1a = "Cancer: nature of tumor or swelling",
  trcara1 = "CNSLD",
  trchol1 = "Hypercholesterolemia",
  trchol1a = "Hypercholesterolemia: medication use",
  trcor1 = "Corona",
  trcor2 = "Corona second time",
  trcorm1 = "Corona: month",
  trcorm2 = "Corona second: month",
  trcory1 = "Corona: year",
  trcory2 = "Corona second: year",
  trcva01 = "CVA",
  trdiab1 = "Diabetes",
  trfadem = "Dementia father",
  trftrea = "Treatment dementia father",
  trhart1 = "Heart disease",
  trhbd1 = "Hypertension",
  trhbd1a = "Hypertension: medication use",
  trhead = "Head injury",
  trheam = "Head injury last: month",
  trheanr = "Head injury: number",
  trheay = "Head injury last: year",
  trmodem = "Dementia mother",
  trmtrea = "Treatment dementia mother",
  trnochrom = "Number of chronic diseases from 7 majors",
  trnochrot = "Number of chronic diseases including maximum 2 others",
  trothnr = "Number of other chronic diseases mentioned",
  troths1 = "First other chronic disease",
  troths2 = "Second other chronic disease",
  troths3 = "Third other chronic disease",
  troths4 = "Fourth other chronic disease",
  troths5 = "Fifth other chronic disease",
  trrheu1 = "Osteoarthritis",
  trrheu2 = "Rheumatoid arthritis",
  trsubh1 = "General health",
  .applies_to_waves = c("Z")
)

variable_labels(
  "trartv1", "trcanc1", "trcara1", "trcva01", "trdiab1", "trhart1", "trhbd1", "trothnr", "troths1", "troths2", "troths3", "trrheu1", "trrheu2", "trsubh1",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "trnochrom", "trnochrot",
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

variable_labels(
  "trfadem", "trftrea", "trmodem", "trmtrea",
  .applies_to_waves = c("D", "G")
)

variable_labels(
  "trheam", "trheanr", "trheay",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "troths4",
  .applies_to_waves = c("E", "F", "H", "I", "J")
)

variable_labels(
  "troths5",
  .applies_to_waves = c("E", "F", "I", "J")
)

variable_labels(
  "trcanc1a", "trhbd1a",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  "trchol1", "trchol1a", "trcor1", "trcor2", "trcorm1", "trcorm2", "trcory1", "trcory2",
  .applies_to_waves = c("K")
)

variable_labels(
  trhead = "Head injury: yes/no",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  trnochrom = "Number of chronic diseases from 7 majors (constructed)",
  trnochrot = "Number of chronic diseases including maximum 2 others (constructed)",
  .applies_to_waves = c("H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "asked, no answer / does not know",
  .applies_to_vars = c("trfadem", "trftrea", "trmodem", "trmtrea"),
  .applies_to_waves = c("Z", "D", "G")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("trnochrom", "trnochrot"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no head trauma",
  .applies_to_vars = c("trheam", "trheanr", "trheay"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("trartv1", "trcanc1", "trcara1", "trcva01", "trdiab1", "trhart1", "trhbd1", "trrheu1", "trrheu2"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no answer, see TRCANC1", `-1` = "na, asked", `1` = "benign", `2` = "malign", `3` = "unknown",
  .applies_to_vars = c("trcanc1a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "does not know",
  .applies_to_vars = c("trchol1", "trchol1a"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("trcor1"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "never had corona", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("trcor2"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "no corona", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trcorm1", "trcorm2"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "no corona", `-1` = "na, asked",
  .applies_to_vars = c("trcory1", "trcory2"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("trfadem", "trmodem"),
  .applies_to_waves = c("Z", "D", "G")
)

value_labels(
  `-2` = "no dementia", `0` = "no", `1` = "yes",
  .applies_to_vars = c("trftrea", "trmtrea"),
  .applies_to_waves = c("Z", "D", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "does not know",
  .applies_to_vars = c("trhbd1a"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("trhead"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("trheam"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("trheanr", "trheay"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("trothnr"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Mental problems, incl. depression", `25` = "Eye diseases", `26` = "Ear diseases/hearing problems", `27` = "Venous insufficiency/varicose veins", `28` = "Anaemia", `29` = "Chronic headaches (no migraine)", `30` = "Chronic neck-problems", `31` = "Dizziness without falling", `32` = "Congenital disorders", `33` = "Hypercholesterolaemia", `34` = "Gout", `35` = "Menopausal complaints (females)", `36` = "Osteoporosis", `37` = "Other pulmonary diseases (no CNSLD)", `38` = "Systemic diseases", `39` = "Other hormonal diseases (no diabetes/thyroid)", `40` = "Other urological disease (no incontinence)", `41` = "Other locomotor disease", `42` = "Other vascular disease", `43` = "Other neurological disease", `44` = "TIA", `45` = "Other hematological disease", `46` = "Pancreatitis-chronic", `47` = "no label", `48` = "Addiction", `49` = "Other chronic disease", `50` = "Other non-chronic disease",
  .applies_to_vars = c("troths1", "troths2", "troths3"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Parkinson", `25` = "Mental problems, incl. depression", `26` = "Other - to be coded -", `27` = "Venous insufficiency/varicose veins", `28` = "Anaemia", `29` = "Chronic headaches (no migraine)", `30` = "Chronic neck-problems", `31` = "Dizziness without falling", `32` = "Congenital disorders", `33` = "Hypercholesterolaemia", `34` = "Gout", `35` = "Menopausal complaints (females)", `36` = "Osteoporosis", `37` = "Other pulmonary diseases (no CNSLD)", `38` = "Systemic diseases", `39` = "Other hormonal diseases (no diabetes/thyroid)", `40` = "Other urological disease (no incontinence)", `41` = "Other locomotor disease", `42` = "Other vascular disease", `43` = "Other neurological disease", `44` = "TIA", `45` = "Other hematological disease", `46` = "Pancreatitis-chronic", `47` = "no label", `48` = "Addiction", `49` = "Other chronic disease", `50` = "Other non-chronic disease",
  .applies_to_vars = c("troths4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Mental problems, incl. depression", `25` = "Eye diseases", `26` = "Ear diseases/hearing problems", `27` = "Venous insufficiency/varicose veins", `28` = "Anaemia", `29` = "Chronic headaches (no migraine)", `30` = "Chronic neck-problems", `31` = "Dizziness without falling", `32` = "Congenital disorders", `33` = "Hypercholesterolaemia", `34` = "Gout", `35` = "Menopausal complaints (females)", `36` = "Osteoporosis", `37` = "Other pulmonary diseases (no CNSLD)", `38` = "Systemic diseases", `39` = "Other hormonal diseases (no diabetes/thyroid)", `40` = "Other urological disease (no incontinence)", `41` = "Other locomotor disease", `42` = "Other vascular disease", `43` = "Other neurological disease", `44` = "TIA", `45` = "Other hematological disease", `46` = "Pancreatitis-chronic", `47` = "no label", `48` = "Addiction", `49` = "Other chronic disease", `50` = "Other non-chronic disease",
  .applies_to_vars = c("troths5"),
  .applies_to_waves = c("Z", "E", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "excellent", `2` = "good", `3` = "fair", `4` = "sometimes good/bad", `5` = "poor",
  .applies_to_vars = c("trsubh1"),
  .applies_to_waves = c("Z", "C", "D", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Mental problems, incl. depression", `25` = "Eye diseases", `26` = "Ear diseases/hearing problems", `27` = "Venous insufficiency/varicose veins", `28` = "Anaemia", `29` = "Chronic headaches (no migraine)", `30` = "Chronic neck-problems", `31` = "Dizziness without falling", `32` = "Congenital disorders", `33` = "Hypercholesterolaemia", `34` = "Gout", `35` = "Menopausal complaints (females)", `36` = "Osteoporosis", `37` = "Other pulmonary diseases (no CNSLD)", `38` = "Systemic diseases", `39` = "Other hormonal diseases (no diabetes/thyroid)", `40` = "Other urological disease (no incontinence)", `41` = "Other locomotor disease", `42` = "Other vascular disease", `43` = "Other neurological disease", `44` = "TIA", `45` = "Other hematological disease", `46` = "Pancreatitis-chronic", `47` = "no label", `48` = "Addiction", `49` = "Other chronic disease", `50` = "Other non-chronic disease",
  .applies_to_vars = c("troths4"),
  .applies_to_waves = c("E", "F")
)

value_labels(
  `1` = "excellent", `2` = "good", `3` = "fair", `4` = "sometimes good/bad", `5` = "poor",
  .applies_to_vars = c("trsubh1"),
  .applies_to_waves = c("E", "F")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Parkinson", `25` = "Mental problems, incl. depression", `26` = "Other - to be coded -",
  .applies_to_vars = c("troths1", "troths2", "troths3", "troths4"),
  .applies_to_waves = c("H", "I", "J")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Serious consequences accident", `21` = "Other serious consequences/burns", `22` = "Consequences surgery/operations", `23` = "Disease of nervous system", `24` = "Parkinson", `25` = "Mental problems, incl. depression", `26` = "Other - to be coded -",
  .applies_to_vars = c("troths5"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "no answer, see JTRCANC1", `-1` = "na, asked", `1` = "benign", `2` = "malign", `3` = "unknown",
  .applies_to_vars = c("trcanc1a"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "no answer, see KTRCANC1", `-1` = "na, asked", `1` = "benign", `2` = "malign", `3` = "unknown",
  .applies_to_vars = c("trcanc1a"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "no other disease mentioned", `0` = "no more other diseases mentioned", `2` = "Ulcer stomach or duodenum", `3` = "Serious intestinal disease", `4` = "Gall-stones/gall-bladder disease", `5` = "Liver disease or cirrhosis", `6` = "Inguinal hernia", `7` = "Kidney stone", `8` = "Kidney disease-serious", `9` = "Chronic cystitis", `10` = "Prostate complaints (males)", `11` = "Prolapse (females)", `12` = "Thyroid disease", `13` = "Back problems, hernia", `14` = "Epilepsy", `15` = "Dizziness with falling", `16` = "Migraine", `17` = "Serious skin disease", `18` = "Decubitus-ulcer", `19` = "Allergy/hay-fever", `20` = "Fractures as a result of accident/fall", `21` = "Other consequences of accident/fall", `22` = "Permanent consequencies surgery", `23` = "Disease of nervous system", `24` = "Parkinson", `25` = "Mental problems, incl. depression", `26` = "Hearing impairment", `27` = "Arthritis", `28` = "Eye problems", `29` = "Sleep apnea", `30` = "TIA (Transient ischemic attack)", `31` = "Other - to be coded",
  .applies_to_vars = c("troths1", "troths2", "troths3"),
  .applies_to_waves = c("K")
)

.lasa_fc_702 <- .lasa_finalize_fc("702")

