## LASA filecode 161 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  marm1 = "Measured arm (1)",
  marm2 = "Measured arm (2)",
  marmp = "Arm: particularities",
  marmp1 = "Arm: no bare arm",
  marmp2 = "Arm: much space between tape and arm",
  marmp3 = "Arm: R sitting down",
  marmp4 = "Arm: on right arm",
  marmp5 = "Arm: refused",
  mbicep1 = "Biceps (1): millimeters",
  mbicep2 = "Biceps (2): millimeters",
  mbicep3 = "Biceps (3): millimeters",
  mbicepp = "Biceps particularities",
  mbicepp1 = "Biceps: no bare arm",
  mbicepp2 = "Biceps: edema",
  mbicepp3 = "Biceps: > 40mm",
  mbicepp4 = "Biceps: tight skin",
  mbicepp5 = "Biceps: refused",
  mcalf01 = "Measured calf in cm",
  mcalf02 = NA_character_,
  mcalf03 = "Calf: refused",
  mcalf04 = "Calf: R sitting down",
  mcalf06 = "Calf: on right leg",
  mcalf12 = NA_character_,
  mcalf13 = "Calf: much space between tape and leg",
  mgripl1 = "Hand strength (1) left: kgf",
  mgripl2 = "Hand strength (2) left: kgf",
  mgriplp = "Hand strength left: particularities",
  mgriplp1 = "Hand strength: left particularities",
  mgriplp2 = "Hand strength: left handicapped",
  mgriplp3 = "Hand strength: left refuses",
  mgriplp4 = "Hand strength: left other remarks",
  mgripmeasp = "Measuring instruments: particularities",
  mgripp = "Hand strength particularities",
  mgripr1 = "Hand strength (1) right: kgf",
  mgripr2 = "Hand strength (2) right: kgf",
  mgriprp = "Hand strength right: particularities",
  mgriprp1 = "Hand strength: right particularities",
  mgriprp2 = "Hand strength: right handicapped",
  mgriprp3 = "Hand strength: right refuses",
  mgriprp4 = "Hand strength: right other remarks",
  mheight = "Measured height in centimeters",
  mheightp = "Height particularities",
  mheightp1 = "Height: cannot stand",
  mheightp2 = "Height: kyphosis",
  mheightp3 = "Height: scoliosis",
  mheightp4 = "Height: head not parallel",
  mheightp5 = "Height: shoes",
  mheightp6 = "Height: too much hair",
  mheightp7 = "Height: refused",
  mheightself = "Height: self-report",
  mhip = "Measured hip in centimeters",
  mhip1 = "Measured hip (1) in cm",
  mhip2 = "Measured hip (2) in cm",
  mhipp = "Hip particularities",
  mhipp1 = "Hip: lying down",
  mhipp2 = "Hip: many skinfolds",
  mhipp3 = "Hip: refused",
  mhipp4 = "Hip: other remark (3B) / Hip: other reason",
  mkneeh = "Knee height: millimeters",
  mkneep = "Knee: particularities",
  mlength = "Measured length in centimeters",
  mmiwp = "Measurements instruments were working properly",
  msubscap1 = "Subscapular (1): millimeters",
  msubscap2 = "Subscapular (2): millimeters",
  msubscap3 = "Subscapular (3): millimeters",
  msubscapp = "Subscapular particularities",
  msubscapp1 = "Subscapular: no bare arm",
  msubscapp2 = "Subscapular: edema",
  msubscapp3 = "Subscapular: > 40mm",
  msubscapp4 = "Subscapular: tight skin",
  msubscapp5 = "Subscapular: refused",
  msuprail1 = "Suprailiac (1): millimeters",
  msuprail2 = "Suprailiac (2): millimeters",
  msuprail3 = "Suprailiac (3): millimeters",
  msuprailp = "Suprailiac particularities",
  msuprailp1 = "Suprailiac: no bare arm",
  msuprailp2 = "Suprailiac: edema",
  msuprailp3 = "Suprailiac: > 40mm",
  msuprailp4 = "Suprailiac: tight skin",
  msuprailp5 = "Suprailiac: refused",
  mtricep1 = "Triceps (1): millimeters",
  mtricep2 = "Triceps (2): millimeters",
  mtricep3 = "Triceps (3): millimeters",
  mtricepp = "Triceps particularities",
  mtricepp1 = "Triceps: no bare arm",
  mtricepp2 = "Triceps: edema",
  mtricepp3 = "Triceps: > 40mm",
  mtricepp4 = "Triceps: tight skin",
  mtricepp5 = "Triceps: refused",
  mwaist = "Measured waist in centimeters",
  mwaist1 = "Measured waist (1)",
  mwaist2 = "Measured waist (2)",
  mwaistp = "Waist particularities",
  mwaistp1 = "Waist: lying down",
  mwaistp2 = "Waist: hard to find right spot",
  mwaistp3 = "Waist: many skinfolds",
  mwaistp4 = "Waist: refused",
  mwaistp5 = "Waist: other remark (3B) Waist: other reason",
  mweight = "Measured weight in kilograms",
  mweightp = "Weight particularities",
  mweightp1 = "Weight: cannot stand",
  mweightp2 = "Weight: clothes",
  mweightp3 = "Weight: corset",
  mweightp4 = "Weight: amputated",
  mweightp5 = "Weight: brace",
  mweightp6 = "Weight: prosthesis",
  mweightp7 = "Weight: > 150 kg",
  mweightp8 = "Weight: refused",
  mweightp9 = "Weight: shoes",
  mweightself = "Weight: self-report",
  rm161 = "Reason missing: LASAH/B/I/J161"
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels[c(
    "marm1",
    "marm2",
    "marmp",
    "mheightp",
    "mheightself",
    "mhip",
    "mhipp",
    "mkneeh",
    "mkneep",
    "mlength",
    "mtricep1",
    "mtricep2",
    "mtricep3",
    "mtricepp",
    "mwaist",
    "mwaistp",
    "mweight",
    "mweightp",
    "mweightself"
  )],
    marm1 = "Arm 1: millimeters",
    marm2 = "Arm 2: millimeters",
    mheightp = "Length: particularities",
    mheightself = "Length: self-report",
    mhipp = "Hip: particularities",
    mtricep1 = "Triceps 1: millimeters",
    mtricep2 = "Triceps 2: millimeters",
    mtricep3 = "Triceps 3: millimeters",
    mtricepp = "Triceps: particularities",
    mwaistp = "Waist: particularities",
    mweightp = "Weight: particularities"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels[c(
    "marm1",
    "marm2",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mbicep1",
    "mbicep2",
    "mbicep3",
    "mbicepp",
    "mbicepp1",
    "mbicepp2",
    "mbicepp3",
    "mbicepp4",
    "mbicepp5",
    "mgripl1",
    "mgripl2",
    "mgripp",
    "mgripr1",
    "mgripr2",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "msubscap1",
    "msubscap2",
    "msubscap3",
    "msubscapp",
    "msubscapp1",
    "msubscapp2",
    "msubscapp3",
    "msubscapp4",
    "msubscapp5",
    "msuprail1",
    "msuprail2",
    "msuprail3",
    "msuprailp",
    "msuprailp1",
    "msuprailp2",
    "msuprailp3",
    "msuprailp4",
    "msuprailp5",
    "mtricep1",
    "mtricep2",
    "mtricep3",
    "mtricepp",
    "mtricepp1",
    "mtricepp2",
    "mtricepp3",
    "mtricepp4",
    "mtricepp5",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightself",
    "rm161"
  )],
    marm1 = "Measured arm (1) in cm",
    marm2 = "Measured arm (2) in cm",
    marmp = "Arm particularities",
    mwaist1 = "Measured waist (1) in mm",
    mwaist2 = "Measured waist (2) in mm",
    mweightp7 = "Weight: >150 kg",
    rm161 = "Reason missing: LASAC161"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels[c(
    "marm1",
    "marm2",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mbicep1",
    "mbicep2",
    "mbicep3",
    "mbicepp",
    "mbicepp1",
    "mbicepp3",
    "mbicepp4",
    "mbicepp5",
    "mgripl1",
    "mgripl2",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mheight",
    "mheightp",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mtricep1",
    "mtricep2",
    "mtricep3",
    "mtricepp",
    "mtricepp1",
    "mtricepp3",
    "mtricepp4",
    "mtricepp5",
    "mwaist1",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = "Measured arm (1) in cm",
    marm2 = "Measured arm (2) in cm",
    marmp = "Arm particularities",
    mgriplp1 = "Hand strength: left part.",
    mgriprp1 = "Hand strength: right part.",
    mhipp4 = "Hip: other remakrs",
    mwaist1 = "Measured waist (1) in mm",
    mweightp7 = "Weight: >150 kg",
    rm161 = "Reason missing: LASAD161"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels[c(
    "mgripl1",
    "mgripl2",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    mgriplp1 = "Hand strength: left part",
    mgriprp1 = "Hand strength: right part",
    mhipp4 = "Hip: other remarks",
    mwaist1 = "Measured waist (1) in cm",
    mwaist2 = "Measured waist (2) in cm",
    rm161 = "Reason missing: LASAE161"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels[c(
    "mgripl1",
    "mgripl2",
    "mgriplp",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripmeasp",
    "mgripr1",
    "mgripr2",
    "mgriprp",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightself"
  )],
    mgriplp2 = "Hand strength left: handicap",
    mgriplp3 = "Hand strength left: refused",
    mgriplp4 = "Hand strength left: other",
    mgriprp2 = "Hand strength right: handicap",
    mgriprp3 = "Hand strength right: refused",
    mgriprp4 = "Hand strength right: other",
    mwaist1 = "Measured waist (1) in cm",
    mwaist2 = "Measured waist (2) in cm",
    mwaistp3 = "Waist: much skinfolds"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels[c(
    "mgripl1",
    "mgripl2",
    "mgriplp",
    "mgripr1",
    "mgripr2",
    "mgriprp",
    "mheight",
    "mheightp",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mweight",
    "mweightp",
    "mweightself",
    "rm161"
  )],
    mgriplp = "Hand strength left particularities",
    mgriprp = "Hand strength right particularities",
    mwaist1 = "Measured waist (1) in cm",
    mwaist2 = "Measured waist (2) in cm",
    rm161 = "Reason missing: LASAF161"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels[c(
    "mgripl1",
    "mgripl2",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    mgriplp1 = "Hand strength: left part.",
    mgripr2 = "Hand strength (2): right: kgf",
    mgriprp1 = "Hand strength: right part.",
    mwaist1 = "Measured waist (1) in cm",
    mwaist2 = "Measured waist (2) in cm",
    rm161 = "Reason missing: LASAG161"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mgripl1",
    "mgripl2",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = "Measured arm in cm",
    mwaist1 = "Measured waist (1) in cm",
    mwaist2 = "Measured waist (2) in cm",
    mweightp = "Weight: particularities"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mgripl1",
    "mgripl2",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mmiwp",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mwaistp5",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = "Measured arm in cm",
    mmiwp = "Measurement instruments were working properly",
    mwaist1 = "Measured waist (1) in cm",
    mwaist2 = "Measured waist (2) in cm",
    mweightp = "Weight: particularities"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mcalf01",
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mgripl1",
    "mgripl2",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mmiwp",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mwaistp5",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = "Measured arm in cm",
    mwaist1 = "Measured waist (1) in cm",
    mwaist2 = "Measured waist (2) in cm",
    mweightp = "Weight: particularities"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mcalf01",
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mgripl1",
    "mgripl2",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mmiwp",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mwaistp5",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = "Measured arm in cm",
    mwaist1 = "Measured waist (1) in cm",
    mwaist2 = "Measured waist (2) in cm",
    mweightp = "Weight: particularities"
  ),
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  marm1 = c(
    `-3` = "no measurement / na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked"
  ),
  marm2 = c(`-1` = "no valid data"),
  marmp = c(
    `-3` = "no measurement / na, wrong skip",
    `-2` = "no answer, skipped / na, see C/DRM161",
    `-1` = "no particularities scored / no valid data / na, asked",
    `1` = "no bare arm / no",
    `2` = "much room between / yes",
    `3` = "R sitting down",
    `4` = "on right arm",
    `5` = "refused"
  ),
  marmp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMARMP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  marmp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  marmp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  marmp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  marmp5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mbicep1 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data"),
  mbicep2 = stats::setNames(character(0), character(0)),
  mbicep3 = stats::setNames(character(0), character(0)),
  mbicepp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mbicepp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMBICEPP",
    `-1` = "no valid data",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mbicepp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mbicepp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mbicepp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mbicepp5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mcalf01 = c(`-3` = "na, wrong skip", `-2` = "na, see I/JRM161", `-1` = "na, asked"),
  mcalf02 = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
  mcalf03 = c(`-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mcalf04 = c(`-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mcalf06 = c(`-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mcalf12 = c(`-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mcalf13 = c(`-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
  mgripl1 = c(`-3` = "na, wrong skip", `-2` = "na, see DRM161", `-1` = "no valid data / na, asked"),
  mgripl2 = c(`-1` = "na, asked"),
  mgriplp = c(
    `-2` = "na, see BRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / no particularities",
    `2` = "yes / left hand handicapped",
    `3` = "R refused",
    `4` = "other remark"
  ),
  mgriplp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see DRM161",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "no / mentioned",
    `2` = "yes"
  ),
  mgriplp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see dmgriplp1",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mgriplp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRM161",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "no / mentioned",
    `2` = "yes"
  ),
  mgriplp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRM161",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "no / mentioned",
    `2` = "yes"
  ),
  mgripmeasp = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
  mgripp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `0` = "no particularities",
    `1` = "R refuses",
    `2` = "handicapped hand"
  ),
  mgripr1 = c(`-3` = "na, wrong skip", `-2` = "na, see CRM161", `-1` = "no valid data"),
  mgripr2 = c(`-1` = "na, asked"),
  mgriprp = c(
    `-2` = "na, see BRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / no particularities",
    `2` = "yes / right hand handicapped",
    `3` = "R refused",
    `4` = "other remark"
  ),
  mgriprp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see DRM161",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "no / mentioned",
    `2` = "yes"
  ),
  mgriprp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see DMGRIPRP1",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mgriprp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRM161",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "no / mentioned",
    `2` = "yes"
  ),
  mgriprp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see BRM161",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "no / mentioned",
    `2` = "yes"
  ),
  mheight = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data / na, asked"),
  mheightp = c(
    `-3` = "no measurement / na, wrong skip",
    `-2` = "no answer, skipped / na, see CRM161",
    `-1` = "no particularities scored / no valid data / na, asked",
    `1` = "cannot stand / no / yes / no particularities",
    `2` = "kyphose / yes / no / cannot stand",
    `3` = "scoliose / kyphosis",
    `4` = "head not parallel / scoliosis",
    `5` = "shoes / head not parallel",
    `6` = "too much hair",
    `7` = "refused / wears shoes",
    `8` = "R refused"
  ),
  mheightp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMHEIGHTP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mheightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "no / mentioned / yes",
    `2` = "yes / no"
  ),
  mheightp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mheightp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mheightp5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mheightp6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mheightp7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mheightself = c(
    `-3` = "no measurement / na, wrong skip",
    `-2` = "length measured / na, see C/DMHEIGHTP / routing",
    `-1` = "no valid data / na, asked"
  ),
  mhip = stats::setNames(character(0), character(0)),
  mhip1 = c(`-3` = "na, wrong skip", `-2` = "na see C/DRM161", `-1` = "no valid data"),
  mhip2 = c(`-1` = "no valid data / na, asked"),
  mhipp = c(
    `-3` = "no measurement / na, wrong skip",
    `-2` = "no answer, skipped / na, see C/DRM161",
    `-1` = "no particularities scored / no valid data / na, asked",
    `1` = "lying down / no / no particularities",
    `2` = "much skinfolds / yes / lying down",
    `3` = "refused / many skinfolds",
    `4` = "R refused"
  ),
  mhipp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMHIPP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mhipp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mhipp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mhipp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mkneeh = c(`-3` = "no measurement", `-1` = "no valid data"),
  mkneep = c(
    `-3` = "no measurement",
    `-2` = "no answer, skipped",
    `-1` = "no valid data",
    `0` = "no particularities scored",
    `1` = "refused",
    `2` = "trousers",
    `3` = "right leg"
  ),
  mlength = c(`-3` = "no measurement"),
  mmiwp = c(`-2` = "na, see BRM161", `-1` = "na, asked", `1` = "no / yes", `2` = "yes / no"),
  msubscap1 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data"),
  msubscap2 = stats::setNames(character(0), character(0)),
  msubscap3 = stats::setNames(character(0), character(0)),
  msubscapp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  msubscapp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMSUBSCAPP",
    `-1` = "no valid data",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  msubscapp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  msubscapp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  msubscapp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  msubscapp5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  msuprail1 = c(`-3` = "na, wrong skip", `-2` = "na, see CRM161", `-1` = "no valid data"),
  msuprail2 = stats::setNames(character(0), character(0)),
  msuprail3 = stats::setNames(character(0), character(0)),
  msuprailp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  msuprailp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CMSUPRAILP",
    `-1` = "no valid data",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  msuprailp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  msuprailp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  msuprailp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  msuprailp5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mtricep1 = c(`-3` = "no measurement / na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data"),
  mtricep2 = c(`-1` = "no valid data"),
  mtricep3 = stats::setNames(character(0), character(0)),
  mtricepp = c(
    `-3` = "no measurement / na, wrong skip",
    `-2` = "no answer, skipped / na, see C/DRM161",
    `-1` = "no valid data",
    `0` = "no particularities scored",
    `1` = "no bare arm / no",
    `2` = "edema / yes",
    `3` = "skinfold more than 40mm",
    `4` = "tight skin",
    `5` = "refused"
  ),
  mtricepp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMTRICEPP",
    `-1` = "no valid data",
    `1` = "not mentioned",
    `2` = "mentioned"
  ),
  mtricepp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mtricepp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mtricepp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mtricepp5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
  mwaist = stats::setNames(character(0), character(0)),
  mwaist1 = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data"),
  mwaist2 = c(`-1` = "no valid data / na, asked"),
  mwaistp = c(
    `-3` = "no measurement / na, wrong skip",
    `-2` = "no answer, skipped / na, see C/DRM161",
    `-1` = "no particularities scored / no valid data / na, asked",
    `1` = "lying down / no / no particularities",
    `2` = "hard to find right spot / yes / lying down",
    `3` = "much skinfolds under / hard to find right spot",
    `4` = "refused / many skinfolds",
    `5` = "R refused"
  ),
  mwaistp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMWAISTP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mwaistp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mwaistp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mwaistp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mwaistp5 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
  mweight = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mweightp = c(
    `-3` = "no measurement / na, wrong skip",
    `-2` = "no answer, skipped / na, see C/DRM161",
    `-1` = "no particularities scored / no valid data / na, asked",
    `1` = "cannot stand / no / yes / no particularities",
    `2` = "clothes / yes / no / cannot stand",
    `3` = "corset / wears clothes",
    `4` = "amputation / wears corset",
    `5` = "brace / amputated",
    `6` = "prosthesis / brace",
    `7` = ">150kg / prosthesis",
    `8` = "refused / wears shoes",
    `9` = "weight > 150 kg",
    `10` = "R refused"
  ),
  mweightp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMWEIGHTP",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mweightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `0` = "not mentioned",
    `1` = "no / mentioned / yes",
    `2` = "yes / no"
  ),
  mweightp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mweightp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mweightp5 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mweightp6 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mweightp7 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mweightp8 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no / yes",
    `2` = "yes / no"
  ),
  mweightp9 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data / na, asked",
    `1` = "no",
    `2` = "yes"
  ),
  mweightself = c(
    `-3` = "no measurement / na, wrong skip",
    `-2` = "length measured / na, see C/MWEIGHTP1&8",
    `-1` = "no valid data / na, asked"
  ),
  rm161 = c(
    `-2` = "valid data / interview terminated",
    `1` = "short version / short interview",
    `2` = "interview terminated"
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels[c(
    "marm1",
    "marm2",
    "marmp",
    "mheightp",
    "mheightself",
    "mhipp",
    "mkneeh",
    "mkneep",
    "mlength",
    "mtricep1",
    "mtricep2",
    "mtricepp",
    "mwaistp",
    "mweight",
    "mweightp",
    "mweightself"
  )],
    marm1 = c(`-3` = "no measurement"),
    marmp = .replace_labels(
    standardized_value_labels$marmp,
    `-3` = "no measurement",
    `-2` = "no answer, skipped",
    `-1` = "no particularities scored",
    `1` = "no bare arm",
    `2` = "much room between"
  ),
    mheightp = c(
    `-3` = "no measurement",
    `-2` = "no answer, skipped",
    `-1` = "no particularities scored",
    `1` = "cannot stand",
    `2` = "kyphose",
    `3` = "scoliose",
    `4` = "head not parallel",
    `5` = "shoes",
    `6` = "too much hair",
    `7` = "refused"
  ),
    mheightself = .replace_labels(
    standardized_value_labels$mheightself,
    `-3` = "no measurement",
    `-2` = "length measured",
    `-1` = "no valid data"
  ),
    mhipp = c(
    `-3` = "no measurement",
    `-2` = "no answer, skipped",
    `-1` = "no particularities scored",
    `1` = "lying down",
    `2` = "much skinfolds",
    `3` = "refused"
  ),
    mtricep1 = c(`-3` = "no measurement"),
    mtricepp = .replace_labels(
    standardized_value_labels$mtricepp,
    `-3` = "no measurement",
    `-2` = "no answer, skipped",
    `1` = "no bare arm",
    `2` = "edema"
  ),
    mwaistp = c(
    `-3` = "no measurement",
    `-2` = "no answer, skipped",
    `-1` = "no particularities scored",
    `1` = "lying down",
    `2` = "hard to find right spot",
    `3` = "much skinfolds under",
    `4` = "refused"
  ),
    mweight = c(`-1` = "no valid data"),
    mweightp = c(
    `-3` = "no measurement",
    `-2` = "no answer, skipped",
    `-1` = "no particularities scored",
    `1` = "cannot stand",
    `2` = "clothes",
    `3` = "corset",
    `4` = "amputation",
    `5` = "brace",
    `6` = "prosthesis",
    `7` = ">150kg",
    `8` = "refused"
  ),
    mweightself = .replace_labels(
    standardized_value_labels$mweightself,
    `-3` = "no measurement",
    `-2` = "length measured",
    `-1` = "no valid data"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mbicep1",
    "mbicepp",
    "mbicepp1",
    "mbicepp2",
    "mbicepp3",
    "mbicepp4",
    "mbicepp5",
    "mgripp",
    "mgripr1",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "msubscap1",
    "msubscapp",
    "msubscapp1",
    "msubscapp2",
    "msubscapp3",
    "msubscapp4",
    "msubscapp5",
    "msuprail1",
    "msuprailp",
    "msuprailp1",
    "msuprailp2",
    "msuprailp3",
    "msuprailp4",
    "msuprailp5",
    "mtricep1",
    "mtricepp",
    "mtricepp1",
    "mtricepp2",
    "mtricepp3",
    "mtricepp4",
    "mtricepp5",
    "mwaist1",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightself",
    "rm161"
  )],
    marm1 = .replace_labels(
    standardized_value_labels$marm1,
    `-3` = "na, wrong skip",
    `-1` = "no valid data"
  ),
    marmp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    marmp1 = .replace_labels(
    standardized_value_labels$marmp1,
    `-1` = "no valid data"
  ),
    marmp2 = .replace_labels(
    standardized_value_labels$marmp2,
    `-1` = "no valid data"
  ),
    marmp3 = .replace_labels(
    standardized_value_labels$marmp3,
    `-1` = "no valid data"
  ),
    marmp4 = .replace_labels(
    standardized_value_labels$marmp4,
    `-1` = "no valid data"
  ),
    marmp5 = .replace_labels(
    standardized_value_labels$marmp5,
    `-1` = "no valid data"
  ),
    mheight = .replace_labels(
    standardized_value_labels$mheight,
    `-1` = "no valid data"
  ),
    mheightp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp1 = .replace_labels(
    standardized_value_labels$mheightp1,
    `-1` = "no valid data"
  ),
    mheightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp3 = .replace_labels(
    standardized_value_labels$mheightp3,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp4 = .replace_labels(
    standardized_value_labels$mheightp4,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp5 = .replace_labels(
    standardized_value_labels$mheightp5,
    `-1` = "no valid data"
  ),
    mheightp6 = .replace_labels(
    standardized_value_labels$mheightp6,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp7 = .replace_labels(
    standardized_value_labels$mheightp7,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightself = .replace_labels(
    standardized_value_labels$mheightself,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMHEIGHTP",
    `-1` = "no valid data"
  ),
    mhipp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mhipp1 = .replace_labels(
    standardized_value_labels$mhipp1,
    `-1` = "no valid data"
  ),
    mhipp2 = .replace_labels(
    standardized_value_labels$mhipp2,
    `-1` = "no valid data"
  ),
    mhipp3 = .replace_labels(
    standardized_value_labels$mhipp3,
    `-1` = "no valid data"
  ),
    mtricep1 = .replace_labels(
    standardized_value_labels$mtricep1,
    `-3` = "na, wrong skip"
  ),
    mtricepp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mwaistp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mwaistp1 = .replace_labels(
    standardized_value_labels$mwaistp1,
    `-1` = "no valid data"
  ),
    mwaistp2 = .replace_labels(
    standardized_value_labels$mwaistp2,
    `-1` = "no valid data"
  ),
    mwaistp3 = .replace_labels(
    standardized_value_labels$mwaistp3,
    `-1` = "no valid data"
  ),
    mwaistp4 = .replace_labels(
    standardized_value_labels$mwaistp4,
    `-1` = "no valid data"
  ),
    mweight = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data"),
    mweightp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp1 = .replace_labels(
    standardized_value_labels$mweightp1,
    `-1` = "no valid data"
  ),
    mweightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp3 = .replace_labels(
    standardized_value_labels$mweightp3,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp4 = .replace_labels(
    standardized_value_labels$mweightp4,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp5 = .replace_labels(
    standardized_value_labels$mweightp5,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp6 = .replace_labels(
    standardized_value_labels$mweightp6,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp7 = .replace_labels(
    standardized_value_labels$mweightp7,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp8 = .replace_labels(
    standardized_value_labels$mweightp8,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightself = .replace_labels(
    standardized_value_labels$mweightself,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/MWEIGHTP1&8",
    `-1` = "no valid data"
  ),
    rm161 = c(`-2` = "valid data", `2` = "interview terminated")
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mbicep1",
    "mbicepp",
    "mbicepp1",
    "mbicepp3",
    "mbicepp4",
    "mbicepp5",
    "mgripl1",
    "mgriplp1",
    "mgriplp2",
    "mgripr1",
    "mgriprp1",
    "mgriprp2",
    "mheight",
    "mheightp",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mtricep1",
    "mtricepp",
    "mtricepp1",
    "mtricepp3",
    "mtricepp4",
    "mtricepp5",
    "mwaist1",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = .replace_labels(
    standardized_value_labels$marm1,
    `-3` = "na, wrong skip",
    `-1` = "no valid data"
  ),
    marmp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    marmp1 = .replace_labels(
    standardized_value_labels$marmp1,
    `-1` = "no valid data"
  ),
    marmp2 = .replace_labels(
    standardized_value_labels$marmp2,
    `-1` = "no valid data"
  ),
    marmp3 = .replace_labels(
    standardized_value_labels$marmp3,
    `-1` = "no valid data"
  ),
    marmp4 = .replace_labels(
    standardized_value_labels$marmp4,
    `-1` = "no valid data"
  ),
    marmp5 = .replace_labels(
    standardized_value_labels$marmp5,
    `-1` = "no valid data"
  ),
    mgripl1 = .replace_labels(
    standardized_value_labels$mgripl1,
    `-1` = "no valid data"
  ),
    mgriplp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mgriplp2 = .replace_labels(
    standardized_value_labels$mgriplp2,
    `-1` = "no valid data"
  ),
    mgripr1 = .replace_labels(
    standardized_value_labels$mgripr1,
    `-2` = "na, see DRM161"
  ),
    mgriprp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mgriprp2 = .replace_labels(
    standardized_value_labels$mgriprp2,
    `-1` = "no valid data"
  ),
    mheight = .replace_labels(
    standardized_value_labels$mheight,
    `-1` = "no valid data"
  ),
    mheightp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see CRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp3 = .replace_labels(
    standardized_value_labels$mheightp3,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp4 = .replace_labels(
    standardized_value_labels$mheightp4,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp6 = .replace_labels(
    standardized_value_labels$mheightp6,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp7 = .replace_labels(
    standardized_value_labels$mheightp7,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightself = .replace_labels(
    standardized_value_labels$mheightself,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DMHEIGHTP",
    `-1` = "no valid data"
  ),
    mhipp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mhipp1 = .replace_labels(
    standardized_value_labels$mhipp1,
    `-1` = "no valid data"
  ),
    mhipp2 = .replace_labels(
    standardized_value_labels$mhipp2,
    `-1` = "no valid data"
  ),
    mhipp3 = .replace_labels(
    standardized_value_labels$mhipp3,
    `-1` = "no valid data"
  ),
    mhipp4 = .replace_labels(
    standardized_value_labels$mhipp4,
    `-1` = "no valid data"
  ),
    mtricep1 = .replace_labels(
    standardized_value_labels$mtricep1,
    `-3` = "na, wrong skip"
  ),
    mtricepp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mwaistp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mwaistp1 = .replace_labels(
    standardized_value_labels$mwaistp1,
    `-1` = "no valid data"
  ),
    mwaistp2 = .replace_labels(
    standardized_value_labels$mwaistp2,
    `-1` = "no valid data"
  ),
    mwaistp3 = .replace_labels(
    standardized_value_labels$mwaistp3,
    `-1` = "no valid data"
  ),
    mwaistp4 = .replace_labels(
    standardized_value_labels$mwaistp4,
    `-1` = "no valid data"
  ),
    mweight = c(`-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data"),
    mweightp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see C/DRM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp3 = .replace_labels(
    standardized_value_labels$mweightp3,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp4 = .replace_labels(
    standardized_value_labels$mweightp4,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp5 = .replace_labels(
    standardized_value_labels$mweightp5,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp6 = .replace_labels(
    standardized_value_labels$mweightp6,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp7 = .replace_labels(
    standardized_value_labels$mweightp7,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp8 = .replace_labels(
    standardized_value_labels$mweightp8,
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp9 = .replace_labels(
    standardized_value_labels$mweightp9,
    `-1` = "no valid data"
  ),
    mweightself = .replace_labels(
    standardized_value_labels$mweightself,
    `-3` = "na, wrong skip",
    `-2` = "na, see C/MWEIGHTP1&8",
    `-1` = "no valid data"
  ),
    rm161 = c(`-2` = "valid data")
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels[c(
    "mgripl1",
    "mgriplp1",
    "mgriplp2",
    "mgripr1",
    "mgriprp1",
    "mgriprp2",
    "mheight",
    "mheightp",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mwaist1",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp2",
    "mweightself",
    "rm161"
  )],
    mgripl1 = .replace_labels(
    standardized_value_labels$mgripl1,
    `-2` = "na, see ERM161",
    `-1` = "no valid data"
  ),
    mgriplp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ERM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mgriplp2 = .replace_labels(
    standardized_value_labels$mgriplp2,
    `-2` = "na, see EMGRIPLP1",
    `-1` = "no valid data"
  ),
    mgripr1 = .replace_labels(
    standardized_value_labels$mgripr1,
    `-2` = "na, see ERM161"
  ),
    mgriprp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ERM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mgriprp2 = .replace_labels(
    standardized_value_labels$mgriprp2,
    `-2` = "na, see EMGRIPRP1",
    `-1` = "no valid data"
  ),
    mheight = .replace_labels(
    standardized_value_labels$mheight,
    `-2` = "na, see ERM161",
    `-1` = "no valid data"
  ),
    mheightp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ERM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see EMHEIGHTP",
    `-1` = "no valid data",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mheightp3 = .replace_labels(
    standardized_value_labels$mheightp3,
    `-2` = "na, see ERM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp4 = .replace_labels(
    standardized_value_labels$mheightp4,
    `-2` = "na, see ERM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp6 = .replace_labels(
    standardized_value_labels$mheightp6,
    `-2` = "na, see ERM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp7 = .replace_labels(
    standardized_value_labels$mheightp7,
    `-2` = "na, see ERM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mheightself = .replace_labels(
    standardized_value_labels$mheightself,
    `-3` = "na, wrong skip",
    `-2` = "na, see EMHEIGHTP7",
    `-1` = "no valid data"
  ),
    mhip1 = .replace_labels(
    standardized_value_labels$mhip1,
    `-2` = "na, see ERM161"
  ),
    mhipp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ERM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mhipp1 = .replace_labels(
    standardized_value_labels$mhipp1,
    `-2` = "na, see EMHIPP",
    `-1` = "no valid data"
  ),
    mhipp2 = .replace_labels(
    standardized_value_labels$mhipp2,
    `-2` = "na, see ERM161",
    `-1` = "no valid data"
  ),
    mhipp3 = .replace_labels(
    standardized_value_labels$mhipp3,
    `-2` = "na, see ERM161",
    `-1` = "no valid data"
  ),
    mhipp4 = .replace_labels(
    standardized_value_labels$mhipp4,
    `-2` = "na, see ERM161",
    `-1` = "no valid data"
  ),
    mwaist1 = .replace_labels(
    standardized_value_labels$mwaist1,
    `-2` = "na, see ERM161"
  ),
    mwaistp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see ERM161",
    `-1` = "no valid data",
    `1` = "no",
    `2` = "yes"
  ),
    mwaistp1 = .replace_labels(
    standardized_value_labels$mwaistp1,
    `-2` = "na, see EMWAISTP",
    `-1` = "no valid data"
  ),
    mwaistp2 = .replace_labels(
    standardized_value_labels$mwaistp2,
    `-2` = "na, see ERM161",
    `-1` = "no valid data"
  ),
    mwaistp3 = .replace_labels(
    standardized_value_labels$mwaistp3,
    `-2` = "na, see ERM161",
    `-1` = "no valid data"
  ),
    mwaistp4 = .replace_labels(
    standardized_value_labels$mwaistp4,
    `-2` = "na, see ERM161",
    `-1` = "no valid data"
  ),
    mweight = c(`-3` = "na, wrong skip", `-2` = "na, see ERM161", `-1` = "no valid data"),
    mweightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see EMWEIGHTP",
    `-1` = "no valid data",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mweightself = .replace_labels(
    standardized_value_labels$mweightself,
    `-3` = "na, wrong skip",
    `-2` = "na, see EMWEIGHT8",
    `-1` = "no valid data"
  ),
    rm161 = c(`-2` = "valid data", `2` = "interview terminated")
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels[c(
    "mgriplp",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripmeasp",
    "mgriprp",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightself"
  )],
    mgriplp = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mgriplp2 = c(`-2` = "na, see BMGRIPLP", `0` = "not mentioned", `1` = "mentioned"),
    mgriplp3 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mgriplp4 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mgriprp = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mgriprp2 = c(`-2` = "na, see BMGRIPRP", `0` = "not mentioned", `1` = "mentioned"),
    mgriprp3 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mgriprp4 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mheight = c(`-2` = "na, see BRM161", `-1` = "no valid data"),
    mheightp = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mheightp1 = c(`-2` = "na, see BMHEIGHTP", `0` = "not mentioned", `1` = "mentioned"),
    mheightp2 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mheightp3 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mheightp4 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mheightp6 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mheightp7 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mheightself = .replace_labels(
    standardized_value_labels$mheightself,
    `-3` = "na wrong skip",
    `-2` = "na, see BMHEIHGTP1 & 7",
    `-1` = "no valid data"
  ),
    mhip1 = c(`-2` = "na, see BRM161"),
    mhip2 = .replace_labels(
    standardized_value_labels$mhip2,
    `-1` = "no valid data"
  ),
    mhipp = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mhipp1 = c(`-2` = "na, see BMHIPP", `0` = "not mentioned", `1` = "mentioned"),
    mhipp2 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mhipp3 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mwaist1 = c(`-2` = "na, see BRM161"),
    mwaist2 = .replace_labels(
    standardized_value_labels$mwaist2,
    `-1` = "no valid data"
  ),
    mwaistp = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mwaistp1 = c(`-2` = "na, see BMWAISTP", `0` = "not mentioned", `1` = "mentioned"),
    mwaistp2 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mwaistp3 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mwaistp4 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes"),
    mweight = c(`-2` = "na, see BRM161", `-1` = "no valid data"),
    mweightp = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mweightp1 = c(`-2` = "na, see BMWEIGHTP", `0` = "not mentioned", `1` = "mentioned"),
    mweightp2 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mweightp3 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mweightp4 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mweightp5 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mweightp6 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mweightp7 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mweightp8 = c(`-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no"),
    mweightself = .replace_labels(
    standardized_value_labels$mweightself,
    `-3` = "na, wrong skip",
    `-2` = "na, see BMWEIGHT1 & 8",
    `-1` = "no valid data"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels[c(
    "mgripl1",
    "mgripl2",
    "mgriplp",
    "mgripr1",
    "mgripr2",
    "mgriprp",
    "mheight",
    "mheightp",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mwaistp",
    "mweightp",
    "mweightself",
    "rm161"
  )],
    mgripl1 = c(`-2` = "na, see FRM161"),
    mgriplp = .replace_labels(
    standardized_value_labels$mgriplp,
    `-2` = "na, see FRM161",
    `-1` = "na, asked",
    `1` = "no particularities",
    `2` = "left hand handicapped"
  ),
    mgripr1 = c(`-2` = "na, see FRM161"),
    mgriprp = .replace_labels(
    standardized_value_labels$mgriprp,
    `-2` = "na, see FRM161",
    `-1` = "na, asked",
    `1` = "no particularities",
    `2` = "right hand handicapped"
  ),
    mheight = c(`-2` = "na, see FRM161", `-1` = "na, asked"),
    mheightp = c(
    `-2` = "na, see FRM161",
    `-1` = "na, asked",
    `1` = "no particularities",
    `2` = "cannot stand",
    `3` = "kyphosis",
    `4` = "scoliosis",
    `5` = "head not parallel",
    `6` = "too much hair",
    `7` = "wears shoes",
    `8` = "R refused"
  ),
    mheightself = c(`-2` = "na, see FRM161", `-1` = "na, asked"),
    mhip1 = c(`-2` = "na, see FRM161"),
    mhip2 = .replace_labels(
    standardized_value_labels$mhip2,
    `-1` = "na, asked"
  ),
    mhipp = c(
    `-2` = "na, see FRM161",
    `-1` = "na, asked",
    `1` = "no particularities",
    `2` = "lying down",
    `3` = "many skinfolds",
    `4` = "R refused"
  ),
    mwaistp = c(
    `-2` = "na, see FRM161",
    `-1` = "na, asked",
    `1` = "no particularities",
    `2` = "lying down",
    `3` = "hard to find right spot",
    `4` = "many skinfolds",
    `5` = "R refused"
  ),
    mweightp = c(
    `-2` = "na, see FRM161",
    `-1` = "na, asked",
    `1` = "no particularities",
    `2` = "cannot stand",
    `3` = "wears clothes",
    `4` = "wears corset",
    `5` = "amputated",
    `6` = "brace",
    `7` = "prosthesis",
    `8` = "wears shoes",
    `9` = "weight > 150 kg",
    `10` = "R refused"
  ),
    mweightself = c(`-2` = "na, see FRM161", `-1` = "na, asked"),
    rm161 = .replace_labels(
    standardized_value_labels$rm161,
    `-2` = "valid data",
    `1` = "short version"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels[c(
    "mgripl1",
    "mgripl2",
    "mgriplp1",
    "mgriplp2",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    mgripl1 = c(`-2` = "na, see GRM161"),
    mgriplp1 = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mgriplp2 = c(`-3` = "na, wrong skip", `-2` = "na, see GMGRIPLP1", `0` = "not mentioned", `1` = "mentioned"),
    mgripr1 = c(`-2` = "na, see GRM161"),
    mgriprp1 = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mgriprp2 = c(`-3` = "na, wrong skip", `-2` = "na, see GMGRIPRP1", `0` = "not mentioned", `1` = "mentioned"),
    mheight = c(`-2` = "na, see GRM161", `-1` = "na, asked"),
    mheightp = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mheightp1 = .replace_labels(
    standardized_value_labels$mheightp1,
    `-2` = "na, see GMHEIGHTP",
    `-1` = "na, asked"
  ),
    mheightp2 = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mheightp3 = .replace_labels(
    standardized_value_labels$mheightp3,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp4 = .replace_labels(
    standardized_value_labels$mheightp4,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp5 = .replace_labels(
    standardized_value_labels$mheightp5,
    `-2` = "na, see GRM161",
    `-1` = "na, asked"
  ),
    mheightp6 = .replace_labels(
    standardized_value_labels$mheightp6,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp7 = .replace_labels(
    standardized_value_labels$mheightp7,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightself = c(`-2` = "na, see GMHEIGHT", `-1` = "na, asked"),
    mhip1 = c(`-2` = "na, see GRM161"),
    mhip2 = .replace_labels(
    standardized_value_labels$mhip2,
    `-1` = "na, asked"
  ),
    mhipp = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `1` = "no", `2` = "yes"),
    mhipp1 = .replace_labels(
    standardized_value_labels$mhipp1,
    `-2` = "na, see GMHIPP",
    `-1` = "na, asked"
  ),
    mhipp2 = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `1` = "no", `2` = "yes"),
    mhipp3 = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `1` = "no", `2` = "yes"),
    mwaist1 = c(`-2` = "na, see GRM161"),
    mwaist2 = .replace_labels(
    standardized_value_labels$mwaist2,
    `-1` = "na, asked"
  ),
    mwaistp = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp1 = .replace_labels(
    standardized_value_labels$mwaistp1,
    `-2` = "na, see GMWAISTP",
    `-1` = "na, asked"
  ),
    mwaistp2 = .replace_labels(
    standardized_value_labels$mwaistp2,
    `-2` = "na, see GRM161",
    `-1` = "na, asked"
  ),
    mwaistp3 = .replace_labels(
    standardized_value_labels$mwaistp3,
    `-2` = "na, see GRM161",
    `-1` = "na, asked"
  ),
    mwaistp4 = .replace_labels(
    standardized_value_labels$mwaistp4,
    `-2` = "na, see GRM161",
    `-1` = "na, asked"
  ),
    mweight = c(`-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp1 = .replace_labels(
    standardized_value_labels$mweightp1,
    `-2` = "na, see GMWEIGHTP",
    `-1` = "na, asked"
  ),
    mweightp2 = c(`-3` = "na, wrong skip", `-2` = "na, see GRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp3 = .replace_labels(
    standardized_value_labels$mweightp3,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp4 = .replace_labels(
    standardized_value_labels$mweightp4,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp5 = .replace_labels(
    standardized_value_labels$mweightp5,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp6 = .replace_labels(
    standardized_value_labels$mweightp6,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp7 = .replace_labels(
    standardized_value_labels$mweightp7,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp8 = .replace_labels(
    standardized_value_labels$mweightp8,
    `-2` = "na, see GRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mweightp9 = .replace_labels(
    standardized_value_labels$mweightp9,
    `-2` = "na, see GRM161",
    `-1` = "na, asked"
  ),
    mweightself = c(`-2` = "na, see GMWEIGHT", `-1` = "na, asked"),
    rm161 = .replace_labels(
    standardized_value_labels$rm161,
    `-2` = "valid data",
    `1` = "short version"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mgripl1",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = .replace_labels(
    standardized_value_labels$marm1,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked"
  ),
    marmp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp1 = c(`-2` = "na, see H/B/I/JMARMP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    marmp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp5 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mgripl1 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mgriplp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriplp2 = .replace_labels(
    standardized_value_labels$mgriplp2,
    `-2` = "na, see H/B/I/JMGRIPLP1",
    `-1` = "na, asked"
  ),
    mgriplp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriplp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgripr1 = c(`-2` = "na, see H/B/I/JRM161"),
    mgriprp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriprp2 = .replace_labels(
    standardized_value_labels$mgriprp2,
    `-2` = "na, see H/B/I/JMGRIPRP1",
    `-1` = "na, asked"
  ),
    mgriprp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriprp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mheight = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mheightp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp1 = c(
    `-2` = "na, see H/B/I/JMHEIGHTP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mheightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp3 = .replace_labels(
    standardized_value_labels$mheightp3,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp4 = .replace_labels(
    standardized_value_labels$mheightp4,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp5 = .replace_labels(
    standardized_value_labels$mheightp5,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked"
  ),
    mheightp6 = .replace_labels(
    standardized_value_labels$mheightp6,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp7 = .replace_labels(
    standardized_value_labels$mheightp7,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightself = c(`-2` = "na, see H/B/IMHEIGHT", `-1` = "na, asked"),
    mhip1 = c(`-2` = "na, see H/B/I/JRM161"),
    mhip2 = .replace_labels(
    standardized_value_labels$mhip2,
    `-1` = "na, asked"
  ),
    mhipp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp1 = c(`-2` = "na, see H/B/I/JMHIPP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mhipp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaist1 = c(`-2` = "na, see H/B/I/JRM161"),
    mwaist2 = .replace_labels(
    standardized_value_labels$mwaist2,
    `-1` = "na, asked"
  ),
    mwaistp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp1 = c(`-2` = "na, see H/B/I/JMWAISTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mwaistp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweight = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mweightp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp1 = c(
    `-2` = "na, see H/B/I/JMWEIHGTP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mweightp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp5 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp6 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp7 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp8 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp9 = c(`-1` = "na, asked"),
    mweightself = c(`-2` = "na, see H/B/IMWEIGHT/ routing", `-1` = "na, asked"),
    rm161 = .replace_labels(
    standardized_value_labels$rm161,
    `-2` = "valid data",
    `1` = "short interview"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mgripl1",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mmiwp",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mwaistp5",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = .replace_labels(
    standardized_value_labels$marm1,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked"
  ),
    marmp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp1 = c(`-2` = "na, see H/B/I/JMARMP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    marmp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp5 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mgripl1 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mgriplp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriplp2 = .replace_labels(
    standardized_value_labels$mgriplp2,
    `-2` = "na, see H/B/I/JMGRIPLP1",
    `-1` = "na, asked"
  ),
    mgriplp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriplp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgripr1 = c(`-2` = "na, see H/B/I/JRM161"),
    mgriprp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriprp2 = .replace_labels(
    standardized_value_labels$mgriprp2,
    `-2` = "na, see H/B/I/JMGRIPRP1",
    `-1` = "na, asked"
  ),
    mgriprp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriprp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mheight = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mheightp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp1 = c(
    `-2` = "na, see H/B/I/JMHEIGHTP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mheightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp3 = .replace_labels(
    standardized_value_labels$mheightp3,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp4 = .replace_labels(
    standardized_value_labels$mheightp4,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp5 = .replace_labels(
    standardized_value_labels$mheightp5,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked"
  ),
    mheightp6 = .replace_labels(
    standardized_value_labels$mheightp6,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp7 = .replace_labels(
    standardized_value_labels$mheightp7,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightself = c(`-2` = "na, see H/B/IMHEIGHT", `-1` = "na, asked"),
    mhip1 = c(`-2` = "na, see H/B/I/JRM161"),
    mhip2 = .replace_labels(
    standardized_value_labels$mhip2,
    `-1` = "na, asked"
  ),
    mhipp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp1 = c(`-2` = "na, see H/B/I/JMHIPP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mhipp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmiwp = .replace_labels(
    standardized_value_labels$mmiwp,
    `1` = "no",
    `2` = "yes"
  ),
    mwaist1 = c(`-2` = "na, see H/B/I/JRM161"),
    mwaist2 = .replace_labels(
    standardized_value_labels$mwaist2,
    `-1` = "na, asked"
  ),
    mwaistp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp1 = c(`-2` = "na, see H/B/I/JMWAISTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mwaistp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweight = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mweightp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp1 = c(
    `-2` = "na, see H/B/I/JMWEIHGTP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mweightp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp5 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp6 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp7 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp8 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp9 = c(`-1` = "na, asked"),
    mweightself = c(`-2` = "na, see H/B/IMWEIGHT/ routing", `-1` = "na, asked"),
    rm161 = .replace_labels(
    standardized_value_labels$rm161,
    `-2` = "valid data",
    `1` = "short interview"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mcalf01",
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mgripl1",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mmiwp",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mwaistp5",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = .replace_labels(
    standardized_value_labels$marm1,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked"
  ),
    marmp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp1 = c(`-2` = "na, see H/B/I/JMARMP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    marmp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp5 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mgripl1 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mgriplp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriplp2 = .replace_labels(
    standardized_value_labels$mgriplp2,
    `-2` = "na, see H/B/I/JMGRIPLP1",
    `-1` = "na, asked"
  ),
    mgriplp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriplp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgripr1 = c(`-2` = "na, see H/B/I/JRM161"),
    mgriprp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriprp2 = .replace_labels(
    standardized_value_labels$mgriprp2,
    `-2` = "na, see H/B/I/JMGRIPRP1",
    `-1` = "na, asked"
  ),
    mgriprp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriprp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mheight = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mheightp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp1 = c(
    `-2` = "na, see H/B/I/JMHEIGHTP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mheightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp3 = .replace_labels(
    standardized_value_labels$mheightp3,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp4 = .replace_labels(
    standardized_value_labels$mheightp4,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp5 = .replace_labels(
    standardized_value_labels$mheightp5,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked"
  ),
    mheightp6 = .replace_labels(
    standardized_value_labels$mheightp6,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp7 = .replace_labels(
    standardized_value_labels$mheightp7,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightself = c(`-2` = "na, see H/B/IMHEIGHT", `-1` = "na, asked"),
    mhip1 = c(`-2` = "na, see H/B/I/JRM161"),
    mhip2 = .replace_labels(
    standardized_value_labels$mhip2,
    `-1` = "na, asked"
  ),
    mhipp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp1 = c(`-2` = "na, see H/B/I/JMHIPP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mhipp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmiwp = .replace_labels(
    standardized_value_labels$mmiwp,
    `-2` = "na, see I/JRM161",
    `1` = "yes",
    `2` = "no"
  ),
    mwaist1 = c(`-2` = "na, see H/B/I/JRM161"),
    mwaist2 = .replace_labels(
    standardized_value_labels$mwaist2,
    `-1` = "na, asked"
  ),
    mwaistp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp1 = c(`-2` = "na, see H/B/I/JMWAISTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mwaistp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweight = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mweightp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp1 = c(
    `-2` = "na, see H/B/I/JMWEIHGTP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mweightp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp5 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp6 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp7 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp8 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp9 = c(`-1` = "na, asked"),
    mweightself = c(`-2` = "na, see H/B/IMWEIGHT/ routing", `-1` = "na, asked"),
    rm161 = .replace_labels(
    standardized_value_labels$rm161,
    `-2` = "valid data",
    `1` = "short interview"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels[c(
    "marm1",
    "marmp",
    "marmp1",
    "marmp2",
    "marmp3",
    "marmp4",
    "marmp5",
    "mcalf01",
    "mcalf02",
    "mcalf03",
    "mcalf04",
    "mcalf06",
    "mcalf12",
    "mcalf13",
    "mgripl1",
    "mgriplp1",
    "mgriplp2",
    "mgriplp3",
    "mgriplp4",
    "mgripr1",
    "mgripr2",
    "mgriprp1",
    "mgriprp2",
    "mgriprp3",
    "mgriprp4",
    "mheight",
    "mheightp",
    "mheightp1",
    "mheightp2",
    "mheightp3",
    "mheightp4",
    "mheightp5",
    "mheightp6",
    "mheightp7",
    "mheightself",
    "mhip1",
    "mhip2",
    "mhipp",
    "mhipp1",
    "mhipp2",
    "mhipp3",
    "mhipp4",
    "mmiwp",
    "mwaist1",
    "mwaist2",
    "mwaistp",
    "mwaistp1",
    "mwaistp2",
    "mwaistp3",
    "mwaistp4",
    "mwaistp5",
    "mweight",
    "mweightp",
    "mweightp1",
    "mweightp2",
    "mweightp3",
    "mweightp4",
    "mweightp5",
    "mweightp6",
    "mweightp7",
    "mweightp8",
    "mweightp9",
    "mweightself",
    "rm161"
  )],
    marm1 = .replace_labels(
    standardized_value_labels$marm1,
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked"
  ),
    marmp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp1 = c(`-2` = "na, see H/B/I/JMARMP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    marmp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    marmp5 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mgripl1 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mgriplp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriplp2 = .replace_labels(
    standardized_value_labels$mgriplp2,
    `-2` = "na, see H/B/I/JMGRIPLP1",
    `-1` = "na, asked"
  ),
    mgriplp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriplp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgripr1 = c(`-2` = "na, see H/B/I/JRM161"),
    mgriprp1 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriprp2 = .replace_labels(
    standardized_value_labels$mgriprp2,
    `-2` = "na, see H/B/I/JMGRIPRP1",
    `-1` = "na, asked"
  ),
    mgriprp3 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mgriprp4 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mheight = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mheightp = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp1 = c(
    `-2` = "na, see H/B/I/JMHEIGHTP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mheightp2 = c(
    `-3` = "na, wrong skip",
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp3 = .replace_labels(
    standardized_value_labels$mheightp3,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp4 = .replace_labels(
    standardized_value_labels$mheightp4,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp5 = .replace_labels(
    standardized_value_labels$mheightp5,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked"
  ),
    mheightp6 = .replace_labels(
    standardized_value_labels$mheightp6,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightp7 = .replace_labels(
    standardized_value_labels$mheightp7,
    `-2` = "na, see H/B/I/JRM161",
    `-1` = "na, asked",
    `1` = "no",
    `2` = "yes"
  ),
    mheightself = c(`-2` = "routing", `-1` = "na, asked"),
    mhip1 = c(`-2` = "na, see H/B/I/JRM161"),
    mhip2 = .replace_labels(
    standardized_value_labels$mhip2,
    `-1` = "na, asked"
  ),
    mhipp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp1 = c(`-2` = "na, see H/B/I/JMHIPP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mhipp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mhipp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mmiwp = .replace_labels(
    standardized_value_labels$mmiwp,
    `-2` = "na, see I/JRM161",
    `1` = "yes",
    `2` = "no"
  ),
    mwaist1 = c(`-2` = "na, see H/B/I/JRM161"),
    mwaist2 = .replace_labels(
    standardized_value_labels$mwaist2,
    `-1` = "na, asked"
  ),
    mwaistp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp1 = c(`-2` = "na, see H/B/I/JMWAISTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned"),
    mwaistp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mwaistp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweight = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked"),
    mweightp = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp1 = c(
    `-2` = "na, see H/B/I/JMWEIHGTP",
    `-1` = "na, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
    mweightp2 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp3 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp4 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp5 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp6 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp7 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp8 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightp9 = c(`-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes"),
    mweightself = .replace_labels(
    standardized_value_labels$mweightself,
    `-3` = "na, wrong skip",
    `-2` = "na, see JMWEIGHT",
    `-1` = "na, asked"
  ),
    rm161 = .replace_labels(
    standardized_value_labels$rm161,
    `-2` = "valid data",
    `1` = "short interview"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  marm1 = "numeric",
  marm2 = "numeric",
  marmp = "categorical",
  marmp1 = "categorical",
  marmp2 = "categorical",
  marmp3 = "categorical",
  marmp4 = "categorical",
  marmp5 = "categorical",
  mbicep1 = "numeric",
  mbicep2 = "numeric",
  mbicep3 = "numeric",
  mbicepp = "categorical",
  mbicepp1 = "categorical",
  mbicepp2 = "categorical",
  mbicepp3 = "categorical",
  mbicepp4 = "categorical",
  mbicepp5 = "categorical",
  mcalf01 = "numeric",
  mcalf02 = "categorical",
  mcalf03 = "categorical",
  mcalf04 = "categorical",
  mcalf06 = "categorical",
  mcalf12 = "categorical",
  mcalf13 = "categorical",
  mgripl1 = "numeric",
  mgripl2 = "numeric",
  mgriplp = "categorical",
  mgriplp1 = "categorical",
  mgriplp2 = "categorical",
  mgriplp3 = "numeric",
  mgriplp4 = "numeric",
  mgripmeasp = "categorical",
  mgripp = "categorical",
  mgripr1 = "numeric",
  mgripr2 = "numeric",
  mgriprp = "categorical",
  mgriprp1 = "categorical",
  mgriprp2 = "categorical",
  mgriprp3 = "numeric",
  mgriprp4 = "numeric",
  mheight = "numeric",
  mheightp = "categorical",
  mheightp1 = "categorical",
  mheightp2 = "categorical",
  mheightp3 = "categorical",
  mheightp4 = "categorical",
  mheightp5 = "categorical",
  mheightp6 = "categorical",
  mheightp7 = "categorical",
  mheightself = "numeric",
  mhip = "numeric",
  mhip1 = "numeric",
  mhip2 = "numeric",
  mhipp = "categorical",
  mhipp1 = "categorical",
  mhipp2 = "categorical",
  mhipp3 = "categorical",
  mhipp4 = "categorical",
  mkneeh = "numeric",
  mkneep = "categorical",
  mlength = "numeric",
  mmiwp = "categorical",
  msubscap1 = "numeric",
  msubscap2 = "numeric",
  msubscap3 = "numeric",
  msubscapp = "categorical",
  msubscapp1 = "categorical",
  msubscapp2 = "categorical",
  msubscapp3 = "categorical",
  msubscapp4 = "categorical",
  msubscapp5 = "categorical",
  msuprail1 = "numeric",
  msuprail2 = "numeric",
  msuprail3 = "numeric",
  msuprailp = "categorical",
  msuprailp1 = "categorical",
  msuprailp2 = "categorical",
  msuprailp3 = "categorical",
  msuprailp4 = "categorical",
  msuprailp5 = "categorical",
  mtricep1 = "numeric",
  mtricep2 = "numeric",
  mtricep3 = "numeric",
  mtricepp = "categorical",
  mtricepp1 = "categorical",
  mtricepp2 = "categorical",
  mtricepp3 = "categorical",
  mtricepp4 = "categorical",
  mtricepp5 = "categorical",
  mwaist = "numeric",
  mwaist1 = "numeric",
  mwaist2 = "numeric",
  mwaistp = "categorical",
  mwaistp1 = "categorical",
  mwaistp2 = "categorical",
  mwaistp3 = "categorical",
  mwaistp4 = "categorical",
  mwaistp5 = "categorical",
  mweight = "numeric",
  mweightp = "categorical",
  mweightp1 = "categorical",
  mweightp2 = "categorical",
  mweightp3 = "categorical",
  mweightp4 = "categorical",
  mweightp5 = "categorical",
  mweightp6 = "categorical",
  mweightp7 = "numeric",
  mweightp8 = "categorical",
  mweightp9 = "categorical",
  mweightself = "numeric",
  rm161 = "numeric"
)

.lasa_fc_161 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "161", waves = .lasa_wave_rows()) |>
    .override_label(wave = "G", variable = "mweightself", override_value = "gmweighself") |>
    .override_label(wave = "H", variable = "mweightself", override_value = "hweightself") |>
    .override_label(wave = "3B", variable = "mweightself", override_value = "bweightself") |>
    .override_label(wave = "I", variable = "mweightself", override_value = "iweightself") |>
    .override_label(wave = "J", variable = "mweightself", override_value = "jweightself"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "161", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "161", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "161", waves = .lasa_wave_rows())
)
