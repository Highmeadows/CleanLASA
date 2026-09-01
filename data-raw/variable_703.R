## LASA filecode 703 -- variable names, variable labels, value labels,
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
  tradl1a = "categorical",
  tradl2a = "categorical",
  tradl3a = "categorical",
  tradl4a = "categorical",
  tradl5a = "categorical",
  tradl6a = "categorical",
  tradl7a = "categorical",
  trerh = "categorical",
  `trflwd#6` = "categorical",
  `trflwd#7` = "categorical",
  trflwdiff = "categorical",
  trhea01 = "categorical",
  trhea02 = "categorical",
  trhea02a = "categorical",
  trhea02b = "categorical",
  trhea03 = "categorical",
  trhea04 = "categorical",
  trhea04a = "categorical",
  trhea04b = "categorical",
  trhea05 = "categorical",
  trhea06 = "categorical",
  trhea06a = "categorical",
  trhea06b = "categorical",
  trhea07 = "categorical",
  trhea08 = "categorical",
  trhea09 = "categorical",
  trhea10 = "categorical",
  trhea11 = "categorical",
  trhea12 = "categorical",
  trheal1 = "categorical",
  trheal2 = "categorical",
  trheayn = "categorical",
  trhed01 = "categorical",
  trhed02 = "categorical",
  trhed02a = "categorical",
  trhed02b = "categorical",
  trhed03 = "categorical",
  trhed04 = "categorical",
  trhed04a = "categorical",
  trhed04b = "categorical",
  trhed05 = "categorical",
  trhed06 = "categorical",
  trhed06a = "categorical",
  trhed06b = "categorical",
  trhed07 = "categorical",
  trhed08 = "categorical",
  trhed09 = "categorical",
  trhed10 = "categorical",
  trhed11 = "categorical",
  trhed12 = "categorical",
  trhedyn = "categorical",
  trheg01 = "categorical",
  trheg02 = "categorical",
  trheg02a = "categorical",
  trheg02b = "categorical",
  trheg03 = "categorical",
  trheg04 = "categorical",
  trheg04a = "categorical",
  trheg04b = "categorical",
  trheg05 = "categorical",
  trheg06 = "categorical",
  trheg06a = "categorical",
  trheg06b = "categorical",
  trheg07 = "categorical",
  trheg08 = "categorical",
  trheg09 = "categorical",
  trheg10 = "categorical",
  trheg11 = "categorical",
  trheg12 = "categorical",
  trhegyn = "categorical",
  trhen01 = "categorical",
  trhen02 = "categorical",
  trhen02a = "categorical",
  trhen02b = "categorical",
  trhen03 = "categorical",
  trhen04 = "categorical",
  trhen04a = "categorical",
  trhen04b = "categorical",
  trhen05 = "categorical",
  trhen06 = "categorical",
  trhen06a = "categorical",
  trhen06b = "categorical",
  trhen07 = "categorical",
  trhen08 = "categorical",
  trhen09 = "categorical",
  trhen10 = "categorical",
  trhen11 = "categorical",
  trhen12 = "categorical",
  trhenyn = "categorical",
  trhep01 = "categorical",
  trhep02 = "categorical",
  trhep02a = "categorical",
  trhep02b = "categorical",
  trhep03 = "categorical",
  trhep04 = "categorical",
  trhep04a = "categorical",
  trhep04b = "categorical",
  trhep05 = "categorical",
  trhep06 = "categorical",
  trhep06a = "categorical",
  trhep06b = "categorical",
  trhep07 = "categorical",
  trhep08 = "categorical",
  trhep09 = "categorical",
  trhep10 = "categorical",
  trhep11 = "categorical",
  trhep12 = "categorical",
  trhepyn = "categorical",
  trhosp = "categorical",
  trmeds = "categorical",
  trpha1 = "categorical",
  trpsyc = "categorical",
  trpsyh = "categorical",
  trstic1 = "categorical",
  trsuffic = "categorical"
)

# define variable labels ----
variable_labels(
  tradl1a = "Stairs: 15 steps without stopping",
  tradl2a = "(Un)dress: self",
  tradl3a = "Chair: sit and rise from",
  tradl4a = "Toenails: cutting own",
  tradl5a = "Walking: 5 min. outside the house",
  tradl6a = "Transport: use of own or public",
  tradl7a = "Take a bath/shower: using aid",
  trerh = "Visited emergency room hospital past 6 months",
  `trflwd#6` = "Functional limitations, with difficulty #6",
  `trflwd#7` = "Functional limitations, with difficulty #7",
  trflwdiff = "Functional limitations, with difficulty #3",
  trhea01 = "Administrative help R: partner",
  trhea02 = "Administrative help R: resident child",
  trhea02a = "Administrative help R: resident child",
  trhea02b = "Administrative help R: resident child-in-law",
  trhea03 = "Administrative help R: resident other",
  trhea04 = "Administrative help R: non-resident child",
  trhea04a = "Administrative help R: non-resident child",
  trhea04b = "Administrative help R: non-resident child-in-law",
  trhea05 = "Administrative help R: non-resident other family",
  trhea06 = "Administrative help R: neighbours/friends/acquaintances",
  trhea06a = "Administrative help R: neighbours",
  trhea06b = "Administrative help R: friends/acquaintances",
  trhea07 = "Administrative help R: volunteers",
  trhea08 = "Administrative help R: district nurse",
  trhea09 = "Administrative help R: professional home care",
  trhea10 = "Administrative help R: private",
  trhea11 = "Administrative help R: personnel home/hospital",
  trhea12 = "Administrative help R: other",
  trheal1 = "Health problems limit normal activities",
  trheal2 = "How long limitations",
  trheayn = "Help R with administration Y/N",
  trhed01 = "Domestic help R: partner",
  trhed02 = "Domestic help R: resident child",
  trhed02a = "Domestic help R: resident child",
  trhed02b = "Domestic help R: resident child-in-law",
  trhed03 = "Domestic help R: resident other",
  trhed04 = "Domestic help R: non-resident child",
  trhed04a = "Domestic help R: non-resident child",
  trhed04b = "Domestic help R: non-resident child-in-law",
  trhed05 = "Domestic help R: non-resident other family",
  trhed06 = "Domestic help R: neighbours/friends/acquaintances",
  trhed06a = "Domestic help R: neighbours",
  trhed06b = "Domestic help R: friends/acquaintances",
  trhed07 = "Domestic help R: volunteers",
  trhed08 = "Domestic help R: district nurse",
  trhed09 = "Domestic help R: professional home care",
  trhed10 = "Domestic help R: private",
  trhed11 = "Domestic help R: personnel home/hospital",
  trhed12 = "Domestic help R: other",
  trhedyn = "Help R with domestic tasks Y/N",
  trheg01 = "Guidance help R: partner",
  trheg02 = "Guidance help R: resident child",
  trheg02a = "Guidance help R: resident child",
  trheg02b = "Guidance help R: resident child-in-law",
  trheg03 = "Guidance help R: resident other",
  trheg04 = "Guidance help R: non-resident child",
  trheg04a = "Guidance help R: non-resident child",
  trheg04b = "Guidance help R: non-resident child-in-law",
  trheg05 = "Guidance help R: non-resident other family",
  trheg06 = "Guidance help R: neighbours/friends/acquaintances",
  trheg06a = "Guidance help R: neighbours",
  trheg06b = "Guidance help R: friends/acquaintances",
  trheg07 = "Guidance help R: volunteers",
  trheg08 = "Guidance help R: district nurse",
  trheg09 = "Guidance help R: professional home care",
  trheg10 = "Guidance help R: private",
  trheg11 = "Guidance help R: personnel home/hospital",
  trheg12 = "Guidance help R: other",
  trhegyn = "Help R with guidance Y/N",
  trhen01 = "Nursing help R: partner",
  trhen02 = "Nursing help R: resident child",
  trhen02a = "Nursing help R: resident child",
  trhen02b = "Nursing help R: resident child-in-law",
  trhen03 = "Nursing help R: resident other",
  trhen04 = "Nursing help R: non-resident child",
  trhen04a = "Nursing help R: non-resident child",
  trhen04b = "Nursing help R: non-resident child-in-law",
  trhen05 = "Nursing help R: non-resident other family",
  trhen06 = "Nursing help R: neighbours/friends/acquaintances",
  trhen06a = "Nursing help R: neighbours",
  trhen06b = "Nursing help R: friends/acquaintances",
  trhen07 = "Nursing help R: volunteers",
  trhen08 = "Nursing help R: district nurse",
  trhen09 = "Nursing help R: professional home care",
  trhen10 = "Nursing help R: private",
  trhen11 = "Nursing help R: personnel home/hospital",
  trhen12 = "Nursing help R: other",
  trhenyn = "Help R with nursing tasks Y/N",
  trhep01 = "Personal help R: partner",
  trhep02 = "Personal help R: resident child",
  trhep02a = "Personal help R: resident child",
  trhep02b = "Personal help R: resident child-in-law",
  trhep03 = "Personal help R: resident other",
  trhep04 = "Personal help R: non-resident child",
  trhep04a = "Personal help R: non-resident child",
  trhep04b = "Personal help R: non-resident child-in-law",
  trhep05 = "Personal help R: non-resident other family",
  trhep06 = "Personal help R: neighbours/friends/acquaintances",
  trhep06a = "Personal help R: neighbours",
  trhep06b = "Personal help R: friends/acquaintances",
  trhep07 = "Personal help R: volunteers",
  trhep08 = "Personal help R: district nurse",
  trhep09 = "Personal help R: professional home care",
  trhep10 = "Personal help R: private",
  trhep11 = "Personal help R: personnel home/hospital",
  trhep12 = "Personal help R: other",
  trhepyn = "Help R with personal care Y/N",
  trhosp = "Hospitalization past 6 months",
  trmeds = "Contact with medical specialist past 6 months",
  trpha1 = "Physical condition respondent",
  trpsyc = "Contact with psychiatrist past 6 months",
  trpsyh = "Psychiatric hospitalization past 6 months",
  trstic1 = "Contact with family physician past 6 months",
  trsuffic = "Respondent gets sufficient help",
  .applies_to_waves = c("Z")
)

variable_labels(
  "tradl1a", "tradl2a", "tradl3a", "tradl4a", "tradl5a", "tradl6a", "trhed01", "trhed03", "trhed05", "trhed07", "trhed08", "trhed09", "trhed10", "trhed11", "trhed12", "trhedyn", "trhep01", "trhep03", "trhep05", "trhep07", "trhep08", "trhep09", "trhep10", "trhep11", "trhep12", "trhepyn", "trhosp", "trpha1", "trpsyh", "trstic1",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "trhed02", "trhed04", "trhed06", "trhep02", "trhep04", "trhep06", "trmeds", "trpsyc",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I")
)

variable_labels(
  "trheal1",
  .applies_to_waves = c("D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  "trhea01", "trhea03", "trhea05", "trhea07", "trhea08", "trhea09", "trhea10", "trhea11", "trhea12", "trheayn", "trheg01", "trheg03", "trheg05", "trheg07", "trheg08", "trheg09", "trheg10", "trheg11", "trheg12", "trhegyn", "trhen01", "trhen03", "trhen05", "trhen07", "trhen08", "trhen09", "trhen10", "trhen11", "trhen12", "trhenyn",
  .applies_to_waves = c("H", "I", "J", "K")
)

variable_labels(
  "trhea02", "trhea04", "trhea06", "trheg02", "trheg04", "trheg06", "trhen02", "trhen04", "trhen06",
  .applies_to_waves = c("H", "I")
)

variable_labels(
  "trerh", "trhea02a", "trhea02b", "trhea04a", "trhea04b", "trhea06a", "trhea06b", "trheal2", "trhed02a", "trhed02b", "trhed04a", "trhed04b", "trhed06a", "trhed06b", "trheg02a", "trheg02b", "trheg04a", "trheg04b", "trheg06a", "trheg06b", "trhen02a", "trhen02b", "trhen04a", "trhen04b", "trhen06a", "trhen06b", "trhep02a", "trhep02b", "trhep04a", "trhep04b", "trhep06a", "trhep06b",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  "tradl7a", "trsuffic",
  .applies_to_waves = c("K")
)

variable_labels(
  `trflwd#6` = "functional limitations, with difficulty #6",
  trflwdiff = "functional limitations, with difficulty #3",
  .applies_to_waves = c("C", "D", "E", "F", "G", "H", "I", "J", "K")
)

variable_labels(
  trmeds = "Contacted medical specialist past 6 months",
  trpsyc = "Contacted psychiatrist past 6 months",
  .applies_to_waves = c("J", "K")
)

variable_labels(
  `trflwd#7` = "functional limitations, with difficulty #7",
  .applies_to_waves = c("K")
)

# define value labels ----
value_labels(
  `-1` = "not available after question asked",
  .applies_to_vars = c("tradl1a", "tradl2a", "tradl3a", "tradl4a", "tradl5a", "tradl6a", "tradl7a", "trhosp", "trmeds", "trpsyc", "trpsyh", "trstic1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-2` = "na, see TRPHA1",
  .applies_to_vars = c("tradl1a", "tradl2a", "tradl3a", "tradl4a", "tradl5a", "tradl6a", "tradl7a", "trflwd#6", "trflwd#7", "trflwdiff"),
  .applies_to_waves = c("Z")
)

value_labels(
  `1` = "no, R cannot", `2` = "yes, without difficulty", `3` = "yes, with some difficulty", `4` = "yes, with much difficulty", `5` = "only with help",
  .applies_to_vars = c("tradl1a", "tradl2a", "tradl3a", "tradl4a", "tradl5a", "tradl6a", "tradl7a"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked / does not know", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trerh"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-1` = "no valid data", `0` = "no difficulties", `1` = "5 without difficulty", `2` = "4 without difficulty", `3` = "3 without difficulty", `4` = "2 without difficulty", `5` = "1 without difficulty", `6` = "all with difficulty",
  .applies_to_vars = c("trflwd#6"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "K")
)

value_labels(
  `-1` = "no valid data", `0` = "no difficulties", `1` = "6 without difficulty", `2` = "5 without difficulty", `3` = "4 without difficulty", `4` = "3 without difficulty", `5` = "2 without difficulty", `6` = "1 without difficulty", `7` = "all with difficulty",
  .applies_to_vars = c("trflwd#7"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-1` = "no valid data", `0` = "no difficulties", `1` = "2 without difficulty", `2` = "1 without difficulty", `3` = "all with difficulty",
  .applies_to_vars = c("trflwdiff"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "K")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("trhea01", "trhea03", "trhea05", "trhea07", "trhea08", "trhea09", "trhea10", "trhea11", "trhea12", "trheg01", "trheg03", "trheg05", "trheg07", "trheg08", "trheg09", "trheg10", "trheg11", "trheg12", "trhen01", "trhen03", "trhen05", "trhen07", "trhen08", "trhen09", "trhen10", "trhen11", "trhen12"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("trhea02", "trhea04", "trhea06", "trheg02", "trheg04", "trheg06", "trhen02", "trhen04", "trhen06"),
  .applies_to_waves = c("Z", "H", "I")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("trhea02a", "trhea02b", "trhea04a", "trhea04b", "trhea06a", "trhea06b", "trhed02a", "trhed02b", "trhed04a", "trhed04b", "trhed06a", "trhed06b", "trheg02a", "trheg02b", "trheg04a", "trheg04b", "trheg06a", "trheg06b", "trhen02a", "trhen02b", "trhen04a", "trhen04b", "trhen06a", "trhen06b", "trhep02a", "trhep02b", "trhep04a", "trhep04b", "trhep06a", "trhep06b"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes, severely", `3` = "yes, slightly", `4` = "R does not know / refused to answer",
  .applies_to_vars = c("trheal1"),
  .applies_to_waves = c("Z", "J", "K")
)

value_labels(
  `-2` = "na, see TRHEAL1", `-1` = "na, asked", `1` = "> 3 months", `2` = "< 3 months", `3` = "R does not know / refused to answer",
  .applies_to_vars = c("trheal2"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trheayn", "trhegyn", "trhenyn"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("trhed01", "trhed03", "trhed05", "trhed07", "trhed08", "trhed09", "trhed10", "trhed11", "trhed12", "trhep01", "trhep03", "trhep05", "trhep07", "trhep08", "trhep09", "trhep10", "trhep11", "trhep12"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `-2` = "no help", `-1` = "na, asked", `0` = "not mentioned", `1` = "mentioned",
  .applies_to_vars = c("trhed02", "trhed04", "trhed06", "trhep02", "trhep04", "trhep06"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I")
)

value_labels(
  `-1` = "na, asked", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trhedyn", "trhepyn"),
  .applies_to_waves = c("Z", "C", "D", "E", "F", "G", "H", "I", "J", "K")
)

value_labels(
  `1` = "no", `2` = "yes",
  .applies_to_vars = c("trhosp", "trmeds", "trpsyc", "trpsyh", "trstic1"),
  .applies_to_waves = c("Z")
)

value_labels(
  `-1` = "na, asked", `1` = "respondent bedridden", `2` = "R in wheelchair", `3` = "R with walking aid", `4` = "not 1, 2 or 3",
  .applies_to_vars = c("trpha1"),
  .applies_to_waves = c("Z", "H", "I", "J", "K")
)

value_labels(
  `-1` = "na, asked", `1` = "insufficient", `2` = "in between insufficient/sufficient", `3` = "sufficient",
  .applies_to_vars = c("trsuffic"),
  .applies_to_waves = c("Z", "K")
)

value_labels(
  `-1` = "asked, no answer", `1` = "no, R cannot", `2` = "yes, without difficulty", `3` = "yes, with some difficulty", `4` = "yes, with much difficulty", `5` = "only with help",
  .applies_to_vars = c("tradl1a", "tradl2a", "tradl3a", "tradl4a", "tradl5a", "tradl6a"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-1` = "asked, no answer", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trhosp", "trmeds", "trpsyc", "trpsyh", "trstic1"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-1` = "na, asked", `1` = "R bedridden", `2` = "R in wheelchair", `3` = "R with walking aid", `4` = "not 1, 2 or 3",
  .applies_to_vars = c("trpha1"),
  .applies_to_waves = c("C", "D", "E", "F", "G")
)

value_labels(
  `-1` = "asked, no answer", `1` = "no", `2` = "yes, severely", `3` = "yes, slightly",
  .applies_to_vars = c("trheal1"),
  .applies_to_waves = c("D", "E", "F", "G", "H", "I")
)

value_labels(
  `-1` = "asked, no answer / does not know", `1` = "no, R cannot", `2` = "yes, without difficulty", `3` = "yes, with some difficulty", `4` = "yes, with much difficulty", `5` = "only with help",
  .applies_to_vars = c("tradl1a", "tradl2a", "tradl3a", "tradl4a", "tradl5a", "tradl6a"),
  .applies_to_waves = c("H", "I", "K")
)

value_labels(
  `-1` = "na, asked / does not know", `1` = "no", `2` = "yes",
  .applies_to_vars = c("trhosp", "trmeds", "trpsyc", "trpsyh", "trstic1"),
  .applies_to_waves = c("H", "I", "J", "K")
)

value_labels(
  `-2` = "na, see JTRPHA1", `-1` = "asked, no answer / does not know", `1` = "no, R cannot", `2` = "yes, without difficulty", `3` = "yes, with some difficulty", `4` = "yes, with much difficulty", `5` = "only with help",
  .applies_to_vars = c("tradl1a", "tradl2a", "tradl3a", "tradl4a", "tradl5a", "tradl6a"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRPHA1", `-1` = "no valid data", `0` = "no difficulties", `1` = "5 without difficulty", `2` = "4 without difficulty", `3` = "3 without difficulty", `4` = "2 without difficulty", `5` = "1 without difficulty", `6` = "all with difficulty",
  .applies_to_vars = c("trflwd#6"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRPHA1", `-1` = "no valid data", `0` = "no difficulties", `1` = "2 without difficulty", `2` = "1 without difficulty", `3` = "all with difficulty",
  .applies_to_vars = c("trflwdiff"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see JTRHEAL1", `-1` = "na, asked", `1` = "> 3 months", `2` = "< 3 months", `3` = "R does not know / refused to answer",
  .applies_to_vars = c("trheal2"),
  .applies_to_waves = c("J")
)

value_labels(
  `-2` = "na, see KTRPHA1",
  .applies_to_vars = c("tradl1a", "tradl2a", "tradl3a", "tradl4a", "tradl5a", "tradl6a", "tradl7a", "trflwd#6", "trflwd#7", "trflwdiff"),
  .applies_to_waves = c("K")
)

value_labels(
  `-1` = "asked, no answer / does not know", `1` = "no, R cannot", `2` = "yes, without difficulty", `3` = "yes, with some difficulty", `4` = "yes, with much difficulty", `5` = "only with help",
  .applies_to_vars = c("tradl7a"),
  .applies_to_waves = c("K")
)

value_labels(
  `-2` = "na, see KTRHEAL1", `-1` = "na, asked", `1` = "> 3 months", `2` = "< 3 months", `3` = "R does not know / refused to answer",
  .applies_to_vars = c("trheal2"),
  .applies_to_waves = c("K")
)

.lasa_fc_703 <- .lasa_finalize_fc("703")

