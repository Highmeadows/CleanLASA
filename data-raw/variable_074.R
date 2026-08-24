## LASA filecode 074 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  vige1 = "Emily: care",
  vige1b = "Emily: care (condensed)",
  vige2 = "Emily: change home situation",
  vige2b = "Emily: change home situation (condensed)",
  vige3 = "Emily: change employment situation",
  vige3b = "Emily: change employment sit (condensed)",
  vige4 = "Emily: improve frequency visits",
  vige4b = "Emily: improve freq visits (condensed)",
  vige5 = "Emily: disappointed",
  vige5b = "Emily: disappointed (condensed)",
  vigeqc = "number of equal children (out of 4)",
  vigeqej = "Emily & John equal",
  vigeqme = "Mary & Emily equal",
  vigeqmj = "Mary & John equal",
  vigeqms = "Mary & Sophia equal",
  vigeqp = "number of equal pairs (out of 6)",
  vigeqr = "equality vignettes: routing Q's",
  vigeqse = "Sophia & Emily equal",
  vigeqsj = "Sophia & John equal",
  vigj1 = "John: care",
  vigj1b = "John: care (condensed)",
  vigj2 = "John: change home situation",
  vigj2b = "John: change home situation (condensed)",
  vigj3 = "John: change employment situation",
  vigj3b = "John: change employment sit (condensed)",
  vigj4 = "John: improve frequency visits",
  vigj4b = "John: improve freq visits (condensed)",
  vigj5 = "John: disappointed",
  vigj5b = "John: disappointed (condensed)",
  vigm1 = "Mary: care",
  vigm1b = "Mary: care (condensed)",
  vigm2 = "Mary: change home situation",
  vigm2b = "Mary: change home situation (condensed)",
  vigm3 = "Mary: change employment situation",
  vigm3b = "Mary: change employment sit (condensed)",
  vigm4 = "Mary: improve frequency visits",
  vigm4b = "Mary: improve freq visits (condensed)",
  vigm5 = "Mary: disappointed",
  vigm5b = "Mary: disappointed (condensed)",
  vigs1 = "Sophia: care",
  vigs1b = "Sophia: care (condensed)",
  vigs2 = "Sophia: change home situation",
  vigs2b = "Sophia: change home sit (condensed)",
  vigs4 = "Sophia: improve frequency visits",
  vigs4b = "Sophia: improve freq visits (condensed)",
  vigs5 = "Sophia: disappointed",
  vigs5b = "Sophia: disappointed (condensed)",
  vigseq = "sequence Mary Sophia Emily John",
  vigseq1 = "1st vignette on M-S-E-J",
  vigseq2 = "2nd vignette on M-S-E-J",
  vigseq3 = "3rd vignette on M-S-E-J",
  vigseq4 = "4th vignette on M-S-E-J"
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

standardized_value_labels <- list(
  vige1 = c(
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vige1b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vige2 = c(
    `-5` = "not available,e1 corrected2yes",
    `-4` = "not available,equal to oth ch'n",
    `-3` = "not available,no@dvige1",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vige2b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vige3 = c(
    `-5` = "not available,e1 corrected2yes",
    `-4` = "not available,equal to oth ch'n",
    `-3` = "not available,no@dvige1",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vige3b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vige4 = c(
    `-4` = "not available,equal to oth ch'n",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vige4b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vige5 = c(
    `-4` = "not available,equal to oth ch'n",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vige5b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigeqc = c(
    `0` = "none equal",
    `2` = "2 children equal",
    `2.8` = "estimate (2 pairs equal)",
    `3` = "3 children equal",
    `3.3` = "estimate (4 pairs equal)",
    `4` = "all children equal"
  ),
  vigeqej = c(`0` = "not equal", `1` = "equal"),
  vigeqme = c(`0` = "not equal", `1` = "equal"),
  vigeqmj = c(`0` = "not equal", `1` = "equal"),
  vigeqms = c(`0` = "not equal", `1` = "equal"),
  vigeqp = c(
    `0` = "none equal",
    `1` = "1pair=2child equal",
    `3` = "3pairs=3child equal",
    `6` = "all equal"
  ),
  vigeqr = stats::setNames(character(0), character(0)),
  vigeqse = c(`0` = "not equal", `1` = "equal"),
  vigeqsj = c(`0` = "not equal", `1` = "equal"),
  vigj1 = c(
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigj1b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigj2 = c(
    `-5` = "not available,j1 corrected2yes",
    `-4` = "not available,equal to oth ch'n",
    `-3` = "not available,no@dvigj1",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigj2b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigj3 = c(
    `-5` = "not available,j1 corrected2yes",
    `-4` = "not available,equal to oth ch'n",
    `-3` = "not available,no@dvigj1",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigj3b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigj4 = c(
    `-4` = "not available,equal to oth ch'n",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigj4b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigj5 = c(
    `-4` = "not available,equal to oth ch'n",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigj5b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigm1 = c(
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigm1b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigm2 = c(
    `-5` = "not available,m1 corrected2yes",
    `-4` = "not available,equal to oth ch'n",
    `-3` = "not available,no@dvigm1",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigm2b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigm3 = c(
    `-5` = "not available,m1 corrected2yes",
    `-4` = "not available,equal to oth ch'n",
    `-3` = "not available,no@dvigm1",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigm3b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigm4 = c(
    `-4` = "not available,equal to oth ch'n",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigm4b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigm5 = c(
    `-4` = "not available,equal to oth ch'n",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigm5b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigs1 = c(
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigs1b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
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
  vigs2b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigs4 = c(
    `-4` = "not available,equal to oth ch'n",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigs4b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
  vigs5 = c(
    `-4` = "not available,equal to oth ch'n",
    `-2` = "don't know",
    `-1` = "no answer",
    `1` = "no",
    `2` = "yes",
    `3` = "equal to oth children"
  ),
  vigs5b = c(`-1` = "no answer", `1` = "no", `2` = "yes"),
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
  vigseq1 = c(`1` = "mary", `2` = "sophia", `3` = "emily", `4` = "john"),
  vigseq2 = c(`1` = "mary", `2` = "sophia", `3` = "emily", `4` = "john"),
  vigseq3 = c(`1` = "mary", `2` = "sophia", `3` = "emily", `4` = "john"),
  vigseq4 = c(`1` = "mary", `2` = "sophia", `3` = "emily", `4` = "john")
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels[c(
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
  )],
    vige1 = .replace_labels(
    standardized_value_labels$vige1,
    `-2` = "do not know"
  ),
    vige2 = .replace_labels(
    standardized_value_labels$vige2,
    `-5` = "NA:E1 corrected2yes",
    `-4` = "NA:equal to oth ch'n",
    `-3` = "NA:no@dvigE1",
    `-2` = "do not know"
  ),
    vige3 = .replace_labels(
    standardized_value_labels$vige3,
    `-5` = "NA:E1 corrected2yes",
    `-4` = "NA:equal to oth ch'n",
    `-3` = "NA:no@dvigE1",
    `-2` = "do not know"
  ),
    vige4 = .replace_labels(
    standardized_value_labels$vige4,
    `-4` = "NA:equal to oth ch'n",
    `-2` = "do not know"
  ),
    vige5 = .replace_labels(
    standardized_value_labels$vige5,
    `-4` = "NA:equal to oth ch'n",
    `-2` = "do not know"
  ),
    vigj1 = .replace_labels(
    standardized_value_labels$vigj1,
    `-2` = "do not know"
  ),
    vigj2 = .replace_labels(
    standardized_value_labels$vigj2,
    `-5` = "NA:J1 corrected2yes",
    `-4` = "NA:equal to oth ch'n",
    `-3` = "NA:no@dvigJ1",
    `-2` = "do not know"
  ),
    vigj3 = .replace_labels(
    standardized_value_labels$vigj3,
    `-5` = "NA:J1 corrected2yes",
    `-4` = "NA:equal to oth ch'n",
    `-3` = "NA:no@dvigJ1",
    `-2` = "do not know"
  ),
    vigj4 = .replace_labels(
    standardized_value_labels$vigj4,
    `-4` = "NA:equal to oth ch'n",
    `-2` = "do not know"
  ),
    vigj5 = .replace_labels(
    standardized_value_labels$vigj5,
    `-4` = "NA:equal to oth ch'n",
    `-2` = "do not know"
  ),
    vigm1 = .replace_labels(
    standardized_value_labels$vigm1,
    `-2` = "do not know"
  ),
    vigm2 = .replace_labels(
    standardized_value_labels$vigm2,
    `-5` = "NA:M1 corrected2yes",
    `-4` = "NA:equal to oth ch'n",
    `-3` = "NA:no@dvigM1",
    `-2` = "do not know"
  ),
    vigm3 = .replace_labels(
    standardized_value_labels$vigm3,
    `-5` = "NA:M1 corrected2yes",
    `-4` = "NA:equal to oth ch'n",
    `-3` = "NA:no@dvigM1",
    `-2` = "do not know"
  ),
    vigm4 = .replace_labels(
    standardized_value_labels$vigm4,
    `-4` = "NA:equal to oth ch'n",
    `-2` = "do not know"
  ),
    vigm5 = .replace_labels(
    standardized_value_labels$vigm5,
    `-4` = "NA:equal to oth ch'n",
    `-2` = "do not know"
  ),
    vigs1 = .replace_labels(
    standardized_value_labels$vigs1,
    `-2` = "do not know"
  ),
    vigs2 = .replace_labels(
    standardized_value_labels$vigs2,
    `-5` = "NA:S1 corrected2yes",
    `-4` = "NA:equal to oth ch'n",
    `-3` = "NA:no@dvigS1",
    `-2` = "do not know"
  ),
    vigs4 = .replace_labels(
    standardized_value_labels$vigs4,
    `-4` = "NA:equal to oth ch'n",
    `-2` = "do not know"
  ),
    vigs5 = .replace_labels(
    standardized_value_labels$vigs5,
    `-4` = "NA:equal to oth ch'n",
    `-2` = "do not know"
  ),
    vigseq = .replace_labels(
    standardized_value_labels$vigseq,
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
  ),
    vigseq1 = .replace_labels(
    standardized_value_labels$vigseq1,
    `1` = "Mary",
    `2` = "Sophia",
    `3` = "Emily",
    `4` = "John"
  ),
    vigseq2 = .replace_labels(
    standardized_value_labels$vigseq2,
    `1` = "Mary",
    `2` = "Sophia",
    `3` = "Emily",
    `4` = "John"
  ),
    vigseq3 = .replace_labels(
    standardized_value_labels$vigseq3,
    `1` = "Mary",
    `2` = "Sophia",
    `3` = "Emily",
    `4` = "John"
  ),
    vigseq4 = .replace_labels(
    standardized_value_labels$vigseq4,
    `1` = "Mary",
    `2` = "Sophia",
    `3` = "Emily",
    `4` = "John"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  vige1 = "categorical",
  vige1b = "categorical",
  vige2 = "categorical",
  vige2b = "categorical",
  vige3 = "categorical",
  vige3b = "categorical",
  vige4 = "categorical",
  vige4b = "categorical",
  vige5 = "categorical",
  vige5b = "categorical",
  vigeqc = "numeric",
  vigeqej = "categorical",
  vigeqme = "categorical",
  vigeqmj = "categorical",
  vigeqms = "categorical",
  vigeqp = "numeric",
  vigeqr = "text",
  vigeqse = "categorical",
  vigeqsj = "categorical",
  vigj1 = "categorical",
  vigj1b = "categorical",
  vigj2 = "categorical",
  vigj2b = "categorical",
  vigj3 = "categorical",
  vigj3b = "categorical",
  vigj4 = "categorical",
  vigj4b = "categorical",
  vigj5 = "categorical",
  vigj5b = "categorical",
  vigm1 = "categorical",
  vigm1b = "categorical",
  vigm2 = "categorical",
  vigm2b = "categorical",
  vigm3 = "categorical",
  vigm3b = "categorical",
  vigm4 = "categorical",
  vigm4b = "categorical",
  vigm5 = "categorical",
  vigm5b = "categorical",
  vigs1 = "categorical",
  vigs1b = "categorical",
  vigs2 = "categorical",
  vigs2b = "categorical",
  vigs4 = "categorical",
  vigs4b = "categorical",
  vigs5 = "categorical",
  vigs5b = "categorical",
  vigseq = "categorical",
  vigseq1 = "categorical",
  vigseq2 = "categorical",
  vigseq3 = "categorical",
  vigseq4 = "categorical"
)

.lasa_fc_074 <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "074", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "074", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "074", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "074", waves = .lasa_wave_rows())
)
