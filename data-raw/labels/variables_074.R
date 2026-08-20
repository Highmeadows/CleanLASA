## LASA filecode 074 -- variable labels, per-wave value labels, and
## harmonized (cross-wave-standardized) value labels.
##
## Generated once from the LASA variable-information transcription CSVs;
## maintained by hand from here on. To add a new wave: add row(s) to the
## `variables` data.frame below and, if the wave introduces value labels,
## a matching entry under `value_labels`. To add a new variable: same,
## plus (optionally) a `value_labels_harmonized` entry giving its
## cross-wave-standardized value labels.

.lasa_fc_074 <- list(
  variables = data.frame(
    wave = c(
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D",
      "D"
    ),
    variable_name = c(
      "dvige1",
      "dvige1b",
      "dvige2",
      "dvige2b",
      "dvige3",
      "dvige3b",
      "dvige4",
      "dvige4b",
      "dvige5",
      "dvige5b",
      "dvigeqc",
      "dvigeqej",
      "dvigeqme",
      "dvigeqmj",
      "dvigeqms",
      "dvigeqp",
      "dvigeqr",
      "dvigeqse",
      "dvigeqsj",
      "dvigj1",
      "dvigj1b",
      "dvigj2",
      "dvigj2b",
      "dvigj3",
      "dvigj3b",
      "dvigj4",
      "dvigj4b",
      "dvigj5",
      "dvigj5b",
      "dvigm1",
      "dvigm1b",
      "dvigm2",
      "dvigm2b",
      "dvigm3",
      "dvigm3b",
      "dvigm4",
      "dvigm4b",
      "dvigm5",
      "dvigm5b",
      "dvigs1",
      "dvigs1b",
      "dvigs2",
      "dvigs2b",
      "dvigs4",
      "dvigs4b",
      "dvigs5",
      "dvigs5b",
      "dvigseq",
      "dvigseq1",
      "dvigseq2",
      "dvigseq3",
      "dvigseq4"
    ),
    canonical_name = c(
      "vige1",
      "vige1b",
      "vige2",
      "vige2b",
      "vige3",
      "vige3b",
      "vige4",
      "vige4b",
      "vige5",
      "vige5b",
      "vigeqc",
      "vigeqej",
      "vigeqme",
      "vigeqmj",
      "vigeqms",
      "vigeqp",
      "vigeqr",
      "vigeqse",
      "vigeqsj",
      "vigj1",
      "vigj1b",
      "vigj2",
      "vigj2b",
      "vigj3",
      "vigj3b",
      "vigj4",
      "vigj4b",
      "vigj5",
      "vigj5b",
      "vigm1",
      "vigm1b",
      "vigm2",
      "vigm2b",
      "vigm3",
      "vigm3b",
      "vigm4",
      "vigm4b",
      "vigm5",
      "vigm5b",
      "vigs1",
      "vigs1b",
      "vigs2",
      "vigs2b",
      "vigs4",
      "vigs4b",
      "vigs5",
      "vigs5b",
      "vigseq",
      "vigseq1",
      "vigseq2",
      "vigseq3",
      "vigseq4"
    ),
    variable_label = c(
      "Emily: care",
      "Emily: care (condensed)",
      "Emily: change home situation",
      "Emily: change home situation (condensed)",
      "Emily: change employment situation",
      "Emily: change employment sit (condensed)",
      "Emily: improve frequency visits",
      "Emily: improve freq visits (condensed)",
      "Emily: disappointed",
      "Emily: disappointed (condensed)",
      "number of equal children (out of 4)",
      "Emily & John equal",
      "Mary & Emily equal",
      "Mary & John equal",
      "Mary & Sophia equal",
      "number of equal pairs (out of 6)",
      "equality vignettes: routing Q's",
      "Sophia & Emily equal",
      "Sophia & John equal",
      "John: care",
      "John: care (condensed)",
      "John: change home situation",
      "John: change home situation (condensed)",
      "John: change employment situation",
      "John: change employment sit (condensed)",
      "John: improve frequency visits",
      "John: improve freq visits (condensed)",
      "John: disappointed",
      "John: disappointed (condensed)",
      "Mary: care",
      "Mary: care (condensed)",
      "Mary: change home situation",
      "Mary: change home situation (condensed)",
      "Mary: change employment situation",
      "Mary: change employment sit (condensed)",
      "Mary: improve frequency visits",
      "Mary: improve freq visits (condensed)",
      "Mary: disappointed",
      "Mary: disappointed (condensed)",
      "Sophia: care",
      "Sophia: care (condensed)",
      "Sophia: change home situation",
      "Sophia: change home sit (condensed)",
      "Sophia: improve frequency visits",
      "Sophia: improve freq visits (condensed)",
      "Sophia: disappointed",
      "Sophia: disappointed (condensed)",
      "sequence Mary Sophia Emily John",
      "1st vignette on M-S-E-J",
      "2nd vignette on M-S-E-J",
      "3rd vignette on M-S-E-J",
      "4th vignette on M-S-E-J"
    ),
    harmonized_var_label = c(
      "Emily: care",
      "Emily: care (condensed)",
      "Emily: change home situation",
      "Emily: change home situation (condensed)",
      "Emily: change employment situation",
      "Emily: change employment sit (condensed)",
      "Emily: improve frequency visits",
      "Emily: improve freq visits (condensed)",
      "Emily: disappointed",
      "Emily: disappointed (condensed)",
      "number of equal children (out of 4)",
      "Emily & John equal",
      "Mary & Emily equal",
      "Mary & John equal",
      "Mary & Sophia equal",
      "number of equal pairs (out of 6)",
      "equality vignettes: routing Q's",
      "Sophia & Emily equal",
      "Sophia & John equal",
      "John: care",
      "John: care (condensed)",
      "John: change home situation",
      "John: change home situation (condensed)",
      "John: change employment situation",
      "John: change employment sit (condensed)",
      "John: improve frequency visits",
      "John: improve freq visits (condensed)",
      "John: disappointed",
      "John: disappointed (condensed)",
      "Mary: care",
      "Mary: care (condensed)",
      "Mary: change home situation",
      "Mary: change home situation (condensed)",
      "Mary: change employment situation",
      "Mary: change employment sit (condensed)",
      "Mary: improve frequency visits",
      "Mary: improve freq visits (condensed)",
      "Mary: disappointed",
      "Mary: disappointed (condensed)",
      "Sophia: care",
      "Sophia: care (condensed)",
      "Sophia: change home situation",
      "Sophia: change home sit (condensed)",
      "Sophia: improve frequency visits",
      "Sophia: improve freq visits (condensed)",
      "Sophia: disappointed",
      "Sophia: disappointed (condensed)",
      "sequence Mary Sophia Emily John",
      "1st vignette on M-S-E-J",
      "2nd vignette on M-S-E-J",
      "3rd vignette on M-S-E-J",
      "4th vignette on M-S-E-J"
    ),
    var_type = c(
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
      "numeric",
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "numeric",
      "text",
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
      "categorical",
      "categorical",
      "categorical",
      "categorical",
      "categorical"
    ),
    stringsAsFactors = FALSE
  ),

  value_labels = list(
    vige1 = list(
      D = no_yes_equal_to_oth_children_3
    ),
    vige1b = list(
      D = no_yes_3
    ),
    vige2 = list(
      D = no_yes_equal_to_oth_children_5
    ),
    vige2b = list(
      D = no_yes_3
    ),
    vige3 = list(
      D = no_yes_equal_to_oth_children_5
    ),
    vige3b = list(
      D = no_yes_3
    ),
    vige4 = list(
      D = no_yes_equal_to_oth_children
    ),
    vige4b = list(
      D = no_yes_3
    ),
    vige5 = list(
      D = no_yes_equal_to_oth_children
    ),
    vige5b = list(
      D = no_yes_3
    ),
    vigeqc = list(
      D = none_equal_2_children_equal_estimate_2_pairs_equal
    ),
    vigeqej = list(
      D = not_equal_equal
    ),
    vigeqme = list(
      D = not_equal_equal
    ),
    vigeqmj = list(
      D = not_equal_equal
    ),
    vigeqms = list(
      D = not_equal_equal
    ),
    vigeqp = list(
      D = none_equal_1pair_2child_equal_3pairs_3child_equal
    ),
    vigeqse = list(
      D = not_equal_equal
    ),
    vigeqsj = list(
      D = not_equal_equal
    ),
    vigj1 = list(
      D = no_yes_equal_to_oth_children_3
    ),
    vigj1b = list(
      D = no_yes_3
    ),
    vigj2 = list(
      D = no_yes_equal_to_oth_children_6
    ),
    vigj2b = list(
      D = no_yes_3
    ),
    vigj3 = list(
      D = no_yes_equal_to_oth_children_6
    ),
    vigj3b = list(
      D = no_yes_3
    ),
    vigj4 = list(
      D = no_yes_equal_to_oth_children
    ),
    vigj4b = list(
      D = no_yes_3
    ),
    vigj5 = list(
      D = no_yes_equal_to_oth_children
    ),
    vigj5b = list(
      D = no_yes_3
    ),
    vigm1 = list(
      D = no_yes_equal_to_oth_children_3
    ),
    vigm1b = list(
      D = no_yes_3
    ),
    vigm2 = list(
      D = no_yes_equal_to_oth_children_7
    ),
    vigm2b = list(
      D = no_yes_3
    ),
    vigm3 = list(
      D = no_yes_equal_to_oth_children_7
    ),
    vigm3b = list(
      D = no_yes_3
    ),
    vigm4 = list(
      D = no_yes_equal_to_oth_children
    ),
    vigm4b = list(
      D = no_yes_3
    ),
    vigm5 = list(
      D = no_yes_equal_to_oth_children
    ),
    vigm5b = list(
      D = no_yes_3
    ),
    vigs1 = list(
      D = no_yes_equal_to_oth_children_3
    ),
    vigs1b = list(
      D = no_yes_3
    ),
    vigs2 = list(
      D = c(
        `-5` = "NA:S1 corrected2yes",
        `-4` = "NA:equal to oth ch'n",
        `-3` = "NA:no@dvigS1",
        `-2` = "do not know",
        `-1` = "no answer",
        `1` = "no",
        `2` = "yes",
        `3` = "equal to oth children"
      )
    ),
    vigs2b = list(
      D = no_yes_3
    ),
    vigs4 = list(
      D = no_yes_equal_to_oth_children
    ),
    vigs4b = list(
      D = no_yes_3
    ),
    vigs5 = list(
      D = no_yes_equal_to_oth_children
    ),
    vigs5b = list(
      D = no_yes_3
    ),
    vigseq = list(
      D = c(
        `0` = "MSEJ (not random)",
        `1234` = "MSEJ (random)",
        `1243` = "MSJE",
        `1324` = "MESJ",
        `1342` = "MEJS",
        `1423` = "MJSE",
        `1432` = "MJES",
        `2134` = "SMEJ",
        `2143` = "SMJE",
        `2314` = "SEMJ",
        `2341` = "SEJM",
        `2413` = "SJME",
        `2431` = "SJEM",
        `3124` = "EMSJ",
        `3142` = "EMJS",
        `3214` = "ESMJ",
        `3241` = "ESJM",
        `3412` = "EJMS",
        `3421` = "EJSM",
        `4123` = "JMSE",
        `4132` = "JMES",
        `4213` = "JSME",
        `4231` = "JSEM",
        `4312` = "JEMS",
        `4321` = "JESM"
      )
    ),
    vigseq1 = list(
      D = mary_sophia_emily_john
    ),
    vigseq2 = list(
      D = mary_sophia_emily_john
    ),
    vigseq3 = list(
      D = mary_sophia_emily_john
    ),
    vigseq4 = list(
      D = mary_sophia_emily_john
    )
  ),

  value_labels_harmonized = list(
    vige1 = no_yes_equal_to_oth_children_4,
    vige1b = no_yes_3,
    vige2 = no_yes_equal_to_oth_children_8,
    vige2b = no_yes_3,
    vige3 = no_yes_equal_to_oth_children_8,
    vige3b = no_yes_3,
    vige4 = no_yes_equal_to_oth_children_2,
    vige4b = no_yes_3,
    vige5 = no_yes_equal_to_oth_children_2,
    vige5b = no_yes_3,
    vigeqc = none_equal_2_children_equal_estimate_2_pairs_equal,
    vigeqej = not_equal_equal,
    vigeqme = not_equal_equal,
    vigeqmj = not_equal_equal,
    vigeqms = not_equal_equal,
    vigeqp = none_equal_1pair_2child_equal_3pairs_3child_equal,
    vigeqse = not_equal_equal,
    vigeqsj = not_equal_equal,
    vigj1 = no_yes_equal_to_oth_children_4,
    vigj1b = no_yes_3,
    vigj2 = no_yes_equal_to_oth_children_9,
    vigj2b = no_yes_3,
    vigj3 = no_yes_equal_to_oth_children_9,
    vigj3b = no_yes_3,
    vigj4 = no_yes_equal_to_oth_children_2,
    vigj4b = no_yes_3,
    vigj5 = no_yes_equal_to_oth_children_2,
    vigj5b = no_yes_3,
    vigm1 = no_yes_equal_to_oth_children_4,
    vigm1b = no_yes_3,
    vigm2 = no_yes_equal_to_oth_children_10,
    vigm2b = no_yes_3,
    vigm3 = no_yes_equal_to_oth_children_10,
    vigm3b = no_yes_3,
    vigm4 = no_yes_equal_to_oth_children_2,
    vigm4b = no_yes_3,
    vigm5 = no_yes_equal_to_oth_children_2,
    vigm5b = no_yes_3,
    vigs1 = no_yes_equal_to_oth_children_4,
    vigs1b = no_yes_3,
    vigs2 = c(
      `-5` = "not available,s1 corrected2yes",
      `-4` = "not available,equal to oth ch'n",
      `-3` = "not available,no@dvigs1",
      `-2` = "don't know",
      `-1` = "no answer",
      `1` = "no",
      `2` = "yes",
      `3` = "equal to oth children"
    ),
    vigs2b = no_yes_3,
    vigs4 = no_yes_equal_to_oth_children_2,
    vigs4b = no_yes_3,
    vigs5 = no_yes_equal_to_oth_children_2,
    vigs5b = no_yes_3,
    vigseq = c(
      `0` = "msej (not random)",
      `1234` = "msej (random)",
      `1243` = "msje",
      `1324` = "mesj",
      `1342` = "mejs",
      `1423` = "mjse",
      `1432` = "mjes",
      `2134` = "smej",
      `2143` = "smje",
      `2314` = "semj",
      `2341` = "sejm",
      `2413` = "sjme",
      `2431` = "sjem",
      `3124` = "emsj",
      `3142` = "emjs",
      `3214` = "esmj",
      `3241` = "esjm",
      `3412` = "ejms",
      `3421` = "ejsm",
      `4123` = "jmse",
      `4132` = "jmes",
      `4213` = "jsme",
      `4231` = "jsem",
      `4312` = "jems",
      `4321` = "jesm"
    ),
    vigseq1 = mary_sophia_emily_john_2,
    vigseq2 = mary_sophia_emily_john_2,
    vigseq3 = mary_sophia_emily_john_2,
    vigseq4 = mary_sophia_emily_john_2
  )
)
