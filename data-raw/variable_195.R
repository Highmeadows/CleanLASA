## LASA filecode 195 -- variable names, variable labels, value labels,
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
  meol01 = "categorical",
  meol02 = "categorical",
  meol03 = "categorical",
  meol04 = "numeric",
  meol05 = "categorical",
  meol06 = "categorical",
  meol07 = "categorical",
  meol08 = "categorical",
  meol09 = "categorical",
  meol10 = "categorical",
  meol11 = "categorical",
  meol12 = "categorical",
  meol13 = "categorical",
  meol14 = "numeric",
  meol141 = "categorical",
  meol142 = "categorical",
  meol143 = "categorical",
  meol144 = "categorical",
  meol145 = "categorical",
  meol15 = "categorical",
  meol41 = "categorical",
  meol42 = "categorical",
  meol43 = "categorical",
  meol44 = "categorical",
  meol45 = "categorical",
  meol601 = "categorical",
  meol602 = "categorical",
  meol603 = "categorical",
  meol604 = "categorical",
  meol605 = "categorical",
  meol606 = "categorical",
  meol607 = "categorical",
  meol608 = "categorical",
  meol609 = "categorical",
  meol610 = "categorical",
  meol611 = "categorical",
  meol612 = "categorical",
  mrmeol = "categorical"
)

# define variable labels ----
variable_labels(
  meol01 = "Trust in doctors for good care in end-of-life",
  meol02 = "Trust in doctors for end-of-life-wishes",
  meol03 = "Discussed end-of-life-wishes with doctor",
  meol04 = "Number of persons talked to about end-of-life wishes",
  meol05 = "End-of-life decision arrangement",
  meol06 = "End-of-life declaration information",
  meol07 = "ever death thoughts",
  meol08 = "ever death wishes",
  meol09 = "feelings towards living past week",
  meol10 = "feelings towards dying past week",
  meol11 = "feelings towards reasons for living/dying",
  meol12 = "suicide medication must be available",
  meol13 = "imagine suicide medication in possession",
  meol14 = "Number of circumstances taking suicide medication",
  meol141 = "circumstance: higher age",
  meol142 = "circumstance: severe illness",
  meol143 = "circumstance: dementia",
  meol144 = "circumstance: dependence",
  meol145 = "circumstance: other",
  meol15 = "usage suicide medication within few months",
  meol41 = "Talked to partner",
  meol42 = "Talked to children",
  meol43 = "Talked to other family members",
  meol44 = "Talked to friends",
  meol45 = "Talked to other persons",
  meol601 = "standard: NVVE advance euthanasia directive",
  meol602 = "standard: NVVE durable power of attorney",
  meol603 = "standard: NVVE do not treat",
  meol604 = "standard: NVVE do not resuscitate",
  meol605 = "standard: NPV wish to live",
  meol606 = "End-of-life declaration item 6",
  meol607 = "End-of-life declaration item 7",
  meol608 = "standard: other standard living will",
  meol609 = "personal: advance euthanasia directive",
  meol610 = "personal: other personal living will -coded",
  meol611 = "other end-of-life-declaration: not specified",
  meol612 = "living will",
  mrmeol = "Reason for missing end-of-life answers",
  .applies_to_waves = c("Z")
)

variable_labels(
  "meol07", "meol08", "meol09", "meol10", "meol11", "meol12", "meol13", "meol141", "meol142", "meol143", "meol144", "meol145", "meol15",
  .applies_to_waves = c("F")
)

variable_labels(
  "meol41", "meol42", "meol43", "meol44", "meol45",
  .applies_to_waves = c("F", "G", "H", "I", "J")
)

variable_labels(
  "meol601", "meol602", "meol603", "meol604", "meol605", "meol608", "meol609", "meol610",
  .applies_to_waves = c("H", "I", "J")
)

variable_labels(
  "meol612",
  .applies_to_waves = c("I", "J")
)

variable_labels(
  meol01 = "Trust in doctors for good care in EOL",
  meol02 = "Trust in doctors for EOL-wishes",
  meol03 = "Discussed EOL-wishes with doctor",
  meol05 = "Indication (verbal/written)",
  .applies_to_waves = c("F", "G", "H", "I", "J")
)

variable_labels(
  meol04 = "# persons talked to about EOL-wishes",
  meol06 = "(standard) End-of-life declaration",
  mrmeol = "reason missing eol-answers",
  .applies_to_waves = c("F", "G")
)

variable_labels(
  meol14 = "# circumstances taking suicide medication",
  .applies_to_waves = c("F")
)

variable_labels(
  meol04 = "number of persons talked to about EOL-wishes",
  meol06 = "number of End-of-life declarations",
  mrmeol = "reason missing EOL-answers",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  meol606 = "standard: notary: advance euthanasia directive",
  meol607 = "standard: MAIA advance care directive",
  meol611 = "other EOL-declaration: not specified",
  .applies_to_waves = c("H", "I", "J")
)

variable_labels(
  meol01 = "trust in doctors for good care in EOL",
  meol02 = "trust in doctors for EOL-wishes",
  meol03 = "discussed EOL-wishes with doctor",
  meol05 = "someone appointed to make medical treatment decisions",
  meol41 = "talked with partner",
  meol42 = "talked to children",
  meol43 = "talked to other family members",
  meol44 = "talked to friends",
  meol45 = "talked to other persons",
  meol601 = "advance directive: euthanasia",
  meol602 = "advance directive: durable power of attorney",
  meol603 = "advance directive: do not treat",
  meol604 = "advance directive: do not resuscitate",
  meol605 = "wish to live statement",
  meol606 = "living will",
  meol607 = "other EOL-declaration: not specified",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-2` = "no valid data",
  .applies_to_vars = c("meol01", "meol02", "meol03", "meol04", "meol05", "meol06", "meol07", "meol08", "meol09", "meol10", "meol11", "meol12", "meol13", "meol14", "meol141", "meol142", "meol143", "meol144", "meol145", "meol15", "meol41", "meol42", "meol43", "meol44", "meol45", "meol601", "meol602", "meol603", "meol604", "meol605", "meol606", "meol607", "meol608", "meol609", "meol610", "meol611", "meol612"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "trust: very strong", `2` = "quite strong", `3` = "not much", `4` = "not at all", `5` = "no opinion",
  .applies_to_vars = c("meol01", "meol02"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("meol03", "meol07", "meol08"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "does not know / no valid count", `0` = "R did not talk to anyone",
  .applies_to_vars = c("meol04"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, exclusively written", `2` = "yes, excl. verbal", `3` = "yes, written and verbal", `4` = "yes, not specified", `5` = "no", `6` = "R does not know",
  .applies_to_vars = c("meol05"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "does not know / no valid response", `0` = "R does not have anything on paper", `1` = "recorded value 1", `2` = "recorded value 2", `3` = "recorded value 3", `4` = "recorded value 4", `5` = "recorded value 5", `6` = "recorded value 6", `7` = "recorded value 7", `8` = "recorded value 8", `9` = "recorded value 9", `10` = "recorded value 10", `11` = "recorded value 11", `12` = "recorded value 12", `13` = "recorded value 13",
  .applies_to_vars = c("meol06"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "a moderate to strong wish to live", `2` = "a weak wish to live", `3` = "no wish to live",
  .applies_to_vars = c("meol09"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "no wish to die", `2` = "a weak wish to die", `3` = "a moderate to strong wish to die",
  .applies_to_vars = c("meol10"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "for living outweigh those for dying", `2` = "about equal", `3` = "for dying outweigh those for living",
  .applies_to_vars = c("meol11"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "na, asked", `1` = "yes", `2` = "maybe", `3` = "no", `4` = "R does not know",
  .applies_to_vars = c("meol12", "meol13"),
  .applies_to_waves = c("Z", "F")
)

value_labels(
  `-1` = "na, asked",
  .applies_to_vars = c("meol14"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol141", "meol142", "meol143", "meol144", "meol145", "meol41", "meol42", "meol43", "meol44", "meol45", "meol612"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "yes, because\342\200\246", `2` = "no",
  .applies_to_vars = c("meol15"),
  .applies_to_waves = c("Z")
)

value_labels(
  `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol601", "meol602", "meol603", "meol604", "meol605", "meol606", "meol607", "meol608", "meol609", "meol610", "meol611"),
  .applies_to_waves = c("Z", "H", "J")
)

value_labels(
  `-2` = "valid score", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to [cognitive]", `6` = "not able to (physical)", `7` = "emotional reasons", `8` = "unknown",
  .applies_to_vars = c("mrmeol"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see FMRMEOL",
  .applies_to_vars = c("meol01", "meol02", "meol03", "meol04", "meol05", "meol06", "meol07", "meol08", "meol09", "meol10", "meol11", "meol12", "meol13"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked/R does not know",
  .applies_to_vars = c("meol04"),
  .applies_to_waves = c("F")
)

value_labels(
  `-1` = "na, asked", `1` = "standard: NVVE advance euthanasia directive", `2` = "standard: NVVE durable power of attorney", `3` = "standard: NVVE do not treat", `4` = "standard: NVVE do not resuscitate", `5` = "standard: NPV wish to live", `6` = "standard: notary: advance euthanasia directive", `7` = "standard: MAIA advance care directive", `8` = "standard: other standard living will", `9` = "personal: advance euthanasia directive", `10` = "personal: other personal living will", `11` = "other not specified", `12` = "no", `13` = "R does not know",
  .applies_to_vars = c("meol06"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FMEOL13", `-1` = "na, asked",
  .applies_to_vars = c("meol14"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FMEOL14", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol141", "meol142", "meol143", "meol144", "meol145"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FMEOL13", `-1` = "na, asked", `1` = "yes, because\342\200\246", `2` = "no",
  .applies_to_vars = c("meol15"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "na, see FMEOL04", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol41", "meol42", "meol43", "meol44", "meol45"),
  .applies_to_waves = c("F")
)

value_labels(
  `-2` = "valid score", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to [cognitive]", `6` = "not able to [physical]", `7` = "emotional reasons", `8` = "unknown",
  .applies_to_vars = c("mrmeol"),
  .applies_to_waves = c("F", "G")
)

value_labels(
  `-2` = "na, see GMRMEOL", `-1` = "na, asked", `1` = "trust: very strong", `2` = "quite strong", `3` = "not much", `4` = "not at all", `5` = "no opinion",
  .applies_to_vars = c("meol01", "meol02"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMRMEOL", `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("meol03"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMRMEOL", `-1` = "na, asked/R does not know",
  .applies_to_vars = c("meol04"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMRMEOL", `-1` = "na, asked", `1` = "yes, exclusively written", `2` = "yes, excl. verbal", `3` = "yes, written and verbal", `4` = "yes, not specified", `5` = "no", `6` = "R does not know",
  .applies_to_vars = c("meol05"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMRMEOL", `-1` = "na, asked", `1` = "standard: NVVE advance euthanasia directive", `2` = "standard: NVVE durable power of attorney", `3` = "standard: NVVE do not treat", `4` = "standard: NVVE do not resuscitate", `5` = "standard: NPV wish to live", `6` = "standard: notary: advance euthanasia directive", `7` = "standard: MAIA advance care directive", `8` = "standard: other standard living will", `9` = "personal: advance euthanasia directive", `10` = "personal: other personal living will", `11` = "other not specified", `12` = "no", `13` = "R does not know",
  .applies_to_vars = c("meol06"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see GMEOL04", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol41", "meol42", "meol43", "meol44", "meol45"),
  .applies_to_waves = c("G")
)

value_labels(
  `-2` = "na, see HMEOL06",
  .applies_to_vars = c("meol601", "meol602", "meol603", "meol604", "meol605", "meol606", "meol607", "meol608", "meol609", "meol610", "meol611"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMRMEOL", `-1` = "na, asked", `1` = "trust: very strong", `2` = "quite strong", `3` = "not much", `4` = "not at all", `5` = "no opinion",
  .applies_to_vars = c("meol01", "meol02"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMRMEOL", `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("meol03"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMRMEOL", `-1` = "na, asked/R does not know",
  .applies_to_vars = c("meol04"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMRMEOL", `-1` = "na, asked", `1` = "yes, exclusively written", `2` = "yes, exclusively verbal", `3` = "yes, written and verbal", `4` = "yes, not specified", `5` = "no", `6` = "R does not know",
  .applies_to_vars = c("meol05"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMRMEOL", `-1` = "na, asked/ R does not know",
  .applies_to_vars = c("meol06"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "na, see HMEOL04", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol41", "meol42", "meol43", "meol44", "meol45"),
  .applies_to_waves = c("H")
)

value_labels(
  `-2` = "valid score", `1` = "short version", `2` = "interview terminated", `3` = "too many missings", `4` = "refused test", `5` = "not able to [cognitive]", `6` = "not able to [physical]", `7` = "emotional reasons", `8` = "unknown / to be coded",
  .applies_to_vars = c("mrmeol"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-2` = "na, see IMRMEOL", `-1` = "na, asked", `1` = "trust: very strong", `2` = "quite strong", `3` = "not much", `4` = "not at all", `5` = "no opinion",
  .applies_to_vars = c("meol01", "meol02"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMRMEOL", `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("meol03"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMRMEOL", `-1` = "R does not know", `0` = "R did not talk to anyone",
  .applies_to_vars = c("meol04"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMRMEOL", `-1` = "na, asked", `1` = "yes, exclusively written", `2` = "yes, exclusively verbal", `3` = "yes, written and verbal", `4` = "yes, not specified", `5` = "no", `6` = "R does not know",
  .applies_to_vars = c("meol05"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMRMEOL", `-1` = "R does not know", `0` = "R does not have anything on paper",
  .applies_to_vars = c("meol06"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMEOL04", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol41", "meol42", "meol43", "meol44", "meol45"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMEOL06", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol601", "meol602", "meol603", "meol604", "meol605", "meol606", "meol607", "meol608", "meol609", "meol610", "meol611"),
  .applies_to_waves = c("I")
)

value_labels(
  `-2` = "na, see IMEOL06", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol612"),
  .applies_to_waves = c("I", "J")
)

value_labels(
  `-2` = "na, see JMEOL06",
  .applies_to_vars = c("meol601", "meol602", "meol603", "meol604", "meol605", "meol606", "meol607", "meol608", "meol609", "meol610", "meol611"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMRMEOL", `-1` = "na, asked", `1` = "trust: very strong", `2` = "quite strong", `3` = "not much", `4` = "not at all", `5` = "no opinion",
  .applies_to_vars = c("meol01", "meol02"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMRMEOL", `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("meol03"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMRMEOL", `-1` = "R does not know", `0` = "R did not talk to anyone",
  .applies_to_vars = c("meol04"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMRMEOL", `-1` = "na, asked", `1` = "yes, exclusively written", `2` = "yes, exclusively verbal", `3` = "yes, written and verbal", `4` = "yes, not specified", `5` = "no", `6` = "R does not know",
  .applies_to_vars = c("meol05"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMRMEOL", `-1` = "R does not know", `0` = "R does not have anything on paper",
  .applies_to_vars = c("meol06"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JMEOL04", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol41", "meol42", "meol43", "meol44", "meol45"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KMRMEOL", `-1` = "na, asked", `1` = "trust: very strong", `2` = "trust: quite strong", `3` = "trust: not much", `4` = "trust: not at all", `5` = "trust: no opinion",
  .applies_to_vars = c("meol01", "meol02"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMRMEOL", `-1` = "na, asked", `1` = "yes", `2` = "no", `3` = "R does not know",
  .applies_to_vars = c("meol03"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMRMEOL", `-1` = "R does not know", `0` = "R did not talk to anyone",
  .applies_to_vars = c("meol04"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMRMEOL", `-1` = "na, asked", `1` = "yes, exclusively written", `2` = "yes, exclusively verbal", `3` = "yes, written and verbal", `4` = "yes, not specified", `5` = "no", `6` = "R does not know",
  .applies_to_vars = c("meol05"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMRMEOL", `-1` = "R does not know", `0` = "R does not have anything on paper",
  .applies_to_vars = c("meol06"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMEOL04", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol41", "meol42", "meol43", "meol44", "meol45"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KMEOL06", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("meol601", "meol602", "meol603", "meol604", "meol605", "meol606", "meol607"),
  .applies_to_waves = c("K")
)

.lasa_fc_195 <- .lasa_finalize_fc("195")

