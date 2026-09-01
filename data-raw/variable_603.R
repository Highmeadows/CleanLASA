## LASA filecode 603 -- variable names, variable labels, value labels,
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
  tpadl1a = "categorical",
  tpadl2a = "categorical",
  tpadl3a = "categorical",
  tpadl4a = "categorical",
  tpadl5a = "categorical",
  tpadl6a = "categorical",
  tpadl7a = "categorical",
  tperh = "categorical",
  `tpflwd#6` = "numeric",
  tpflwdiff = "numeric",
  tphea01 = "categorical",
  tphea02 = "categorical",
  tphea02a = "categorical",
  tphea02b = "categorical",
  tphea03 = "categorical",
  tphea04 = "categorical",
  tphea04a = "categorical",
  tphea04b = "categorical",
  tphea05 = "categorical",
  tphea06 = "categorical",
  tphea06a = "categorical",
  tphea06b = "categorical",
  tphea07 = "categorical",
  tphea08 = "categorical",
  tphea09 = "categorical",
  tphea10 = "categorical",
  tphea11 = "categorical",
  tphea12 = "categorical",
  tpheayn = "categorical",
  tphed01 = "categorical",
  tphed02 = "categorical",
  tphed02a = "categorical",
  tphed02b = "categorical",
  tphed03 = "categorical",
  tphed04 = "categorical",
  tphed04a = "categorical",
  tphed04b = "categorical",
  tphed05 = "categorical",
  tphed06 = "categorical",
  tphed06a = "categorical",
  tphed06b = "categorical",
  tphed07 = "categorical",
  tphed08 = "categorical",
  tphed09 = "categorical",
  tphed10 = "categorical",
  tphed11 = "categorical",
  tphed12 = "categorical",
  tphedyn = "categorical",
  tpheg01 = "categorical",
  tpheg02 = "categorical",
  tpheg02a = "categorical",
  tpheg02b = "categorical",
  tpheg03 = "categorical",
  tpheg04 = "categorical",
  tpheg04a = "categorical",
  tpheg04b = "categorical",
  tpheg05 = "categorical",
  tpheg06 = "categorical",
  tpheg06a = "categorical",
  tpheg06b = "categorical",
  tpheg07 = "categorical",
  tpheg08 = "categorical",
  tpheg09 = "categorical",
  tpheg10 = "categorical",
  tpheg11 = "categorical",
  tpheg12 = "categorical",
  tphegyn = "categorical",
  tphen01 = "categorical",
  tphen02 = "categorical",
  tphen02a = "categorical",
  tphen02b = "categorical",
  tphen03 = "categorical",
  tphen04 = "categorical",
  tphen04a = "categorical",
  tphen04b = "categorical",
  tphen05 = "categorical",
  tphen06 = "categorical",
  tphen06a = "categorical",
  tphen06b = "categorical",
  tphen07 = "categorical",
  tphen08 = "categorical",
  tphen09 = "categorical",
  tphen10 = "categorical",
  tphen11 = "categorical",
  tphen12 = "categorical",
  tphenyn = "categorical",
  tphep01 = "categorical",
  tphep02 = "categorical",
  tphep02a = "categorical",
  tphep02b = "categorical",
  tphep03 = "categorical",
  tphep04 = "categorical",
  tphep04a = "categorical",
  tphep04b = "categorical",
  tphep05 = "categorical",
  tphep06 = "categorical",
  tphep06a = "categorical",
  tphep06b = "categorical",
  tphep07 = "categorical",
  tphep08 = "categorical",
  tphep09 = "categorical",
  tphep10 = "categorical",
  tphep11 = "categorical",
  tphep12 = "categorical",
  tphepyn = "categorical",
  tphosp = "categorical",
  tpmeds = "categorical",
  tppha1 = "categorical",
  tppsyc = "categorical",
  tppsyh = "categorical",
  tpstic1 = "categorical",
  tpsuffic = "categorical"
)

# define variable labels ----
variable_labels(
  tpadl1a = "Stairs: 15 steps without stopping",
  tpadl2a = "(Un)dress: self",
  tpadl3a = "Chair: sit and rise from",
  tpadl4a = "Toenails: cutting own",
  tpadl5a = "Walking: 5 min. outside the house",
  tpadl6a = "Transport: use of own or public",
  tpadl7a = "Take a bath/shower: using aid",
  tperh = "Visited emergency room hospital past 6 months",
  `tpflwd#6` = "functional limitations, with difficulty #6 (constructed)",
  tpflwdiff = "functional limitations, with difficulty #3 (constructed)",
  tphea01 = "Administrative help R: partner",
  tphea02 = "Administrative help R: resident child",
  tphea02a = "Administrative help R: resident child",
  tphea02b = "Administrative help R: resident child-in-law",
  tphea03 = "Administrative help R: resident other",
  tphea04 = "Administrative help R: non-resident child",
  tphea04a = "Administrative help R: non-resident child",
  tphea04b = "Administrative help R: non-resident child-in-law",
  tphea05 = "Administrative help R: non-resident other family",
  tphea06 = "Administrative help R: neighbours/friends/acquaintances",
  tphea06a = "Administrative help R: neighbours",
  tphea06b = "Administrative help R: friends/acquaintances",
  tphea07 = "Administrative help R: volunteers",
  tphea08 = "Administrative help R: district nurse",
  tphea09 = "Administrative help R: professional home care",
  tphea10 = "Administrative help R: private",
  tphea11 = "Administrative help R: personnel home/hospital",
  tphea12 = "Administrative help R: other",
  tpheayn = "Help R with administration",
  tphed01 = "Domestic help R: partner",
  tphed02 = "Domestic help R: resident child",
  tphed02a = "Domestic help R: resident child",
  tphed02b = "Domestic help R: resident child-in-law",
  tphed03 = "Domestic help R: resident other",
  tphed04 = "Domestic help R: non-resident child",
  tphed04a = "Domestic help R: non-resident child",
  tphed04b = "Domestic help R: non-resident child-in-law",
  tphed05 = "Domestic help R: non-resident other family",
  tphed06 = "Domestic help R: neighbours/friends/acquaintances",
  tphed06a = "Domestic help R: neighbours",
  tphed06b = "Domestic help R: friends/acquaintances",
  tphed07 = "Domestic help R: volunteers",
  tphed08 = "Domestic help R: district nurse",
  tphed09 = "Domestic help R: professional home care",
  tphed10 = "Domestic help R: private",
  tphed11 = "Domestic help R: personnel home/hospital",
  tphed12 = "Domestic help R: other",
  tphedyn = "Help R with domestic tasks",
  tpheg01 = "Guidance help R: partner",
  tpheg02 = "Guidance help R: resident child",
  tpheg02a = "Guidance help R: resident child",
  tpheg02b = "Guidance help R: resident child-in-law",
  tpheg03 = "Guidance help R: resident other",
  tpheg04 = "Guidance help R: non-resident child",
  tpheg04a = "Guidance help R: non-resident child",
  tpheg04b = "Guidance help R: non-resident child-in-law",
  tpheg05 = "Guidance help R: non-resident other family",
  tpheg06 = "Guidance help R: neighbours/friends/acquaintances",
  tpheg06a = "Guidance help R: neighbours",
  tpheg06b = "Guidance help R: friends/acquaintances",
  tpheg07 = "Guidance help R: volunteers",
  tpheg08 = "Guidance help R: district nurse",
  tpheg09 = "Guidance help R: professional home care",
  tpheg10 = "Guidance help R: private",
  tpheg11 = "Guidance help R: personnel home/hospital",
  tpheg12 = "Guidance help R: other",
  tphegyn = "Help R with guidance",
  tphen01 = "Nursing help R: partner",
  tphen02 = "Nursing help R: resident child",
  tphen02a = "Nursing help R: resident child",
  tphen02b = "Nursing help R: resident child-in-law",
  tphen03 = "Nursing help R: resident other",
  tphen04 = "Nursing help R: non-resident child",
  tphen04a = "Nursing help R: non-resident child",
  tphen04b = "Nursing help R: non-resident child-in-law",
  tphen05 = "Nursing help R: non-resident other family",
  tphen06 = "Nursing help R: neighbours/friends/acquaintances",
  tphen06a = "Nursing help R: neighbours",
  tphen06b = "Nursing help R: friends/acquaintances",
  tphen07 = "Nursing help R: volunteers",
  tphen08 = "Nursing help R: district nurse",
  tphen09 = "Nursing help R: professional home care",
  tphen10 = "Nursing help R: private",
  tphen11 = "Nursing help R: personnel home/hospital",
  tphen12 = "Nursing help R: other",
  tphenyn = "Help R with nursing tasks",
  tphep01 = "Personal help R: partner",
  tphep02 = "Personal help R: resident child",
  tphep02a = "Personal help R: resident child",
  tphep02b = "Personal help R: resident child-in-law",
  tphep03 = "Personal help R: resident other",
  tphep04 = "Personal help R: non-resident child",
  tphep04a = "Personal help R: non-resident child",
  tphep04b = "Personal help R: non-resident child-in-law",
  tphep05 = "Personal help R: non-resident other family",
  tphep06 = "Personal help R: neighbours/friends/acquaintances",
  tphep06a = "Personal help R: neighbours",
  tphep06b = "Personal help R: friends/acquaintances",
  tphep07 = "Personal help R: volunteers",
  tphep08 = "Personal help R: district nurse",
  tphep09 = "Personal help R: professional home care",
  tphep10 = "Personal help R: private",
  tphep11 = "Personal help R: personnel home/hospital",
  tphep12 = "Personal help R: other",
  tphepyn = "Help R with personal care",
  tphosp = "Hospitalization past 6 months",
  tpmeds = "Contact with medical specialist past 6 months",
  tppha1 = "Physical condition respondent",
  tppsyc = "Contact with psychiatrist past 6 months",
  tppsyh = "Psychiatric hospitalization past 6 months",
  tpstic1 = "Contact with family physician past 6 months",
  tpsuffic = "Respondent gets sufficient help",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tpadl1a", "tpadl2a", "tpadl3a", "tpadl4a", "tpadl5a", "tpadl6a", "tphed01", "tphed03", "tphed05", "tphed07", "tphed08", "tphed09", "tphed10", "tphed11", "tphed12", "tphep01", "tphep03", "tphep05", "tphep07", "tphep08", "tphep09", "tphep10", "tphep11", "tphep12", "tphosp", "tpmeds", "tppha1", "tppsyc", "tppsyh", "tpstic1",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "tphed02", "tphed04", "tphed06", "tphep02", "tphep04", "tphep06",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

variable_labels(
  "tphea01", "tphea03", "tphea05", "tphea07", "tphea08", "tphea09", "tphea10", "tphea11", "tphea12", "tpheg01", "tpheg03", "tpheg05", "tpheg07", "tpheg08", "tpheg09", "tpheg10", "tpheg11", "tpheg12", "tphen01", "tphen03", "tphen05", "tphen07", "tphen08", "tphen09", "tphen10", "tphen11", "tphen12",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  "tphea02", "tphea04", "tphea06", "tpheg02", "tpheg04", "tpheg06", "tphen02", "tphen04", "tphen06",
  .applies_to_waves = c("H", "I")
)

variable_labels(
  "tperh", "tpflwd#6", "tpflwdiff", "tphea02a", "tphea02b", "tphea04a", "tphea04b", "tphea06a", "tphea06b", "tphed02a", "tphed02b", "tphed04a", "tphed04b", "tphed06a", "tphed06b", "tpheg02a", "tpheg02b", "tpheg04a", "tpheg04b", "tpheg06a", "tpheg06b", "tphen02a", "tphen02b", "tphen04a", "tphen04b", "tphen06a", "tphen06b", "tphep02a", "tphep02b", "tphep04a", "tphep04b", "tphep06a", "tphep06b",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  "tpadl7a", "tpsuffic",
  .applies_to_waves = c("K")
)

variable_labels(
  `tpflwd#6` = "functional limitations, with difficulty #6",
  tpflwdiff = "functional limitations, with difficulty #3",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

variable_labels(
  tphedyn = "Help R with domestic tasks Y/N",
  tphepyn = "Help R with personal care Y/N",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  tpheayn = "Help R with administration Y/N",
  tphegyn = "Help R with guidance Y/N",
  tphenyn = "Help R with nursing tasks Y/N",
  .applies_to_waves = c("H", "I", "J", "K")
)

# define value labels ----
value_labels(
  `-1` = "no valid data",
  .applies_to_vars = c("tpflwd#6", "tpflwdiff"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "na, see TPPHA1", `-1` = "asked, no answer / does not know", `1` = "no, R cannot", `2` = "yes, without difficulty", `3` = "yes, with some difficulty", `4` = "yes, with much difficulty", `5` = "only with help",
  .applies_to_vars = c("tpadl1a", "tpadl2a", "tpadl3a", "tpadl4a", "tpadl5a", "tpadl6a", "tpadl7a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "not available after question asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tperh", "tphosp", "tpmeds", "tppsyc", "tppsyh", "tpstic1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPPHA1", `0` = "no difficulties", `1` = "5 without difficulty", `2` = "4 without difficulty", `3` = "3 without difficulty", `4` = "2 without difficulty", `5` = "1 without difficulty", `6` = "all with difficulty",
  .applies_to_vars = c("tpflwd#6"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TPPHA1", `0` = "no difficulties", `1` = "2 without difficulty", `2` = "1 without difficulty", `3` = "all with difficulty",
  .applies_to_vars = c("tpflwdiff"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("tphea01", "tphea03", "tphea05", "tphea07", "tphea08", "tphea09", "tphea10", "tphea11", "tphea12", "tphed01", "tphed03", "tphed05", "tphed07", "tphed08", "tphed09", "tphed10", "tphed11", "tphed12", "tpheg01", "tpheg03", "tpheg05", "tpheg07", "tpheg08", "tpheg09", "tpheg10", "tpheg11", "tpheg12", "tphen01", "tphen03", "tphen05", "tphen07", "tphen08", "tphen09", "tphen10", "tphen11", "tphen12"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("tphea02", "tphea04", "tphea06", "tphed02", "tphed04", "tphed06", "tpheg02", "tpheg04", "tpheg06", "tphen02", "tphen04", "tphen06"),
  .applies_to_waves = c("Z", "H", "I")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("tphea02a", "tphea02b", "tphea04a", "tphea04b", "tphea06a", "tphea06b", "tphed02a", "tphed02b", "tphed04a", "tphed04b", "tphed06a", "tphed06b", "tpheg02a", "tpheg02b", "tpheg04a", "tpheg04b", "tpheg06a", "tpheg06b", "tphen02a", "tphen02b", "tphen04a", "tphen04b", "tphen06a", "tphen06b", "tphep02a", "tphep02b", "tphep04a", "tphep04b", "tphep06a", "tphep06b"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpheayn", "tphegyn", "tphenyn"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tphedyn", "tphepyn"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("tphep01", "tphep03", "tphep05", "tphep07", "tphep08", "tphep09", "tphep10", "tphep11", "tphep12"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("tphep02", "tphep04", "tphep06"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "respondent bedridden", `2` = "R in wheelchair", `3` = "R with walking aid", `4` = "not 1, 2 or 3",
  .applies_to_vars = c("tppha1"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "insufficient", `2` = "in between insufficient/sufficient", `3` = "sufficient",
  .applies_to_vars = c("tpsuffic"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-1` = "asked, no answer",
  .applies_to_vars = c("tphosp", "tpmeds", "tppsyc", "tppsyh", "tpstic1"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-1` = "asked, no answer / does not know", `1` = "no, R cannot", `2` = "yes, without difficulty", `3` = "yes, with some difficulty", `4` = "yes, with much difficulty", `5` = "only with help",
  .applies_to_vars = c("tpadl1a", "tpadl2a", "tpadl3a", "tpadl4a", "tpadl5a", "tpadl6a"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `0` = "no difficulties", `1` = "5 without difficulty", `2` = "4 without difficulty", `3` = "3 without difficulty", `4` = "2 without difficulty", `5` = "1 without difficulty", `6` = "all with difficulty",
  .applies_to_vars = c("tpflwd#6"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `0` = "no difficulties", `1` = "2 without difficulty", `2` = "1 without difficulty", `3` = "all with difficulty",
  .applies_to_vars = c("tpflwdiff"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "no", `1` = "yes",
  .applies_to_vars = c("tphed01", "tphed02", "tphed03", "tphed04", "tphed05", "tphed06", "tphed07", "tphed08", "tphed09", "tphed10", "tphed11", "tphed12"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("tphosp", "tpmeds", "tppsyc", "tppsyh", "tpstic1"),
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-1` = "na, asked/does not know",
  .applies_to_vars = c("tphosp", "tpmeds", "tppsyc", "tppsyh", "tpstic1"),
  .applies_to_waves = c("H", "I")
)

value_labels(
  `-2` = "na, see JTPPHA1", `-1` = "asked, no answer / does not know", `1` = "no, R cannot", `2` = "yes, without difficulty", `3` = "yes, with some difficulty", `4` = "yes, with much difficulty", `5` = "only with help",
  .applies_to_vars = c("tpadl1a", "tpadl2a", "tpadl3a", "tpadl4a", "tpadl5a", "tpadl6a"),
  .applies_to_waves = c("J")
)

value_labels(
  `-1` = "na, asked / does not know", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tperh", "tphosp", "tpmeds", "tppsyc", "tppsyh"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTPPHA1", `0` = "no difficulties", `1` = "5 without difficulty", `2` = "4 without difficulty", `3` = "3 without difficulty", `4` = "2 without difficulty", `5` = "1 without difficulty", `6` = "all with difficulty",
  .applies_to_vars = c("tpflwd#6"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTPPHA1", `0` = "no difficulties", `1` = "2 without difficulty", `2` = "1 without difficulty", `3` = "all with difficulty",
  .applies_to_vars = c("tpflwdiff"),
  .applies_to_waves = c("J")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tpstic1"),
  .applies_to_waves = c("J", "K")
)

value_labels(
  `-2` = "na, see KTPPHA1", `-1` = "asked, no answer / does not know", `1` = "no, R cannot", `2` = "yes, without difficulty", `3` = "yes, with some difficulty", `4` = "yes, with much difficulty", `5` = "only with help",
  .applies_to_vars = c("tpadl1a", "tpadl2a", "tpadl3a", "tpadl4a", "tpadl5a", "tpadl6a", "tpadl7a"),
  .applies_to_waves = c("K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("tperh", "tphosp", "tpmeds", "tppsyc", "tppsyh"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTPPHA1", `0` = "no difficulties", `1` = "5 without difficulty", `2` = "4 without difficulty", `3` = "3 without difficulty", `4` = "2 without difficulty", `5` = "1 without difficulty", `6` = "all with difficulty",
  .applies_to_vars = c("tpflwd#6"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTPPHA1", `0` = "no difficulties", `1` = "2 without difficulty", `2` = "1 without difficulty", `3` = "all with difficulty",
  .applies_to_vars = c("tpflwdiff"),
  .applies_to_waves = c("K")
)

.lasa_fc_603 <- .lasa_finalize_fc("603")

