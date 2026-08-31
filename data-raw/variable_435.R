## LASA filecode 435 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  xartve8a = "Arteries: surgery, bifurcation",
  xartve8b = "Arteries: surgery, femoral",
  xartve8c = "Arteries: surgery, groins",
  xartve8d = "Arteries: surgery, dotter",
  xartve8e = "Arteries: surgery, other",
  xartvei1 = "Arteries: disease or abnormalities",
  xartvei2 = "Arteries: from which age",
  xartvei3 = "Arteries: taking medication",
  xartvei4 = "Arteries: treatment doctor",
  xartvei5 = "Arteries: pain when walking",
  xartvei6 = "Arteries: pain when walking: meters",
  xartvei7 = "Arteries: pain disappears standing still",
  xartvei8 = "Arteries: surgery since last interview",
  xartvei9 = "Arteries: outdoors less often",
  xcance5a = "Cancer: tumor, lungs",
  xcance5b = "Cancer: tumor, breast",
  xcance5c = "Cancer: tumor, uterus",
  xcance5d = "Cancer: tumor, cervix",
  xcance5e = "Cancer: tumor, intestines",
  xcance5f = "Cancer: tumor, prostate",
  xcance5g = "Cancer: tumor, larynx",
  xcance5h = "Cancer: tumor, esophagus",
  xcance5i = "Cancer: tumor, stomach",
  xcance5j = "Cancer: tumor, blood",
  xcance5k = "Cancer: tumor, skin",
  xcance5l = "Cancer: tumor, other",
  xcance5m = "Cancer: tumor, which other",
  xcance6a = "Cancer: metastases, bone/skeleton",
  xcance6b = "Cancer: metastases, liver",
  xcance6c = "Cancer: metastases, brain",
  xcance6d = "Cancer: metastases, lungs",
  xcance6e = "Cancer: metastases, lymph nodes",
  xcance6f = "Cancer: metastases, other",
  xcance6g = "Cancer: metastases, which other",
  xcance7a = "Cancer: surgery, since last interview",
  xcance7b = "Cancer: chemotherapy, since last interview",
  xcance7c = "Cancer: radiotherapy, since last interview",
  xcance7d = "Cancer: alternative treatment, since last interview",
  xcancer1 = "Cancer",
  xcancer2 = "Cancer: from which age",
  xcancer3 = "Cancer: taking medication",
  xcancer4 = "Cancer: treatment doctor",
  xcancer5 = "Cancer: tumor since last interview",
  xcancer6 = "Cancer: metastases since last interview",
  xcancer8 = "Cancer: outdoors less often",
  xcara01 = "CNSLD: asthma, chr bronch, emphysema",
  xcara02 = "CNSLD: from which age",
  xcara03 = "CNSLD: taking medication",
  xcara04 = "CNSLD: treatment doctor",
  xcara05 = "CNSLD: cough almost daily",
  xcara06 = "CNSLD: phlegm almost daily",
  xcara07 = "CNSLD: period increased phlegm past year",
  xcara08 = "CNSLD: shortness of breath sometimes",
  xcara09 = "CNSLD: wheezing breath ever",
  xcara10 = "CNSLD: wheezing breath during rest",
  xcara11 = "CNSLD: disturbed night-rest or sleep",
  xcara12 = "CNSLD: outdoors less often",
  xcva01 = "CVA",
  xcva02 = "CVA: how many times",
  xcva02a = "CVA: stroke since last interview",
  xcva02b = "CVA: number of strokes",
  xcva03 = "CVA: one stroke age",
  xcva03j = "CVA: 1, stroke year",
  xcva03m = "CVA: 1, stroke month",
  xcva04 = "CVA: first stroke age",
  xcva04j = "CVA: > 1, first stroke year",
  xcva04m = "CVA: > 1, first stroke month",
  xcva05 = "CVA: last stroke age",
  xcva05j = "CVA: > 1, last stroke year",
  xcva05m = "CVA: > 1, last stroke month",
  xcva06 = "CVA: taking medication",
  xcva07 = "CVA: treatment doctor",
  xcva08 = "CVA: still problems with arms and legs",
  xcva09 = "CVA: still problems with vision",
  xcva10 = "CVA: still problems speech",
  xcva11 = "CVA: still problems understanding written text",
  xcva12 = "CVA: outdoors less often",
  xdiabe01 = "Diabetes",
  xdiabe02 = "Diabetes: from which age",
  xdiabe03 = "Diabetes: taking medication",
  xdiabe04 = "Diabetes: treatment doctor",
  xdiabe05 = "Diabetes: treatment related eye problems",
  xdiabe06 = "Diabetes: type of treatment eye problems",
  xdiabe07 = "Diabetes: pain when walking",
  xdiabe08 = "Diabetes: pain when walking: number of meter",
  xdiabe09 = "Diabetes: pain disappears standing still",
  xdiabe10 = "Diabetes: pain in legs during rest",
  xdiabe11 = "Diabetes: chest pain during exertion",
  xdiabe12 = "Diabetes: exertion pain disappears in 10 minutes",
  xdiabe13 = "Diabetes: outdoors less often",
  xdiabe6a = "Diabetes: eye probl, laser",
  xdiabe6b = "Diabetes: eye probl, cataract",
  xdiabe6c = "Diabetes: eye probl, other treatment",
  xhart01 = "Heart: heart disease",
  xhart02 = "Heart: from which age",
  xhart03 = "Heart: taking medication",
  xhart04 = "Heart: treatment doctor",
  xhart05 = "Heart: myocardial infarction since last interview",
  xhart06 = "Heart: number of myocardial infarction since last interview",
  xhart07 = "Heart: one infarction age",
  xhart07j = "Heart: one infarction year",
  xhart07m = "Heart: one infarction month",
  xhart08 = "Heart: first infarction age",
  xhart08j = "Heart: >1; first infarction year",
  xhart08m = "Heart: >1; first infarction month",
  xhart09 = "Heart: last infarction age",
  xhart09j = "Heart: >1; last infarction year",
  xhart09m = "Heart: >1; last infarction month",
  xhart10 = "Heart: chest pain during exertion",
  xhart11 = "Heart: exertion pain disappears in 10 minutes",
  xhart12 = "Heart: >1 pillow for shortness of breath",
  xhart13 = "Heart: edema morning; legs, feet, ankles",
  xhart14 = "Heart: edema evening; legs, feet, ankles",
  xhart15 = "Heart: cardiac surgery since last interview",
  xhart15a = "Heart: valves/cardiac surgery since last interview",
  xhart15b = "Heart: bypass/cardiac surgery since last interview",
  xhart15c = "Heart: dotter/cardiac surgery since last interview",
  xhart15d = "Heart: pacemaker/cardiac surgery since last interview",
  xhart15e = "Heart: other/cardiac surgery since last interview",
  xhart16 = "Heart: outdoors less often",
  xhbd1 = "Hypertension",
  xhbd2 = "Hypertension: from which age",
  xhbd2a = "Hypertension: taking medication",
  xhbd3 = "Hypertension: treatment doctor",
  xincon1 = "Incontinence",
  xincon2 = "Incontinence: from which age",
  xincon3 = "Incontinence: taking medication",
  xincon4 = "Incontinence: treatment doctor",
  xincon5 = "Incontinence: how often loss of urine",
  xincon6 = "Incontinence: use special material",
  xincon7 = "Incontinence: surgery since last interview",
  xincon8 = "Incontinence: outdoors less often",
  xothsi01 = "Other1: other chronic diseases",
  xothsi02 = "Other1: disease",
  xothsi04 = "Other1: from which age",
  xothsi05 = "Other1: taking medication",
  xothsi06 = "Other1: treatment doctor",
  xothsi07 = "Other2: other chronic diseases",
  xothsi08 = "Other2: disease",
  xothsi10 = "Other2: from which age",
  xothsi11 = "Other2: taking medication",
  xothsi12 = "Other2: treatment doctor",
  xrheum01 = "Osteoarthritis/rheumatoid arthritis: osteoarthritis",
  xrheum02 = "Osteoarthritis/rheumatoid arthritis: rheumatoid arthritis",
  xrheum03 = "Osteoarthritis/rheumatoid arthritis: from which age",
  xrheum04 = "Osteoarthritis/rheumatoid arthritis: taking medication",
  xrheum05 = "Osteoarthritis/rheumatoid arthritis: treatment doctor",
  xrheum06 = "Osteoarthritis/rheumatoid arthritis: pain in joints past 3 m",
  xrheum07 = "Osteoarthritis/rheumatoid arthritis: morning stiffness joint",
  xrheum08 = "Osteoarthritis/rheumatoid arthritis: swelling joints past month",
  xrheum09 = "Osteoarthritis/rheumatoid arthritis: surgery since last interview",
  xrheum10 = "Osteoarthritis/rheumatoid arthritis: joint prostheses",
  xrheum11 = "Osteoarthritis/rheumatoid arthritis: outdoors less often",
  xrheum12 = "Osteoarthritis/rheumatoid arthritis: observation hands",
  xrheum8a = "Osteoarthritis/rheumatoid arthritis: complaints fingers",
  xrheum8b = "Osteoarthritis/rheumatoid arthritis: complaints hand/wrist",
  xrheum8c = "Osteoarthritis/rheumatoid arthritis: complaints elbows",
  xrheum8d = "Osteoarthritis/rheumatoid arthritis: complaints shoulders",
  xrheum8e = "Osteoarthritis/rheumatoid arthritis: complaints toes",
  xrheum8f = "Osteoarthritis/rheumatoid arthritis: complaints feet/ankles",
  xrheum8g = "Osteoarthritis/rheumatoid arthritis: complaints knees",
  xrheum8h = "Osteoarthritis/rheumatoid arthritis: complaints hip",
  xrheum8i = "Osteoarthritis/rheumatoid arthritis: complaints neck",
  xrheum9a = "Osteoarthritis/rheumatoid arthritis: surgery fingers",
  xrheum9b = "Osteoarthritis/rheumatoid arthritis: surgery hand/wrist",
  xrheum9c = "Osteoarthritis/rheumatoid arthritis: surgery elbows",
  xrheum9d = "Osteoarthritis/rheumatoid arthritis: surgery shoulders",
  xrheum9e = "Osteoarthritis/rheumatoid arthritis: surgery toes since",
  xrheum9f = "Osteoarthritis/rheumatoid arthritis: surgery feet/ankles",
  xrheum9g = "Osteoarthritis/rheumatoid arthritis: surgery knees",
  xrheum9h = "Osteoarthritis/rheumatoid arthritis: surgery hip",
  xrheum9i = "Osteoarthritis/rheumatoid arthritis: surgery neck",
  xrmch = "Reason missing: chronic diseases"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "xartve8a",
    "xartve8b",
    "xartve8c",
    "xartve8d",
    "xartve8e",
    "xartvei1",
    "xartvei2",
    "xartvei3",
    "xartvei4",
    "xartvei5",
    "xartvei6",
    "xartvei7",
    "xartvei8",
    "xartvei9",
    "xcance5a",
    "xcance5b",
    "xcance5c",
    "xcance5d",
    "xcance5e",
    "xcance5f",
    "xcance5g",
    "xcance5h",
    "xcance5i",
    "xcance5j",
    "xcance5k",
    "xcance5l",
    "xcance6a",
    "xcance6b",
    "xcance6c",
    "xcance6d",
    "xcance6e",
    "xcance7a",
    "xcance7b",
    "xcance7c",
    "xcance7d",
    "xcancer1",
    "xcancer2",
    "xcancer3",
    "xcancer4",
    "xcancer6",
    "xcancer8",
    "xcara01",
    "xcara02",
    "xcara03",
    "xcara04",
    "xcara05",
    "xcara06",
    "xcara07",
    "xcara08",
    "xcara09",
    "xcara10",
    "xcara11",
    "xcara12",
    "xcva01",
    "xcva02",
    "xcva03",
    "xcva04",
    "xcva05",
    "xcva06",
    "xcva07",
    "xcva08",
    "xcva09",
    "xcva10",
    "xcva11",
    "xcva12",
    "xdiabe01",
    "xdiabe02",
    "xdiabe03",
    "xdiabe04",
    "xdiabe05",
    "xdiabe06",
    "xdiabe07",
    "xdiabe08",
    "xdiabe09",
    "xdiabe10",
    "xdiabe11",
    "xdiabe12",
    "xdiabe13",
    "xhart01",
    "xhart02",
    "xhart03",
    "xhart04",
    "xhart05",
    "xhart06",
    "xhart07",
    "xhart08",
    "xhart09",
    "xhart10",
    "xhart11",
    "xhart12",
    "xhart13",
    "xhart14",
    "xhart15",
    "xhart15a",
    "xhart15b",
    "xhart15c",
    "xhart15d",
    "xhart15e",
    "xhart16",
    "xincon1",
    "xincon2",
    "xincon3",
    "xincon4",
    "xincon5",
    "xincon6",
    "xincon7",
    "xincon8",
    "xothsi01",
    "xothsi02",
    "xothsi04",
    "xothsi05",
    "xothsi06",
    "xothsi07",
    "xothsi08",
    "xothsi10",
    "xothsi11",
    "xothsi12",
    "xrheum01",
    "xrheum02",
    "xrheum03",
    "xrheum04",
    "xrheum05",
    "xrheum06",
    "xrheum07",
    "xrheum08",
    "xrheum09",
    "xrheum10",
    "xrheum11",
    "xrheum12",
    "xrheum8a",
    "xrheum8b",
    "xrheum8c",
    "xrheum8d",
    "xrheum8e",
    "xrheum8f",
    "xrheum8g",
    "xrheum8h",
    "xrheum8i",
    "xrheum9a",
    "xrheum9b",
    "xrheum9c",
    "xrheum9d",
    "xrheum9e",
    "xrheum9f",
    "xrheum9g",
    "xrheum9h",
    "xrheum9i",
    "xrmch"
  ),
  `C` = c(
    "xartve8a",
    "xartve8b",
    "xartve8c",
    "xartve8d",
    "xartve8e",
    "xartvei1",
    "xartvei2",
    "xartvei3",
    "xartvei4",
    "xartvei5",
    "xartvei6",
    "xartvei7",
    "xartvei8",
    "xartvei9",
    "xcance5a",
    "xcance5b",
    "xcance5c",
    "xcance5d",
    "xcance5e",
    "xcance5f",
    "xcance5g",
    "xcance5h",
    "xcance5i",
    "xcance5j",
    "xcance5k",
    "xcance5l",
    "xcance5m",
    "xcance6a",
    "xcance6b",
    "xcance6c",
    "xcance6d",
    "xcance6e",
    "xcance6f",
    "xcance6g",
    "xcance7a",
    "xcance7b",
    "xcance7c",
    "xcance7d",
    "xcancer1",
    "xcancer2",
    "xcancer3",
    "xcancer4",
    "xcancer5",
    "xcancer6",
    "xcancer8",
    "xcara01",
    "xcara02",
    "xcara03",
    "xcara04",
    "xcara05",
    "xcara06",
    "xcara07",
    "xcara08",
    "xcara09",
    "xcara10",
    "xcara11",
    "xcara12",
    "xcva01",
    "xcva02a",
    "xcva02b",
    "xcva03j",
    "xcva03m",
    "xcva04j",
    "xcva04m",
    "xcva05j",
    "xcva05m",
    "xcva06",
    "xcva07",
    "xcva08",
    "xcva09",
    "xcva10",
    "xcva11",
    "xcva12",
    "xdiabe01",
    "xdiabe02",
    "xdiabe03",
    "xdiabe04",
    "xdiabe05",
    "xdiabe07",
    "xdiabe08",
    "xdiabe09",
    "xdiabe10",
    "xdiabe11",
    "xdiabe12",
    "xdiabe13",
    "xdiabe6a",
    "xdiabe6b",
    "xdiabe6c",
    "xhart01",
    "xhart02",
    "xhart03",
    "xhart04",
    "xhart05",
    "xhart06",
    "xhart07j",
    "xhart07m",
    "xhart08j",
    "xhart08m",
    "xhart09j",
    "xhart09m",
    "xhart10",
    "xhart11",
    "xhart12",
    "xhart13",
    "xhart14",
    "xhart15",
    "xhart15a",
    "xhart15b",
    "xhart15c",
    "xhart15d",
    "xhart15e",
    "xhart16",
    "xhbd1",
    "xhbd2",
    "xhbd2a",
    "xhbd3",
    "xincon1",
    "xincon2",
    "xincon3",
    "xincon4",
    "xincon5",
    "xincon6",
    "xincon7",
    "xincon8",
    "xothsi01",
    "xothsi02",
    "xothsi04",
    "xothsi05",
    "xothsi06",
    "xothsi07",
    "xothsi08",
    "xothsi10",
    "xothsi11",
    "xothsi12",
    "xrheum01",
    "xrheum02",
    "xrheum03",
    "xrheum04",
    "xrheum05",
    "xrheum06",
    "xrheum07",
    "xrheum08",
    "xrheum09",
    "xrheum10",
    "xrheum11",
    "xrheum12",
    "xrheum8a",
    "xrheum8b",
    "xrheum8c",
    "xrheum8d",
    "xrheum8e",
    "xrheum8f",
    "xrheum8g",
    "xrheum8h",
    "xrheum8i",
    "xrheum9a",
    "xrheum9b",
    "xrheum9c",
    "xrheum9d",
    "xrheum9e",
    "xrheum9f",
    "xrheum9g",
    "xrheum9h",
    "xrheum9i",
    "xrmch"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    xartve8a = "Arteries: surgery bifurcation",
    xartve8b = "Arteries: surgery femoral legs",
    xartve8c = "Arteries: surgery femoral groin",
    xartve8d = "Arteries: surgery dotter",
    xartve8e = "Arteries: surgery other",
    xartvei3 = "Arteries: take medicine",
    xartvei8 = "Arteries: surgery",
    xartvei9 = "Arteries: going outdoors less because of these diseases or abnormalities of the arte or blood vessels",
    xcance5a = "Cancer: lungs",
    xcance5b = "Cancer: breast",
    xcance5c = "Cancer: uterus",
    xcance5d = "Cancer: cervix",
    xcance5e = "Cancer: intestines",
    xcance5f = "Cancer: prostate",
    xcance5g = "Cancer: larynx",
    xcance5h = "Cancer: esophagus",
    xcance5i = "Cancer: stomach",
    xcance5j = "Cancer: blood",
    xcance5k = "Cancer: skin",
    xcance5l = "Cancer: other",
    xcance6a = "Cancer: metastases bone/skeleton",
    xcance6b = "Cancer: metastases liver",
    xcance6c = "Cancer: metastases brain",
    xcance6d = "Cancer: metastases lungs",
    xcance6e = "Cancer: metastases other",
    xcance7a = "Cancer: treatment surgery",
    xcance7b = "Cancer: treatment chemotherapy",
    xcance7c = "Cancer: treatment radiotherapy",
    xcance7d = "Cancer: treatment alternative (Moerman etc)",
    xcancer1 = "Cancer: yes/no",
    xcancer3 = "Cancer: take medicine",
    xcancer6 = "Cancer: metastases yes/no",
    xcancer8 = "Cancer: going outdoors less because of cancer",
    xcara03 = "CNSLD: take medicine",
    xcara11 = "CNSLD: disturbed night-rest or sleeping",
    xcara12 = "CNSLD: going outdoors less because of CNSLD",
    xcva01 = "CVA: yes/no",
    xcva06 = "CVA: take medicine",
    xcva12 = "CVA: going outdoors less because of CVA",
    xdiabe01 = "Diabetes: yes/no",
    xdiabe03 = "Diabetes: take medicine",
    xdiabe08 = "Diabetes: pain when walking: no of meter",
    xdiabe13 = "Diabetes: going outdoors less because of diabetes",
    xhart03 = "Heart: take medicine",
    xhart05 = "Heart: myocardial infarction",
    xhart06 = "Heart: myocardial inf no of times",
    xhart15 = "Heart: cardiac surgery",
    xhart15a = "Heart: surgery valves",
    xhart15b = "Heart: surgery bypass",
    xhart15c = "Heart: surgery dotter",
    xhart15d = "Heart: surgery pacemaker",
    xhart15e = "Heart: surgery other",
    xhart16 = "Heart: going outdoors less because of heart disease",
    xincon1 = "Incontinence: yes/no",
    xincon3 = "Incontinence: take medicine",
    xincon7 = "Incontinence: surgery yes/no",
    xincon8 = "Incontinence: going outdoors less because of loss of urine",
    xothsi01 = "Other: other diseases yes/no (first)",
    xothsi02 = "Other: first disease",
    xothsi04 = "Other: from which age (first)",
    xothsi05 = "Other: take medicine (first)",
    xothsi06 = "Other: treatment doctor (first)",
    xothsi07 = "Other: other diseases yes/no (second)",
    xothsi08 = "Other: second disease",
    xothsi10 = "Other: from which age (second)",
    xothsi11 = "Other: take medicine (second)",
    xothsi12 = "Other: treatment doctor (second)",
    xrheum01 = "Rheum/arthrosis: osteoarthritis",
    xrheum02 = "Rheum/arthrosis: rheumatoid arthritis",
    xrheum03 = "Rheum/arthrosis: from which age",
    xrheum04 = "Rheum/arthrosis: take medicine",
    xrheum05 = "Rheum/arthrosis: treatment doctor",
    xrheum06 = "Rheum/arthrosis: pain in joints past 3 months",
    xrheum07 = "Rheum/arthrosis: stiffness joints past 3 month",
    xrheum08 = "Rheum/arthrosis: swelling joints past month",
    xrheum09 = "Rheum/arthrosis: surgery yes/no",
    xrheum10 = "Rheum/arthrosis: joint prostheses",
    xrheum11 = "Rheum/arthrosis: going outdoors less because of complaints of joints",
    xrheum12 = "Rheum/arthrosis: observation hands",
    xrheum8a = "Rheum/arthrosis: complaints fingers",
    xrheum8b = "Rheum/arthrosis: complaints hand/wrist",
    xrheum8c = "Rheum/arthrosis: complaints elbows",
    xrheum8d = "Rheum/arthrosis: complaints shoulders",
    xrheum8e = "Rheum/arthrosis: complaints toes",
    xrheum8f = "Rheum/arthrosis: complaints feet/ankles",
    xrheum8g = "Rheum/arthrosis: complaints knees",
    xrheum8h = "Rheum/arthrosis: complaints hip",
    xrheum8i = "Rheum/arthrosis: complaints neck",
    xrheum9a = "Rheum/arthrosis: surgery fingers",
    xrheum9b = "Rheum/arthrosis: surgery hand/wrist",
    xrheum9c = "Rheum/arthrosis: surgery elbows",
    xrheum9d = "Rheum/arthrosis: surgery shoulders",
    xrheum9e = "Rheum/arthrosis: surgery toes",
    xrheum9f = "Rheum/arthrosis: surgery feet/ankles",
    xrheum9g = "Rheum/arthrosis: surgery knees",
    xrheum9h = "Rheum/arthrosis: surgery hip",
    xrheum9i = "Rheum/arthrosis: surgery neck",
    xrmch = "Reason missing chronic diseases"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    xcva02b = "CVA: no of strokes",
    xdiabe08 = "Diabetes: pain when walking: no of meter",
    xhart05 = "Heart: myocardial infarction since last",
    xhart06 = "Heart: no of myocardial inf since last interview",
    xhart15 = "Heart: cardiac surgery sin 3be last interview",
    xhart15a = "Heart: valves/cardiac surgery since last",
    xhart15b = "Heart: bypass/cardiac surgery since last int.",
    xhart15c = "Heart: dotter/cardiac surgery since last int.",
    xhart15e = "Heart: other/cardiac surgery since last int.",
    xrheum01 = "Osteo/rheum art: osteoarthritis",
    xrheum02 = "Osteo/rheum art: rheumatoid arthritis",
    xrheum03 = "Osteo/rheum art: from which age",
    xrheum04 = "Osteo/rheum art: taking medication",
    xrheum05 = "Osteo/rheum art: treatment doctor",
    xrheum06 = "Osteo/rheum art: pain in joints past 3 m",
    xrheum07 = "Osteo/rheum art: morning stiffness joint",
    xrheum08 = "Osteo/rheum art: swelling joints past month",
    xrheum09 = "Osteo/rheum art: surgery since last int",
    xrheum10 = "Osteo/rheum art: joint prostheses",
    xrheum11 = "Osteo/rheum art: outdoors less often",
    xrheum12 = "Osteo/rheum art: observation hands",
    xrheum8a = "Osteo/rheum art: complaints fingers",
    xrheum8b = "Osteo/rheum art: complaints hand/wrist",
    xrheum8c = "Osteo/rheum art: complaints elbows",
    xrheum8d = "Osteo/rheum art: complaints shoulders",
    xrheum8e = "Osteo/rheum art: complaints toes",
    xrheum8f = "Osteo/rheum art: complaints feet/ankles",
    xrheum8g = "Osteo/rheum art: complaints knees",
    xrheum8h = "Osteo/rheum art: complaints hip",
    xrheum8i = "Osteo/rheum art: complaints neck",
    xrheum9a = "Osteo/rheum art: surgery fingers",
    xrheum9b = "Osteo/rheum art: surgery hand/wrist",
    xrheum9c = "Osteo/rheum art: surgery elbows",
    xrheum9d = "Osteo/rheum art: surgery shoulders",
    xrheum9e = "Osteo/rheum art: surgery toes since",
    xrheum9f = "Osteo/rheum art: surgery feet/ankles",
    xrheum9g = "Osteo/rheum art: surgery knees",
    xrheum9h = "Osteo/rheum art: surgery hip",
    xrheum9i = "Osteo/rheum art: surgery neck",
    xrmch = "Reason missing: chronical diseases"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "mentioned",
  `2` = "yes",
  `3` = "yes, specialist"
)

standardized_value_labels <- list(
  xartve8a = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVEI8",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xartve8b = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVEI8",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xartve8c = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVEI8",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xartve8d = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVEI8",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xartve8e = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVEI8",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xartvei1 = c(
    `-5` = "Arteries: disease or abnormalities status",
    default_missing_labels[c("-1")],
    `0` = "no",
    `1` = "Arteries: disease or abnormalities status",
    `2` = "yes, BARTVEI1 no",
    `3` = "yes, BARTVEI1 yes"
  ),
  xartvei2 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVEI1"
  ),
  xartvei3 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVE1",
    `0` = "no",
    `1` = "Arteries: taking medication status",
    default_answer_labels[c("2")]
  ),
  xartvei4 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVEI1",
    `0` = "no",
    `1` = "Arteries: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xartvei5 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XARTVEI1",
    `0` = "no",
    `1` = "Arteries: pain when walking status",
    default_answer_labels[c("2")]
  ),
  xartvei6 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVEI5"
  ),
  xartvei7 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XARTVEI5",
    `0` = "no",
    `1` = "Arteries: pain disappears standing still status",
    default_answer_labels[c("2")]
  ),
  xartvei8 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XARTVEI1",
    `0` = "no",
    `1` = "Arteries: surgery since last interview status",
    default_answer_labels[c("2")]
  ),
  xartvei9 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Arteries: outdoors less often status",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
  xcance5a = c(
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, lungs status",
    `2` = "mentioned"
  ),
  xcance5b = c(
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, breast status",
    `2` = "mentioned"
  ),
  xcance5c = c(
    `-7` = "not asked, male",
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, uterus status",
    `2` = "mentioned"
  ),
  xcance5d = c(
    `-7` = "not asked, male",
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, cervix status",
    `2` = "mentioned"
  ),
  xcance5e = c(
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, intestines status",
    `2` = "mentioned"
  ),
  xcance5f = c(
    `-7` = "not asked, female",
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, prostate status",
    `2` = "mentioned"
  ),
  xcance5g = c(
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, larynx status",
    `2` = "mentioned"
  ),
  xcance5h = c(
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, esophagus status",
    `2` = "mentioned"
  ),
  xcance5i = c(
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, stomach status",
    `2` = "mentioned"
  ),
  xcance5j = c(
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, blood status",
    `2` = "mentioned"
  ),
  xcance5k = c(
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, skin status",
    `2` = "mentioned"
  ),
  xcance5l = c(
    `-6` = "na, see XCANCER5",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: tumor, other status",
    `2` = "mentioned"
  ),
  xcance5m = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCE5L",
    `0` = "to be coded"
  ),
  xcance6a = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER6",
    `0` = "not mentioned",
    `1` = "Cancer: metastases, bone/skeleton status",
    `2` = "mentioned"
  ),
  xcance6b = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER6",
    `0` = "not mentioned",
    `1` = "Cancer: metastases, liver status",
    `2` = "mentioned"
  ),
  xcance6c = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER6",
    `0` = "not mentioned",
    `1` = "Cancer: metastases, brain status",
    `2` = "mentioned"
  ),
  xcance6d = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER6",
    `0` = "not mentioned",
    `1` = "Cancer: metastases, lungs status",
    `2` = "mentioned"
  ),
  xcance6e = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER6",
    `0` = "not mentioned",
    `1` = "Cancer: metastases, lymph nodes status",
    `2` = "mentioned"
  ),
  xcance6f = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER6",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
  xcance6g = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCE6F",
    `0` = "to be coded"
  ),
  xcance7a = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: surgery, since last interview status",
    `2` = "mentioned"
  ),
  xcance7b = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "Cancer: chemotherapy, since last interview status",
    `0` = "not mentioned",
    `1` = "Cancer: chemotherapy, since last interview status",
    `2` = "mentioned"
  ),
  xcance7c = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "Cancer: radiotherapy, since last interview status",
    `0` = "not mentioned",
    `1` = "Cancer: radiotherapy, since last interview status",
    `2` = "mentioned"
  ),
  xcance7d = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "Cancer: alternative treatment, since last interview status",
    `0` = "not mentioned",
    `1` = "Cancer: alternative treatment, since last interview status",
    `2` = "mentioned"
  ),
  xcancer1 = c(
    `-5` = "Cancer status",
    default_missing_labels[c("-1")],
    `0` = "Cancer status",
    `1` = "Cancer status",
    `2` = "yes, BCANCER1 no",
    `3` = "yes, BCANCER1 yes"
  ),
  xcancer2 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER1"
  ),
  xcancer3 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "no",
    `1` = "Cancer: taking medication status",
    default_answer_labels[c("2")]
  ),
  xcancer4 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "no",
    `1` = "Cancer: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xcancer5 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER1",
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  xcancer6 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCANCER1",
    `0` = "not mentioned",
    `1` = "Cancer: metastases since last interview status",
    default_answer_labels[c("2")]
  ),
  xcancer8 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCANCER1",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
  xcara01 = c(
    `-5` = "CNSLD: asthma, chr bronch, emphysema status",
    default_missing_labels[c("-1")],
    `0` = "no",
    `1` = "CNSLD: asthma, chr bronch, emphysema status",
    `2` = "yes, BCARA01 no",
    `3` = "yes, BCARA01 yes"
  ),
  xcara02 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCARA01"
  ),
  xcara03 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCARA01",
    `0` = "no",
    `1` = "CNSLD: taking medication status",
    default_answer_labels[c("2")]
  ),
  xcara04 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCARA01",
    `0` = "no",
    `1` = "CNSLD: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xcara05 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCARA01",
    `0` = "no",
    `1` = "CNSLD: cough almost daily status",
    default_answer_labels[c("2")]
  ),
  xcara06 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCARA01",
    `0` = "no",
    `1` = "CNSLD: phlegm almost daily status",
    default_answer_labels[c("2")]
  ),
  xcara07 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCARA01",
    `0` = "no",
    `1` = "CNSLD: period increased phlegm past year status",
    default_answer_labels[c("2")]
  ),
  xcara08 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCARA01",
    `0` = "no",
    `1` = "CNSLD: shortness of breath sometimes status",
    default_answer_labels[c("2")],
    `3` = "yes",
    `4` = "yes, at rest"
  ),
  xcara09 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCARA01",
    `0` = "no",
    `1` = "CNSLD: wheezing breath ever status",
    default_answer_labels[c("2")]
  ),
  xcara10 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCARA01",
    `0` = "no",
    `1` = "CNSLD: wheezing breath during rest status",
    default_answer_labels[c("2")]
  ),
  xcara11 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCARA01",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
  xcara12 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCARA01",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
  xcva01 = c(
    `-5` = "CVA status",
    default_missing_labels[c("-1")],
    `0` = "CVA status",
    `1` = "CVA status",
    `2` = "yes, BCVA01 no",
    `3` = "yes, BCVA01 yes"
  ),
  xcva02 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA01",
    `1` = "once",
    `2` = "two times or more"
  ),
  xcva02a = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA01",
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  xcva02b = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02A",
    `1` = "once",
    `2` = "two times or more"
  ),
  xcva03 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02"
  ),
  xcva03j = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02B"
  ),
  xcva03m = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02B"
  ),
  xcva04 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02"
  ),
  xcva04j = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02B"
  ),
  xcva04m = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02B"
  ),
  xcva05 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02"
  ),
  xcva05j = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02B"
  ),
  xcva05m = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA02B"
  ),
  xcva06 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA01",
    `0` = "no",
    `1` = "CVA: taking medication status",
    default_answer_labels[c("2")]
  ),
  xcva07 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA01",
    `0` = "no",
    `1` = "CVA: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xcva08 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCVA01",
    `0` = "no",
    `1` = "CVA: still problems with arms and legs status",
    default_answer_labels[c("2")]
  ),
  xcva09 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCVA01",
    `0` = "no",
    `1` = "CVA: still problems with vision status",
    default_answer_labels[c("2")]
  ),
  xcva10 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCVA01",
    `0` = "no",
    `1` = "CVA: still problems speech status",
    default_answer_labels[c("2")]
  ),
  xcva11 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XCVA01",
    `0` = "no",
    `1` = "CVA: still problems understanding written text status",
    default_answer_labels[c("2")]
  ),
  xcva12 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XCVA01",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
  xdiabe01 = c(
    `-5` = "Diabetes status",
    default_missing_labels[c("-1")],
    `0` = "no",
    `1` = "Diabetes status",
    `2` = "yes, BDIABE01 no",
    `3` = "yes, BDIABE01 yes"
  ),
  xdiabe02 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE01"
  ),
  xdiabe03 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE01",
    `0` = "no",
    `1` = "Diabetes: taking medication status",
    default_answer_labels[c("2")],
    `3` = "yes, tablets only"
  ),
  xdiabe04 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE01",
    `0` = "no",
    `1` = "Diabetes: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xdiabe05 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XDIABE01",
    `0` = "no",
    `1` = "Diabetes: treatment related eye problems status",
    default_answer_labels[c("2")]
  ),
  xdiabe06 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE05",
    `1` = "laser coagulation treatment",
    `2` = "cataract surgery",
    `3` = "both",
    `4` = "other"
  ),
  xdiabe07 = c(
    `-6` = "Diabetes: pain when walking status",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XDIABE01",
    `0` = "no",
    `1` = "Diabetes: pain when walking status",
    default_answer_labels[c("2")]
  ),
  xdiabe08 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE07"
  ),
  xdiabe09 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE07",
    `0` = "no",
    `1` = "Diabetes: pain disappears standing still status",
    default_answer_labels[c("2")]
  ),
  xdiabe10 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XDIABE01",
    `0` = "no",
    `1` = "Diabetes: pain in legs during rest status",
    default_answer_labels[c("2")]
  ),
  xdiabe11 = c(
    `-6` = "Diabetes: chest pain during exertion status",
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XDIABE01",
    `0` = "no",
    `1` = "Diabetes: chest pain during exertion status",
    `2` = "Diabetes: chest pain during exertion status",
    `3` = "Diabetes: chest pain during exertion status",
    `4` = "Diabetes: chest pain during exertion status",
    `5` = "Diabetes: chest pain during exertion status",
    `6` = "Diabetes: chest pain during exertion status",
    `7` = "no exertion: other reason"
  ),
  xdiabe12 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE11",
    `0` = "no",
    `1` = "Diabetes: exertion pain disappears in 10 minutes status",
    default_answer_labels[c("2")]
  ),
  xdiabe13 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE01",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
  xdiabe6a = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE05",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xdiabe6b = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE05",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xdiabe6c = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XDIABE05",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xhart01 = c(
    `-5` = "Heart: heart disease status",
    default_missing_labels[c("-1")],
    `0` = "no",
    `1` = "Heart: heart disease status",
    `2` = "yes, BHART01 no",
    `3` = "yes, BHART01 yes"
  ),
  xhart02 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART01"
  ),
  xhart03 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART01",
    `0` = "no",
    `1` = "Heart: taking medication status",
    default_answer_labels[c("2")]
  ),
  xhart04 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART01",
    `0` = "no",
    `1` = "Heart: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xhart05 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XHART01",
    `0` = "no",
    `1` = "Heart: myocardial infarction since last interview status",
    default_answer_labels[c("2")]
  ),
  xhart06 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART05",
    `1` = "once",
    `2` = "two times or more"
  ),
  xhart07 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART06"
  ),
  xhart07j = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART06"
  ),
  xhart07m = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART06"
  ),
  xhart08 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART06"
  ),
  xhart08j = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART06"
  ),
  xhart08m = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART06"
  ),
  xhart09 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART06"
  ),
  xhart09j = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART06"
  ),
  xhart09m = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART06"
  ),
  xhart10 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XHART01",
    `0` = "no",
    `1` = "Heart: chest pain during exertion status",
    `2` = "Heart: chest pain during exertion status",
    `3` = "Heart: chest pain during exertion status",
    `4` = "Heart: chest pain during exertion status",
    `5` = "Heart: chest pain during exertion status",
    `6` = "Heart: chest pain during exertion status",
    `7` = "no exertion: other reason"
  ),
  xhart11 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART10",
    `0` = "no",
    `1` = "Heart: exertion pain disappears in 10 minutes status",
    default_answer_labels[c("2")]
  ),
  xhart12 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XHART01",
    `0` = "no",
    `1` = "Heart: >1 pillow for shortness of breath status",
    default_answer_labels[c("2")]
  ),
  xhart13 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Heart: edema morning; legs, feet, ankles status",
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  xhart14 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Heart: edema evening; legs, feet, ankles status",
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  xhart15 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Heart: cardiac surgery since last interview status",
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  xhart15a = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART15",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xhart15b = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART15",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xhart15c = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART15",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xhart15d = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART15",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xhart15e = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART15",
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  xhart16 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHART01",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
  xhbd1 = c(
    `-5` = "na, see XRMCH",
    default_missing_labels[c("-1")],
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  xhbd2 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHBD1"
  ),
  xhbd2a = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHBD1",
    `1` = "no",
    default_answer_labels[c("2")]
  ),
  xhbd3 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XHBD1",
    `1` = "no",
    `2` = "yes, family physician",
    default_answer_labels[c("3")]
  ),
  xincon1 = c(
    `-5` = "Incontinence status",
    default_missing_labels[c("-1")],
    `0` = "Incontinence status",
    `1` = "Incontinence status",
    `2` = "yes, BINCON1 no",
    `3` = "yes, BINCON1 yes"
  ),
  xincon2 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XINCON1"
  ),
  xincon3 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XINCON1",
    `0` = "no",
    `1` = "Incontinence: taking medication status",
    default_answer_labels[c("2")]
  ),
  xincon4 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XINCON1",
    `0` = "no",
    `1` = "Incontinence: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xincon5 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XINCON1",
    `1` = "2 times a month or less",
    `2` = "3-4 times a month",
    `3` = "a few times a week",
    `4` = "daily"
  ),
  xincon6 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XINCON1",
    `0` = "no",
    `1` = "Incontinence: use special material status",
    `2` = "Incontinence: use special material status",
    `3` = "yes, most of the time"
  ),
  xincon7 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XINCON1",
    `0` = "no",
    `1` = "Incontinence: surgery since last interview status",
    default_answer_labels[c("2")]
  ),
  xincon8 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XINCON1",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
  xothsi01 = c(
    `-5` = "Other1: other chronic diseases status",
    default_missing_labels[c("-1")],
    `0` = "no",
    `1` = "Other1: other chronic diseases status",
    default_answer_labels[c("2")]
  ),
  xothsi02 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Other1: disease status",
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
    `25` = "eye diseases",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling",
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
  xothsi04 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Other1: from which age status"
  ),
  xothsi05 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Other1: taking medication status",
    `0` = "no",
    `1` = "Other1: taking medication status",
    default_answer_labels[c("2")]
  ),
  xothsi06 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Other1: treatment doctor status",
    `0` = "no",
    `1` = "Other1: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xothsi07 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "Other2: other chronic diseases status",
    `0` = "no",
    `1` = "Other2: other chronic diseases status",
    default_answer_labels[c("2")]
  ),
  xothsi08 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Other2: disease status",
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
    `25` = "eye diseases",
    `26` = "ear diseases/hearing problems",
    `27` = "venous insufficiency/varicose veins",
    `28` = "anaemia",
    `29` = "chronic headaches (no migraine)",
    `30` = "chronic neck-problems",
    `31` = "dizziness without falling",
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
  xothsi10 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Other2: from which age status"
  ),
  xothsi11 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Other2: taking medication status",
    `0` = "no",
    `1` = "Other2: taking medication status",
    default_answer_labels[c("2")]
  ),
  xothsi12 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Other2: treatment doctor status",
    `0` = "no",
    `1` = "Other2: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xrheum01 = c(
    `-5` = "Osteoarthritis/rheumatoid arthritis: osteoarthritis status",
    default_missing_labels[c("-1")],
    `0` = "Osteoarthritis/rheumatoid arthritis: osteoarthritis status",
    `1` = "Osteoarthritis/rheumatoid arthritis: osteoarthritis status",
    `2` = "yes, BRHEUM01 no",
    `3` = "yes, BRHEUM01 yes"
  ),
  xrheum02 = c(
    `-5` = "status category",
    default_missing_labels[c("-1")],
    `0` = "status category",
    `1` = "status category",
    `2` = "yes, BRHEUM02 no",
    `3` = "yes, BRHEUM02 yes"
  ),
  xrheum03 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM01&02"
  ),
  xrheum04 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "Osteoarthritis/rheumatoid arthritis: taking medication status",
    default_answer_labels[c("2")]
  ),
  xrheum05 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "Osteoarthritis/rheumatoid arthritis: treatment doctor status",
    default_answer_labels[c("2", "3")]
  ),
  xrheum06 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "status category",
    default_answer_labels[c("2")]
  ),
  xrheum07 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "status category",
    default_answer_labels[c("2")]
  ),
  xrheum08 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "status category",
    default_answer_labels[c("2")]
  ),
  xrheum09 = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "status category",
    default_answer_labels[c("2")]
  ),
  xrheum10 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "Osteoarthritis/rheumatoid arthritis: joint prostheses status",
    `0` = "not mentioned",
    `1` = "Osteoarthritis/rheumatoid arthritis: joint prostheses status",
    default_answer_labels[c("2")]
  ),
  xrheum11 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
  xrheum12 = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `1` = "rheumatic hands",
    `2` = "no rheumatic hands",
    `3` = "observation not possible"
  ),
  xrheum8a = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "Osteoarthritis/rheumatoid arthritis: complaints fingers status",
    `2` = "mentioned"
  ),
  xrheum8b = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "status category",
    `2` = "mentioned"
  ),
  xrheum8c = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "Osteoarthritis/rheumatoid arthritis: complaints elbows status",
    `2` = "mentioned"
  ),
  xrheum8d = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "status category",
    `2` = "mentioned"
  ),
  xrheum8e = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "Osteoarthritis/rheumatoid arthritis: complaints toes status",
    `2` = "mentioned"
  ),
  xrheum8f = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "status category",
    `2` = "mentioned"
  ),
  xrheum8g = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "Osteoarthritis/rheumatoid arthritis: complaints knees status",
    `2` = "mentioned"
  ),
  xrheum8h = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "Osteoarthritis/rheumatoid arthritis: complaints hip status",
    `2` = "mentioned"
  ),
  xrheum8i = c(
    default_missing_labels[c("-4", "-3", "-1")],
    `-2` = "na, see XRHEUM01&02",
    `0` = "no",
    `1` = "Osteoarthritis/rheumatoid arthritis: complaints neck status",
    `2` = "mentioned"
  ),
  xrheum9a = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM09",
    `0` = "not mentioned",
    `1` = "Osteoarthritis/rheumatoid arthritis: surgery fingers status",
    `2` = "mentioned"
  ),
  xrheum9b = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM09",
    `0` = "not mentioned",
    `1` = "Osteoarthritis/rheumatoid arthritis: surgery hand/wrist status",
    `2` = "mentioned"
  ),
  xrheum9c = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM09",
    `0` = "not mentioned",
    `1` = "Osteoarthritis/rheumatoid arthritis: surgery elbows status",
    `2` = "mentioned"
  ),
  xrheum9d = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM09",
    `0` = "not mentioned",
    `1` = "Osteoarthritis/rheumatoid arthritis: surgery shoulders status",
    `2` = "mentioned"
  ),
  xrheum9e = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM09",
    `0` = "not mentioned",
    `1` = "Osteoarthritis/rheumatoid arthritis: surgery toes since status",
    `2` = "mentioned"
  ),
  xrheum9f = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM09",
    `0` = "not mentioned",
    `1` = "status category",
    `2` = "mentioned"
  ),
  xrheum9g = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM09",
    `0` = "not mentioned",
    `1` = "Osteoarthritis/rheumatoid arthritis: surgery knees status",
    `2` = "mentioned"
  ),
  xrheum9h = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM09",
    `0` = "not mentioned",
    `1` = "Osteoarthritis/rheumatoid arthritis: surgery hip status",
    `2` = "mentioned"
  ),
  xrheum9i = c(
    default_missing_labels[c("-3", "-1")],
    `-2` = "na, see XRHEUM09",
    `0` = "not mentioned",
    `1` = "Osteoarthritis/rheumatoid arthritis: surgery neck status",
    `2` = "mentioned"
  ),
  xrmch = c(
    `-2` = "valid data",
    `1` = "interview terminated",
    `2` = "Reason missing: chronic diseases status",
    `4` = "refused test"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    xartve8a = .replace_labels(
    standardized_value_labels$xartve8a,
    `-2` = "na, see BARTVEI8"
  ),
    xartve8b = .replace_labels(
    standardized_value_labels$xartve8b,
    `-2` = "na, see BARTVEI8"
  ),
    xartve8c = .replace_labels(
    standardized_value_labels$xartve8c,
    `-2` = "na, see BARTVEI8"
  ),
    xartve8d = .replace_labels(
    standardized_value_labels$xartve8d,
    `-2` = "na, see BARTVEI8"
  ),
    xartve8e = .replace_labels(
    standardized_value_labels$xartve8e,
    `-2` = "na, see BARTVEI8"
  ),
    xartvei1 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xartvei2 = .replace_labels(
    standardized_value_labels$xartvei2,
    `-2` = "na, see BARTVEI1"
  ),
    xartvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVE1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xartvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xartvei5 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xartvei6 = .replace_labels(
    standardized_value_labels$xartvei6,
    `-2` = "na, see BARTVEI5"
  ),
    xartvei7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI5",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xartvei8 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BARTVEI1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xartvei9 = .replace_labels(
    standardized_value_labels$xartvei9,
    `-2` = "ries na, see BARTVEI1"
  ),
    xcance5a = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5b = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5c = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5d = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5e = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5f = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5g = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5h = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5i = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5j = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5k = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance5l = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER6",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance7a = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance7b = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance7c = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcance7d = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcancer1 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xcancer2 = .replace_labels(
    standardized_value_labels$xcancer2,
    `-2` = "na, see BCANCER1"
  ),
    xcancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xcancer6 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCANCER1",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xcancer8 = .replace_labels(
    standardized_value_labels$xcancer8,
    `-2` = "na, see BCANCER1"
  ),
    xcara01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xcara02 = .replace_labels(
    standardized_value_labels$xcara02,
    `-2` = "na, see BCARA01"
  ),
    xcara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xcara05 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcara06 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcara07 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcara08 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, with heavy exertion",
    `2` = "yes, with light exertion",
    `3` = "yes, at rest"
  ),
    xcara09 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcara10 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCARA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcara11 = .replace_labels(
    standardized_value_labels$xcara11,
    `-2` = "na, see BCARA01"
  ),
    xcara12 = .replace_labels(
    standardized_value_labels$xcara12,
    `-2` = "na, see BCARA01"
  ),
    xcva01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xcva02 = .replace_labels(
    standardized_value_labels$xcva02,
    `-2` = "na, see BCVA01"
  ),
    xcva03 = .replace_labels(
    standardized_value_labels$xcva03,
    `-2` = "na, see BCVA02"
  ),
    xcva04 = .replace_labels(
    standardized_value_labels$xcva04,
    `-2` = "na, see BCVA02"
  ),
    xcva05 = .replace_labels(
    standardized_value_labels$xcva05,
    `-2` = "na, see BCVA02"
  ),
    xcva06 = c(`-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xcva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xcva08 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcva09 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcva10 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcva11 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BCVA01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xcva12 = .replace_labels(
    standardized_value_labels$xcva12,
    `-2` = "na, see BCVA01"
  ),
    xdiabe01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xdiabe02 = .replace_labels(
    standardized_value_labels$xdiabe02,
    `-2` = "na, see BDIABE01"
  ),
    xdiabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, insulin injections",
    `2` = "yes, tablets only"
  ),
    xdiabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xdiabe05 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xdiabe06 = .replace_labels(
    standardized_value_labels$xdiabe06,
    `-2` = "na, see BDIABE05"
  ),
    xdiabe07 = c(
    `-6` = "already asked BARTVEI5",
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xdiabe08 = .replace_labels(
    standardized_value_labels$xdiabe08,
    `-2` = "na, see BDIABE07"
  ),
    xdiabe09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE07",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xdiabe10 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xdiabe11 = c(
    `-6` = "already asked BHART10",
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
    xdiabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BDIABE11",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xdiabe13 = .replace_labels(
    standardized_value_labels$xdiabe13,
    `-2` = "na, see BDIABE01"
  ),
    xhart01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xhart02 = .replace_labels(
    standardized_value_labels$xhart02,
    `-2` = "na, see BHART01"
  ),
    xhart03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xhart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xhart05 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xhart06 = .replace_labels(
    standardized_value_labels$xhart06,
    `-2` = "na, see BHART05"
  ),
    xhart07 = .replace_labels(
    standardized_value_labels$xhart07,
    `-2` = "na, see BHART06"
  ),
    xhart08 = .replace_labels(
    standardized_value_labels$xhart08,
    `-2` = "na, see BHART06"
  ),
    xhart09 = .replace_labels(
    standardized_value_labels$xhart09,
    `-2` = "na, see BHART06"
  ),
    xhart10 = c(
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
    xhart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART10",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xhart12 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BHART01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xhart13 = c(`-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked"),
    xhart14 = c(`-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked"),
    xhart15 = c(`-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked"),
    xhart15a = .replace_labels(
    standardized_value_labels$xhart15a,
    `-2` = "na, see BHART15"
  ),
    xhart15b = .replace_labels(
    standardized_value_labels$xhart15b,
    `-2` = "na, see BHART15"
  ),
    xhart15c = .replace_labels(
    standardized_value_labels$xhart15c,
    `-2` = "na, see BHART15"
  ),
    xhart15d = .replace_labels(
    standardized_value_labels$xhart15d,
    `-2` = "na, see BHART15"
  ),
    xhart15e = .replace_labels(
    standardized_value_labels$xhart15e,
    `-2` = "na, see BHART15"
  ),
    xhart16 = .replace_labels(
    standardized_value_labels$xhart16,
    `-2` = "na, see BHART01"
  ),
    xincon1 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xincon2 = .replace_labels(
    standardized_value_labels$xincon2,
    `-2` = "na, see BINCON1"
  ),
    xincon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xincon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xincon5 = .replace_labels(
    standardized_value_labels$xincon5,
    `-2` = "na, see BINCON1"
  ),
    xincon6 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "only by certain occasion",
    `2` = "yes, most of the time"
  ),
    xincon7 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BINCON1",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xincon8 = .replace_labels(
    standardized_value_labels$xincon8,
    `-2` = "na, see BINCON1"
  ),
    xothsi01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xothsi02 = .replace_labels(
    standardized_value_labels$xothsi02,
    `-2` = "na, see BOTHSI01"
  ),
    xothsi04 = .replace_labels(
    standardized_value_labels$xothsi04,
    `-2` = "na, see BOTHSI01"
  ),
    xothsi05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xothsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xothsi07 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI01",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xothsi08 = .replace_labels(
    standardized_value_labels$xothsi08,
    `-2` = "na, see BOTHSI07"
  ),
    xothsi10 = .replace_labels(
    standardized_value_labels$xothsi10,
    `-2` = "na, see BOTHSI07"
  ),
    xothsi11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI07",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xothsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BOTHSI07",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xrheum01 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xrheum02 = c(`-5` = "na, interview terminated", `-1` = "na, asked", `0` = "no", `1` = "yes"),
    xrheum03 = .replace_labels(
    standardized_value_labels$xrheum03,
    `-2` = "na, see BRHEUM01&02"
  ),
    xrheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes, family physician",
    `2` = "yes, specialist"
  ),
    xrheum06 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum07 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum08 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum09 = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrheum11 = .replace_labels(
    standardized_value_labels$xrheum11,
    `-2` = "na, see BRHEUM01&02"
  ),
    xrheum12 = .replace_labels(
    standardized_value_labels$xrheum12,
    `-2` = "na, see BRHEUM01&02"
  ),
    xrheum8a = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum8b = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum8c = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum8d = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum8e = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum8f = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum8g = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum8h = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum8i = c(
    `-4` = "na, short version",
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM01&02",
    `-1` = "na, asked",
    `0` = "no",
    `1` = "yes"
  ),
    xrheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRHEUM09",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    xrmch = c(`-2` = "valid data", `1` = "terminated interview", `2` = "short interview")
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    xartve8a = .replace_labels(
    standardized_value_labels$xartve8a,
    `-2` = "na, see CARTVEI8"
  ),
    xartve8b = .replace_labels(
    standardized_value_labels$xartve8b,
    `-2` = "na, see CARTVEI8"
  ),
    xartve8c = .replace_labels(
    standardized_value_labels$xartve8c,
    `-2` = "na, see CARTVEI8"
  ),
    xartve8d = .replace_labels(
    standardized_value_labels$xartve8d,
    `-2` = "na, see CARTVEI8"
  ),
    xartve8e = .replace_labels(
    standardized_value_labels$xartve8e,
    `-2` = "na, see CARTVEI8"
  ),
    xartvei1 = .replace_labels(
    standardized_value_labels$xartvei1,
    `-5` = "na, see CRMCH",
    `0` = "no, never",
    `1` = "no, BARTVEI1 yes"
  ),
    xartvei2 = .replace_labels(
    standardized_value_labels$xartvei2,
    `-2` = "na, see CARTVEI1"
  ),
    xartvei3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CARTVE1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xartvei4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xartvei5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xartvei6 = .replace_labels(
    standardized_value_labels$xartvei6,
    `-2` = "na, see CARTVEI5"
  ),
    xartvei7 = c(`1` = "see cartvei6, no", `2` = "yes"),
    xartvei8 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CARTVEI1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xartvei9 = .replace_labels(
    standardized_value_labels$xartvei9,
    `-2` = "na, see CARTVEI1"
  ),
    xcance5a = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5b = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5c = c(
    `-7` = "not asked, male",
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5d = c(
    `-7` = "not asked, male",
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5e = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5f = c(
    `-7` = "not asked, female",
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5g = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5h = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5i = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5j = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5k = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5l = c(
    `-6` = "na, see CCANCER5",
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance5m = .replace_labels(
    standardized_value_labels$xcance5m,
    `-2` = "na, see CCANCE5L"
  ),
    xcance6a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance6b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance6c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance6d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance6e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance6f = .replace_labels(
    standardized_value_labels$xcance6f,
    `-2` = "na, see CCANCER6"
  ),
    xcance6g = .replace_labels(
    standardized_value_labels$xcance6g,
    `-2` = "na, see CCANCE6F"
  ),
    xcance7a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance7b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance7c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcance7d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER6",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xcancer1 = .replace_labels(
    standardized_value_labels$xcancer1,
    `-5` = "na, see CRMCH",
    `0` = "no never",
    `1` = "no, BCANCER1 yes"
  ),
    xcancer2 = .replace_labels(
    standardized_value_labels$xcancer2,
    `-2` = "na, see CCANCER1"
  ),
    xcancer3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xcancer4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xcancer5 = .replace_labels(
    standardized_value_labels$xcancer5,
    `-2` = "na, see CCANCER1"
  ),
    xcancer6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCANCER1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xcancer8 = .replace_labels(
    standardized_value_labels$xcancer8,
    `-2` = "na, see CCANCER1"
  ),
    xcara01 = .replace_labels(
    standardized_value_labels$xcara01,
    `-5` = "na, see CRMCH",
    `0` = "no, never",
    `1` = "no, BCARA01 yes"
  ),
    xcara02 = .replace_labels(
    standardized_value_labels$xcara02,
    `-2` = "na, see CCARA01"
  ),
    xcara03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xcara04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xcara05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xcara06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xcara07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xcara08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, with heavy exertion",
    `3` = "yes, with light exertion",
    `4` = "yes, at rest"
  ),
    xcara09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xcara10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xcara11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCARA01",
    `-1` = "na, asked",
    `1` = "not at all",
    `2` = "sometimes",
    `3` = "often",
    `4` = "always"
  ),
    xcara12 = .replace_labels(
    standardized_value_labels$xcara12,
    `-2` = "na, see CCARA01"
  ),
    xcva01 = .replace_labels(
    standardized_value_labels$xcva01,
    `-5` = "na, see CRMCH",
    `0` = "no never",
    `1` = "no, BCVA01 yes"
  ),
    xcva02a = .replace_labels(
    standardized_value_labels$xcva02a,
    `-2` = "na, see CCVA01"
  ),
    xcva02b = .replace_labels(
    standardized_value_labels$xcva02b,
    `-2` = "na, see CCVA02A"
  ),
    xcva03j = .replace_labels(
    standardized_value_labels$xcva03j,
    `-2` = "na, see CCVA02B"
  ),
    xcva03m = .replace_labels(
    standardized_value_labels$xcva03m,
    `-2` = "na, see CCVA02B"
  ),
    xcva04j = .replace_labels(
    standardized_value_labels$xcva04j,
    `-2` = "na, see CCVA02B"
  ),
    xcva04m = .replace_labels(
    standardized_value_labels$xcva04m,
    `-2` = "na, see CCVA02B"
  ),
    xcva05j = .replace_labels(
    standardized_value_labels$xcva05j,
    `-2` = "na, see CCVA02B"
  ),
    xcva05m = .replace_labels(
    standardized_value_labels$xcva05m,
    `-2` = "na, see CCVA02B"
  ),
    xcva06 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    xcva07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CCVA01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xcva08 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    xcva09 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    xcva10 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    xcva11 = c(`-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    xcva12 = .replace_labels(
    standardized_value_labels$xcva12,
    `-2` = "na, see CCVA01"
  ),
    xdiabe01 = .replace_labels(
    standardized_value_labels$xdiabe01,
    `-5` = "na, see CRMCH",
    `0` = "no, never",
    `1` = "no, BDIABE01 yes"
  ),
    xdiabe02 = .replace_labels(
    standardized_value_labels$xdiabe02,
    `-2` = "na, see CDIABE01"
  ),
    xdiabe03 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, insulin injections",
    `3` = "yes, tablets only"
  ),
    xdiabe04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xdiabe05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xdiabe07 = c(
    `-6` = "na, see CARTVEI1",
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xdiabe08 = .replace_labels(
    standardized_value_labels$xdiabe08,
    `-2` = "na, see CDIABE07"
  ),
    xdiabe09 = c(`1` = "see cdiabe08, no", `2` = "yes"),
    xdiabe10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xdiabe11 = c(
    `-6` = "already asked CHART01",
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
    xdiabe12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CDIABE11",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xdiabe13 = .replace_labels(
    standardized_value_labels$xdiabe13,
    `-2` = "na, see CDIABE01"
  ),
    xdiabe6a = .replace_labels(
    standardized_value_labels$xdiabe6a,
    `-2` = "na, see CDIABE05"
  ),
    xdiabe6b = .replace_labels(
    standardized_value_labels$xdiabe6b,
    `-2` = "na, see CDIABE05"
  ),
    xdiabe6c = .replace_labels(
    standardized_value_labels$xdiabe6c,
    `-2` = "na, see CDIABE05"
  ),
    xhart01 = .replace_labels(
    standardized_value_labels$xhart01,
    `-5` = "na, see CRMCH",
    `0` = "no, never",
    `1` = "no, BHART01 yes"
  ),
    xhart02 = .replace_labels(
    standardized_value_labels$xhart02,
    `-2` = "na, see CHART01"
  ),
    xhart03 = c(`1` = "see chart02, no", `2` = "yes"),
    xhart04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xhart05 = c(`1` = "see chart02, no", `2` = "yes"),
    xhart06 = .replace_labels(
    standardized_value_labels$xhart06,
    `-2` = "na, see CHART05"
  ),
    xhart07j = .replace_labels(
    standardized_value_labels$xhart07j,
    `-2` = "na, see CHART06"
  ),
    xhart07m = .replace_labels(
    standardized_value_labels$xhart07m,
    `-2` = "na, see CHART06"
  ),
    xhart08j = .replace_labels(
    standardized_value_labels$xhart08j,
    `-2` = "na, see CHART06"
  ),
    xhart08m = .replace_labels(
    standardized_value_labels$xhart08m,
    `-2` = "na, see CHART06"
  ),
    xhart09j = .replace_labels(
    standardized_value_labels$xhart09j,
    `-2` = "na, see CHART06"
  ),
    xhart09m = .replace_labels(
    standardized_value_labels$xhart09m,
    `-2` = "na, see CHART06"
  ),
    xhart10 = c(
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
    xhart11 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART10",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xhart12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CHART01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xhart13 = .replace_labels(
    standardized_value_labels$xhart13,
    `-2` = "na, see CHART01"
  ),
    xhart14 = .replace_labels(
    standardized_value_labels$xhart14,
    `-2` = "na, see CHART01"
  ),
    xhart15 = .replace_labels(
    standardized_value_labels$xhart15,
    `-2` = "na, see CHART01"
  ),
    xhart15a = .replace_labels(
    standardized_value_labels$xhart15a,
    `-2` = "na, see CHART15"
  ),
    xhart15b = .replace_labels(
    standardized_value_labels$xhart15b,
    `-2` = "na, see CHART15"
  ),
    xhart15c = .replace_labels(
    standardized_value_labels$xhart15c,
    `-2` = "na, see CHART15"
  ),
    xhart15d = .replace_labels(
    standardized_value_labels$xhart15d,
    `-2` = "na, see CHART15"
  ),
    xhart15e = .replace_labels(
    standardized_value_labels$xhart15e,
    `-2` = "na, see CHART15"
  ),
    xhart16 = .replace_labels(
    standardized_value_labels$xhart16,
    `-2` = "na, see CHART01"
  ),
    xhbd1 = .replace_labels(
    standardized_value_labels$xhbd1,
    `-5` = "na, see CRMCH"
  ),
    xhbd2 = .replace_labels(
    standardized_value_labels$xhbd2,
    `-2` = "na, see CHBD1"
  ),
    xhbd2a = .replace_labels(
    standardized_value_labels$xhbd2a,
    `-2` = "na, see CHBD1"
  ),
    xhbd3 = .replace_labels(
    standardized_value_labels$xhbd3,
    `-2` = "na, see CHBD1"
  ),
    xincon1 = .replace_labels(
    standardized_value_labels$xincon1,
    `-5` = "na, see CRMCH",
    `0` = "no never",
    `1` = "no, BINCON1 yes"
  ),
    xincon2 = .replace_labels(
    standardized_value_labels$xincon2,
    `-2` = "na, see CINCON1"
  ),
    xincon3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xincon4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xincon5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "2 times a month or less",
    `2` = "3-4 times a month",
    `3` = "a few times a week",
    `4` = "daily"
  ),
    xincon6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "only on certain occasion",
    `3` = "yes, most of the time"
  ),
    xincon7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CINCON1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xincon8 = .replace_labels(
    standardized_value_labels$xincon8,
    `-2` = "na, see CINCON1"
  ),
    xothsi01 = c(`-5` = "na, see CRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    xothsi02 = .replace_labels(
    standardized_value_labels$xothsi02,
    `-2` = "na, see COTH1"
  ),
    xothsi04 = .replace_labels(
    standardized_value_labels$xothsi04,
    `-2` = "na, see COTH1"
  ),
    xothsi05 = c(`-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    xothsi06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see COTH1",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xothsi07 = c(`-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    xothsi08 = .replace_labels(
    standardized_value_labels$xothsi08,
    `-2` = "na, see COTH71"
  ),
    xothsi10 = .replace_labels(
    standardized_value_labels$xothsi10,
    `-2` = "na, see COTH71"
  ),
    xothsi11 = c(`-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    xothsi12 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see COTH71",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xrheum01 = .replace_labels(
    standardized_value_labels$xrheum01,
    `-5` = "na, see CRMCH",
    `0` = "no never",
    `1` = "no, BRHEUM01 yes"
  ),
    xrheum02 = .replace_labels(
    standardized_value_labels$xrheum02,
    `-5` = "na, see CRMCH",
    `0` = "no never",
    `1` = "no, BRHEUM02 yes"
  ),
    xrheum03 = .replace_labels(
    standardized_value_labels$xrheum03,
    `-2` = "na, see CRHEUM01&02"
  ),
    xrheum04 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xrheum05 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes, family physician",
    `3` = "yes, specialist"
  ),
    xrheum06 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xrheum07 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xrheum08 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xrheum09 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xrheum10 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    xrheum11 = .replace_labels(
    standardized_value_labels$xrheum11,
    `-2` = "na, see CRHEUM01&02"
  ),
    xrheum12 = .replace_labels(
    standardized_value_labels$xrheum12,
    `-2` = "na, see CRHEUM01&02"
  ),
    xrheum8a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum8b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum8c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum8d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum8e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum8f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum8g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum8h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum8i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM01&02",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum9a = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum9b = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum9c = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum9d = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum9e = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum9f = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum9g = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum9h = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrheum9i = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRHEUM09",
    `-1` = "na, asked",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
    xrmch = c(`-2` = "valid data", `2` = "interview terminated", `4` = "refused test")
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  xartve8a = "categorical",
  xartve8b = "categorical",
  xartve8c = "categorical",
  xartve8d = "categorical",
  xartve8e = "categorical",
  xartvei1 = "categorical",
  xartvei2 = "numeric",
  xartvei3 = "categorical",
  xartvei4 = "categorical",
  xartvei5 = "categorical",
  xartvei6 = "numeric",
  xartvei7 = "categorical",
  xartvei8 = "categorical",
  xartvei9 = "categorical",
  xcance5a = "categorical",
  xcance5b = "categorical",
  xcance5c = "categorical",
  xcance5d = "categorical",
  xcance5e = "categorical",
  xcance5f = "categorical",
  xcance5g = "categorical",
  xcance5h = "categorical",
  xcance5i = "categorical",
  xcance5j = "categorical",
  xcance5k = "categorical",
  xcance5l = "categorical",
  xcance5m = "numeric",
  xcance6a = "categorical",
  xcance6b = "categorical",
  xcance6c = "categorical",
  xcance6d = "categorical",
  xcance6e = "categorical",
  xcance6f = "categorical",
  xcance6g = "numeric",
  xcance7a = "categorical",
  xcance7b = "categorical",
  xcance7c = "categorical",
  xcance7d = "categorical",
  xcancer1 = "categorical",
  xcancer2 = "numeric",
  xcancer3 = "categorical",
  xcancer4 = "categorical",
  xcancer5 = "categorical",
  xcancer6 = "categorical",
  xcancer8 = "categorical",
  xcara01 = "categorical",
  xcara02 = "numeric",
  xcara03 = "categorical",
  xcara04 = "categorical",
  xcara05 = "categorical",
  xcara06 = "categorical",
  xcara07 = "numeric",
  xcara08 = "numeric",
  xcara09 = "categorical",
  xcara10 = "categorical",
  xcara11 = "categorical",
  xcara12 = "categorical",
  xcva01 = "categorical",
  xcva02 = "numeric",
  xcva02a = "categorical",
  xcva02b = "categorical",
  xcva03 = "numeric",
  xcva03j = "numeric",
  xcva03m = "date",
  xcva04 = "numeric",
  xcva04j = "numeric",
  xcva04m = "date",
  xcva05 = "numeric",
  xcva05j = "numeric",
  xcva05m = "date",
  xcva06 = "categorical",
  xcva07 = "categorical",
  xcva08 = "categorical",
  xcva09 = "categorical",
  xcva10 = "categorical",
  xcva11 = "categorical",
  xcva12 = "categorical",
  xdiabe01 = "categorical",
  xdiabe02 = "numeric",
  xdiabe03 = "categorical",
  xdiabe04 = "categorical",
  xdiabe05 = "categorical",
  xdiabe06 = "categorical",
  xdiabe07 = "categorical",
  xdiabe08 = "numeric",
  xdiabe09 = "categorical",
  xdiabe10 = "categorical",
  xdiabe11 = "categorical",
  xdiabe12 = "numeric",
  xdiabe13 = "categorical",
  xdiabe6a = "categorical",
  xdiabe6b = "categorical",
  xdiabe6c = "categorical",
  xhart01 = "categorical",
  xhart02 = "numeric",
  xhart03 = "categorical",
  xhart04 = "categorical",
  xhart05 = "categorical",
  xhart06 = "numeric",
  xhart07 = "numeric",
  xhart07j = "numeric",
  xhart07m = "date",
  xhart08 = "numeric",
  xhart08j = "numeric",
  xhart08m = "date",
  xhart09 = "numeric",
  xhart09j = "numeric",
  xhart09m = "date",
  xhart10 = "categorical",
  xhart11 = "numeric",
  xhart12 = "categorical",
  xhart13 = "categorical",
  xhart14 = "categorical",
  xhart15 = "categorical",
  xhart15a = "categorical",
  xhart15b = "categorical",
  xhart15c = "categorical",
  xhart15d = "categorical",
  xhart15e = "categorical",
  xhart16 = "categorical",
  xhbd1 = "categorical",
  xhbd2 = "numeric",
  xhbd2a = "categorical",
  xhbd3 = "categorical",
  xincon1 = "categorical",
  xincon2 = "numeric",
  xincon3 = "categorical",
  xincon4 = "categorical",
  xincon5 = "categorical",
  xincon6 = "categorical",
  xincon7 = "categorical",
  xincon8 = "categorical",
  xothsi01 = "categorical",
  xothsi02 = "categorical",
  xothsi04 = "numeric",
  xothsi05 = "categorical",
  xothsi06 = "categorical",
  xothsi07 = "categorical",
  xothsi08 = "categorical",
  xothsi10 = "numeric",
  xothsi11 = "categorical",
  xothsi12 = "categorical",
  xrheum01 = "categorical",
  xrheum02 = "categorical",
  xrheum03 = "numeric",
  xrheum04 = "categorical",
  xrheum05 = "categorical",
  xrheum06 = "date",
  xrheum07 = "date",
  xrheum08 = "date",
  xrheum09 = "categorical",
  xrheum10 = "categorical",
  xrheum11 = "categorical",
  xrheum12 = "categorical",
  xrheum8a = "categorical",
  xrheum8b = "categorical",
  xrheum8c = "categorical",
  xrheum8d = "categorical",
  xrheum8e = "categorical",
  xrheum8f = "categorical",
  xrheum8g = "categorical",
  xrheum8h = "categorical",
  xrheum8i = "categorical",
  xrheum9a = "categorical",
  xrheum9b = "categorical",
  xrheum9c = "categorical",
  xrheum9d = "categorical",
  xrheum9e = "categorical",
  xrheum9f = "categorical",
  xrheum9g = "categorical",
  xrheum9h = "categorical",
  xrheum9i = "categorical",
  xrmch = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "435", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "xartve8a", override_value = "xartve8a") |>
    .override_label(wave = "B", variable = "xartve8b", override_value = "xartve8b") |>
    .override_label(wave = "B", variable = "xartve8c", override_value = "xartve8c") |>
    .override_label(wave = "B", variable = "xartve8d", override_value = "xartve8d") |>
    .override_label(wave = "B", variable = "xartve8e", override_value = "xartve8e") |>
    .override_label(wave = "B", variable = "xartvei1", override_value = "xartvei1") |>
    .override_label(wave = "B", variable = "xartvei2", override_value = "xartvei2") |>
    .override_label(wave = "B", variable = "xartvei3", override_value = "xartvei3") |>
    .override_label(wave = "B", variable = "xartvei4", override_value = "xartvei4") |>
    .override_label(wave = "B", variable = "xartvei5", override_value = "xartvei5") |>
    .override_label(wave = "B", variable = "xartvei6", override_value = "xartvei6") |>
    .override_label(wave = "B", variable = "xartvei7", override_value = "xartvei7") |>
    .override_label(wave = "B", variable = "xartvei8", override_value = "xartvei8") |>
    .override_label(wave = "B", variable = "xartvei9", override_value = "xartvei9") |>
    .override_label(wave = "B", variable = "xcance5a", override_value = "xcance5a") |>
    .override_label(wave = "B", variable = "xcance5b", override_value = "xcance5b") |>
    .override_label(wave = "B", variable = "xcance5c", override_value = "xcance5c") |>
    .override_label(wave = "B", variable = "xcance5d", override_value = "xcance5d") |>
    .override_label(wave = "B", variable = "xcance5e", override_value = "xcance5e") |>
    .override_label(wave = "B", variable = "xcance5f", override_value = "xcance5f") |>
    .override_label(wave = "B", variable = "xcance5g", override_value = "xcance5g") |>
    .override_label(wave = "B", variable = "xcance5h", override_value = "xcance5h") |>
    .override_label(wave = "B", variable = "xcance5i", override_value = "xcance5i") |>
    .override_label(wave = "B", variable = "xcance5j", override_value = "xcance5j") |>
    .override_label(wave = "B", variable = "xcance5k", override_value = "xcance5k") |>
    .override_label(wave = "B", variable = "xcance5l", override_value = "xcance5l") |>
    .override_label(wave = "B", variable = "xcance6a", override_value = "xcance6a") |>
    .override_label(wave = "B", variable = "xcance6b", override_value = "xcance6b") |>
    .override_label(wave = "B", variable = "xcance6c", override_value = "xcance6c") |>
    .override_label(wave = "B", variable = "xcance6d", override_value = "xcance6d") |>
    .override_label(wave = "B", variable = "xcance6e", override_value = "xcance6e") |>
    .override_label(wave = "B", variable = "xcance7a", override_value = "xcance7a") |>
    .override_label(wave = "B", variable = "xcance7b", override_value = "xcance7b") |>
    .override_label(wave = "B", variable = "xcance7c", override_value = "xcance7c") |>
    .override_label(wave = "B", variable = "xcance7d", override_value = "xcance7d") |>
    .override_label(wave = "B", variable = "xcancer1", override_value = "xcancer1") |>
    .override_label(wave = "B", variable = "xcancer2", override_value = "xcancer2") |>
    .override_label(wave = "B", variable = "xcancer3", override_value = "xcancer3") |>
    .override_label(wave = "B", variable = "xcancer4", override_value = "xcancer4") |>
    .override_label(wave = "B", variable = "xcancer6", override_value = "xcancer6") |>
    .override_label(wave = "B", variable = "xcancer8", override_value = "xcancer8") |>
    .override_label(wave = "B", variable = "xcara01", override_value = "xcara01") |>
    .override_label(wave = "B", variable = "xcara02", override_value = "xcara02") |>
    .override_label(wave = "B", variable = "xcara03", override_value = "xcara03") |>
    .override_label(wave = "B", variable = "xcara04", override_value = "xcara04") |>
    .override_label(wave = "B", variable = "xcara05", override_value = "xcara05") |>
    .override_label(wave = "B", variable = "xcara06", override_value = "xcara06") |>
    .override_label(wave = "B", variable = "xcara07", override_value = "xcara07") |>
    .override_label(wave = "B", variable = "xcara08", override_value = "xcara08") |>
    .override_label(wave = "B", variable = "xcara09", override_value = "xcara09") |>
    .override_label(wave = "B", variable = "xcara10", override_value = "xcara10") |>
    .override_label(wave = "B", variable = "xcara11", override_value = "xcara11") |>
    .override_label(wave = "B", variable = "xcara12", override_value = "xcara12") |>
    .override_label(wave = "B", variable = "xcva01", override_value = "xcva01") |>
    .override_label(wave = "B", variable = "xcva02", override_value = "xcva02") |>
    .override_label(wave = "B", variable = "xcva03", override_value = "xcva03") |>
    .override_label(wave = "B", variable = "xcva04", override_value = "xcva04") |>
    .override_label(wave = "B", variable = "xcva05", override_value = "xcva05") |>
    .override_label(wave = "B", variable = "xcva06", override_value = "xcva06") |>
    .override_label(wave = "B", variable = "xcva07", override_value = "xcva07") |>
    .override_label(wave = "B", variable = "xcva08", override_value = "xcva08") |>
    .override_label(wave = "B", variable = "xcva09", override_value = "xcva09") |>
    .override_label(wave = "B", variable = "xcva10", override_value = "xcva10") |>
    .override_label(wave = "B", variable = "xcva11", override_value = "xcva11") |>
    .override_label(wave = "B", variable = "xcva12", override_value = "xcva12") |>
    .override_label(wave = "B", variable = "xdiabe01", override_value = "xdiabe01") |>
    .override_label(wave = "B", variable = "xdiabe02", override_value = "xdiabe02") |>
    .override_label(wave = "B", variable = "xdiabe03", override_value = "xdiabe03") |>
    .override_label(wave = "B", variable = "xdiabe04", override_value = "xdiabe04") |>
    .override_label(wave = "B", variable = "xdiabe05", override_value = "xdiabe05") |>
    .override_label(wave = "B", variable = "xdiabe06", override_value = "xdiabe06") |>
    .override_label(wave = "B", variable = "xdiabe07", override_value = "xdiabe07") |>
    .override_label(wave = "B", variable = "xdiabe08", override_value = "xdiabe08") |>
    .override_label(wave = "B", variable = "xdiabe09", override_value = "xdiabe09") |>
    .override_label(wave = "B", variable = "xdiabe10", override_value = "xdiabe10") |>
    .override_label(wave = "B", variable = "xdiabe11", override_value = "xdiabe11") |>
    .override_label(wave = "B", variable = "xdiabe12", override_value = "xdiabe12") |>
    .override_label(wave = "B", variable = "xdiabe13", override_value = "xdiabe13") |>
    .override_label(wave = "B", variable = "xhart01", override_value = "xhart01") |>
    .override_label(wave = "B", variable = "xhart02", override_value = "xhart02") |>
    .override_label(wave = "B", variable = "xhart03", override_value = "xhart03") |>
    .override_label(wave = "B", variable = "xhart04", override_value = "xhart04") |>
    .override_label(wave = "B", variable = "xhart05", override_value = "xhart05") |>
    .override_label(wave = "B", variable = "xhart06", override_value = "xhart06") |>
    .override_label(wave = "B", variable = "xhart07", override_value = "xhart07") |>
    .override_label(wave = "B", variable = "xhart08", override_value = "xhart08") |>
    .override_label(wave = "B", variable = "xhart09", override_value = "xhart09") |>
    .override_label(wave = "B", variable = "xhart10", override_value = "xhart10") |>
    .override_label(wave = "B", variable = "xhart11", override_value = "xhart11") |>
    .override_label(wave = "B", variable = "xhart12", override_value = "xhart12") |>
    .override_label(wave = "B", variable = "xhart13", override_value = "xhart13") |>
    .override_label(wave = "B", variable = "xhart14", override_value = "xhart14") |>
    .override_label(wave = "B", variable = "xhart15", override_value = "xhart15") |>
    .override_label(wave = "B", variable = "xhart15a", override_value = "xhart15a") |>
    .override_label(wave = "B", variable = "xhart15b", override_value = "xhart15b") |>
    .override_label(wave = "B", variable = "xhart15c", override_value = "xhart15c") |>
    .override_label(wave = "B", variable = "xhart15d", override_value = "xhart15d") |>
    .override_label(wave = "B", variable = "xhart15e", override_value = "xhart15e") |>
    .override_label(wave = "B", variable = "xhart16", override_value = "xhart16") |>
    .override_label(wave = "B", variable = "xincon1", override_value = "xincon1") |>
    .override_label(wave = "B", variable = "xincon2", override_value = "xincon2") |>
    .override_label(wave = "B", variable = "xincon3", override_value = "xincon3") |>
    .override_label(wave = "B", variable = "xincon4", override_value = "xincon4") |>
    .override_label(wave = "B", variable = "xincon5", override_value = "xincon5") |>
    .override_label(wave = "B", variable = "xincon6", override_value = "xincon6") |>
    .override_label(wave = "B", variable = "xincon7", override_value = "xincon7") |>
    .override_label(wave = "B", variable = "xincon8", override_value = "xincon8") |>
    .override_label(wave = "B", variable = "xothsi01", override_value = "xothsi01") |>
    .override_label(wave = "B", variable = "xothsi02", override_value = "xothsi02") |>
    .override_label(wave = "B", variable = "xothsi04", override_value = "xothsi04") |>
    .override_label(wave = "B", variable = "xothsi05", override_value = "xothsi05") |>
    .override_label(wave = "B", variable = "xothsi06", override_value = "xothsi06") |>
    .override_label(wave = "B", variable = "xothsi07", override_value = "xothsi07") |>
    .override_label(wave = "B", variable = "xothsi08", override_value = "xothsi08") |>
    .override_label(wave = "B", variable = "xothsi10", override_value = "xothsi10") |>
    .override_label(wave = "B", variable = "xothsi11", override_value = "xothsi11") |>
    .override_label(wave = "B", variable = "xothsi12", override_value = "xothsi12") |>
    .override_label(wave = "B", variable = "xrheum01", override_value = "xrheum01") |>
    .override_label(wave = "B", variable = "xrheum02", override_value = "xrheum02") |>
    .override_label(wave = "B", variable = "xrheum03", override_value = "xrheum03") |>
    .override_label(wave = "B", variable = "xrheum04", override_value = "xrheum04") |>
    .override_label(wave = "B", variable = "xrheum05", override_value = "xrheum05") |>
    .override_label(wave = "B", variable = "xrheum06", override_value = "xrheum06") |>
    .override_label(wave = "B", variable = "xrheum07", override_value = "xrheum07") |>
    .override_label(wave = "B", variable = "xrheum08", override_value = "xrheum08") |>
    .override_label(wave = "B", variable = "xrheum09", override_value = "xrheum09") |>
    .override_label(wave = "B", variable = "xrheum10", override_value = "xrheum10") |>
    .override_label(wave = "B", variable = "xrheum11", override_value = "xrheum11") |>
    .override_label(wave = "B", variable = "xrheum12", override_value = "xrheum12") |>
    .override_label(wave = "B", variable = "xrheum8a", override_value = "xrheum8a") |>
    .override_label(wave = "B", variable = "xrheum8b", override_value = "xrheum8b") |>
    .override_label(wave = "B", variable = "xrheum8c", override_value = "xrheum8c") |>
    .override_label(wave = "B", variable = "xrheum8d", override_value = "xrheum8d") |>
    .override_label(wave = "B", variable = "xrheum8e", override_value = "xrheum8e") |>
    .override_label(wave = "B", variable = "xrheum8f", override_value = "xrheum8f") |>
    .override_label(wave = "B", variable = "xrheum8g", override_value = "xrheum8g") |>
    .override_label(wave = "B", variable = "xrheum8h", override_value = "xrheum8h") |>
    .override_label(wave = "B", variable = "xrheum8i", override_value = "xrheum8i") |>
    .override_label(wave = "B", variable = "xrheum9a", override_value = "xrheum9a") |>
    .override_label(wave = "B", variable = "xrheum9b", override_value = "xrheum9b") |>
    .override_label(wave = "B", variable = "xrheum9c", override_value = "xrheum9c") |>
    .override_label(wave = "B", variable = "xrheum9d", override_value = "xrheum9d") |>
    .override_label(wave = "B", variable = "xrheum9e", override_value = "xrheum9e") |>
    .override_label(wave = "B", variable = "xrheum9f", override_value = "xrheum9f") |>
    .override_label(wave = "B", variable = "xrheum9g", override_value = "xrheum9g") |>
    .override_label(wave = "B", variable = "xrheum9h", override_value = "xrheum9h") |>
    .override_label(wave = "B", variable = "xrheum9i", override_value = "xrheum9i") |>
    .override_label(wave = "B", variable = "xrmch", override_value = "xrmch") |>
    .override_label(wave = "C", variable = "xartve8a", override_value = "xartve8a") |>
    .override_label(wave = "C", variable = "xartve8b", override_value = "xartve8b") |>
    .override_label(wave = "C", variable = "xartve8c", override_value = "xartve8c") |>
    .override_label(wave = "C", variable = "xartve8d", override_value = "xartve8d") |>
    .override_label(wave = "C", variable = "xartve8e", override_value = "xartve8e") |>
    .override_label(wave = "C", variable = "xartvei1", override_value = "xartvei1") |>
    .override_label(wave = "C", variable = "xartvei2", override_value = "xartvei2") |>
    .override_label(wave = "C", variable = "xartvei3", override_value = "xartvei3") |>
    .override_label(wave = "C", variable = "xartvei4", override_value = "xartvei4") |>
    .override_label(wave = "C", variable = "xartvei5", override_value = "xartvei5") |>
    .override_label(wave = "C", variable = "xartvei6", override_value = "xartvei6") |>
    .override_label(wave = "C", variable = "xartvei7", override_value = "xartvei7") |>
    .override_label(wave = "C", variable = "xartvei8", override_value = "xartvei8") |>
    .override_label(wave = "C", variable = "xartvei9", override_value = "xartvei9") |>
    .override_label(wave = "C", variable = "xcance5a", override_value = "xcance5a") |>
    .override_label(wave = "C", variable = "xcance5b", override_value = "xcance5b") |>
    .override_label(wave = "C", variable = "xcance5c", override_value = "xcance5c") |>
    .override_label(wave = "C", variable = "xcance5d", override_value = "xcance5d") |>
    .override_label(wave = "C", variable = "xcance5e", override_value = "xcance5e") |>
    .override_label(wave = "C", variable = "xcance5f", override_value = "xcance5f") |>
    .override_label(wave = "C", variable = "xcance5g", override_value = "xcance5g") |>
    .override_label(wave = "C", variable = "xcance5h", override_value = "xcance5h") |>
    .override_label(wave = "C", variable = "xcance5i", override_value = "xcance5i") |>
    .override_label(wave = "C", variable = "xcance5j", override_value = "xcance5j") |>
    .override_label(wave = "C", variable = "xcance5k", override_value = "xcance5k") |>
    .override_label(wave = "C", variable = "xcance5l", override_value = "xcance5l") |>
    .override_label(wave = "C", variable = "xcance5m", override_value = "xcance5m") |>
    .override_label(wave = "C", variable = "xcance6a", override_value = "xcance6a") |>
    .override_label(wave = "C", variable = "xcance6b", override_value = "xcance6b") |>
    .override_label(wave = "C", variable = "xcance6c", override_value = "xcance6c") |>
    .override_label(wave = "C", variable = "xcance6d", override_value = "xcance6d") |>
    .override_label(wave = "C", variable = "xcance6e", override_value = "xcance6e") |>
    .override_label(wave = "C", variable = "xcance6f", override_value = "xcance6f") |>
    .override_label(wave = "C", variable = "xcance6g", override_value = "xcance6g") |>
    .override_label(wave = "C", variable = "xcance7a", override_value = "xcance7a") |>
    .override_label(wave = "C", variable = "xcance7b", override_value = "xcance7b") |>
    .override_label(wave = "C", variable = "xcance7c", override_value = "xcance7c") |>
    .override_label(wave = "C", variable = "xcance7d", override_value = "xcance7d") |>
    .override_label(wave = "C", variable = "xcancer1", override_value = "xcancer1") |>
    .override_label(wave = "C", variable = "xcancer2", override_value = "xcancer2") |>
    .override_label(wave = "C", variable = "xcancer3", override_value = "xcancer3") |>
    .override_label(wave = "C", variable = "xcancer4", override_value = "xcancer4") |>
    .override_label(wave = "C", variable = "xcancer5", override_value = "xcancer5") |>
    .override_label(wave = "C", variable = "xcancer6", override_value = "xcancer6") |>
    .override_label(wave = "C", variable = "xcancer8", override_value = "xcancer8") |>
    .override_label(wave = "C", variable = "xcara01", override_value = "xcara01") |>
    .override_label(wave = "C", variable = "xcara02", override_value = "xcara02") |>
    .override_label(wave = "C", variable = "xcara03", override_value = "xcara03") |>
    .override_label(wave = "C", variable = "xcara04", override_value = "xcara04") |>
    .override_label(wave = "C", variable = "xcara05", override_value = "xcara05") |>
    .override_label(wave = "C", variable = "xcara06", override_value = "xcara06") |>
    .override_label(wave = "C", variable = "xcara07", override_value = "xcara07") |>
    .override_label(wave = "C", variable = "xcara08", override_value = "xcara08") |>
    .override_label(wave = "C", variable = "xcara09", override_value = "xcara09") |>
    .override_label(wave = "C", variable = "xcara10", override_value = "xcara10") |>
    .override_label(wave = "C", variable = "xcara11", override_value = "xcara11") |>
    .override_label(wave = "C", variable = "xcara12", override_value = "xcara12") |>
    .override_label(wave = "C", variable = "xcva01", override_value = "xcva01") |>
    .override_label(wave = "C", variable = "xcva02a", override_value = "xcva02a") |>
    .override_label(wave = "C", variable = "xcva02b", override_value = "xcva02b") |>
    .override_label(wave = "C", variable = "xcva03j", override_value = "xcva03j") |>
    .override_label(wave = "C", variable = "xcva03m", override_value = "xcva03m") |>
    .override_label(wave = "C", variable = "xcva04j", override_value = "xcva04j") |>
    .override_label(wave = "C", variable = "xcva04m", override_value = "xcva04m") |>
    .override_label(wave = "C", variable = "xcva05j", override_value = "xcva05j") |>
    .override_label(wave = "C", variable = "xcva05m", override_value = "xcva05m") |>
    .override_label(wave = "C", variable = "xcva06", override_value = "xcva06") |>
    .override_label(wave = "C", variable = "xcva07", override_value = "xcva07") |>
    .override_label(wave = "C", variable = "xcva08", override_value = "xcva08") |>
    .override_label(wave = "C", variable = "xcva09", override_value = "xcva09") |>
    .override_label(wave = "C", variable = "xcva10", override_value = "xcva10") |>
    .override_label(wave = "C", variable = "xcva11", override_value = "xcva11") |>
    .override_label(wave = "C", variable = "xcva12", override_value = "xcva12") |>
    .override_label(wave = "C", variable = "xdiabe01", override_value = "xdiabe01") |>
    .override_label(wave = "C", variable = "xdiabe02", override_value = "xdiabe02") |>
    .override_label(wave = "C", variable = "xdiabe03", override_value = "xdiabe03") |>
    .override_label(wave = "C", variable = "xdiabe04", override_value = "xdiabe04") |>
    .override_label(wave = "C", variable = "xdiabe05", override_value = "xdiabe05") |>
    .override_label(wave = "C", variable = "xdiabe07", override_value = "xdiabe07") |>
    .override_label(wave = "C", variable = "xdiabe08", override_value = "xdiabe08") |>
    .override_label(wave = "C", variable = "xdiabe09", override_value = "xdiabe09") |>
    .override_label(wave = "C", variable = "xdiabe10", override_value = "xdiabe10") |>
    .override_label(wave = "C", variable = "xdiabe11", override_value = "xdiabe11") |>
    .override_label(wave = "C", variable = "xdiabe12", override_value = "xdiabe12") |>
    .override_label(wave = "C", variable = "xdiabe13", override_value = "xdiabe13") |>
    .override_label(wave = "C", variable = "xdiabe6a", override_value = "xdiabe6a") |>
    .override_label(wave = "C", variable = "xdiabe6b", override_value = "xdiabe6b") |>
    .override_label(wave = "C", variable = "xdiabe6c", override_value = "xdiabe6c") |>
    .override_label(wave = "C", variable = "xhart01", override_value = "xhart01") |>
    .override_label(wave = "C", variable = "xhart02", override_value = "xhart02") |>
    .override_label(wave = "C", variable = "xhart03", override_value = "xhart03") |>
    .override_label(wave = "C", variable = "xhart04", override_value = "xhart04") |>
    .override_label(wave = "C", variable = "xhart05", override_value = "xhart05") |>
    .override_label(wave = "C", variable = "xhart06", override_value = "xhart06") |>
    .override_label(wave = "C", variable = "xhart07j", override_value = "xhart07j") |>
    .override_label(wave = "C", variable = "xhart07m", override_value = "xhart07m") |>
    .override_label(wave = "C", variable = "xhart08j", override_value = "xhart08j") |>
    .override_label(wave = "C", variable = "xhart08m", override_value = "xhart08m") |>
    .override_label(wave = "C", variable = "xhart09j", override_value = "xhart09j") |>
    .override_label(wave = "C", variable = "xhart09m", override_value = "xhart09m") |>
    .override_label(wave = "C", variable = "xhart10", override_value = "xhart10") |>
    .override_label(wave = "C", variable = "xhart11", override_value = "xhart11") |>
    .override_label(wave = "C", variable = "xhart12", override_value = "xhart12") |>
    .override_label(wave = "C", variable = "xhart13", override_value = "xhart13") |>
    .override_label(wave = "C", variable = "xhart14", override_value = "xhart14") |>
    .override_label(wave = "C", variable = "xhart15", override_value = "xhart15") |>
    .override_label(wave = "C", variable = "xhart15a", override_value = "xhart15a") |>
    .override_label(wave = "C", variable = "xhart15b", override_value = "xhart15b") |>
    .override_label(wave = "C", variable = "xhart15c", override_value = "xhart15c") |>
    .override_label(wave = "C", variable = "xhart15d", override_value = "xhart15d") |>
    .override_label(wave = "C", variable = "xhart15e", override_value = "xhart15e") |>
    .override_label(wave = "C", variable = "xhart16", override_value = "xhart16") |>
    .override_label(wave = "C", variable = "xhbd1", override_value = "xhbd1") |>
    .override_label(wave = "C", variable = "xhbd2", override_value = "xhbd2") |>
    .override_label(wave = "C", variable = "xhbd2a", override_value = "xhbd2a") |>
    .override_label(wave = "C", variable = "xhbd3", override_value = "xhbd3") |>
    .override_label(wave = "C", variable = "xincon1", override_value = "xincon1") |>
    .override_label(wave = "C", variable = "xincon2", override_value = "xincon2") |>
    .override_label(wave = "C", variable = "xincon3", override_value = "xincon3") |>
    .override_label(wave = "C", variable = "xincon4", override_value = "xincon4") |>
    .override_label(wave = "C", variable = "xincon5", override_value = "xincon5") |>
    .override_label(wave = "C", variable = "xincon6", override_value = "xincon6") |>
    .override_label(wave = "C", variable = "xincon7", override_value = "xincon7") |>
    .override_label(wave = "C", variable = "xincon8", override_value = "xincon8") |>
    .override_label(wave = "C", variable = "xothsi01", override_value = "xothsi01") |>
    .override_label(wave = "C", variable = "xothsi02", override_value = "xothsi02") |>
    .override_label(wave = "C", variable = "xothsi04", override_value = "xothsi04") |>
    .override_label(wave = "C", variable = "xothsi05", override_value = "xothsi05") |>
    .override_label(wave = "C", variable = "xothsi06", override_value = "xothsi06") |>
    .override_label(wave = "C", variable = "xothsi07", override_value = "xothsi07") |>
    .override_label(wave = "C", variable = "xothsi08", override_value = "xothsi08") |>
    .override_label(wave = "C", variable = "xothsi10", override_value = "xothsi10") |>
    .override_label(wave = "C", variable = "xothsi11", override_value = "xothsi11") |>
    .override_label(wave = "C", variable = "xothsi12", override_value = "xothsi12") |>
    .override_label(wave = "C", variable = "xrheum01", override_value = "xrheum01") |>
    .override_label(wave = "C", variable = "xrheum02", override_value = "xrheum02") |>
    .override_label(wave = "C", variable = "xrheum03", override_value = "xrheum03") |>
    .override_label(wave = "C", variable = "xrheum04", override_value = "xrheum04") |>
    .override_label(wave = "C", variable = "xrheum05", override_value = "xrheum05") |>
    .override_label(wave = "C", variable = "xrheum06", override_value = "xrheum06") |>
    .override_label(wave = "C", variable = "xrheum07", override_value = "xrheum07") |>
    .override_label(wave = "C", variable = "xrheum08", override_value = "xrheum08") |>
    .override_label(wave = "C", variable = "xrheum09", override_value = "xrheum09") |>
    .override_label(wave = "C", variable = "xrheum10", override_value = "xrheum10") |>
    .override_label(wave = "C", variable = "xrheum11", override_value = "xrheum11") |>
    .override_label(wave = "C", variable = "xrheum12", override_value = "xrheum12") |>
    .override_label(wave = "C", variable = "xrheum8a", override_value = "xrheum8a") |>
    .override_label(wave = "C", variable = "xrheum8b", override_value = "xrheum8b") |>
    .override_label(wave = "C", variable = "xrheum8c", override_value = "xrheum8c") |>
    .override_label(wave = "C", variable = "xrheum8d", override_value = "xrheum8d") |>
    .override_label(wave = "C", variable = "xrheum8e", override_value = "xrheum8e") |>
    .override_label(wave = "C", variable = "xrheum8f", override_value = "xrheum8f") |>
    .override_label(wave = "C", variable = "xrheum8g", override_value = "xrheum8g") |>
    .override_label(wave = "C", variable = "xrheum8h", override_value = "xrheum8h") |>
    .override_label(wave = "C", variable = "xrheum8i", override_value = "xrheum8i") |>
    .override_label(wave = "C", variable = "xrheum9a", override_value = "xrheum9a") |>
    .override_label(wave = "C", variable = "xrheum9b", override_value = "xrheum9b") |>
    .override_label(wave = "C", variable = "xrheum9c", override_value = "xrheum9c") |>
    .override_label(wave = "C", variable = "xrheum9d", override_value = "xrheum9d") |>
    .override_label(wave = "C", variable = "xrheum9e", override_value = "xrheum9e") |>
    .override_label(wave = "C", variable = "xrheum9f", override_value = "xrheum9f") |>
    .override_label(wave = "C", variable = "xrheum9g", override_value = "xrheum9g") |>
    .override_label(wave = "C", variable = "xrheum9h", override_value = "xrheum9h") |>
    .override_label(wave = "C", variable = "xrheum9i", override_value = "xrheum9i") |>
    .override_label(wave = "C", variable = "xrmch", override_value = "xrmch"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "435", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "435", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "435", waves = .lasa_wave_rows())
)

.lasa_fc_435 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

