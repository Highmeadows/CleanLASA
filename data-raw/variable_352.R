## LASA filecode 352 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  mandia1 = "use of antidiabetics: insulines",
  mandia2 = "use of antidiabetics: oral",
  mandiab = "use of antidiabetics",
  mbenanx = "use of anxiolytics (benzodiazepines)",
  mbenhyp = "use of hypnotics (benzodiazepines)",
  med_ali = "use of antilipaemics",
  med_ang = "use of nitrogens",
  med_ari = "use of antiarrhythmics",
  med_diu = "use of diuretics",
  med_hyp = "use of antihypertensives",
  med_ino = "use of inotropics",
  med_pvd = "use of peripheral vasodilators",
  mmedad = "use of antidepressants",
  mtype_a = "intestinal tract & metabolism",
  mtype_b = "hematopoietic drugs",
  mtype_c = "cardiovascular system",
  mtype_d = "dermatologica",
  mtype_g = "urogenital system & sex hormones",
  mtype_h = "systemic hormone preparations excl. sex hormones",
  mtype_j = "systemic antimicrobial drugs",
  mtype_l = "oncologic and immuno suppressors drugs",
  mtype_m = "musculoskeletical system",
  mtype_n = "central nervous system",
  mtype_p = "antiparasitic drugs",
  mtype_r = "respiratory system",
  mtype_s = "sense-organs",
  mtype_v = "miscellaneous",
  mtyphom = "homeopathic medication",
  mtypoth = "other medication (unreadable/uncodable)"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `C` = c(
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `D` = c(
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `E` = c(
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `2B` = c(
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `F` = c(
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `G` = c(
    "mandia1",
    "mandia2",
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `H` = c(
    "mandia1",
    "mandia2",
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `3B` = c(
    "mandia1",
    "mandia2",
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `MB` = c(
    "mandia1",
    "mandia2",
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `I` = c(
    "mandia1",
    "mandia2",
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `J` = c(
    "mandia1",
    "mandia2",
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  ),
  `K` = c(
    "mandia1",
    "mandia2",
    "mandiab",
    "mbenanx",
    "mbenhyp",
    "med_ali",
    "med_ang",
    "med_ari",
    "med_diu",
    "med_hyp",
    "med_ino",
    "med_pvd",
    "mmedad",
    "mtype_a",
    "mtype_b",
    "mtype_c",
    "mtype_d",
    "mtype_g",
    "mtype_h",
    "mtype_j",
    "mtype_l",
    "mtype_m",
    "mtype_n",
    "mtype_p",
    "mtype_r",
    "mtype_s",
    "mtype_v",
    "mtyphom",
    "mtypoth"
  )
)

variable_labels_list <- list(
  Wave_B_labels = harmonized_labels,
  Wave_C_labels = harmonized_labels,
  Wave_D_labels = harmonized_labels,
  Wave_E_labels = harmonized_labels,
  Wave_2B_labels = harmonized_labels,
  Wave_F_labels = harmonized_labels,
  Wave_G_labels = harmonized_labels,
  Wave_H_labels = harmonized_labels,
  Wave_3B_labels = harmonized_labels,
  Wave_MB_labels = harmonized_labels,
  Wave_I_labels = harmonized_labels,
  Wave_J_labels = harmonized_labels,
  Wave_K_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "yes"
)

standardized_value_labels <- list(
  mandia1 = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mandia2 = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mandiab = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mbenanx = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mbenhyp = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  med_ali = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  med_ang = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  med_ari = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  med_diu = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  med_hyp = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  med_ino = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  med_pvd = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mmedad = c(
    `0` = "no",
    default_answer_labels[c("1")]
  ),
  mtype_a = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_b = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_c = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_d = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_g = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_h = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_j = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_l = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_m = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_n = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_p = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_r = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_s = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtype_v = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtyphom = c(`-2` = "na, see MMEDUSE", `0` = "none"),
  mtypoth = c(`-2` = "na, see MMEDUSE", `0` = "none")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see BMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see BMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see BMMEDUSE"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see CMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see CMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see CMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see CMMEDUSE"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see DMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see DMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see DMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see DMMEDUSE"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see EMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see EMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see EMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see EMMEDUSE"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see BMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see BMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see BMMEDUSE"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see FMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see FMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see FMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see FMMEDUSE"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see GMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see GMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see GMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see GMMEDUSE"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see HMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see HMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see HMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see HMMEDUSE"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see BMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see BMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see BMMEDUSE"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see BMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see BMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see BMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see BMMEDUSE"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see IMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see IMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see IMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see IMMEDUSE"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see JMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see JMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see JMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see JMMEDUSE"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    mtype_a = .replace_labels(
    standardized_value_labels$mtype_a,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_b = .replace_labels(
    standardized_value_labels$mtype_b,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_c = .replace_labels(
    standardized_value_labels$mtype_c,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_d = .replace_labels(
    standardized_value_labels$mtype_d,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_g = .replace_labels(
    standardized_value_labels$mtype_g,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_h = .replace_labels(
    standardized_value_labels$mtype_h,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_j = .replace_labels(
    standardized_value_labels$mtype_j,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_l = .replace_labels(
    standardized_value_labels$mtype_l,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_m = .replace_labels(
    standardized_value_labels$mtype_m,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_n = .replace_labels(
    standardized_value_labels$mtype_n,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_p = .replace_labels(
    standardized_value_labels$mtype_p,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_r = .replace_labels(
    standardized_value_labels$mtype_r,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_s = .replace_labels(
    standardized_value_labels$mtype_s,
    `-2` = "na, see KMMEDUSE"
  ),
    mtype_v = .replace_labels(
    standardized_value_labels$mtype_v,
    `-2` = "na, see KMMEDUSE"
  ),
    mtyphom = .replace_labels(
    standardized_value_labels$mtyphom,
    `-2` = "na, see KMMEDUSE"
  ),
    mtypoth = .replace_labels(
    standardized_value_labels$mtypoth,
    `-2` = "na, see KMMEDUSE"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  mandia1 = "categorical",
  mandia2 = "categorical",
  mandiab = "categorical",
  mbenanx = "categorical",
  mbenhyp = "categorical",
  med_ali = "categorical",
  med_ang = "categorical",
  med_ari = "categorical",
  med_diu = "categorical",
  med_hyp = "categorical",
  med_ino = "categorical",
  med_pvd = "categorical",
  mmedad = "categorical",
  mtype_a = "numeric",
  mtype_b = "numeric",
  mtype_c = "numeric",
  mtype_d = "numeric",
  mtype_g = "numeric",
  mtype_h = "numeric",
  mtype_j = "numeric",
  mtype_l = "numeric",
  mtype_m = "numeric",
  mtype_n = "numeric",
  mtype_p = "numeric",
  mtype_r = "numeric",
  mtype_s = "numeric",
  mtype_v = "numeric",
  mtyphom = "numeric",
  mtypoth = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "352", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "352", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "352", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "352", waves = .lasa_wave_rows())
)

.lasa_fc_352 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

