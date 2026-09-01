## LASA filecode 435 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  xrmch = "Reason missing: chronic diseases",
  .applies_to_waves = c("Z")
)

variable_labels(
  "xartvei1", "xartvei2", "xartvei4", "xartvei5", "xartvei6", "xartvei7", "xcancer2", "xcancer4", "xcara01", "xcara02", "xcara04", "xcara05", "xcara06", "xcara07", "xcara08", "xcara09", "xcara10", "xcva07", "xcva08", "xcva09", "xcva10", "xcva11", "xdiabe02", "xdiabe04", "xdiabe05", "xdiabe07", "xdiabe09", "xdiabe10", "xdiabe11", "xdiabe12", "xhart01", "xhart02", "xhart04", "xhart10", "xhart11", "xhart12", "xhart13", "xhart14", "xincon2", "xincon4", "xincon5", "xincon6",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  "xcva02", "xcva03", "xcva04", "xcva05", "xdiabe06", "xhart07", "xhart08", "xhart09",
  .applies_to_waves = c("B")
)

variable_labels(
  "xartve8a", "xartve8b", "xartve8c", "xartve8d", "xartve8e", "xartvei3", "xartvei8", "xartvei9", "xcance5a", "xcance5b", "xcance5c", "xcance5d", "xcance5e", "xcance5f", "xcance5g", "xcance5h", "xcance5i", "xcance5j", "xcance5k", "xcance5l", "xcance5m", "xcance6a", "xcance6b", "xcance6c", "xcance6d", "xcance6e", "xcance6f", "xcance6g", "xcance7a", "xcance7b", "xcance7c", "xcance7d", "xcancer1", "xcancer3", "xcancer5", "xcancer6", "xcancer8", "xcara03", "xcara11", "xcara12", "xcva01", "xcva02a", "xcva03j", "xcva03m", "xcva04j", "xcva04m", "xcva05j", "xcva05m", "xcva06", "xcva12", "xdiabe01", "xdiabe03", "xdiabe13", "xdiabe6a", "xdiabe6b", "xdiabe6c", "xhart03", "xhart07j", "xhart07m", "xhart08j", "xhart08m", "xhart09j", "xhart09m", "xhart15d", "xhart16", "xhbd1", "xhbd2", "xhbd2a", "xhbd3", "xincon1", "xincon3", "xincon7", "xincon8", "xothsi01", "xothsi02", "xothsi04", "xothsi05", "xothsi06", "xothsi07", "xothsi08", "xothsi10", "xothsi11", "xothsi12",
  .applies_to_waves = c("C")
)

variable_labels(
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
  xrmch = "Reason missing chronic diseases",
  .applies_to_waves = c("B")
)

variable_labels(
  xdiabe08 = "Diabetes: pain when walking: no of meter",
  .applies_to_waves = c("B", "C")
)

variable_labels(
  xcva02b = "CVA: no of strokes",
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
  xrmch = "Reason missing: chronical diseases",
  .applies_to_waves = c("C")
)

# define value labels ----
value_labels(
  `-2` = "na, see XCANCER1",
  .applies_to_vars = c("xcance5a", "xcance5b", "xcance5c", "xcance5d", "xcance5e", "xcance5f", "xcance5g", "xcance5h", "xcance5i", "xcance5j", "xcance5k", "xcance5l", "xcance7a", "xcancer2", "xcancer3", "xcancer4", "xcancer5", "xcancer6", "xcancer8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see XCARA01",
  .applies_to_vars = c("xcara02", "xcara03", "xcara04", "xcara05", "xcara06", "xcara07", "xcara08", "xcara09", "xcara10", "xcara11", "xcara12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see XRHEUM01&02",
  .applies_to_vars = c("xrheum03", "xrheum04", "xrheum05", "xrheum06", "xrheum07", "xrheum08", "xrheum09", "xrheum11", "xrheum12", "xrheum8a", "xrheum8b", "xrheum8c", "xrheum8d", "xrheum8e", "xrheum8f", "xrheum8g", "xrheum8h", "xrheum8i"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "na, see XCANCER5",
  .applies_to_vars = c("xcance5a", "xcance5b", "xcance5c", "xcance5d", "xcance5e", "xcance5f", "xcance5g", "xcance5h", "xcance5i", "xcance5j", "xcance5k", "xcance5l"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XARTVEI8", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xartve8a", "xartve8b", "xartve8c", "xartve8d", "xartve8e"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "Arteries: disease or abnormalities status", `-1` = "na, asked", `0` = "no", `1` = "Arteries: disease or abnormalities status", `2` = "yes, BARTVEI1 no", `3` = "yes, BARTVEI1 yes",
  .applies_to_vars = c("xartvei1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XARTVEI1", `-1` = "na, asked",
  .applies_to_vars = c("xartvei2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XARTVE1", `-1` = "na, asked", `0` = "no", `1` = "Arteries: taking medication status", `2` = "yes",
  .applies_to_vars = c("xartvei3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XARTVEI1", `-1` = "na, asked", `0` = "no", `1` = "Arteries: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xartvei4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XARTVEI1", `-1` = "na, asked", `0` = "no", `1` = "Arteries: pain when walking status", `2` = "yes",
  .applies_to_vars = c("xartvei5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XARTVEI5", `-1` = "na, asked",
  .applies_to_vars = c("xartvei6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XARTVEI5", `-1` = "na, asked", `0` = "no", `1` = "Arteries: pain disappears standing still status", `2` = "yes",
  .applies_to_vars = c("xartvei7"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XARTVEI1", `-1` = "na, asked", `0` = "no", `1` = "Arteries: surgery since last interview status", `2` = "yes",
  .applies_to_vars = c("xartvei8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Arteries: outdoors less often status", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xartvei9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, lungs status", `2` = "mentioned",
  .applies_to_vars = c("xcance5a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, breast status", `2` = "mentioned",
  .applies_to_vars = c("xcance5b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-7` = "not asked, male", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, uterus status", `2` = "mentioned",
  .applies_to_vars = c("xcance5c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-7` = "not asked, male", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, cervix status", `2` = "mentioned",
  .applies_to_vars = c("xcance5d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, intestines status", `2` = "mentioned",
  .applies_to_vars = c("xcance5e"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-7` = "not asked, female", `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, prostate status", `2` = "mentioned",
  .applies_to_vars = c("xcance5f"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, larynx status", `2` = "mentioned",
  .applies_to_vars = c("xcance5g"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, esophagus status", `2` = "mentioned",
  .applies_to_vars = c("xcance5h"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, stomach status", `2` = "mentioned",
  .applies_to_vars = c("xcance5i"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, blood status", `2` = "mentioned",
  .applies_to_vars = c("xcance5j"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, skin status", `2` = "mentioned",
  .applies_to_vars = c("xcance5k"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: tumor, other status", `2` = "mentioned",
  .applies_to_vars = c("xcance5l"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCANCE5L", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("xcance5m"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCANCER6", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: metastases, bone/skeleton status", `2` = "mentioned",
  .applies_to_vars = c("xcance6a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCANCER6", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: metastases, liver status", `2` = "mentioned",
  .applies_to_vars = c("xcance6b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCANCER6", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: metastases, brain status", `2` = "mentioned",
  .applies_to_vars = c("xcance6c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCANCER6", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: metastases, lungs status", `2` = "mentioned",
  .applies_to_vars = c("xcance6d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCANCER6", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: metastases, lymph nodes status", `2` = "mentioned",
  .applies_to_vars = c("xcance6e"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCANCER6", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("xcance6f"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCANCE6F", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("xcance6g"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: surgery, since last interview status", `2` = "mentioned",
  .applies_to_vars = c("xcance7a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "Cancer: chemotherapy, since last interview status", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: chemotherapy, since last interview status", `2` = "mentioned",
  .applies_to_vars = c("xcance7b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "Cancer: radiotherapy, since last interview status", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: radiotherapy, since last interview status", `2` = "mentioned",
  .applies_to_vars = c("xcance7c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "Cancer: alternative treatment, since last interview status", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: alternative treatment, since last interview status", `2` = "mentioned",
  .applies_to_vars = c("xcance7d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "Cancer status", `-1` = "na, asked", `0` = "Cancer status", `1` = "Cancer status", `2` = "yes, BCANCER1 no", `3` = "yes, BCANCER1 yes",
  .applies_to_vars = c("xcancer1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked",
  .applies_to_vars = c("xcancer2", "xcara02", "xrheum03"),
  .applies_to_waves = c("Z", "B", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Cancer: taking medication status", `2` = "yes",
  .applies_to_vars = c("xcancer3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Cancer: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xcancer4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xcancer5"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "Cancer: metastases since last interview status", `2` = "yes",
  .applies_to_vars = c("xcancer6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xcancer8", "xcara12", "xrheum11"),
  .applies_to_waves = c("Z", "B", "C")
)

value_labels(
  `-5` = "CNSLD: asthma, chr bronch, emphysema status", `-1` = "na, asked", `0` = "no", `1` = "CNSLD: asthma, chr bronch, emphysema status", `2` = "yes, BCARA01 no", `3` = "yes, BCARA01 yes",
  .applies_to_vars = c("xcara01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "CNSLD: taking medication status", `2` = "yes",
  .applies_to_vars = c("xcara03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "CNSLD: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xcara04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "CNSLD: cough almost daily status", `2` = "yes",
  .applies_to_vars = c("xcara05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "CNSLD: phlegm almost daily status", `2` = "yes",
  .applies_to_vars = c("xcara06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "CNSLD: period increased phlegm past year status", `2` = "yes",
  .applies_to_vars = c("xcara07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "CNSLD: shortness of breath sometimes status", `2` = "yes", `3` = "yes", `4` = "yes, at rest",
  .applies_to_vars = c("xcara08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "CNSLD: wheezing breath ever status", `2` = "yes",
  .applies_to_vars = c("xcara09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "CNSLD: wheezing breath during rest status", `2` = "yes",
  .applies_to_vars = c("xcara10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xcara11"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-5` = "CVA status", `-1` = "na, asked", `0` = "CVA status", `1` = "CVA status", `2` = "yes, BCVA01 no", `3` = "yes, BCVA01 yes",
  .applies_to_vars = c("xcva01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCVA01", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("xcva02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xcva02a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCVA02A", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("xcva02b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCVA02", `-1` = "na, asked",
  .applies_to_vars = c("xcva03", "xcva04", "xcva05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCVA02B", `-1` = "na, asked",
  .applies_to_vars = c("xcva03j", "xcva03m", "xcva04j", "xcva04m", "xcva05j", "xcva05m"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCVA01", `-1` = "na, asked", `0` = "no", `1` = "CVA: taking medication status", `2` = "yes",
  .applies_to_vars = c("xcva06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCVA01", `-1` = "na, asked", `0` = "no", `1` = "CVA: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xcva07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XCVA01", `-1` = "na, asked", `0` = "no", `1` = "CVA: still problems with arms and legs status", `2` = "yes",
  .applies_to_vars = c("xcva08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XCVA01", `-1` = "na, asked", `0` = "no", `1` = "CVA: still problems with vision status", `2` = "yes",
  .applies_to_vars = c("xcva09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XCVA01", `-1` = "na, asked", `0` = "no", `1` = "CVA: still problems speech status", `2` = "yes",
  .applies_to_vars = c("xcva10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XCVA01", `-1` = "na, asked", `0` = "no", `1` = "CVA: still problems understanding written text status", `2` = "yes",
  .applies_to_vars = c("xcva11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XCVA01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xcva12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "Diabetes status", `-1` = "na, asked", `0` = "no", `1` = "Diabetes status", `2` = "yes, BDIABE01 no", `3` = "yes, BDIABE01 yes",
  .applies_to_vars = c("xdiabe01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XDIABE01", `-1` = "na, asked",
  .applies_to_vars = c("xdiabe02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XDIABE01", `-1` = "na, asked", `0` = "no", `1` = "Diabetes: taking medication status", `2` = "yes", `3` = "yes, tablets only",
  .applies_to_vars = c("xdiabe03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XDIABE01", `-1` = "na, asked", `0` = "no", `1` = "Diabetes: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xdiabe04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XDIABE01", `-1` = "na, asked", `0` = "no", `1` = "Diabetes: treatment related eye problems status", `2` = "yes",
  .applies_to_vars = c("xdiabe05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XDIABE05", `-1` = "na, asked", `1` = "laser coagulation treatment", `2` = "cataract surgery", `3` = "both", `4` = "other",
  .applies_to_vars = c("xdiabe06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "Diabetes: pain when walking status", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XDIABE01", `-1` = "na, asked", `0` = "no", `1` = "Diabetes: pain when walking status", `2` = "yes",
  .applies_to_vars = c("xdiabe07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XDIABE07", `-1` = "na, asked",
  .applies_to_vars = c("xdiabe08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XDIABE07", `-1` = "na, asked", `0` = "no", `1` = "Diabetes: pain disappears standing still status", `2` = "yes",
  .applies_to_vars = c("xdiabe09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XDIABE01", `-1` = "na, asked", `0` = "no", `1` = "Diabetes: pain in legs during rest status", `2` = "yes",
  .applies_to_vars = c("xdiabe10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-6` = "Diabetes: chest pain during exertion status", `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XDIABE01", `-1` = "na, asked", `0` = "no", `1` = "Diabetes: chest pain during exertion status", `2` = "Diabetes: chest pain during exertion status", `3` = "Diabetes: chest pain during exertion status", `4` = "Diabetes: chest pain during exertion status", `5` = "Diabetes: chest pain during exertion status", `6` = "Diabetes: chest pain during exertion status", `7` = "no exertion: other reason",
  .applies_to_vars = c("xdiabe11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XDIABE11", `-1` = "na, asked", `0` = "no", `1` = "Diabetes: exertion pain disappears in 10 minutes status", `2` = "yes",
  .applies_to_vars = c("xdiabe12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XDIABE01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xdiabe13"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XDIABE05", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xdiabe6a", "xdiabe6b", "xdiabe6c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "Heart: heart disease status", `-1` = "na, asked", `0` = "no", `1` = "Heart: heart disease status", `2` = "yes, BHART01 no", `3` = "yes, BHART01 yes",
  .applies_to_vars = c("xhart01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHART01", `-1` = "na, asked",
  .applies_to_vars = c("xhart02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHART01", `-1` = "na, asked", `0` = "no", `1` = "Heart: taking medication status", `2` = "yes",
  .applies_to_vars = c("xhart03"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHART01", `-1` = "na, asked", `0` = "no", `1` = "Heart: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xhart04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XHART01", `-1` = "na, asked", `0` = "no", `1` = "Heart: myocardial infarction since last interview status", `2` = "yes",
  .applies_to_vars = c("xhart05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHART05", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("xhart06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHART06", `-1` = "na, asked",
  .applies_to_vars = c("xhart07", "xhart07j", "xhart07m", "xhart08", "xhart08j", "xhart08m", "xhart09", "xhart09j", "xhart09m"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XHART01", `-1` = "na, asked", `0` = "no", `1` = "Heart: chest pain during exertion status", `2` = "Heart: chest pain during exertion status", `3` = "Heart: chest pain during exertion status", `4` = "Heart: chest pain during exertion status", `5` = "Heart: chest pain during exertion status", `6` = "Heart: chest pain during exertion status", `7` = "no exertion: other reason",
  .applies_to_vars = c("xhart10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHART10", `-1` = "na, asked", `0` = "no", `1` = "Heart: exertion pain disappears in 10 minutes status", `2` = "yes",
  .applies_to_vars = c("xhart11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XHART01", `-1` = "na, asked", `0` = "no", `1` = "Heart: >1 pillow for shortness of breath status", `2` = "yes",
  .applies_to_vars = c("xhart12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Heart: edema morning; legs, feet, ankles status", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xhart13"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Heart: edema evening; legs, feet, ankles status", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xhart14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Heart: cardiac surgery since last interview status", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xhart15"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHART15", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xhart15a", "xhart15b", "xhart15c", "xhart15d", "xhart15e"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHART01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xhart16"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, see XRMCH", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xhbd1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHBD1", `-1` = "na, asked",
  .applies_to_vars = c("xhbd2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xhbd2a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xhbd3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "Incontinence status", `-1` = "na, asked", `0` = "Incontinence status", `1` = "Incontinence status", `2` = "yes, BINCON1 no", `3` = "yes, BINCON1 yes",
  .applies_to_vars = c("xincon1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XINCON1", `-1` = "na, asked",
  .applies_to_vars = c("xincon2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XINCON1", `-1` = "na, asked", `0` = "no", `1` = "Incontinence: taking medication status", `2` = "yes",
  .applies_to_vars = c("xincon3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XINCON1", `-1` = "na, asked", `0` = "no", `1` = "Incontinence: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xincon4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XINCON1", `-1` = "na, asked", `1` = "2 times a month or less", `2` = "3-4 times a month", `3` = "a few times a week", `4` = "daily",
  .applies_to_vars = c("xincon5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XINCON1", `-1` = "na, asked", `0` = "no", `1` = "Incontinence: use special material status", `2` = "Incontinence: use special material status", `3` = "yes, most of the time",
  .applies_to_vars = c("xincon6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see XINCON1", `-1` = "na, asked", `0` = "no", `1` = "Incontinence: surgery since last interview status", `2` = "yes",
  .applies_to_vars = c("xincon7"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XINCON1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xincon8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "Other1: other chronic diseases status", `-1` = "na, asked", `0` = "no", `1` = "Other1: other chronic diseases status", `2` = "yes",
  .applies_to_vars = c("xothsi01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Other1: disease status", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("xothsi02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Other1: from which age status", `-1` = "na, asked",
  .applies_to_vars = c("xothsi04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Other1: taking medication status", `-1` = "na, asked", `0` = "no", `1` = "Other1: taking medication status", `2` = "yes",
  .applies_to_vars = c("xothsi05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Other1: treatment doctor status", `-1` = "na, asked", `0` = "no", `1` = "Other1: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xothsi06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "Other2: other chronic diseases status", `-1` = "na, asked", `0` = "no", `1` = "Other2: other chronic diseases status", `2` = "yes",
  .applies_to_vars = c("xothsi07"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Other2: disease status", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("xothsi08"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Other2: from which age status", `-1` = "na, asked",
  .applies_to_vars = c("xothsi10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Other2: taking medication status", `-1` = "na, asked", `0` = "no", `1` = "Other2: taking medication status", `2` = "yes",
  .applies_to_vars = c("xothsi11"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Other2: treatment doctor status", `-1` = "na, asked", `0` = "no", `1` = "Other2: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xothsi12"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "Osteoarthritis/rheumatoid arthritis: osteoarthritis status", `-1` = "na, asked", `0` = "Osteoarthritis/rheumatoid arthritis: osteoarthritis status", `1` = "Osteoarthritis/rheumatoid arthritis: osteoarthritis status", `2` = "yes, BRHEUM01 no", `3` = "yes, BRHEUM01 yes",
  .applies_to_vars = c("xrheum01"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "status category", `-1` = "na, asked", `0` = "status category", `1` = "status category", `2` = "yes, BRHEUM02 no", `3` = "yes, BRHEUM02 yes",
  .applies_to_vars = c("xrheum02"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Osteoarthritis/rheumatoid arthritis: taking medication status", `2` = "yes",
  .applies_to_vars = c("xrheum04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Osteoarthritis/rheumatoid arthritis: treatment doctor status", `2` = "yes", `3` = "yes, specialist",
  .applies_to_vars = c("xrheum05"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "status category", `2` = "yes",
  .applies_to_vars = c("xrheum06", "xrheum07", "xrheum08", "xrheum09"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "Osteoarthritis/rheumatoid arthritis: joint prostheses status", `-1` = "na, asked", `0` = "not mentioned", `1` = "Osteoarthritis/rheumatoid arthritis: joint prostheses status", `2` = "yes",
  .applies_to_vars = c("xrheum10"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "rheumatic hands", `2` = "no rheumatic hands", `3` = "observation not possible",
  .applies_to_vars = c("xrheum12"),
  .applies_to_waves = c("Z", "B", "C")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Osteoarthritis/rheumatoid arthritis: complaints fingers status", `2` = "mentioned",
  .applies_to_vars = c("xrheum8a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "status category", `2` = "mentioned",
  .applies_to_vars = c("xrheum8b", "xrheum8d", "xrheum8f"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Osteoarthritis/rheumatoid arthritis: complaints elbows status", `2` = "mentioned",
  .applies_to_vars = c("xrheum8c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Osteoarthritis/rheumatoid arthritis: complaints toes status", `2` = "mentioned",
  .applies_to_vars = c("xrheum8e"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Osteoarthritis/rheumatoid arthritis: complaints knees status", `2` = "mentioned",
  .applies_to_vars = c("xrheum8g"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Osteoarthritis/rheumatoid arthritis: complaints hip status", `2` = "mentioned",
  .applies_to_vars = c("xrheum8h"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "Osteoarthritis/rheumatoid arthritis: complaints neck status", `2` = "mentioned",
  .applies_to_vars = c("xrheum8i"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "Osteoarthritis/rheumatoid arthritis: surgery fingers status", `2` = "mentioned",
  .applies_to_vars = c("xrheum9a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "Osteoarthritis/rheumatoid arthritis: surgery hand/wrist status", `2` = "mentioned",
  .applies_to_vars = c("xrheum9b"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "Osteoarthritis/rheumatoid arthritis: surgery elbows status", `2` = "mentioned",
  .applies_to_vars = c("xrheum9c"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "Osteoarthritis/rheumatoid arthritis: surgery shoulders status", `2` = "mentioned",
  .applies_to_vars = c("xrheum9d"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "Osteoarthritis/rheumatoid arthritis: surgery toes since status", `2` = "mentioned",
  .applies_to_vars = c("xrheum9e"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "status category", `2` = "mentioned",
  .applies_to_vars = c("xrheum9f"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "Osteoarthritis/rheumatoid arthritis: surgery knees status", `2` = "mentioned",
  .applies_to_vars = c("xrheum9g"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "Osteoarthritis/rheumatoid arthritis: surgery hip status", `2` = "mentioned",
  .applies_to_vars = c("xrheum9h"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see XRHEUM09", `-1` = "na, asked", `0` = "not mentioned", `1` = "Osteoarthritis/rheumatoid arthritis: surgery neck status", `2` = "mentioned",
  .applies_to_vars = c("xrheum9i"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid data", `1` = "interview terminated", `2` = "Reason missing: chronic diseases status", `4` = "refused test",
  .applies_to_vars = c("xrmch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BCANCER1",
  .applies_to_vars = c("xcance5a", "xcance5b", "xcance5c", "xcance5d", "xcance5e", "xcance5f", "xcance5g", "xcance5h", "xcance5i", "xcance5j", "xcance5k", "xcance5l", "xcance7a", "xcance7b", "xcance7c", "xcance7d", "xcancer2", "xcancer3", "xcancer4", "xcancer6", "xcancer8"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BCARA01",
  .applies_to_vars = c("xcara02", "xcara03", "xcara04", "xcara05", "xcara06", "xcara07", "xcara08", "xcara09", "xcara10", "xcara11", "xcara12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRHEUM01&02",
  .applies_to_vars = c("xrheum03", "xrheum04", "xrheum05", "xrheum06", "xrheum07", "xrheum08", "xrheum09", "xrheum11", "xrheum12", "xrheum8a", "xrheum8b", "xrheum8c", "xrheum8d", "xrheum8e", "xrheum8f", "xrheum8g", "xrheum8h", "xrheum8i"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BRHEUM09",
  .applies_to_vars = c("xrheum10", "xrheum9a", "xrheum9b", "xrheum9c", "xrheum9d", "xrheum9e", "xrheum9f", "xrheum9g", "xrheum9h", "xrheum9i"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short version",
  .applies_to_vars = c("xartvei5", "xartvei8", "xcance5a", "xcance5b", "xcance5c", "xcance5d", "xcance5e", "xcance5f", "xcance5g", "xcance5h", "xcance5i", "xcance5j", "xcance5k", "xcance5l", "xcance7a", "xcance7b", "xcance7c", "xcance7d", "xcancer6", "xcara05", "xcara06", "xcara07", "xcara08", "xcara09", "xcara10", "xcva08", "xcva09", "xcva10", "xcva11", "xdiabe05", "xdiabe07", "xdiabe10", "xdiabe11", "xhart05", "xhart10", "xhart12", "xincon6", "xincon7", "xothsi07", "xrheum06", "xrheum07", "xrheum08", "xrheum09", "xrheum8a", "xrheum8b", "xrheum8c", "xrheum8d", "xrheum8e", "xrheum8f", "xrheum8g", "xrheum8h", "xrheum8i"),
  .applies_to_waves = c("B")
)

value_labels(
  `-5` = "na, interview terminated",
  .applies_to_vars = c("xartvei1", "xcancer1", "xcara01", "xcva01", "xdiabe01", "xhart01", "xincon1", "xothsi01", "xrheum01", "xrheum02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI8", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xartve8a", "xartve8b", "xartve8c", "xartve8d", "xartve8e"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xartvei1", "xcancer1", "xcara01", "xcva01", "xdiabe01", "xhart01", "xincon1", "xothsi01", "xrheum01", "xrheum02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked",
  .applies_to_vars = c("xartvei2"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVE1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xartvei3"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("xartvei4"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xartvei5", "xartvei8"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI5", `-1` = "na, asked",
  .applies_to_vars = c("xartvei6"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BARTVEI5", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xartvei7"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "ries na, see BARTVEI1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xartvei9"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xcance5a", "xcance5b", "xcance5c", "xcance5d", "xcance5e", "xcance5f", "xcance5g", "xcance5h", "xcance5i", "xcance5j", "xcance5k", "xcance5l", "xcance7a", "xcance7b", "xcance7c", "xcance7d", "xcancer6", "xrheum10", "xrheum9a", "xrheum9b", "xrheum9c", "xrheum9d", "xrheum9e", "xrheum9f", "xrheum9g", "xrheum9h", "xrheum9i"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCANCER6", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xcance6a", "xcance6b", "xcance6c", "xcance6d", "xcance6e"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xcancer3", "xcara03", "xcara05", "xcara06", "xcara07", "xcara09", "xcara10", "xrheum04", "xrheum06", "xrheum07", "xrheum08", "xrheum09", "xrheum8a", "xrheum8b", "xrheum8c", "xrheum8d", "xrheum8e", "xrheum8f", "xrheum8g", "xrheum8h", "xrheum8i"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("xcancer4", "xcara04", "xrheum05"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `0` = "no", `1` = "yes, with heavy exertion", `2` = "yes, with light exertion", `3` = "yes, at rest",
  .applies_to_vars = c("xcara08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("xcva02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA02", `-1` = "na, asked",
  .applies_to_vars = c("xcva03", "xcva04", "xcva05"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xcva06", "xcva08", "xcva09", "xcva10", "xcva11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("xcva07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BCVA01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xcva12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked",
  .applies_to_vars = c("xdiabe02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes, insulin injections", `2` = "yes, tablets only",
  .applies_to_vars = c("xdiabe03"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("xdiabe04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xdiabe05", "xdiabe10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE05", `-1` = "na, asked", `1` = "laser coagulation treatment", `2` = "cataract surgery", `3` = "both", `4` = "other",
  .applies_to_vars = c("xdiabe06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "already asked BARTVEI5", `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xdiabe07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE07", `-1` = "na, asked",
  .applies_to_vars = c("xdiabe08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE07", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xdiabe09"),
  .applies_to_waves = c("B")
)

value_labels(
  `-6` = "already asked BHART10", `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `0` = "no", `1` = "yes", `2` = "no exertion: chest pain", `3` = "no exertion: pain legs", `4` = "no exertion: shortness of breath", `5` = "no exertion: joint complaints", `6` = "no exertion: other reason",
  .applies_to_vars = c("xdiabe11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE11", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xdiabe12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BDIABE01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xdiabe13"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked",
  .applies_to_vars = c("xhart02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xhart03", "xhart05", "xhart12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("xhart04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART05", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("xhart06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART06", `-1` = "na, asked",
  .applies_to_vars = c("xhart07", "xhart08", "xhart09", "xhart13", "xhart14", "xhart15"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `0` = "no", `1` = "yes", `2` = "no exertion: chest pain", `3` = "no exertion: pain legs", `4` = "no exertion: shortness of breath", `5` = "no exertion: joint complaints", `6` = "no exertion: other reason",
  .applies_to_vars = c("xhart10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART10", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xhart11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART15", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xhart15a", "xhart15b", "xhart15c", "xhart15d", "xhart15e"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BHART01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xhart16"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked",
  .applies_to_vars = c("xincon2"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xincon3", "xincon7"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("xincon4"),
  .applies_to_waves = c("B")
)

value_labels(
  `-4` = "na, short interview", `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `1` = "2 times a month or less", `2` = "3-4 times a month", `3` = "a few times a week", `4` = "daily",
  .applies_to_vars = c("xincon5"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `0` = "no", `1` = "only by certain occasion", `2` = "yes, most of the time",
  .applies_to_vars = c("xincon6"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BINCON1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xincon8"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI01", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("xothsi02"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI01", `-1` = "na, asked",
  .applies_to_vars = c("xothsi04"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI01", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xothsi05", "xothsi07"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI01", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("xothsi06"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("xothsi08"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked",
  .applies_to_vars = c("xothsi10"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("xothsi11"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BOTHSI07", `-1` = "na, asked", `0` = "no", `1` = "yes, family physician", `2` = "yes, specialist",
  .applies_to_vars = c("xothsi12"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "valid data", `1` = "terminated interview", `2` = "short interview",
  .applies_to_vars = c("xrmch"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see CCANCER1",
  .applies_to_vars = c("xcance5a", "xcance5b", "xcance5c", "xcance5d", "xcance5e", "xcance5f", "xcance5g", "xcance5h", "xcance5i", "xcance5j", "xcance5k", "xcance5l", "xcance7a", "xcancer2", "xcancer3", "xcancer4", "xcancer5", "xcancer6", "xcancer8"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CCARA01",
  .applies_to_vars = c("xcara02", "xcara03", "xcara04", "xcara05", "xcara06", "xcara07", "xcara08", "xcara09", "xcara10", "xcara11", "xcara12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see CRHEUM01&02",
  .applies_to_vars = c("xrheum03", "xrheum04", "xrheum05", "xrheum06", "xrheum07", "xrheum08", "xrheum09", "xrheum11", "xrheum12", "xrheum8a", "xrheum8b", "xrheum8c", "xrheum8d", "xrheum8e", "xrheum8f", "xrheum8g", "xrheum8h", "xrheum8i"),
  .applies_to_waves = c("C")
)

value_labels(
  `-5` = "na, see CRMCH",
  .applies_to_vars = c("xartvei1", "xcancer1", "xcara01", "xcva01", "xdiabe01", "xhart01", "xhbd1", "xincon1", "xothsi01", "xrheum01", "xrheum02"),
  .applies_to_waves = c("C")
)

value_labels(
  `-6` = "na, see CCANCER5",
  .applies_to_vars = c("xcance5a", "xcance5b", "xcance5c", "xcance5d", "xcance5e", "xcance5f", "xcance5g", "xcance5h", "xcance5i", "xcance5j", "xcance5k", "xcance5l"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI8", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xartve8a", "xartve8b", "xartve8c", "xartve8d", "xartve8e"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no, never", `1` = "no, BARTVEI1 yes", `2` = "yes, BARTVEI1 no", `3` = "yes, BARTVEI1 yes",
  .applies_to_vars = c("xartvei1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI1", `-1` = "na, asked",
  .applies_to_vars = c("xartvei2"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVE1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xartvei3"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xartvei4"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xartvei5", "xartvei8"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI5", `-1` = "na, asked",
  .applies_to_vars = c("xartvei6"),
  .applies_to_waves = c("C")
)

value_labels(
  `1` = "see cartvei6, no", `2` = "yes",
  .applies_to_vars = c("xartvei7"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CARTVEI1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xartvei9"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("xcance5a", "xcance5b", "xcance5e", "xcance5g", "xcance5h", "xcance5i", "xcance5j", "xcance5k", "xcance5l", "xcance7a", "xrheum8a", "xrheum8b", "xrheum8c", "xrheum8d", "xrheum8e", "xrheum8f", "xrheum8g", "xrheum8h", "xrheum8i"),
  .applies_to_waves = c("C")
)

value_labels(
  `-7` = "not asked, male", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("xcance5c", "xcance5d"),
  .applies_to_waves = c("C")
)

value_labels(
  `-7` = "not asked, female", `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("xcance5f"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCANCE5L", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("xcance5m"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCANCER6", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("xcance6a", "xcance6b", "xcance6c", "xcance6d", "xcance6e", "xcance6f", "xcance7b", "xcance7c", "xcance7d"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCANCE6F", `-1` = "na, asked", `0` = "to be coded",
  .applies_to_vars = c("xcance6g"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BCANCER1 yes", `2` = "yes, BCANCER1 no", `3` = "yes, BCANCER1 yes",
  .applies_to_vars = c("xcancer1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xcancer3", "xcancer6", "xcara03", "xcara05", "xcara06", "xcara07", "xcara09", "xcara10", "xrheum04", "xrheum06", "xrheum07", "xrheum08", "xrheum09"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xcancer4", "xcara04", "xrheum05"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no, never", `1` = "no, BCARA01 yes", `2` = "yes, BCARA01 no", `3` = "yes, BCARA01 yes",
  .applies_to_vars = c("xcara01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes, with heavy exertion", `3` = "yes, with light exertion", `4` = "yes, at rest",
  .applies_to_vars = c("xcara08"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xcara11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BCVA01 yes", `2` = "yes, BCVA01 no", `3` = "yes, BCVA01 yes",
  .applies_to_vars = c("xcva01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xcva02a", "xcva06", "xcva08", "xcva09", "xcva10", "xcva11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA02A", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("xcva02b"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA02B", `-1` = "na, asked",
  .applies_to_vars = c("xcva03j", "xcva03m", "xcva04j", "xcva04m", "xcva05j", "xcva05m"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xcva07"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CCVA01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xcva12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no, never", `1` = "no, BDIABE01 yes", `2` = "yes, BDIABE01 no", `3` = "yes, BDIABE01 yes",
  .applies_to_vars = c("xdiabe01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked",
  .applies_to_vars = c("xdiabe02"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes, insulin injections", `3` = "yes, tablets only",
  .applies_to_vars = c("xdiabe03"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xdiabe04"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xdiabe05", "xdiabe10"),
  .applies_to_waves = c("C")
)

value_labels(
  `-6` = "na, see CARTVEI1", `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xdiabe07"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE07", `-1` = "na, asked",
  .applies_to_vars = c("xdiabe08"),
  .applies_to_waves = c("C")
)

value_labels(
  `1` = "see cdiabe08, no", `2` = "yes",
  .applies_to_vars = c("xdiabe09"),
  .applies_to_waves = c("C")
)

value_labels(
  `-6` = "already asked CHART01", `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("xdiabe11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE11", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xdiabe12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xdiabe13"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CDIABE05", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xdiabe6a", "xdiabe6b", "xdiabe6c"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no, never", `1` = "no, BHART01 yes", `2` = "yes, BHART01 no", `3` = "yes, BHART01 yes",
  .applies_to_vars = c("xhart01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked",
  .applies_to_vars = c("xhart02"),
  .applies_to_waves = c("C")
)

value_labels(
  `1` = "see chart02, no", `2` = "yes",
  .applies_to_vars = c("xhart03", "xhart05"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xhart04"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART05", `-1` = "na, asked", `1` = "once", `2` = "two times or more",
  .applies_to_vars = c("xhart06"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART06", `-1` = "na, asked",
  .applies_to_vars = c("xhart07j", "xhart07m", "xhart08j", "xhart08m", "xhart09j", "xhart09m"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "no exertion: chest pain", `4` = "no exertion: pain legs", `5` = "no exertion: shortness of breath", `6` = "no exertion: joint complaints", `7` = "no exertion: other reason",
  .applies_to_vars = c("xhart10"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART10", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xhart11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xhart12", "xhart13", "xhart14", "xhart15"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART15", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("xhart15a", "xhart15b", "xhart15c", "xhart15d", "xhart15e"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHART01", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xhart16"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xhbd1", "xothsi01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHBD1", `-1` = "na, asked",
  .applies_to_vars = c("xhbd2"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xhbd2a"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CHBD1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xhbd3"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BINCON1 yes", `2` = "yes, BINCON1 no", `3` = "yes, BINCON1 yes",
  .applies_to_vars = c("xincon1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked",
  .applies_to_vars = c("xincon2"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xincon3", "xincon7"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xincon4"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "2 times a month or less", `2` = "3-4 times a month", `3` = "a few times a week", `4` = "daily",
  .applies_to_vars = c("xincon5"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "no", `2` = "only on certain occasion", `3` = "yes, most of the time",
  .applies_to_vars = c("xincon6"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CINCON1", `-1` = "na, asked", `1` = "not at all", `2` = "sometimes", `3` = "often", `4` = "always",
  .applies_to_vars = c("xincon8"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("xothsi02"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked",
  .applies_to_vars = c("xothsi04"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xothsi05", "xothsi07"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH1", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xothsi06"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked", `1` = "hypertension", `2` = "ulcer stomach or duodenum", `3` = "serious intestinal disease", `4` = "gall-stones/gall-bladder", `5` = "liver disease or cirrhosis", `6` = "inguinal hernia", `7` = "kidney stone", `8` = "kidney disease-serious", `9` = "chronic cystitis", `10` = "prostate complaints (males)", `11` = "prolapse (females)", `12` = "thyroid disease", `13` = "back problems, hernia", `14` = "epilepsy", `15` = "dizziness with falling", `16` = "migraine", `17` = "serious skin disease", `18` = "decubitus-ulcer", `19` = "allergy/hay-fever", `20` = "serious consequences accident", `21` = "other serious consequences/burns", `22` = "consequences surgery/operations", `23` = "disease of nervous system", `24` = "mental problems, incl. depression", `25` = "eye diseases", `26` = "ear diseases/hearing problems", `27` = "venous insufficiency/varicose veins", `28` = "anaemia", `29` = "chronic headaches (no migraine)", `30` = "chronic neck-problems", `31` = "dizziness without falling", `32` = "congenital disorders", `33` = "hypercholesterolaemia", `34` = "gout", `35` = "menopausal complaints (females)", `36` = "osteoporosis", `37` = "other pulmonary disease (no CNSLD)", `38` = "systemic diseases", `39` = "other hormonal diseases (no diabetes/thyroid)", `40` = "other urological disease (no incontinence)", `41` = "other locomotor disease", `42` = "other vascular disease", `43` = "other neurological disease", `44` = "TIA", `45` = "other haematological disease", `46` = "pancreatitis-chronic", `47` = "no label", `48` = "addiction", `49` = "other chronic disease", `50` = "other non-chronic disease",
  .applies_to_vars = c("xothsi08"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked",
  .applies_to_vars = c("xothsi10"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xothsi11"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see COTH71", `-1` = "na, asked", `1` = "no", `2` = "yes, family physician", `3` = "yes, specialist",
  .applies_to_vars = c("xothsi12"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BRHEUM01 yes", `2` = "yes, BRHEUM01 no", `3` = "yes, BRHEUM01 yes",
  .applies_to_vars = c("xrheum01"),
  .applies_to_waves = c("C")
)

value_labels(
  `-1` = "na, asked", `0` = "no never", `1` = "no, BRHEUM02 yes", `2` = "yes, BRHEUM02 no", `3` = "yes, BRHEUM02 yes",
  .applies_to_vars = c("xrheum02"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRHEUM01", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("xrheum10"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRHEUM09", `-1` = "na, asked", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("xrheum9a", "xrheum9b", "xrheum9c", "xrheum9d", "xrheum9e", "xrheum9f", "xrheum9g", "xrheum9h", "xrheum9i"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "valid data", `2` = "interview terminated", `4` = "refused test",
  .applies_to_vars = c("xrmch"),
  .applies_to_waves = c("C")
)

.lasa_fc_435 <- .lasa_finalize_fc("435")
.lasa_fc_435$variables <- .lasa_fc_435$variables |>
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
  .override_label(wave = "C", variable = "xrmch", override_value = "xrmch")

