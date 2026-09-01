## LASA filecode 873 -- variable names, variable labels, value labels,
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
  b_hap = "categorical",
  b_hap1 = "categorical",
  b_hap2 = "categorical",
  b_hap3 = "categorical",
  b_hap4 = "categorical",
  b_hap5 = "categorical",
  bat_hap = "categorical",
  bat_hap1 = "categorical",
  bat_hap2 = "categorical",
  bat_hap3 = "categorical",
  bat_hap4 = "categorical",
  ea1_hap = "categorical",
  ea2_hap = "categorical",
  ea3_hap = "categorical",
  ea_hap = "categorical",
  grhap1 = "categorical",
  grhap2 = "categorical",
  grhap3 = "categorical",
  grhap4 = "categorical",
  grhap5 = "categorical",
  grhap6 = "categorical",
  grhap_a = "categorical",
  grhap_b = "categorical",
  u1_hap = "categorical",
  u2_hap = "categorical",
  u3_hap = "categorical",
  u4_hap = "categorical",
  u_haplo = "categorical"
)

# define variable labels ----
variable_labels(
  b_hap = "b_hap genotype by frequency",
  b_hap1 = "CGCA genotype of VDR block 3",
  b_hap2 = "CGCC genotype of VDR block 3",
  b_hap3 = "CGCC genotype of VDR block 3",
  b_hap4 = "CATC genotype of VDR block 3",
  b_hap5 = "AGCC genotype of VDR block 3",
  bat_hap = "Bsm-Apa-Taq haplotype genotype",
  bat_hap1 = "Bsm-Apa-Taq haplotype 1 genotype (GGT-baT)",
  bat_hap2 = "Bsm-Apa-Taq haplotype 2 genotype (ATC-BAt)",
  bat_hap3 = "Bsm-Apa-Taq haplotype 3 genotype (GTT-bAT)",
  bat_hap4 = "Bsm-Apa-Taq haplotype 4 genotype (ATT-BAT)",
  ea1_hap = "Haplotype allele 1 of block 2",
  ea2_hap = "Haplotype allele 2 of block 2",
  ea3_hap = "Haplotype allele 3 of block 2",
  ea_hap = "Haplotype of block 2",
  grhap1 = "GR haplotype allele 1",
  grhap2 = "GR haplotype allele 2",
  grhap3 = "GR haplotype allele 3",
  grhap4 = "GR haplotype allele 4",
  grhap5 = "GR haplotype allele 5",
  grhap6 = "GR haplotype allele 6",
  grhap_a = "GR haplotype allele a",
  grhap_b = "GR haplotype allele b",
  u1_hap = "Haplotype allele 1 of block 5",
  u2_hap = "Haplotype allele 2 of block 5",
  u3_hap = "Haplotype allele 3 of block 5",
  u4_hap = "Haplotype allele 4 of block 5",
  u_haplo = "Haplotype of block 5 (recoded)",
  .applies_to_waves = c("Z")
)

variable_labels(
  b_hap = "b_hap genotype by freq.",
  b_hap1 = "b_hap1 (CGCA) genotype of VDR bl3",
  b_hap2 = "b_hap2 (CGCC) genotype of VDR bl3",
  b_hap3 = "b_hap2 (CGCC) genotype of VDR bl3",
  b_hap4 = "b_hap4 (CATC) genotype of VDR bl3",
  b_hap5 = "b_hap5 (AGCC) genotype of VDR bl3",
  bat_hap = "haplotype genotype of Bsm-Apa-Taq",
  bat_hap1 = "Genotype: hap1 of Bsm-Apa-Taq (GGT-baT)",
  bat_hap2 = "Genotype: hap2 of Bsm-Apa-Taq (ATC-BAt)",
  bat_hap3 = "Genotype: hap3 of Bsm-Apa-Taq (GTT-bAT)",
  bat_hap4 = "Genotype: hap4 of Bsm-Apa-Taq (ATT-BAT)",
  ea1_hap = "Haplotype allele1 of block2",
  ea2_hap = "Haplotype allele2 of block2",
  ea3_hap = "Haplotype allele3 of block2",
  ea_hap = "Haplotype of block2",
  grhap1 = "Haplotype allele 1 GR",
  grhap2 = "Haplotype allele 2 GR",
  grhap3 = "Haplotype allele 3 GR",
  grhap4 = "Haplotype allele 4 GR",
  grhap5 = "Haplotype allele 5 GR",
  grhap6 = "Haplotype allele 6 GR",
  grhap_a = "Haplotype allele a GR",
  grhap_b = "Haplotype allele b GR",
  u1_hap = "Haplotype allele1 of block5",
  u2_hap = "Haplotype allele2 of block5",
  u3_hap = "Haplotype allele3 of block5",
  u4_hap = "Haplotype allele4 of block5",
  u_haplo = "Haplotype of block5 (recoded)",
  .applies_to_waves = c("C")
)

# define value labels ----
.lasa_fc_873 <- .lasa_finalize_fc("873")
.lasa_fc_873$variables <- .lasa_fc_873$variables |>
  .override_label(wave = "C", variable = "b_hap", override_value = "b_hap") |>
  .override_label(wave = "C", variable = "b_hap1", override_value = "b_hap1") |>
  .override_label(wave = "C", variable = "b_hap2", override_value = "b_hap2") |>
  .override_label(wave = "C", variable = "b_hap3", override_value = "b_hap3") |>
  .override_label(wave = "C", variable = "b_hap4", override_value = "b_hap4") |>
  .override_label(wave = "C", variable = "b_hap5", override_value = "b_hap5") |>
  .override_label(wave = "C", variable = "bat_hap", override_value = "bat_hap") |>
  .override_label(wave = "C", variable = "bat_hap1", override_value = "bat_hap1") |>
  .override_label(wave = "C", variable = "bat_hap2", override_value = "bat_hap2") |>
  .override_label(wave = "C", variable = "bat_hap3", override_value = "bat_hap3") |>
  .override_label(wave = "C", variable = "bat_hap4", override_value = "bat_hap4") |>
  .override_label(wave = "C", variable = "ea1_hap", override_value = "ea1_hap") |>
  .override_label(wave = "C", variable = "ea2_hap", override_value = "ea2_hap") |>
  .override_label(wave = "C", variable = "ea3_hap", override_value = "ea3_hap") |>
  .override_label(wave = "C", variable = "ea_hap", override_value = "ea_hap") |>
  .override_label(wave = "C", variable = "grhap1", override_value = "grhap1") |>
  .override_label(wave = "C", variable = "grhap2", override_value = "grhap2") |>
  .override_label(wave = "C", variable = "grhap3", override_value = "grhap3") |>
  .override_label(wave = "C", variable = "grhap4", override_value = "grhap4") |>
  .override_label(wave = "C", variable = "grhap5", override_value = "grhap5") |>
  .override_label(wave = "C", variable = "grhap6", override_value = "grhap6") |>
  .override_label(wave = "C", variable = "grhap_a", override_value = "grhap_a") |>
  .override_label(wave = "C", variable = "grhap_b", override_value = "grhap_b") |>
  .override_label(wave = "C", variable = "u1_hap", override_value = "u1_hap") |>
  .override_label(wave = "C", variable = "u2_hap", override_value = "u2_hap") |>
  .override_label(wave = "C", variable = "u3_hap", override_value = "u3_hap") |>
  .override_label(wave = "C", variable = "u4_hap", override_value = "u4_hap") |>
  .override_label(wave = "C", variable = "u_haplo", override_value = "u_haplo")

