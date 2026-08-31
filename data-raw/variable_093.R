## LASA filecode 093 -- variable names, variable labels, value labels,
## and variable types. Sourced after data-raw/label_db_helpers.R.
##
## To add a wave: add its documented variables to variable_labels_list
## and (if it has value labels) value_labels_list below. To add a new
## variable: add it to harmonized_labels/standardized_value_labels/
## var_types_vec and to the wave(s) that document it.

harmonized_labels <- c(
  eol01 = "# end-of-life declarations",
  eol02 = "# persons informed about EOL-declaration",
  eol03 = "Indication (verbal/written)",
  eol04 = "Discussed EOL-choices with family physician",
  eol05 = "Imagine: request for euthanasia",
  eol07 = "Trust in doctors/nurses",
  eol11 = "No treatment declaration",
  eol12 = "No reanimation declaration",
  eol13 = "Euthanasia declaration",
  eol14 = "Care declaration",
  eol15 = "Credo declaration",
  eol16 = "Declaration, not specified",
  eol21 = "Informed: partner",
  eol22 = "Informed: children",
  eol23 = "Informed: caretaker",
  eol24 = "Informed: family physician",
  eol25 = "Informed: district nurse",
  eol26 = "Informed: other",
  eol261 = "Informed: other family member",
  eol262 = "Informed: nobody",
  eol263 = "Informed: friend",
  eol264 = "Informed: household member",
  eol265 = "Informed: free euthanasia association",
  eol266 = "Informed: spiritual adviser",
  eol267 = "Informed: notary",
  eol268 = "Informed: not specified",
  eol601 = "# reasons EOL-requests",
  eol602 = "Reason: unbearable suffering (not pain)",
  eol603 = "Reason: loss of dignity",
  eol604 = "Reason: meaningless suffering",
  eol605 = "Reason: weariness of life",
  eol606 = "Reason: nuisance for family/daily environment",
  eol607 = "Reason: prevent pain",
  eol608 = "Reason: prevent further suffering",
  eol609 = "Reason: prevent humiliation/decay",
  eol610 = "Reason: hopeless suffering",
  eol611 = "Reason: mental retardation or dementia",
  eol612 = "Reason: other",
  eol612s = "Reason: other specified"
)

## Which canonical variables each wave actually documents -- see
## label_db_helpers.R's .lasa_prune_wave_coverage() for how this is
## used: the tables below are built unsubsetted, then pruned back
## down to exactly this per wave.
wave_coverage <- list(
  `D` = c(
    "eol01",
    "eol02",
    "eol03",
    "eol04",
    "eol05",
    "eol07",
    "eol11",
    "eol12",
    "eol13",
    "eol14",
    "eol15",
    "eol16",
    "eol21",
    "eol22",
    "eol23",
    "eol24",
    "eol25",
    "eol26",
    "eol261",
    "eol262",
    "eol263",
    "eol264",
    "eol265",
    "eol266",
    "eol267",
    "eol268",
    "eol601",
    "eol602",
    "eol603",
    "eol604",
    "eol605",
    "eol606",
    "eol607",
    "eol608",
    "eol609",
    "eol610",
    "eol611",
    "eol612",
    "eol612s"
  )
)

variable_labels_list <- list(
  Wave_D_labels = harmonized_labels,
  Harmonized_labels = harmonized_labels
)

## This file's own very common answer categories (>= 10 occurrences
## across its variables) -- same idea as default_missing_labels, just
## scoped to this filecode instead of shared globally.
default_answer_labels <- c(
  `1` = "mentioned"
)

standardized_value_labels <- list(
  eol01 = c(
    `-2` = "interview terminated",
    default_missing_labels[c("-1")]
  ),
  eol02 = c(
    default_missing_labels[c("-2", "-1")]
  ),
  eol03 = c(
    `-2` = "interview terminated",
    default_missing_labels[c("-1")],
    `1` = "yes, written",
    `2` = "yes, verbal",
    `3` = "yes, written and verbal",
    `4` = "yes, not specified",
    `5` = "no",
    `6` = "R does not know"
  ),
  eol04 = c(
    `-2` = "interview terminated",
    default_missing_labels[c("-1")],
    `1` = "yes",
    `2` = "no",
    `3` = "R does not know"
  ),
  eol05 = c(
    `-2` = "interview terminated",
    default_missing_labels[c("-1")],
    `1` = "yes",
    `2` = "no",
    `3` = "R does not know"
  ),
  eol07 = c(
    `-2` = "interview terminated",
    default_missing_labels[c("-1")],
    `1` = "trust: very strong",
    `2` = "trust: quite strong",
    `3` = "trust not much",
    `4` = "rust: not at all",
    `5` = "trust: no opinion"
  ),
  eol11 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol12 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol13 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol14 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol15 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol16 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol21 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol22 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol23 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol24 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol25 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol26 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol261 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol262 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol263 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol264 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol265 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol266 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol267 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol268 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol601 = c(
    default_missing_labels[c("-2", "-1")]
  ),
  eol602 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol603 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol604 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol605 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol606 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol607 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol608 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol609 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol610 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol611 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol612 = c(
    default_missing_labels[c("-2")],
    `0` = "not mentioned",
    default_answer_labels[c("1")]
  ),
  eol612s = c(
    default_missing_labels[c("-2")],
    `1` = "-to be coded-"
  )
)

value_labels_list <- list(
  Wave_D_labels = .replace_in_list(
    standardized_value_labels,
    eol01 = .replace_labels(
    standardized_value_labels$eol01,
    `-2` = "na, terminated interview"
  ),
    eol02 = .replace_labels(
    standardized_value_labels$eol02,
    `-2` = "na, see DEOL01"
  ),
    eol03 = .replace_labels(
    standardized_value_labels$eol03,
    `-2` = "na, terminated interview"
  ),
    eol04 = .replace_labels(
    standardized_value_labels$eol04,
    `-2` = "na, terminated interview"
  ),
    eol05 = .replace_labels(
    standardized_value_labels$eol05,
    `-2` = "na, terminated interview"
  ),
    eol07 = .replace_labels(
    standardized_value_labels$eol07,
    `-2` = "na, terminated interview"
  ),
    eol11 = .replace_labels(
    standardized_value_labels$eol11,
    `-2` = "na, see DEOL01"
  ),
    eol12 = .replace_labels(
    standardized_value_labels$eol12,
    `-2` = "na, see DEOL01"
  ),
    eol13 = .replace_labels(
    standardized_value_labels$eol13,
    `-2` = "na, see DEOL01"
  ),
    eol14 = .replace_labels(
    standardized_value_labels$eol14,
    `-2` = "na, see DEOL01"
  ),
    eol15 = .replace_labels(
    standardized_value_labels$eol15,
    `-2` = "na, see DEOL01"
  ),
    eol16 = .replace_labels(
    standardized_value_labels$eol16,
    `-2` = "na, see DEOL01"
  ),
    eol21 = .replace_labels(
    standardized_value_labels$eol21,
    `-2` = "na, see DEOL02"
  ),
    eol22 = .replace_labels(
    standardized_value_labels$eol22,
    `-2` = "na, see DEOL02"
  ),
    eol23 = .replace_labels(
    standardized_value_labels$eol23,
    `-2` = "na, see DEOL02"
  ),
    eol24 = .replace_labels(
    standardized_value_labels$eol24,
    `-2` = "na, see DEOL02"
  ),
    eol25 = .replace_labels(
    standardized_value_labels$eol25,
    `-2` = "na, see DEOL02"
  ),
    eol26 = .replace_labels(
    standardized_value_labels$eol26,
    `-2` = "na, see DEOL02"
  ),
    eol261 = .replace_labels(
    standardized_value_labels$eol261,
    `-2` = "na, see DEOL26"
  ),
    eol262 = .replace_labels(
    standardized_value_labels$eol262,
    `-2` = "na, see DEOL26"
  ),
    eol263 = .replace_labels(
    standardized_value_labels$eol263,
    `-2` = "na, see DEOL26"
  ),
    eol264 = .replace_labels(
    standardized_value_labels$eol264,
    `-2` = "na, see DEOL26"
  ),
    eol265 = .replace_labels(
    standardized_value_labels$eol265,
    `-2` = "na, see DEOL26"
  ),
    eol266 = .replace_labels(
    standardized_value_labels$eol266,
    `-2` = "na, see DEOL26"
  ),
    eol267 = .replace_labels(
    standardized_value_labels$eol267,
    `-2` = "na, see DEOL26"
  ),
    eol268 = .replace_labels(
    standardized_value_labels$eol268,
    `-2` = "na, see DEOL26"
  ),
    eol601 = .replace_labels(
    standardized_value_labels$eol601,
    `-2` = "na, see DEOL05"
  ),
    eol602 = .replace_labels(
    standardized_value_labels$eol602,
    `-2` = "na, see DEOL05"
  ),
    eol603 = .replace_labels(
    standardized_value_labels$eol603,
    `-2` = "na, see DEOL05"
  ),
    eol604 = .replace_labels(
    standardized_value_labels$eol604,
    `-2` = "na, see DEOL05"
  ),
    eol605 = .replace_labels(
    standardized_value_labels$eol605,
    `-2` = "na, see DEOL05"
  ),
    eol606 = .replace_labels(
    standardized_value_labels$eol606,
    `-2` = "na, see DEOL05"
  ),
    eol607 = .replace_labels(
    standardized_value_labels$eol607,
    `-2` = "na, see DEOL05"
  ),
    eol608 = .replace_labels(
    standardized_value_labels$eol608,
    `-2` = "na, see DEOL05"
  ),
    eol609 = .replace_labels(
    standardized_value_labels$eol609,
    `-2` = "na, see DEOL05"
  ),
    eol610 = .replace_labels(
    standardized_value_labels$eol610,
    `-2` = "na, see DEOL05"
  ),
    eol611 = .replace_labels(
    standardized_value_labels$eol611,
    `-2` = "na, see DEOL05"
  ),
    eol612 = .replace_labels(
    standardized_value_labels$eol612,
    `-2` = "na, see DEOL05"
  ),
    eol612s = .replace_labels(
    standardized_value_labels$eol612s,
    `-2` = "na, see DEOL612"
  )
  ),
  Harmonized_labels = standardized_value_labels
)

var_types_vec <- c(
  eol01 = "numeric",
  eol02 = "numeric",
  eol03 = "categorical",
  eol04 = "categorical",
  eol05 = "categorical",
  eol07 = "categorical",
  eol11 = "categorical",
  eol12 = "categorical",
  eol13 = "categorical",
  eol14 = "categorical",
  eol15 = "categorical",
  eol16 = "categorical",
  eol21 = "categorical",
  eol22 = "categorical",
  eol23 = "categorical",
  eol24 = "categorical",
  eol25 = "categorical",
  eol26 = "categorical",
  eol261 = "categorical",
  eol262 = "categorical",
  eol263 = "categorical",
  eol264 = "categorical",
  eol265 = "categorical",
  eol266 = "categorical",
  eol267 = "categorical",
  eol268 = "categorical",
  eol601 = "numeric",
  eol602 = "categorical",
  eol603 = "categorical",
  eol604 = "categorical",
  eol605 = "categorical",
  eol606 = "categorical",
  eol607 = "categorical",
  eol608 = "categorical",
  eol609 = "categorical",
  eol610 = "categorical",
  eol611 = "categorical",
  eol612 = "categorical",
  eol612s = "categorical"
)

fc_labels <- list(
  variables = .lasa_build_name_table(variable_labels_list, filecode = "093", waves = .lasa_wave_rows()),
  variable_labels = .lasa_build_label_table(variable_labels_list, filecode = "093", waves = .lasa_wave_rows()),
  value_labels = .lasa_build_value_table(value_labels_list, filecode = "093", waves = .lasa_wave_rows()),
  variable_types = .lasa_build_type_table(var_types_vec, filecode = "093", waves = .lasa_wave_rows())
)

.lasa_fc_093 <- .lasa_prune_wave_coverage(fc_labels, wave_coverage)

