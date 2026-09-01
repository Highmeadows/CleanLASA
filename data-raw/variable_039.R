## LASA filecode 039 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  lidastreatrun = "Mental treatment/medication: running therapy/physical exertion",
  .applies_to_waves = c("Z")
)

variable_labels(
  "lidasadhda", "lidasadhdd", "lidasadhdt", "lidasalca", "lidasalcd", "lidasalct", "lidasanxa", "lidasanxd", "lidasanxt", "lidasbipola", "lidasbipold", "lidasbipolt", "lidascont", "lidasdepa", "lidasdepd", "lidasdept", "lidasdiag", "lidasdruga", "lidasdrugd", "lidasdrugt", "lidaseda", "lidasedd", "lidasedt", "lidasocda", "lidasocdd", "lidasocdt", "lidasotha", "lidasothd", "lidasotht", "lidaspanica", "lidaspanicd", "lidaspanict", "lidaspersda", "lidaspersdd", "lidaspersdt", "lidasphoa", "lidasphod", "lidasphot", "lidasptssa", "lidasptssd", "lidasptsst", "lidasschiza", "lidasschizd", "lidasschizt", "lidastreat", "lidastreatad", "lidastreatect", "lidastreateh", "lidastreatlight", "lidastreatoth", "lidastreatphos", "lidastreatpsy", "lidastreatrun",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("lidasadhda", "lidasadhdd", "lidasadhdt", "lidasalca", "lidasalcd", "lidasalct", "lidasanxa", "lidasanxd", "lidasanxt", "lidasbipola", "lidasbipold", "lidasbipolt", "lidascont", "lidasdepa", "lidasdepd", "lidasdept", "lidasdruga", "lidasdrugd", "lidasdrugt", "lidaseda", "lidasedd", "lidasedt", "lidasocda", "lidasocdd", "lidasocdt", "lidasotha", "lidasothd", "lidasotht", "lidaspanica", "lidaspanicd", "lidaspanict", "lidaspersda", "lidaspersdd", "lidaspersdt", "lidasphoa", "lidasphod", "lidasphot", "lidasptssa", "lidasptssd", "lidasptsst", "lidasschiza", "lidasschizd", "lidasschizt", "lidastreat", "lidastreatad"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-2` = "not available, routing",
  .applies_to_vars = c("lidasadhda", "lidasadhdd", "lidasadhdt", "lidasalca", "lidasalcd", "lidasalct", "lidasanxa", "lidasanxd", "lidasanxt", "lidasbipola", "lidasbipold", "lidasbipolt", "lidasdepa", "lidasdepd", "lidasdept", "lidasdruga", "lidasdrugd", "lidasdrugt", "lidaseda", "lidasedd", "lidasedt", "lidasocda", "lidasocdd", "lidasocdt", "lidasotha", "lidasothd", "lidasotht", "lidaspanica", "lidaspanicd", "lidaspanict", "lidaspersda", "lidaspersdd", "lidaspersdt", "lidasphoa", "lidasphod", "lidasphot", "lidasptssa", "lidasptssd", "lidasptsst", "lidasschiza", "lidasschizd", "lidasschizt", "lidastreatad"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-3` = "na, wrong skip",
  .applies_to_vars = c("lidasadhda", "lidasadhdt", "lidasalca", "lidasalct", "lidasanxa", "lidasanxt", "lidasbipola", "lidasbipolt", "lidascont", "lidasdepa", "lidasdept", "lidasdruga", "lidasdrugt", "lidaseda", "lidasedt", "lidasocda", "lidasocdt", "lidasotha", "lidasotht", "lidaspanica", "lidaspanict", "lidaspersda", "lidaspersdt", "lidasphoa", "lidasphot", "lidasptssa", "lidasptsst", "lidasschiza", "lidasschizt", "lidastreat"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("lidasadhdd", "lidasalcd", "lidasanxd", "lidasbipold", "lidasdepd", "lidasdrugd", "lidasedd", "lidasocdd", "lidasothd", "lidaspanicd", "lidaspersdd", "lidasphod", "lidasptssd", "lidasschizd"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("lidasadhdt", "lidasalct", "lidasanxt", "lidasbipolt", "lidasdept", "lidasdrugt", "lidasedt", "lidasocdt", "lidasotht", "lidaspanict", "lidaspersdt", "lidasphot", "lidasptsst", "lidasschizt"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-4` = "na, short interview", `1` = "no", `2` = "yes",
  .applies_to_vars = c("lidascont", "lidastreat"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("lidastreatad"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see klidasdiag",
  .applies_to_vars = c("lidasadhda", "lidasadhdd", "lidasadhdt", "lidasalca", "lidasalcd", "lidasalct", "lidasanxa", "lidasanxd", "lidasanxt", "lidasbipola", "lidasbipold", "lidasbipolt", "lidasdepa", "lidasdepd", "lidasdept", "lidasdruga", "lidasdrugd", "lidasdrugt", "lidaseda", "lidasedd", "lidasedt", "lidasocda", "lidasocdd", "lidasocdt", "lidasotha", "lidasothd", "lidasotht", "lidaspanica", "lidaspanicd", "lidaspanict", "lidaspersda", "lidaspersdd", "lidaspersdt", "lidasphoa", "lidasphod", "lidasphot", "lidasptssa", "lidasptssd", "lidasptsst", "lidasschiza", "lidasschizd", "lidasschizt"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see klidastreat", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("lidastreatad"),
  .applies_to_waves = c("K")
)

.lasa_fc_039 <- .lasa_finalize_fc("039")

