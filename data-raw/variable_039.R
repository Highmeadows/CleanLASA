## LASA filecode 039 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/labels/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  lidasadhda = "ADD/ADHD: age of first diagnosis",
  lidasadhdd = "ADD/ADHD: diagnosis",
  lidasadhdt = "ADD/ADHD: received treatment",
  lidasalca = "Alcohol addiction: age of first diagnosis",
  lidasalcd = "Alcohol addiction: diagnosis",
  lidasalct = "Alcohol addiction: received treatment",
  lidasanxa = "Anxiety disorder: age of first diagnosis",
  lidasanxd = "Anxiety disorder: diagnosis",
  lidasanxt = "Anxiety disorder: received treatment",
  lidasbipola = "Bipolar disorder: age of first diagnosis",
  lidasbipold = "Dipolar disorder: diagnosis",
  lidasbipolt = "Bipolar disorder: received treatment",
  lidascont = "Contacted psychological care (mental health care, psychologist or social worker",
  lidasdepa = "Depression: age of first diagnosis",
  lidasdepd = "Depression: diagnosis",
  lidasdept = "Depression: received treatment",
  lidasdiag = "Had mental disorder",
  lidasdruga = "Drug addiction: age of first diagnosis",
  lidasdrugd = "Drug addiction: diagnosis",
  lidasdrugt = "Drug addiction: received treatment",
  lidaseda = "Eating disorder: age of first diagnosis",
  lidasedd = "Eating disorder: diagnosis",
  lidasedt = "Eating disorder: received treatment",
  lidasocda = "OCD: age of first diagnosis",
  lidasocdd = "Obsessive compulsive disorder (OCD): diagnosis",
  lidasocdt = "OCD: received treatment",
  lidasotha = "Other mental disorder: age of first diagnosis",
  lidasothd = "Other: diagnosis",
  lidasotht = "Other mental disorder: received treatment",
  lidaspanica = "Panic disorder: age of first diagnosis",
  lidaspanicd = "Panic disorder: diagnosis",
  lidaspanict = "Panic disorder: received treatment",
  lidaspersda = "Personality disorder: age of first diagnosis",
  lidaspersdd = "Personality disorder: diagnosis",
  lidaspersdt = "Personality disorder: received treatment",
  lidasphoa = "Phobia: age of first diagnosis",
  lidasphod = "Phobia: diagnosis",
  lidasphot = "Phobia: received treatment",
  lidasptssa = "PTSS: age of first diagnosis",
  lidasptssd = "PTSS: diagnosis",
  lidasptsst = "PTSS: received treatment",
  lidasschiza = "Schizophrenia: age of first diagnosis",
  lidasschizd = "Schizophrenia: diagnosis",
  lidasschizt = "Schizophrenia: received treatment",
  lidastreat = "Received mental treatment/medication",
  lidastreatad = "Mental treatment/medication: antidepressant",
  lidastreatect = "Mental treatment/medication: Electroconvulsive therapy (ECT)",
  lidastreateh = "Mental treatment/medication: e-health intervention",
  lidastreatlight = "Mental treatment/medication: light therapy",
  lidastreatoth = "Mental treatment/medication: other",
  lidastreatphos = "Mental treatment/medication: admission psychiatric hospital",
  lidastreatpsy = "Mental treatment/medication: psychotherapy (CBT, interpersonal therapy)",
  lidastreatrun = "Mental treatment/medication: running therapy/physical exertion"
)

variable_labels_list <- list(
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  lidasadhda = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasadhdd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasadhdt = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasalca = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasalcd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasalct = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasanxa = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasanxd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasanxt = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasbipola = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasbipold = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasbipolt = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidascont = c(
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasdepa = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasdepd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasdept = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasdiag = stats::setNames(character(0), character(0)),
  lidasdruga = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasdrugd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasdrugt = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidaseda = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasedd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasedt = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasocda = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasocdd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasocdt = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasotha = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasothd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasotht = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidaspanica = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidaspanicd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidaspanict = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidaspersda = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidaspersdd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidaspersdt = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasphoa = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasphod = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasphot = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasptssa = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasptssd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasptsst = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidasschiza = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked"
  ),
  lidasschizd = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasschizt = c(
    `-3` = "not available, wrong skip",
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidastreat = c(
    `-4` = "not available, short interview",
    `-3` = "not available, wrong skip",
    `-1` = "not available, asked",
    `1` = "no",
    `2` = "yes"
  ),
  lidastreatad = c(
    `-2` = "not available, routing",
    `-1` = "not available, asked",
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidastreatect = stats::setNames(character(0), character(0)),
  lidastreateh = stats::setNames(character(0), character(0)),
  lidastreatlight = stats::setNames(character(0), character(0)),
  lidastreatoth = stats::setNames(character(0), character(0)),
  lidastreatphos = stats::setNames(character(0), character(0)),
  lidastreatpsy = stats::setNames(character(0), character(0)),
  lidastreatrun = stats::setNames(character(0), character(0))
)

value_labels_list <- list(
  Wave_K_labels = .replace_in_list(
    standardized_value_labels[c(
    "lidasadhda",
    "lidasadhdd",
    "lidasadhdt",
    "lidasalca",
    "lidasalcd",
    "lidasalct",
    "lidasanxa",
    "lidasanxd",
    "lidasanxt",
    "lidasbipola",
    "lidasbipold",
    "lidasbipolt",
    "lidascont",
    "lidasdepa",
    "lidasdepd",
    "lidasdept",
    "lidasdruga",
    "lidasdrugd",
    "lidasdrugt",
    "lidaseda",
    "lidasedd",
    "lidasedt",
    "lidasocda",
    "lidasocdd",
    "lidasocdt",
    "lidasotha",
    "lidasothd",
    "lidasotht",
    "lidaspanica",
    "lidaspanicd",
    "lidaspanict",
    "lidaspersda",
    "lidaspersdd",
    "lidaspersdt",
    "lidasphoa",
    "lidasphod",
    "lidasphot",
    "lidasptssa",
    "lidasptssd",
    "lidasptsst",
    "lidasschiza",
    "lidasschizd",
    "lidasschizt",
    "lidastreat",
    "lidastreatad"
  )],
    lidasadhda = .replace_labels(
    standardized_value_labels$lidasadhda,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasadhdd = .replace_labels(
    standardized_value_labels$lidasadhdd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasadhdt = .replace_labels(
    standardized_value_labels$lidasadhdt,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasalca = .replace_labels(
    standardized_value_labels$lidasalca,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasalcd = .replace_labels(
    standardized_value_labels$lidasalcd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasalct = .replace_labels(
    standardized_value_labels$lidasalct,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasanxa = .replace_labels(
    standardized_value_labels$lidasanxa,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasanxd = .replace_labels(
    standardized_value_labels$lidasanxd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasanxt = .replace_labels(
    standardized_value_labels$lidasanxt,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasbipola = .replace_labels(
    standardized_value_labels$lidasbipola,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasbipold = .replace_labels(
    standardized_value_labels$lidasbipold,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasbipolt = .replace_labels(
    standardized_value_labels$lidasbipolt,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidascont = .replace_labels(
    standardized_value_labels$lidascont,
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lidasdepa = .replace_labels(
    standardized_value_labels$lidasdepa,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasdepd = .replace_labels(
    standardized_value_labels$lidasdepd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasdept = .replace_labels(
    standardized_value_labels$lidasdept,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasdruga = .replace_labels(
    standardized_value_labels$lidasdruga,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasdrugd = .replace_labels(
    standardized_value_labels$lidasdrugd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasdrugt = .replace_labels(
    standardized_value_labels$lidasdrugt,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidaseda = .replace_labels(
    standardized_value_labels$lidaseda,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasedd = .replace_labels(
    standardized_value_labels$lidasedd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasedt = .replace_labels(
    standardized_value_labels$lidasedt,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasocda = .replace_labels(
    standardized_value_labels$lidasocda,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasocdd = .replace_labels(
    standardized_value_labels$lidasocdd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasocdt = .replace_labels(
    standardized_value_labels$lidasocdt,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasotha = .replace_labels(
    standardized_value_labels$lidasotha,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasothd = .replace_labels(
    standardized_value_labels$lidasothd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasotht = .replace_labels(
    standardized_value_labels$lidasotht,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidaspanica = .replace_labels(
    standardized_value_labels$lidaspanica,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidaspanicd = .replace_labels(
    standardized_value_labels$lidaspanicd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidaspanict = .replace_labels(
    standardized_value_labels$lidaspanict,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidaspersda = .replace_labels(
    standardized_value_labels$lidaspersda,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidaspersdd = .replace_labels(
    standardized_value_labels$lidaspersdd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidaspersdt = .replace_labels(
    standardized_value_labels$lidaspersdt,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasphoa = .replace_labels(
    standardized_value_labels$lidasphoa,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasphod = .replace_labels(
    standardized_value_labels$lidasphod,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasphot = .replace_labels(
    standardized_value_labels$lidasphot,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasptssa = .replace_labels(
    standardized_value_labels$lidasptssa,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasptssd = .replace_labels(
    standardized_value_labels$lidasptssd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasptsst = .replace_labels(
    standardized_value_labels$lidasptsst,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasschiza = .replace_labels(
    standardized_value_labels$lidasschiza,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasschizd = .replace_labels(
    standardized_value_labels$lidasschizd,
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidasschizt = .replace_labels(
    standardized_value_labels$lidasschizt,
    `-3` = "na, wrong skip",
    `-2` = "na, see klidasdiag",
    `-1` = "na, asked"
  ),
    lidastreat = .replace_labels(
    standardized_value_labels$lidastreat,
    `-4` = "na, short interview",
    `-3` = "na, wrong skip",
    `-1` = "na, asked"
  ),
    lidastreatad = .replace_labels(
    standardized_value_labels$lidastreatad,
    `-2` = "na, see klidastreat",
    `-1` = "na, asked"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  lidasadhda = "numeric",
  lidasadhdd = "categorical",
  lidasadhdt = "categorical",
  lidasalca = "numeric",
  lidasalcd = "categorical",
  lidasalct = "categorical",
  lidasanxa = "numeric",
  lidasanxd = "categorical",
  lidasanxt = "categorical",
  lidasbipola = "numeric",
  lidasbipold = "categorical",
  lidasbipolt = "categorical",
  lidascont = "categorical",
  lidasdepa = "numeric",
  lidasdepd = "categorical",
  lidasdept = "categorical",
  lidasdiag = "categorical",
  lidasdruga = "numeric",
  lidasdrugd = "categorical",
  lidasdrugt = "categorical",
  lidaseda = "numeric",
  lidasedd = "categorical",
  lidasedt = "categorical",
  lidasocda = "numeric",
  lidasocdd = "categorical",
  lidasocdt = "categorical",
  lidasotha = "numeric",
  lidasothd = "categorical",
  lidasotht = "categorical",
  lidaspanica = "numeric",
  lidaspanicd = "categorical",
  lidaspanict = "categorical",
  lidaspersda = "numeric",
  lidaspersdd = "categorical",
  lidaspersdt = "categorical",
  lidasphoa = "numeric",
  lidasphod = "categorical",
  lidasphot = "categorical",
  lidasptssa = "numeric",
  lidasptssd = "categorical",
  lidasptsst = "categorical",
  lidasschiza = "numeric",
  lidasschizd = "categorical",
  lidasschizt = "categorical",
  lidastreat = "categorical",
  lidastreatad = "categorical",
  lidastreatect = "categorical",
  lidastreateh = "categorical",
  lidastreatlight = "categorical",
  lidastreatoth = "categorical",
  lidastreatphos = "categorical",
  lidastreatpsy = "categorical",
  lidastreatrun = "categorical"
)

.lasa_fc_039 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "039", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "039", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "039", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "039", waves = .lasa_wave_rows())
)
