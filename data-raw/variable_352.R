## LASA filecode 352 -- variable names, variable labels, value labels,
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

# define variable labels ----
variable_labels(
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
  mtypoth = "other medication (unreadable/uncodable)",
  .applies_to_waves = c("Z")
)

variable_labels(
  "mandiab", "mbenanx", "mbenhyp", "med_ali", "med_ang", "med_ari", "med_diu", "med_hyp", "med_ino", "med_pvd", "mmedad", "mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth",
  .applies_to_waves = c("B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

variable_labels(
  "mandia1", "mandia2",
  .applies_to_waves = c("G", "H", "3B", "MB", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-2` = "na, see MMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("mandia1", "mandia2"),
  .applies_to_waves = c("Z", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `0` = "no", `1` = "yes",
  .applies_to_vars = c("mandiab", "mbenanx", "mbenhyp", "med_ali", "med_ang", "med_ari", "med_diu", "med_hyp", "med_ino", "med_pvd", "mmedad"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `0` = "none",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("Z", "B", "C", "D", "E", "2B", "F", "G", "H", "3B", "MB", "I", "J", "K")
)

value_labels(
  `-2` = "na, see BMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("B", "2B", "3B", "MB")
)

value_labels(
  `-2` = "na, see CMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("C")
)

value_labels(
  `-2` = "na, see DMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("D")
)

value_labels(
  `-2` = "na, see EMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("E")
)

value_labels(
  `-2` = "na, see FMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see GMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see HMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see IMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see JMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KMMEDUSE",
  .applies_to_vars = c("mtype_a", "mtype_b", "mtype_c", "mtype_d", "mtype_g", "mtype_h", "mtype_j", "mtype_l", "mtype_m", "mtype_n", "mtype_p", "mtype_r", "mtype_s", "mtype_v", "mtyphom", "mtypoth"),
  .applies_to_waves = c("K")
)

.lasa_fc_352 <- .lasa_finalize_fc("352")

