## LASA filecode 039 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_039 <- list(
  variables = data.frame(
    wave = c(
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K",
      "K"
    ),
    variable_name = c(
      "klidasadhda",
      "klidasadhdd",
      "klidasadhdt",
      "klidasalca",
      "klidasalcd",
      "klidasalct",
      "klidasanxa",
      "klidasanxd",
      "klidasanxt",
      "klidasbipola",
      "klidasbipold",
      "klidasbipolt",
      "klidascont",
      "klidasdepa",
      "klidasdepd",
      "klidasdept",
      "klidasdiag",
      "klidasdruga",
      "klidasdrugd",
      "klidasdrugt",
      "klidaseda",
      "klidasedd",
      "klidasedt",
      "klidasocda",
      "klidasocdd",
      "klidasocdt",
      "klidasotha",
      "klidasothd",
      "klidasotht",
      "klidaspanica",
      "klidaspanicd",
      "klidaspanict",
      "klidaspersda",
      "klidaspersdd",
      "klidaspersdt",
      "klidasphoa",
      "klidasphod",
      "klidasphot",
      "klidasptssa",
      "klidasptssd",
      "klidasptsst",
      "klidasschiza",
      "klidasschizd",
      "klidasschizt",
      "klidastreat",
      "klidastreatad",
      "klidastreatect",
      "klidastreateh",
      "klidastreatlight",
      "klidastreatoth",
      "klidastreatphos",
      "klidastreatpsy",
      "klidastreatrun"
    ),
    canonical_name = c(
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
    ),
    variable_label = c(
      "ADD/ADHD: age of first diagnosis",
      "ADD/ADHD: diagnosis",
      "ADD/ADHD: received treatment",
      "Alcohol addiction: age of first diagnosis",
      "Alcohol addiction: diagnosis",
      "Alcohol addiction: received treatment",
      "Anxiety disorder: age of first diagnosis",
      "Anxiety disorder: diagnosis",
      "Anxiety disorder: received treatment",
      "Bipolar disorder: age of first diagnosis",
      "Dipolar disorder: diagnosis",
      "Bipolar disorder: received treatment",
      "Contacted psychological care (mental health care, psychologist or social worker",
      "Depression: age of first diagnosis",
      "Depression: diagnosis",
      "Depression: received treatment",
      "Had mental disorder",
      "Drug addiction: age of first diagnosis",
      "Drug addiction: diagnosis",
      "Drug addiction: received treatment",
      "Eating disorder: age of first diagnosis",
      "Eating disorder: diagnosis",
      "Eating disorder: received treatment",
      "OCD: age of first diagnosis",
      "Obsessive compulsive disorder (OCD): diagnosis",
      "OCD: received treatment",
      "Other mental disorder: age of first diagnosis",
      "Other: diagnosis",
      "Other mental disorder: received treatment",
      "Panic disorder: age of first diagnosis",
      "Panic disorder: diagnosis",
      "Panic disorder: received treatment",
      "Personality disorder: age of first diagnosis",
      "Personality disorder: diagnosis",
      "Personality disorder: received treatment",
      "Phobia: age of first diagnosis",
      "Phobia: diagnosis",
      "Phobia: received treatment",
      "PTSS: age of first diagnosis",
      "PTSS: diagnosis",
      "PTSS: received treatment",
      "Schizophrenia: age of first diagnosis",
      "Schizophrenia: diagnosis",
      "Schizophrenia: received treatment",
      "Received mental treatment/medication",
      "Mental treatment/medication: antidepressant",
      "Mental treatment/medication: Electroconvulsive therapy (ECT)",
      "Mental treatment/medication: e-health intervention",
      "Mental treatment/medication: light therapy",
      "Mental treatment/medication: other",
      "Mental treatment/medication: admission psychiatric hospital",
      "Mental treatment/medication: psychotherapy (CBT, interpersonal therapy)",
      "Mental treatment/medication: running therapy/physical exertion"
    ),
    harmonized_var_label = c(
      "ADD/ADHD: age of first diagnosis",
      "ADD/ADHD: diagnosis",
      "ADD/ADHD: received treatment",
      "Alcohol addiction: age of first diagnosis",
      "Alcohol addiction: diagnosis",
      "Alcohol addiction: received treatment",
      "Anxiety disorder: age of first diagnosis",
      "Anxiety disorder: diagnosis",
      "Anxiety disorder: received treatment",
      "Bipolar disorder: age of first diagnosis",
      "Dipolar disorder: diagnosis",
      "Bipolar disorder: received treatment",
      "Contacted psychological care (mental health care, psychologist or social worker",
      "Depression: age of first diagnosis",
      "Depression: diagnosis",
      "Depression: received treatment",
      "Had mental disorder",
      "Drug addiction: age of first diagnosis",
      "Drug addiction: diagnosis",
      "Drug addiction: received treatment",
      "Eating disorder: age of first diagnosis",
      "Eating disorder: diagnosis",
      "Eating disorder: received treatment",
      "OCD: age of first diagnosis",
      "Obsessive compulsive disorder (OCD): diagnosis",
      "OCD: received treatment",
      "Other mental disorder: age of first diagnosis",
      "Other: diagnosis",
      "Other mental disorder: received treatment",
      "Panic disorder: age of first diagnosis",
      "Panic disorder: diagnosis",
      "Panic disorder: received treatment",
      "Personality disorder: age of first diagnosis",
      "Personality disorder: diagnosis",
      "Personality disorder: received treatment",
      "Phobia: age of first diagnosis",
      "Phobia: diagnosis",
      "Phobia: received treatment",
      "PTSS: age of first diagnosis",
      "PTSS: diagnosis",
      "PTSS: received treatment",
      "Schizophrenia: age of first diagnosis",
      "Schizophrenia: diagnosis",
      "Schizophrenia: received treatment",
      "Received mental treatment/medication",
      "Mental treatment/medication: antidepressant",
      "Mental treatment/medication: Electroconvulsive therapy (ECT)",
      "Mental treatment/medication: e-health intervention",
      "Mental treatment/medication: light therapy",
      "Mental treatment/medication: other",
      "Mental treatment/medication: admission psychiatric hospital",
      "Mental treatment/medication: psychotherapy (CBT, interpersonal therapy)",
      "Mental treatment/medication: running therapy/physical exertion"
    ),
    var_type = c(
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "numeric",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    lidasadhda = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasadhdd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasadhdt = list(
      K = no_yes_32
    ),
    lidasalca = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasalcd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasalct = list(
      K = no_yes_32
    ),
    lidasanxa = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasanxd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasanxt = list(
      K = no_yes_32
    ),
    lidasbipola = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasbipold = list(
      K = not_mentioned_mentioned_111
    ),
    lidasbipolt = list(
      K = no_yes_32
    ),
    lidascont = list(
      K = no_yes_305
    ),
    lidasdepa = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasdepd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasdept = list(
      K = no_yes_32
    ),
    lidasdruga = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasdrugd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasdrugt = list(
      K = no_yes_32
    ),
    lidaseda = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasedd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasedt = list(
      K = no_yes_32
    ),
    lidasocda = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasocdd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasocdt = list(
      K = no_yes_32
    ),
    lidasotha = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasothd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasotht = list(
      K = no_yes_32
    ),
    lidaspanica = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidaspanicd = list(
      K = not_mentioned_mentioned_111
    ),
    lidaspanict = list(
      K = no_yes_32
    ),
    lidaspersda = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidaspersdd = list(
      K = not_mentioned_mentioned_111
    ),
    lidaspersdt = list(
      K = no_yes_32
    ),
    lidasphoa = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasphod = list(
      K = not_mentioned_mentioned_111
    ),
    lidasphot = list(
      K = no_yes_32
    ),
    lidasptssa = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasptssd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasptsst = list(
      K = no_yes_32
    ),
    lidasschiza = list(
      K = na_wrong_skip_na_see_klidasdiag_na_asked
    ),
    lidasschizd = list(
      K = not_mentioned_mentioned_111
    ),
    lidasschizt = list(
      K = no_yes_32
    ),
    lidastreat = list(
      K = no_yes_305
    ),
    lidastreatad = list(
      K = c(`-2` = "na, see klidastreat", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned")
    )
  ),

  value_labels_harmonized = list(
    lidasadhda = not_available_wrong_skip_not_available_routing,
    lidasadhdd = not_mentioned_mentioned_21,
    lidasadhdt = no_yes_4,
    lidasalca = not_available_wrong_skip_not_available_routing,
    lidasalcd = not_mentioned_mentioned_21,
    lidasalct = no_yes_4,
    lidasanxa = not_available_wrong_skip_not_available_routing,
    lidasanxd = not_mentioned_mentioned_21,
    lidasanxt = no_yes_4,
    lidasbipola = not_available_wrong_skip_not_available_routing,
    lidasbipold = not_mentioned_mentioned_21,
    lidasbipolt = no_yes_4,
    lidascont = no_yes_306,
    lidasdepa = not_available_wrong_skip_not_available_routing,
    lidasdepd = not_mentioned_mentioned_21,
    lidasdept = no_yes_4,
    lidasdruga = not_available_wrong_skip_not_available_routing,
    lidasdrugd = not_mentioned_mentioned_21,
    lidasdrugt = no_yes_4,
    lidaseda = not_available_wrong_skip_not_available_routing,
    lidasedd = not_mentioned_mentioned_21,
    lidasedt = no_yes_4,
    lidasocda = not_available_wrong_skip_not_available_routing,
    lidasocdd = not_mentioned_mentioned_21,
    lidasocdt = no_yes_4,
    lidasotha = not_available_wrong_skip_not_available_routing,
    lidasothd = not_mentioned_mentioned_21,
    lidasotht = no_yes_4,
    lidaspanica = not_available_wrong_skip_not_available_routing,
    lidaspanicd = not_mentioned_mentioned_21,
    lidaspanict = no_yes_4,
    lidaspersda = not_available_wrong_skip_not_available_routing,
    lidaspersdd = not_mentioned_mentioned_21,
    lidaspersdt = no_yes_4,
    lidasphoa = not_available_wrong_skip_not_available_routing,
    lidasphod = not_mentioned_mentioned_21,
    lidasphot = no_yes_4,
    lidasptssa = not_available_wrong_skip_not_available_routing,
    lidasptssd = not_mentioned_mentioned_21,
    lidasptsst = no_yes_4,
    lidasschiza = not_available_wrong_skip_not_available_routing,
    lidasschizd = not_mentioned_mentioned_21,
    lidasschizt = no_yes_4,
    lidastreat = no_yes_306,
    lidastreatad = not_mentioned_mentioned_21
  )
)
