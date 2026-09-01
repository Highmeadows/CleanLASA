## LASA filecode 160 -- variable names, variable labels, value labels,
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
  magemxw = "numeric",
  magewmx = "numeric",
  mapp6m = "categorical",
  mapp7d = "categorical",
  mattw = "categorical",
  mealt6m = "categorical",
  meatl6m = "categorical",
  mestw = "categorical",
  mhage25 = "numeric",
  mheight25y = "numeric",
  mheight40y = "numeric",
  mlwm01 = "categorical",
  mlwm02 = "categorical",
  mlwm03 = "categorical",
  mlwm04 = "categorical",
  mlwm05 = "categorical",
  mlwm06 = "categorical",
  mlwm07 = "categorical",
  mlwm08 = "categorical",
  mlwm09 = "categorical",
  mlwm10 = "categorical",
  mlwm11 = "categorical",
  mlwm12 = "categorical",
  mlwm13 = "categorical",
  mlwm14 = "categorical",
  mlwm15 = "categorical",
  mmaxw = "categorical",
  mprob6m = "categorical",
  msatw = "categorical",
  mwage25 = "numeric",
  mwage40 = "numeric",
  mweightage = "numeric",
  mweightch = "categorical",
  mweightchkg = "numeric",
  mweightchkgg = "numeric",
  mweightchkgl = "numeric",
  mweightchr = "categorical",
  mweightchrc = "categorical",
  mweightgr = "categorical",
  mweightgr2 = "categorical",
  mweighthigh = "numeric",
  mweightk40y = "numeric",
  mweightlow = "numeric",
  mweightlr = "categorical",
  mweightlr2 = "categorical",
  mwlbelt = "numeric",
  mwlclot = "categorical",
  mwloss = "categorical",
  mwlwatc = "numeric",
  mwmax = "categorical"
)

# define variable labels ----
variable_labels(
  magemxw = "Age at maximum weight",
  magewmx = "Weight: age at maximum weight",
  mapp6m = "Appetite last 6 months (average)",
  mapp7d = "Appetite last 7 days",
  mattw = "Pay attention to body weight",
  mealt6m = "Eating less last 6 months (problems)",
  meatl6m = "Eating less last 6 months (problems)",
  mestw = "Estimation body weight",
  mhage25 = "Height at age 25",
  mheight25y = "Height: at age 25 in centimeters",
  mheight40y = "Length: at 40 in centimeters",
  mlwm01 = "LW method 1: eat less",
  mlwm02 = "LW method",
  mlwm03 = "LW method",
  mlwm04 = "LW method",
  mlwm05 = "LW method",
  mlwm06 = "LW method",
  mlwm07 = "LW method",
  mlwm08 = "LW method",
  mlwm09 = "LW method",
  mlwm10 = "LW method",
  mlwm11 = "LW method",
  mlwm12 = "LW method",
  mlwm13 = "LW method",
  mlwm14 = "LW method",
  mlwm15 = "LW method",
  mmaxw = "Maximum weight in lifetime",
  mprob6m = "Psychological stress or severe sickness last 6 months",
  msatw = "Satisfaction with body weight",
  mwage25 = "Weight at age 25",
  mwage40 = "Weight at age 40",
  mweightage = "Weight: highest in life age",
  mweightch = "Weight: change last 6 months",
  mweightchkg = "Weight: change kilograms",
  mweightchkgg = "Weight gain kilogram",
  mweightchkgl = "Weight loss kilogram",
  mweightchr = "Weight: change reason",
  mweightchrc = "Weight: change reason: coded",
  mweightgr = "Reason weight gain",
  mweightgr2 = "Weight gain reason",
  mweighthigh = "Weight: highest in life kilogram",
  mweightk40y = "Weight: at 40 in kilogram",
  mweightlow = "Weight: lowest after age 25",
  mweightlr = "Reason weight loss",
  mweightlr2 = "Weight loss reason",
  mwlbelt = "Unintentional weight loss in past 6 months: tightened belt",
  mwlclot = "Unintentional weight loss in past 6 months: looser fitting clothing",
  mwloss = "Unintentional weight loss in past 6 months: lost 4 kg or more",
  mwlwatc = "Unintentional weight loss in past 6 months: looser fitting watch",
  mwmax = "Weight: maximum in lifetime",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mheight40y", "mweightage", "mweighthigh", "mweightk40y",
  .applies_to_waves = c("B")
)

variable_labels(
  "mweightchkg",
  .applies_to_waves = c("B", "C", "D", "E", "2B")
)

variable_labels(
  "mweightchr", "mweightchrc", "mweightgr", "mweightlr",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

variable_labels(
  "mheight25y", "mweightlow",
  .applies_to_waves = c("C")
)

variable_labels(
  "mweightch",
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "magewmx", "mwmax",
  .applies_to_waves = c("2B")
)

variable_labels(
  "mattw",
  .applies_to_waves = c("F", "G", "H", "3B")
)

variable_labels(
  "mestw",
  .applies_to_waves = c("F", "G", "H", "3B", "I", "J")
)

variable_labels(
  "mlwm01", "mlwm02", "mlwm03", "mlwm04", "mlwm05", "mlwm06", "mlwm07", "mlwm08", "mlwm09", "mlwm10", "mlwm11", "mlwm12", "mlwm13", "mlwm14", "mlwm15",
  .applies_to_waves = c("F", "G")
)

variable_labels(
  "mapp6m", "mealt6m", "msatw",
  .applies_to_waves = c("H", "3B")
)

variable_labels(
  "mapp7d", "mweightgr2", "mweightlr2",
  .applies_to_waves = c("H", "3B", "I", "J")
)

variable_labels(
  "mwage25",
  .applies_to_waves = c("H", "3B", "I")
)

variable_labels(
  "magemxw", "mmaxw",
  .applies_to_waves = c("3B")
)

variable_labels(
  "mhage25", "mwage40",
  .applies_to_waves = c("3B", "I")
)

variable_labels(
  "mwlbelt", "mwlclot", "mwloss", "mwlwatc",
  .applies_to_waves = c("MB")
)

variable_labels(
  "meatl6m", "mprob6m", "mweightchkgg", "mweightchkgl",
  .applies_to_waves = c("I", "J")
)

variable_labels(
  mweightch = "Weight: change",
  .applies_to_waves = c("B")
)

variable_labels(
  mhage25 = "Height: height at age 25",
  mwage25 = "Weight: weight at age 25",
  mwage40 = "Weight: weight at age 40",
  .applies_to_waves = c("2B")
)

variable_labels(
  msatw = "Satisfied with body weight",
  mweightchkg = "Weight: change kilogram",
  .applies_to_waves = c("F", "G")
)

variable_labels(
  mprob6m = "psychological stress or severe sickness last 6 months",
  mweightchkg = "Weight change kilogram",
  mweightchrc = "Weight change other reason: coded",
  .applies_to_waves = c("H", "3B")
)

variable_labels(
  mweightgr = "Reason weight gain: coded",
  mweightlr = "Reason weight loss: coded",
  .applies_to_waves = c("H", "3B", "I")
)

variable_labels(
  mweightchrc = "Weight change other: coded",
  .applies_to_waves = c("I")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("magemxw"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor",
  .applies_to_vars = c("mapp6m"),
  .applies_to_waves = c("Z", "H", "3B")
)

value_labels(
  `-3` = "na, section ot done", `-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor",
  .applies_to_vars = c("mapp7d"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-1` = "na, asked / do not know / na, asked", `1` = "yes, trying to lose weight", `2` = "yes, trying not to gain weight", `3` = "yes, trying not to lose weight", `4` = "yes, trying to gain weight", `5` = "no", `6` = "do not know",
  .applies_to_vars = c("mattw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "did not eat less", `2` = "did eat somewhat less", `3` = "did eat much less",
  .applies_to_vars = c("mealt6m"),
  .applies_to_waves = c("Z", "H", "3B")
)

value_labels(
  `-3` = "na, section not done", `-1` = "na, asked", `1` = "did not eat less", `2` = "did eat somewhat less", `3` = "did eat much less",
  .applies_to_vars = c("meatl6m"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-3` = "na, section not done", `-1` = "na, asked", `1` = "underweight / severe underweight", `2` = "normal weight / underweight", `3` = "overweight / normal weight / approx.. normal weight", `4` = "overweight", `5` = "severe overweight", `6` = "do not know",
  .applies_to_vars = c("mestw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "na, interview terminated",
  .applies_to_vars = c("mheight25y"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-2` = "no answer, see F/GMATTW", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("mlwm01"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `2` = "less snacks",
  .applies_to_vars = c("mlwm02"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `3` = "eat less fat",
  .applies_to_vars = c("mlwm03"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `4` = "drink less alcohol",
  .applies_to_vars = c("mlwm04"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `5` = "limit types of food",
  .applies_to_vars = c("mlwm05"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `6` = "light products",
  .applies_to_vars = c("mlwm06"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `7` = "replacements (Slim Fast)",
  .applies_to_vars = c("mlwm07"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `8` = "slimming program (WW)",
  .applies_to_vars = c("mlwm08"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `9` = "more exercise (sports)",
  .applies_to_vars = c("mlwm09"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `10` = "more daily exercise (stairs)",
  .applies_to_vars = c("mlwm10"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `11` = "more smoking",
  .applies_to_vars = c("mlwm11"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `12` = "slimming pills",
  .applies_to_vars = c("mlwm12"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `13` = "stomach reduction",
  .applies_to_vars = c("mlwm13"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `14` = "guidance dietician",
  .applies_to_vars = c("mlwm14"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `15` = "other method",
  .applies_to_vars = c("mlwm15"),
  .applies_to_waves = c("Z", "F", "G")
)

value_labels(
  `-3` = "na, section not done",
  .applies_to_vars = c("mmaxw"),
  .applies_to_waves = c("Z", "3B")
)

value_labels(
  `-3` = "na, section ot done", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mprob6m"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-1` = "na, asked", `1` = "very / very dissatisfied", `2` = "reasonably / dissatisfied", `3` = "a little / neither dissatisfied nor satisfied / not satisfied/dissatisfied", `4` = "not at all / satisfied", `5` = "very satisfied", `6` = "do not know",
  .applies_to_vars = c("msatw"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, section not done", `-1` = "na, asked",
  .applies_to_vars = c("mwage25"),
  .applies_to_waves = c("Z", "I")
)

value_labels(
  `-5` = "na, interview terminated", `-3` = "no valid data / na, section not done", `-2` = "not available, routing", `-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight",
  .applies_to_vars = c("mweightch"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no valid data", `-2` = "not available, routing", `-1` = "na, asked",
  .applies_to_vars = c("mweightchkg", "mweighthigh"),
  .applies_to_waves = c("Z", "B")
)

value_labels(
  `-2` = "na, see I/JMWEIGHTCH", `-1` = "na, asked",
  .applies_to_vars = c("mweightchkgg", "mweightchkgl"),
  .applies_to_waves = c("Z", "I", "J")
)

value_labels(
  `-2` = "na, see BMWEIGHTCH", `-1` = "na, asked", `1` = "sickness", `2` = "diet", `3` = "social factors", `4` = "other, see WEIGHTCHCR / other, see C/D/E/BMWEIGHTCHRC / other, see F/GMWEIGHTCHRC", `5` = "do not know",
  .applies_to_vars = c("mweightchr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no valid data", `-2` = "no weight change / na, see H/BMWEIGHTLR2/GR2", `-1` = "no answer, asked see *Table reason", `1` = "sickness (unintentional)", `1.1` = "medication (unintentional)", `1.2` = "physical inactive due to sickness (unintentional)", `1.3` = "lost weight due to sickness; now gained weight (unintentional)", `2` = "diet (intentional)", `2.1` = "eating less or different (unknown)", `2.2` = "eating more or different (unintentional)", `2.3` = "eating more and physical inactive (unintentional)", `2.4` = "quit smoking (unknown)", `2.5` = "smoking (unknown)", `2.6` = "eating less and physical active (intentional)", `2.7` = "eating less or different (unintentional)", `3` = "social factors (unintentional)", `3.1` = "social factors recoded (unintentional)", `5` = "do not know (unintentional)", `5.1` = "other reason (implausible reason) (unknown)", `6` = "physical activities (intentional)", `6.1` = "physical activity (unknown)", `6.2` = "physical inactivity (unintentional)", `6.3` = "working harder (unintentional)", `6.4` = "physical activity (unintentional)", `7` = "older age (unintentional)", `8` = "loss of appetite (unintentional)", `9` = "diuretics or dehydration", `9.1` = "oedeme/ascites", `9.2` = "quit prednison",
  .applies_to_vars = c("mweightchrc"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "no valid data", `-2` = "no weight gain / na, see HMWEIGHTGR2", `-1` = "na, asked", `1` = "related to eating / sickness", `2` = "physical inactivity / related to eating", `3` = "eating and physical inactivity / physical inactivity", `4` = "medical reason / medical reasons / eating and physical inactivity", `5` = "other / reason unknown", `6` = "other reason", `7` = "aging", `8` = "social factors",
  .applies_to_vars = c("mweightgr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see H/BMWEIGHTCH", `-1` = "na, asked", `1` = "sickness", `2` = "eating more or different", `3` = "less physical activity", `4` = "combination of eating more/different and physical inactive", `5` = "reason unknown", `6` = "other reason",
  .applies_to_vars = c("mweightgr2"),
  .applies_to_waves = c("Z", "H", "3B")
)

value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("mweightlow"),
  .applies_to_waves = c("Z", "C")
)

value_labels(
  `-3` = "no valid data", `-2` = "no weight loss / na, see HMWEIGHTLR2", `-1` = "na, asked", `1` = "voluntary / sickness (unintentional)", `2` = "involuntary / diet (intentional)", `3` = "eating less or different / different diet (unintentional)", `4` = "physical activity (intentional)", `5` = "reason unknown (unintentional)", `6` = "social factors (unintentional)", `7` = "other reason (7)", `8` = "eating less or different (unknown)", `9` = "eating less and physical active (intentional)", `10` = "physical activity (unintentional)", `11` = "physical activity (unknown)", `12` = "aging (unintentional)",
  .applies_to_vars = c("mweightlr"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see H/BMWEIGHTCH", `-1` = "na, asked", `1` = "sickness (unintentional)", `2` = "diet (intentional)", `3` = "other diet (unintentional)", `4` = "more physical activity (intentional)", `5` = "reason unknown (unintentional)", `6` = "social factors (unintentional)", `7` = "other reason",
  .applies_to_vars = c("mweightlr2"),
  .applies_to_waves = c("Z", "H", "3B")
)

value_labels(
  `-2` = "na, see BMWLOSS", `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mwlclot"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes", `3` = "unknown",
  .applies_to_vars = c("mwloss"),
  .applies_to_waves = c("Z", "MB")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mwmax"),
  .applies_to_waves = c("Z", "2B")
)

value_labels(
  `-3` = "no valid data", `-2` = "no answer, routing", `-1` = "no answer, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight",
  .applies_to_vars = c("mweightch"),
  .applies_to_waves = c("B")
)

value_labels(
  `-2` = "na, see BMWEIGHTCH", `-1` = "na, asked", `1` = "sickness", `2` = "diet", `3` = "social factors", `4` = "other, see WEIGHTCHCR",
  .applies_to_vars = c("mweightchr"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no valid data", `-2` = "no weight change", `-1` = "no answer, asked see *Table reason", `1` = "sickness (unintentional)", `1.1` = "medication (unintentional)", `1.2` = "physical inactive due to sickness (unintentional)", `1.3` = "lost weight due to sickness; now gained weight (unintentional)", `2` = "diet (intentional)", `2.1` = "eating less or different (unknown)", `2.2` = "eating more or different (unintentional)", `2.3` = "eating more and physical inactive (unintentional)", `2.4` = "quit smoking (unknown)", `2.5` = "smoking (unknown)", `3` = "social factors (unintentional)", `3.1` = "social factors recoded (unintentional)", `5` = "do not know (unintentional)", `6` = "physical activities (intentional)", `6.1` = "physical activity (unknown)", `6.2` = "physical inactivity (unintentional)", `6.3` = "working harder (unintentional)", `7` = "older age (unintentional)", `8` = "loss of appetite (unintentional)", `9` = "diuretics or dehydration", `9.1` = "oedeme/ascites", `9.2` = "quit prednison",
  .applies_to_vars = c("mweightchrc"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F")
)

value_labels(
  `-3` = "no valid data", `-2` = "no weight gain", `-1` = "no answer, asked", `1` = "related to eating", `2` = "physical inactivity", `3` = "eating and physical inactivity", `4` = "medical reason", `5` = "other",
  .applies_to_vars = c("mweightgr"),
  .applies_to_waves = c("B")
)

value_labels(
  `-3` = "no valid data", `-2` = "no weight loss", `-1` = "no answer, asked", `1` = "voluntary", `2` = "involuntary", `3` = "eating less or different",
  .applies_to_vars = c("mweightlr"),
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-5` = "na, interview terminated", `-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight",
  .applies_to_vars = c("mweightch"),
  .applies_to_waves = c("C", "D", "E")
)

value_labels(
  `-2` = "na, see C/D/E/BMWEIGHTCH", `-1` = "na, asked",
  .applies_to_vars = c("mweightchkg"),
  .applies_to_waves = c("C", "D", "E", "2B")
)

value_labels(
  `-2` = "na, see C/D/E/BMWEIGHTCH", `-1` = "na, asked", `1` = "sickness", `2` = "diet", `3` = "social factors", `4` = "other, see C/D/E/BMWEIGHTCHRC", `5` = "do not know",
  .applies_to_vars = c("mweightchr"),
  .applies_to_waves = c("C", "D", "E", "2B")
)

value_labels(
  `-3` = "no valid data", `-2` = "no weight gain", `-1` = "no answer, asked", `1` = "related to eating", `2` = "physical inactivity", `3` = "eating and physical inactivity", `4` = "medical reasons", `5` = "other",
  .applies_to_vars = c("mweightgr"),
  .applies_to_waves = c("C", "D", "E", "2B", "F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight",
  .applies_to_vars = c("mweightch"),
  .applies_to_waves = c("2B", "F", "G", "H", "3B")
)

value_labels(
  `-1` = "na, asked / do not know", `1` = "yes, trying to lose weight", `2` = "yes, trying not to gain weight", `3` = "yes, trying not to lose weight", `4` = "yes, trying to gain weight", `5` = "no",
  .applies_to_vars = c("mattw"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "underweight", `2` = "normal weight", `3` = "overweight",
  .applies_to_vars = c("mestw"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "very", `2` = "reasonably", `3` = "a little", `4` = "not at all",
  .applies_to_vars = c("msatw"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see F/GMWEIGHTCH", `-1` = "na, asked",
  .applies_to_vars = c("mweightchkg"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see F/GMWEIGHTCH", `-1` = "na, asked", `1` = "sickness", `2` = "diet", `3` = "social factors", `4` = "other, see F/GMWEIGHTCHRC", `5` = "do not know",
  .applies_to_vars = c("mweightchr"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "severe underweight", `2` = "underweight", `3` = "normal weight", `4` = "overweight", `5` = "severe overweight",
  .applies_to_vars = c("mestw"),
  .applies_to_waves = c("G")
)

value_labels(
  `-1` = "na, asked", `1` = "very dissatisfied", `2` = "dissatisfied", `3` = "neither dissatisfied nor satisfied", `4` = "satisfied", `5` = "very satisfied",
  .applies_to_vars = c("msatw"),
  .applies_to_waves = c("G")
)

value_labels(
  `-3` = "no valid data", `-2` = "no weight change", `-1` = "no answer, asked see *Table reason", `1` = "sickness (unintentional)", `1.1` = "medication (unintentional)", `1.2` = "physical inactive due to sickness (unintentional)", `2` = "diet (intentional)", `2.1` = "eating less or different (unknown)", `2.2` = "eating more or different (unintentional)", `2.3` = "eating more and physical inactive (unintentional)", `2.4` = "quit smoking (unknown)", `2.5` = "smoking (unknown)", `2.6` = "eating less and physical active (intentional)", `2.7` = "eating less or different (unintentional)", `3` = "social factors (unintentional)", `3.1` = "social factors recoded (unintentional)", `5` = "do not know (unintentional)", `5.1` = "other reason (implausible reason) (unknown)", `6` = "physical activities (intentional)", `6.1` = "physical activity (unknown)", `6.2` = "physical inactivity (unintentional)", `6.3` = "working harder (unintentional)", `6.4` = "physical activity (unintentional)", `7` = "older age (unintentional)", `8` = "loss of appetite (unintentional)", `9` = "diuretics or dehydration", `9.1` = "oedeme/ascites", `9.2` = "quit prednison",
  .applies_to_vars = c("mweightchrc"),
  .applies_to_waves = c("G")
)

value_labels(
  `-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor",
  .applies_to_vars = c("mapp7d"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, trying to lose weight", `2` = "yes, trying not gain weight", `3` = "yes, trying not to lose weight", `4` = "yes, trying to gain weight", `5` = "no", `6` = "do not know",
  .applies_to_vars = c("mattw"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "severe underweight", `2` = "underweight", `3` = "approx.. normal weight", `4` = "overweight", `5` = "severe overweight", `6` = "do not know",
  .applies_to_vars = c("mestw"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("mprob6m"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-1` = "na, asked", `1` = "very dissatisfied", `2` = "dissatisfied", `3` = "not satisfied/dissatisfied", `4` = "satisfied", `5` = "very satisfied", `6` = "do not know",
  .applies_to_vars = c("msatw"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("mwage25"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see H/BMWEIGHTCH", `-1` = "na, asked",
  .applies_to_vars = c("mweightchkg"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-3` = "no valid data", `-2` = "na, see H/BMWEIGHTLR2/GR2", `-1` = "na, asked see *Table Reason", `1` = "sickness (unintentional)", `1.1` = "medication (unintentional)", `1.2` = "physical inactive due to sickness (unintentional)", `2` = "diet (intentional)", `2.1` = "eating less or different (unknown)", `2.2` = "eating more or different (unintentional)", `2.3` = "eating more and physical inactive (unintentional)", `2.4` = "quit smoking (unknown)", `2.5` = "smoking (unknown)", `2.6` = "eating less and physical active (intentional)", `2.7` = "eating less or different (unintentional)", `3` = "social factors (unintentional)", `3.1` = "social factors recoded (unintentional)", `5` = "do not know (unintentional)", `5.1` = "other reason (implausible reason) (unknown)", `6` = "physical activities (intentional)", `6.1` = "physical activity (unknown)", `6.2` = "physical inactivity (unintentional)", `6.3` = "working harder (unintentional)", `6.4` = "physical activity (unintentional)", `7` = "older age (unintentional)", `8` = "loss of appetite (unintentional)", `9` = "diuretics or dehydration", `9.1` = "oedeme/ascites", `9.2` = "quit prednison",
  .applies_to_vars = c("mweightchrc"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-3` = "no valid data", `-2` = "na, see HMWEIGHTGR2", `-1` = "na, asked", `1` = "sickness", `2` = "related to eating", `3` = "physical inactivity", `4` = "eating and physical inactivity", `5` = "reason unknown", `6` = "other reason", `7` = "aging", `8` = "social factors",
  .applies_to_vars = c("mweightgr"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-3` = "no valid data", `-2` = "na, see HMWEIGHTLR2", `-1` = "na, asked", `1` = "sickness (unintentional)", `2` = "diet (intentional)", `3` = "different diet (unintentional)", `4` = "physical activity (intentional)", `5` = "reason unknown (unintentional)", `6` = "social factors (unintentional)", `7` = "other reason (7)", `8` = "eating less or different (unknown)", `9` = "eating less and physical active (intentional)", `10` = "physical activity (unintentional)", `11` = "physical activity (unknown)", `12` = "aging (unintentional)",
  .applies_to_vars = c("mweightlr"),
  .applies_to_waves = c("H", "3B")
)

value_labels(
  `-3` = "na, section not done", `-1` = "na, asked", `1` = "severe underweight", `2` = "underweight", `3` = "approx. normal weight", `4` = "overweight", `5` = "severe overweight", `6` = "do not know",
  .applies_to_vars = c("mestw"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "na, section not done", `-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight",
  .applies_to_vars = c("mweightch"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "no valid data", `-2` = "na, see IMWEIGHTLR2/GR2", `-1` = "na, asked see *Table Reason", `1` = "sickness (unintentional)", `1.1` = "medication (unintentional)", `1.2` = "physical inactive due to sickness (unintentional)", `2` = "diet (intentional)", `2.1` = "eating less or different (unknown)", `2.2` = "eating more or different (unintentional)", `2.3` = "eating more and physical inactive (unintentional)", `2.4` = "quit smoking (unknown)", `2.5` = "smoking (unknown)", `2.6` = "eating less and physical active (intentional)", `2.7` = "eating less or different (unintentional)", `3` = "social factors (unintentional)", `3.1` = "social factors recoded (unintentional)", `5` = "do not know (unintentional)", `5.1` = "other reason (implausible reason) (unknown)", `6` = "physical activities (intentional)", `6.1` = "physical activity (unknown)", `6.2` = "physical inactivity (unintentional)", `6.3` = "working harder (unintentional)", `6.4` = "physical activity (unintentional)", `7` = "older age (unintentional)", `8` = "loss of appetite (unintentional)", `9` = "diuretics or dehydration", `9.1` = "oedeme/ascites", `9.2` = "quit prednison",
  .applies_to_vars = c("mweightchrc"),
  .applies_to_waves = c("I")
)

value_labels(
  `-3` = "no valid data", `-2` = "na, see IMWEIGHTGR2", `-1` = "na, asked", `1` = "sickness", `2` = "related to eating", `3` = "physical inactivity", `4` = "eating and physical inactivity", `5` = "reason unknown", `6` = "other reason", `7` = "aging", `8` = "social factors",
  .applies_to_vars = c("mweightgr"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMWEIGHTCH", `-1` = "na, asked", `1` = "sickness", `2` = "eating more or different", `3` = "less physical activity", `4` = "combination of eating more/different and physical inactive", `5` = "reason unknown", `6` = "other reason",
  .applies_to_vars = c("mweightgr2"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-3` = "no valid data", `-2` = "na, see IMWEIGHTLR2", `-1` = "na, asked", `1` = "sickness (unintentional)", `2` = "diet (intentional)", `3` = "different diet (unintentional)", `4` = "physical activity (intentional)", `5` = "reason unknown (unintentional)", `6` = "social factors (unintentional)", `7` = "other reason (7)", `8` = "eating less or different (unknown)", `9` = "eating less and physical active (intentional)", `10` = "physical activity (unintentional)", `11` = "physical activity (unknown)", `12` = "aging (unintentional)",
  .applies_to_vars = c("mweightlr"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see I/JMWEIGHTCH", `-1` = "na, asked", `1` = "sickness (unintentional)", `2` = "diet (intentional)", `3` = "other diet (unintentional)", `4` = "more physical activity (intentional)", `5` = "reason unknown (unintentional)", `6` = "social factors (unintentional)", `7` = "other reason",
  .applies_to_vars = c("mweightlr2"),
  .applies_to_waves = c("I", "J")
)

.lasa_fc_160 <- .lasa_finalize_fc("160")
.lasa_fc_160$variables <- .lasa_fc_160$variables |>
  .override_label(wave = "B", variable = "mweightchrc", override_value = "bmweightchcr") |>
  .override_label(wave = "H", variable = "mweightgr2", override_value = "hmweightr2") |>
  .override_label(wave = "3B", variable = "mweightgr2", override_value = "bmweightr2")

