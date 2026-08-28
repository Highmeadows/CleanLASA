## LASA filecode 160 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
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
  mwmax = "Weight: maximum in lifetime"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "mheight40y",
    "mweightage",
    "mweightch",
    "mweightchkg",
    "mweightchr",
    "mweightchrc",
    "mweightgr",
    "mweighthigh",
    "mweightk40y",
    "mweightlr"
  ),
  `C` = c(
    "mheight25y",
    "mweightch",
    "mweightchkg",
    "mweightchr",
    "mweightchrc",
    "mweightgr",
    "mweightlow",
    "mweightlr"
  ),
  `D` = c(
    "mweightch",
    "mweightchkg",
    "mweightchr",
    "mweightchrc",
    "mweightgr",
    "mweightlr"
  ),
  `E` = c(
    "mweightch",
    "mweightchkg",
    "mweightchr",
    "mweightchrc",
    "mweightgr",
    "mweightlr"
  ),
  `2B` = c(
    "magewmx",
    "mhage25",
    "mwage25",
    "mwage40",
    "mweightch",
    "mweightchkg",
    "mweightchr",
    "mweightchrc",
    "mweightgr",
    "mweightlr",
    "mwmax"
  ),
  `F` = c(
    "mattw",
    "mestw",
    "mlwm01",
    "mlwm02",
    "mlwm03",
    "mlwm04",
    "mlwm05",
    "mlwm06",
    "mlwm07",
    "mlwm08",
    "mlwm09",
    "mlwm10",
    "mlwm11",
    "mlwm12",
    "mlwm13",
    "mlwm14",
    "mlwm15",
    "msatw",
    "mweightch",
    "mweightchkg",
    "mweightchr",
    "mweightchrc",
    "mweightgr",
    "mweightlr"
  ),
  `G` = c(
    "mattw",
    "mestw",
    "mlwm01",
    "mlwm02",
    "mlwm03",
    "mlwm04",
    "mlwm05",
    "mlwm06",
    "mlwm07",
    "mlwm08",
    "mlwm09",
    "mlwm10",
    "mlwm11",
    "mlwm12",
    "mlwm13",
    "mlwm14",
    "mlwm15",
    "msatw",
    "mweightch",
    "mweightchkg",
    "mweightchr",
    "mweightchrc",
    "mweightgr",
    "mweightlr"
  ),
  `H` = c(
    "mapp6m",
    "mapp7d",
    "mattw",
    "mealt6m",
    "mestw",
    "mprob6m",
    "msatw",
    "mwage25",
    "mweightch",
    "mweightchkg",
    "mweightchrc",
    "mweightgr",
    "mweightgr2",
    "mweightlr",
    "mweightlr2"
  ),
  `3B` = c(
    "magemxw",
    "mapp6m",
    "mapp7d",
    "mattw",
    "mealt6m",
    "mestw",
    "mhage25",
    "mmaxw",
    "mprob6m",
    "msatw",
    "mwage25",
    "mwage40",
    "mweightch",
    "mweightchkg",
    "mweightchrc",
    "mweightgr",
    "mweightgr2",
    "mweightlr",
    "mweightlr2"
  ),
  `MB` = c(
    "mwlbelt",
    "mwlclot",
    "mwloss",
    "mwlwatc"
  ),
  `I` = c(
    "mapp7d",
    "meatl6m",
    "mestw",
    "mhage25",
    "mprob6m",
    "mwage25",
    "mwage40",
    "mweightch",
    "mweightchkgg",
    "mweightchkgl",
    "mweightchrc",
    "mweightgr",
    "mweightgr2",
    "mweightlr",
    "mweightlr2"
  ),
  `J` = c(
    "mapp7d",
    "meatl6m",
    "mestw",
    "mprob6m",
    "mweightch",
    "mweightchkgg",
    "mweightchkgl",
    "mweightgr2",
    "mweightlr2"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    mweightch = "Weight: change"
  ),
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    mhage25 = "Height: height at age 25",
    mwage25 = "Weight: weight at age 25",
    mwage40 = "Weight: weight at age 40"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    msatw = "Satisfied with body weight",
    mweightchkg = "Weight: change kilogram"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    msatw = "Satisfied with body weight",
    mweightchkg = "Weight: change kilogram"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    mprob6m = "psychological stress or severe sickness last 6 months",
    mweightchkg = "Weight change kilogram",
    mweightchrc = "Weight change other reason: coded",
    mweightgr = "Reason weight gain: coded",
    mweightlr = "Reason weight loss: coded"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    mprob6m = "psychological stress or severe sickness last 6 months",
    mweightchkg = "Weight change kilogram",
    mweightchrc = "Weight change other reason: coded",
    mweightgr = "Reason weight gain: coded",
    mweightlr = "Reason weight loss: coded"
  ),
  Wave_MB_labels = harmonized_labels,
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    mweightchrc = "Weight change other: coded",
    mweightgr = "Reason weight gain: coded",
    mweightlr = "Reason weight loss: coded"
  ),
  Wave_J_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  magemxw = c(
    default_missing_labels[c("-1")]
  ),
  magewmx = stats::setNames(character(0), character(0)),
  mapp6m = c(
    default_missing_labels[c("-1")],
    `1` = "good",
    `2` = "moderate",
    `3` = "poor"
  ),
  mapp7d = c(
    `-3` = "na, section ot done",
    default_missing_labels[c("-1")],
    `1` = "good",
    `2` = "moderate",
    `3` = "poor"
  ),
  mattw = c(
    `-1` = "na, asked / do not know / na, asked",
    `1` = "yes, trying to lose weight",
    `2` = "yes, trying not to gain weight",
    `3` = "yes, trying not to lose weight",
    `4` = "yes, trying to gain weight",
    `5` = "no",
    `6` = "do not know"
  ),
  mealt6m = c(
    default_missing_labels[c("-1")],
    `1` = "did not eat less",
    `2` = "did eat somewhat less",
    `3` = "did eat much less"
  ),
  meatl6m = c(
    `-3` = "na, section not done",
    default_missing_labels[c("-1")],
    `1` = "did not eat less",
    `2` = "did eat somewhat less",
    `3` = "did eat much less"
  ),
  mestw = c(
    `-3` = "na, section not done",
    default_missing_labels[c("-1")],
    `1` = "underweight / severe underweight",
    `2` = "normal weight / underweight",
    `3` = "overweight / normal weight / approx.. normal weight",
    `4` = "overweight",
    `5` = "severe overweight",
    `6` = "do not know"
  ),
  mhage25 = stats::setNames(character(0), character(0)),
  mheight25y = c(`-5` = "na, interview terminated"),
  mheight40y = stats::setNames(character(0), character(0)),
  mlwm01 = c(
    `-2` = "no answer, see F/GMATTW",
    default_missing_labels[c("-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  mlwm02 = c(`2` = "less snacks"),
  mlwm03 = c(`3` = "eat less fat"),
  mlwm04 = c(`4` = "drink less alcohol"),
  mlwm05 = c(`5` = "limit types of food"),
  mlwm06 = c(`6` = "light products"),
  mlwm07 = c(`7` = "replacements (Slim Fast)"),
  mlwm08 = c(`8` = "slimming program (WW)"),
  mlwm09 = c(`9` = "more exercise (sports)"),
  mlwm10 = c(`10` = "more daily exercise (stairs)"),
  mlwm11 = c(`11` = "more smoking"),
  mlwm12 = c(`12` = "slimming pills"),
  mlwm13 = c(`13` = "stomach reduction"),
  mlwm14 = c(`14` = "guidance dietician"),
  mlwm15 = c(`15` = "other method"),
  mmaxw = c(`-3` = "na, section not done"),
  mprob6m = c(
    `-3` = "na, section ot done",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  msatw = c(
    default_missing_labels[c("-1")],
    `1` = "very / very dissatisfied",
    `2` = "reasonably / dissatisfied",
    `3` = "a little / neither dissatisfied nor satisfied / not satisfied/dissatisfied",
    `4` = "not at all / satisfied",
    `5` = "very satisfied",
    `6` = "do not know"
  ),
  mwage25 = c(
    `-3` = "na, section not done",
    default_missing_labels[c("-1")]
  ),
  mwage40 = stats::setNames(character(0), character(0)),
  mweightage = stats::setNames(character(0), character(0)),
  mweightch = c(
    `-5` = "na, interview terminated",
    `-3` = "no valid data / na, section not done",
    default_missing_labels[c("-2", "-1")],
    `1` = "not changed",
    `2` = "gained weight",
    `3` = "lost weight"
  ),
  mweightchkg = c(
    `-3` = "no valid data",
    default_missing_labels[c("-2", "-1")]
  ),
  mweightchkgg = c(
    `-2` = "na, see I/JMWEIGHTCH",
    default_missing_labels[c("-1")]
  ),
  mweightchkgl = c(
    `-2` = "na, see I/JMWEIGHTCH",
    default_missing_labels[c("-1")]
  ),
  mweightchr = c(
    `-2` = "na, see BMWEIGHTCH",
    default_missing_labels[c("-1")],
    `1` = "sickness",
    `2` = "diet",
    `3` = "social factors",
    `4` = "other, see WEIGHTCHCR / other, see C/D/E/BMWEIGHTCHRC / other, see F/GMWEIGHTCHRC",
    `5` = "do not know"
  ),
  mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "no weight change / na, see H/BMWEIGHTLR2/GR2",
    `-1` = "no answer, asked see *Table reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `1.3` = "lost weight due to sickness; now gained weight (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `2.6` = "eating less and physical active (intentional)",
    `2.7` = "eating less or different (unintentional)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `5.1` = "other reason (implausible reason) (unknown)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `6.4` = "physical activity (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
  mweightgr = c(
    `-3` = "no valid data",
    `-2` = "no weight gain / na, see HMWEIGHTGR2",
    default_missing_labels[c("-1")],
    `1` = "related to eating / sickness",
    `2` = "physical inactivity / related to eating",
    `3` = "eating and physical inactivity / physical inactivity",
    `4` = "medical reason / medical reasons / eating and physical inactivity",
    `5` = "other / reason unknown",
    `6` = "other reason",
    `7` = "aging",
    `8` = "social factors"
  ),
  mweightgr2 = c(
    `-2` = "na, see H/BMWEIGHTCH",
    default_missing_labels[c("-1")],
    `1` = "sickness",
    `2` = "eating more or different",
    `3` = "less physical activity",
    `4` = "combination of eating more/different and physical inactive",
    `5` = "reason unknown",
    `6` = "other reason"
  ),
  mweighthigh = c(
    `-3` = "no valid data",
    default_missing_labels[c("-2", "-1")]
  ),
  mweightk40y = stats::setNames(character(0), character(0)),
  mweightlow = c(`-1` = "no valid data"),
  mweightlr = c(
    `-3` = "no valid data",
    `-2` = "no weight loss / na, see HMWEIGHTLR2",
    default_missing_labels[c("-1")],
    `1` = "voluntary / sickness (unintentional)",
    `2` = "involuntary / diet (intentional)",
    `3` = "eating less or different / different diet (unintentional)",
    `4` = "physical activity (intentional)",
    `5` = "reason unknown (unintentional)",
    `6` = "social factors (unintentional)",
    `7` = "other reason (7)",
    `8` = "eating less or different (unknown)",
    `9` = "eating less and physical active (intentional)",
    `10` = "physical activity (unintentional)",
    `11` = "physical activity (unknown)",
    `12` = "aging (unintentional)"
  ),
  mweightlr2 = c(
    `-2` = "na, see H/BMWEIGHTCH",
    default_missing_labels[c("-1")],
    `1` = "sickness (unintentional)",
    `2` = "diet (intentional)",
    `3` = "other diet (unintentional)",
    `4` = "more physical activity (intentional)",
    `5` = "reason unknown (unintentional)",
    `6` = "social factors (unintentional)",
    `7` = "other reason"
  ),
  mwlbelt = stats::setNames(character(0), character(0)),
  mwlclot = c(
    `-2` = "na, see BMWLOSS",
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes"
  ),
  mwloss = c(
    default_missing_labels[c("-1")],
    `1` = "no",
    `2` = "yes",
    `3` = "unknown"
  ),
  mwlwatc = stats::setNames(character(0), character(0)),
  mwmax = c(
    default_missing_labels[c("-1")]
  )
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    mweightch = c(
    `-3` = "no valid data",
    `-2` = "no answer, routing",
    `-1` = "no answer, asked",
    `1` = "not changed",
    `2` = "gained weight",
    `3` = "lost weight"
  ),
    mweightchr = c(
    `-2` = "na, see BMWEIGHTCH",
    `-1` = "na, asked",
    `1` = "sickness",
    `2` = "diet",
    `3` = "social factors",
    `4` = "other, see WEIGHTCHCR"
  ),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "no weight change",
    `-1` = "no answer, asked see *Table reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `1.3` = "lost weight due to sickness; now gained weight (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = c(
    `-3` = "no valid data",
    `-2` = "no weight gain",
    `-1` = "no answer, asked",
    `1` = "related to eating",
    `2` = "physical inactivity",
    `3` = "eating and physical inactivity",
    `4` = "medical reason",
    `5` = "other"
  ),
    mweightlr = c(
    `-3` = "no valid data",
    `-2` = "no weight loss",
    `-1` = "no answer, asked",
    `1` = "voluntary",
    `2` = "involuntary",
    `3` = "eating less or different"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mweightch = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "not changed",
    `2` = "gained weight",
    `3` = "lost weight"
  ),
    mweightchkg = c(`-2` = "na, see C/D/E/BMWEIGHTCH", `-1` = "na, asked"),
    mweightchr = .replace_labels(
    standardized_value_labels$mweightchr,
    `-2` = "na, see C/D/E/BMWEIGHTCH",
    `4` = "other, see C/D/E/BMWEIGHTCHRC"
  ),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "no weight change",
    `-1` = "no answer, asked see *Table reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `1.3` = "lost weight due to sickness; now gained weight (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = c(
    `-3` = "no valid data",
    `-2` = "no weight gain",
    `-1` = "no answer, asked",
    `1` = "related to eating",
    `2` = "physical inactivity",
    `3` = "eating and physical inactivity",
    `4` = "medical reasons",
    `5` = "other"
  ),
    mweightlr = c(
    `-3` = "no valid data",
    `-2` = "no weight loss",
    `-1` = "no answer, asked",
    `1` = "voluntary",
    `2` = "involuntary",
    `3` = "eating less or different"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    mweightch = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "not changed",
    `2` = "gained weight",
    `3` = "lost weight"
  ),
    mweightchkg = c(`-2` = "na, see C/D/E/BMWEIGHTCH", `-1` = "na, asked"),
    mweightchr = .replace_labels(
    standardized_value_labels$mweightchr,
    `-2` = "na, see C/D/E/BMWEIGHTCH",
    `4` = "other, see C/D/E/BMWEIGHTCHRC"
  ),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "no weight change",
    `-1` = "no answer, asked see *Table reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `1.3` = "lost weight due to sickness; now gained weight (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = c(
    `-3` = "no valid data",
    `-2` = "no weight gain",
    `-1` = "no answer, asked",
    `1` = "related to eating",
    `2` = "physical inactivity",
    `3` = "eating and physical inactivity",
    `4` = "medical reasons",
    `5` = "other"
  ),
    mweightlr = c(
    `-3` = "no valid data",
    `-2` = "no weight loss",
    `-1` = "no answer, asked",
    `1` = "voluntary",
    `2` = "involuntary",
    `3` = "eating less or different"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    mweightch = c(
    `-5` = "na, interview terminated",
    `-1` = "na, asked",
    `1` = "not changed",
    `2` = "gained weight",
    `3` = "lost weight"
  ),
    mweightchkg = c(`-2` = "na, see C/D/E/BMWEIGHTCH", `-1` = "na, asked"),
    mweightchr = .replace_labels(
    standardized_value_labels$mweightchr,
    `-2` = "na, see C/D/E/BMWEIGHTCH",
    `4` = "other, see C/D/E/BMWEIGHTCHRC"
  ),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "no weight change",
    `-1` = "no answer, asked see *Table reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `1.3` = "lost weight due to sickness; now gained weight (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = c(
    `-3` = "no valid data",
    `-2` = "no weight gain",
    `-1` = "no answer, asked",
    `1` = "related to eating",
    `2` = "physical inactivity",
    `3` = "eating and physical inactivity",
    `4` = "medical reasons",
    `5` = "other"
  ),
    mweightlr = c(
    `-3` = "no valid data",
    `-2` = "no weight loss",
    `-1` = "no answer, asked",
    `1` = "voluntary",
    `2` = "involuntary",
    `3` = "eating less or different"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    mweightch = c(`-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight"),
    mweightchkg = c(`-2` = "na, see C/D/E/BMWEIGHTCH", `-1` = "na, asked"),
    mweightchr = .replace_labels(
    standardized_value_labels$mweightchr,
    `-2` = "na, see C/D/E/BMWEIGHTCH",
    `4` = "other, see C/D/E/BMWEIGHTCHRC"
  ),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "no weight change",
    `-1` = "no answer, asked see *Table reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `1.3` = "lost weight due to sickness; now gained weight (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = c(
    `-3` = "no valid data",
    `-2` = "no weight gain",
    `-1` = "no answer, asked",
    `1` = "related to eating",
    `2` = "physical inactivity",
    `3` = "eating and physical inactivity",
    `4` = "medical reasons",
    `5` = "other"
  ),
    mweightlr = c(
    `-3` = "no valid data",
    `-2` = "no weight loss",
    `-1` = "no answer, asked",
    `1` = "voluntary",
    `2` = "involuntary",
    `3` = "eating less or different"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    mattw = c(
    `-1` = "na, asked / do not know",
    `1` = "yes, trying to lose weight",
    `2` = "yes, trying not to gain weight",
    `3` = "yes, trying not to lose weight",
    `4` = "yes, trying to gain weight",
    `5` = "no"
  ),
    mestw = c(`-1` = "na, asked", `1` = "underweight", `2` = "normal weight", `3` = "overweight"),
    msatw = c(`-1` = "na, asked", `1` = "very", `2` = "reasonably", `3` = "a little", `4` = "not at all"),
    mweightch = c(`-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight"),
    mweightchkg = c(`-2` = "na, see F/GMWEIGHTCH", `-1` = "na, asked"),
    mweightchr = .replace_labels(
    standardized_value_labels$mweightchr,
    `-2` = "na, see F/GMWEIGHTCH",
    `4` = "other, see F/GMWEIGHTCHRC"
  ),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "no weight change",
    `-1` = "no answer, asked see *Table reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `1.3` = "lost weight due to sickness; now gained weight (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = c(
    `-3` = "no valid data",
    `-2` = "no weight gain",
    `-1` = "no answer, asked",
    `1` = "related to eating",
    `2` = "physical inactivity",
    `3` = "eating and physical inactivity",
    `4` = "medical reasons",
    `5` = "other"
  ),
    mweightlr = c(
    `-3` = "no valid data",
    `-2` = "no weight loss",
    `-1` = "no answer, asked",
    `1` = "voluntary",
    `2` = "involuntary",
    `3` = "eating less or different"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    mattw = c(
    `-1` = "na, asked / do not know",
    `1` = "yes, trying to lose weight",
    `2` = "yes, trying not to gain weight",
    `3` = "yes, trying not to lose weight",
    `4` = "yes, trying to gain weight",
    `5` = "no"
  ),
    mestw = c(
    `-1` = "na, asked",
    `1` = "severe underweight",
    `2` = "underweight",
    `3` = "normal weight",
    `4` = "overweight",
    `5` = "severe overweight"
  ),
    msatw = c(
    `-1` = "na, asked",
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "neither dissatisfied nor satisfied",
    `4` = "satisfied",
    `5` = "very satisfied"
  ),
    mweightch = c(`-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight"),
    mweightchkg = c(`-2` = "na, see F/GMWEIGHTCH", `-1` = "na, asked"),
    mweightchr = .replace_labels(
    standardized_value_labels$mweightchr,
    `-2` = "na, see F/GMWEIGHTCH",
    `4` = "other, see F/GMWEIGHTCHRC"
  ),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "no weight change",
    `-1` = "no answer, asked see *Table reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `2.6` = "eating less and physical active (intentional)",
    `2.7` = "eating less or different (unintentional)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `5.1` = "other reason (implausible reason) (unknown)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `6.4` = "physical activity (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = c(
    `-3` = "no valid data",
    `-2` = "no weight gain",
    `-1` = "no answer, asked",
    `1` = "related to eating",
    `2` = "physical inactivity",
    `3` = "eating and physical inactivity",
    `4` = "medical reasons",
    `5` = "other"
  ),
    mweightlr = c(
    `-3` = "no valid data",
    `-2` = "no weight loss",
    `-1` = "no answer, asked",
    `1` = "voluntary",
    `2` = "involuntary",
    `3` = "eating less or different"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    mapp7d = c(`-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor"),
    mattw = .replace_labels(
    standardized_value_labels$mattw,
    `-1` = "na, asked",
    `2` = "yes, trying not gain weight"
  ),
    mestw = c(
    `-1` = "na, asked",
    `1` = "severe underweight",
    `2` = "underweight",
    `3` = "approx.. normal weight",
    `4` = "overweight",
    `5` = "severe overweight",
    `6` = "do not know"
  ),
    mprob6m = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    msatw = .replace_labels(
    standardized_value_labels$msatw,
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "not satisfied/dissatisfied",
    `4` = "satisfied"
  ),
    mwage25 = c(`-1` = "na, asked"),
    mweightch = c(`-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight"),
    mweightchkg = c(`-2` = "na, see H/BMWEIGHTCH", `-1` = "na, asked"),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "na, see H/BMWEIGHTLR2/GR2",
    `-1` = "na, asked see *Table Reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `2.6` = "eating less and physical active (intentional)",
    `2.7` = "eating less or different (unintentional)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `5.1` = "other reason (implausible reason) (unknown)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `6.4` = "physical activity (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = .replace_labels(
    standardized_value_labels$mweightgr,
    `-2` = "na, see HMWEIGHTGR2",
    `1` = "sickness",
    `2` = "related to eating",
    `3` = "physical inactivity",
    `4` = "eating and physical inactivity",
    `5` = "reason unknown"
  ),
    mweightlr = .replace_labels(
    standardized_value_labels$mweightlr,
    `-2` = "na, see HMWEIGHTLR2",
    `1` = "sickness (unintentional)",
    `2` = "diet (intentional)",
    `3` = "different diet (unintentional)"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    mapp7d = c(`-1` = "na, asked", `1` = "good", `2` = "moderate", `3` = "poor"),
    mattw = .replace_labels(
    standardized_value_labels$mattw,
    `-1` = "na, asked",
    `2` = "yes, trying not gain weight"
  ),
    mestw = c(
    `-1` = "na, asked",
    `1` = "severe underweight",
    `2` = "underweight",
    `3` = "approx.. normal weight",
    `4` = "overweight",
    `5` = "severe overweight",
    `6` = "do not know"
  ),
    mprob6m = c(`-1` = "na, asked", `1` = "no", `2` = "yes"),
    msatw = .replace_labels(
    standardized_value_labels$msatw,
    `1` = "very dissatisfied",
    `2` = "dissatisfied",
    `3` = "not satisfied/dissatisfied",
    `4` = "satisfied"
  ),
    mweightch = c(`-1` = "na, asked", `1` = "not changed", `2` = "gained weight", `3` = "lost weight"),
    mweightchkg = c(`-2` = "na, see H/BMWEIGHTCH", `-1` = "na, asked"),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "na, see H/BMWEIGHTLR2/GR2",
    `-1` = "na, asked see *Table Reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `2.6` = "eating less and physical active (intentional)",
    `2.7` = "eating less or different (unintentional)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `5.1` = "other reason (implausible reason) (unknown)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `6.4` = "physical activity (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = .replace_labels(
    standardized_value_labels$mweightgr,
    `-2` = "na, see HMWEIGHTGR2",
    `1` = "sickness",
    `2` = "related to eating",
    `3` = "physical inactivity",
    `4` = "eating and physical inactivity",
    `5` = "reason unknown"
  ),
    mweightlr = .replace_labels(
    standardized_value_labels$mweightlr,
    `-2` = "na, see HMWEIGHTLR2",
    `1` = "sickness (unintentional)",
    `2` = "diet (intentional)",
    `3` = "different diet (unintentional)"
  )
  ),
  Wave_MB_labels = standardized_value_labels,
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    mestw = .replace_labels(
    standardized_value_labels$mestw,
    `1` = "severe underweight",
    `2` = "underweight",
    `3` = "approx. normal weight"
  ),
    mweightch = c(
    `-3` = "na, section not done",
    `-1` = "na, asked",
    `1` = "not changed",
    `2` = "gained weight",
    `3` = "lost weight"
  ),
    mweightchrc = c(
    `-3` = "no valid data",
    `-2` = "na, see IMWEIGHTLR2/GR2",
    `-1` = "na, asked see *Table Reason",
    `1` = "sickness (unintentional)",
    `1.1` = "medication (unintentional)",
    `1.2` = "physical inactive due to sickness (unintentional)",
    `2` = "diet (intentional)",
    `2.1` = "eating less or different (unknown)",
    `2.2` = "eating more or different (unintentional)",
    `2.3` = "eating more and physical inactive (unintentional)",
    `2.4` = "quit smoking (unknown)",
    `2.5` = "smoking (unknown)",
    `2.6` = "eating less and physical active (intentional)",
    `2.7` = "eating less or different (unintentional)",
    `3` = "social factors (unintentional)",
    `3.1` = "social factors recoded (unintentional)",
    `5` = "do not know (unintentional)",
    `5.1` = "other reason (implausible reason) (unknown)",
    `6` = "physical activities (intentional)",
    `6.1` = "physical activity (unknown)",
    `6.2` = "physical inactivity (unintentional)",
    `6.3` = "working harder (unintentional)",
    `6.4` = "physical activity (unintentional)",
    `7` = "older age (unintentional)",
    `8` = "loss of appetite (unintentional)",
    `9` = "diuretics or dehydration",
    `9.1` = "oedeme/ascites",
    `9.2` = "quit prednison"
  ),
    mweightgr = .replace_labels(
    standardized_value_labels$mweightgr,
    `-2` = "na, see IMWEIGHTGR2",
    `1` = "sickness",
    `2` = "related to eating",
    `3` = "physical inactivity",
    `4` = "eating and physical inactivity",
    `5` = "reason unknown"
  ),
    mweightgr2 = .replace_labels(
    standardized_value_labels$mweightgr2,
    `-2` = "na, see IMWEIGHTCH"
  ),
    mweightlr = .replace_labels(
    standardized_value_labels$mweightlr,
    `-2` = "na, see IMWEIGHTLR2",
    `1` = "sickness (unintentional)",
    `2` = "diet (intentional)",
    `3` = "different diet (unintentional)"
  ),
    mweightlr2 = .replace_labels(
    standardized_value_labels$mweightlr2,
    `-2` = "na, see I/JMWEIGHTCH"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    mestw = .replace_labels(
    standardized_value_labels$mestw,
    `1` = "severe underweight",
    `2` = "underweight",
    `3` = "approx. normal weight"
  ),
    mweightch = c(
    `-3` = "na, section not done",
    `-1` = "na, asked",
    `1` = "not changed",
    `2` = "gained weight",
    `3` = "lost weight"
  ),
    mweightgr2 = .replace_labels(
    standardized_value_labels$mweightgr2,
    `-2` = "na, see IMWEIGHTCH"
  ),
    mweightlr2 = .replace_labels(
    standardized_value_labels$mweightlr2,
    `-2` = "na, see I/JMWEIGHTCH"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "160", waves = .lasa_wave_rows()) |>
    .override_label(wave = "B", variable = "mweightchrc", override_value = "bmweightchcr") |>
    .override_label(wave = "H", variable = "mweightgr2", override_value = "hmweightr2") |>
    .override_label(wave = "3B", variable = "mweightgr2", override_value = "bmweightr2"),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "160", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "160", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "160", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["mheight40y"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mweightage"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["mweightk40y"]][fc_labels$value_labels$LASA_Wave == "B"] <- list(NULL)
fc_labels$value_labels[["magewmx"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mhage25"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mwage25"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mwage40"]][fc_labels$value_labels$LASA_Wave == "2B"] <- list(NULL)
fc_labels$value_labels[["mhage25"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mwage25"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mwage40"]][fc_labels$value_labels$LASA_Wave == "3B"] <- list(NULL)
fc_labels$value_labels[["mwlbelt"]][fc_labels$value_labels$LASA_Wave == "MB"] <- list(NULL)
fc_labels$value_labels[["mwlwatc"]][fc_labels$value_labels$LASA_Wave == "MB"] <- list(NULL)
fc_labels$value_labels[["mhage25"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)
fc_labels$value_labels[["mwage40"]][fc_labels$value_labels$LASA_Wave == "I"] <- list(NULL)

.lasa_fc_160 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

