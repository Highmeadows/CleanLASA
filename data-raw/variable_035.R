## LASA filecode 035 -- variable names, variable labels, value labels,
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
  artve8a = "categorical",
  artve8b = "categorical",
  artve8c = "categorical",
  artve8d = "categorical",
  artve8e = "categorical",
  artvei1 = "categorical",
  artvei1b = "categorical",
  artvei1c = "text",
  artvei1d = "categorical",
  artvei2 = "numeric",
  artvei3 = "categorical",
  artvei4 = "categorical",
  artvei5 = "categorical",
  artvei6 = "numeric",
  artvei7 = "categorical",
  artvei8 = "categorical",
  artvei9 = "categorical",
  cance1x = "categorical",
  cance5a = "categorical",
  cance5b = "categorical",
  cance5c = "categorical",
  cance5d = "categorical",
  cance5e = "categorical",
  cance5f = "categorical",
  cance5g = "categorical",
  cance5h = "categorical",
  cance5i = "categorical",
  cance5j = "categorical",
  cance5k = "categorical",
  cance5l = "categorical",
  cance5m = "text",
  cance5x = "categorical",
  cance6a = "categorical",
  cance6b = "categorical",
  cance6c = "categorical",
  cance6d = "categorical",
  cance6e = "categorical",
  cance6f = "categorical",
  cance6g = "text",
  cance7a = "categorical",
  cance7b = "categorical",
  cance7c = "categorical",
  cance7d = "categorical",
  cancer1 = "categorical",
  cancer2 = "numeric",
  cancer3 = "categorical",
  cancer4 = "categorical",
  cancer5 = "categorical",
  cancer6 = "categorical",
  cancer8 = "categorical",
  cara01 = "categorical",
  cara02 = "numeric",
  cara03 = "categorical",
  cara04 = "categorical",
  cara05 = "categorical",
  cara06 = "categorical",
  cara07 = "numeric",
  cara08 = "categorical",
  cara09 = "categorical",
  cara10 = "categorical",
  cara11 = "categorical",
  cara12 = "categorical",
  chmodus = "categorical",
  chol1 = "categorical",
  chol2 = "categorical",
  choutd = "categorical",
  choutd01 = "categorical",
  choutd02 = "categorical",
  choutd03 = "categorical",
  choutd04 = "categorical",
  choutd05 = "categorical",
  choutd06 = "categorical",
  choutd07 = "categorical",
  choutd08 = "categorical",
  choutd09 = "categorical",
  choutd10 = "categorical",
  choutd11 = "categorical",
  choutd12 = "categorical",
  corona1 = "categorical",
  corona1_lc1 = "categorical",
  corona1_lc2 = "categorical",
  corona1_lc3 = "categorical",
  corona1_lc4 = "categorical",
  corona1_m = "date",
  corona1_y = "numeric",
  corona2 = "categorical",
  corona2_lc1 = "categorical",
  corona2_lc2 = "categorical",
  corona2_lc3 = "categorical",
  corona2_lc4 = "categorical",
  corona2_m = "date",
  corona2_y = "numeric",
  cva01 = "categorical",
  cva02 = "numeric",
  cva02a = "categorical",
  cva02b = "numeric",
  cva02c = "categorical",
  cva03 = "numeric",
  cva03a = "numeric",
  cva03j = "numeric",
  cva03m = "date",
  cva04 = "numeric",
  cva04a = "numeric",
  cva04j = "numeric",
  cva04m = "date",
  cva05 = "numeric",
  cva05a = "numeric",
  cva05j = "numeric",
  cva05m = "date",
  cva06 = "categorical",
  cva07 = "categorical",
  cva08 = "categorical",
  cva09 = "categorical",
  cva10 = "categorical",
  cva11 = "categorical",
  cva12 = "categorical",
  diabe01 = "categorical",
  diabe02 = "numeric",
  diabe03 = "categorical",
  diabe03a = "categorical",
  diabe03b = "categorical",
  diabe03c = "categorical",
  diabe04 = "categorical",
  diabe05 = "categorical",
  diabe06 = "categorical",
  diabe07 = "categorical",
  diabe08 = "numeric",
  diabe09 = "categorical",
  diabe10 = "categorical",
  diabe11 = "categorical",
  diabe12 = "numeric",
  diabe13 = "categorical",
  diabe6a = "categorical",
  diabe6b = "categorical",
  diabe6c = "categorical",
  hart01 = "categorical",
  hart02 = "numeric",
  hart03 = "categorical",
  hart04 = "categorical",
  hart05 = "categorical",
  hart06 = "numeric",
  hart07 = "numeric",
  hart07j = "numeric",
  hart07m = "date",
  hart08 = "numeric",
  hart08j = "numeric",
  hart08m = "date",
  hart09 = "numeric",
  hart09j = "numeric",
  hart09m = "date",
  hart10 = "categorical",
  hart11 = "numeric",
  hart12 = "categorical",
  hart13 = "categorical",
  hart14 = "categorical",
  hart15 = "categorical",
  hart15a = "categorical",
  hart15b = "categorical",
  hart15c = "categorical",
  hart15d = "categorical",
  hart15e = "categorical",
  hart16 = "categorical",
  hbd1 = "categorical",
  hbd1a = "categorical",
  hbd2 = "numeric",
  hbd2a = "categorical",
  hbd3 = "categorical",
  htraumj = "text",
  incon1 = "categorical",
  incon10 = "numeric",
  incon2 = "numeric",
  incon3 = "categorical",
  incon4 = "categorical",
  incon5 = "categorical",
  incon6 = "categorical",
  incon7 = "categorical",
  incon8 = "categorical",
  incon9 = "numeric",
  kneep1 = "categorical",
  kneep2 = "categorical",
  kneep3 = "numeric",
  kneep4 = "numeric",
  kneep5 = "numeric",
  kneep6 = "categorical",
  kneep7 = "categorical",
  kneep8 = "categorical",
  kneep9 = "numeric",
  othsi01 = "categorical",
  othsi02 = "categorical",
  othsi04 = "numeric",
  othsi05 = "categorical",
  othsi06 = "categorical",
  othsi07 = "numeric",
  othsi08 = "categorical",
  othsi10 = "numeric",
  othsi11 = "numeric",
  othsi12 = "numeric",
  rh10_1j = "categorical",
  rh10_1r = "categorical",
  rh10_1s = "categorical",
  rh10_1y1 = "date",
  rh10_1y2 = "date",
  rh10_2j = "categorical",
  rh10_2r = "categorical",
  rh10_2s = "categorical",
  rh10_2y1 = "date",
  rh10_2y2 = "date",
  rh10_3j = "categorical",
  rh10_3r = "categorical",
  rh10_3s = "categorical",
  rh10_3y1 = "date",
  rh10_3y2 = "date",
  rheum01 = "categorical",
  rheum01a = "categorical",
  rheum02 = "categorical",
  rheum03 = "numeric",
  rheum04 = "categorical",
  rheum05 = "categorical",
  rheum06 = "numeric",
  rheum07 = "numeric",
  rheum08 = "numeric",
  rheum09 = "categorical",
  rheum10 = "categorical",
  rheum10a = "categorical",
  rheum10a2 = "categorical",
  rheum10a3 = "categorical",
  rheum11 = "categorical",
  rheum12 = "categorical",
  rheum8a = "categorical",
  rheum8b = "categorical",
  rheum8c = "categorical",
  rheum8d = "categorical",
  rheum8e = "categorical",
  rheum8f = "categorical",
  rheum8g = "categorical",
  rheum8h = "categorical",
  rheum8i = "categorical",
  rheum8j = "categorical",
  rheum9a = "categorical",
  rheum9b = "categorical",
  rheum9c = "categorical",
  rheum9d = "categorical",
  rheum9e = "categorical",
  rheum9f = "categorical",
  rheum9g = "categorical",
  rheum9h = "categorical",
  rheum9i = "categorical",
  rheum9j = "categorical",
  rmch = "categorical",
  trauy = "text",
  vaccin = "categorical",
  vaccin_m = "date",
  vaccin_y = "numeric"
)

# define variable labels ----
variable_labels(
  artve8a = "Arteries: surgery, bifurcation",
  artve8b = "Arteries: surgery, femoral",
  artve8c = "Arteries: surgery, groins",
  artve8d = "Arteries: surgery, dotter",
  artve8e = "Arteries: surgery, other",
  artvei1 = "Arteries: disease or abnormalities",
  artvei1b = "Arteries: No, previous interview Yes",
  artvei1c = "Arteries: disease not present since",
  artvei1d = "Arteries: reason disease not present",
  artvei2 = "Arteries: from which age",
  artvei3 = "Arteries: taking medication",
  artvei4 = "Arteries: treatment doctor",
  artvei5 = "Arteries: pain when walking",
  artvei6 = "Arteries: pain when walking: meters",
  artvei7 = "Arteries: pain disappears standing still",
  artvei8 = "Arteries: surgery since last interview",
  artvei9 = "Arteries: outdoors less often",
  cance1x = "Cancer: nature of tumor",
  cance5a = "Cancer: tumor, lungs",
  cance5b = "Cancer: tumor, breast",
  cance5c = "Cancer",
  cance5d = "Cancer: tumor, cervix",
  cance5e = "Cancer: tumor, intestines",
  cance5f = "Cancer",
  cance5g = "Cancer: tumor, larynx",
  cance5h = "Cancer: tumor, esophagus",
  cance5i = "Cancer: tumor, stomach",
  cance5j = "Cancer: tumor, blood",
  cance5k = "Cancer: tumor, skin",
  cance5l = "Cancer: tumor, other",
  cance5m = "Cancer: tumor, which other",
  cance5x = "Cancer: nature of new tumor",
  cance6a = "Cancer: metastases, bone/skeleton",
  cance6b = "Cancer: metastases, liver",
  cance6c = "Cancer: metastases, brain",
  cance6d = "Cancer: metastases, lungs",
  cance6e = "Cancer: metastases, lymph nodes",
  cance6f = "Cancer: metastases, other",
  cance6g = "Cancer: metastases, which other",
  cance7a = "Cancer: surgery, since last interview",
  cance7b = "Cancer: chemotherapy, since last int.",
  cance7c = "Cancer: radiotherapy, since last int.",
  cance7d = "Cancer: altern. treatment, since l. int.",
  cancer1 = "Cancer",
  cancer2 = "Cancer: from which age",
  cancer3 = "Cancer: taking medication",
  cancer4 = "Cancer: treatment doctor",
  cancer5 = "Cancer: tumor since last interview",
  cancer6 = "Cancer: metastases since last interview",
  cancer8 = "Cancer: outdoors less often",
  cara01 = "CNSLD: asthma, chronic bronch, emphysema",
  cara02 = "CNSLD: from which age",
  cara03 = "CNSLD: taking medication",
  cara04 = "CNSLD: treatment doctor",
  cara05 = "CNSLD: cough almost daily",
  cara06 = "CNSLD: phlegm almost daily",
  cara07 = "CNSLD: period increased phlegm past year",
  cara08 = "CNSLD: shortness of breath sometimes",
  cara09 = "CNSLD: wheezing breath ever",
  cara10 = "CNSLD: wheezing breath during rest",
  cara11 = "CNSLD: disturbed night-rest or sleep",
  cara12 = "CNSLD: outdoors less often",
  chmodus = "Long or short interview",
  chol1 = "Hypercholesterolemia",
  chol2 = "Hypercholesterolemia: taking medication",
  choutd = "Chronic diseases: outdoors less often",
  choutd01 = "Ch. dis. outdoors less often: CNSLD",
  choutd02 = "Ch. dis. outdoors less often: heart",
  choutd03 = "Ch. dis. outdoors less often: arteries",
  choutd04 = "Ch. dis. outdoors less often: diabetes",
  choutd05 = "Ch. dis. outdoors less often: CVA",
  choutd06 = "Ch. dis. outdoors less often: incontinence",
  choutd07 = "Ch. dis. outdoors less often: osteoarthritis",
  choutd08 = "Ch. dis. outdoors less often: rheumatoid arthritis",
  choutd09 = "Ch. dis. outdoors less often: cancer",
  choutd10 = "Ch. dis. outdoors less often: other chronic disease 1",
  choutd11 = "Ch. dis. outdoors less often: other chronic disease 2",
  choutd12 = "Ch. dis. outdoors less often: hypertension",
  corona1 = "Since March 2020: R tested positive on corona test",
  corona1_lc1 = "Long-Covid 1: shortness of breath / fatigue",
  corona1_lc2 = "Long-Covid 1: gloom / anxious",
  corona1_lc3 = "Long-Covid 1: forgetfulness / concentration problems",
  corona1_lc4 = "Long-Covid 1: more help from others / decreased working ability",
  corona1_m = "Month positive corona test",
  corona1_y = "Year positive corona test",
  corona2 = "Second positive corona test",
  corona2_lc1 = "Long-Covid 2: shortness of breath / fatigue",
  corona2_lc2 = "Long-Covid 2: gloom / anxious",
  corona2_lc3 = "Long-Covid 2: forgetfulness / concentration problems",
  corona2_lc4 = "Long-Covid 2: more help from others / decreased working ability",
  corona2_m = "Month second positive corona test",
  corona2_y = "Year second positive corona test",
  cva01 = "CVA",
  cva02 = "CVA: how many times",
  cva02a = "CVA: stroke since last interview",
  cva02b = "CVA: no of strokes",
  cva02c = "CVA: (short) no of strokes",
  cva03 = "CVA: one stroke age",
  cva03a = "CVA: (short) 1 stroke age",
  cva03j = "CVA: 1, stroke year",
  cva03m = "CVA: 1, stroke month",
  cva04 = "CVA: first stroke age",
  cva04a = "CVA: (short) > 1, first stroke age",
  cva04j = "CVA: > 1, first stroke year",
  cva04m = "CVA: > 1, first stroke month",
  cva05 = "CVA: last stroke age",
  cva05a = "CVA: (short) > 1, last stroke age",
  cva05j = "CVA: > 1, last stroke year",
  cva05m = "CVA: > 1, last stroke month",
  cva06 = "CVA: taking medication",
  cva07 = "CVA: treatment doctor",
  cva08 = "CVA: still problems with arms and legs",
  cva09 = "CVA: still problems with vision",
  cva10 = "CVA: still problems speech",
  cva11 = "CVA: still problems understanding written text",
  cva12 = "CVA: outdoors less often",
  diabe01 = "Diabetes",
  diabe02 = "Diabetes: from which age",
  diabe03 = "Diabetes: taking medication",
  diabe03a = "Diabetes: which medication from onset",
  diabe03b = "Diabetes: medication; insulin tablets",
  diabe03c = "Diabetes: medication; insulin pump",
  diabe04 = "Diabetes: treatment doctor",
  diabe05 = "Diabetes: treatment related eye problems",
  diabe06 = "Diabetes: type of treatment eye problems",
  diabe07 = "Diabetes: pain when walking",
  diabe08 = "Diabetes: pain when walking: no of meter",
  diabe09 = "Diabetes: pain disappears standing still",
  diabe10 = "Diabetes: pain in legs during rest",
  diabe11 = "Diabetes: chest pain during exertion",
  diabe12 = "Diabetes: exertion pain disappears in 10 minutes",
  diabe13 = "Diabetes: outdoors less often",
  diabe6a = "Diabetes: eye probl, laser",
  diabe6b = "Diabetes: eye probl, cataract",
  diabe6c = "Diabetes: eye probl, other treatment",
  hart01 = "Heart: heart disease",
  hart02 = "Heart: from which age",
  hart03 = "Heart: taking medication",
  hart04 = "Heart: treatment doctor",
  hart05 = "Heart: myocardial infarction since last interview",
  hart06 = "Heart: no of myocardial inf since last interview",
  hart07 = "Heart: one infarction age",
  hart07j = "Heart: one infarction year",
  hart07m = "Heart: one infarction month",
  hart08 = "Heart: first infarction age",
  hart08j = "Heart: >1; first infarction year",
  hart08m = "Heart: >1; first infarction month",
  hart09 = "Heart: last infarction age",
  hart09j = "Heart: >1; last infarction year",
  hart09m = "Heart: >1; last infarction month",
  hart10 = "Heart: chest pain during exertion",
  hart11 = "Heart: exertion pain disappears in 10 minutes",
  hart12 = "Heart: >1 pillow for shortness of breath",
  hart13 = "Heart: edema morning; legs, feet, ankles",
  hart14 = "Heart: edema evening; legs, feet, ankles",
  hart15 = "Heart: cardiac surgery since last int.",
  hart15a = "Heart: valves/cardiac surgery since last interview",
  hart15b = "Heart: bypass/cardiac surgery since last interview",
  hart15c = "Heart: dotter/cardiac surgery since last interview",
  hart15d = "Heart: pacemaker/cardiac surgery since last interview",
  hart15e = "Heart: other/cardiac surgery since l. int.",
  hart16 = "Heart: outdoors less often",
  hbd1 = "Hypertension",
  hbd1a = "Hypertension: taking medication",
  hbd2 = "Hypertension: from which age",
  hbd2a = "Hypertension: taking medication",
  hbd3 = "Hypertension: treatment doctor",
  incon1 = "Incontinence",
  incon10 = "Past month: strong urge to urinate and unable to make it to the toilet on time",
  incon2 = "Incontinence: from which age",
  incon3 = "Incontinence: taking medication",
  incon4 = "Incontinence: treatment doctor",
  incon5 = "Incontinence: how often loss of urine",
  incon6 = "Incontinence: use special material",
  incon7 = "Incontinence: surgery since last interview",
  incon8 = "Incontinence: outdoors less often",
  incon9 = "Past month: unintentional urine loss with physical exertion",
  kneep1 = "Knee pain past 6 monthsnths",
  kneep2 = "Knee pain: pain level now",
  kneep3 = "Knee pain: worst pain past 6 monthsnths",
  kneep4 = "Knee pain: average pain past 6 monthsnths",
  kneep5 = "Knee pain: number of days unable to perform normal activities",
  kneep6 = "Knee pain: to which extent impeded daily activities",
  kneep7 = "Knee pain: to which extent changed social activities",
  kneep8 = "Knee pain: to which extent changed daily work activities",
  kneep9 = "Knee pain: number of days pain past 6 monthsnths",
  othsi01 = "Other1: other chronic diseases",
  othsi02 = "Other1: disease",
  othsi04 = "Other1: from which age",
  othsi05 = "Other1: taking medication",
  othsi06 = "Other1: treatment doctor",
  othsi07 = "Other2: other chronic diseases",
  othsi08 = "Other2: disease",
  othsi10 = "Other2: from which age",
  othsi11 = "Other2: taking medication",
  othsi12 = "Other2: treatment doctor",
  rh10_1j = "Joint replacement surgery (1): joint",
  rh10_1r = "Joint replacement surgery (1): reason",
  rh10_1s = "Joint replacement surgery (1): side",
  rh10_1y1 = "Joint replacement surgery (1): year (1)",
  rh10_1y2 = "Joint replacement surgery (1): year (2)",
  rh10_2j = "Joint replacement surgery (2): joint",
  rh10_2r = "Joint replacement surgery (2): reason",
  rh10_2s = "Joint replacement surgery (2): side",
  rh10_2y1 = "Joint replacement surgery (2): year (1)",
  rh10_2y2 = "Joint replacement surgery (2): year (2)",
  rh10_3j = "Joint replacement surgery (3): joint",
  rh10_3r = "Joint replacement surgery (3): reason",
  rh10_3s = "Joint replacement surgery (3): side",
  rh10_3y1 = "Joint replacement surgery (3): year (1)",
  rh10_3y2 = "Joint replacement surgery (3): year (2)",
  rheum01 = "Osteo/rheum art: osteoarthritis",
  rheum01a = "Osteo/rheum art: osteoarthritis (other than knee, hip or hand)",
  rheum02 = "Osteo/rheum art: rheumatoid arthritis",
  rheum03 = "Osteo/rheum art: from which age",
  rheum04 = "Osteo/rheum art: taking medication",
  rheum05 = "Osteo/rheum art: treatment doctor",
  rheum06 = "Osteo/rheum art: pain in joints past 3 months",
  rheum07 = "Osteo/rheum art: morning stiffness joint",
  rheum08 = "Osteo/rheum art: swelling joints past month",
  rheum09 = "Osteo/rheum art: surgery since last int.",
  rheum10 = "Osteo/rheum art: joint prostheses",
  rheum10a = "Osteo/rheum art: joint replacement surgery",
  rheum10a2 = "Osteo/rheum art: joint replacement surgery (2)",
  rheum10a3 = "Osteo/rheum art: joint replacement surgery (3)",
  rheum11 = "Osteo/rheum art: outdoors less often",
  rheum12 = "Osteo/rheum art: observation hands",
  rheum8a = "Osteo/rheum art: complaints fingers",
  rheum8b = "Osteo/rheum art: complaints hand/wrist",
  rheum8c = "Osteo/rheum art: complaints elbows",
  rheum8d = "Osteo/rheum art: complaints shoulders",
  rheum8e = "Osteo/rheum art: complaints toes",
  rheum8f = "Osteo/rheum art: complaints feet/ankles",
  rheum8g = "Osteo/rheum art: complaints knees",
  rheum8h = "Osteo/rheum art: complaints hip",
  rheum8i = "Osteo/rheum art: complaints neck",
  rheum8j = "Osteo/rheum art: complaints back",
  rheum9a = "Osteo/rheum art: surgery fingers",
  rheum9b = "Osteo/rheum art: surgery hand/wrist",
  rheum9c = "Osteo/rheum art: surgery elbows",
  rheum9d = "Osteo/rheum art: surgery shoulders",
  rheum9e = "Osteo/rheum art: surgery toes since",
  rheum9f = "Osteo/rheum art: surgery feet/ankles",
  rheum9g = "Osteo/rheum art: surgery knees",
  rheum9h = "Osteo/rheum art: surgery hip",
  rheum9i = "Osteo/rheum art: surgery neck",
  rheum9j = "Osteo/rheum art: surgery back",
  rmch = "Reason missing: chronic diseases",
  vaccin = "R vaccinated against corona",
  vaccin_m = "R vaccinated against corona: month first vaccination",
  vaccin_y = "R vaccinated against corona: year first vaccination",
  .applies_to_waves = c("Z")
)

variable_labels(
  "artvei1", "hart01",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "artvei2", "artvei6", "cancer2", "cara05", "cara06", "cara07", "cara09", "cara10", "cva08", "cva10", "cva11", "diabe08", "diabe10", "hart11", "incon2", "incon4", "incon5", "incon6",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B")
)

variable_labels(
  "artvei4", "artvei5", "artvei7", "cancer4", "cara02", "cara04", "cara08", "cva07", "diabe02", "diabe04", "diabe09", "diabe12", "hart04", "hart10", "hart12",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "cva02", "cva03", "cva04", "cva05", "diabe06", "hart07", "hart08", "hart09",
  .applies_to_waves = c("B")
)

variable_labels(
  "cva09", "diabe05", "hart13",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I")
)

variable_labels(
  "hart02",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "K")
)

variable_labels(
  "hart14",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "J", "K")
)

variable_labels(
  "artve8a", "artve8b", "artve8c", "artve8d", "artve8e", "cance5a", "cance5b", "cance5e", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance6a", "cance6b", "cance6c", "cance6d", "cance6e", "cance6f", "cancer1", "cara11", "diabe07", "hbd1", "hbd2", "hbd3", "othsi01", "othsi02", "othsi04", "othsi06", "othsi07", "othsi08", "othsi10", "othsi12", "rheum04", "rheum05", "rheum07", "rheum08", "rheum12", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i", "rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "artvei3", "cancer3", "cara03", "cva06", "diabe03", "hart03", "hart07m", "hbd2a", "incon1", "incon3", "rheum03", "rheum10",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B")
)

variable_labels(
  "artvei8", "cance5d", "cance7a", "cancer5", "cancer6", "cva02a",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "artvei9", "cva02b", "hart06",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

variable_labels(
  "cance5m", "cance6g", "cva03j", "cva03m", "cva04j", "cva04m", "cva05j", "cva05m", "hart07j", "hart08j", "hart08m", "hart09j", "hart09m", "othsi05",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I")
)

variable_labels(
  "cancer8", "cara12", "cva12", "diabe13", "hart15d", "hart16", "incon7", "incon8", "othsi11", "rheum11",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

variable_labels(
  "cva01", "diabe01", "rheum02",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "diabe6a", "diabe6b", "diabe6c",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H")
)

variable_labels(
  "rheum01",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J")
)

variable_labels(
  "cance7b", "cance7c", "cance7d", "hart15", "hart15e", "rheum09",
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

variable_labels(
  "chmodus",
  .applies_to_waves = c("D", "E", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "cva02c", "cva03a", "cva04a", "cva05a",
  .applies_to_waves = c("D", "E", "F", "G")
)

variable_labels(
  "diabe11", "hart05", "hart15a", "hart15b", "hart15c",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "rheum06",
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "rheum8j", "rheum9j",
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  "choutd", "choutd01", "choutd02", "choutd03", "choutd04", "choutd05", "choutd06", "choutd07", "choutd08", "choutd09", "choutd10", "choutd11", "choutd12", "hbd1a", "incon10", "incon9", "kneep2", "kneep5", "kneep6", "kneep7", "kneep8", "rh10_1j", "rh10_1r", "rh10_1s", "rh10_2j", "rh10_2r", "rh10_2s", "rh10_3j", "rh10_3r", "rh10_3s", "rheum10a", "rheum10a2", "rheum10a3",
  .applies_to_waves = c("I", "J", "K")
)

variable_labels(
  "diabe03a", "rh10_1y1", "rh10_1y2", "rh10_2y1", "rh10_2y2", "rh10_3y1", "rh10_3y2",
  .applies_to_waves = c("I", "J")
)

variable_labels(
  "cance1x",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  "artvei1b", "artvei1c", "artvei1d", "cance5x", "chol1", "chol2", "corona1", "corona1_lc1", "corona1_lc2", "corona1_lc3", "corona1_lc4", "corona1_m", "corona1_y", "corona2", "corona2_lc1", "corona2_lc2", "corona2_lc3", "corona2_lc4", "corona2_m", "corona2_y", "diabe03b", "diabe03c", "rheum01a", "vaccin", "vaccin_m", "vaccin_y",
  .applies_to_waves = c("K")
)

variable_labels(
  artve8a = "Arteries: surgery bifurcation",
  artve8b = "Arteries: surgery femoral legs",
  artve8c = "Arteries: surgery femoral groin",
  artve8d = "Arteries: surgery dotter",
  artve8e = "Arteries: surgery other",
  artvei3 = "Arteries: take medicine",
  artvei9 = "Arteries: going outdoors less because of these diseases or abnormalities of the arteries or blood vessels",
  cance5a = "Cancer: lungs",
  cance5b = "Cancer: breast",
  cance5c = "Cancer: uterus",
  cance5d = "Cancer: cervix",
  cance5e = "Cancer: intestines",
  cance5f = "Cancer: prostate",
  cance5g = "Cancer: larynx",
  cance5h = "Cancer: esophagus",
  cance5i = "Cancer: stomach",
  cance5j = "Cancer: blood",
  cance5k = "Cancer: skin",
  cance5l = "Cancer: other",
  cance6a = "Cancer: metastases bone/skeleton",
  cance6b = "Cancer: metastases liver",
  cance6c = "Cancer: metastases brain",
  cance6d = "Cancer: metastases lungs",
  cance6e = "Cancer: metastases other",
  cance7a = "Cancer: treatment surgery",
  cance7b = "Cancer: treatment chemotherapy",
  cance7c = "Cancer: treatment radiotherapy",
  cance7d = "Cancer: treatment alternative (Moerman etc)",
  cancer1 = "Cancer: yes/no",
  cancer3 = "Cancer: take medicine",
  cancer6 = "Cancer: metastases yes/no",
  cancer8 = "Cancer: going outdoors less because of cancer",
  cara03 = "CNSLD: take medicine",
  cara11 = "CNSLD: disturbed night-rest or sleeping",
  cara12 = "CNSLD: going outdoors less because of CNSLD",
  cva01 = "CVA: yes/no",
  cva06 = "CVA: take medicine",
  cva12 = "CVA: going outdoors less because of CVA",
  diabe01 = "Diabetes: yes/no",
  diabe03 = "Diabetes: take medicine",
  diabe07 = "Diabetes:",
  diabe13 = "Diabetes: going outdoors less because of diabetes",
  hart03 = "Heart: take medicine",
  hart06 = "Heart: myocardial inf no of times",
  hart15a = "Heart: surgery valves",
  hart15b = "Heart: surgery bypass",
  hart15c = "Heart: surgery dotter",
  hart15d = "Heart: surgery pacemaker",
  hart15e = "Heart: surgery other",
  hart16 = "Heart: going outdoors less because of heart disease",
  incon1 = "Incontinence: yes/no",
  incon3 = "Incontinence: take medicine",
  incon7 = "Incontinence: surgery yes/no",
  incon8 = "Incontinence: going outdoors less because of loss of urine",
  othsi01 = "Other: other diseases yes/no (first)",
  othsi02 = "Other: first disease",
  othsi04 = "Other: from which age (first)",
  othsi05 = "Other: take medicine (first)",
  othsi06 = "Other: treatment doctor (first)",
  othsi07 = "Other: other diseases yes/no (second)",
  othsi08 = "Other: second disease",
  othsi10 = "Other: from which age (second)",
  othsi11 = "Other: take medicine (second)",
  othsi12 = "Other: treatment doctor (second)",
  rheum01 = "Rheum/arthrosis: osteoarthritis",
  rheum02 = "Rheum/arthrosis: rheumatoid arthritis",
  rheum03 = "Rheum/arthrosis: from which age",
  rheum04 = "Rheum/arthrosis: take medicine",
  rheum05 = "Rheum/arthrosis: treatment doctor",
  rheum06 = "Rheum/arthrosis: pain in joints past 3 months",
  rheum07 = "Rheum/arthrosis: stiffness joints past 3 month",
  rheum08 = "Rheum/arthrosis: swelling joints past month",
  rheum09 = "Rheum/arthrosis: surgery yes/no",
  rheum10 = "Rheum/arthrosis: joint prostheses",
  rheum11 = "Rheum/arthrosis: going outdoors less because of complaints of joints",
  rheum12 = "Rheum/arthrosis: observation hands",
  rheum8a = "Rheum/arthrosis: complaints fingers",
  rheum8b = "Rheum/arthrosis: complaints hand/wrist",
  rheum8c = "Rheum/arthrosis: complaints elbows",
  rheum8d = "Rheum/arthrosis: complaints shoulders",
  rheum8e = "Rheum/arthrosis: complaints toes",
  rheum8f = "Rheum/arthrosis: complaints feet/ankles",
  rheum8g = "Rheum/arthrosis: complaints knees",
  rheum8h = "Rheum/arthrosis: complaints hip",
  rheum8i = "Rheum/arthrosis: complaints neck",
  rheum9a = "Rheum/arthrosis: surgery fingers",
  rheum9b = "Rheum/arthrosis: surgery hand/wrist",
  rheum9c = "Rheum/arthrosis: surgery elbows",
  rheum9d = "Rheum/arthrosis: surgery shoulders",
  rheum9e = "Rheum/arthrosis: surgery toes",
  rheum9f = "Rheum/arthrosis: surgery feet/ankles",
  rheum9g = "Rheum/arthrosis: surgery knees",
  rheum9h = "Rheum/arthrosis: surgery hip",
  rheum9i = "Rheum/arthrosis: surgery neck",
  rmch = "Reason missing chronic diseases",
  .applies_to_waves = c("B")
)

variable_labels(
  artvei8 = "Arteries: surgery",
  hart05 = "Heart: myocardial infarction",
  hart15 = "Heart: cardiac surgery",
  .applies_to_waves = c("B", "2B", "3B")
)

variable_labels(
  cara01 = "CNSLD: asthma, chr bronch, emphysema",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  diabe11 = "Diabetes:",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  cance5c = "Cancer:",
  cance5f = "Cancer:",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

variable_labels(
  cance7b = "Cancer: chemotherapy, since last interview",
  cance7c = "Cancer: radiotherapy, since last interview",
  cance7d = "Cancer: alternative treatment, since last interview",
  .applies_to_waves = c("C", "I", "J", "K")
)

variable_labels(
  hart05 = "Heart: myocardial infarction since last",
  hart15 = "Heart: cardiac surgery sin 3be last interview",
  hart15a = "Heart: valves/cardiac surgery since last",
  hart15b = "Heart: bypass/cardiac surgery since last int.",
  hart15c = "Heart: dotter/cardiac surgery since last int.",
  hart15e = "Heart: other/cardiac surgery since last int.",
  rheum06 = "Osteo/rheum art: pain in joints past 3 m",
  rheum09 = "Osteo/rheum art: surgery since last int",
  .applies_to_waves = c("C")
)

variable_labels(
  rmch = "Reason missing: chronical diseases",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  cance5d = "Cancer:",
  cance7a = "Cancer: surgery",
  cance7b = "Cancer: chemotherapy surgery",
  cance7c = "Cancer: radiotherapy surgery",
  cance7d = "Cancer: alternative treatment",
  cancer6 = "Cancer: metastases",
  cva02b = "CVA: number of strokes",
  diabe11 = "Diabetes: chest pain during exertion already asked/",
  hart06 = "Heart: no of myocardial infarctions",
  hart15a = "Heart: valves/cardiac surgery",
  hart15b = "Heart: bypass/cardiac surgery",
  hart15c = "Heart: dotter/cardiac surgery",
  hart15d = "Heart: pacemaker/cardiac surgery",
  hart15e = "Heart: other/cardiac surgery",
  incon7 = "Incontinence: surgery",
  rheum09 = "Osteo/rheum art: surgery",
  .applies_to_waves = c("2B", "3B")
)

variable_labels(
  cancer5 = "Cancer: tumor",
  .applies_to_waves = c("2B")
)

variable_labels(
  diabe06 = "Diabetes: eye problems: type of treatment",
  .applies_to_waves = c("3B")
)

variable_labels(
  diabe6a = "Diabetes eye problems: laser treatment",
  diabe6b = "Diabetes eye problems: cataract operation",
  diabe6c = "Diabetes eye problems: other treatment",
  hart07m = "Heart: one infarction",
  .applies_to_waves = c("I")
)

variable_labels(
  hart11 = "Heart: exertion pain disappears in 10 min",
  hart15 = "Heart: cardiac surgery since last interview",
  hart15d = "Heart: pacemaker/cardiac surgery since interview",
  hart15e = "Heart: other/cardiac surgery since last interview",
  kneep1 = "Knee pain past 6 months",
  kneep3 = "Knee pain: worst pain past 6 months",
  kneep4 = "Knee pain: average pain past 6 months",
  kneep9 = "Knee pain: number of days pain past 6 months",
  rheum09 = "Osteo/rheum art: surgery since last interview",
  .applies_to_waves = c("I", "J", "K")
)

variable_labels(
  trauy = NA_character_,
  .applies_to_waves = c("I", "J")
)

variable_labels(
  cva03j = "CVA: (first) stroke year",
  cva03m = "CVA: (first) stroke month",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  hart07j = "Heart: (first) infarction",
  hart07m = "Heart: (first) infarction",
  .applies_to_waves = c("J")
)

variable_labels(
  diabe03 = "Diabetes: medication from onset",
  diabe03a = "Diabetes: medication; insulin injections",
  htraumj = NA_character_,
  rh10_1y1 = "Joint replacement surgery (1):",
  rh10_1y2 = "Joint replacement surgery (1):",
  rh10_2y1 = "Joint replacement surgery (2):",
  rh10_2y2 = "Joint replacement surgery (2):",
  rh10_3y1 = "Joint replacement surgery (3):",
  rh10_3y2 = "Joint replacement surgery (3):",
  rheum01 = "Osteo/rheum art: osteoarthritis (knee, hip or hand)",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("artve8a", "artve8b", "artve8c", "artve8d", "artve8e", "artvei1c", "artvei1d", "artvei2", "artvei3", "artvei4", "artvei5", "artvei6", "artvei7", "artvei8", "artvei9", "cance1x", "cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance5m", "cance5x", "cance6a", "cance6b", "cance6c", "cance6d", "cance6e", "cance6f", "cance6g", "cance7a", "cance7b", "cance7c", "cance7d", "cancer2", "cancer3", "cancer4", "cancer5", "cancer6", "cancer8", "cara02", "cara03", "cara04", "cara05", "cara06", "cara07", "cara08", "cara09", "cara10", "cara11", "cara12", "chmodus", "choutd01", "choutd02", "choutd03", "choutd04", "choutd05", "choutd06", "choutd07", "choutd08", "choutd09", "choutd10", "choutd11", "choutd12", "corona1_lc1", "corona1_lc2", "corona1_lc3", "corona1_lc4", "corona1_m", "corona1_y", "corona2", "corona2_lc1", "corona2_lc2", "corona2_lc3", "corona2_lc4", "corona2_m", "corona2_y", "cva02", "cva02a", "cva02b", "cva02c", "cva03", "cva03a", "cva03j", "cva03m", "cva04", "cva04a", "cva04j", "cva04m", "cva05", "cva05a", "cva05j", "cva05m", "cva06", "cva07", "cva08", "cva09", "cva10", "cva11", "cva12", "diabe02", "diabe03", "diabe03a", "diabe03b", "diabe03c", "diabe04", "diabe05", "diabe06", "diabe07", "diabe08", "diabe09", "diabe10", "diabe11", "diabe12", "diabe13", "diabe6a", "diabe6b", "diabe6c", "hart02", "hart03", "hart04", "hart05", "hart06", "hart07", "hart07j", "hart07m", "hart08", "hart08j", "hart08m", "hart09", "hart09j", "hart09m", "hart10", "hart11", "hart12", "hart13", "hart14", "hart15", "hart15a", "hart15b", "hart15c", "hart15d", "hart15e", "hart16", "hbd1a", "hbd2", "hbd2a", "hbd3", "incon2", "incon3", "incon4", "incon5", "incon6", "incon7", "incon8", "kneep2", "kneep3", "kneep4", "kneep5", "kneep6", "kneep7", "kneep8", "kneep9", "othsi02", "othsi04", "othsi05", "othsi06", "othsi07", "othsi08", "othsi10", "othsi11", "othsi12", "rh10_1j", "rh10_1s", "rh10_1y1", "rh10_1y2", "rh10_2j", "rh10_2s", "rh10_2y1", "rh10_2y2", "rh10_3j", "rh10_3r", "rh10_3s", "rh10_3y1", "rh10_3y2", "rheum03", "rheum04", "rheum05", "rheum06", "rheum07", "rheum08", "rheum09", "rheum10", "rheum10a", "rheum10a2", "rheum10a3", "rheum11", "rheum12", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i", "rheum8j", "rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i", "rheum9j", "vaccin_m", "vaccin_y"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "Not applicable, positive corona test less than 3 months ago",
  .applies_to_vars = c("corona1_lc1", "corona1_lc2", "corona1_lc3", "corona1_lc4", "corona2_lc1", "corona2_lc2", "corona2_lc3", "corona2_lc4"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-5` = "not available",
  .applies_to_vars = c("artvei1", "cancer1", "cara01", "cva01", "diabe01", "hart01", "incon1", "othsi01", "rheum01", "rheum02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available, routing",
  .applies_to_vars = c("chmodus", "chol1", "chol2", "choutd", "corona1", "hbd1", "hbd1a", "incon10", "incon9", "kneep1", "rheum01a", "vaccin"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "not available, routing",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-7` = "tumor, prostate not asked, female",
  .applies_to_vars = c("cance5f"),
  .applies_to_waves = c("Z", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("artve8a", "artve8b", "artve8c", "artve8d", "artve8e"),
  .applies_to_waves = c("Z", "B", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-1` = "na, asked", `0` = "label varies by wave", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave",
  .applies_to_vars = c("artvei1", "cancer1", "cara01", "cva01", "diabe01", "hart01", "incon1", "rheum01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available", `1` = "no, disease still exists", `2` = "yes, disease not present anymore", `3` = "respondent has complaints, but doctor says no disease", `4` = "respondent says he/she never had the disease", `5` = "interviewer error",
  .applies_to_vars = c("artvei1b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available, asked / respondent does not know",
  .applies_to_vars = c("artvei1c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `1` = "no trouble anymore, complaints disappeared by itself", `2` = "no trouble anymore, disease is under control", `3` = "no trouble anymore, complaints disappeared after surgery", `4` = "according to the doctor, the disease is no longer present", `5` = "previous measurement is wrong", `6` = "other reason mentioned", `7` = "respondent does not know",
  .applies_to_vars = c("artvei1d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("artvei2", "artvei6", "diabe02", "diabe08", "hart02", "hart07j", "hart08j", "hart09j", "hbd2", "incon2", "othsi10"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("artvei3", "artvei7", "cancer3", "cara03", "cva06", "diabe09", "hart03", "hart11", "incon3", "othsi05", "othsi11", "rheum04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "yes, specialist",
  .applies_to_vars = c("artvei4", "cancer4", "cara04", "cva07", "diabe04", "hart04", "incon4", "othsi06", "othsi12", "rheum05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("artvei5", "artvei8", "cara05", "cara06", "cara07", "cara09", "cara10", "cva08", "cva09", "cva10", "cva11", "diabe05", "diabe10", "diabe12", "hart05", "hart12", "incon7", "othsi07", "rheum06", "rheum07", "rheum08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("artvei9", "cva12", "diabe13", "hart16", "incon8"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `-8` = "not available, technical reason", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "benign", `2` = "maligh", `3` = "unknown",
  .applies_to_vars = c("cance1x"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "mentioned",
  .applies_to_vars = c("cance5a", "cance5b", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance7a", "cance7b", "cance7c", "cance7d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-7` = "tumor, uterus not asked, male", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "mentioned",
  .applies_to_vars = c("cance5c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-7` = "label varies by wave", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "mentioned",
  .applies_to_vars = c("cance5d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("cance5m", "cance6g"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "benign", `2` = "maligh", `3` = "unknown",
  .applies_to_vars = c("cance5x"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "mentioned",
  .applies_to_vars = c("cance6a", "cance6b", "cance6c", "cance6d", "cance6e", "rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance6f"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("cancer2", "rheum03"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H")
)

value_labels(
  `-6` = "not available, previous interview no cancer", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cancer5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("cancer6", "hart15b", "hart15c", "hart15d", "hart15e", "rheum10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cancer8", "cara12", "rheum11"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "not available",
  .applies_to_vars = c("cara02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "yes, at rest",
  .applies_to_vars = c("cara08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cara11"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `1` = "long interview", `2` = "short interview",
  .applies_to_vars = c("chmodus"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "respondent does not know",
  .applies_to_vars = c("chol1", "chol2", "hbd1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "not available", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("choutd"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("choutd01", "choutd02", "choutd03", "choutd04", "choutd05", "choutd06", "choutd07", "choutd08", "choutd09", "choutd10", "choutd11", "choutd12"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("corona1", "rheum01a"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("corona1_lc1", "corona1_lc2", "corona1_lc3", "corona1_lc4", "corona2", "corona2_lc1", "corona2_lc2", "corona2_lc3", "corona2_lc4", "hbd1a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("corona1_m", "corona2_m", "vaccin_m"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("corona1_y", "corona2_y", "cva03", "cva04", "cva05", "hart07", "hart08", "hart09", "vaccin_y"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("cva02", "hart06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cva02a", "hart13"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("cva02b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not available, no short version", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("cva02c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("cva03a", "cva04a", "cva05a"),
  .applies_to_waves = c("Z", "D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("cva03j", "cva04j", "cva05j"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("cva03m", "cva04m", "cva05m"),
  .applies_to_waves = c("Z", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "yes, tablets only", `4` = "yes, insulin and tablets",
  .applies_to_vars = c("diabe03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "label varies by wave", `2` = "insulin injections", `3` = "tablets",
  .applies_to_vars = c("diabe03a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("diabe03b", "diabe03c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "other",
  .applies_to_vars = c("diabe06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "label varies by wave", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("diabe07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "label varies by wave", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "no exertion: other reason",
  .applies_to_vars = c("diabe11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("diabe6a", "diabe6b", "diabe6c"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("hart07m", "hart08m", "hart09m"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "no exertion: other reason",
  .applies_to_vars = c("hart10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "yes",
  .applies_to_vars = c("hart14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart15"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("hart15a"),
  .applies_to_waves = c("Z", "B", "2B", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hbd2a"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("hbd3"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "not applicable: stoma, catheter or something else", `-1` = "na, asked", `1` = "2 times a month or less", `2` = "3-4 times a month", `3` = "a few times a week", `4` = "daily",
  .applies_to_vars = c("incon10", "incon9"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "2 times a month or less", `2` = "3-4 times a month", `3` = "a few times a week", `4` = "daily",
  .applies_to_vars = c("incon5"),
  .applies_to_waves = c("Z", "D", "E", "F", "G", "H")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "yes, most of the time",
  .applies_to_vars = c("incon6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("kneep1"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no pain", `10` = "worst conceivable pain",
  .applies_to_vars = c("kneep2", "kneep3", "kneep4"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "0-6 days", `2` = "7-14 days", `3` = "15-30 days", `4` = "31 days or more",
  .applies_to_vars = c("kneep5"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not impeded", `10` = "unable to continue activities",
  .applies_to_vars = c("kneep6"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no change", `10` = "extreme change",
  .applies_to_vars = c("kneep7", "kneep8"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not a single day", `2` = "1-30 days", `3` = "31-89 days", `4` = "90 days or more",
  .applies_to_vars = c("kneep9"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "yes",
  .applies_to_vars = c("othsi01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "label varies by wave", `25` = "label varies by wave", `26` = "label varies by wave", `27` = "label varies by wave", `28` = "label varies by wave", `29` = "label varies by wave", `30` = "label varies by wave", `31` = "label varies by wave", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("othsi02", "othsi08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("othsi04"),
  .applies_to_waves = c("Z", "B", "D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave", `4` = "label varies by wave", `5` = "label varies by wave", `6` = "label varies by wave", `7` = "label varies by wave", `8` = "label varies by wave", `9` = "label varies by wave", `10` = "label varies by wave", `11` = "left hand/wrist", `12` = "both hands/wrists", `13` = "toes right foot", `14` = "toes left foot", `15` = "toes both feet", `16` = "right foot/ankle", `17` = "left foot/ankle", `18` = "both feet/ankles", `19` = "neck", `20` = "back", `21` = "right shoulder", `22` = "left shoulder", `23` = "other",
  .applies_to_vars = c("rh10_1j", "rh10_2j", "rh10_3j"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "not available", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_1r"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "right", `2` = "left", `3` = "right and left",
  .applies_to_vars = c("rh10_1s", "rh10_2s", "rh10_3s"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "year",
  .applies_to_vars = c("rh10_1y1", "rh10_2y1", "rh10_3y1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `2` = "year",
  .applies_to_vars = c("rh10_1y2", "rh10_2y2", "rh10_3y2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "not available", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_2r"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_3r"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "label varies by wave", `1` = "label varies by wave", `2` = "label varies by wave", `3` = "label varies by wave",
  .applies_to_vars = c("rheum02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "label varies by wave",
  .applies_to_vars = c("rheum09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum10a", "rheum10a2", "rheum10a3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "rheumatic hands", `2` = "no rheumatic hands", `3` = "observation not possible",
  .applies_to_vars = c("rheum12"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "label varies by wave", `2` = "mentioned",
  .applies_to_vars = c("rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum8j"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum9j"),
  .applies_to_waves = c("Z", "I", "J", "K")
)

value_labels(
  `-2` = "valid data", `1` = "terminated interview", `2` = "label varies by wave", `4` = "refused test",
  .applies_to_vars = c("rmch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not asked", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("vaccin"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "na, see BARTVEI8",
  .applies_to_vars = c("artve8a", "artve8b", "artve8c", "artve8d", "artve8e"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-2` = "na, see BHART15",
  .applies_to_vars = c("hart15a", "hart15b", "hart15c", "hart15d", "hart15e"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-2` = "na, see BOTHSI01",
  .applies_to_vars = c("othsi02", "othsi04", "othsi05", "othsi06", "othsi07"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-4` = "na, short version",
  .applies_to_vars = c("artvei5", "artvei8", "cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance7a", "cance7b", "cance7c", "cance7d", "cancer6", "cara05", "cara06", "cara07", "cara08", "cara09", "cara10", "cara11", "cva08", "cva09", "cva10", "cva11", "diabe05", "diabe07", "diabe10", "diabe11", "hart05", "hart10", "hart12", "incon5", "incon6", "incon7", "othsi07", "rheum06", "rheum07", "rheum08", "rheum09", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, interview terminated",
  .applies_to_vars = c("artvei1", "cancer1", "cara01", "cva01", "diabe01", "hart01", "incon1", "othsi01", "rheum01", "rheum02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("artvei1", "cancer1", "cara01", "cva01", "diabe01", "hart01", "incon1", "othsi01", "rheum01", "rheum02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked",
  .applies_to_vars = c("artvei2"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVE1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("artvei3"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("artvei4"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("artvei5", "artvei8"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI5", `-1` = "na, asked",
  .applies_to_vars = c("artvei6"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI5", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("artvei7"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("artvei9"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance7a", "cance7b", "cance7c", "cance7d", "cancer6"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER6", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("cance6a", "cance6b", "cance6c", "cance6d", "cance6e"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked",
  .applies_to_vars = c("cancer2"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("cancer3"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("cancer4"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cancer8"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked",
  .applies_to_vars = c("cara02"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("cara03", "cara05", "cara06", "cara07", "cara09", "cara10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("cara04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked", `0` = "no", `1` = "yes, with heavy exertion", `2` = "yes, with light exertion", `3` = "yes, at rest",
  .applies_to_vars = c("cara08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cara11", "cara12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("cva02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA02", `-1` = "na, asked",
  .applies_to_vars = c("cva03", "cva04", "cva05"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("cva06", "cva08", "cva09", "cva10", "cva11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("cva07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cva12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked",
  .applies_to_vars = c("diabe02"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes, insulin injections", `2` = "yes, tablets only",
  .applies_to_vars = c("diabe03"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("diabe04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("diabe05", "diabe10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE05", `-1` = "na, asked", `1` = "laser coagulation treatment", `2` = "cataract surgery", `3` = "both", `4` = "other",
  .applies_to_vars = c("diabe06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "pain when walking already asked BARTVEI5", `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("diabe07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE07", `-1` = "na, asked",
  .applies_to_vars = c("diabe08"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE07", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("diabe09"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "chest pain during exertion already asked BHART10", `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes", `2` = "no exertion: chest pain", `3` = "no exertion: pain legs", `4` = "no exertion: shortness of breath", `5` = "no exertion: joint complaints", `6` = "no exertion: other reason",
  .applies_to_vars = c("diabe11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE11", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("diabe12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("diabe13"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked",
  .applies_to_vars = c("hart02"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("hart03", "hart05", "hart12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("hart04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART05", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("hart06"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked",
  .applies_to_vars = c("hart07", "hart08", "hart09", "hart13", "hart14", "hart15"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `0` = "no", `1` = "yes", `2` = "no exertion: chest pain", `3` = "no exertion: pain legs", `4` = "no exertion: shortness of breath", `5` = "no exertion: joint complaints", `6` = "no exertion: other reason",
  .applies_to_vars = c("hart10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART10", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("hart11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("hart15b", "hart15c", "hart15d", "hart15e"),
  .applies_to_waves = c("B", "2B", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("hart16"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked",
  .applies_to_vars = c("incon2"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("incon3", "incon7"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("incon4"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `1` = "2 times a month or less", `2` = "3-4 times a month", `3` = "a few times a week", `4` = "daily",
  .applies_to_vars = c("incon5"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `0` = "no", `1` = "only by certain occasion", `2` = "yes, most of the time",
  .applies_to_vars = c("incon6"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("incon8"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("othsi02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("othsi05", "othsi07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("othsi06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("othsi08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked",
  .applies_to_vars = c("othsi10"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("othsi11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("othsi12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked",
  .applies_to_vars = c("rheum03"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("rheum04", "rheum06", "rheum07", "rheum08", "rheum09", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("rheum05"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("rheum10", "rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("rheum11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked", `1` = "rheumatic hands", `2` = "no rheumatic hands", `3` = "observation not possible",
  .applies_to_vars = c("rheum12"),
  .applies_to_waves = c("B", "2B", "3B")
)

value_labels(
  `-2` = "valid data", `1` = "terminated interview", `2` = "short interview",
  .applies_to_vars = c("rmch"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see CCANCER1",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance7a", "cancer2", "cancer3", "cancer4", "cancer5", "cancer6", "cancer8"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CCARA01",
  .applies_to_vars = c("cara02", "cara03", "cara04", "cara05", "cara06", "cara07", "cara08", "cara09", "cara10", "cara11", "cara12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CRHEUM01&02",
  .applies_to_vars = c("rheum03", "rheum04", "rheum05", "rheum06", "rheum07", "rheum08", "rheum09", "rheum11", "rheum12", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i"),
  .applies_to_waves = c("C")
)

value_labels(
  `-5` = "na, see CRMCH",
  .applies_to_vars = c("artvei1", "cancer1", "cara01", "cva01", "diabe01", "hart01", "hbd1", "incon1", "othsi01", "rheum01", "rheum02"),
  .applies_to_waves = c("C")
)

value_labels(
  `-6` = "na, see CCANCER5",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI8", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("artve8a", "artve8b", "artve8c", "artve8d", "artve8e"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no, never", `1` = "no, BARTVEI1 yes", `2` = "yes, BARTVEI1 no", `3` = "yes, BARTVEI1 yes",
  .applies_to_vars = c("artvei1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI1", `-1` = "na, asked",
  .applies_to_vars = c("artvei2"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVE1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei3"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("artvei4"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei5", "artvei8"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI5", `-1` = "na, asked",
  .applies_to_vars = c("artvei6"),
  .applies_to_waves = c("C")
)

value_labels(
  `1` = "see cartvei6, no", `2` = "yes",
  .applies_to_vars = c("artvei7"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("artvei9"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance5a", "cance5b", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-7` = "tumor, uterus not asked, male", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance5c", "cance5d"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCANCE5L", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("cance5m"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCANCER6", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance6a", "cance6b", "cance6c", "cance6d", "cance6e", "cance6f", "cance7b", "cance7c", "cance7d"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCANCE6F", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("cance6g"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance7a", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BCANCER1 yes", `2` = "yes, BCANCER1 no", `3` = "yes, BCANCER1 yes",
  .applies_to_vars = c("cancer1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cancer3", "cara03"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cancer4", "rheum05"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cancer5", "cancer6", "cara05", "cara06", "cara07", "cara09", "cara10", "rheum06", "rheum07", "rheum08", "rheum09"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no, never", `1` = "no, BCARA01 yes", `2` = "yes, BCARA01 no", `3` = "yes, BCARA01 yes",
  .applies_to_vars = c("cara01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("cara02"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cara04"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, with heavy exertion", `3` = "yes, with light exertion", `4` = "yes, at rest",
  .applies_to_vars = c("cara08"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cara11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BCVA01 yes", `2` = "yes, BCVA01 no", `3` = "yes, BCVA01 yes",
  .applies_to_vars = c("cva01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cva02a", "cva06", "cva08", "cva09", "cva10", "cva11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA02A", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("cva02b"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA02B", `-1` = "na, asked",
  .applies_to_vars = c("cva03j", "cva03m", "cva04j", "cva04m", "cva05j", "cva05m"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cva07"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cva12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no, never", `1` = "no, BDIABE01 yes", `2` = "yes, BDIABE01 no", `3` = "yes, BDIABE01 yes",
  .applies_to_vars = c("diabe01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked",
  .applies_to_vars = c("diabe02"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes, insulin injections", `3` = "yes, tablets only",
  .applies_to_vars = c("diabe03"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("diabe04"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe05", "diabe10"),
  .applies_to_waves = c("C")
)

value_labels(
  `-6` = "na, see CARTVEI1", `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe07"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE07", `-1` = "na, asked",
  .applies_to_vars = c("diabe08"),
  .applies_to_waves = c("C")
)

value_labels(
  `1` = "see cdiabe08, no", `2` = "yes",
  .applies_to_vars = c("diabe09"),
  .applies_to_waves = c("C")
)

value_labels(
  `-6` = "chest pain during exertion already asked CHART01", `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("diabe11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("diabe13"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE05", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("diabe6a", "diabe6b", "diabe6c"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no, never", `1` = "no, BHART01 yes", `2` = "yes, BHART01 no", `3` = "yes, BHART01 yes",
  .applies_to_vars = c("hart01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked",
  .applies_to_vars = c("hart02"),
  .applies_to_waves = c("C")
)

value_labels(
  `1` = "see chart02, no", `2` = "yes",
  .applies_to_vars = c("hart03", "hart05"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("hart04"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART05", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("hart06"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART06", `-1` = "na, asked",
  .applies_to_vars = c("hart07j", "hart07m", "hart08j", "hart08m", "hart09j", "hart09m"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("hart10"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart12", "hart13", "hart14", "hart15"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART15", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("hart15a", "hart15b", "hart15c", "hart15d", "hart15e"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("hart16"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hbd1"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHBD1", `-1` = "na, asked",
  .applies_to_vars = c("hbd2"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hbd2a"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("hbd3"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BINCON1 yes", `2` = "yes, BINCON1 no", `3` = "yes, BINCON1 yes",
  .applies_to_vars = c("incon1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked",
  .applies_to_vars = c("incon2"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("incon3", "incon7"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("incon4"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "2 times a month or less", `2` = "3-4 times a month", `3` = "a few times a week", `4` = "daily",
  .applies_to_vars = c("incon5"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "no", `2` = "only on certain occasion", `3` = "yes, most of the time",
  .applies_to_vars = c("incon6"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("incon8"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("othsi01"),
  .applies_to_waves = c("C", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("othsi02"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked",
  .applies_to_vars = c("othsi04"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("othsi05", "othsi07"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("othsi06"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("othsi08"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked",
  .applies_to_vars = c("othsi10"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("othsi11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("othsi12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BRHEUM01 yes", `2` = "yes, BRHEUM01 no", `3` = "yes, BRHEUM01 yes",
  .applies_to_vars = c("rheum01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BRHEUM02 yes", `2` = "yes, BRHEUM02 no", `3` = "yes, BRHEUM02 yes",
  .applies_to_vars = c("rheum02"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum04"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRHEUM01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum10"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRHEUM09", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "valid data", `2` = "interview terminated", `4` = "refused test",
  .applies_to_vars = c("rmch"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see D/E/F/G/HARTVEI1",
  .applies_to_vars = c("artvei2", "artvei4", "artvei5", "artvei8", "artvei9"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HARTVEI5",
  .applies_to_vars = c("artvei6", "artvei7"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HARTVEI8",
  .applies_to_vars = c("artve8a", "artve8b", "artve8c", "artve8d", "artve8e"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HCANCER1",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance7a", "cance7b", "cance7c", "cance7d", "cancer2", "cancer3", "cancer4", "cancer5", "cancer6", "cancer8"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HCANCER6",
  .applies_to_vars = c("cance6a", "cance6b", "cance6c", "cance6d", "cance6e", "cance6f"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HCARA01",
  .applies_to_vars = c("cara02", "cara03", "cara04", "cara05", "cara06", "cara07", "cara08", "cara09", "cara10", "cara11", "cara12"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HCVA01",
  .applies_to_vars = c("cva02a", "cva06", "cva07", "cva08", "cva09", "cva10", "cva11", "cva12"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HCVA02B",
  .applies_to_vars = c("cva03j", "cva03m", "cva04j", "cva04m", "cva05j", "cva05m"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HDIABE01",
  .applies_to_vars = c("diabe02", "diabe03", "diabe04", "diabe05", "diabe07", "diabe10", "diabe11", "diabe13"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HDIABE05",
  .applies_to_vars = c("diabe6a", "diabe6b", "diabe6c"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HDIABE07",
  .applies_to_vars = c("diabe08", "diabe09"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HHART01",
  .applies_to_vars = c("hart02", "hart03", "hart04", "hart05", "hart10", "hart12", "hart13", "hart14", "hart15", "hart15b", "hart15c", "hart15d", "hart15e", "hart16"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HHART06",
  .applies_to_vars = c("hart07j", "hart07m", "hart08j", "hart08m", "hart09j", "hart09m"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HHBD1",
  .applies_to_vars = c("hbd2", "hbd2a", "hbd3"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HINCON1",
  .applies_to_vars = c("incon2", "incon3", "incon4", "incon5", "incon6", "incon7", "incon8"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HOTHSI01",
  .applies_to_vars = c("othsi02", "othsi04", "othsi05", "othsi06", "othsi07"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HOTHSI07",
  .applies_to_vars = c("othsi08", "othsi10", "othsi11", "othsi12"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HRHEUM01&02",
  .applies_to_vars = c("rheum03", "rheum04", "rheum05", "rheum06", "rheum07", "rheum08", "rheum09", "rheum11", "rheum12", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/G/HRHEUM09",
  .applies_to_vars = c("rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "na, see D/E/F/GCVA02C",
  .applies_to_vars = c("cva03a", "cva04a", "cva05a"),
  .applies_to_waves = c("D", "E", "F", "G")
)

value_labels(
  `-5` = "na, see D/E/F/G/HRMCH",
  .applies_to_vars = c("artvei1", "cancer1", "cara01", "cva01", "diabe01", "hart01", "hbd1", "incon1", "rheum01", "rheum02"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-6` = "na, see D/E/F/G/HCANCER5",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "no, previous interview yes", `2` = "yes, previous interview no", `3` = "yes, previous interview yes",
  .applies_to_vars = c("artvei1", "cancer1", "cara01", "cva01", "diabe01", "hart01", "rheum01"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HARTVE1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei3"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("artvei4", "cva07", "diabe04", "incon4", "othsi12"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei5", "artvei8", "cancer5", "cara05", "cara06", "cara07", "cara09", "cara10", "cva08", "cva09", "cva10", "cva11", "diabe05", "diabe10", "hart14", "hart15b", "hart15c", "hart15d", "hart15e", "incon7"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei7", "diabe09", "hart03", "incon3", "othsi11"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HCANCE5L", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("cance5m"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance6a", "cance6b", "cance6c", "cance6d", "cance6e"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HCANCE6F", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("cance6g"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance7a", "cance7b", "cance7c", "cance7d", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cancer6", "rheum06", "rheum07", "rheum08"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, with heavy exertion", `3` = "yes, with light exertion", `4` = "yes, at rest",
  .applies_to_vars = c("cara08"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-2` = "valid data", `1` = "long interview", `2` = "short interview",
  .applies_to_vars = c("chmodus"),
  .applies_to_waves = c("D", "E", "F")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HCVA02A", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("cva02b"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-4` = "na, no short version", `-3` = "na, wrong skip", `-2` = "na, see D/E/F/GCVA01", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("cva02c"),
  .applies_to_waves = c("D", "E", "F", "G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cva06"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, insulin injections", `3` = "yes, tablets only",
  .applies_to_vars = c("diabe03"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-6` = "na, see DARTVEI1", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe07"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-6` = "na, see D/E/F/G/HHART01", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("diabe11"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HDIABE11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe12"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("hart04"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart05", "hart12"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HHART05", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("hart06"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("hart10"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HHART10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart11"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HHART15", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("hart15a"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "no, previous interview yes", `2` = "yes, previous interview no", `3` = "yes, previous interview yes",
  .applies_to_vars = c("incon1"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "only on certain occasion", `3` = "yes, most of the time",
  .applies_to_vars = c("incon6"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-5` = "na, see DRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("othsi01"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "- to be coded -", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("othsi02"),
  .applies_to_waves = c("D", "E", "2B", "F")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("othsi05", "othsi07"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("othsi06"),
  .applies_to_waves = c("D", "E", "2B", "F", "G", "H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "- to be coded -", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("othsi08"),
  .applies_to_waves = c("D", "E", "F")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "no, previous interview yes", `2` = "yes, previous interview no", `3` = "yes, previous interview yes",
  .applies_to_vars = c("rheum02"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum09"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see D/E/F/G/HRHEUM01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum10"),
  .applies_to_waves = c("D", "E", "F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BCVA02B",
  .applies_to_vars = c("cva03j", "cva03m", "cva04j", "cva04m", "cva05j", "cva05m"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-6` = "na, see BCANCER5",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei1", "cara01", "cva01", "diabe01", "hart01", "rheum01"),
  .applies_to_waves = c("2B", "3B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVE1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei3"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("artvei4"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei5", "artvei8"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI5", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei7"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance5a", "cance5b", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-7` = "tumor, uterus not asked, male", `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance5c"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-7` = "tumor, cervix not asked, male", `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance5d"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCE5L", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("cance5m"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER6", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance6a", "cance6b", "cance6c", "cance6d", "cance6e", "cance6f"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCE6F", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("cance6g"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance7a", "cance7b", "cance7c", "cance7d"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cancer1", "hbd1", "incon1", "othsi01"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cancer3"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cancer4"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cancer5"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BCANCER1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cancer6"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cara03"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cara04"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cara05", "cara06", "cara07", "cara09", "cara10"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked", `1` = "no", `2` = "yes, with heavy exertion", `3` = "yes, with light exertion", `4` = "yes, at rest",
  .applies_to_vars = c("cara08"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BCARA01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cara11"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BCVA02A", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("cva02b"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cva07"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cva08", "cva09", "cva10", "cva11"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes, insulin injections", `3` = "yes, tablets only",
  .applies_to_vars = c("diabe03"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("diabe04"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe05", "diabe10"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-6` = "na, see BARTVEI1", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe07"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE07", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe09"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-6` = "na, see BHART01", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("diabe11"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe12"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE05", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("diabe6a", "diabe6b", "diabe6c"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart03"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("hart04"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart05", "hart12", "hart13", "hart14", "hart15"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked",
  .applies_to_vars = c("hart07j", "hart08j", "hart09j"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("hart07m", "hart08m", "hart09m"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("hart10"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart11"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHBD1", `-1` = "na, asked",
  .applies_to_vars = c("hbd2"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hbd2a"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("hbd3"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("incon3"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("incon4"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `1` = "2 times a month or less", `2` = "3-4 times a month", `3` = "a few times a week", `4` = "daily",
  .applies_to_vars = c("incon5"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `1` = "no", `2` = "only on certain occasion", `3` = "yes, most of the time",
  .applies_to_vars = c("incon6"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("incon7"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "- to be coded -", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("othsi08"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("othsi12"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum02"),
  .applies_to_waves = c("2B", "MB")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum04"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("rheum05"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum06", "rheum07", "rheum08"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum09", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum10"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM09", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i"),
  .applies_to_waves = c("2B", "3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see F/G/HRHEUM01&02", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum8j"),
  .applies_to_waves = c("F", "G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see F/G/HRHEUM09", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum9j"),
  .applies_to_waves = c("F", "G", "H")
)

value_labels(
  `-5` = "na, see G/HRMCH", `1` = "long interview", `2` = "short interview",
  .applies_to_vars = c("chmodus"),
  .applies_to_waves = c("G", "H")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "other to be coded",
  .applies_to_vars = c("othsi02", "othsi08"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "Parkinson", `25` = "mental problems, incl. depression", `26` = "other to be coded",
  .applies_to_vars = c("othsi02"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "Parkinson", `25` = "mental problems, incl. depression", `26` = "other to be coded",
  .applies_to_vars = c("othsi08"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see BRMCH", `1` = "long interview", `2` = "short interview",
  .applies_to_vars = c("chmodus"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cva06"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes, insulin injections", `3` = "yes, tablets only", `4` = "yes, insulin and tablets",
  .applies_to_vars = c("diabe03"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see BDIABE05", `-1` = "na, asked", `1` = "laser treatment", `2` = "cataract operation", `3` = "other treatment",
  .applies_to_vars = c("diabe06"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "Parkinson", `25` = "mental problems, incl. depression", `26` = "other to be coded",
  .applies_to_vars = c("othsi08"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-5` = "na, see BRMCH", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum02"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BRHEUM01&02", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum8j"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRHEUM09", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("rheum9j"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see I/JARTVEI8",
  .applies_to_vars = c("artve8a", "artve8b", "artve8c", "artve8d", "artve8e"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see I/JCANCER6",
  .applies_to_vars = c("cance6a", "cance6b", "cance6c", "cance6d", "cance6e", "cance6f"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see I/JCHOUTD",
  .applies_to_vars = c("choutd01", "choutd02", "choutd03", "choutd04", "choutd05", "choutd06", "choutd07", "choutd08", "choutd09", "choutd10", "choutd11", "choutd12"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see I/JHART01",
  .applies_to_vars = c("hart04", "hart05", "hart10", "hart12", "hart15"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see I/JHART15",
  .applies_to_vars = c("hart15a", "hart15b", "hart15c", "hart15d", "hart15e"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see I/JKNEEP1",
  .applies_to_vars = c("kneep2", "kneep3", "kneep4", "kneep5", "kneep6", "kneep7", "kneep8", "kneep9"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see I/JRHEUM01&02",
  .applies_to_vars = c("rheum04", "rheum05", "rheum06", "rheum07", "rheum08", "rheum09", "rheum12", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i", "rheum8j"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see I/JRHEUM09",
  .applies_to_vars = c("rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i", "rheum9j"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see ICANCER1",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance7a", "cance7b", "cance7c", "cance7d", "cancer4", "cancer5", "cancer6"),
  .applies_to_waves = c("I")
)

value_labels(
  `-5` = "na, see I/JRMCH",
  .applies_to_vars = c("artvei1", "cancer1", "cara01", "choutd", "cva01", "diabe01", "hart01", "hbd1", "incon10", "incon9", "kneep1", "othsi01", "rheum01", "rheum02"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-6` = "na, see ICANCER5",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("artvei4"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see I/JARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei5", "artvei8"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JARTVEI5", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei7"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IARTVEI1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("artvei9"),
  .applies_to_waves = c("I")
)

value_labels(
  `-6` = "na, previous interview no cancer", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cancer5"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JCARA01", `-1` = "na, asked",
  .applies_to_vars = c("cara02"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JCARA01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cara04"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see I/JCARA01", `-1` = "na, asked", `1` = "no", `2` = "yes, with heavy exertion", `3` = "yes, with light exertion", `4` = "yes, at rest",
  .applies_to_vars = c("cara08"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see I/JCARA01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cara11"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see I/JRMCH", `1` = "long interview", `2` = "short interview",
  .applies_to_vars = c("chmodus"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IHEALTH1 & not any chronic disease", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("choutd"),
  .applies_to_waves = c("I")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see I/JCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cva02a"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see ICVA02A", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("cva02b"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ICVA02B",
  .applies_to_vars = c("cva03j", "cva03m"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ICVA02B", `-1` = "na, asked",
  .applies_to_vars = c("cva04j", "cva05j"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see ICVA02B", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("cva04m", "cva05m"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cva07"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see ICVA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cva09"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JDIABE01", `-1` = "na, asked",
  .applies_to_vars = c("diabe02"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JDIABE01", `-1` = "na, asked", `1` = "none", `2` = "insulin injections", `3` = "tablets",
  .applies_to_vars = c("diabe03a"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("diabe04"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see IDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe05"),
  .applies_to_waves = c("I")
)

value_labels(
  `-6` = "na, see I/JARTVEI1", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see I/JDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe07"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JDIABE07", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe09"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-6` = "na, see IHART01",
  .applies_to_vars = c("diabe11"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JDIABE11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe12"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IDIABE05", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("diabe6a", "diabe6b", "diabe6c"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IHART05", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("hart06"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IHART06",
  .applies_to_vars = c("hart07j", "hart07m"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IHART06", `-1` = "na, asked",
  .applies_to_vars = c("hart08j", "hart09j"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IHART06", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("hart08m", "hart09m"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JHART10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart11"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see IHART01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart13"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hbd1a"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JHBD1 & I/JHBD1A1", `-1` = "na, asked",
  .applies_to_vars = c("hbd2"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("hbd3"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "2 times a month or less", `2` = "3-4 times a month", `3` = "a few times a week", `4` = "daily",
  .applies_to_vars = c("incon10", "incon9"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JOTHSI01", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "Parkinson", `25` = "mental problems, incl. depression", `26` = "other to be coded",
  .applies_to_vars = c("othsi02"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JOTHSI01", `-1` = "na, asked",
  .applies_to_vars = c("othsi04"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see IOTHSI01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("othsi05"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JOTHSI01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("othsi06"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JOTHSI01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("othsi07"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JOTHSI07", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "Parkinson", `25` = "mental problems, incl. depression", `26` = "other to be coded",
  .applies_to_vars = c("othsi08"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JOTHSI07", `-1` = "na, asked",
  .applies_to_vars = c("othsi10"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JOTHSI07", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("othsi12"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see I/JRHEUM10A", `-1` = "na, asked", `1` = "right hip", `2` = "left hip", `3` = "both hips", `4` = "right knee", `5` = "left knee", `6` = "both knees", `7` = "right hand fingers", `8` = "left hand fingers", `9` = "both hands fingers", `10` = "right hand/wrist", `11` = "left hand/wrist", `12` = "both hands/wrists", `13` = "toes right foot", `14` = "toes left foot", `15` = "toes both feet", `16` = "right foot/ankle", `17` = "left foot/ankle", `18` = "both feet/ankles", `19` = "neck", `20` = "back", `21` = "right shoulder", `22` = "left shoulder", `23` = "other",
  .applies_to_vars = c("rh10_1j"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see I/JRHEUM10A", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_1r"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A", `-1` = "na, asked", `1` = "right", `2` = "left", `3` = "right and left",
  .applies_to_vars = c("rh10_1s"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A", `-1` = "na, asked",
  .applies_to_vars = c("rh10_1y1"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRH10_1S", `-1` = "na, asked",
  .applies_to_vars = c("rh10_1y2"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see IRHEUM10A2", `-1` = "na, asked", `1` = "right hip", `2` = "left hip", `3` = "both hips", `4` = "right knee", `5` = "left knee", `6` = "both knees", `7` = "right hand fingers", `8` = "left hand fingers", `9` = "both hands fingers", `10` = "right hand/wrist", `11` = "left hand/wrist", `12` = "both hands/wrists", `13` = "toes right foot", `14` = "toes left foot", `15` = "toes both feet", `16` = "right foot/ankle", `17` = "left foot/ankle", `18` = "both feet/ankles", `19` = "neck", `20` = "back", `21` = "right shoulder", `22` = "left shoulder", `23` = "other",
  .applies_to_vars = c("rh10_2j"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see I/JRHEUM10A2", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_2r"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A2", `-1` = "na, asked", `1` = "right", `2` = "left", `3` = "right and left",
  .applies_to_vars = c("rh10_2s"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A2", `-1` = "na, asked",
  .applies_to_vars = c("rh10_2y1"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRH10_2S", `-1` = "na, asked",
  .applies_to_vars = c("rh10_2y2"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see IRHEUM10A3", `-1` = "na, asked", `1` = "right hip", `2` = "left hip", `3` = "both hips", `4` = "right knee", `5` = "left knee", `6` = "both knees", `7` = "right hand fingers", `8` = "left hand fingers", `9` = "both hands fingers", `10` = "right hand/wrist", `11` = "left hand/wrist", `12` = "both hands/wrists", `13` = "toes right foot", `14` = "toes left foot", `15` = "toes both feet", `16` = "right foot/ankle", `17` = "left foot/ankle", `18` = "both feet/ankles", `19` = "neck", `20` = "back", `21` = "right shoulder", `22` = "left shoulder", `23` = "other",
  .applies_to_vars = c("rh10_3j"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see I/JRHEUM10A3", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_3r"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A3", `-1` = "na, asked", `1` = "right", `2` = "left", `3` = "right and left",
  .applies_to_vars = c("rh10_3s"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A3", `-1` = "na, asked",
  .applies_to_vars = c("rh10_3y1"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRH10_3S", `-1` = "na, asked",
  .applies_to_vars = c("rh10_3y2"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum09"),
  .applies_to_waves = c("I", "J", "K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum10a"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A2", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum10a2", "rheum10a3"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see JCANCER1 & JCANCE1X",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance7a", "cance7b", "cance7c", "cance7d", "cancer4", "cancer5", "cancer6"),
  .applies_to_waves = c("J")
)

value_labels(
  `-8` = "na, technical error", `-3` = "na, wrong skip", `-2` = "na, see JCANCER1", `-1` = "na, asked", `1` = "benign", `2` = "maligh", `3` = "unknown",
  .applies_to_vars = c("cance1x"),
  .applies_to_waves = c("J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance5a", "cance5b", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-7` = "tumor, uterus not asked, male", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance5c", "cance5d"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JCARA01", `-1` = "na, asked / R does not know",
  .applies_to_vars = c("cara02"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, not any chronic disease", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("choutd"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JCVA02A", `-1` = "na, asked",
  .applies_to_vars = c("cva03j"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JCVA02A", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("cva03m"),
  .applies_to_waves = c("J")
)

value_labels(
  `-6` = "na, see IHART10", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see I/JDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("diabe11"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JHART05", `-1` = "na, asked",
  .applies_to_vars = c("hart07j"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JHART05", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("hart07m"),
  .applies_to_waves = c("J")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see JHART01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart14"),
  .applies_to_waves = c("J")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know",
  .applies_to_vars = c("hbd1"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see I/JRHEUM10A", `-1` = "na, asked", `1` = "hip", `2` = "knee", `3` = "fingers", `4` = "hand/wrist", `5` = "toes", `6` = "foot/ankle", `7` = "neck", `8` = "back", `9` = "shoulder", `10` = "other",
  .applies_to_vars = c("rh10_1j"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, wrong skip na, see I/JRHEUM10A", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_1r"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see JRHEUM10A2", `-1` = "na, asked", `1` = "hip", `2` = "knee", `3` = "fingers", `4` = "hand/wrist", `5` = "toes", `6` = "foot/ankle", `7` = "neck", `8` = "back", `9` = "shoulder", `10` = "other",
  .applies_to_vars = c("rh10_2j"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, wrong skip na, see I/JRHEUM10A2", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_2r"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see JRHEUM10A3", `-1` = "na, asked", `1` = "hip", `2` = "knee", `3` = "fingers", `4` = "hand/wrist", `5` = "toes", `6` = "foot/ankle", `7` = "neck", `8` = "back", `9` = "shoulder", `10` = "other",
  .applies_to_vars = c("rh10_3j"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A3", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_3r"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "no, previous interview yes", `2` = "yes, previous interview no", `3` = "yes, previous interview yes",
  .applies_to_vars = c("rheum02"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-2` = "na, see KCANCER1 & KCANCE1X",
  .applies_to_vars = c("cance5a", "cance5b", "cance5c", "cance5d", "cance5e", "cance5f", "cance5g", "cance5h", "cance5i", "cance5j", "cance5k", "cance5l", "cance7a", "cance7b", "cance7c", "cance7d", "cancer4", "cancer5", "cancer6"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KCHOUTD",
  .applies_to_vars = c("choutd01", "choutd02", "choutd03", "choutd04", "choutd05", "choutd06", "choutd07", "choutd08", "choutd09", "choutd10", "choutd11", "choutd12"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KRHEUM01&02",
  .applies_to_vars = c("rheum04", "rheum05", "rheum06", "rheum07", "rheum08", "rheum09", "rheum12", "rheum8a", "rheum8b", "rheum8c", "rheum8d", "rheum8e", "rheum8f", "rheum8g", "rheum8h", "rheum8i", "rheum8j"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KRHEUM09",
  .applies_to_vars = c("rheum9a", "rheum9b", "rheum9c", "rheum9d", "rheum9e", "rheum9f", "rheum9g", "rheum9h", "rheum9i", "rheum9j"),
  .applies_to_waves = c("K")
)

value_labels(
  `-5` = "na, see KRMCH",
  .applies_to_vars = c("artvei1", "cancer1", "cara01", "chol1", "chol2", "choutd", "corona1", "cva01", "diabe01", "hart01", "hbd1", "hbd1a", "incon10", "incon9", "kneep1", "othsi01", "rheum01", "rheum01a", "rheum02", "vaccin"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KARTVEI8", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("artve8a", "artve8b", "artve8c", "artve8d", "artve8e"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no, disease still exists", `2` = "yes, disease not present anymore", `3` = "R has complaints, but doctor says no disease", `4` = "R says he/she never had the disease", `5` = "interviewer error",
  .applies_to_vars = c("artvei1b"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KKARTVEI1B", `-1` = "na, asked / R does not know",
  .applies_to_vars = c("artvei1c"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KARTVE1B", `1` = "no trouble anymore, complaints disappeared by itself", `2` = "no trouble anymore, disease is under control", `3` = "no trouble anymore, complaints disappeared after surgery", `4` = "according to the doctor, the disease is no longer present", `5` = "previous measurement is wrong", `6` = "other reason mentioned", `7` = "R does not know",
  .applies_to_vars = c("artvei1d"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("artvei4"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei5", "artvei8"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KARTVEI5", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("artvei7"),
  .applies_to_waves = c("K")
)

value_labels(
  `-8` = "na, technical error", `-3` = "na, wrong skip", `-2` = "na, see KCANCER1", `-1` = "na, asked", `1` = "benign", `2` = "maligh", `3` = "unknown",
  .applies_to_vars = c("cance1x"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCANCER5", `-1` = "na, asked", `1` = "benign", `2` = "maligh", `3` = "unknown",
  .applies_to_vars = c("cance5x"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCANCER6", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("cance6a", "cance6b", "cance6c", "cance6d", "cance6e", "cance6f"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCARA01", `-1` = "na, asked / R does not know",
  .applies_to_vars = c("cara02"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCARA01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cara04"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KCARA01", `-1` = "na, asked", `1` = "no", `2` = "yes, with heavy exertion", `3` = "yes, with light exertion", `4` = "yes, at rest",
  .applies_to_vars = c("cara08"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KCARA01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("cara11"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KRMCH", `1` = "long interview", `2` = "short interview",
  .applies_to_vars = c("chmodus"),
  .applies_to_waves = c("K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "R does not know",
  .applies_to_vars = c("chol1", "chol2"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCORONA1 & KCORONA2", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("corona1_lc1", "corona1_lc2", "corona1_lc3", "corona1_lc4"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCORONA1", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("corona1_m"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCORONA1", `-1` = "na, asked",
  .applies_to_vars = c("corona1_y"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCORONA1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("corona2"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCORONA2", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("corona2_lc1", "corona2_lc2", "corona2_lc3", "corona2_lc4"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCORONA2", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("corona2_m"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCORONA2", `-1` = "na, asked",
  .applies_to_vars = c("corona2_y"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("cva02a"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCVA02A", `-1` = "na, asked",
  .applies_to_vars = c("cva03j"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCVA02A", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("cva03m"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("cva07"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KDIABE01", `-1` = "na, asked",
  .applies_to_vars = c("diabe02"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KDIABE01", `1` = "no medication use", `2` = "medication use",
  .applies_to_vars = c("diabe03"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KDIABE03", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("diabe03a", "diabe03b", "diabe03c"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("diabe04"),
  .applies_to_waves = c("K")
)

value_labels(
  `-6` = "na, see KARTVEI5", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe07"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KDIABE07", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe09"),
  .applies_to_waves = c("K")
)

value_labels(
  `-6` = "na, see KHART10", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("diabe11"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KDIABE11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("diabe12"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KHART01", `-1` = "na, asked",
  .applies_to_vars = c("hart02"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KHART01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("hart04"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KHART01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart05", "hart12", "hart15"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KHART01", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("hart10"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KHART10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hart11"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KHART01", `-1` = "na, asked", `1` = "no, do not have compression stockings", `2` = "no, because of use compression stockings", `3` = "yes",
  .applies_to_vars = c("hart14"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KHART15", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("hart15a", "hart15b", "hart15c", "hart15d", "hart15e"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("hbd1a"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KHBD1 & KHBD1A1", `-1` = "na, asked",
  .applies_to_vars = c("hbd2"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KHBD1 & KHBD1A", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("hbd3"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KKNEEP1", `-1` = "na, asked", `0` = "no pain", `10` = "worst conceivable pain",
  .applies_to_vars = c("kneep2", "kneep3", "kneep4"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KKNEEP1", `-1` = "na, asked", `1` = "0-6 days", `2` = "7-14 days", `3` = "15-30 days", `4` = "31 days or more",
  .applies_to_vars = c("kneep5"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KKNEEP1", `-1` = "na, asked", `0` = "not impeded", `10` = "unable to continue activities",
  .applies_to_vars = c("kneep6"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KKNEEP1", `-1` = "na, asked", `0` = "no change", `10` = "extreme change",
  .applies_to_vars = c("kneep7", "kneep8"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KKNEEP1", `-1` = "na, asked", `1` = "not a single day", `2` = "1-30 days", `3` = "31-89 days", `4` = "90 days or more",
  .applies_to_vars = c("kneep9"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KOTHSI01", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "Parkinson", `25` = "mental problems, incl. depression", `26` = "hearing impairment", `27` = "gout", `28` = "eye complaints/diseases", `29` = "Sleep Apnea (OSAS)", `30` = "TIA (the past 3 years)", `31` = "other to be coded",
  .applies_to_vars = c("othsi02"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KOTHSI01", `-1` = "na, asked",
  .applies_to_vars = c("othsi04"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KOTHSI01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("othsi06"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KOTHSI01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("othsi07"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KOTHSI07", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "Parkinson", `25` = "mental problems, incl. depression", `26` = "hearing impairment", `27` = "gout", `28` = "eye complaints/diseases", `29` = "Sleep Apnea (OSAS)", `30` = "TIA (the past 3 years)", `31` = "other to be coded",
  .applies_to_vars = c("othsi08"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KOTHSI07", `-1` = "na, asked",
  .applies_to_vars = c("othsi10"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KOTHSI07", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("othsi12"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see KRHEUM10A", `-1` = "na, asked", `1` = "hip", `2` = "knee", `3` = "fingers", `4` = "hand/wrist", `5` = "toes", `6` = "foot/ankle", `7` = "neck", `8` = "back", `9` = "shoulder", `10` = "other",
  .applies_to_vars = c("rh10_1j"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, wrong skip, na, see KRHEUM10A", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_1r"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRHEUM10A", `-1` = "na, asked", `1` = "right", `2` = "left", `3` = "right and left",
  .applies_to_vars = c("rh10_1s"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRHEUM10A", `-1` = "na, asked", `1` = "year",
  .applies_to_vars = c("rh10_1y1"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRH10_1S", `-1` = "na, asked", `2` = "year",
  .applies_to_vars = c("rh10_1y2"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see KRHEUM10A2", `-1` = "na, asked", `1` = "hip", `2` = "knee", `3` = "fingers", `4` = "hand/wrist", `5` = "toes", `6` = "foot/ankle", `7` = "neck", `8` = "back", `9` = "shoulder", `10` = "other",
  .applies_to_vars = c("rh10_2j"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRHEUM10A2", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_2r"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRHEUM10A2", `-1` = "na, asked", `1` = "right", `2` = "left", `3` = "right and left",
  .applies_to_vars = c("rh10_2s"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRHEUM10A2", `-1` = "na, asked", `1` = "year",
  .applies_to_vars = c("rh10_2y1"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRH10_2S", `-1` = "na, asked", `2` = "year",
  .applies_to_vars = c("rh10_2y2"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KRHEUM10A3", `-1` = "na, asked", `1` = "osteoarthritis/wear and tear/loss of cartilage", `2` = "rheumatoid arthritis", `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)", `4` = "fracture (due to accident)", `5` = "pain", `6` = "other (unable to stand or walk/immobility/etc)",
  .applies_to_vars = c("rh10_3r"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRHEUM10A3", `-1` = "na, asked", `1` = "right", `2` = "left", `3` = "right and left",
  .applies_to_vars = c("rh10_3s"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRHEUM10A3", `-1` = "na, asked", `1` = "year",
  .applies_to_vars = c("rh10_3y1"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KRH10_3S", `-1` = "na, asked", `2` = "year",
  .applies_to_vars = c("rh10_3y2"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KRHEUM01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum10a"),
  .applies_to_waves = c("K")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see KRHEUM10A2", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("rheum10a2", "rheum10a3"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KVACCIN", `-1` = "na, asked", `1` = "January", `2` = "February", `3` = "March", `4` = "April", `5` = "May", `6` = "June", `7` = "July", `8` = "August", `9` = "September", `10` = "October", `11` = "November", `12` = "December",
  .applies_to_vars = c("vaccin_m"),
  .applies_to_waves = c("K")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see KVACCIN", `-1` = "na, asked",
  .applies_to_vars = c("vaccin_y"),
  .applies_to_waves = c("K")
)

.lasa_fc_035 <- .lasa_finalize_fc("035")
.lasa_fc_035$variables <- .lasa_fc_035$variables |>
  .override_label(wave = "2B", variable = "diabe6b", override_value = "bbdiabe6b") |>
  .override_label(wave = "3B", variable = "chmodus", override_value = "brchmodus") |>
  .override_label(wave = "MB", variable = "diabe01", override_value = "bdaiabe01") |>
  .override_label(wave = "MB", variable = "rmch", override_value = "bcancer1")

