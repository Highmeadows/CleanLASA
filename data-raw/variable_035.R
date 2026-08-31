## LASA filecode 035 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  htraumj = NA_character_,
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
  trauy = NA_character_,
  vaccin = "R vaccinated against corona",
  vaccin_m = "R vaccinated against corona: month first vaccination",
  vaccin_y = "R vaccinated against corona: year first vaccination"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei2",
    "artvei3",
    "artvei4",
    "artvei5",
    "artvei6",
    "artvei7",
    "artvei8",
    "artvei9",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer2",
    "cancer3",
    "cancer4",
    "cancer6",
    "cancer8",
    "cara01",
    "cara02",
    "cara03",
    "cara04",
    "cara05",
    "cara06",
    "cara07",
    "cara08",
    "cara09",
    "cara10",
    "cara11",
    "cara12",
    "cva01",
    "cva02",
    "cva03",
    "cva04",
    "cva05",
    "cva06",
    "cva07",
    "cva08",
    "cva09",
    "cva10",
    "cva11",
    "cva12",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe04",
    "diabe05",
    "diabe06",
    "diabe07",
    "diabe08",
    "diabe09",
    "diabe10",
    "diabe11",
    "diabe12",
    "diabe13",
    "hart01",
    "hart02",
    "hart03",
    "hart04",
    "hart05",
    "hart06",
    "hart07",
    "hart08",
    "hart09",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hart16",
    "incon1",
    "incon2",
    "incon3",
    "incon4",
    "incon5",
    "incon6",
    "incon7",
    "incon8",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi11",
    "othsi12",
    "rheum01",
    "rheum02",
    "rheum03",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10",
    "rheum11",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rmch"
  ),
  `C` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei2",
    "artvei3",
    "artvei4",
    "artvei5",
    "artvei6",
    "artvei7",
    "artvei8",
    "artvei9",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5m",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance6g",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer2",
    "cancer3",
    "cancer4",
    "cancer5",
    "cancer6",
    "cancer8",
    "cara01",
    "cara02",
    "cara03",
    "cara04",
    "cara05",
    "cara06",
    "cara07",
    "cara08",
    "cara09",
    "cara10",
    "cara11",
    "cara12",
    "cva01",
    "cva02a",
    "cva02b",
    "cva03j",
    "cva03m",
    "cva04j",
    "cva04m",
    "cva05j",
    "cva05m",
    "cva06",
    "cva07",
    "cva08",
    "cva09",
    "cva10",
    "cva11",
    "cva12",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe04",
    "diabe05",
    "diabe07",
    "diabe08",
    "diabe09",
    "diabe10",
    "diabe11",
    "diabe12",
    "diabe13",
    "diabe6a",
    "diabe6b",
    "diabe6c",
    "hart01",
    "hart02",
    "hart03",
    "hart04",
    "hart05",
    "hart06",
    "hart07j",
    "hart07m",
    "hart08j",
    "hart08m",
    "hart09j",
    "hart09m",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hart16",
    "hbd1",
    "hbd2",
    "hbd2a",
    "hbd3",
    "incon1",
    "incon2",
    "incon3",
    "incon4",
    "incon5",
    "incon6",
    "incon7",
    "incon8",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi11",
    "othsi12",
    "rheum01",
    "rheum02",
    "rheum03",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10",
    "rheum11",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rmch"
  ),
  `D` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei2",
    "artvei3",
    "artvei4",
    "artvei5",
    "artvei6",
    "artvei7",
    "artvei8",
    "artvei9",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5m",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance6g",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer2",
    "cancer3",
    "cancer4",
    "cancer5",
    "cancer6",
    "cancer8",
    "cara01",
    "cara02",
    "cara03",
    "cara04",
    "cara05",
    "cara06",
    "cara07",
    "cara08",
    "cara09",
    "cara10",
    "cara11",
    "cara12",
    "chmodus",
    "cva01",
    "cva02a",
    "cva02b",
    "cva02c",
    "cva03a",
    "cva03j",
    "cva03m",
    "cva04a",
    "cva04j",
    "cva04m",
    "cva05a",
    "cva05j",
    "cva05m",
    "cva06",
    "cva07",
    "cva08",
    "cva09",
    "cva10",
    "cva11",
    "cva12",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe04",
    "diabe05",
    "diabe07",
    "diabe08",
    "diabe09",
    "diabe10",
    "diabe11",
    "diabe12",
    "diabe13",
    "diabe6a",
    "diabe6b",
    "diabe6c",
    "hart01",
    "hart02",
    "hart03",
    "hart04",
    "hart05",
    "hart06",
    "hart07j",
    "hart07m",
    "hart08j",
    "hart08m",
    "hart09j",
    "hart09m",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hart16",
    "hbd1",
    "hbd2",
    "hbd2a",
    "hbd3",
    "incon1",
    "incon2",
    "incon3",
    "incon4",
    "incon5",
    "incon6",
    "incon7",
    "incon8",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi11",
    "othsi12",
    "rheum01",
    "rheum02",
    "rheum03",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10",
    "rheum11",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rmch"
  ),
  `E` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei2",
    "artvei3",
    "artvei4",
    "artvei5",
    "artvei6",
    "artvei7",
    "artvei8",
    "artvei9",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5m",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance6g",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer2",
    "cancer3",
    "cancer4",
    "cancer5",
    "cancer6",
    "cancer8",
    "cara01",
    "cara02",
    "cara03",
    "cara04",
    "cara05",
    "cara06",
    "cara07",
    "cara08",
    "cara09",
    "cara10",
    "cara11",
    "cara12",
    "chmodus",
    "cva01",
    "cva02a",
    "cva02b",
    "cva02c",
    "cva03a",
    "cva03j",
    "cva03m",
    "cva04a",
    "cva04j",
    "cva04m",
    "cva05a",
    "cva05j",
    "cva05m",
    "cva06",
    "cva07",
    "cva08",
    "cva09",
    "cva10",
    "cva11",
    "cva12",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe04",
    "diabe05",
    "diabe07",
    "diabe08",
    "diabe09",
    "diabe10",
    "diabe11",
    "diabe12",
    "diabe13",
    "diabe6a",
    "diabe6b",
    "diabe6c",
    "hart01",
    "hart02",
    "hart03",
    "hart04",
    "hart05",
    "hart06",
    "hart07j",
    "hart07m",
    "hart08j",
    "hart08m",
    "hart09j",
    "hart09m",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hart16",
    "hbd1",
    "hbd2",
    "hbd2a",
    "hbd3",
    "incon1",
    "incon2",
    "incon3",
    "incon4",
    "incon5",
    "incon6",
    "incon7",
    "incon8",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi11",
    "othsi12",
    "rheum01",
    "rheum02",
    "rheum03",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10",
    "rheum11",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rmch"
  ),
  `2B` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei2",
    "artvei3",
    "artvei4",
    "artvei5",
    "artvei6",
    "artvei7",
    "artvei8",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5m",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance6g",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer2",
    "cancer3",
    "cancer4",
    "cancer5",
    "cancer6",
    "cara01",
    "cara02",
    "cara03",
    "cara04",
    "cara05",
    "cara06",
    "cara07",
    "cara08",
    "cara09",
    "cara10",
    "cara11",
    "cva01",
    "cva02b",
    "cva03j",
    "cva03m",
    "cva04j",
    "cva04m",
    "cva05j",
    "cva05m",
    "cva06",
    "cva07",
    "cva08",
    "cva09",
    "cva10",
    "cva11",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe04",
    "diabe05",
    "diabe07",
    "diabe08",
    "diabe09",
    "diabe10",
    "diabe11",
    "diabe12",
    "diabe6a",
    "diabe6b",
    "diabe6c",
    "hart01",
    "hart02",
    "hart03",
    "hart04",
    "hart05",
    "hart06",
    "hart07j",
    "hart07m",
    "hart08j",
    "hart08m",
    "hart09j",
    "hart09m",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hbd1",
    "hbd2",
    "hbd2a",
    "hbd3",
    "incon1",
    "incon2",
    "incon3",
    "incon4",
    "incon5",
    "incon6",
    "incon7",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi12",
    "rheum01",
    "rheum02",
    "rheum03",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rmch"
  ),
  `F` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei2",
    "artvei3",
    "artvei4",
    "artvei5",
    "artvei6",
    "artvei7",
    "artvei8",
    "artvei9",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5m",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance6g",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer2",
    "cancer3",
    "cancer4",
    "cancer5",
    "cancer6",
    "cancer8",
    "cara01",
    "cara02",
    "cara03",
    "cara04",
    "cara05",
    "cara06",
    "cara07",
    "cara08",
    "cara09",
    "cara10",
    "cara11",
    "cara12",
    "chmodus",
    "cva01",
    "cva02a",
    "cva02b",
    "cva02c",
    "cva03a",
    "cva03j",
    "cva03m",
    "cva04a",
    "cva04j",
    "cva04m",
    "cva05a",
    "cva05j",
    "cva05m",
    "cva06",
    "cva07",
    "cva08",
    "cva09",
    "cva10",
    "cva11",
    "cva12",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe04",
    "diabe05",
    "diabe07",
    "diabe08",
    "diabe09",
    "diabe10",
    "diabe11",
    "diabe12",
    "diabe13",
    "diabe6a",
    "diabe6b",
    "diabe6c",
    "hart01",
    "hart02",
    "hart03",
    "hart04",
    "hart05",
    "hart06",
    "hart07j",
    "hart07m",
    "hart08j",
    "hart08m",
    "hart09j",
    "hart09m",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hart16",
    "hbd1",
    "hbd2",
    "hbd2a",
    "hbd3",
    "incon1",
    "incon2",
    "incon3",
    "incon4",
    "incon5",
    "incon6",
    "incon7",
    "incon8",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi11",
    "othsi12",
    "rheum01",
    "rheum02",
    "rheum03",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10",
    "rheum11",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum8j",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rheum9j",
    "rmch"
  ),
  `G` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei2",
    "artvei3",
    "artvei4",
    "artvei5",
    "artvei6",
    "artvei7",
    "artvei8",
    "artvei9",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5m",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance6g",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer2",
    "cancer3",
    "cancer4",
    "cancer5",
    "cancer6",
    "cancer8",
    "cara01",
    "cara02",
    "cara03",
    "cara04",
    "cara05",
    "cara06",
    "cara07",
    "cara08",
    "cara09",
    "cara10",
    "cara11",
    "cara12",
    "chmodus",
    "cva01",
    "cva02a",
    "cva02b",
    "cva02c",
    "cva03a",
    "cva03j",
    "cva03m",
    "cva04a",
    "cva04j",
    "cva04m",
    "cva05a",
    "cva05j",
    "cva05m",
    "cva06",
    "cva07",
    "cva08",
    "cva09",
    "cva10",
    "cva11",
    "cva12",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe04",
    "diabe05",
    "diabe07",
    "diabe08",
    "diabe09",
    "diabe10",
    "diabe11",
    "diabe12",
    "diabe13",
    "diabe6a",
    "diabe6b",
    "diabe6c",
    "hart01",
    "hart02",
    "hart03",
    "hart04",
    "hart05",
    "hart06",
    "hart07j",
    "hart07m",
    "hart08j",
    "hart08m",
    "hart09j",
    "hart09m",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hart16",
    "hbd1",
    "hbd2",
    "hbd2a",
    "hbd3",
    "incon1",
    "incon2",
    "incon3",
    "incon4",
    "incon5",
    "incon6",
    "incon7",
    "incon8",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi11",
    "othsi12",
    "rheum01",
    "rheum02",
    "rheum03",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10",
    "rheum11",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum8j",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rheum9j",
    "rmch"
  ),
  `H` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei2",
    "artvei3",
    "artvei4",
    "artvei5",
    "artvei6",
    "artvei7",
    "artvei8",
    "artvei9",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5m",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance6g",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer2",
    "cancer3",
    "cancer4",
    "cancer5",
    "cancer6",
    "cancer8",
    "cara01",
    "cara02",
    "cara03",
    "cara04",
    "cara05",
    "cara06",
    "cara07",
    "cara08",
    "cara09",
    "cara10",
    "cara11",
    "cara12",
    "chmodus",
    "cva01",
    "cva02a",
    "cva02b",
    "cva03j",
    "cva03m",
    "cva04j",
    "cva04m",
    "cva05j",
    "cva05m",
    "cva06",
    "cva07",
    "cva08",
    "cva09",
    "cva10",
    "cva11",
    "cva12",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe04",
    "diabe05",
    "diabe07",
    "diabe08",
    "diabe09",
    "diabe10",
    "diabe11",
    "diabe12",
    "diabe13",
    "diabe6a",
    "diabe6b",
    "diabe6c",
    "hart01",
    "hart02",
    "hart03",
    "hart04",
    "hart05",
    "hart06",
    "hart07j",
    "hart07m",
    "hart08j",
    "hart08m",
    "hart09j",
    "hart09m",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hart16",
    "hbd1",
    "hbd2",
    "hbd2a",
    "hbd3",
    "incon1",
    "incon2",
    "incon3",
    "incon4",
    "incon5",
    "incon6",
    "incon7",
    "incon8",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi11",
    "othsi12",
    "rheum01",
    "rheum02",
    "rheum03",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10",
    "rheum11",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum8j",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rheum9j",
    "rmch"
  ),
  `3B` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei2",
    "artvei3",
    "artvei4",
    "artvei5",
    "artvei6",
    "artvei7",
    "artvei8",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5m",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance6g",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer2",
    "cancer3",
    "cancer4",
    "cancer6",
    "cara01",
    "cara02",
    "cara03",
    "cara04",
    "cara05",
    "cara06",
    "cara07",
    "cara08",
    "cara09",
    "cara10",
    "cara11",
    "chmodus",
    "cva01",
    "cva02b",
    "cva03j",
    "cva03m",
    "cva04j",
    "cva04m",
    "cva05j",
    "cva05m",
    "cva06",
    "cva07",
    "cva08",
    "cva09",
    "cva10",
    "cva11",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe04",
    "diabe05",
    "diabe06",
    "diabe07",
    "diabe08",
    "diabe09",
    "diabe10",
    "diabe11",
    "diabe12",
    "hart01",
    "hart02",
    "hart03",
    "hart04",
    "hart05",
    "hart06",
    "hart07j",
    "hart07m",
    "hart08j",
    "hart08m",
    "hart09j",
    "hart09m",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hbd1",
    "hbd2",
    "hbd2a",
    "hbd3",
    "incon1",
    "incon2",
    "incon3",
    "incon4",
    "incon5",
    "incon6",
    "incon7",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi12",
    "rheum01",
    "rheum02",
    "rheum03",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum8j",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rheum9j",
    "rmch"
  ),
  `MB` = c(
    "artvei1",
    "cara01",
    "cva01",
    "diabe01",
    "hart01",
    "rheum01",
    "rheum02",
    "rmch"
  ),
  `I` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei4",
    "artvei5",
    "artvei7",
    "artvei8",
    "artvei9",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5m",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance6g",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer4",
    "cancer5",
    "cancer6",
    "cara01",
    "cara02",
    "cara04",
    "cara08",
    "cara11",
    "chmodus",
    "choutd",
    "choutd01",
    "choutd02",
    "choutd03",
    "choutd04",
    "choutd05",
    "choutd06",
    "choutd07",
    "choutd08",
    "choutd09",
    "choutd10",
    "choutd11",
    "choutd12",
    "cva01",
    "cva02a",
    "cva02b",
    "cva03j",
    "cva03m",
    "cva04j",
    "cva04m",
    "cva05j",
    "cva05m",
    "cva07",
    "cva09",
    "diabe01",
    "diabe02",
    "diabe03a",
    "diabe04",
    "diabe05",
    "diabe07",
    "diabe09",
    "diabe11",
    "diabe12",
    "diabe6a",
    "diabe6b",
    "diabe6c",
    "hart01",
    "hart04",
    "hart05",
    "hart06",
    "hart07j",
    "hart07m",
    "hart08j",
    "hart08m",
    "hart09j",
    "hart09m",
    "hart10",
    "hart11",
    "hart12",
    "hart13",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hbd1",
    "hbd1a",
    "hbd2",
    "hbd3",
    "incon10",
    "incon9",
    "kneep1",
    "kneep2",
    "kneep3",
    "kneep4",
    "kneep5",
    "kneep6",
    "kneep7",
    "kneep8",
    "kneep9",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi05",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi12",
    "rh10_1j",
    "rh10_1r",
    "rh10_1s",
    "rh10_1y1",
    "rh10_1y2",
    "rh10_2j",
    "rh10_2r",
    "rh10_2s",
    "rh10_2y1",
    "rh10_2y2",
    "rh10_3j",
    "rh10_3r",
    "rh10_3s",
    "rh10_3y1",
    "rh10_3y2",
    "rheum01",
    "rheum02",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10a",
    "rheum10a2",
    "rheum10a3",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum8j",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rheum9j",
    "rmch",
    "trauy"
  ),
  `J` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei4",
    "artvei5",
    "artvei7",
    "artvei8",
    "cance1x",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer4",
    "cancer5",
    "cancer6",
    "cara01",
    "cara02",
    "cara04",
    "cara08",
    "cara11",
    "chmodus",
    "choutd",
    "choutd01",
    "choutd02",
    "choutd03",
    "choutd04",
    "choutd05",
    "choutd06",
    "choutd07",
    "choutd08",
    "choutd09",
    "choutd10",
    "choutd11",
    "choutd12",
    "cva01",
    "cva02a",
    "cva03j",
    "cva03m",
    "cva07",
    "diabe01",
    "diabe02",
    "diabe03a",
    "diabe04",
    "diabe07",
    "diabe09",
    "diabe11",
    "diabe12",
    "hart01",
    "hart04",
    "hart05",
    "hart07j",
    "hart07m",
    "hart10",
    "hart11",
    "hart12",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hbd1",
    "hbd1a",
    "hbd2",
    "hbd3",
    "incon10",
    "incon9",
    "kneep1",
    "kneep2",
    "kneep3",
    "kneep4",
    "kneep5",
    "kneep6",
    "kneep7",
    "kneep8",
    "kneep9",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi12",
    "rh10_1j",
    "rh10_1r",
    "rh10_1s",
    "rh10_1y1",
    "rh10_1y2",
    "rh10_2j",
    "rh10_2r",
    "rh10_2s",
    "rh10_2y1",
    "rh10_2y2",
    "rh10_3j",
    "rh10_3r",
    "rh10_3s",
    "rh10_3y1",
    "rh10_3y2",
    "rheum01",
    "rheum02",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10a",
    "rheum10a2",
    "rheum10a3",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum8j",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rheum9j",
    "rmch",
    "trauy"
  ),
  `K` = c(
    "artve8a",
    "artve8b",
    "artve8c",
    "artve8d",
    "artve8e",
    "artvei1",
    "artvei1b",
    "artvei1c",
    "artvei1d",
    "artvei4",
    "artvei5",
    "artvei7",
    "artvei8",
    "cance1x",
    "cance5a",
    "cance5b",
    "cance5c",
    "cance5d",
    "cance5e",
    "cance5f",
    "cance5g",
    "cance5h",
    "cance5i",
    "cance5j",
    "cance5k",
    "cance5l",
    "cance5x",
    "cance6a",
    "cance6b",
    "cance6c",
    "cance6d",
    "cance6e",
    "cance6f",
    "cance7a",
    "cance7b",
    "cance7c",
    "cance7d",
    "cancer1",
    "cancer4",
    "cancer5",
    "cancer6",
    "cara01",
    "cara02",
    "cara04",
    "cara08",
    "cara11",
    "chmodus",
    "chol1",
    "chol2",
    "choutd",
    "choutd01",
    "choutd02",
    "choutd03",
    "choutd04",
    "choutd05",
    "choutd06",
    "choutd07",
    "choutd08",
    "choutd09",
    "choutd10",
    "choutd11",
    "choutd12",
    "corona1",
    "corona1_lc1",
    "corona1_lc2",
    "corona1_lc3",
    "corona1_lc4",
    "corona1_m",
    "corona1_y",
    "corona2",
    "corona2_lc1",
    "corona2_lc2",
    "corona2_lc3",
    "corona2_lc4",
    "corona2_m",
    "corona2_y",
    "cva01",
    "cva02a",
    "cva03j",
    "cva03m",
    "cva07",
    "diabe01",
    "diabe02",
    "diabe03",
    "diabe03a",
    "diabe03b",
    "diabe03c",
    "diabe04",
    "diabe07",
    "diabe09",
    "diabe11",
    "diabe12",
    "hart01",
    "hart02",
    "hart04",
    "hart05",
    "hart10",
    "hart11",
    "hart12",
    "hart14",
    "hart15",
    "hart15a",
    "hart15b",
    "hart15c",
    "hart15d",
    "hart15e",
    "hbd1",
    "hbd1a",
    "hbd2",
    "hbd3",
    "htraumj",
    "incon10",
    "incon9",
    "kneep1",
    "kneep2",
    "kneep3",
    "kneep4",
    "kneep5",
    "kneep6",
    "kneep7",
    "kneep8",
    "kneep9",
    "othsi01",
    "othsi02",
    "othsi04",
    "othsi06",
    "othsi07",
    "othsi08",
    "othsi10",
    "othsi12",
    "rh10_1j",
    "rh10_1r",
    "rh10_1s",
    "rh10_1y1",
    "rh10_1y2",
    "rh10_2j",
    "rh10_2r",
    "rh10_2s",
    "rh10_2y1",
    "rh10_2y2",
    "rh10_3j",
    "rh10_3r",
    "rh10_3s",
    "rh10_3y1",
    "rh10_3y2",
    "rheum01",
    "rheum01a",
    "rheum02",
    "rheum04",
    "rheum05",
    "rheum06",
    "rheum07",
    "rheum08",
    "rheum09",
    "rheum10a",
    "rheum10a2",
    "rheum10a3",
    "rheum12",
    "rheum8a",
    "rheum8b",
    "rheum8c",
    "rheum8d",
    "rheum8e",
    "rheum8f",
    "rheum8g",
    "rheum8h",
    "rheum8i",
    "rheum8j",
    "rheum9a",
    "rheum9b",
    "rheum9c",
    "rheum9d",
    "rheum9e",
    "rheum9f",
    "rheum9g",
    "rheum9h",
    "rheum9i",
    "rheum9j",
    "rmch",
    "vaccin",
    "vaccin_m",
    "vaccin_y"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    artve8a = "Arteries: surgery bifurcation",
    artve8b = "Arteries: surgery femoral legs",
    artve8c = "Arteries: surgery femoral groin",
    artve8d = "Arteries: surgery dotter",
    artve8e = "Arteries: surgery other",
    artvei3 = "Arteries: take medicine",
    artvei8 = "Arteries: surgery",
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
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    cara03 = "CNSLD: take medicine",
    cara11 = "CNSLD: disturbed night-rest or sleeping",
    cara12 = "CNSLD: going outdoors less because of CNSLD",
    cva01 = "CVA: yes/no",
    cva06 = "CVA: take medicine",
    cva12 = "CVA: going outdoors less because of CVA",
    diabe01 = "Diabetes: yes/no",
    diabe03 = "Diabetes: take medicine",
    diabe07 = "Diabetes:",
    diabe11 = "Diabetes:",
    diabe13 = "Diabetes: going outdoors less because of diabetes",
    hart03 = "Heart: take medicine",
    hart05 = "Heart: myocardial infarction",
    hart06 = "Heart: myocardial inf no of times",
    hart15 = "Heart: cardiac surgery",
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
    rmch = "Reason missing chronic diseases"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    cance5c = "Cancer:",
    cance5f = "Cancer:",
    cance7b = "Cancer: chemotherapy, since last interview",
    cance7c = "Cancer: radiotherapy, since last interview",
    cance7d = "Cancer: alternative treatment, since last interview",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    diabe11 = "Diabetes:",
    hart05 = "Heart: myocardial infarction since last",
    hart15 = "Heart: cardiac surgery sin 3be last interview",
    hart15a = "Heart: valves/cardiac surgery since last",
    hart15b = "Heart: bypass/cardiac surgery since last int.",
    hart15c = "Heart: dotter/cardiac surgery since last int.",
    hart15e = "Heart: other/cardiac surgery since last int.",
    rheum06 = "Osteo/rheum art: pain in joints past 3 m",
    rheum09 = "Osteo/rheum art: surgery since last int",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    cance5c = "Cancer:",
    cance5f = "Cancer:",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    cance5c = "Cancer:",
    cance5f = "Cancer:",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    artvei8 = "Arteries: surgery",
    cance5c = "Cancer:",
    cance5d = "Cancer:",
    cance5f = "Cancer:",
    cance7a = "Cancer: surgery",
    cance7b = "Cancer: chemotherapy surgery",
    cance7c = "Cancer: radiotherapy surgery",
    cance7d = "Cancer: alternative treatment",
    cancer5 = "Cancer: tumor",
    cancer6 = "Cancer: metastases",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    cva02b = "CVA: number of strokes",
    diabe11 = "Diabetes: chest pain during exertion already asked/",
    hart05 = "Heart: myocardial infarction",
    hart06 = "Heart: no of myocardial infarctions",
    hart15 = "Heart: cardiac surgery",
    hart15a = "Heart: valves/cardiac surgery",
    hart15b = "Heart: bypass/cardiac surgery",
    hart15c = "Heart: dotter/cardiac surgery",
    hart15d = "Heart: pacemaker/cardiac surgery",
    hart15e = "Heart: other/cardiac surgery",
    incon7 = "Incontinence: surgery",
    rheum09 = "Osteo/rheum art: surgery",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    cance5c = "Cancer:",
    cance5f = "Cancer:",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    cance5c = "Cancer:",
    cance5f = "Cancer:",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    cance5c = "Cancer:",
    cance5f = "Cancer:",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    artvei8 = "Arteries: surgery",
    cance5c = "Cancer:",
    cance5d = "Cancer:",
    cance5f = "Cancer:",
    cance7a = "Cancer: surgery",
    cance7b = "Cancer: chemotherapy surgery",
    cance7c = "Cancer: radiotherapy surgery",
    cance7d = "Cancer: alternative treatment",
    cancer6 = "Cancer: metastases",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    cva02b = "CVA: number of strokes",
    diabe06 = "Diabetes: eye problems: type of treatment",
    diabe11 = "Diabetes: chest pain during exertion already asked/",
    hart05 = "Heart: myocardial infarction",
    hart06 = "Heart: no of myocardial infarctions",
    hart15 = "Heart: cardiac surgery",
    hart15a = "Heart: valves/cardiac surgery",
    hart15b = "Heart: bypass/cardiac surgery",
    hart15c = "Heart: dotter/cardiac surgery",
    hart15d = "Heart: pacemaker/cardiac surgery",
    hart15e = "Heart: other/cardiac surgery",
    incon7 = "Incontinence: surgery",
    rheum09 = "Osteo/rheum art: surgery",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    cance5c = "Cancer:",
    cance5f = "Cancer:",
    cance7b = "Cancer: chemotherapy, since last interview",
    cance7c = "Cancer: radiotherapy, since last interview",
    cance7d = "Cancer: alternative treatment, since last interview",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    diabe6a = "Diabetes eye problems: laser treatment",
    diabe6b = "Diabetes eye problems: cataract operation",
    diabe6c = "Diabetes eye problems: other treatment",
    hart07m = "Heart: one infarction",
    hart11 = "Heart: exertion pain disappears in 10 min",
    hart15 = "Heart: cardiac surgery since last interview",
    hart15d = "Heart: pacemaker/cardiac surgery since interview",
    hart15e = "Heart: other/cardiac surgery since last interview",
    kneep1 = "Knee pain past 6 months",
    kneep3 = "Knee pain: worst pain past 6 months",
    kneep4 = "Knee pain: average pain past 6 months",
    kneep9 = "Knee pain: number of days pain past 6 months",
    rheum09 = "Osteo/rheum art: surgery since last interview",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    cance5c = "Cancer:",
    cance5f = "Cancer:",
    cance7b = "Cancer: chemotherapy, since last interview",
    cance7c = "Cancer: radiotherapy, since last interview",
    cance7d = "Cancer: alternative treatment, since last interview",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    cva03j = "CVA: (first) stroke year",
    cva03m = "CVA: (first) stroke month",
    hart07j = "Heart: (first) infarction",
    hart07m = "Heart: (first) infarction",
    hart11 = "Heart: exertion pain disappears in 10 min",
    hart15 = "Heart: cardiac surgery since last interview",
    hart15d = "Heart: pacemaker/cardiac surgery since interview",
    hart15e = "Heart: other/cardiac surgery since last interview",
    kneep1 = "Knee pain past 6 months",
    kneep3 = "Knee pain: worst pain past 6 months",
    kneep4 = "Knee pain: average pain past 6 months",
    kneep9 = "Knee pain: number of days pain past 6 months",
    rheum09 = "Osteo/rheum art: surgery since last interview",
    rmch = "Reason missing: chronical diseases"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    cance5c = "Cancer:",
    cance5f = "Cancer:",
    cance7b = "Cancer: chemotherapy, since last interview",
    cance7c = "Cancer: radiotherapy, since last interview",
    cance7d = "Cancer: alternative treatment, since last interview",
    cara01 = "CNSLD: asthma, chr bronch, emphysema",
    cva03j = "CVA: (first) stroke year",
    cva03m = "CVA: (first) stroke month",
    diabe03 = "Diabetes: medication from onset",
    diabe03a = "Diabetes: medication; insulin injections",
    hart11 = "Heart: exertion pain disappears in 10 min",
    hart15 = "Heart: cardiac surgery since last interview",
    hart15d = "Heart: pacemaker/cardiac surgery since interview",
    hart15e = "Heart: other/cardiac surgery since last interview",
    kneep1 = "Knee pain past 6 months",
    kneep3 = "Knee pain: worst pain past 6 months",
    kneep4 = "Knee pain: average pain past 6 months",
    kneep9 = "Knee pain: number of days pain past 6 months",
    rh10_1y1 = "Joint replacement surgery (1):",
    rh10_1y2 = "Joint replacement surgery (1):",
    rh10_2y1 = "Joint replacement surgery (2):",
    rh10_2y2 = "Joint replacement surgery (2):",
    rh10_3y1 = "Joint replacement surgery (3):",
    rh10_3y2 = "Joint replacement surgery (3):",
    rheum01 = "Osteo/rheum art: osteoarthritis (knee, hip or hand)",
    rheum09 = "Osteo/rheum art: surgery since last interview",
    rmch = "Reason missing: chronical diseases"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "no",
  `2` = "yes",
  `3` = "yes, specialist",
  `4` = "always"
)

standardized_value_labels <- list(
  artve8a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  artve8b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  artve8c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  artve8d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  artve8e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  artvei1 = c(
    `-5` = "not available",
    default_missing_labels[c("-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave"
  ),
  artvei1b = c(
    default_missing_labels[c("-3")],
    `-1` = "not available",
    `1` = "no, disease still exists",
    `2` = "yes, disease not present anymore",
    `3` = "respondent has complaints, but doctor says no disease",
    `4` = "respondent says he/she never had the disease",
    `5` = "interviewer error"
  ),
  artvei1c = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available, asked / respondent does not know"
  ),
  artvei1d = c(
    default_missing_labels[c("-3", "-2")],
    `1` = "no trouble anymore, complaints disappeared by itself",
    `2` = "no trouble anymore, disease is under control",
    `3` = "no trouble anymore, complaints disappeared after surgery",
    `4` = "according to the doctor, the disease is no longer present",
    `5` = "previous measurement is wrong",
    `6` = "other reason mentioned",
    `7` = "respondent does not know"
  ),
  artvei2 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  artvei3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  artvei4 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  artvei5 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  artvei6 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  artvei7 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  artvei8 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  artvei9 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  cance1x = c(
    `-8` = "not available, technical reason",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "benign",
    `2` = "maligh",
    `3` = "unknown"
  ),
  cance5a = c(
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5b = c(
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5d = c(
    `-7` = "label varies by wave",
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5e = c(
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5g = c(
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5h = c(
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5i = c(
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5j = c(
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5k = c(
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5l = c(
    `-6` = "not available, routing",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance5m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "to be coded"
  ),
  cance5x = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "benign",
    `2` = "maligh",
    `3` = "unknown"
  ),
  cance6a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance6b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance6c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance6d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance6e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance6f = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
  cance6g = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "to be coded"
  ),
  cance7a = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance7b = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance7c = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cance7d = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  cancer1 = c(
    `-5` = "not available",
    default_missing_labels[c("-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave"
  ),
  cancer2 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cancer3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cancer4 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  cancer5 = c(
    `-6` = "not available, previous interview no cancer",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  cancer6 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cancer8 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  cara01 = c(
    `-5` = "not available",
    default_missing_labels[c("-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave"
  ),
  cara02 = c(
    default_missing_labels[c("-3", "-2")],
    `-1` = "not available"
  ),
  cara03 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cara04 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  cara05 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cara06 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cara07 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cara08 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "yes, at rest"
  ),
  cara09 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cara10 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cara11 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  cara12 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  chmodus = c(
    `-5` = "not available, routing",
    `-2` = "label varies by wave",
    `1` = "long interview",
    `2` = "short interview"
  ),
  chol1 = c(
    `-5` = "not available, routing",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")],
    `3` = "respondent does not know"
  ),
  chol2 = c(
    `-5` = "not available, routing",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")],
    `3` = "respondent does not know"
  ),
  choutd = c(
    `-5` = "not available, routing",
    default_missing_labels[c("-3", "-1")],
    `-2` = "not available",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  choutd01 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd02 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd03 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd04 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd05 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd06 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd07 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd08 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd09 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd10 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd11 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  choutd12 = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  corona1 = c(
    `-5` = "not available, routing",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona1_lc1 = c(
    `-4` = "Not applicable, positive corona test less than 3 months ago",
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona1_lc2 = c(
    `-4` = "Not applicable, positive corona test less than 3 months ago",
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona1_lc3 = c(
    `-4` = "Not applicable, positive corona test less than 3 months ago",
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona1_lc4 = c(
    `-4` = "Not applicable, positive corona test less than 3 months ago",
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona1_m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  corona1_y = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  corona2 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona2_lc1 = c(
    `-4` = "Not applicable, positive corona test less than 3 months ago",
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona2_lc2 = c(
    `-4` = "Not applicable, positive corona test less than 3 months ago",
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona2_lc3 = c(
    `-4` = "Not applicable, positive corona test less than 3 months ago",
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona2_lc4 = c(
    `-4` = "Not applicable, positive corona test less than 3 months ago",
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  corona2_m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  corona2_y = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva01 = c(
    `-5` = "not available",
    default_missing_labels[c("-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave"
  ),
  cva02 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "once",
    `2` = "two times or more"
  ),
  cva02a = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  cva02b = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "once",
    `2` = "two times or more"
  ),
  cva02c = c(
    `-4` = "not available, no short version",
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "once",
    `2` = "two times or more"
  ),
  cva03 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva03a = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva03j = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva03m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  cva04 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva04a = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva04j = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva04m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  cva05 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva05a = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva05j = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  cva05m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  cva06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cva07 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  cva08 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cva09 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cva10 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cva11 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  cva12 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  diabe01 = c(
    `-5` = "not available",
    default_missing_labels[c("-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave"
  ),
  diabe02 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  diabe03 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "yes, tablets only",
    `4` = "yes, insulin and tablets"
  ),
  diabe03a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "insulin injections",
    `3` = "tablets"
  ),
  diabe03b = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  diabe03c = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  diabe04 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  diabe05 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  diabe06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "other"
  ),
  diabe07 = c(
    `-6` = "label varies by wave",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  diabe08 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  diabe09 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  diabe10 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  diabe11 = c(
    `-6` = "label varies by wave",
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "no exertion: other reason"
  ),
  diabe12 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  diabe13 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  diabe6a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  diabe6b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  diabe6c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  hart01 = c(
    `-5` = "not available",
    default_missing_labels[c("-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave"
  ),
  hart02 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  hart03 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  hart04 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  hart05 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  hart06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "once",
    `2` = "two times or more"
  ),
  hart07 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  hart07j = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  hart07m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  hart08 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  hart08j = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  hart08m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  hart09 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  hart09j = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  hart09m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  hart10 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "no exertion: other reason"
  ),
  hart11 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  hart12 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  hart13 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  hart14 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "yes"
  ),
  hart15 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  hart15a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  hart15b = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  hart15c = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  hart15d = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  hart15e = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  hart16 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  hbd1 = c(
    `-5` = "not available, routing",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")],
    `3` = "respondent does not know"
  ),
  hbd1a = c(
    `-5` = "not available, routing",
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  hbd2 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  hbd2a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  hbd3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "3")],
    `2` = "yes, family physician"
  ),
  htraumj = stats::setNames(character(0), character(0)),
  incon1 = c(
    `-5` = "not available",
    default_missing_labels[c("-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave"
  ),
  incon10 = c(
    `-5` = "not available, routing",
    `-2` = "not applicable: stoma, catheter or something else",
    default_missing_labels[c("-1")],
    `1` = "2 times a month or less",
    `2` = "3-4 times a month",
    `3` = "a few times a week",
    `4` = "daily"
  ),
  incon2 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  incon3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  incon4 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  incon5 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "2 times a month or less",
    `2` = "3-4 times a month",
    `3` = "a few times a week",
    `4` = "daily"
  ),
  incon6 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "yes, most of the time"
  ),
  incon7 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  incon8 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  incon9 = c(
    `-5` = "not available, routing",
    `-2` = "not applicable: stoma, catheter or something else",
    default_missing_labels[c("-1")],
    `1` = "2 times a month or less",
    `2` = "3-4 times a month",
    `3` = "a few times a week",
    `4` = "daily"
  ),
  kneep1 = c(
    `-5` = "not available, routing",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  kneep2 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no pain",
    `10` = "worst conceivable pain"
  ),
  kneep3 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no pain",
    `10` = "worst conceivable pain"
  ),
  kneep4 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no pain",
    `10` = "worst conceivable pain"
  ),
  kneep5 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "0-6 days",
    `2` = "7-14 days",
    `3` = "15-30 days",
    `4` = "31 days or more"
  ),
  kneep6 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not impeded",
    `10` = "unable to continue activities"
  ),
  kneep7 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no change",
    `10` = "extreme change"
  ),
  kneep8 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no change",
    `10` = "extreme change"
  ),
  kneep9 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not a single day",
    `2` = "1-30 days",
    `3` = "31-89 days",
    `4` = "90 days or more"
  ),
  othsi01 = c(
    `-5` = "not available",
    default_missing_labels[c("-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  othsi02 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "label varies by wave",
    `25` = "label varies by wave",
    `26` = "label varies by wave",
    `27` = "label varies by wave",
    `28` = "label varies by wave",
    `29` = "label varies by wave",
    `30` = "label varies by wave",
    `31` = "label varies by wave",
    `32` = "congenital disorders",
    `33` = "hypercholesterolaemia",
    `34` = "gout",
    `35` = "menopausal complaints (females)",
    `36` = "osteoporosis",
    `37` = "other pulmonary disease (no CNSLD)",
    `38` = "systemic diseases",
    `39` = "other hormonal diseases (no diabetes/thyroid)",
    `40` = "other urological disease (no incontinence)",
    `41` = "other locomotor disease",
    `42` = "other vascular disease",
    `43` = "other neurological disease",
    `44` = "TIA",
    `45` = "other haematological disease",
    `46` = "pancreatitis-chronic",
    `47` = "no label",
    `48` = "addiction",
    `49` = "other chronic disease",
    `50` = "other non-chronic disease"
  ),
  othsi04 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  othsi05 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  othsi06 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  othsi07 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  othsi08 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "label varies by wave",
    `25` = "label varies by wave",
    `26` = "label varies by wave",
    `27` = "label varies by wave",
    `28` = "label varies by wave",
    `29` = "label varies by wave",
    `30` = "label varies by wave",
    `31` = "label varies by wave",
    `32` = "congenital disorders",
    `33` = "hypercholesterolaemia",
    `34` = "gout",
    `35` = "menopausal complaints (females)",
    `36` = "osteoporosis",
    `37` = "other pulmonary disease (no CNSLD)",
    `38` = "systemic diseases",
    `39` = "other hormonal diseases (no diabetes/thyroid)",
    `40` = "other urological disease (no incontinence)",
    `41` = "other locomotor disease",
    `42` = "other vascular disease",
    `43` = "other neurological disease",
    `44` = "TIA",
    `45` = "other haematological disease",
    `46` = "pancreatitis-chronic",
    `47` = "no label",
    `48` = "addiction",
    `49` = "other chronic disease",
    `50` = "other non-chronic disease"
  ),
  othsi10 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  othsi11 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  othsi12 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  rh10_1j = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "label varies by wave",
    `8` = "label varies by wave",
    `9` = "label varies by wave",
    `10` = "label varies by wave",
    `11` = "left hand/wrist",
    `12` = "both hands/wrists",
    `13` = "toes right foot",
    `14` = "toes left foot",
    `15` = "toes both feet",
    `16` = "right foot/ankle",
    `17` = "left foot/ankle",
    `18` = "both feet/ankles",
    `19` = "neck",
    `20` = "back",
    `21` = "right shoulder",
    `22` = "left shoulder",
    `23` = "other"
  ),
  rh10_1r = c(
    `-2` = "not available",
    default_missing_labels[c("-1")],
    `1` = "osteoarthritis/wear and tear/loss of cartilage",
    `2` = "rheumatoid arthritis",
    `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)",
    `4` = "fracture (due to accident)",
    `5` = "pain",
    `6` = "other (unable to stand or walk/immobility/etc)"
  ),
  rh10_1s = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "right",
    `2` = "left",
    `3` = "right and left"
  ),
  rh10_1y1 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "year"
  ),
  rh10_1y2 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `2` = "year"
  ),
  rh10_2j = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "label varies by wave",
    `8` = "label varies by wave",
    `9` = "label varies by wave",
    `10` = "label varies by wave",
    `11` = "left hand/wrist",
    `12` = "both hands/wrists",
    `13` = "toes right foot",
    `14` = "toes left foot",
    `15` = "toes both feet",
    `16` = "right foot/ankle",
    `17` = "left foot/ankle",
    `18` = "both feet/ankles",
    `19` = "neck",
    `20` = "back",
    `21` = "right shoulder",
    `22` = "left shoulder",
    `23` = "other"
  ),
  rh10_2r = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "not available",
    `1` = "osteoarthritis/wear and tear/loss of cartilage",
    `2` = "rheumatoid arthritis",
    `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)",
    `4` = "fracture (due to accident)",
    `5` = "pain",
    `6` = "other (unable to stand or walk/immobility/etc)"
  ),
  rh10_2s = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "right",
    `2` = "left",
    `3` = "right and left"
  ),
  rh10_2y1 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "year"
  ),
  rh10_2y2 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `2` = "year"
  ),
  rh10_3j = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave",
    `4` = "label varies by wave",
    `5` = "label varies by wave",
    `6` = "label varies by wave",
    `7` = "label varies by wave",
    `8` = "label varies by wave",
    `9` = "label varies by wave",
    `10` = "label varies by wave",
    `11` = "left hand/wrist",
    `12` = "both hands/wrists",
    `13` = "toes right foot",
    `14` = "toes left foot",
    `15` = "toes both feet",
    `16` = "right foot/ankle",
    `17` = "left foot/ankle",
    `18` = "both feet/ankles",
    `19` = "neck",
    `20` = "back",
    `21` = "right shoulder",
    `22` = "left shoulder",
    `23` = "other"
  ),
  rh10_3r = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "osteoarthritis/wear and tear/loss of cartilage",
    `2` = "rheumatoid arthritis",
    `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)",
    `4` = "fracture (due to accident)",
    `5` = "pain",
    `6` = "other (unable to stand or walk/immobility/etc)"
  ),
  rh10_3s = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "right",
    `2` = "left",
    `3` = "right and left"
  ),
  rh10_3y1 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "year"
  ),
  rh10_3y2 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `2` = "year"
  ),
  rheum01 = c(
    `-5` = "not available",
    default_missing_labels[c("-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave"
  ),
  rheum01a = c(
    `-5` = "not available, routing",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  rheum02 = c(
    `-5` = "not available",
    default_missing_labels[c("-3", "-1")],
    `0` = "label varies by wave",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    `3` = "label varies by wave"
  ),
  rheum03 = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  rheum04 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  rheum05 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave",
    default_answer_labels[c("3")]
  ),
  rheum06 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  rheum07 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  rheum08 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  rheum09 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "label varies by wave"
  ),
  rheum10 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    default_answer_labels[c("2")]
  ),
  rheum10a = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  rheum10a2 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  rheum10a3 = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  rheum11 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    default_answer_labels[c("4")]
  ),
  rheum12 = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "rheumatic hands",
    `2` = "no rheumatic hands",
    `3` = "observation not possible"
  ),
  rheum8a = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum8b = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum8c = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum8d = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum8e = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum8f = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum8g = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum8h = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum8i = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `0` = "no",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum8j = c(
    default_missing_labels[c("-4", "-3", "-2", "-1")],
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
  rheum9a = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum9b = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum9c = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum9d = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum9e = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum9f = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum9g = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum9h = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum9i = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `0` = "not mentioned",
    `1` = "label varies by wave",
    `2` = "mentioned"
  ),
  rheum9j = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
  rmch = c(
    `-2` = "valid data",
    `1` = "terminated interview",
    `2` = "label varies by wave",
    `4` = "refused test"
  ),
  trauy = stats::setNames(character(0), character(0)),
  vaccin = c(
    `-5` = "not available, routing",
    `-4` = "not asked",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2")]
  ),
  vaccin_m = c(
    default_missing_labels[c("-3", "-2", "-1")],
    `1` = "January",
    `2` = "February",
    `3` = "March",
    `4` = "April",
    `5` = "May",
    `6` = "June",
    `7` = "July",
    `8` = "August",
    `9` = "September",
    `10` = "October",
    `11` = "November",
    `12` = "December"
  ),
  vaccin_y = c(
    default_missing_labels[c("-3", "-2", "-1")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see BARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see BARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see BARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see BARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see BARTVEI8"
  ),
    artvei1 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    artvei2 = .replace_labels(
    standardized_value_labels$artvei2,
    `-2` = "na, see BARTVEI1"
  ),
    artvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVE1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    artvei6 = .replace_labels(
    standardized_value_labels$artvei6,
    `-2` = "na, see BARTVEI5"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI5",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    artvei9 = .replace_labels(
    standardized_value_labels$artvei9,
    `-2` = "na, see BARTVEI1"
  ),
    cance5a = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5b = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5c = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5d = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5e = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5f = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5g = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5h = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5i = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5j = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5k = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance5l = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance7a = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cancer1 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    cancer2 = .replace_labels(
    standardized_value_labels$cancer2,
    `-2` = "na, see BCANCER1"
  ),
    cancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    cancer6 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    cancer8 = .replace_labels(
    standardized_value_labels$cancer8,
    `-2` = "na, see BCANCER1"
  ),
    cara01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see BCARA01",
    `-1` = "na, asked"
  ),
    cara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    cara05 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cara06 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cara07 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cara08 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, with heavy exertion",
    `2` = "yes, with light exertion",
    `3` = "yes, at rest"
  ),
    cara09 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cara10 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-4` = "na, short version",
    `-2` = "na, see BCARA01"
  ),
    cara12 = .replace_labels(
    standardized_value_labels$cara12,
    `-2` = "na, see BCARA01"
  ),
    cva01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    cva02 = .replace_labels(
    standardized_value_labels$cva02,
    `-2` = "na, see BCVA01"
  ),
    cva03 = .replace_labels(
    standardized_value_labels$cva03,
    `-2` = "na, see BCVA02"
  ),
    cva04 = .replace_labels(
    standardized_value_labels$cva04,
    `-2` = "na, see BCVA02"
  ),
    cva05 = .replace_labels(
    standardized_value_labels$cva05,
    `-2` = "na, see BCVA02"
  ),
    cva06 = c(`-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    cva08 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cva09 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cva10 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cva11 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    cva12 = .replace_labels(
    standardized_value_labels$cva12,
    `-2` = "na, see BCVA01"
  ),
    diabe01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see BDIABE01"
  ),
    diabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, insulin injections",
    `2` = "yes, tablets only"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    diabe05 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    diabe06 = .replace_labels(
    standardized_value_labels$diabe06,
    `-2` = "na, see BDIABE05",
    `1` = "laser coagulation treatment",
    `2` = "cataract surgery",
    `3` = "both"
  ),
    diabe07 = c(
    `-6` = "pain when walking already asked BARTVEI5",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    diabe08 = .replace_labels(
    standardized_value_labels$diabe08,
    `-2` = "na, see BDIABE07"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE07",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    diabe10 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    diabe11 = c(
    `-6` = "chest pain during exertion already asked BHART10",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes",
    `2` = "no exertion: chest pain",
    `3` = "no exertion: pain legs",
    `4` = "no exertion: shortness of breath",
    `5` = "no exertion: joint complaints",
    `6` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE11",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    diabe13 = .replace_labels(
    standardized_value_labels$diabe13,
    `-2` = "na, see BDIABE01"
  ),
    hart01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see BHART01"
  ),
    hart03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see BHART05"
  ),
    hart07 = .replace_labels(
    standardized_value_labels$hart07,
    `-2` = "na, see BHART06"
  ),
    hart08 = .replace_labels(
    standardized_value_labels$hart08,
    `-2` = "na, see BHART06"
  ),
    hart09 = .replace_labels(
    standardized_value_labels$hart09,
    `-2` = "na, see BHART06"
  ),
    hart10 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes",
    `2` = "no exertion: chest pain",
    `3` = "no exertion: pain legs",
    `4` = "no exertion: shortness of breath",
    `5` = "no exertion: joint complaints",
    `6` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART10",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    hart13 = c(`-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked"),
    hart14 = c(`-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked"),
    hart15 = c(`-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked"),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see BHART15"
  ),
    hart15b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart16 = .replace_labels(
    standardized_value_labels$hart16,
    `-2` = "na, see BHART01"
  ),
    incon1 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    incon2 = .replace_labels(
    standardized_value_labels$incon2,
    `-2` = "na, see BINCON1"
  ),
    incon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    incon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    incon5 = .replace_labels(
    standardized_value_labels$incon5,
    `-4` = "na, short version",
    `-2` = "na, see BINCON1"
  ),
    incon6 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "only by certain occasion",
    `2` = "yes, most of the time"
  ),
    incon7 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    incon8 = .replace_labels(
    standardized_value_labels$incon8,
    `-2` = "na, see BINCON1"
  ),
    othsi01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    othsi02 = .replace_labels(
    standardized_value_labels$othsi02,
    `-2` = "na, see BOTHSI01",
    `24` = "mental problems, incl. depression",
    `25` = "eye diseases",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see BOTHSI01"
  ),
    othsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    othsi07 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    othsi08 = .replace_labels(
    standardized_value_labels$othsi08,
    `-2` = "na, see BOTHSI07",
    `24` = "mental problems, incl. depression",
    `25` = "eye diseases",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see BOTHSI07"
  ),
    othsi11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI07",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI07",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    rheum01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    rheum02 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    rheum03 = .replace_labels(
    standardized_value_labels$rheum03,
    `-2` = "na, see BRHEUM01&02"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rheum11 = .replace_labels(
    standardized_value_labels$rheum11,
    `-2` = "na, see BRHEUM01&02"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see BRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum8b = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum8c = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum8d = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum8e = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum8f = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum8g = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum8h = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum8i = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    rmch = c(`-2` = "valid data", `1` = "terminated interview", `2` = "short interview")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see CARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see CARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see CARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see CARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see CARTVEI8"
  ),
    artvei1 = .replace_labels(
    standardized_value_labels$artvei1,
    `-5` = "na, see CRMCH",
    `0` = "no, never",
    `1` = "no, BARTVEI1 yes",
    `2` = "yes, BARTVEI1 no",
    `3` = "yes, BARTVEI1 yes"
  ),
    artvei2 = .replace_labels(
    standardized_value_labels$artvei2,
    `-2` = "na, see CARTVEI1"
  ),
    artvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CARTVE1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei6 = .replace_labels(
    standardized_value_labels$artvei6,
    `-2` = "na, see CARTVEI5"
  ),
    artvei7 = c(`1` = "see cartvei6, no", `2` = "yes"),
    artvei8 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei9 = .replace_labels(
    standardized_value_labels$artvei9,
    `-2` = "na, see CARTVEI1"
  ),
    cance5a = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5m = .replace_labels(
    standardized_value_labels$cance5m,
    `-2` = "na, see CCANCE5L"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see CCANCER6"
  ),
    cance6g = .replace_labels(
    standardized_value_labels$cance6g,
    `-2` = "na, see CCANCE6F"
  ),
    cance7a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = .replace_labels(
    standardized_value_labels$cancer1,
    `-5` = "na, see CRMCH",
    `0` = "no never",
    `1` = "no, BCANCER1 yes",
    `2` = "yes, BCANCER1 no",
    `3` = "yes, BCANCER1 yes"
  ),
    cancer2 = .replace_labels(
    standardized_value_labels$cancer2,
    `-2` = "na, see CCANCER1"
  ),
    cancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer8 = .replace_labels(
    standardized_value_labels$cancer8,
    `-2` = "na, see CCANCER1"
  ),
    cara01 = .replace_labels(
    standardized_value_labels$cara01,
    `-5` = "na, see CRMCH",
    `0` = "no, never",
    `1` = "no, BCARA01 yes",
    `2` = "yes, BCARA01 no",
    `3` = "yes, BCARA01 yes"
  ),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see CCARA01",
    `-1` = "na, asked"
  ),
    cara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
    cara12 = .replace_labels(
    standardized_value_labels$cara12,
    `-2` = "na, see CCARA01"
  ),
    cva01 = .replace_labels(
    standardized_value_labels$cva01,
    `-5` = "na, see CRMCH",
    `0` = "no never",
    `1` = "no, BCVA01 yes",
    `2` = "yes, BCVA01 no",
    `3` = "yes, BCVA01 yes"
  ),
    cva02a = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva02b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCVA02A",
    `-1` = "na, asked",
    `1` = "once",
    `2` = "two times or more"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see CCVA02B"
  ),
    cva03m = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA02B", `-1` = "na, asked"),
    cva04j = .replace_labels(
    standardized_value_labels$cva04j,
    `-2` = "na, see CCVA02B"
  ),
    cva04m = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA02B", `-1` = "na, asked"),
    cva05j = .replace_labels(
    standardized_value_labels$cva05j,
    `-2` = "na, see CCVA02B"
  ),
    cva05m = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA02B", `-1` = "na, asked"),
    cva06 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cva08 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva09 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva10 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva11 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva12 = .replace_labels(
    standardized_value_labels$cva12,
    `-2` = "na, see CCVA01"
  ),
    diabe01 = .replace_labels(
    standardized_value_labels$diabe01,
    `-5` = "na, see CRMCH",
    `0` = "no, never",
    `1` = "no, BDIABE01 yes",
    `2` = "yes, BDIABE01 no",
    `3` = "yes, BDIABE01 yes"
  ),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see CDIABE01"
  ),
    diabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, insulin injections",
    `3` = "yes, tablets only"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe07 = c(
    `-6` = "na, see CARTVEI1",
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe08 = .replace_labels(
    standardized_value_labels$diabe08,
    `-2` = "na, see CDIABE07"
  ),
    diabe09 = c(`1` = "see cdiabe08, no", `2` = "yes"),
    diabe10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "chest pain during exertion already asked CHART01",
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe13 = .replace_labels(
    standardized_value_labels$diabe13,
    `-2` = "na, see CDIABE01"
  ),
    diabe6a = .replace_labels(
    standardized_value_labels$diabe6a,
    `-2` = "na, see CDIABE05"
  ),
    diabe6b = .replace_labels(
    standardized_value_labels$diabe6b,
    `-2` = "na, see CDIABE05"
  ),
    diabe6c = .replace_labels(
    standardized_value_labels$diabe6c,
    `-2` = "na, see CDIABE05"
  ),
    hart01 = .replace_labels(
    standardized_value_labels$hart01,
    `-5` = "na, see CRMCH",
    `0` = "no, never",
    `1` = "no, BHART01 yes",
    `2` = "yes, BHART01 no",
    `3` = "yes, BHART01 yes"
  ),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see CHART01"
  ),
    hart03 = c(`1` = "see chart02, no", `2` = "yes"),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(`1` = "see chart02, no", `2` = "yes"),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see CHART05"
  ),
    hart07j = .replace_labels(
    standardized_value_labels$hart07j,
    `-2` = "na, see CHART06"
  ),
    hart07m = c(`-3` = "na, wrong skip", `-2` = "na, see CHART06", `-1` = "na, asked"),
    hart08j = .replace_labels(
    standardized_value_labels$hart08j,
    `-2` = "na, see CHART06"
  ),
    hart08m = c(`-3` = "na, wrong skip", `-2` = "na, see CHART06", `-1` = "na, asked"),
    hart09j = .replace_labels(
    standardized_value_labels$hart09j,
    `-2` = "na, see CHART06"
  ),
    hart09m = c(`-3` = "na, wrong skip", `-2` = "na, see CHART06", `-1` = "na, asked"),
    hart10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart13 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart14 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see CHART15"
  ),
    hart15b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart16 = .replace_labels(
    standardized_value_labels$hart16,
    `-2` = "na, see CHART01"
  ),
    hbd1 = c(`-5` = "na, see CRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see CHBD1"
  ),
    hbd2a = .replace_labels(
    standardized_value_labels$hbd2a,
    `-2` = "na, see CHBD1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see CHBD1"
  ),
    incon1 = .replace_labels(
    standardized_value_labels$incon1,
    `-5` = "na, see CRMCH",
    `0` = "no never",
    `1` = "no, BINCON1 yes",
    `2` = "yes, BINCON1 no",
    `3` = "yes, BINCON1 yes"
  ),
    incon2 = .replace_labels(
    standardized_value_labels$incon2,
    `-2` = "na, see CINCON1"
  ),
    incon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    incon5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "2 times a month or less",
    `2` = "3-4 times a month",
    `3` = "a few times a week",
    `4` = "daily"
  ),
    incon6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "only on certain occasion",
    `3` = "yes, most of the time"
  ),
    incon7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon8 = .replace_labels(
    standardized_value_labels$incon8,
    `-2` = "na, see CINCON1"
  ),
    othsi01 = c(`-5` = "na, see CRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = .replace_labels(
    standardized_value_labels$othsi02,
    `-2` = "na, see COTH1",
    `24` = "mental problems, incl. depression",
    `25` = "eye diseases",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see COTH1"
  ),
    othsi05 = c(`-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see COTH1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(`-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi08 = .replace_labels(
    standardized_value_labels$othsi08,
    `-2` = "na, see COTH71",
    `24` = "mental problems, incl. depression",
    `25` = "eye diseases",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see COTH71"
  ),
    othsi11 = c(`-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see COTH71",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum01 = .replace_labels(
    standardized_value_labels$rheum01,
    `-5` = "na, see CRMCH",
    `0` = "no never",
    `1` = "no, BRHEUM01 yes",
    `2` = "yes, BRHEUM01 no",
    `3` = "yes, BRHEUM01 yes"
  ),
    rheum02 = c(
    `-5` = "na, see CRMCH",
    `-1` = "na, asked",
    `0` = "no never",
    `1` = "no, BRHEUM02 yes",
    `2` = "yes, BRHEUM02 no",
    `3` = "yes, BRHEUM02 yes"
  ),
    rheum03 = .replace_labels(
    standardized_value_labels$rheum03,
    `-2` = "na, see CRHEUM01&02"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum11 = .replace_labels(
    standardized_value_labels$rheum11,
    `-2` = "na, see CRHEUM01&02"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see CRHEUM01&02"
  ),
    rheum8a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artvei1 = .replace_labels(
    standardized_value_labels$artvei1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    artvei2 = .replace_labels(
    standardized_value_labels$artvei2,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    artvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVE1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei6 = .replace_labels(
    standardized_value_labels$artvei6,
    `-2` = "na, see D/E/F/G/HARTVEI5"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei9 = .replace_labels(
    standardized_value_labels$artvei9,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    cance5a = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5m = .replace_labels(
    standardized_value_labels$cance5m,
    `-2` = "na, see D/E/F/G/HCANCE5L"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see D/E/F/G/HCANCER6"
  ),
    cance6g = .replace_labels(
    standardized_value_labels$cance6g,
    `-2` = "na, see D/E/F/G/HCANCE6F"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = .replace_labels(
    standardized_value_labels$cancer1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cancer2 = .replace_labels(
    standardized_value_labels$cancer2,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer8 = .replace_labels(
    standardized_value_labels$cancer8,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cara01 = .replace_labels(
    standardized_value_labels$cara01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked"
  ),
    cara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    cara12 = .replace_labels(
    standardized_value_labels$cara12,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    chmodus = c(`-2` = "valid data", `1` = "long interview", `2` = "short interview"),
    cva01 = .replace_labels(
    standardized_value_labels$cva01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cva02a = .replace_labels(
    standardized_value_labels$cva02a,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    cva02b = .replace_labels(
    standardized_value_labels$cva02b,
    `-2` = "na, see D/E/F/G/HCVA02A"
  ),
    cva02c = .replace_labels(
    standardized_value_labels$cva02c,
    `-4` = "na, no short version",
    `-2` = "na, see D/E/F/GCVA01"
  ),
    cva03a = .replace_labels(
    standardized_value_labels$cva03a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva03m = .replace_labels(
    standardized_value_labels$cva03m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04a = .replace_labels(
    standardized_value_labels$cva04a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva04j = .replace_labels(
    standardized_value_labels$cva04j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04m = .replace_labels(
    standardized_value_labels$cva04m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05a = .replace_labels(
    standardized_value_labels$cva05a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva05j = .replace_labels(
    standardized_value_labels$cva05j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05m = .replace_labels(
    standardized_value_labels$cva05m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cva08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva11 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva12 = .replace_labels(
    standardized_value_labels$cva12,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    diabe01 = .replace_labels(
    standardized_value_labels$diabe01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, insulin injections",
    `3` = "yes, tablets only"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe07 = c(
    `-6` = "na, see DARTVEI1",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe08 = .replace_labels(
    standardized_value_labels$diabe08,
    `-2` = "na, see D/E/F/G/HDIABE07"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "na, see D/E/F/G/HHART01",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe13 = .replace_labels(
    standardized_value_labels$diabe13,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe6a = .replace_labels(
    standardized_value_labels$diabe6a,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6b = .replace_labels(
    standardized_value_labels$diabe6b,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6c = .replace_labels(
    standardized_value_labels$diabe6c,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    hart01 = .replace_labels(
    standardized_value_labels$hart01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see D/E/F/G/HHART05"
  ),
    hart07j = .replace_labels(
    standardized_value_labels$hart07j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart07m = .replace_labels(
    standardized_value_labels$hart07m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08j = .replace_labels(
    standardized_value_labels$hart08j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08m = .replace_labels(
    standardized_value_labels$hart08m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09j = .replace_labels(
    standardized_value_labels$hart09j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09m = .replace_labels(
    standardized_value_labels$hart09m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart13 = .replace_labels(
    standardized_value_labels$hart13,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart14 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see D/E/F/G/HHART15"
  ),
    hart15b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart16 = .replace_labels(
    standardized_value_labels$hart16,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hbd1 = c(`-5` = "na, see D/E/F/G/HRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd2a = .replace_labels(
    standardized_value_labels$hbd2a,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    incon1 = .replace_labels(
    standardized_value_labels$incon1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    incon2 = .replace_labels(
    standardized_value_labels$incon2,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    incon5 = .replace_labels(
    standardized_value_labels$incon5,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "only on certain occasion",
    `3` = "yes, most of the time"
  ),
    incon7 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon8 = .replace_labels(
    standardized_value_labels$incon8,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    othsi01 = c(`-5` = "na, see DRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = .replace_labels(
    standardized_value_labels$othsi02,
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `24` = "mental problems, incl. depression",
    `25` = "- to be coded -",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see D/E/F/G/HOTHSI01"
  ),
    othsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = .replace_labels(
    standardized_value_labels$othsi08,
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `24` = "mental problems, incl. depression",
    `25` = "- to be coded -",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see D/E/F/G/HOTHSI07"
  ),
    othsi11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum01 = .replace_labels(
    standardized_value_labels$rheum01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum02 = c(
    `-5` = "na, see D/E/F/G/HRMCH",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum03 = .replace_labels(
    standardized_value_labels$rheum03,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum11 = .replace_labels(
    standardized_value_labels$rheum11,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artvei1 = .replace_labels(
    standardized_value_labels$artvei1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    artvei2 = .replace_labels(
    standardized_value_labels$artvei2,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    artvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVE1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei6 = .replace_labels(
    standardized_value_labels$artvei6,
    `-2` = "na, see D/E/F/G/HARTVEI5"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei9 = .replace_labels(
    standardized_value_labels$artvei9,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    cance5a = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5m = .replace_labels(
    standardized_value_labels$cance5m,
    `-2` = "na, see D/E/F/G/HCANCE5L"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see D/E/F/G/HCANCER6"
  ),
    cance6g = .replace_labels(
    standardized_value_labels$cance6g,
    `-2` = "na, see D/E/F/G/HCANCE6F"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = .replace_labels(
    standardized_value_labels$cancer1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cancer2 = .replace_labels(
    standardized_value_labels$cancer2,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer8 = .replace_labels(
    standardized_value_labels$cancer8,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cara01 = .replace_labels(
    standardized_value_labels$cara01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked"
  ),
    cara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    cara12 = .replace_labels(
    standardized_value_labels$cara12,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    chmodus = c(`-2` = "valid data", `1` = "long interview", `2` = "short interview"),
    cva01 = .replace_labels(
    standardized_value_labels$cva01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cva02a = .replace_labels(
    standardized_value_labels$cva02a,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    cva02b = .replace_labels(
    standardized_value_labels$cva02b,
    `-2` = "na, see D/E/F/G/HCVA02A"
  ),
    cva02c = .replace_labels(
    standardized_value_labels$cva02c,
    `-4` = "na, no short version",
    `-2` = "na, see D/E/F/GCVA01"
  ),
    cva03a = .replace_labels(
    standardized_value_labels$cva03a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva03m = .replace_labels(
    standardized_value_labels$cva03m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04a = .replace_labels(
    standardized_value_labels$cva04a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva04j = .replace_labels(
    standardized_value_labels$cva04j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04m = .replace_labels(
    standardized_value_labels$cva04m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05a = .replace_labels(
    standardized_value_labels$cva05a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva05j = .replace_labels(
    standardized_value_labels$cva05j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05m = .replace_labels(
    standardized_value_labels$cva05m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cva08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva11 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva12 = .replace_labels(
    standardized_value_labels$cva12,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    diabe01 = .replace_labels(
    standardized_value_labels$diabe01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, insulin injections",
    `3` = "yes, tablets only"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe07 = c(
    `-6` = "na, see DARTVEI1",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe08 = .replace_labels(
    standardized_value_labels$diabe08,
    `-2` = "na, see D/E/F/G/HDIABE07"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "na, see D/E/F/G/HHART01",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe13 = .replace_labels(
    standardized_value_labels$diabe13,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe6a = .replace_labels(
    standardized_value_labels$diabe6a,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6b = .replace_labels(
    standardized_value_labels$diabe6b,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6c = .replace_labels(
    standardized_value_labels$diabe6c,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    hart01 = .replace_labels(
    standardized_value_labels$hart01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see D/E/F/G/HHART05"
  ),
    hart07j = .replace_labels(
    standardized_value_labels$hart07j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart07m = .replace_labels(
    standardized_value_labels$hart07m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08j = .replace_labels(
    standardized_value_labels$hart08j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08m = .replace_labels(
    standardized_value_labels$hart08m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09j = .replace_labels(
    standardized_value_labels$hart09j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09m = .replace_labels(
    standardized_value_labels$hart09m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart13 = .replace_labels(
    standardized_value_labels$hart13,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart14 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see D/E/F/G/HHART15"
  ),
    hart15b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart16 = .replace_labels(
    standardized_value_labels$hart16,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hbd1 = c(`-5` = "na, see D/E/F/G/HRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd2a = .replace_labels(
    standardized_value_labels$hbd2a,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    incon1 = .replace_labels(
    standardized_value_labels$incon1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    incon2 = .replace_labels(
    standardized_value_labels$incon2,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    incon5 = .replace_labels(
    standardized_value_labels$incon5,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "only on certain occasion",
    `3` = "yes, most of the time"
  ),
    incon7 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon8 = .replace_labels(
    standardized_value_labels$incon8,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    othsi01 = c(`-5` = "na, see DRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = .replace_labels(
    standardized_value_labels$othsi02,
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `24` = "mental problems, incl. depression",
    `25` = "- to be coded -",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see D/E/F/G/HOTHSI01"
  ),
    othsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = .replace_labels(
    standardized_value_labels$othsi08,
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `24` = "mental problems, incl. depression",
    `25` = "- to be coded -",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see D/E/F/G/HOTHSI07"
  ),
    othsi11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum01 = .replace_labels(
    standardized_value_labels$rheum01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum02 = c(
    `-5` = "na, see D/E/F/G/HRMCH",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum03 = .replace_labels(
    standardized_value_labels$rheum03,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum11 = .replace_labels(
    standardized_value_labels$rheum11,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see BARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see BARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see BARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see BARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see BARTVEI8"
  ),
    artvei1 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    artvei2 = .replace_labels(
    standardized_value_labels$artvei2,
    `-2` = "na, see BARTVEI1"
  ),
    artvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVE1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei6 = .replace_labels(
    standardized_value_labels$artvei6,
    `-2` = "na, see BARTVEI5"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cance5a = c(
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, cervix not asked, male",
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-6` = "na, see BCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5m = .replace_labels(
    standardized_value_labels$cance5m,
    `-2` = "na, see BCANCE5L"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see BCANCER6"
  ),
    cance6g = .replace_labels(
    standardized_value_labels$cance6g,
    `-2` = "na, see BCANCE6F"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cancer2 = .replace_labels(
    standardized_value_labels$cancer2,
    `-2` = "na, see BCANCER1"
  ),
    cancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see BCARA01",
    `-1` = "na, asked"
  ),
    cara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see BCARA01"
  ),
    cva01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva02b = .replace_labels(
    standardized_value_labels$cva02b,
    `-2` = "na, see BCVA02A"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see BCVA02B"
  ),
    cva03m = .replace_labels(
    standardized_value_labels$cva03m,
    `-2` = "na, see BCVA02B"
  ),
    cva04j = .replace_labels(
    standardized_value_labels$cva04j,
    `-2` = "na, see BCVA02B"
  ),
    cva04m = .replace_labels(
    standardized_value_labels$cva04m,
    `-2` = "na, see BCVA02B"
  ),
    cva05j = .replace_labels(
    standardized_value_labels$cva05j,
    `-2` = "na, see BCVA02B"
  ),
    cva05m = .replace_labels(
    standardized_value_labels$cva05m,
    `-2` = "na, see BCVA02B"
  ),
    cva06 = c(`-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cva08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva11 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see BDIABE01"
  ),
    diabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, insulin injections",
    `3` = "yes, tablets only"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe07 = c(
    `-6` = "na, see BARTVEI1",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe08 = .replace_labels(
    standardized_value_labels$diabe08,
    `-2` = "na, see BDIABE07"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "na, see BHART01",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe6a = .replace_labels(
    standardized_value_labels$diabe6a,
    `-2` = "na, see BDIABE05"
  ),
    diabe6b = .replace_labels(
    standardized_value_labels$diabe6b,
    `-2` = "na, see BDIABE05"
  ),
    diabe6c = .replace_labels(
    standardized_value_labels$diabe6c,
    `-2` = "na, see BDIABE05"
  ),
    hart01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see BHART01"
  ),
    hart03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see BHART05"
  ),
    hart07j = .replace_labels(
    standardized_value_labels$hart07j,
    `-2` = "na, see BHART06"
  ),
    hart07m = .replace_labels(
    standardized_value_labels$hart07m,
    `-2` = "na, see BHART06"
  ),
    hart08j = .replace_labels(
    standardized_value_labels$hart08j,
    `-2` = "na, see BHART06"
  ),
    hart08m = .replace_labels(
    standardized_value_labels$hart08m,
    `-2` = "na, see BHART06"
  ),
    hart09j = .replace_labels(
    standardized_value_labels$hart09j,
    `-2` = "na, see BHART06"
  ),
    hart09m = .replace_labels(
    standardized_value_labels$hart09m,
    `-2` = "na, see BHART06"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart13 = .replace_labels(
    standardized_value_labels$hart13,
    `-2` = "na, see BHART01"
  ),
    hart14 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see BHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see BHART15"
  ),
    hart15b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hbd1 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see BHBD1"
  ),
    hbd2a = .replace_labels(
    standardized_value_labels$hbd2a,
    `-2` = "na, see BHBD1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see BHBD1"
  ),
    incon1 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    incon2 = .replace_labels(
    standardized_value_labels$incon2,
    `-2` = "na, see BINCON1"
  ),
    incon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    incon5 = .replace_labels(
    standardized_value_labels$incon5,
    `-2` = "na, see BINCON1"
  ),
    incon6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "only on certain occasion",
    `3` = "yes, most of the time"
  ),
    incon7 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = .replace_labels(
    standardized_value_labels$othsi02,
    `-2` = "na, see BOTHSI01",
    `24` = "mental problems, incl. depression",
    `25` = "- to be coded -",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see BOTHSI01"
  ),
    othsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = .replace_labels(
    standardized_value_labels$othsi08,
    `-2` = "na, see BOTHSI07",
    `24` = "mental problems, incl. depression",
    `25` = "- to be coded -",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see BOTHSI07"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    rheum02 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    rheum03 = .replace_labels(
    standardized_value_labels$rheum03,
    `-2` = "na, see BRHEUM01&02"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see BRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artvei1 = .replace_labels(
    standardized_value_labels$artvei1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    artvei2 = .replace_labels(
    standardized_value_labels$artvei2,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    artvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVE1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei6 = .replace_labels(
    standardized_value_labels$artvei6,
    `-2` = "na, see D/E/F/G/HARTVEI5"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei9 = .replace_labels(
    standardized_value_labels$artvei9,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    cance5a = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5m = .replace_labels(
    standardized_value_labels$cance5m,
    `-2` = "na, see D/E/F/G/HCANCE5L"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see D/E/F/G/HCANCER6"
  ),
    cance6g = .replace_labels(
    standardized_value_labels$cance6g,
    `-2` = "na, see D/E/F/G/HCANCE6F"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = .replace_labels(
    standardized_value_labels$cancer1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cancer2 = .replace_labels(
    standardized_value_labels$cancer2,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer8 = .replace_labels(
    standardized_value_labels$cancer8,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cara01 = .replace_labels(
    standardized_value_labels$cara01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked"
  ),
    cara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    cara12 = .replace_labels(
    standardized_value_labels$cara12,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    chmodus = c(`-2` = "valid data", `1` = "long interview", `2` = "short interview"),
    cva01 = .replace_labels(
    standardized_value_labels$cva01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cva02a = .replace_labels(
    standardized_value_labels$cva02a,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    cva02b = .replace_labels(
    standardized_value_labels$cva02b,
    `-2` = "na, see D/E/F/G/HCVA02A"
  ),
    cva02c = .replace_labels(
    standardized_value_labels$cva02c,
    `-4` = "na, no short version",
    `-2` = "na, see D/E/F/GCVA01"
  ),
    cva03a = .replace_labels(
    standardized_value_labels$cva03a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva03m = .replace_labels(
    standardized_value_labels$cva03m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04a = .replace_labels(
    standardized_value_labels$cva04a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva04j = .replace_labels(
    standardized_value_labels$cva04j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04m = .replace_labels(
    standardized_value_labels$cva04m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05a = .replace_labels(
    standardized_value_labels$cva05a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva05j = .replace_labels(
    standardized_value_labels$cva05j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05m = .replace_labels(
    standardized_value_labels$cva05m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cva08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva11 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva12 = .replace_labels(
    standardized_value_labels$cva12,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    diabe01 = .replace_labels(
    standardized_value_labels$diabe01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, insulin injections",
    `3` = "yes, tablets only"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe07 = c(
    `-6` = "na, see DARTVEI1",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe08 = .replace_labels(
    standardized_value_labels$diabe08,
    `-2` = "na, see D/E/F/G/HDIABE07"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "na, see D/E/F/G/HHART01",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe13 = .replace_labels(
    standardized_value_labels$diabe13,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe6a = .replace_labels(
    standardized_value_labels$diabe6a,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6b = .replace_labels(
    standardized_value_labels$diabe6b,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6c = .replace_labels(
    standardized_value_labels$diabe6c,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    hart01 = .replace_labels(
    standardized_value_labels$hart01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see D/E/F/G/HHART05"
  ),
    hart07j = .replace_labels(
    standardized_value_labels$hart07j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart07m = .replace_labels(
    standardized_value_labels$hart07m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08j = .replace_labels(
    standardized_value_labels$hart08j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08m = .replace_labels(
    standardized_value_labels$hart08m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09j = .replace_labels(
    standardized_value_labels$hart09j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09m = .replace_labels(
    standardized_value_labels$hart09m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart13 = .replace_labels(
    standardized_value_labels$hart13,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart14 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see D/E/F/G/HHART15"
  ),
    hart15b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart16 = .replace_labels(
    standardized_value_labels$hart16,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hbd1 = c(`-5` = "na, see D/E/F/G/HRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd2a = .replace_labels(
    standardized_value_labels$hbd2a,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    incon1 = .replace_labels(
    standardized_value_labels$incon1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    incon2 = .replace_labels(
    standardized_value_labels$incon2,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    incon5 = .replace_labels(
    standardized_value_labels$incon5,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "only on certain occasion",
    `3` = "yes, most of the time"
  ),
    incon7 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon8 = .replace_labels(
    standardized_value_labels$incon8,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    othsi01 = c(`-5` = "na, see DRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = .replace_labels(
    standardized_value_labels$othsi02,
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `24` = "mental problems, incl. depression",
    `25` = "- to be coded -",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see D/E/F/G/HOTHSI01"
  ),
    othsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = .replace_labels(
    standardized_value_labels$othsi08,
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `24` = "mental problems, incl. depression",
    `25` = "- to be coded -",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see D/E/F/G/HOTHSI07"
  ),
    othsi11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum01 = .replace_labels(
    standardized_value_labels$rheum01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum02 = c(
    `-5` = "na, see D/E/F/G/HRMCH",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum03 = .replace_labels(
    standardized_value_labels$rheum03,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum11 = .replace_labels(
    standardized_value_labels$rheum11,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8j = .replace_labels(
    standardized_value_labels$rheum8j,
    `-2` = "na, see F/G/HRHEUM01&02"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9j = .replace_labels(
    standardized_value_labels$rheum9j,
    `-2` = "na, see F/G/HRHEUM09"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artvei1 = .replace_labels(
    standardized_value_labels$artvei1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    artvei2 = .replace_labels(
    standardized_value_labels$artvei2,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    artvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVE1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei6 = .replace_labels(
    standardized_value_labels$artvei6,
    `-2` = "na, see D/E/F/G/HARTVEI5"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei9 = .replace_labels(
    standardized_value_labels$artvei9,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    cance5a = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5m = .replace_labels(
    standardized_value_labels$cance5m,
    `-2` = "na, see D/E/F/G/HCANCE5L"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see D/E/F/G/HCANCER6"
  ),
    cance6g = .replace_labels(
    standardized_value_labels$cance6g,
    `-2` = "na, see D/E/F/G/HCANCE6F"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = .replace_labels(
    standardized_value_labels$cancer1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cancer2 = .replace_labels(
    standardized_value_labels$cancer2,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer8 = .replace_labels(
    standardized_value_labels$cancer8,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cara01 = .replace_labels(
    standardized_value_labels$cara01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked"
  ),
    cara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    cara12 = .replace_labels(
    standardized_value_labels$cara12,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    chmodus = c(`-5` = "na, see G/HRMCH", `1` = "long interview", `2` = "short interview"),
    cva01 = .replace_labels(
    standardized_value_labels$cva01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cva02a = .replace_labels(
    standardized_value_labels$cva02a,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    cva02b = .replace_labels(
    standardized_value_labels$cva02b,
    `-2` = "na, see D/E/F/G/HCVA02A"
  ),
    cva02c = .replace_labels(
    standardized_value_labels$cva02c,
    `-4` = "na, no short version",
    `-2` = "na, see D/E/F/GCVA01"
  ),
    cva03a = .replace_labels(
    standardized_value_labels$cva03a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva03m = .replace_labels(
    standardized_value_labels$cva03m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04a = .replace_labels(
    standardized_value_labels$cva04a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva04j = .replace_labels(
    standardized_value_labels$cva04j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04m = .replace_labels(
    standardized_value_labels$cva04m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05a = .replace_labels(
    standardized_value_labels$cva05a,
    `-2` = "na, see D/E/F/GCVA02C"
  ),
    cva05j = .replace_labels(
    standardized_value_labels$cva05j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05m = .replace_labels(
    standardized_value_labels$cva05m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cva08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva11 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva12 = .replace_labels(
    standardized_value_labels$cva12,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    diabe01 = .replace_labels(
    standardized_value_labels$diabe01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, insulin injections",
    `3` = "yes, tablets only"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe07 = c(
    `-6` = "na, see DARTVEI1",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe08 = .replace_labels(
    standardized_value_labels$diabe08,
    `-2` = "na, see D/E/F/G/HDIABE07"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "na, see D/E/F/G/HHART01",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe13 = .replace_labels(
    standardized_value_labels$diabe13,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe6a = .replace_labels(
    standardized_value_labels$diabe6a,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6b = .replace_labels(
    standardized_value_labels$diabe6b,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6c = .replace_labels(
    standardized_value_labels$diabe6c,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    hart01 = .replace_labels(
    standardized_value_labels$hart01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see D/E/F/G/HHART05"
  ),
    hart07j = .replace_labels(
    standardized_value_labels$hart07j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart07m = .replace_labels(
    standardized_value_labels$hart07m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08j = .replace_labels(
    standardized_value_labels$hart08j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08m = .replace_labels(
    standardized_value_labels$hart08m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09j = .replace_labels(
    standardized_value_labels$hart09j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09m = .replace_labels(
    standardized_value_labels$hart09m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart13 = .replace_labels(
    standardized_value_labels$hart13,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart14 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see D/E/F/G/HHART15"
  ),
    hart15b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart16 = .replace_labels(
    standardized_value_labels$hart16,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hbd1 = c(`-5` = "na, see D/E/F/G/HRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd2a = .replace_labels(
    standardized_value_labels$hbd2a,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    incon1 = .replace_labels(
    standardized_value_labels$incon1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    incon2 = .replace_labels(
    standardized_value_labels$incon2,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    incon5 = .replace_labels(
    standardized_value_labels$incon5,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "only on certain occasion",
    `3` = "yes, most of the time"
  ),
    incon7 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon8 = .replace_labels(
    standardized_value_labels$incon8,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    othsi01 = c(`-5` = "na, see DRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "mental problems, incl. depression",
    `25` = "other to be coded"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see D/E/F/G/HOTHSI01"
  ),
    othsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "mental problems, incl. depression",
    `25` = "other to be coded"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see D/E/F/G/HOTHSI07"
  ),
    othsi11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum01 = .replace_labels(
    standardized_value_labels$rheum01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum02 = c(
    `-5` = "na, see D/E/F/G/HRMCH",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum03 = .replace_labels(
    standardized_value_labels$rheum03,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum11 = .replace_labels(
    standardized_value_labels$rheum11,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8j = .replace_labels(
    standardized_value_labels$rheum8j,
    `-2` = "na, see F/G/HRHEUM01&02"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9j = .replace_labels(
    standardized_value_labels$rheum9j,
    `-2` = "na, see F/G/HRHEUM09"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see D/E/F/G/HARTVEI8"
  ),
    artvei1 = .replace_labels(
    standardized_value_labels$artvei1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    artvei2 = .replace_labels(
    standardized_value_labels$artvei2,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    artvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVE1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei6 = .replace_labels(
    standardized_value_labels$artvei6,
    `-2` = "na, see D/E/F/G/HARTVEI5"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei9 = .replace_labels(
    standardized_value_labels$artvei9,
    `-2` = "na, see D/E/F/G/HARTVEI1"
  ),
    cance5a = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-6` = "na, see D/E/F/G/HCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5m = .replace_labels(
    standardized_value_labels$cance5m,
    `-2` = "na, see D/E/F/G/HCANCE5L"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see D/E/F/G/HCANCER6"
  ),
    cance6g = .replace_labels(
    standardized_value_labels$cance6g,
    `-2` = "na, see D/E/F/G/HCANCE6F"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = .replace_labels(
    standardized_value_labels$cancer1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cancer2 = .replace_labels(
    standardized_value_labels$cancer2,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer8 = .replace_labels(
    standardized_value_labels$cancer8,
    `-2` = "na, see D/E/F/G/HCANCER1"
  ),
    cara01 = .replace_labels(
    standardized_value_labels$cara01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked"
  ),
    cara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    cara12 = .replace_labels(
    standardized_value_labels$cara12,
    `-2` = "na, see D/E/F/G/HCARA01"
  ),
    chmodus = c(`-5` = "na, see G/HRMCH", `1` = "long interview", `2` = "short interview"),
    cva01 = .replace_labels(
    standardized_value_labels$cva01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cva02a = .replace_labels(
    standardized_value_labels$cva02a,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    cva02b = .replace_labels(
    standardized_value_labels$cva02b,
    `-2` = "na, see D/E/F/G/HCVA02A"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva03m = .replace_labels(
    standardized_value_labels$cva03m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04j = .replace_labels(
    standardized_value_labels$cva04j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva04m = .replace_labels(
    standardized_value_labels$cva04m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05j = .replace_labels(
    standardized_value_labels$cva05j,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva05m = .replace_labels(
    standardized_value_labels$cva05m,
    `-2` = "na, see D/E/F/G/HCVA02B"
  ),
    cva06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cva08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva11 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva12 = .replace_labels(
    standardized_value_labels$cva12,
    `-2` = "na, see D/E/F/G/HCVA01"
  ),
    diabe01 = .replace_labels(
    standardized_value_labels$diabe01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, insulin injections",
    `3` = "yes, tablets only"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe07 = c(
    `-6` = "na, see DARTVEI1",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe08 = .replace_labels(
    standardized_value_labels$diabe08,
    `-2` = "na, see D/E/F/G/HDIABE07"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "na, see D/E/F/G/HHART01",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe13 = .replace_labels(
    standardized_value_labels$diabe13,
    `-2` = "na, see D/E/F/G/HDIABE01"
  ),
    diabe6a = .replace_labels(
    standardized_value_labels$diabe6a,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6b = .replace_labels(
    standardized_value_labels$diabe6b,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    diabe6c = .replace_labels(
    standardized_value_labels$diabe6c,
    `-2` = "na, see D/E/F/G/HDIABE05"
  ),
    hart01 = .replace_labels(
    standardized_value_labels$hart01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see D/E/F/G/HHART05"
  ),
    hart07j = .replace_labels(
    standardized_value_labels$hart07j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart07m = .replace_labels(
    standardized_value_labels$hart07m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08j = .replace_labels(
    standardized_value_labels$hart08j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart08m = .replace_labels(
    standardized_value_labels$hart08m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09j = .replace_labels(
    standardized_value_labels$hart09j,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart09m = .replace_labels(
    standardized_value_labels$hart09m,
    `-2` = "na, see D/E/F/G/HHART06"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart13 = .replace_labels(
    standardized_value_labels$hart13,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart14 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see D/E/F/G/HHART15"
  ),
    hart15b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart16 = .replace_labels(
    standardized_value_labels$hart16,
    `-2` = "na, see D/E/F/G/HHART01"
  ),
    hbd1 = c(`-5` = "na, see D/E/F/G/HRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd2a = .replace_labels(
    standardized_value_labels$hbd2a,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see D/E/F/G/HHBD1"
  ),
    incon1 = .replace_labels(
    standardized_value_labels$incon1,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    incon2 = .replace_labels(
    standardized_value_labels$incon2,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    incon5 = .replace_labels(
    standardized_value_labels$incon5,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    incon6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "only on certain occasion",
    `3` = "yes, most of the time"
  ),
    incon7 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon8 = .replace_labels(
    standardized_value_labels$incon8,
    `-2` = "na, see D/E/F/G/HINCON1"
  ),
    othsi01 = c(`-5` = "na, see DRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "other to be coded"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see D/E/F/G/HOTHSI01"
  ),
    othsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "other to be coded"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see D/E/F/G/HOTHSI07"
  ),
    othsi11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum01 = .replace_labels(
    standardized_value_labels$rheum01,
    `-5` = "na, see D/E/F/G/HRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum02 = c(
    `-5` = "na, see D/E/F/G/HRMCH",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum03 = .replace_labels(
    standardized_value_labels$rheum03,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum11 = .replace_labels(
    standardized_value_labels$rheum11,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see D/E/F/G/HRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8j = .replace_labels(
    standardized_value_labels$rheum8j,
    `-2` = "na, see F/G/HRHEUM01&02"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see D/E/F/G/HRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9j = .replace_labels(
    standardized_value_labels$rheum9j,
    `-2` = "na, see F/G/HRHEUM09"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see BARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see BARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see BARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see BARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see BARTVEI8"
  ),
    artvei1 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    artvei2 = .replace_labels(
    standardized_value_labels$artvei2,
    `-2` = "na, see BARTVEI1"
  ),
    artvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVE1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei6 = .replace_labels(
    standardized_value_labels$artvei6,
    `-2` = "na, see BARTVEI5"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cance5a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, cervix not asked, male",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see BCANCER6"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cancer2 = .replace_labels(
    standardized_value_labels$cancer2,
    `-2` = "na, see BCANCER1"
  ),
    cancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see BCARA01",
    `-1` = "na, asked"
  ),
    cara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see BCARA01"
  ),
    chmodus = c(`-2` = "na, see BRMCH", `1` = "long interview", `2` = "short interview"),
    cva01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva02b = .replace_labels(
    standardized_value_labels$cva02b,
    `-2` = "na, see BCVA02A"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see BCVA02B"
  ),
    cva03m = .replace_labels(
    standardized_value_labels$cva03m,
    `-2` = "na, see BCVA02B"
  ),
    cva04j = .replace_labels(
    standardized_value_labels$cva04j,
    `-2` = "na, see BCVA02B"
  ),
    cva04m = .replace_labels(
    standardized_value_labels$cva04m,
    `-2` = "na, see BCVA02B"
  ),
    cva05j = .replace_labels(
    standardized_value_labels$cva05j,
    `-2` = "na, see BCVA02B"
  ),
    cva05m = .replace_labels(
    standardized_value_labels$cva05m,
    `-2` = "na, see BCVA02B"
  ),
    cva06 = c(`-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cva08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cva11 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see BDIABE01"
  ),
    diabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, insulin injections",
    `3` = "yes, tablets only",
    `4` = "yes, insulin and tablets"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe06 = c(
    `-2` = "na, see BDIABE05",
    `-1` = "na, asked",
    `1` = "laser treatment",
    `2` = "cataract operation",
    `3` = "other treatment"
  ),
    diabe07 = c(
    `-6` = "na, see BARTVEI1",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe08 = .replace_labels(
    standardized_value_labels$diabe08,
    `-2` = "na, see BDIABE07"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "na, see BHART01",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see BHART01"
  ),
    hart03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see BHART05"
  ),
    hart07j = .replace_labels(
    standardized_value_labels$hart07j,
    `-2` = "na, see BHART06"
  ),
    hart07m = .replace_labels(
    standardized_value_labels$hart07m,
    `-2` = "na, see BHART06"
  ),
    hart08j = .replace_labels(
    standardized_value_labels$hart08j,
    `-2` = "na, see BHART06"
  ),
    hart08m = .replace_labels(
    standardized_value_labels$hart08m,
    `-2` = "na, see BHART06"
  ),
    hart09j = .replace_labels(
    standardized_value_labels$hart09j,
    `-2` = "na, see BHART06"
  ),
    hart09m = .replace_labels(
    standardized_value_labels$hart09m,
    `-2` = "na, see BHART06"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart13 = .replace_labels(
    standardized_value_labels$hart13,
    `-2` = "na, see BHART01"
  ),
    hart14 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see BHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see BHART15"
  ),
    hart15b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hbd1 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see BHBD1"
  ),
    hbd2a = .replace_labels(
    standardized_value_labels$hbd2a,
    `-2` = "na, see BHBD1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see BHBD1"
  ),
    incon1 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    incon2 = .replace_labels(
    standardized_value_labels$incon2,
    `-2` = "na, see BINCON1"
  ),
    incon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    incon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    incon5 = .replace_labels(
    standardized_value_labels$incon5,
    `-2` = "na, see BINCON1"
  ),
    incon6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "only on certain occasion",
    `3` = "yes, most of the time"
  ),
    incon7 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "other to be coded"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see BOTHSI01"
  ),
    othsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI07",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "other to be coded"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see BOTHSI07"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    rheum02 = c(`-5` = "na, see BRMCH", `1` = "no", `2` = "yes"),
    rheum03 = .replace_labels(
    standardized_value_labels$rheum03,
    `-2` = "na, see BRHEUM01&02"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see BRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8j = .replace_labels(
    standardized_value_labels$rheum8j,
    `-2` = "na, see BRHEUM01&02"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9j = .replace_labels(
    standardized_value_labels$rheum9j,
    `-2` = "na, see BRHEUM09"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    artvei1 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cara01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    cva01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    diabe01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hart01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    rheum01 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    rheum02 = c(`-5` = "na, see BRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see I/JARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see I/JARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see I/JARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see I/JARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see I/JARTVEI8"
  ),
    artvei1 = .replace_labels(
    standardized_value_labels$artvei1,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei9 = .replace_labels(
    standardized_value_labels$artvei9,
    `-2` = "na, see IARTVEI1"
  ),
    cance5a = c(
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, uterus not asked, male",
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-6` = "na, see ICANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see I/JCANCER6"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = .replace_labels(
    standardized_value_labels$cancer1,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = .replace_labels(
    standardized_value_labels$cancer5,
    `-6` = "na, previous interview no cancer",
    `-2` = "na, see ICANCER1"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara01 = .replace_labels(
    standardized_value_labels$cara01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see I/JCARA01",
    `-1` = "na, asked"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see I/JCARA01"
  ),
    chmodus = c(`-2` = "na, see I/JRMCH", `1` = "long interview", `2` = "short interview"),
    choutd = .replace_labels(
    standardized_value_labels$choutd,
    `-5` = "na, see I/JRMCH",
    `-2` = "na, see IHEALTH1 & not any chronic disease"
  ),
    choutd01 = .replace_labels(
    standardized_value_labels$choutd01,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd02 = .replace_labels(
    standardized_value_labels$choutd02,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd03 = .replace_labels(
    standardized_value_labels$choutd03,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd04 = .replace_labels(
    standardized_value_labels$choutd04,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd05 = .replace_labels(
    standardized_value_labels$choutd05,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd06 = .replace_labels(
    standardized_value_labels$choutd06,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd07 = .replace_labels(
    standardized_value_labels$choutd07,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd08 = .replace_labels(
    standardized_value_labels$choutd08,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd09 = .replace_labels(
    standardized_value_labels$choutd09,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd10 = .replace_labels(
    standardized_value_labels$choutd10,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd11 = .replace_labels(
    standardized_value_labels$choutd11,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd12 = .replace_labels(
    standardized_value_labels$choutd12,
    `-2` = "na, see I/JCHOUTD"
  ),
    cva01 = .replace_labels(
    standardized_value_labels$cva01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cva02a = .replace_labels(
    standardized_value_labels$cva02a,
    `-2` = "na, see I/JCVA01"
  ),
    cva02b = .replace_labels(
    standardized_value_labels$cva02b,
    `-2` = "na, see ICVA02A"
  ),
    cva03j = c(`-3` = "na, wrong skip", `-2` = "na, see ICVA02B"),
    cva03m = c(`-3` = "na, wrong skip", `-2` = "na, see ICVA02B"),
    cva04j = .replace_labels(
    standardized_value_labels$cva04j,
    `-2` = "na, see ICVA02B"
  ),
    cva04m = .replace_labels(
    standardized_value_labels$cva04m,
    `-2` = "na, see ICVA02B"
  ),
    cva05j = .replace_labels(
    standardized_value_labels$cva05j,
    `-2` = "na, see ICVA02B"
  ),
    cva05m = .replace_labels(
    standardized_value_labels$cva05m,
    `-2` = "na, see ICVA02B"
  ),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cva09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see ICVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe01 = .replace_labels(
    standardized_value_labels$diabe01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see I/JDIABE01"
  ),
    diabe03a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE01",
    `-1` = "na, asked",
    `1` = "none",
    `2` = "insulin injections",
    `3` = "tablets"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see IDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe07 = c(
    `-6` = "na, see I/JARTVEI1",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(`-6` = "na, see IHART01"),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe6a = .replace_labels(
    standardized_value_labels$diabe6a,
    `-2` = "na, see IDIABE05"
  ),
    diabe6b = .replace_labels(
    standardized_value_labels$diabe6b,
    `-2` = "na, see IDIABE05"
  ),
    diabe6c = .replace_labels(
    standardized_value_labels$diabe6c,
    `-2` = "na, see IDIABE05"
  ),
    hart01 = .replace_labels(
    standardized_value_labels$hart01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart06 = .replace_labels(
    standardized_value_labels$hart06,
    `-2` = "na, see IHART05"
  ),
    hart07j = c(`-3` = "na, wrong skip", `-2` = "na, see IHART06"),
    hart07m = c(`-3` = "na, wrong skip", `-2` = "na, see IHART06"),
    hart08j = .replace_labels(
    standardized_value_labels$hart08j,
    `-2` = "na, see IHART06"
  ),
    hart08m = .replace_labels(
    standardized_value_labels$hart08m,
    `-2` = "na, see IHART06"
  ),
    hart09j = .replace_labels(
    standardized_value_labels$hart09j,
    `-2` = "na, see IHART06"
  ),
    hart09m = .replace_labels(
    standardized_value_labels$hart09m,
    `-2` = "na, see IHART06"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart13 = .replace_labels(
    standardized_value_labels$hart13,
    `-2` = "na, see IHART01"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see I/JHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see I/JHART15"
  ),
    hart15b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hbd1 = c(`-5` = "na, see I/JRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    hbd1a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHBD1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see I/JHBD1 & I/JHBD1A1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see I/JHBD1"
  ),
    incon10 = c(
    `-5` = "na, see I/JRMCH",
    `-1` = "na, asked",
    `1` = "2 times a month or less",
    `2` = "3-4 times a month",
    `3` = "a few times a week",
    `4` = "daily"
  ),
    incon9 = c(
    `-5` = "na, see I/JRMCH",
    `-1` = "na, asked",
    `1` = "2 times a month or less",
    `2` = "3-4 times a month",
    `3` = "a few times a week",
    `4` = "daily"
  ),
    kneep1 = .replace_labels(
    standardized_value_labels$kneep1,
    `-5` = "na, see I/JRMCH"
  ),
    kneep2 = .replace_labels(
    standardized_value_labels$kneep2,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep3 = .replace_labels(
    standardized_value_labels$kneep3,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep4 = .replace_labels(
    standardized_value_labels$kneep4,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep5 = .replace_labels(
    standardized_value_labels$kneep5,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep6 = .replace_labels(
    standardized_value_labels$kneep6,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep7 = .replace_labels(
    standardized_value_labels$kneep7,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep8 = .replace_labels(
    standardized_value_labels$kneep8,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep9 = .replace_labels(
    standardized_value_labels$kneep9,
    `-2` = "na, see I/JKNEEP1"
  ),
    othsi01 = c(`-5` = "na, see I/JRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI01",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "other to be coded"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see I/JOTHSI01"
  ),
    othsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see IOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI07",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "other to be coded"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see I/JOTHSI07"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rh10_1j = c(
    `-2` = "na, see I/JRHEUM10A",
    `-1` = "na, asked",
    `1` = "right hip",
    `2` = "left hip",
    `3` = "both hips",
    `4` = "right knee",
    `5` = "left knee",
    `6` = "both knees",
    `7` = "right hand fingers",
    `8` = "left hand fingers",
    `9` = "both hands fingers",
    `10` = "right hand/wrist",
    `11` = "left hand/wrist",
    `12` = "both hands/wrists",
    `13` = "toes right foot",
    `14` = "toes left foot",
    `15` = "toes both feet",
    `16` = "right foot/ankle",
    `17` = "left foot/ankle",
    `18` = "both feet/ankles",
    `19` = "neck",
    `20` = "back",
    `21` = "right shoulder",
    `22` = "left shoulder",
    `23` = "other"
  ),
    rh10_1r = .replace_labels(
    standardized_value_labels$rh10_1r,
    `-2` = "na, see I/JRHEUM10A"
  ),
    rh10_1s = .replace_labels(
    standardized_value_labels$rh10_1s,
    `-2` = "na, see I/JRHEUM10A"
  ),
    rh10_1y1 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A", `-1` = "na, asked"),
    rh10_1y2 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRH10_1S", `-1` = "na, asked"),
    rh10_2j = c(
    `-2` = "na, see IRHEUM10A2",
    `-1` = "na, asked",
    `1` = "right hip",
    `2` = "left hip",
    `3` = "both hips",
    `4` = "right knee",
    `5` = "left knee",
    `6` = "both knees",
    `7` = "right hand fingers",
    `8` = "left hand fingers",
    `9` = "both hands fingers",
    `10` = "right hand/wrist",
    `11` = "left hand/wrist",
    `12` = "both hands/wrists",
    `13` = "toes right foot",
    `14` = "toes left foot",
    `15` = "toes both feet",
    `16` = "right foot/ankle",
    `17` = "left foot/ankle",
    `18` = "both feet/ankles",
    `19` = "neck",
    `20` = "back",
    `21` = "right shoulder",
    `22` = "left shoulder",
    `23` = "other"
  ),
    rh10_2r = c(
    `-2` = "na, see I/JRHEUM10A2",
    `-1` = "na, asked",
    `1` = "osteoarthritis/wear and tear/loss of cartilage",
    `2` = "rheumatoid arthritis",
    `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)",
    `4` = "fracture (due to accident)",
    `5` = "pain",
    `6` = "other (unable to stand or walk/immobility/etc)"
  ),
    rh10_2s = .replace_labels(
    standardized_value_labels$rh10_2s,
    `-2` = "na, see I/JRHEUM10A2"
  ),
    rh10_2y1 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A2", `-1` = "na, asked"),
    rh10_2y2 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRH10_2S", `-1` = "na, asked"),
    rh10_3j = c(
    `-2` = "na, see IRHEUM10A3",
    `-1` = "na, asked",
    `1` = "right hip",
    `2` = "left hip",
    `3` = "both hips",
    `4` = "right knee",
    `5` = "left knee",
    `6` = "both knees",
    `7` = "right hand fingers",
    `8` = "left hand fingers",
    `9` = "both hands fingers",
    `10` = "right hand/wrist",
    `11` = "left hand/wrist",
    `12` = "both hands/wrists",
    `13` = "toes right foot",
    `14` = "toes left foot",
    `15` = "toes both feet",
    `16` = "right foot/ankle",
    `17` = "left foot/ankle",
    `18` = "both feet/ankles",
    `19` = "neck",
    `20` = "back",
    `21` = "right shoulder",
    `22` = "left shoulder",
    `23` = "other"
  ),
    rh10_3r = c(
    `-2` = "na, see I/JRHEUM10A3",
    `-1` = "na, asked",
    `1` = "osteoarthritis/wear and tear/loss of cartilage",
    `2` = "rheumatoid arthritis",
    `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)",
    `4` = "fracture (due to accident)",
    `5` = "pain",
    `6` = "other (unable to stand or walk/immobility/etc)"
  ),
    rh10_3s = .replace_labels(
    standardized_value_labels$rh10_3s,
    `-2` = "na, see I/JRHEUM10A3"
  ),
    rh10_3y1 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A3", `-1` = "na, asked"),
    rh10_3y2 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRH10_3S", `-1` = "na, asked"),
    rheum01 = .replace_labels(
    standardized_value_labels$rheum01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum02 = c(
    `-5` = "na, see I/JRMCH",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum10a = .replace_labels(
    standardized_value_labels$rheum10a,
    `-2` = "na, see I/JRHEUM01"
  ),
    rheum10a2 = .replace_labels(
    standardized_value_labels$rheum10a2,
    `-2` = "na, see I/JRHEUM10A2"
  ),
    rheum10a3 = .replace_labels(
    standardized_value_labels$rheum10a3,
    `-2` = "na, see I/JRHEUM10A2"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see I/JRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8j = .replace_labels(
    standardized_value_labels$rheum8j,
    `-2` = "na, see I/JRHEUM01&02"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9j = .replace_labels(
    standardized_value_labels$rheum9j,
    `-2` = "na, see I/JRHEUM09"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see I/JARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see I/JARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see I/JARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see I/JARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see I/JARTVEI8"
  ),
    artvei1 = .replace_labels(
    standardized_value_labels$artvei1,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cance1x = .replace_labels(
    standardized_value_labels$cance1x,
    `-8` = "na, technical error",
    `-2` = "na, see JCANCER1"
  ),
    cance5a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, uterus not asked, male",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see I/JCANCER6"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = .replace_labels(
    standardized_value_labels$cancer1,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = .replace_labels(
    standardized_value_labels$cancer5,
    `-6` = "na, previous interview no cancer",
    `-2` = "na, see JCANCER1 & JCANCE1X"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JCANCER1 & JCANCE1X",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara01 = .replace_labels(
    standardized_value_labels$cara01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see I/JCARA01",
    `-1` = "na, asked / R does not know"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see I/JCARA01"
  ),
    chmodus = c(`-2` = "na, see I/JRMCH", `1` = "long interview", `2` = "short interview"),
    choutd = .replace_labels(
    standardized_value_labels$choutd,
    `-5` = "na, see I/JRMCH",
    `-2` = "na, not any chronic disease"
  ),
    choutd01 = .replace_labels(
    standardized_value_labels$choutd01,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd02 = .replace_labels(
    standardized_value_labels$choutd02,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd03 = .replace_labels(
    standardized_value_labels$choutd03,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd04 = .replace_labels(
    standardized_value_labels$choutd04,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd05 = .replace_labels(
    standardized_value_labels$choutd05,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd06 = .replace_labels(
    standardized_value_labels$choutd06,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd07 = .replace_labels(
    standardized_value_labels$choutd07,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd08 = .replace_labels(
    standardized_value_labels$choutd08,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd09 = .replace_labels(
    standardized_value_labels$choutd09,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd10 = .replace_labels(
    standardized_value_labels$choutd10,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd11 = .replace_labels(
    standardized_value_labels$choutd11,
    `-2` = "na, see I/JCHOUTD"
  ),
    choutd12 = .replace_labels(
    standardized_value_labels$choutd12,
    `-2` = "na, see I/JCHOUTD"
  ),
    cva01 = .replace_labels(
    standardized_value_labels$cva01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cva02a = .replace_labels(
    standardized_value_labels$cva02a,
    `-2` = "na, see I/JCVA01"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see JCVA02A"
  ),
    cva03m = .replace_labels(
    standardized_value_labels$cva03m,
    `-2` = "na, see JCVA02A"
  ),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe01 = .replace_labels(
    standardized_value_labels$diabe01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see I/JDIABE01"
  ),
    diabe03a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE01",
    `-1` = "na, asked",
    `1` = "none",
    `2` = "insulin injections",
    `3` = "tablets"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe07 = c(
    `-6` = "na, see I/JARTVEI1",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "na, see IHART10",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart01 = .replace_labels(
    standardized_value_labels$hart01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart07j = .replace_labels(
    standardized_value_labels$hart07j,
    `-2` = "na, see JHART05"
  ),
    hart07m = .replace_labels(
    standardized_value_labels$hart07m,
    `-2` = "na, see JHART05"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart14 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see JHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see I/JHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see I/JHART15"
  ),
    hart15b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hbd1 = .replace_labels(
    standardized_value_labels$hbd1,
    `-5` = "na, see I/JRMCH",
    `3` = "R does not know"
  ),
    hbd1a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JHBD1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see I/JHBD1 & I/JHBD1A1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see I/JHBD1"
  ),
    incon10 = .replace_labels(
    standardized_value_labels$incon10,
    `-5` = "na, see I/JRMCH"
  ),
    incon9 = .replace_labels(
    standardized_value_labels$incon9,
    `-5` = "na, see I/JRMCH"
  ),
    kneep1 = .replace_labels(
    standardized_value_labels$kneep1,
    `-5` = "na, see I/JRMCH"
  ),
    kneep2 = .replace_labels(
    standardized_value_labels$kneep2,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep3 = .replace_labels(
    standardized_value_labels$kneep3,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep4 = .replace_labels(
    standardized_value_labels$kneep4,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep5 = .replace_labels(
    standardized_value_labels$kneep5,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep6 = .replace_labels(
    standardized_value_labels$kneep6,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep7 = .replace_labels(
    standardized_value_labels$kneep7,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep8 = .replace_labels(
    standardized_value_labels$kneep8,
    `-2` = "na, see I/JKNEEP1"
  ),
    kneep9 = .replace_labels(
    standardized_value_labels$kneep9,
    `-2` = "na, see I/JKNEEP1"
  ),
    othsi01 = c(`-5` = "na, see I/JRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI01",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "other to be coded"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see I/JOTHSI01"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI07",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "other to be coded"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see I/JOTHSI07"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rh10_1j = c(
    `-3` = "na wrong skip",
    `-2` = "na, see I/JRHEUM10A",
    `-1` = "na, asked",
    `1` = "hip",
    `2` = "knee",
    `3` = "fingers",
    `4` = "hand/wrist",
    `5` = "toes",
    `6` = "foot/ankle",
    `7` = "neck",
    `8` = "back",
    `9` = "shoulder",
    `10` = "other"
  ),
    rh10_1r = .replace_labels(
    standardized_value_labels$rh10_1r,
    `-2` = "na, wrong skip na, see I/JRHEUM10A"
  ),
    rh10_1s = .replace_labels(
    standardized_value_labels$rh10_1s,
    `-2` = "na, see I/JRHEUM10A"
  ),
    rh10_1y1 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A", `-1` = "na, asked"),
    rh10_1y2 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRH10_1S", `-1` = "na, asked"),
    rh10_2j = c(
    `-3` = "na wrong skip",
    `-2` = "na, see JRHEUM10A2",
    `-1` = "na, asked",
    `1` = "hip",
    `2` = "knee",
    `3` = "fingers",
    `4` = "hand/wrist",
    `5` = "toes",
    `6` = "foot/ankle",
    `7` = "neck",
    `8` = "back",
    `9` = "shoulder",
    `10` = "other"
  ),
    rh10_2r = c(
    `-2` = "na, wrong skip na, see I/JRHEUM10A2",
    `-1` = "na, asked",
    `1` = "osteoarthritis/wear and tear/loss of cartilage",
    `2` = "rheumatoid arthritis",
    `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)",
    `4` = "fracture (due to accident)",
    `5` = "pain",
    `6` = "other (unable to stand or walk/immobility/etc)"
  ),
    rh10_2s = .replace_labels(
    standardized_value_labels$rh10_2s,
    `-2` = "na, see I/JRHEUM10A2"
  ),
    rh10_2y1 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A2", `-1` = "na, asked"),
    rh10_2y2 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRH10_2S", `-1` = "na, asked"),
    rh10_3j = c(
    `-3` = "na wrong skip",
    `-2` = "na, see JRHEUM10A3",
    `-1` = "na, asked",
    `1` = "hip",
    `2` = "knee",
    `3` = "fingers",
    `4` = "hand/wrist",
    `5` = "toes",
    `6` = "foot/ankle",
    `7` = "neck",
    `8` = "back",
    `9` = "shoulder",
    `10` = "other"
  ),
    rh10_3r = .replace_labels(
    standardized_value_labels$rh10_3r,
    `-2` = "na, see I/JRHEUM10A3"
  ),
    rh10_3s = .replace_labels(
    standardized_value_labels$rh10_3s,
    `-2` = "na, see I/JRHEUM10A3"
  ),
    rh10_3y1 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRHEUM10A3", `-1` = "na, asked"),
    rh10_3y2 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRH10_3S", `-1` = "na, asked"),
    rheum01 = .replace_labels(
    standardized_value_labels$rheum01,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum02 = .replace_labels(
    standardized_value_labels$rheum02,
    `-5` = "na, see I/JRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum10a = .replace_labels(
    standardized_value_labels$rheum10a,
    `-2` = "na, see I/JRHEUM01"
  ),
    rheum10a2 = .replace_labels(
    standardized_value_labels$rheum10a2,
    `-2` = "na, see I/JRHEUM10A2"
  ),
    rheum10a3 = .replace_labels(
    standardized_value_labels$rheum10a3,
    `-2` = "na, see I/JRHEUM10A2"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see I/JRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8j = .replace_labels(
    standardized_value_labels$rheum8j,
    `-2` = "na, see I/JRHEUM01&02"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see I/JRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9j = .replace_labels(
    standardized_value_labels$rheum9j,
    `-2` = "na, see I/JRHEUM09"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    artve8a = .replace_labels(
    standardized_value_labels$artve8a,
    `-2` = "na, see KARTVEI8"
  ),
    artve8b = .replace_labels(
    standardized_value_labels$artve8b,
    `-2` = "na, see KARTVEI8"
  ),
    artve8c = .replace_labels(
    standardized_value_labels$artve8c,
    `-2` = "na, see KARTVEI8"
  ),
    artve8d = .replace_labels(
    standardized_value_labels$artve8d,
    `-2` = "na, see KARTVEI8"
  ),
    artve8e = .replace_labels(
    standardized_value_labels$artve8e,
    `-2` = "na, see KARTVEI8"
  ),
    artvei1 = .replace_labels(
    standardized_value_labels$artvei1,
    `-5` = "na, see KRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    artvei1b = .replace_labels(
    standardized_value_labels$artvei1b,
    `-1` = "na, asked",
    `3` = "R has complaints, but doctor says no disease",
    `4` = "R says he/she never had the disease"
  ),
    artvei1c = .replace_labels(
    standardized_value_labels$artvei1c,
    `-2` = "na, see KKARTVEI1B",
    `-1` = "na, asked / R does not know"
  ),
    artvei1d = .replace_labels(
    standardized_value_labels$artvei1d,
    `-2` = "na, see KARTVE1B",
    `7` = "R does not know"
  ),
    artvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    artvei5 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KARTVEI5",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    artvei8 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cance1x = .replace_labels(
    standardized_value_labels$cance1x,
    `-8` = "na, technical error",
    `-2` = "na, see KCANCER1"
  ),
    cance5a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5c = c(
    `-7` = "tumor, uterus not asked, male",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5d = c(
    `-7` = "tumor, uterus not asked, male",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5f = c(
    `-7` = "tumor, prostate not asked, female",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5j = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5k = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5l = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance5x = .replace_labels(
    standardized_value_labels$cance5x,
    `-2` = "na, see KCANCER5"
  ),
    cance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance6f = .replace_labels(
    standardized_value_labels$cance6f,
    `-2` = "na, see KCANCER6"
  ),
    cance7a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cance7d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    cancer1 = .replace_labels(
    standardized_value_labels$cancer1,
    `-5` = "na, see KRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cancer5 = .replace_labels(
    standardized_value_labels$cancer5,
    `-6` = "na, previous interview no cancer",
    `-2` = "na, see KCANCER1 & KCANCE1X"
  ),
    cancer6 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCANCER1 & KCANCE1X",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    cara01 = .replace_labels(
    standardized_value_labels$cara01,
    `-5` = "na, see KRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cara02 = .replace_labels(
    standardized_value_labels$cara02,
    `-2` = "na, see KCARA01",
    `-1` = "na, asked / R does not know"
  ),
    cara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    cara08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    cara11 = .replace_labels(
    standardized_value_labels$cara11,
    `-2` = "na, see KCARA01"
  ),
    chmodus = c(`-2` = "na, see KRMCH", `1` = "long interview", `2` = "short interview"),
    chol1 = .replace_labels(
    standardized_value_labels$chol1,
    `-5` = "na, see KRMCH",
    `3` = "R does not know"
  ),
    chol2 = .replace_labels(
    standardized_value_labels$chol2,
    `-5` = "na, see KRMCH",
    `3` = "R does not know"
  ),
    choutd = .replace_labels(
    standardized_value_labels$choutd,
    `-5` = "na, see KRMCH",
    `-2` = "na, not any chronic disease"
  ),
    choutd01 = .replace_labels(
    standardized_value_labels$choutd01,
    `-2` = "na, see KCHOUTD"
  ),
    choutd02 = .replace_labels(
    standardized_value_labels$choutd02,
    `-2` = "na, see KCHOUTD"
  ),
    choutd03 = .replace_labels(
    standardized_value_labels$choutd03,
    `-2` = "na, see KCHOUTD"
  ),
    choutd04 = .replace_labels(
    standardized_value_labels$choutd04,
    `-2` = "na, see KCHOUTD"
  ),
    choutd05 = .replace_labels(
    standardized_value_labels$choutd05,
    `-2` = "na, see KCHOUTD"
  ),
    choutd06 = .replace_labels(
    standardized_value_labels$choutd06,
    `-2` = "na, see KCHOUTD"
  ),
    choutd07 = .replace_labels(
    standardized_value_labels$choutd07,
    `-2` = "na, see KCHOUTD"
  ),
    choutd08 = .replace_labels(
    standardized_value_labels$choutd08,
    `-2` = "na, see KCHOUTD"
  ),
    choutd09 = .replace_labels(
    standardized_value_labels$choutd09,
    `-2` = "na, see KCHOUTD"
  ),
    choutd10 = .replace_labels(
    standardized_value_labels$choutd10,
    `-2` = "na, see KCHOUTD"
  ),
    choutd11 = .replace_labels(
    standardized_value_labels$choutd11,
    `-2` = "na, see KCHOUTD"
  ),
    choutd12 = .replace_labels(
    standardized_value_labels$choutd12,
    `-2` = "na, see KCHOUTD"
  ),
    corona1 = .replace_labels(
    standardized_value_labels$corona1,
    `-5` = "na, see KRMCH"
  ),
    corona1_lc1 = .replace_labels(
    standardized_value_labels$corona1_lc1,
    `-2` = "na, see KCORONA1 & KCORONA2"
  ),
    corona1_lc2 = .replace_labels(
    standardized_value_labels$corona1_lc2,
    `-2` = "na, see KCORONA1 & KCORONA2"
  ),
    corona1_lc3 = .replace_labels(
    standardized_value_labels$corona1_lc3,
    `-2` = "na, see KCORONA1 & KCORONA2"
  ),
    corona1_lc4 = .replace_labels(
    standardized_value_labels$corona1_lc4,
    `-2` = "na, see KCORONA1 & KCORONA2"
  ),
    corona1_m = .replace_labels(
    standardized_value_labels$corona1_m,
    `-2` = "na, see KCORONA1"
  ),
    corona1_y = .replace_labels(
    standardized_value_labels$corona1_y,
    `-2` = "na, see KCORONA1"
  ),
    corona2 = .replace_labels(
    standardized_value_labels$corona2,
    `-2` = "na, see KCORONA1"
  ),
    corona2_lc1 = .replace_labels(
    standardized_value_labels$corona2_lc1,
    `-2` = "na, see KCORONA2"
  ),
    corona2_lc2 = .replace_labels(
    standardized_value_labels$corona2_lc2,
    `-2` = "na, see KCORONA2"
  ),
    corona2_lc3 = .replace_labels(
    standardized_value_labels$corona2_lc3,
    `-2` = "na, see KCORONA2"
  ),
    corona2_lc4 = .replace_labels(
    standardized_value_labels$corona2_lc4,
    `-2` = "na, see KCORONA2"
  ),
    corona2_m = .replace_labels(
    standardized_value_labels$corona2_m,
    `-2` = "na, see KCORONA2"
  ),
    corona2_y = .replace_labels(
    standardized_value_labels$corona2_y,
    `-2` = "na, see KCORONA2"
  ),
    cva01 = .replace_labels(
    standardized_value_labels$cva01,
    `-5` = "na, see KRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    cva02a = .replace_labels(
    standardized_value_labels$cva02a,
    `-2` = "na, see KCVA01"
  ),
    cva03j = .replace_labels(
    standardized_value_labels$cva03j,
    `-2` = "na, see KCVA02A"
  ),
    cva03m = .replace_labels(
    standardized_value_labels$cva03m,
    `-2` = "na, see KCVA02A"
  ),
    cva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe01 = .replace_labels(
    standardized_value_labels$diabe01,
    `-5` = "na, see KRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    diabe02 = .replace_labels(
    standardized_value_labels$diabe02,
    `-2` = "na, see KDIABE01"
  ),
    diabe03 = c(`-2` = "na, see KDIABE01", `1` = "no medication use", `2` = "medication use"),
    diabe03a = c(`-2` = "na, see KDIABE03", `0` = "not mentioned", `1` = "mentioned"),
    diabe03b = .replace_labels(
    standardized_value_labels$diabe03b,
    `-2` = "na, see KDIABE03"
  ),
    diabe03c = .replace_labels(
    standardized_value_labels$diabe03c,
    `-2` = "na, see KDIABE03"
  ),
    diabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    diabe07 = c(
    `-6` = "na, see KARTVEI5",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KDIABE07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    diabe11 = c(
    `-6` = "na, see KHART10",
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    diabe12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart01 = .replace_labels(
    standardized_value_labels$hart01,
    `-5` = "na, see KRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    hart02 = .replace_labels(
    standardized_value_labels$hart02,
    `-2` = "na, see KHART01"
  ),
    hart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    hart05 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart10 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes",
    `3` = "no exertion: chest pain",
    `4` = "no exertion: pain legs",
    `5` = "no exertion: shortness of breath",
    `6` = "no exertion: joint complaints",
    `7` = "no exertion: other reason"
  ),
    hart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart12 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    hart14 = .replace_labels(
    standardized_value_labels$hart14,
    `-2` = "na, see KHART01",
    `1` = "no, do not have compression stockings",
    `2` = "no, because of use compression stockings"
  ),
    hart15 = .replace_labels(
    standardized_value_labels$hart15,
    `-2` = "na, see KHART01"
  ),
    hart15a = .replace_labels(
    standardized_value_labels$hart15a,
    `-2` = "na, see KHART15"
  ),
    hart15b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hart15e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KHART15",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    hbd1 = .replace_labels(
    standardized_value_labels$hbd1,
    `-5` = "na, see KRMCH",
    `3` = "R does not know"
  ),
    hbd1a = .replace_labels(
    standardized_value_labels$hbd1a,
    `-5` = "na, see KRMCH",
    `-2` = "na, see KHBD1"
  ),
    hbd2 = .replace_labels(
    standardized_value_labels$hbd2,
    `-2` = "na, see KHBD1 & KHBD1A1"
  ),
    hbd3 = .replace_labels(
    standardized_value_labels$hbd3,
    `-2` = "na, see KHBD1 & KHBD1A"
  ),
    incon10 = .replace_labels(
    standardized_value_labels$incon10,
    `-5` = "na, see KRMCH"
  ),
    incon9 = .replace_labels(
    standardized_value_labels$incon9,
    `-5` = "na, see KRMCH"
  ),
    kneep1 = .replace_labels(
    standardized_value_labels$kneep1,
    `-5` = "na, see KRMCH"
  ),
    kneep2 = .replace_labels(
    standardized_value_labels$kneep2,
    `-2` = "na, see KKNEEP1"
  ),
    kneep3 = .replace_labels(
    standardized_value_labels$kneep3,
    `-2` = "na, see KKNEEP1"
  ),
    kneep4 = .replace_labels(
    standardized_value_labels$kneep4,
    `-2` = "na, see KKNEEP1"
  ),
    kneep5 = .replace_labels(
    standardized_value_labels$kneep5,
    `-2` = "na, see KKNEEP1"
  ),
    kneep6 = .replace_labels(
    standardized_value_labels$kneep6,
    `-2` = "na, see KKNEEP1"
  ),
    kneep7 = .replace_labels(
    standardized_value_labels$kneep7,
    `-2` = "na, see KKNEEP1"
  ),
    kneep8 = .replace_labels(
    standardized_value_labels$kneep8,
    `-2` = "na, see KKNEEP1"
  ),
    kneep9 = .replace_labels(
    standardized_value_labels$kneep9,
    `-2` = "na, see KKNEEP1"
  ),
    othsi01 = c(`-5` = "na, see KRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    othsi02 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KOTHSI01",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "hearing impairment",
    `27` = "gout",
    `28` = "eye complaints/diseases",
    `29` = "Sleep Apnea (OSAS)",
    `30` = "TIA (the past 3 years)",
    `31` = "other to be coded"
  ),
    othsi04 = .replace_labels(
    standardized_value_labels$othsi04,
    `-2` = "na, see KOTHSI01"
  ),
    othsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    othsi07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KOTHSI01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    othsi08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KOTHSI07",
    `-1` = "na, asked",
    `1` = "hypertension",
    `2` = "ulcer stomach or duodenum",
    `3` = "serious intestinal disease",
    `4` = "gall-stones/gall-bladder",
    `5` = "liver disease or cirrhosis",
    `6` = "inguinal hernia",
    `7` = "kidney stone",
    `8` = "kidney disease-serious",
    `9` = "chronic cystitis",
    `10` = "prostate complaints (males)",
    `11` = "prolapse (females)",
    `12` = "thyroid disease",
    `13` = "back problems, hernia",
    `14` = "epilepsy",
    `15` = "dizziness with falling",
    `16` = "migraine",
    `17` = "serious skin disease",
    `18` = "decubitus-ulcer",
    `19` = "allergy/hay-fever",
    `20` = "serious consequences accident",
    `21` = "other serious consequences/burns",
    `22` = "consequences surgery/operations",
    `23` = "disease of nervous system",
    `24` = "Parkinson",
    `25` = "mental problems, incl. depression",
    `26` = "hearing impairment",
    `27` = "gout",
    `28` = "eye complaints/diseases",
    `29` = "Sleep Apnea (OSAS)",
    `30` = "TIA (the past 3 years)",
    `31` = "other to be coded"
  ),
    othsi10 = .replace_labels(
    standardized_value_labels$othsi10,
    `-2` = "na, see KOTHSI07"
  ),
    othsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KOTHSI07",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rh10_1j = c(
    `-3` = "na wrong skip",
    `-2` = "na, see KRHEUM10A",
    `-1` = "na, asked",
    `1` = "hip",
    `2` = "knee",
    `3` = "fingers",
    `4` = "hand/wrist",
    `5` = "toes",
    `6` = "foot/ankle",
    `7` = "neck",
    `8` = "back",
    `9` = "shoulder",
    `10` = "other"
  ),
    rh10_1r = .replace_labels(
    standardized_value_labels$rh10_1r,
    `-2` = "na, wrong skip, na, see KRHEUM10A"
  ),
    rh10_1s = .replace_labels(
    standardized_value_labels$rh10_1s,
    `-2` = "na, see KRHEUM10A"
  ),
    rh10_1y1 = .replace_labels(
    standardized_value_labels$rh10_1y1,
    `-2` = "na, see KRHEUM10A"
  ),
    rh10_1y2 = .replace_labels(
    standardized_value_labels$rh10_1y2,
    `-2` = "na, see KRH10_1S"
  ),
    rh10_2j = c(
    `-3` = "na wrong skip",
    `-2` = "na, see KRHEUM10A2",
    `-1` = "na, asked",
    `1` = "hip",
    `2` = "knee",
    `3` = "fingers",
    `4` = "hand/wrist",
    `5` = "toes",
    `6` = "foot/ankle",
    `7` = "neck",
    `8` = "back",
    `9` = "shoulder",
    `10` = "other"
  ),
    rh10_2r = .replace_labels(
    standardized_value_labels$rh10_2r,
    `-2` = "na, see KRHEUM10A2"
  ),
    rh10_2s = .replace_labels(
    standardized_value_labels$rh10_2s,
    `-2` = "na, see KRHEUM10A2"
  ),
    rh10_2y1 = .replace_labels(
    standardized_value_labels$rh10_2y1,
    `-2` = "na, see KRHEUM10A2"
  ),
    rh10_2y2 = .replace_labels(
    standardized_value_labels$rh10_2y2,
    `-2` = "na, see KRH10_2S"
  ),
    rh10_3j = c(
    `-3` = "na wrong skip",
    `-2` = "na, see JRHEUM10A3",
    `-1` = "na, asked",
    `1` = "hip",
    `2` = "knee",
    `3` = "fingers",
    `4` = "hand/wrist",
    `5` = "toes",
    `6` = "foot/ankle",
    `7` = "neck",
    `8` = "back",
    `9` = "shoulder",
    `10` = "other"
  ),
    rh10_3r = c(
    `-2` = "na, see KRHEUM10A3",
    `-1` = "na, asked",
    `1` = "osteoarthritis/wear and tear/loss of cartilage",
    `2` = "rheumatoid arthritis",
    `3` = "infection (unclear if this is due to osteoarthritis or rheumatoid arthritis)",
    `4` = "fracture (due to accident)",
    `5` = "pain",
    `6` = "other (unable to stand or walk/immobility/etc)"
  ),
    rh10_3s = .replace_labels(
    standardized_value_labels$rh10_3s,
    `-2` = "na, see KRHEUM10A3"
  ),
    rh10_3y1 = .replace_labels(
    standardized_value_labels$rh10_3y1,
    `-2` = "na, see KRHEUM10A3"
  ),
    rh10_3y2 = .replace_labels(
    standardized_value_labels$rh10_3y2,
    `-2` = "na, see KRH10_3S"
  ),
    rheum01 = .replace_labels(
    standardized_value_labels$rheum01,
    `-5` = "na, see KRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum01a = .replace_labels(
    standardized_value_labels$rheum01a,
    `-5` = "na, see KRMCH"
  ),
    rheum02 = .replace_labels(
    standardized_value_labels$rheum02,
    `-5` = "na, see KRMCH",
    `0` = "no",
    `1` = "no, previous interview yes",
    `2` = "yes, previous interview no",
    `3` = "yes, previous interview yes"
  ),
    rheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    rheum06 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum07 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum08 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum09 = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    rheum10a = .replace_labels(
    standardized_value_labels$rheum10a,
    `-2` = "na, see KRHEUM01"
  ),
    rheum10a2 = .replace_labels(
    standardized_value_labels$rheum10a2,
    `-2` = "na, see KRHEUM10A2"
  ),
    rheum10a3 = .replace_labels(
    standardized_value_labels$rheum10a3,
    `-2` = "na, see KRHEUM10A2"
  ),
    rheum12 = .replace_labels(
    standardized_value_labels$rheum12,
    `-2` = "na, see KRHEUM01&02"
  ),
    rheum8a = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8b = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8c = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8d = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8e = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8f = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8g = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8h = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8i = c(
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum8j = .replace_labels(
    standardized_value_labels$rheum8j,
    `-2` = "na, see KRHEUM01&02"
  ),
    rheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see KRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    rheum9j = .replace_labels(
    standardized_value_labels$rheum9j,
    `-2` = "na, see KRHEUM09"
  ),
    rmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test"),
    vaccin = .replace_labels(
    standardized_value_labels$vaccin,
    `-5` = "na, see KRMCH"
  ),
    vaccin_m = .replace_labels(
    standardized_value_labels$vaccin_m,
    `-2` = "na, see KVACCIN"
  ),
    vaccin_y = .replace_labels(
    standardized_value_labels$vaccin_y,
    `-2` = "na, see KVACCIN"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "035", waves = .lasa_wave_rows()) |>
    .override_label(wave = "2B", variable = "diabe6b", override_value = "bbdiabe6b") |>
    .override_label(wave = "3B", variable = "chmodus", override_value = "brchmodus") |>
    .override_label(wave = "MB", variable = "diabe01", override_value = "bdaiabe01") |>
    .override_label(wave = "MB", variable = "rmch", override_value = "bcancer1"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "035", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "035", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "035", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["cance5m"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["cance6g"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["cance5m"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["cance6g"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["trauy"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["trauy"]][fc_labels$value_labels$LASA_Wave == "J"] <- list(NULL)
fc_labels$value_labels[["htraumj"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)

.lasa_fc_035 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

