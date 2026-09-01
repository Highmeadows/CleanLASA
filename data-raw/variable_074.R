## LASA filecode 074 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  vigseq4 = "4th vignette on M-S-E-J",
  .applies_to_waves = c("Z")
)

variable_labels(
  "vige1", "vige1b", "vige2", "vige2b", "vige3", "vige3b", "vige4", "vige4b", "vige5", "vige5b", "vigeqc", "vigeqej", "vigeqme", "vigeqmj", "vigeqms", "vigeqp", "vigeqr", "vigeqse", "vigeqsj", "vigj1", "vigj1b", "vigj2", "vigj2b", "vigj3", "vigj3b", "vigj4", "vigj4b", "vigj5", "vigj5b", "vigm1", "vigm1b", "vigm2", "vigm2b", "vigm3", "vigm3b", "vigm4", "vigm4b", "vigm5", "vigm5b", "vigs1", "vigs1b", "vigs2", "vigs2b", "vigs4", "vigs4b", "vigs5", "vigs5b", "vigseq", "vigseq1", "vigseq2", "vigseq3", "vigseq4",
  .applies_to_waves = c("D")
)

# define value labels ----
value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("vige1", "vige1b", "vige2", "vige2b", "vige3", "vige3b", "vige4", "vige4b", "vige5", "vige5b", "vigj1", "vigj1b", "vigj2", "vigj2b", "vigj3", "vigj3b", "vigj4", "vigj4b", "vigj5", "vigj5b", "vigm1", "vigm1b", "vigm2", "vigm2b", "vigm3", "vigm3b", "vigm4", "vigm4b", "vigm5", "vigm5b", "vigs1", "vigs1b", "vigs2", "vigs2b", "vigs4", "vigs4b", "vigs5", "vigs5b"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-2` = "don't know",
  .applies_to_vars = c("vige1", "vige2", "vige3", "vige4", "vige5", "vigj1", "vigj2", "vigj3", "vigj4", "vigj5", "vigm1", "vigm2", "vigm3", "vigm4", "vigm5", "vigs1", "vigs2", "vigs4", "vigs5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-4` = "not available,equal to oth ch'n",
  .applies_to_vars = c("vige2", "vige3", "vige4", "vige5", "vigj2", "vigj3", "vigj4", "vigj5", "vigm2", "vigm3", "vigm4", "vigm5", "vigs2", "vigs4", "vigs5"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "no", `2` = "yes", `3` = "equal to oth children",
  .applies_to_vars = c("vige1", "vige4", "vige5", "vigj1", "vigj4", "vigj5", "vigm1", "vigm4", "vigm5", "vigs1", "vigs4", "vigs5"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("vige1b", "vige2b", "vige3b", "vige4b", "vige5b", "vigj1b", "vigj2b", "vigj3b", "vigj4b", "vigj5b", "vigm1b", "vigm2b", "vigm3b", "vigm4b", "vigm5b", "vigs1b", "vigs2b", "vigs4b", "vigs5b"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-5` = "not available,e1 corrected2yes", `-3` = "not available,no@dvige1", `1` = "no", `2` = "yes", `3` = "equal to oth children",
  .applies_to_vars = c("vige2", "vige3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "none equal", `2` = "2 children equal", `2.8` = "estimate (2 pairs equal)", `3` = "3 children equal", `3.3` = "estimate (4 pairs equal)", `4` = "all children equal",
  .applies_to_vars = c("vigeqc"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `0` = "not equal", `1` = "equal",
  .applies_to_vars = c("vigeqej", "vigeqme", "vigeqmj", "vigeqms", "vigeqse", "vigeqsj"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `0` = "none equal", `1` = "1pair=2child equal", `3` = "3pairs=3child equal", `6` = "all equal",
  .applies_to_vars = c("vigeqp"),
  .applies_to_waves = c("Z", "D")
)

value_labels(
  `-5` = "not available,j1 corrected2yes", `-3` = "not available,no@dvigj1", `1` = "no", `2` = "yes", `3` = "equal to oth children",
  .applies_to_vars = c("vigj2", "vigj3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available,m1 corrected2yes", `-3` = "not available,no@dvigm1", `1` = "no", `2` = "yes", `3` = "equal to oth children",
  .applies_to_vars = c("vigm2", "vigm3"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-5` = "not available,s1 corrected2yes", `-3` = "not available,no@dvigs1", `1` = "no", `2` = "yes", `3` = "equal to oth children",
  .applies_to_vars = c("vigs2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "msej (not random)", `1234` = "msej (random)", `1243` = "msje", `1324` = "mesj", `1342` = "mejs", `1423` = "mjse", `1432` = "mjes", `2134` = "smej", `2143` = "smje", `2314` = "semj", `2341` = "sejm", `2413` = "sjme", `2431` = "sjem", `3124` = "emsj", `3142` = "emjs", `3214` = "esmj", `3241` = "esjm", `3412` = "ejms", `3421` = "ejsm", `4123` = "jmse", `4132` = "jmes", `4213` = "jsme", `4231` = "jsem", `4312` = "jems", `4321` = "jesm",
  .applies_to_vars = c("vigseq"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "mary", `2` = "sophia", `3` = "emily", `4` = "john",
  .applies_to_vars = c("vigseq1", "vigseq2", "vigseq3", "vigseq4"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "do not know",
  .applies_to_vars = c("vige1", "vige2", "vige3", "vige4", "vige5", "vigj1", "vigj2", "vigj3", "vigj4", "vigj5", "vigm1", "vigm2", "vigm3", "vigm4", "vigm5", "vigs1", "vigs2", "vigs4", "vigs5"),
  .applies_to_waves = c("D")
)

value_labels(
  `-4` = "NA:equal to oth ch'n",
  .applies_to_vars = c("vige2", "vige3", "vige4", "vige5", "vigj2", "vigj3", "vigj4", "vigj5", "vigm2", "vigm3", "vigm4", "vigm5", "vigs2", "vigs4", "vigs5"),
  .applies_to_waves = c("D")
)

value_labels(
  `-5` = "NA:E1 corrected2yes", `-3` = "NA:no@dvigE1", `1` = "no", `2` = "yes", `3` = "equal to oth children",
  .applies_to_vars = c("vige2", "vige3"),
  .applies_to_waves = c("D")
)

value_labels(
  `-5` = "NA:J1 corrected2yes", `-3` = "NA:no@dvigJ1", `1` = "no", `2` = "yes", `3` = "equal to oth children",
  .applies_to_vars = c("vigj2", "vigj3"),
  .applies_to_waves = c("D")
)

value_labels(
  `-5` = "NA:M1 corrected2yes", `-3` = "NA:no@dvigM1", `1` = "no", `2` = "yes", `3` = "equal to oth children",
  .applies_to_vars = c("vigm2", "vigm3"),
  .applies_to_waves = c("D")
)

value_labels(
  `-5` = "NA:S1 corrected2yes", `-3` = "NA:no@dvigS1", `1` = "no", `2` = "yes", `3` = "equal to oth children",
  .applies_to_vars = c("vigs2"),
  .applies_to_waves = c("D")
)

value_labels(
  `0` = "MSEJ (not random)", `1234` = "MSEJ (random)", `1243` = "MSJE", `1324` = "MESJ", `1342` = "MEJS", `1423` = "MJSE", `1432` = "MJES", `2134` = "SMEJ", `2143` = "SMJE", `2314` = "SEMJ", `2341` = "SEJM", `2413` = "SJME", `2431` = "SJEM", `3124` = "EMSJ", `3142` = "EMJS", `3214` = "ESMJ", `3241` = "ESJM", `3412` = "EJMS", `3421` = "EJSM", `4123` = "JMSE", `4132` = "JMES", `4213` = "JSME", `4231` = "JSEM", `4312` = "JEMS", `4321` = "JESM",
  .applies_to_vars = c("vigseq"),
  .applies_to_waves = c("D")
)

value_labels(
  `1` = "Mary", `2` = "Sophia", `3` = "Emily", `4` = "John",
  .applies_to_vars = c("vigseq1", "vigseq2", "vigseq3", "vigseq4"),
  .applies_to_waves = c("D")
)

.lasa_fc_074 <- .lasa_finalize_fc("074")

