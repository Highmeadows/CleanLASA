## LASA filecode 027 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  masmv = "Number of missing values in 5 mastery items",
  masmv7 = "Number of missing values in 7 mastery items",
  master1 = "Mastery item 01: control",
  master2 = "Mastery item 02: problems",
  master3 = "Mastery item 03: changes",
  master4 = "Mastery item 04: helpless",
  master5 = "Mastery item 05: life",
  master6 = "Mastery item 06: everything",
  master7 = "Mastery item 07: future",
  selfes1 = "I am satisfied with myself",
  selfes2 = "I am quite sure of myself",
  selfes3 = "I feel useless at times",
  selfes4 = "I look positive at myself",
  selfmv = "Number of missing values in self-esteem items"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `B` = c(
    "masmv",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "selfes1"
  ),
  `C` = c(
    "masmv",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `D` = c(
    "masmv",
    "masmv7",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "master6",
    "master7",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `E` = c(
    "masmv",
    "masmv7",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "master6",
    "master7",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `2B` = c(
    "masmv",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `F` = c(
    "masmv",
    "masmv7",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "master6",
    "master7",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `G` = c(
    "masmv",
    "masmv7",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "master6",
    "master7",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `H` = c(
    "masmv",
    "masmv7",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "master6",
    "master7",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `3B` = c(
    "masmv",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `MB` = c(
    "masmv",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5"
  ),
  `I` = c(
    "masmv",
    "masmv7",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "master6",
    "master7",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `J` = c(
    "masmv",
    "masmv7",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "master6",
    "master7",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  ),
  `K` = c(
    "masmv",
    "masmv7",
    "master1",
    "master2",
    "master3",
    "master4",
    "master5",
    "master6",
    "master7",
    "selfes1",
    "selfes2",
    "selfes3",
    "selfes4",
    "selfmv"
  )
)

variable_labels_list <- list(
  Wave_B_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items"
  ),
  Wave_C_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_D_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    masmv7 = "# missing values 7 mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_E_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    masmv7 = "# missing values 7 mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_2B_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_F_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    masmv7 = "# missing values 7 mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_G_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    masmv7 = "# missing values 7 mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_H_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    masmv7 = "# missing values 7 mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_3B_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_MB_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items"
  ),
  Wave_I_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    masmv7 = "# missing values 7 mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_J_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    masmv7 = "# missing values 7 mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Wave_K_labels = .replace_labels(
    harmonized_labels,
    masmv = "# missing values mastery items",
    masmv7 = "# missing values 7 mastery items",
    selfmv = "# missing values self-esteem items"
  ),
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "strongly disagree",
  `2` = "disagree",
  `3` = "no disagreement/agreement",
  `4` = "agree",
  `5` = "strongly agree"
)

standardized_value_labels <- list(
  masmv = c(`-2` = "no valid data"),
  masmv7 = c(`-2` = "no valid data"),
  master1 = c(
    `-2` = "na, see RMMAS in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  master2 = c(
    `-2` = "na, see RMMAS in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  master3 = c(
    `-2` = "na, see RMMAS in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  master4 = c(
    `-2` = "na, see RMMAS in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  master5 = c(
    `-2` = "na, see RMMAS in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  master6 = c(
    `-2` = "na, see RMMAS in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  master7 = c(
    `-2` = "na, see RMMAS in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  selfes1 = c(
    `-2` = "na, short/terminated interview / see RMSELF in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  selfes2 = c(
    `-2` = "na, see RMSELF in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  selfes3 = c(
    `-2` = "na, see RMSELF in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  selfes4 = c(
    `-2` = "na, see RMSELF in LASA227",
    default_missing_labels[c("-1")],
    default_answer_labels[c("1", "2", "3", "4", "5")]
  ),
  selfmv = c(`-2` = "no valid data")
)

value_labels_list <- list(
  Wave_B_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see BRMMAS in LASAB227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see BRMMAS in LASAB227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see BRMMAS in LASAB227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see BRMMAS in LASAB227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see BRMMAS in LASAB227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, short/terminated interview"
  )
  ),
  Wave_C_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see CRMMAS in LASAC227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see CRMMAS in LASAC227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see CRMMAS in LASAC227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see CRMMAS in LASAC227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see CRMMAS in LASAC227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see CRMSELF in LASAC227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see CRMSELF in LASAC227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see CRMSELF in LASAC227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see CRMSELF in LASAC227"
  )
  ),
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see DRMMAS in LASAD227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see DRMMAS in LASAD227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see DRMMAS in LASAD227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see DRMMAS in LASAD227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see DRMMAS in LASAD227"
  ),
    master6 = .replace_labels(
    standardized_value_labels$master6,
    `-2` = "na, see DRMMAS in LASAD227"
  ),
    master7 = .replace_labels(
    standardized_value_labels$master7,
    `-2` = "na, see DRMMAS in LASAD227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see DRMSELF in LASAD227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see DRMSELF in LASAD227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see DRMSELF in LASAD227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see DRMSELF in LASAD227"
  )
  ),
  Wave_E_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see ERMMAS in LASAE227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see ERMMAS in LASAE227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see ERMMAS in LASAE227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see ERMMAS in LASAE227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see ERMMAS in LASAE227"
  ),
    master6 = .replace_labels(
    standardized_value_labels$master6,
    `-2` = "na, see ERMMAS in LASAE227"
  ),
    master7 = .replace_labels(
    standardized_value_labels$master7,
    `-2` = "na, see ERMMAS in LASAE227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see ERMSELF in LASAE227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see ERMSELF in LASAE227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see ERMSELF in LASAE227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see ERMSELF in LASAE227"
  )
  ),
  Wave_2B_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see BRMMAS in LAS2B227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see BRMMAS in LAS2B227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see BRMMAS in LAS2B227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see BRMMAS in LAS2B227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see BRMMAS in LAS2B227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see BRMSELF in LAS2B227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see BRMSELF in LAS2B227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see BRMSELF in LAS2B227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see BRMSELF in LAS2B227"
  )
  ),
  Wave_F_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see FRMMAS in LASAF227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see FRMMAS in LASAF227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see FRMMAS in LASAF227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see FRMMAS in LASAF227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see FRMMAS in LASAF227"
  ),
    master6 = .replace_labels(
    standardized_value_labels$master6,
    `-2` = "na, see FRMMAS in LASAF227"
  ),
    master7 = .replace_labels(
    standardized_value_labels$master7,
    `-2` = "na, see FRMMAS in LASAF227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see FRMSELF in LASAF227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see FRMSELF in LASAF227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see FRMSELF in LASAF227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see FRMSELF in LASAF227"
  )
  ),
  Wave_G_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see GRMMAS in LASAG227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see GRMMAS in LASAG227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see GRMMAS in LASAG227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see GRMMAS in LASAG227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see GRMMAS in LASAG227"
  ),
    master6 = .replace_labels(
    standardized_value_labels$master6,
    `-2` = "na, see GRMMAS in LASAG227"
  ),
    master7 = .replace_labels(
    standardized_value_labels$master7,
    `-2` = "na, see GRMMAS in LASAG227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see GRMSELF in LASAG227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see GRMSELF in LASAG227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see GRMSELF in LASAG227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see GRMSELF in LASAG227"
  )
  ),
  Wave_H_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see HRMMAS in LASAH227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see HRMMAS in LASAH227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see HRMMAS in LASAH227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see HRMMAS in LASAH227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see HRMMAS in LASAH227"
  ),
    master6 = .replace_labels(
    standardized_value_labels$master6,
    `-2` = "na, see HRMMAS in LASAH227"
  ),
    master7 = .replace_labels(
    standardized_value_labels$master7,
    `-2` = "na, see HRMMAS in LASAH227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see HRMSELF in LASAH227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see HRMSELF in LASAH227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see HRMSELF in LASAH227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see HRMSELF in LASAH227"
  )
  ),
  Wave_3B_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see BRMMAS in LAS3B227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see BRMMAS in LAS3B227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see BRMMAS in LAS3B227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see BRMMAS in LAS3B227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see BRMMAS in LAS3B227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see BRMSELF in LAS3B227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see BRMSELF in LAS3B227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see BRMSELF in LAS3B227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see BRMSELF in LAS3B227"
  )
  ),
  Wave_MB_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see BRMMAS in LASMB227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see BRMMAS in LASMB227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see BRMMAS in LASMB227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see BRMMAS in LASMB227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see BRMMAS in LASMB227"
  )
  ),
  Wave_I_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see IRMMAS in LASAI227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see IRMMAS in LASAI227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see IRMMAS in LASAI227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see IRMMAS in LASAI227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see IRMMAS in LASAI227"
  ),
    master6 = .replace_labels(
    standardized_value_labels$master6,
    `-2` = "na, see IRMMAS in LASAI227"
  ),
    master7 = .replace_labels(
    standardized_value_labels$master7,
    `-2` = "na, see IRMMAS in LASAI227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see IRMSELF in LASAI227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see IRMSELF in LASAI227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see IRMSELF in LASAI227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see IRMSELF in LASAI227"
  )
  ),
  Wave_J_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see JRMMAS in LASAJ227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see JRMMAS in LASAJ227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see JRMMAS in LASAJ227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see JRMMAS in LASAJ227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see JRMMAS in LASAJ227"
  ),
    master6 = .replace_labels(
    standardized_value_labels$master6,
    `-2` = "na, see JRMMAS in LASAJ227"
  ),
    master7 = .replace_labels(
    standardized_value_labels$master7,
    `-2` = "na, see JRMMAS in LASAJ227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see JRMSELF in LASAJ227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see JRMSELF in LASAJ227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see JRMSELF in LASAJ227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see JRMSELF in LASAJ227"
  )
  ),
  Wave_K_labels = .replace_in_list(
    standardized_value_labels,
    master1 = .replace_labels(
    standardized_value_labels$master1,
    `-2` = "na, see KRMMAS in LASAK227"
  ),
    master2 = .replace_labels(
    standardized_value_labels$master2,
    `-2` = "na, see KRMMAS in LASAK227"
  ),
    master3 = .replace_labels(
    standardized_value_labels$master3,
    `-2` = "na, see KRMMAS in LASAK227"
  ),
    master4 = .replace_labels(
    standardized_value_labels$master4,
    `-2` = "na, see KRMMAS in LASAK227"
  ),
    master5 = .replace_labels(
    standardized_value_labels$master5,
    `-2` = "na, see KRMMAS in LASAK227"
  ),
    master6 = .replace_labels(
    standardized_value_labels$master6,
    `-2` = "na, see KRMMAS in LASAK227"
  ),
    master7 = .replace_labels(
    standardized_value_labels$master7,
    `-2` = "na, see KRMMAS in LASAK227"
  ),
    selfes1 = .replace_labels(
    standardized_value_labels$selfes1,
    `-2` = "na, see KRMSELF in LASAK227"
  ),
    selfes2 = .replace_labels(
    standardized_value_labels$selfes2,
    `-2` = "na, see KRMSELF in LASAK227"
  ),
    selfes3 = .replace_labels(
    standardized_value_labels$selfes3,
    `-2` = "na, see KRMSELF in LASAK227"
  ),
    selfes4 = .replace_labels(
    standardized_value_labels$selfes4,
    `-2` = "na, see KRMSELF in LASAK227"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  masmv = "numeric",
  masmv7 = "numeric",
  master1 = "categorical",
  master2 = "categorical",
  master3 = "categorical",
  master4 = "categorical",
  master5 = "categorical",
  master6 = "categorical",
  master7 = "categorical",
  selfes1 = "categorical",
  selfes2 = "categorical",
  selfes3 = "categorical",
  selfes4 = "categorical",
  selfmv = "numeric"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "027", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "027", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "027", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "027", waves = .lasa_wave_rows())
)

.lasa_fc_027 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

