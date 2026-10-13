## LASA filecode 161 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  mcalf03 = "Calf: refused",
  mcalf04 = "Calf: R sitting down",
  mcalf06 = "Calf: on right leg",
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
  rm161 = "Reason missing: LASAH/B/I/J161",
  .applies_to_waves = c("Z")
)

variable_labels(
  "marmp",
  .applies_to_waves = c("B", "H", "3B", "I", "J")
)

variable_labels(
  "mhip", "mkneeh", "mkneep", "mlength", "mwaist",
  .applies_to_waves = c("B")
)

variable_labels(
  "mweight", "mweightself",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "marmp1", "marmp2", "marmp3", "marmp4", "marmp5",
  .applies_to_waves = c("C", "D", "H", "3B", "I", "J")
)

variable_labels(
  "mbicep1", "mbicep2", "mbicep3", "mbicepp", "mbicepp1", "mbicepp3", "mbicepp4", "mbicepp5", "mtricep1", "mtricep2", "mtricep3", "mtricepp", "mtricepp1", "mtricepp3", "mtricepp4", "mtricepp5",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  "mbicepp2", "mgripp", "msubscap1", "msubscap2", "msubscap3", "msubscapp", "msubscapp1", "msubscapp2", "msubscapp3", "msubscapp4", "msubscapp5", "msuprail1", "msuprail2", "msuprail3", "msuprailp", "msuprailp1", "msuprailp2", "msuprailp3", "msuprailp4", "msuprailp5", "mtricepp2",
  .applies_to_waves = c("C")
)

variable_labels(
  "mgripl1", "mgripl2", "mgripr1", "mheight", "mheightp", "mheightself", "mhip1", "mhipp", "mwaistp",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mgripr2",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "H", "3B", "I", "J")
)

variable_labels(
  "mheightp1", "mweightp1",
  .applies_to_waves = c("C", "2B", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mheightp2", "mheightp3", "mheightp4", "mheightp6", "mheightp7", "mhipp1", "mhipp2", "mhipp3", "mwaistp1", "mwaistp2", "mwaistp4", "mweightp2", "mweightp3", "mweightp4", "mweightp5", "mweightp6", "mweightp8",
  .applies_to_waves = c("C", "D", "E", "2B", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mheightp5",
  .applies_to_waves = c("C", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mhip2",
  .applies_to_waves = c("C", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mwaistp3",
  .applies_to_waves = c("C", "D", "E", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mweightp",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "mgriplp2", "mgriplp3", "mgriprp2", "mgriprp3", "mweightp9",
  .applies_to_waves = c("D", "E", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mgriplp4", "mgriprp4",
  .applies_to_waves = c("E", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mweightp7",
  .applies_to_waves = c("E", "2B", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mgriplp", "mgripmeasp", "mgriprp",
  .applies_to_waves = c("2B")
)

variable_labels(
  "mgriplp1", "mgriprp1", "rm161",
  .applies_to_waves = c("H", "3B", "I", "J")
)

variable_labels(
  "mhipp4", "mwaistp5",
  .applies_to_waves = c("3B", "I", "J")
)

variable_labels(
  "mcalf01", "mcalf03", "mcalf04", "mcalf06", "mcalf13", "mmiwp",
  .applies_to_waves = c("I", "J")
)

variable_labels(
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
  .applies_to_waves = c("B")
)

variable_labels(
  mweightp = "Weight: particularities",
  .applies_to_waves = c("B", "H", "3B", "I", "J")
)

variable_labels(
  marm1 = "Measured arm (1) in cm",
  marm2 = "Measured arm (2) in cm",
  marmp = "Arm particularities",
  mwaist1 = "Measured waist (1) in mm",
  mweightp7 = "Weight: >150 kg",
  .applies_to_waves = c("C", "D")
)

variable_labels(
  mwaist2 = "Measured waist (2) in mm",
  rm161 = "Reason missing: LASAC161",
  .applies_to_waves = c("C")
)

variable_labels(
  mgriplp1 = "Hand strength: left part.",
  mgriprp1 = "Hand strength: right part.",
  .applies_to_waves = c("D", "G")
)

variable_labels(
  mhipp4 = "Hip: other remakrs",
  rm161 = "Reason missing: LASAD161",
  .applies_to_waves = c("D")
)

variable_labels(
  mgriplp1 = "Hand strength: left part",
  mgriprp1 = "Hand strength: right part",
  mhipp4 = "Hip: other remarks",
  rm161 = "Reason missing: LASAE161",
  .applies_to_waves = c("E")
)

variable_labels(
  mwaist1 = "Measured waist (1) in cm",
  mwaist2 = "Measured waist (2) in cm",
  .applies_to_waves = c("E", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  mgriplp2 = "Hand strength left: handicap",
  mgriplp3 = "Hand strength left: refused",
  mgriplp4 = "Hand strength left: other",
  mgriprp2 = "Hand strength right: handicap",
  mgriprp3 = "Hand strength right: refused",
  mgriprp4 = "Hand strength right: other",
  mwaistp3 = "Waist: much skinfolds",
  .applies_to_waves = c("2B")
)

variable_labels(
  mgriplp = "Hand strength left particularities",
  mgriprp = "Hand strength right particularities",
  rm161 = "Reason missing: LASAF161",
  .applies_to_waves = c("F")
)

variable_labels(
  mgripr2 = "Hand strength (2): right: kgf",
  rm161 = "Reason missing: LASAG161",
  .applies_to_waves = c("G")
)

variable_labels(
  marm1 = "Measured arm in cm",
  .applies_to_waves = c("H", "3B", "I", "J")
)

variable_labels(
  mmiwp = "Measurement instruments were working properly",
  .applies_to_waves = c("3B")
)

variable_labels(
  mcalf02 = NA_character_,
  mcalf12 = NA_character_,
  .applies_to_waves = c("I", "J")
)

# define value labels ----
value_labels(
  `-1` = "no valid data / na, asked",
  .applies_to_vars = c("marm1", "marmp1", "marmp2", "marmp3", "marmp4", "marmp5", "mgripl1", "mgriplp", "mgriplp1", "mgriplp2", "mgriplp3", "mgriplp4", "mgriprp", "mgriprp1", "mgriprp2", "mgriprp3", "mgriprp4", "mheight", "mheightp1", "mheightp2", "mheightp3", "mheightp4", "mheightp5", "mheightp6", "mheightp7", "mheightself", "mhip2", "mhipp1", "mhipp2", "mhipp3", "mhipp4", "mwaist2", "mwaistp1", "mwaistp2", "mwaistp3", "mwaistp4", "mweight", "mweightp1", "mweightp2", "mweightp3", "mweightp4", "mweightp5", "mweightp6", "mweightp7", "mweightp8", "mweightp9", "mweightself"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no measurement / na, wrong skip",
  .applies_to_vars = c("marm1", "marmp", "mheightp", "mheightself", "mhipp", "mtricep1", "mtricepp", "mwaistp", "mweightp", "mweightself"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see C/DRM161",
  .applies_to_vars = c("marm1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("marm2", "mtricep2"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "no answer, skipped / na, see C/DRM161", `-1` = "no particularities scored / no valid data / na, asked", `1` = "no bare arm / no", `2` = "much room between / yes", `3` = "R sitting down", `4` = "on right arm", `5` = "refused",
  .applies_to_vars = c("marmp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMARMP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("marmp1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `1` = "no", `2` = "yes",
  .applies_to_vars = c("marmp2", "marmp3", "marmp4", "marmp5", "mhipp2", "mhipp3", "mhipp4", "mwaistp2", "mwaistp3", "mwaistp4", "mweight", "mweightp9"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data",
  .applies_to_vars = c("mbicep1", "mwaist1"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbicepp", "mbicepp3", "mbicepp4", "mbicepp5", "mtricepp3", "mtricepp4", "mtricepp5"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMBICEPP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mbicepp1"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mbicepp2", "mtricepp2"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see I/JRM161", `-1` = "na, asked",
  .applies_to_vars = c("mcalf01"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mcalf02"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mcalf03", "mcalf04", "mcalf06", "mcalf12", "mcalf13"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see DRM161",
  .applies_to_vars = c("mgripl1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mgripl2"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `-2` = "na, see BRM161", `1` = "no / no particularities", `2` = "yes / left hand handicapped", `3` = "R refused", `4` = "other remark",
  .applies_to_vars = c("mgriplp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see DRM161", `0` = "not mentioned", `1` = "no / mentioned", `2` = "yes",
  .applies_to_vars = c("mgriplp1", "mgriprp1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see dmgriplp1", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriplp2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BRM161", `0` = "not mentioned", `1` = "no / mentioned", `2` = "yes",
  .applies_to_vars = c("mgriplp3", "mgriplp4", "mgriprp3", "mgriprp4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mgripmeasp"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRM161", `-1` = "no valid data", `0` = "no particularities", `1` = "R refuses", `2` = "handicapped hand",
  .applies_to_vars = c("mgripp"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRM161", `-1` = "no valid data",
  .applies_to_vars = c("mgripr1", "msuprail1"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mgripr2"),
  .applies_to_waves = c("Z", "F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see BRM161", `1` = "no / no particularities", `2` = "yes / right hand handicapped", `3` = "R refused", `4` = "other remark",
  .applies_to_vars = c("mgriprp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see DMGRIPRP1", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriprp2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161",
  .applies_to_vars = c("mheight"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no answer, skipped / na, see CRM161", `-1` = "no particularities scored / no valid data / na, asked", `1` = "cannot stand / no / yes / no particularities", `2` = "kyphose / yes / no / cannot stand", `3` = "scoliose / kyphosis", `4` = "head not parallel / scoliosis", `5` = "shoes / head not parallel", `6` = "too much hair", `7` = "refused / wears shoes", `8` = "R refused",
  .applies_to_vars = c("mheightp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMHEIGHTP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mheightp1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRM161", `0` = "not mentioned", `1` = "no / mentioned / yes", `2` = "yes / no",
  .applies_to_vars = c("mheightp2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRM161", `1` = "no / yes", `2` = "yes / no",
  .applies_to_vars = c("mheightp3", "mheightp4", "mheightp6", "mheightp7"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRM161", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mheightp5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "length measured / na, see C/DMHEIGHTP / routing",
  .applies_to_vars = c("mheightself"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na see C/DRM161", `-1` = "no valid data",
  .applies_to_vars = c("mhip1"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-2` = "no answer, skipped / na, see C/DRM161", `-1` = "no particularities scored / no valid data / na, asked", `1` = "lying down / no / no particularities", `2` = "much skinfolds / yes / lying down", `3` = "refused / many skinfolds", `4` = "R refused",
  .applies_to_vars = c("mhipp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMHIPP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mhipp1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no measurement", `-1` = "no valid data",
  .applies_to_vars = c("mkneeh"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "no measurement", `-2` = "no answer, skipped", `-1` = "no valid data", `0` = "no particularities scored", `1` = "refused", `2` = "trousers", `3` = "right leg",
  .applies_to_vars = c("mkneep"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-3` = "no measurement",
  .applies_to_vars = c("mlength"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see BRM161", `-1` = "na, asked", `1` = "no / yes", `2` = "yes / no",
  .applies_to_vars = c("mmiwp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data",
  .applies_to_vars = c("msubscap1"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("msubscapp", "msubscapp2", "msubscapp3", "msubscapp4", "msubscapp5", "msuprailp", "msuprailp2", "msuprailp3", "msuprailp4", "msuprailp5"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMSUBSCAPP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("msubscapp1"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CMSUPRAILP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("msuprailp1"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "na, see C/DRM161", `-1` = "no valid data",
  .applies_to_vars = c("mtricep1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no answer, skipped / na, see C/DRM161", `-1` = "no valid data", `0` = "no particularities scored", `1` = "no bare arm / no", `2` = "edema / yes", `3` = "skinfold more than 40mm", `4` = "tight skin", `5` = "refused",
  .applies_to_vars = c("mtricepp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMTRICEPP", `-1` = "no valid data", `1` = "not mentioned", `2` = "mentioned",
  .applies_to_vars = c("mtricepp1"),
  .applies_to_waves = c("Z", "C", "D")
)

value_labels(
  `-2` = "no answer, skipped / na, see C/DRM161", `-1` = "no particularities scored / no valid data / na, asked", `1` = "lying down / no / no particularities", `2` = "hard to find right spot / yes / lying down", `3` = "much skinfolds under / hard to find right spot", `4` = "refused / many skinfolds", `5` = "R refused",
  .applies_to_vars = c("mwaistp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMWAISTP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mwaistp1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mwaistp5"),
  .applies_to_waves = c("Z", "3B", "I", "J")
)

value_labels(
  `-2` = "no answer, skipped / na, see C/DRM161", `-1` = "no particularities scored / no valid data / na, asked", `1` = "cannot stand / no / yes / no particularities", `2` = "clothes / yes / no / cannot stand", `3` = "corset / wears clothes", `4` = "amputation / wears corset", `5` = "brace / amputated", `6` = "prosthesis / brace", `7` = ">150kg / prosthesis", `8` = "refused / wears shoes", `9` = "weight > 150 kg", `10` = "R refused",
  .applies_to_vars = c("mweightp"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMWEIGHTP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mweightp1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `0` = "not mentioned", `1` = "no / mentioned / yes", `2` = "yes / no",
  .applies_to_vars = c("mweightp2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `1` = "no / yes", `2` = "yes / no",
  .applies_to_vars = c("mweightp3", "mweightp4", "mweightp5", "mweightp6", "mweightp7", "mweightp8"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "length measured / na, see C/MWEIGHTP1&8",
  .applies_to_vars = c("mweightself"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "valid data / interview terminated", `1` = "short version / short interview", `2` = "interview terminated",
  .applies_to_vars = c("rm161"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no measurement",
  .applies_to_vars = c("marm1", "mtricep1"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no measurement", `-2` = "no answer, skipped", `-1` = "no particularities scored", `1` = "no bare arm", `2` = "much room between", `3` = "R sitting down", `4` = "on right arm", `5` = "refused",
  .applies_to_vars = c("marmp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no measurement", `-2` = "no answer, skipped", `-1` = "no particularities scored", `1` = "cannot stand", `2` = "kyphose", `3` = "scoliose", `4` = "head not parallel", `5` = "shoes", `6` = "too much hair", `7` = "refused",
  .applies_to_vars = c("mheightp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no measurement", `-2` = "length measured", `-1` = "no valid data",
  .applies_to_vars = c("mheightself", "mweightself"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no measurement", `-2` = "no answer, skipped", `-1` = "no particularities scored", `1` = "lying down", `2` = "much skinfolds", `3` = "refused",
  .applies_to_vars = c("mhipp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no measurement", `-2` = "no answer, skipped", `-1` = "no valid data", `0` = "no particularities scored", `1` = "no bare arm", `2` = "edema", `3` = "skinfold more than 40mm", `4` = "tight skin", `5` = "refused",
  .applies_to_vars = c("mtricepp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no measurement", `-2` = "no answer, skipped", `-1` = "no particularities scored", `1` = "lying down", `2` = "hard to find right spot", `3` = "much skinfolds under", `4` = "refused",
  .applies_to_vars = c("mwaistp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mweight"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no measurement", `-2` = "no answer, skipped", `-1` = "no particularities scored", `1` = "cannot stand", `2` = "clothes", `3` = "corset", `4` = "amputation", `5` = "brace", `6` = "prosthesis", `7` = ">150kg", `8` = "refused",
  .applies_to_vars = c("mweightp"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data",
  .applies_to_vars = c("marm1", "mheight", "mtricep1", "mweight"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("marmp", "marmp2", "marmp3", "marmp4", "marmp5", "mhipp", "mhipp2", "mhipp3", "mtricepp", "mwaistp", "mwaistp2", "mwaistp3", "mwaistp4", "mweightp", "mweightp2", "mweightp3", "mweightp4", "mweightp5", "mweightp6", "mweightp7", "mweightp8"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMARMP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("marmp1"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mheightp", "mheightp2", "mheightp3", "mheightp4", "mheightp6", "mheightp7"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMHEIGHTP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mheightp1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see CRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mheightp5"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMHEIGHTP", `-1` = "no valid data",
  .applies_to_vars = c("mheightself"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMHIPP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mhipp1"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMWAISTP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mwaistp1"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DMWEIGHTP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mweightp1"),
  .applies_to_waves = c("C")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/MWEIGHTP1&8", `-1` = "no valid data",
  .applies_to_vars = c("mweightself"),
  .applies_to_waves = c("C", "D")
)

value_labels(
  `-2` = "valid data", `2` = "interview terminated",
  .applies_to_vars = c("rm161"),
  .applies_to_waves = c("C", "E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see DRM161", `-1` = "no valid data",
  .applies_to_vars = c("mgripl1", "mgripr1"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see DRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mgriplp1", "mgriprp1"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see dmgriplp1", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriplp2"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see DMGRIPRP1", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriprp2"),
  .applies_to_waves = c("D")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see C/DRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mhipp4", "mweightp9"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "valid data",
  .applies_to_vars = c("rm161"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see ERM161",
  .applies_to_vars = c("mgripl1", "mgriplp1", "mgripr1", "mgriprp1", "mheight", "mheightp", "mheightp3", "mheightp4", "mheightp6", "mheightp7", "mhip1", "mhipp", "mhipp2", "mhipp3", "mhipp4", "mwaist1", "mwaistp", "mwaistp2", "mwaistp3", "mwaistp4", "mweight"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "no valid data",
  .applies_to_vars = c("mgripl1", "mgripr1", "mheight", "mhip1", "mwaist1", "mweight"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mgriplp1", "mgriprp1", "mheightp", "mheightp3", "mheightp4", "mheightp6", "mheightp7", "mhipp", "mhipp2", "mhipp3", "mhipp4", "mwaistp", "mwaistp2", "mwaistp3", "mwaistp4"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see EMGRIPLP1", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriplp2"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see EMGRIPRP1", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriprp2"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see EMHEIGHTP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mheightp2"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see EMHEIGHTP7", `-1` = "no valid data",
  .applies_to_vars = c("mheightself"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see EMHIPP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mhipp1"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see EMWAISTP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mwaistp1"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see EMWEIGHTP", `-1` = "no valid data", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mweightp2"),
  .applies_to_waves = c("E")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see EMWEIGHT8", `-1` = "no valid data",
  .applies_to_vars = c("mweightself"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see BRM161", `-1` = "no valid data", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mgriplp", "mgriplp3", "mgriplp4", "mgriprp", "mgriprp3", "mgriprp4", "mhipp", "mhipp2", "mhipp3", "mwaistp", "mwaistp2", "mwaistp3", "mwaistp4"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMGRIPLP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriplp2"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMGRIPRP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriprp2"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BRM161", `-1` = "no valid data",
  .applies_to_vars = c("mheight", "mweight"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BRM161", `-1` = "no valid data", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mheightp", "mheightp2", "mheightp3", "mheightp4", "mheightp6", "mheightp7", "mweightp", "mweightp2", "mweightp3", "mweightp4", "mweightp5", "mweightp6", "mweightp7", "mweightp8"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMHEIGHTP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mheightp1"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na wrong skip", `-2` = "na, see BMHEIHGTP1 & 7", `-1` = "no valid data",
  .applies_to_vars = c("mheightself"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BRM161",
  .applies_to_vars = c("mhip1", "mwaist1"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mhip2", "mwaist2"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMHIPP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mhipp1"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMWAISTP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mwaistp1"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see BMWEIGHTP", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mweightp1"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see BMWEIGHT1 & 8", `-1` = "no valid data",
  .applies_to_vars = c("mweightself"),
  .applies_to_waves = c("2B")
)

value_labels(
  `-2` = "na, see FRM161",
  .applies_to_vars = c("mgripl1", "mgriplp", "mgripr1", "mgriprp", "mheight", "mheightp", "mheightself", "mhip1", "mhipp", "mwaistp", "mweightp", "mweightself"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "no particularities", `2` = "left hand handicapped", `3` = "R refused", `4` = "other remark",
  .applies_to_vars = c("mgriplp"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "no particularities", `2` = "right hand handicapped", `3` = "R refused", `4` = "other remark",
  .applies_to_vars = c("mgriprp"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mheight"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "no particularities", `2` = "cannot stand", `3` = "kyphosis", `4` = "scoliosis", `5` = "head not parallel", `6` = "too much hair", `7` = "wears shoes", `8` = "R refused",
  .applies_to_vars = c("mheightp"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mheightself", "mweightself"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mhip2"),
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "no particularities", `2` = "lying down", `3` = "many skinfolds", `4` = "R refused",
  .applies_to_vars = c("mhipp"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "no particularities", `2` = "lying down", `3` = "hard to find right spot", `4` = "many skinfolds", `5` = "R refused",
  .applies_to_vars = c("mwaistp"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "no particularities", `2` = "cannot stand", `3` = "wears clothes", `4` = "wears corset", `5` = "amputated", `6` = "brace", `7` = "prosthesis", `8` = "wears shoes", `9` = "weight > 150 kg", `10` = "R refused",
  .applies_to_vars = c("mweightp"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "valid data", `1` = "short version", `2` = "interview terminated",
  .applies_to_vars = c("rm161"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see GRM161",
  .applies_to_vars = c("mgripl1", "mgriplp1", "mgripr1", "mgriprp1", "mheight", "mheightp", "mheightp2", "mheightp3", "mheightp4", "mheightp5", "mheightp6", "mheightp7", "mhip1", "mhipp", "mhipp2", "mhipp3", "mwaist1", "mwaistp", "mwaistp2", "mwaistp3", "mwaistp4", "mweight", "mweightp", "mweightp2", "mweightp3", "mweightp4", "mweightp5", "mweightp6", "mweightp7", "mweightp8", "mweightp9"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mgriplp1", "mgriprp1", "mheightp", "mheightp2", "mheightp3", "mheightp4", "mheightp5", "mheightp6", "mheightp7", "mwaistp", "mwaistp2", "mwaistp3", "mwaistp4", "mweightp", "mweightp2", "mweightp3", "mweightp4", "mweightp5", "mweightp6", "mweightp7", "mweightp8", "mweightp9"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GMGRIPLP1", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriplp2"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GMGRIPRP1", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriprp2"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GMHEIGHTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mheightp1"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMHEIGHT", `-1` = "na, asked",
  .applies_to_vars = c("mheightself"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mhipp", "mhipp2", "mhipp3"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GMHIPP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mhipp1"),
  .applies_to_waves = c("G")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mwaist2"),
  .applies_to_waves = c("G", "H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GMWAISTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mwaistp1"),
  .applies_to_waves = c("G")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mweight"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see GMWEIGHTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mweightp1"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMWEIGHT", `-1` = "na, asked",
  .applies_to_vars = c("mweightself"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/I/JRM161", `-1` = "na, asked",
  .applies_to_vars = c("marm1"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("marmp", "marmp2", "marmp3", "marmp4", "marmp5", "mhipp", "mhipp2", "mhipp3", "mwaistp", "mwaistp2", "mwaistp3", "mwaistp4", "mweightp", "mweightp2", "mweightp3", "mweightp4", "mweightp5", "mweightp6", "mweightp7", "mweightp8"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see H/B/I/JMARMP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("marmp1"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see H/B/I/JRM161", `-1` = "na, asked",
  .applies_to_vars = c("mgripl1", "mheight", "mweight"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriplp1", "mgriplp3", "mgriplp4", "mgriprp1", "mgriprp3", "mgriprp4"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/I/JMGRIPLP1", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriplp2"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see H/B/I/JRM161",
  .applies_to_vars = c("mgripr1", "mhip1", "mwaist1"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/I/JMGRIPRP1", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mgriprp2"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mheightp", "mheightp2", "mheightp3", "mheightp4", "mheightp5", "mheightp6", "mheightp7"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see H/B/I/JMHEIGHTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mheightp1"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see H/B/IMHEIGHT", `-1` = "na, asked",
  .applies_to_vars = c("mheightself"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/B/I/JMHIPP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mhipp1"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see H/B/I/JMWAISTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mwaistp1"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see H/B/I/JMWEIHGTP", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mweightp1"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mweightp9"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "na, see H/B/IMWEIGHT/ routing", `-1` = "na, asked",
  .applies_to_vars = c("mweightself"),
  .applies_to_waves = c("H", "3B", "I")
)

value_labels(
  `-2` = "valid data", `1` = "short interview", `2` = "interview terminated",
  .applies_to_vars = c("rm161"),
  .applies_to_waves = c("H", "3B", "I", "J")
)

value_labels(
  `-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mhipp4"),
  .applies_to_waves = c("3B", "I", "J")
)

value_labels(
  `-2` = "na, see BRM161", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mmiwp"),
  .applies_to_waves = c("3B")
)

value_labels(
  `-2` = "na, see I/JRM161", `-1` = "na, asked", `1` = "yes", `2` = "no",
  .applies_to_vars = c("mmiwp"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "routing", `-1` = "na, asked",
  .applies_to_vars = c("mheightself"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see H/B/I/JRM161", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mweightp9"),
  .applies_to_waves = c("J")
)

value_labels(
  `-3` = "na, wrong skip", `-2` = "na, see JMWEIGHT", `-1` = "na, asked",
  .applies_to_vars = c("mweightself"),
  .applies_to_waves = c("J")
)

.lasa_fc_161 <- .lasa_finalize_fc("161")
.lasa_fc_161$variables <- .lasa_fc_161$variables |>
  .override_label(wave = "G", variable = "mweightself", override_value = "gmweighself") |>
  .override_label(wave = "H", variable = "mweightself", override_value = "hweightself") |>
  .override_label(wave = "3B", variable = "mweightself", override_value = "bweightself") |>
  .override_label(wave = "I", variable = "mweightself", override_value = "iweightself") |>
  .override_label(wave = "J", variable = "mweightself", override_value = "jweightself")

