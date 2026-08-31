## LASA filecode 039 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
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

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `K` = c(
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
    "lidasdiag",
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
    "lidastreatad",
    "lidastreatect",
    "lidastreateh",
    "lidastreatlight",
    "lidastreatoth",
    "lidastreatphos",
    "lidastreatpsy",
    "lidastreatrun"
  )
)

variable_labels_list <- list(
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "no",
  `2` = "yes"
)

standardized_value_labels <- list(
  lidasadhda = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasadhdd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasadhdt = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasalca = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasalcd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasalct = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasanxa = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasanxd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasanxt = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasbipola = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasbipold = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasbipolt = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidascont = c(
    default_missing_labels[c("-4", "-3", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasdepa = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasdepd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasdept = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasdiag = stats::setNames(character(0), character(0)),
  lidasdruga = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasdrugd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasdrugt = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidaseda = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasedd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasedt = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasocda = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasocdd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasocdt = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasotha = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasothd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasotht = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidaspanica = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidaspanicd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidaspanict = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidaspersda = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidaspersdd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidaspersdt = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasphoa = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasphod = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasphot = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasptssa = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasptssd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasptsst = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidasschiza = c(
    default_missing_labels[c("-3", "-2", "-1")]
  ),
  lidasschizd = c(
    default_missing_labels[c("-2", "-1")],
    `0` = "not mentioned",
    `1` = "mentioned"
  ),
  lidasschizt = c(
    default_missing_labels[c("-3", "-2", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidastreat = c(
    default_missing_labels[c("-4", "-3", "-1")],
    default_answer_labels[c("1", "2")]
  ),
  lidastreatad = c(
    default_missing_labels[c("-2", "-1")],
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
    standardized_value_labels,
    lidasadhda = .replace_labels(
    standardized_value_labels$lidasadhda,
    `-2` = "na, see klidasdiag"
  ),
    lidasadhdd = .replace_labels(
    standardized_value_labels$lidasadhdd,
    `-2` = "na, see klidasdiag"
  ),
    lidasadhdt = .replace_labels(
    standardized_value_labels$lidasadhdt,
    `-2` = "na, see klidasdiag"
  ),
    lidasalca = .replace_labels(
    standardized_value_labels$lidasalca,
    `-2` = "na, see klidasdiag"
  ),
    lidasalcd = .replace_labels(
    standardized_value_labels$lidasalcd,
    `-2` = "na, see klidasdiag"
  ),
    lidasalct = .replace_labels(
    standardized_value_labels$lidasalct,
    `-2` = "na, see klidasdiag"
  ),
    lidasanxa = .replace_labels(
    standardized_value_labels$lidasanxa,
    `-2` = "na, see klidasdiag"
  ),
    lidasanxd = .replace_labels(
    standardized_value_labels$lidasanxd,
    `-2` = "na, see klidasdiag"
  ),
    lidasanxt = .replace_labels(
    standardized_value_labels$lidasanxt,
    `-2` = "na, see klidasdiag"
  ),
    lidasbipola = .replace_labels(
    standardized_value_labels$lidasbipola,
    `-2` = "na, see klidasdiag"
  ),
    lidasbipold = .replace_labels(
    standardized_value_labels$lidasbipold,
    `-2` = "na, see klidasdiag"
  ),
    lidasbipolt = .replace_labels(
    standardized_value_labels$lidasbipolt,
    `-2` = "na, see klidasdiag"
  ),
    lidasdepa = .replace_labels(
    standardized_value_labels$lidasdepa,
    `-2` = "na, see klidasdiag"
  ),
    lidasdepd = .replace_labels(
    standardized_value_labels$lidasdepd,
    `-2` = "na, see klidasdiag"
  ),
    lidasdept = .replace_labels(
    standardized_value_labels$lidasdept,
    `-2` = "na, see klidasdiag"
  ),
    lidasdruga = .replace_labels(
    standardized_value_labels$lidasdruga,
    `-2` = "na, see klidasdiag"
  ),
    lidasdrugd = .replace_labels(
    standardized_value_labels$lidasdrugd,
    `-2` = "na, see klidasdiag"
  ),
    lidasdrugt = .replace_labels(
    standardized_value_labels$lidasdrugt,
    `-2` = "na, see klidasdiag"
  ),
    lidaseda = .replace_labels(
    standardized_value_labels$lidaseda,
    `-2` = "na, see klidasdiag"
  ),
    lidasedd = .replace_labels(
    standardized_value_labels$lidasedd,
    `-2` = "na, see klidasdiag"
  ),
    lidasedt = .replace_labels(
    standardized_value_labels$lidasedt,
    `-2` = "na, see klidasdiag"
  ),
    lidasocda = .replace_labels(
    standardized_value_labels$lidasocda,
    `-2` = "na, see klidasdiag"
  ),
    lidasocdd = .replace_labels(
    standardized_value_labels$lidasocdd,
    `-2` = "na, see klidasdiag"
  ),
    lidasocdt = .replace_labels(
    standardized_value_labels$lidasocdt,
    `-2` = "na, see klidasdiag"
  ),
    lidasotha = .replace_labels(
    standardized_value_labels$lidasotha,
    `-2` = "na, see klidasdiag"
  ),
    lidasothd = .replace_labels(
    standardized_value_labels$lidasothd,
    `-2` = "na, see klidasdiag"
  ),
    lidasotht = .replace_labels(
    standardized_value_labels$lidasotht,
    `-2` = "na, see klidasdiag"
  ),
    lidaspanica = .replace_labels(
    standardized_value_labels$lidaspanica,
    `-2` = "na, see klidasdiag"
  ),
    lidaspanicd = .replace_labels(
    standardized_value_labels$lidaspanicd,
    `-2` = "na, see klidasdiag"
  ),
    lidaspanict = .replace_labels(
    standardized_value_labels$lidaspanict,
    `-2` = "na, see klidasdiag"
  ),
    lidaspersda = .replace_labels(
    standardized_value_labels$lidaspersda,
    `-2` = "na, see klidasdiag"
  ),
    lidaspersdd = .replace_labels(
    standardized_value_labels$lidaspersdd,
    `-2` = "na, see klidasdiag"
  ),
    lidaspersdt = .replace_labels(
    standardized_value_labels$lidaspersdt,
    `-2` = "na, see klidasdiag"
  ),
    lidasphoa = .replace_labels(
    standardized_value_labels$lidasphoa,
    `-2` = "na, see klidasdiag"
  ),
    lidasphod = .replace_labels(
    standardized_value_labels$lidasphod,
    `-2` = "na, see klidasdiag"
  ),
    lidasphot = .replace_labels(
    standardized_value_labels$lidasphot,
    `-2` = "na, see klidasdiag"
  ),
    lidasptssa = .replace_labels(
    standardized_value_labels$lidasptssa,
    `-2` = "na, see klidasdiag"
  ),
    lidasptssd = .replace_labels(
    standardized_value_labels$lidasptssd,
    `-2` = "na, see klidasdiag"
  ),
    lidasptsst = .replace_labels(
    standardized_value_labels$lidasptsst,
    `-2` = "na, see klidasdiag"
  ),
    lidasschiza = .replace_labels(
    standardized_value_labels$lidasschiza,
    `-2` = "na, see klidasdiag"
  ),
    lidasschizd = .replace_labels(
    standardized_value_labels$lidasschizd,
    `-2` = "na, see klidasdiag"
  ),
    lidasschizt = .replace_labels(
    standardized_value_labels$lidasschizt,
    `-2` = "na, see klidasdiag"
  ),
    lidastreatad = .replace_labels(
    standardized_value_labels$lidastreatad,
    `-2` = "na, see klidastreat"
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

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "039", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "039", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "039", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "039", waves = .lasa_wave_rows())
)

fc_labels$value_labels[["lidasdiag"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["lidastreatect"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["lidastreateh"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["lidastreatlight"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["lidastreatoth"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["lidastreatphos"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["lidastreatpsy"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)
fc_labels$value_labels[["lidastreatrun"]][fc_labels$value_labels$LASA_Wave == "K"] <- list(NULL)

.lasa_fc_039 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

